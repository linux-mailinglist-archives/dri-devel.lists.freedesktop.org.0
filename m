Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37244A02E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF31089CF8;
	Tue,  9 Nov 2021 00:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2E089CC4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:59:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8271C611BF;
 Tue,  9 Nov 2021 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419584;
 bh=h/Qv0gdg233kt+NKGH31/IuhY5AlguPK5AGf8Iou0SY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/ddRoswgyZDPus+YU4L3albyTzs0/o3QvLu2uZO85QfDbbdYoCoVqPHzhftwCldL
 PppIF+Lcbnfqnz8IToHOmCGh4g8Duw8lnAlaXbEjVOVNqcriO3uuzmPoog67boOTVd
 YrbASLDWq/2CFlaq0DuEi9McRH4jjaAyp8yq0xgjDnwz42qVYgGbLmYzi8wo13WG9H
 7C3ANQJSNP3tFHJEZ3ZGeD/db+zj9Yyu6EgoPFFqj+6mATP11V97cm+mjYCm1kzyGz
 ifJx4GGR4SoEvmscfxNzDloqDeFmsiJNc2Kd07Qwr/FGYQD1wojTfVwNyWxtQtkTfU
 IrT5BIhjejDEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 004/146] drm: panel-orientation-quirks: Add quirk
 for the Samsung Galaxy Book 10.6
Date: Mon,  8 Nov 2021 12:42:31 -0500
Message-Id: <20211108174453.1187052-4-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174453.1187052-1-sashal@kernel.org>
References: <20211108174453.1187052-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 88fa1fde918951c175ae5ea0f31efc4bb1736ab9 ]

The Samsung Galaxy Book 10.6 uses a panel which has been mounted
90 degrees rotated. Add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Simon Ser <contact@emersion.fr>
Link: https://patchwork.freedesktop.org/patch/msgid/20210530110428.12994-4-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index cf4db2cdebbbd..926094b83e2f4 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -109,6 +109,12 @@ static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
+	.width = 1280,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Acer One 10 (S1003) */
 		.matches = {
@@ -249,6 +255,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
 		},
 		.driver_data = (void *)&onegx1_pro,
+	}, {	/* Samsung GalaxyBook 10.6 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
+		},
+		.driver_data = (void *)&lcd1280x1920_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.33.0

