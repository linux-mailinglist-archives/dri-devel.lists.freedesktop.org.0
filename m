Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2596A36D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE510E2B9;
	Mon, 27 Feb 2023 02:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECD310E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:05:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AD5560D3E;
 Mon, 27 Feb 2023 02:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E93C433EF;
 Mon, 27 Feb 2023 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463501;
 bh=ol+RR6xPE+dkc3hBAGFUBQD1YnHigd3dvWwaZ86QPEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gc2PNqTuSSf7wc5K2lHgeuG3rWGI/f8U7JaPqvojOSNlCsewe0Klz34hICfogAXb6
 ds118oow/fUZaKhmBqYMikLwCRlAgg9ht64JyNPak9l5kbKBvWiYU3u0FhE3JIxu89
 fQKhcleF2cxKSeR/R9oOdWkmCls1UDJB6SouGXDA11bxchAhzu0YBlfi5F78KUXX79
 Mp7NOkHCSc7g6G86t1J4f/1ddHTqtqv+JqaR9riK06Y1Q6hmZHBxHzq6HKyNyHWlCb
 6bNA47W3aDMh3CZIGQckg6zCWGw440dkhDraINoYbG+u6si4kIliSbJT1fGnuhw9Q5
 tHhcUFmgu8YhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/58] drm: panel-orientation-quirks: Add quirk
 for DynaBook K50
Date: Sun, 26 Feb 2023 21:04:00 -0500
Message-Id: <20230227020457.1048737-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Allen Ballway <ballway@chromium.org>

[ Upstream commit a3caf7ea0c3d5872ed0f2c51f5476aee0c47a73a ]

Like the ASUS T100HAN for which there is already a quirk,
the DynaBook K50 has a 800x1280 portrait screen mounted
in the tablet part of a landscape oriented 2-in-1.
Update the quirk to be more generic and apply to this device.

Signed-off-by: Allen Ballway <ballway@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20221130170811.1.Iee9a494547541dade9eeee9521cc8b811e76a8a0@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/drm_panel_orientation_quirks.c    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 23d63a4d42d9c..b409fe256fd0a 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -30,12 +30,6 @@ struct drm_dmi_panel_orientation_data {
 	int orientation;
 };
 
-static const struct drm_dmi_panel_orientation_data asus_t100ha = {
-	.width = 800,
-	.height = 1280,
-	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
-};
-
 static const struct drm_dmi_panel_orientation_data gpd_micropc = {
 	.width = 720,
 	.height = 1280,
@@ -97,6 +91,12 @@ static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
+	.width = 800,
+	.height = 1280,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_up = {
 	.width = 800,
 	.height = 1280,
@@ -157,7 +157,7 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
 		},
-		.driver_data = (void *)&asus_t100ha,
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* Asus T101HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
@@ -202,6 +202,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Dynabook K50 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "dynabook K50/FR"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.39.0

