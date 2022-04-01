Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0C4EF030
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970E710EDCF;
	Fri,  1 Apr 2022 14:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFFA10EDCF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:33:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B77C561CE6;
 Fri,  1 Apr 2022 14:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623ECC36AE3;
 Fri,  1 Apr 2022 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823590;
 bh=vwcMnsD7Ok9YwEwegpDLQI4p1s8O9QrAaan6MHoLLos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F8+l7vbZt5CrBL/jIv0+p6aMTR+gE/BN63H+N3d8nAeJKUyuhJAbi1M84f/+HJFRA
 JZ0q5KSn+rtT4Y/SOvNUVvfoOTQy7a6YMkuq1b4hjKepZgoC1FvT319mYMG9dkg8x0
 KBeuueT7QQ7khVgQaXW1aLNAmkhVi7hweBMKOuUchyI7zgOfb40mPrtGweV/CDTeee
 3XwKnPfPYtEQaWfF+wshX6/Go4CO4dCH3uqqCIKdkSJyU8uoxegMjvpQWxfEbYPteW
 ITFf92K/0Sobb2skKXq62SR0jAf/WbMYn4qSb+b88MqGz429Kuz2jdaAPbvf+RpkWV
 +H6cvXBF+VyuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 005/109] drm/edid: improve non-desktop quirk
 logging
Date: Fri,  1 Apr 2022 10:31:12 -0400
Message-Id: <20220401143256.1950537-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 Jani Nikula <jani.nikula@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

[ Upstream commit ce99534e978d4a36787dbe5e5c57749d12e6bf4a ]

Improve non-desktop quirk logging if the EDID indicates non-desktop. If
both are set, note about redundant quirk. If there's no quirk but the
EDID indicates non-desktop, don't log non-desktop is set to 0.

Cc: Philipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Philipp Zabel <philipp.zabel@gmail.com>
Tested-by: Philipp Zabel <philipp.zabel@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211228101051.317989-1-jani.nikula@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e8adfa90807c..e42a15e3f2ab 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5331,17 +5331,13 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
-	info->non_desktop = !!(quirks & EDID_QUIRK_NON_DESKTOP);
-
 	drm_get_monitor_range(connector, edid);
 
-	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
-
 	if (edid->revision < 3)
-		return quirks;
+		goto out;
 
 	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
-		return quirks;
+		goto out;
 
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	drm_parse_cea_ext(connector, edid);
@@ -5362,7 +5358,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 
 	/* Only defined for 1.4 with digital displays */
 	if (edid->revision < 4)
-		return quirks;
+		goto out;
 
 	switch (edid->input & DRM_EDID_DIGITAL_DEPTH_MASK) {
 	case DRM_EDID_DIGITAL_DEPTH_6:
@@ -5399,6 +5395,13 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 
 	drm_update_mso(connector, edid);
 
+out:
+	if (quirks & EDID_QUIRK_NON_DESKTOP) {
+		drm_dbg_kms(connector->dev, "Non-desktop display%s\n",
+			    info->non_desktop ? " (redundant quirk)" : "");
+		info->non_desktop = true;
+	}
+
 	return quirks;
 }
 
-- 
2.34.1

