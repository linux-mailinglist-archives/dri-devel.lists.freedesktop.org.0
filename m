Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40760AA5F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B010E70F;
	Mon, 24 Oct 2022 13:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B065110E730
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:32:43 +0000 (UTC)
Received: from dimapc.. (109-252-112-196.nat.spd-mgts.ru [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B44C26602392;
 Mon, 24 Oct 2022 14:32:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666618362;
 bh=u87ew5WStQa1OcE49Cx4+qk9li4JUF1ysNYDmcXZvW8=;
 h=From:To:Cc:Subject:Date:From;
 b=Gfl5BW51TJWaPipe7us0VY0nkPs169wp2yrEQ6roCLJ9fciK0Cl35mQK2rQEAMIm7
 g53nXlsVVwWLTuSjdY4Jxc6Q7tA0VcG1c+3tctEyit+jKgZ8tkbo7ZdQ1DFoMTMk5R
 nUDnk6LNdv0ZmsXrJFaDs9TC0kgR8h1kHQmxl33GJQqcfY6//V+pk2YKhGVQFaDjWH
 85TeW2MQvl6zLyGJltO5TiHMyQV2Ni3cJWrvYBKSWRLH5Vvt5AXE2OxE7lz02IAp9y
 EyZrzyV4UWmkk7rY17smLOy1DO++qHTd7QgoaT4rapJohI/YIT+4h6WDQDJ2UTJngg
 W3traQREgX7Rw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v1] ACPI: video: Fix missing native backlight on Chromebooks
Date: Mon, 24 Oct 2022 16:32:01 +0300
Message-Id: <20221024133201.43753-1-dmitry.osipenko@collabora.com>
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
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chromebooks don't have backlight in ACPI table, they suppose to use
native backlight in this case. Check presence of the CrOS embedded
controller ACPI device and prefer the native backlight if EC found.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Fixes: b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/acpi/video_detect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 0d9064a9804c..8ed5021de6fb 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 	{ },
 };
 
+static bool google_cros_ec_present(void)
+{
+	return acpi_dev_found("GOOG0004");
+}
+
 /*
  * Determine which type of backlight interface to use on this system,
  * First check cmdline, then dmi quirks, then do autodetect.
@@ -730,6 +735,9 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 			return acpi_backlight_video;
 	}
 
+	if (google_cros_ec_present())
+		return acpi_backlight_native;
+
 	/* No ACPI video (old hw), use vendor specific fw methods. */
 	return acpi_backlight_vendor;
 }
-- 
2.37.3

