Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9EC56B5AE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43B510FF36;
	Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074FD10FBE9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D86521D20;
 Fri,  8 Jul 2022 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Kw27SST5IkqNDmyaMELD6Ijve+e3agxxbuGcWV7Ys8=;
 b=U+20K4oAwcDn9UCX/6Nlu8X91JqEUShTbEPW3qCDGy00kIbu+yg5Sr5f9mNlVZELEf+7S4
 6gowbD1Cj/+1T2Zxf8f6VBWdgaWB3hNFgme7EzMIQcspDZFMoy7FfAOG8JKlHGbzxFcBL/
 FrhZvpYWIC4Su/BLsmBsSToblIYp1Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Kw27SST5IkqNDmyaMELD6Ijve+e3agxxbuGcWV7Ys8=;
 b=VMJmIQNFba1WYKyfcCUkX8/YW9xZIxMSrCtUGYOBocYLW5ToGVgfQ6jjCwPyeKa8ISBM85
 xr4yX156P2eSKQAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4513613B24;
 Fri,  8 Jul 2022 09:39:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4DUHEFP7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 03/14] dmr/mgag200: Move ER/EW3 register initializatino to
 per-model code
Date: Fri,  8 Jul 2022 11:39:18 +0200
Message-Id: <20220708093929.4446-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708093929.4446-1-tzimmermann@suse.de>
References: <20220708093929.4446-1-tzimmermann@suse.de>
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

The register initialization code contains special cases for G200ER
and G200EW3 hardware. Move this to per-model code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 9 ++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 6 ------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index acdccc419944..4489b382ebd0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -36,6 +36,8 @@ static void mgag200_g200er_init_registers(struct mga_device *mdev)
 	WREG_DAC(0x90, 0); /* G200ER specific */
 
 	mgag200_init_registers(mdev);
+
+	WREG_ECRT(0x24, 0x5); /* G200ER specific */
 }
 
 /*
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index d86284c0eb4d..a4ecdd3784a3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -6,6 +6,13 @@
 
 #include "mgag200_drv.h"
 
+static void mgag200_g200ew3_init_registers(struct mga_device *mdev)
+{
+	mgag200_g200wb_init_registers(mdev); // same as G200WB
+
+	WREG_ECRT(0x34, 0x5); // G200EW3 specific
+}
+
 /*
  * DRM device
  */
@@ -50,7 +57,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	mgag200_g200wb_init_registers(mdev); // same as G200WB
+	mgag200_g200ew3_init_registers(mdev);
 
 	vram_available = mgag200_g200ew3_device_probe_vram(mdev);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index f9868d728e6d..9bd5d743a87e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -288,12 +288,6 @@ void mgag200_init_registers(struct mga_device *mdev)
 		    MGAREG_CRTC11_VINTCLR);
 	WREG_CRT(0x11, crtc11);
 
-	if (mdev->type == G200_ER)
-		WREG_ECRT(0x24, 0x5);
-
-	if (mdev->type == G200_EW3)
-		WREG_ECRT(0x34, 0x5);
-
 	misc = RREG8(MGA_MISC_IN);
 	misc |= MGAREG_MISC_IOADSEL;
 	WREG8(MGA_MISC_OUT, misc);
-- 
2.36.1

