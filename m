Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC485E6126
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4B10EAE2;
	Thu, 22 Sep 2022 11:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17C410EAD5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:33:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A342219BD;
 Thu, 22 Sep 2022 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663846389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TQvMpeIy7cygWqyqnF1hlTB6kVkyGdVkV1T4Po87npQ=;
 b=yoCkJLCmKv8hjDuBTEAxfYkwO6rYLGOkvlqDKfieQD/MWidBdDOIkYYwaaJ7h8WDuBmMWZ
 LITnul/r2/iXXtdkY5HoAfduyI+T2LSHgeM6m5nRqyEZkLUlhxDqEX0FbkN6ZkR4Ac0XFK
 wC2Ob+za9ideUna+yvUTh439N8PnN5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663846389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TQvMpeIy7cygWqyqnF1hlTB6kVkyGdVkV1T4Po87npQ=;
 b=lnoHL8kIiwZUq//J3yGz5E0Z7C2tvQq9m6s6ry3OE1hQZ5cUlAjIjFI34WZfpzqR7yS3hD
 D+ESSk4MRR3L2sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 081CB13AA5;
 Thu, 22 Sep 2022 11:33:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KAsVAfVHLGPyPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 11:33:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 0/4] drm: Add driver for PowerPC OF displays
Date: Thu, 22 Sep 2022 13:33:02 +0200
Message-Id: <20220922113306.11251-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PowerPC's Open Firmware offers a simple display buffer for graphics
output. Add ofdrm, a DRM driver for the device. As with the existing
simpledrm driver, the graphics hardware is pre-initialized by the
firmware. The driver only provides blitting, no actual DRM modesetting
is possible.

For version 3 of this patchset, all preparatory changes have been
merged into the DRM codebase. Only ofdrm changes are left.

Patch 1 adds ofdrm, which has again been significantly reworked.
The FWFB library has been removed infavor of various functions in
existing DRM helper libraries. Ofdrm now supports damage iterators
and synchronization for imported GEM BOs.

Patches 2 to 4 add support for color management. The code has been
taken from fbdev's offb. I have no hardware available for testing the
functionality. Qemu's stdvga apparently does not support gamma tables
in RGB modes. I verified that the color management code is executed
by running Gnome's night-mode settings, but the display's color tone
does not change.

Thomas Zimmermann (4):
  drm/ofdrm: Add ofdrm for Open Firmware framebuffers
  drm/ofdrm: Add CRTC state
  drm/ofdrm: Add per-model device function
  drm/ofdrm: Support color management

 MAINTAINERS                   |    1 +
 drivers/gpu/drm/tiny/Kconfig  |   13 +
 drivers/gpu/drm/tiny/Makefile |    1 +
 drivers/gpu/drm/tiny/ofdrm.c  | 1351 +++++++++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig   |    1 +
 5 files changed, 1367 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c


base-commit: a7d5d07d5ac5ac58ec81932b3f732e3127d17af9
-- 
2.37.3

