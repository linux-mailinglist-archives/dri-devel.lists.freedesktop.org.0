Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C16A086A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2E310EB3F;
	Thu, 23 Feb 2023 12:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F5E10EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73EA237B07;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EHHFjUxzkBGxJsEqBPYHvbOcBabEXEuVYhpLaAG5X0c=;
 b=hY6Q4/4nKfXg5/ZRAUuNpMFW2n3DvyUS2wW3s28ufAJC4nzP4RPrFEAfCi9IyJ/P+maSim
 vyjGi99uP2m0bKwJf/jnCIWycwAMeMxtclCaKTTm5lZggh+M/iItVedrwSNfcg41Ll4Sh5
 jTKFP9N6TWdEUH/jM7hGjlsKrv3bkQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EHHFjUxzkBGxJsEqBPYHvbOcBabEXEuVYhpLaAG5X0c=;
 b=T8XMd0PSCrj8RYCb1q4z/wN4gjoazLZ4vkRlpy2+HoUvX4uo8yK68ZiqDKtgjJ5lhSNIDj
 TSFvWWGkh1hxbYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5166C13928;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RYXZEmJZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 0/7] drm/gma500: Convert fbdev to DRM client
Date: Thu, 23 Feb 2023 13:17:26 +0100
Message-Id: <20230223121733.12549-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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

Convert gma500's fbdev code to drm_client. Replace to the current
ad-hoc integration. The conversion includes a number of cleanups.
Only build fbdev support if the config option has been set.

Tested on Cedarview HW.

Thomas Zimmermann (7):
  drm/gma500: Remove unnecessary include statements
  drm/gma500: Move fbdev code into separate source file
  drm/gma500: Remove fbdev vma open and close callbacks
  drm/gma500: Fix naming in fb_ops.
  drm/gma500: Inline psbfb_create() into psbfb_probe()
  drm/gma500: Implement client-based fbdev emulation
  drm/gma500: Pass fb_info to psb_fbdev_vm_fault()

 drivers/gpu/drm/gma500/Makefile      |   1 +
 drivers/gpu/drm/gma500/fbdev.c       | 344 +++++++++++++++++++++++++++
 drivers/gpu/drm/gma500/framebuffer.c | 336 +-------------------------
 drivers/gpu/drm/gma500/psb_drv.c     |   5 +-
 drivers/gpu/drm/gma500/psb_drv.h     |  17 +-
 5 files changed, 363 insertions(+), 340 deletions(-)
 create mode 100644 drivers/gpu/drm/gma500/fbdev.c

-- 
2.39.2

