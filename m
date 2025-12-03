Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCAAC9E661
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EDB10E774;
	Wed,  3 Dec 2025 09:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A/2HXZm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ABE10E025
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=geAmDXMRqhQ+gdMoGprBaCwF+ySmBL0jg60roBzAD8k=; b=A/2HXZm6FklqUnfV8p7qsOdqvM
 q0dKMKgzd0+hbaCyjA+/mJ13DCqjO1Vym3Va863LvqkW/iDTUpajFXZcKEDoxD8D27r0ktpAkENSl
 axO4gAOA9W/vgzSHe5ozS4vDFi4DdElQjL+KiVjOYuFKMSDXdpdSNTonlE0GdApUnoqa3CfVz41dS
 r+Aj6XngzeuT66efx0DooPs1EgVswgDo0D45Hr4Te2I64YvVPhWlCkCoTyipp/Eh2uFW9dWCn4473
 P0NqDY2DKbhEF/Vc+J6Qh+ITyDQbSzZ9I7KmR+b1HG1A+uVtoGpNWJJy36AloyPVV/e6W7VnSStdv
 oOomr1oQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQipL-008Bpf-At; Wed, 03 Dec 2025 10:07:11 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v2 3/4] efi: sysfb_efi: Convert swap width and height quirk to
 a callback
Date: Wed,  3 Dec 2025 09:07:05 +0000
Message-ID: <20251203090706.53778-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/firmware/efi/sysfb_efi.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 14b61414c33a..eacf9a50eab2 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -231,6 +231,16 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
 	{},
 };
 
+static int __init efifb_swap_width_height(const struct dmi_system_id *id)
+{
+	swap(screen_info.lfb_width, screen_info.lfb_height);
+	screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
+				     screen_info.lfb_width /
+				     BITS_PER_BYTE;
+
+	return 1;
+}
+
 /*
  * Some devices have a portrait LCD but advertise a landscape resolution (and
  * pitch). We simply swap width and height for these devices so that we can
@@ -248,6 +258,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10ICR"),
 			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "1HCN44WW"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo MIIX 320-10ICR with 800x1280 portrait screen */
@@ -256,6 +267,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"Lenovo MIIX 320-10ICR"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo D330 with 800x1280 or 1200x1920 portrait screen */
@@ -264,6 +276,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"Lenovo ideapad D330-10IGM"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo IdeaPad Duet 3 10IGL5 with 1200x1920 portrait screen */
@@ -272,6 +285,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
 					"IdeaPad Duet 3 10IGL5"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{
 		/* Lenovo Yoga Book X91F / X91L */
@@ -280,6 +294,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			/* Non exact match to match F + L versions */
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
 		},
+		.callback = efifb_swap_width_height,
 	},
 	{},
 };
@@ -355,13 +370,8 @@ __init void sysfb_apply_efi_quirks(void)
 	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
 		dmi_check_system(efifb_dmi_system_table);
 
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
-	    dmi_check_system(efifb_dmi_swap_width_height)) {
-		swap(screen_info.lfb_width, screen_info.lfb_height);
-		screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
-					     screen_info.lfb_width /
-					     BITS_PER_BYTE;
-	}
+	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI)
+		dmi_check_system(efifb_dmi_swap_width_height);
 }
 
 __init void sysfb_set_efifb_fwnode(struct platform_device *pd)
-- 
2.51.1

