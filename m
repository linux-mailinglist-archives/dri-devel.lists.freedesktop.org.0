Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2BC9E664
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86E10E7CE;
	Wed,  3 Dec 2025 09:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eqZAHX7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E0C10E0F3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fx4iW5+Dm7Xxcs5SApQwNhiLyazg89iXLTgBSKrtqtU=; b=eqZAHX7LD61OBKP5V4mhvi4wt/
 IQnHkt5KPE8TjwveqpXIQGhBmXPfpe7Y8HRiRfn0yPOXVWjE80q9TBlCoR4v2PpU5gF4rlSjHM6UO
 4cWbmLJLY0kanZnv5xFIGLaarzY04qDays5rU86/pn3JW5L0VtM90zqCqXWwAT3abHfcb3fHCwmHi
 nde6AIhN4pyueQRi8nIiipsK14AB3waREOFEZqxjdEx8fVsUI0A8ubU3A5g8Arz5G13gRMFMFEAog
 E9or84bWfXa2y26vf2DFzC6hRb3bY7hbHnXxtQDFOSkOBMsREuhT3Ui6cVLnyaaDWj52rk2JXPzJB
 i8WcpnKQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQipM-008Bpj-18; Wed, 03 Dec 2025 10:07:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v2 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve
 Steam Deck
Date: Wed,  3 Dec 2025 09:07:06 +0000
Message-ID: <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
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

Valve Steam Deck has a 800x1280 portrait screen installed in a landscape
orientation. The firmware offers a software rotated 1280x800 mode which
GRUB can be made to switch to when displaying a boot menu. If this mode
was selected frame buffer drivers will see this fake mode and fbcon
rendering will be corrupted.

Lets therefore add a selective quirk inside the current "swap with and
height" handling, which will detect this exact mode and fix it up back to
the native one.

This will allow the DRM based frame buffer drivers to detect the correct
mode and, apply the existing panel orientation quirk, and render the
console in landscape mode with no corruption.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-efi@vger.kernel.org
---
 drivers/firmware/efi/sysfb_efi.c | 56 +++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index eacf9a50eab2..566492e67798 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -231,16 +231,42 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
 	{},
 };
 
+struct efifb_mode_fixup {
+	unsigned int width;
+	unsigned int height;
+	unsigned int linelength;
+};
+
 static int __init efifb_swap_width_height(const struct dmi_system_id *id)
 {
-	swap(screen_info.lfb_width, screen_info.lfb_height);
-	screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
-				     screen_info.lfb_width /
-				     BITS_PER_BYTE;
+	const struct efifb_mode_fixup *data = id->driver_data;
 
-	return 1;
+	if (!data ||
+	    (data->width == screen_info.lfb_width &&
+	     data->height == screen_info.lfb_height)) {
+		swap(screen_info.lfb_width, screen_info.lfb_height);
+
+		if (data && data->linelength) {
+			screen_info.lfb_linelength = data->linelength;
+			screen_info.lfb_size = data->linelength * data->width;
+		} else {
+			screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
+						     screen_info.lfb_width /
+						     BITS_PER_BYTE;
+		}
+
+		return 1;
+	}
+
+	return 0;
 }
 
+static const struct efifb_mode_fixup efifb_steamdeck_mode_fixup = {
+	.width = 1280,
+	.height = 800,
+	.linelength = 3328,
+};
+
 /*
  * Some devices have a portrait LCD but advertise a landscape resolution (and
  * pitch). We simply swap width and height for these devices so that we can
@@ -296,6 +322,26 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 		},
 		.callback = efifb_swap_width_height,
 	},
+	{
+		/* Valve Steam Deck (Jupiter) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.callback = efifb_swap_width_height,
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
+	{
+		/* Valve Steam Deck (Galileo) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.callback = efifb_swap_width_height,
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
 	{},
 };
 
-- 
2.51.1

