Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA9C9E83D
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D06310E770;
	Wed,  3 Dec 2025 09:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k1S90vFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2409110E353
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JnS7zJRU5hs0Ga8wtZ4i1P265SphC/Igkc2CF/pMUqI=; b=k1S90vFdaajyNiFVEnunmF/P9V
 7F+OKKUsl0ngJdpZOxfGVQw/AjGDZqewgYXxNToxIfuQs066T39ntvwfo6pmgpwiKUbSkgk+S5/fa
 OSnXplhM610O/dTr/+0e49SJAbv3eodf9FD4A+6sZz1YSCyAicc4BS+eDi+Pq+NDTerbwL98IEkHG
 4hzdYq5UsHeQcsHjmsRxY1jVBt5feOVhgIKyYJVJnCM/6qjaVaB7gQtvpdmvtMNLlUC40BzRdfDCy
 a7t28fWWhIdWkf39cpDl7mjlB6/9xASojyr3AnbPm1P2b1CCWRWuBipMkcMfduKfFtldGFNj1eblj
 xaPvxIUA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQjL5-008CWC-Cc; Wed, 03 Dec 2025 10:39:59 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v3 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve
 Steam Deck
Date: Wed,  3 Dec 2025 09:39:48 +0000
Message-ID: <20251203093948.54296-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203093948.54296-1-tvrtko.ursulin@igalia.com>
References: <20251203093948.54296-1-tvrtko.ursulin@igalia.com>
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
 drivers/firmware/efi/sysfb_efi.c | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index eacf9a50eab2..d69330b4e09c 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -241,6 +241,33 @@ static int __init efifb_swap_width_height(const struct dmi_system_id *id)
 	return 1;
 }
 
+struct efifb_mode_fixup {
+	unsigned int width;
+	unsigned int height;
+	unsigned int linelength;
+};
+
+static int __init
+efifb_check_and_swap_width_height(const struct dmi_system_id *id)
+{
+	const struct efifb_mode_fixup *data = id->driver_data;
+
+	if (data->width == screen_info.lfb_width &&
+	    data->height == screen_info.lfb_height) {
+		swap(screen_info.lfb_width, screen_info.lfb_height);
+		screen_info.lfb_linelength = data->linelength;
+		screen_info.lfb_size = data->linelength * data->width;
+	}
+
+	return 1;
+}
+
+static const struct efifb_mode_fixup efifb_steamdeck_mode_fixup __initconst = {
+	.width = 1280,
+	.height = 800,
+	.linelength = 3328,
+};
+
 /*
  * Some devices have a portrait LCD but advertise a landscape resolution (and
  * pitch). We simply swap width and height for these devices so that we can
@@ -296,6 +323,26 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
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
+		.callback = efifb_check_and_swap_width_height,
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
+	{
+		/* Valve Steam Deck (Galileo) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.callback = efifb_check_and_swap_width_height,
+		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
+	},
 	{},
 };
 
-- 
2.51.1

