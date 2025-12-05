Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E8CA8371
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FBF10EB53;
	Fri,  5 Dec 2025 15:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ikp3s7Io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B91E10E080
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hIzoiYqcY1uuKYMGrsMeBmeKddLC2dlOv2PXltu+6uA=; b=ikp3s7IoBH1ASNG8rpBQBPV0i3
 v0m15VBZB8fW9Ht9JzGRU10d/MZEUzeIMfSGPYR4OdQJmFxqpMMPfg4WTEZcIPKMpeBmBZSYQdBgD
 R65wekrxXm7NfK6sShtW17g4HRm005Kv4U3hNfTzzIY67feYdMf36uIEV4qiartG+wg/Sr6/GsV5k
 LlBagtiD4WSnxyTTT21NQyfLCX1kEPxSh5VwM/oA34fTz+FiqYXTpW5eWCNO823zQObjj5JSZzjix
 L5w4GskeCnkjhl9UbO45vADUf5soHmRWwjcfeHuGu64b0BRtYPYUveyE9s2xDAZYmaU1LYSwtTP1I
 4wm3Ehmg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vRXr0-00980K-AT; Fri, 05 Dec 2025 16:36:18 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v4 3/4] efi: sysfb_efi: Convert swap width and height quirk to
 a callback
Date: Fri,  5 Dec 2025 15:36:10 +0000
Message-ID: <20251205153611.93297-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
References: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the swapping of width and height quirk to a callback.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-efi@vger.kernel.org
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Melissa Wen <mwen@igalia.com> # v3
---
 drivers/firmware/efi/sysfb_efi.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 997bbd2a2f33..5c54f42d5fef 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -231,6 +231,17 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
 	{},
 };
 
+static int __init efifb_swap_width_height(const struct dmi_system_id *id)
+{
+	u32 lfb_depth = __screen_info_lfb_bits_per_pixel(&screen_info);
+
+	swap(screen_info.lfb_width, screen_info.lfb_height);
+	screen_info.lfb_linelength = lfb_depth * screen_info.lfb_width /
+				     BITS_PER_BYTE;
+
+	return 1;
+}
+
 /*
  * Some devices have a portrait LCD but advertise a landscape resolution (and
  * pitch). We simply swap width and height for these devices so that we can
@@ -248,6 +259,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10ICR"),
 			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "1HCN44WW"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo MIIX 320-10ICR with 800x1280 portrait screen */
@@ -256,6 +268,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"Lenovo MIIX 320-10ICR"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo D330 with 800x1280 or 1200x1920 portrait screen */
@@ -264,6 +277,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"Lenovo ideapad D330-10IGM"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo IdeaPad Duet 3 10IGL5 with 1200x1920 portrait screen */
@@ -272,6 +286,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"IdeaPad Duet 3 10IGL5"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo Yoga Book X91F / X91L */
@@ -280,6 +295,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			/* Non exact match to match F + L versions */
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{},
 };
@@ -355,14 +371,8 @@ __init void sysfb_apply_efi_quirks(void)
 	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
 		dmi_check_system(efifb_dmi_system_table);
 
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
-	    dmi_check_system(efifb_dmi_swap_width_height)) {
-		u32 lfb_depth = __screen_info_lfb_bits_per_pixel(&screen_info);
-
-		swap(screen_info.lfb_width, screen_info.lfb_height);
-		screen_info.lfb_linelength = lfb_depth * screen_info.lfb_width /
-					     BITS_PER_BYTE;
-	}
+	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI)
+		dmi_check_system(efifb_dmi_swap_width_height);
 }
 
 __init void sysfb_set_efifb_fwnode(struct platform_device *pd)
-- 
2.51.1

