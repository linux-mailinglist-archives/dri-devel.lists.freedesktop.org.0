Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E841C523C79
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C98112940;
	Wed, 11 May 2022 18:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E9112940
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:31:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 345752188D;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652293887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aRXkvriYkDmcOwmccuHtobliYDPz3gshi7+NiqYHkEE=;
 b=YJFZeEuxmgTgGZqAY+XMgT/RtdEoqmfh/t2Muv94G99tR2zqWDPWXfTcvH5EywLXGNO2kR
 p6ZD9AgXGugUagB0W5+/nEGAS1BsMwKNVolwFNsGlYboC/E+oLEcnSwocX6AylqRTBZdd6
 lPX95A3QTWqaAyebm6WiP9FWlvB+dHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652293887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aRXkvriYkDmcOwmccuHtobliYDPz3gshi7+NiqYHkEE=;
 b=tuH0/RcGgSlM7dUcWRUvC5o/WSLWctRiipS75JfQMqvEwkzQgIw0+B7CWk5yYOCwhjPjyY
 F217RkIbK7yvz4BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A71F13A76;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FZyZAf8AfGIbeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 18:31:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/client: Fix display-mode selection
Date: Wed, 11 May 2022 20:31:22 +0200
Message-Id: <20220511183125.14294-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pick user-defined display mode in DRM clients if the mode has been
validated by the driver. Otherwise pick a preferred display mode.

Booting the kernel with video=<mode> and giving an unsupported display
mode can easily turn the display unusable. This is best tested by
booting simpledrm with a display mode that does not use the firmware
framebuffer's resolution. While simpledrm filter's out the mode as
invalid, the DRM client still picks it and the console won't show up.

Several factors contribute to this problem.

 * The connector invalidates the user-defined display mode, but never
   tells the user about it.
 * The DRM client doesn't look for user-defined display modes, but for
   modes that are similar.
 * If no similar mode can be found, the client adds the invalid display
   mode back to the connector's mode list for use.

Each of the patches in this patchset addresses one of these problems.
Overall the DRM client has no business in display-mode detection and
should only pick one of the modes that has been detected and validated 
by the connector.

Thomas Zimmermann (3):
  drm: Always warn if user-defined modes are not supported
  drm/client: Look for command-line modes first
  drm/client: Don't add new command-line mode

 drivers/gpu/drm/drm_client_modeset.c | 28 ++++++++++++++++------------
 drivers/gpu/drm/drm_modes.c          |  4 ++++
 2 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.36.0

