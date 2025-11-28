Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2CC9264C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 16:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ED910E88A;
	Fri, 28 Nov 2025 15:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TlQs/hv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305F810E8DA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zlaiiMP7Sevijtkm4t7qoCJJmgwp+164Kl80ZMjHygU=; b=TlQs/hv6tiALdS8Sdp/RojDZL/
 PmfZi9lf2TCsC6kJbHR1ZjzTTu+Ua+xqLyVOAqEKMtygmCMe7no0+1s3YPIzKwvrYCTj7HiDz6HX8
 UbT7x11RGBbu/9WqiZUWzBR3KpwjfPSJ7xYqadCntU+6R+qMQ7kyGVMVNadgXMNO8ltCsdns3Nh7Z
 rmkixu9zlRT9I25prEjcVWZZ9JFNneaEUrnTa9Ek+BFkeAONqPN4RSGRTWBIIBLY/mEf3e6/vJEuJ
 rtQDwx85QiP8LfAcGbB8OZhg3n4nnUGKOa6AUZALBGkjrmv6Po4C9TEeKwTurHbLjidWfkov0cMsR
 lpkADJJQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vP012-006Ufe-Nt; Fri, 28 Nov 2025 16:04:08 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-efi@vger.kernel.org
Subject: [RFX] efi: sysfb_efi: Fix simpledrmfb on Steam Deck
Date: Fri, 28 Nov 2025 15:04:03 +0000
Message-ID: <20251128150403.11567-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I am not sure how is simpledrmfb on top of EFI supposed to work, but at
least at the moment it appears there is a missing link in the "discovery"
of frame buffer parameters.

What I can see is that EFI GOP reads some parameters from the firmware and
infers the other, such as in this case problematic pitch, or stride.

One could be easily excused in thinking that pitch cannot be reliably
inferred, since different display hardware has differing alignment
requirements, so it is unclear how is hardware agnostic solution supposed
to work.

In the specific case of the Steam Deck hardware we have a 800x1280 native
panel which is also installed rotated 90 degrees counter clockwise.

Firmware appears to set up the pitch as 3328, while GOP assumes 3200,
based of a width * bpp calculation.

When this incorrect pitch propagates through (rather complicated) fbcon
and DRM call paths, the end result is corrupted rendering all until the
amdgpu takes over the fbdev.

Simplistic solution in this patch is to add a DMI quirk to the EFI
frame buffer setup code.

Apart from the incorrect pitch, the quirk also does the swapping of the
width and height. Apart from setting the correct fbcon dimensions this
one also allows the quirk from drm_get_panel_orientation_quirk() to
report the correct orientation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-efi@vger.kernel.org
---
 drivers/firmware/efi/sysfb_efi.c | 48 ++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 1e509595ac03..84d9049bb2cb 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -231,6 +231,18 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
 	{},
 };
 
+struct efifb_mode_fixup {
+	unsigned int width;
+	unsigned int height;
+	unsigned int pitch;
+};
+
+static const struct efifb_mode_fixup efifb_steamdeck_mode_fixup = {
+	.width = 1280,
+	.height = 800,
+	.pitch = 3328,
+};
+
 /*
  * Some devices have a portrait LCD but advertise a landscape resolution (and
  * pitch). We simply swap width and height for these devices so that we can
@@ -281,6 +293,24 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
 		},
 	},
+	{
+		/* Valve Steam Deck (Jupiter) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
+	{
+		/* Valve Steam Deck (Galileo) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
 	{},
 };
 
@@ -351,17 +381,31 @@ static struct fwnode_handle efifb_fwnode;
 
 __init void sysfb_apply_efi_quirks(void)
 {
+	const struct dmi_system_id *match;
+
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
 	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
 		dmi_check_system(efifb_dmi_system_table);
 
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
-	    dmi_check_system(efifb_dmi_swap_width_height)) {
+	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
+		return;
+
+	for (match = dmi_first_match(efifb_dmi_swap_width_height);
+	     match;
+	     match = dmi_first_match(match + 1)) {
+		const struct efifb_mode_fixup *data = match->driver_data;
 		u16 temp = screen_info.lfb_width;
 
 		screen_info.lfb_width = screen_info.lfb_height;
 		screen_info.lfb_height = temp;
 		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
+
+		if (data && data->pitch &&
+		   data->width == screen_info.lfb_height &&
+		   data->height == screen_info.lfb_width) {
+			screen_info.lfb_linelength = data->pitch;
+			screen_info.lfb_size = data->pitch * data->width;
+		}
 	}
 }
 
-- 
2.51.1

