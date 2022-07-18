Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB82577EA6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA93CAE5A3;
	Mon, 18 Jul 2022 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EFC1124FE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D52A20D3A;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBH5P2WHCc0a57HGeAt9CRN5rA8on4ZovEjJmibngKg=;
 b=SWA1FCbFRG1fuO+FCBg/gm05IAngMpNOzSYV1wK06uUjoAMWDL2592V25DwJytU+PnBAnL
 C170/bQXbGqKdjY7GEjgnoK0t7e1NseF8JoLNNc3ZAqdNcRGrmCEUHg97bg06q1rHSbtt7
 /n3qzt0R//rOZhkUeMUVulnv7dVLGa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBH5P2WHCc0a57HGeAt9CRN5rA8on4ZovEjJmibngKg=;
 b=mS8lpHMH2J8A6Gw3aRSGChlggclNcJvl0AIn6rtcMZvVWhuSlNJ3HLpw3z6rLK3Vs+gE9r
 j2SYit5ysq4q77AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6781C13AB4;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0KJlGJsn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 03/14] dmr/mgag200: Move ER/EW3 register initializatino to
 per-model code
Date: Mon, 18 Jul 2022 11:27:42 +0200
Message-Id: <20220718092753.9598-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 9 ++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 6 ------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 7bee20459ab6..8ff050906e1c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -27,6 +27,8 @@ static void mgag200_g200er_init_registers(struct mga_device *mdev)
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

