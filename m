Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC9371A3E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185356E972;
	Mon,  3 May 2021 16:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A466E972
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:38:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA6626054E;
 Mon,  3 May 2021 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059911;
 bh=GECd6ZWGOLxXk6I6RpW1NsCGUbeOBhdBjmOBiu+231s=;
 h=From:To:Cc:Subject:Date:From;
 b=pzq+/YrTkQXG4EHH+/seJkbOE8ln0XASdtj5ClOUjv6woXX/a00VjVrcGOTJI+0j1
 XlUeSymNYh0fjheEbSsBO5BfplEc94MLqK1tAzizEffYPYEzjTt9BBmn/hqgi84YG9
 Ou9NAmiuk3dk1tIhvYbDWaO1wlJLcyZp2/FRsrUs7bZj66HOw0yjqtyaHLWNLV4Iu1
 NCJHojBRUNoRKByPSfE7KhwORDIRyW70bmexhMSVvDK+6DF121yPehjLNLtrNUKckj
 f+NsbTY26qtpnsmVjNr5Lk48krhZb8fYiuL9oobJeyZAnxtERCrQffEKB+EnBKPvga
 EJOxHUZIqvHUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 001/100] drm: Added orientation quirk for OneGX1
 Pro
Date: Mon,  3 May 2021 12:36:50 -0400
Message-Id: <20210503163829.2852775-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 dri-devel@lists.freedesktop.org, Jared Baldridge <jrb@expunge.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jared Baldridge <jrb@expunge.us>

[ Upstream commit 81ad7f9f78e4ff80e95be8282423f511b84f1166 ]

The OneGX1 Pro has a fairly unique combination of generic strings,
but we additionally match on the BIOS date just to be safe.

Signed-off-by: Jared Baldridge <jrb@expunge.us>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/41288ccb-1012-486b-81c1-a24c31850c91@www.fastmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 58f5dc2f6dd5..f6bdec7fa925 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -84,6 +84,13 @@ static const struct drm_dmi_panel_orientation_data itworks_tw891 = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data onegx1_pro = {
+	.width = 1200,
+	.height = 1920,
+	.bios_dates = (const char * const []){ "12/17/2020", NULL },
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
 	.width = 720,
 	.height = 1280,
@@ -211,6 +218,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* OneGX1 Pro */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SYSTEM_PRODUCT_NAME"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
+		},
+		.driver_data = (void *)&onegx1_pro,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
