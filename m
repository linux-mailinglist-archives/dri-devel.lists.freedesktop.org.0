Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848186B7BB5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC7610E571;
	Mon, 13 Mar 2023 15:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5387B10E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:16:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C120D1FE09;
 Mon, 13 Mar 2023 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ujbN2OxeiRGajjuZ/DkZQXavJhrws2cEdDWvWeuhF8k=;
 b=Lw7sZ4bFA9dyCx7nliGplrHg61DLZen69HX2WIBAZMuELaWi/Kevqm2KPDZFnioWnrYFae
 lt1eYtf0Mazll84XxkcSczrXuCun2mYyvSi0Z4UUAWp8LWDGl7z2eR30ywb2dz+ZQ69kwF
 7Dy06BddNHFFqwwcm+ONc0hqbGOCXCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ujbN2OxeiRGajjuZ/DkZQXavJhrws2cEdDWvWeuhF8k=;
 b=SyVTnEqbYsD/MFPnHjCax9S8Ql3fdIRYmWarRDC/SA3366yTH70L9tRz/Yjnp5sB2sxQI0
 R3rygL0HgrYTnzAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9ACFB13582;
 Mon, 13 Mar 2023 15:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9VroJDs+D2Q5ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:16:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 0/7] drm/gma500: Convert fbdev to DRM client
Date: Mon, 13 Mar 2023 16:16:03 +0100
Message-Id: <20230313151610.14367-1-tzimmermann@suse.de>
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

v2:
	* remove fb_base (Patrik)
	* use 'static inline' in header files (kernel test robot)
	* fix many minor issues and typos

Thomas Zimmermann (7):
  drm/gma500: Remove unnecessary include statements
  drm/gma500: Move fbdev code into separate source file
  drm/gma500: Remove fbdev vma open and close callbacks
  drm/gma500: Fix naming in fb_ops
  drm/gma500: Inline psbfb_create() into psbfb_probe()
  drm/gma500: Implement client-based fbdev emulation
  drm/gma500: Pass fb_info to psb_fbdev_vm_fault()

 drivers/gpu/drm/gma500/Makefile      |   1 +
 drivers/gpu/drm/gma500/fbdev.c       | 344 +++++++++++++++++++++++++++
 drivers/gpu/drm/gma500/framebuffer.c | 341 +-------------------------
 drivers/gpu/drm/gma500/psb_drv.c     |   5 +-
 drivers/gpu/drm/gma500/psb_drv.h     |  19 +-
 5 files changed, 363 insertions(+), 347 deletions(-)
 create mode 100644 drivers/gpu/drm/gma500/fbdev.c


base-commit: b21ced77ae1dbc3d8b01d3aef3c99bba7377a69b
-- 
2.39.2

