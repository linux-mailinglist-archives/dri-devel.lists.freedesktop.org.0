Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350E64FF81
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792110E1D3;
	Sun, 18 Dec 2022 16:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64C10E1D4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 16:03:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F7AE60DCF;
 Sun, 18 Dec 2022 16:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8329DC433F2;
 Sun, 18 Dec 2022 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379370;
 bh=FgkbxNBjbqEgSLmU0OPf3Y85XtaLIngNOmgqAftktAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qWHIs2aZj1ZgJtnhdKZf+TJg3YVBP4Z6umYoBokOTc5zer/rebTKhM7gQ/T7L5j+b
 E4FR2lRTM5VqST44dmaPWKsuDuiaNPg9K5jU2HpfOa5LdyKSO3HpwOgDU5srkh0MyL
 CkzaHanl10F43s5Lb6yCXUMgm93X8WK7cHHsNUvmPSlDVmZ3iBSirU+2nFEWXw+8CL
 1Exn8a8GqptRWjitbl8NjhCaDmj2Mc0tBh0F+qoGymEKcrcxQ6J/AR4uTwkhRPb/vL
 ZZtGEWsRfTHcs3Vp5wgbDfDL6COWsCj8KostyDWq1hV/DEV3ZEkU4L9NScLFmcgg74
 8rfyquv5sAuhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 14/85] drm/edid: add a quirk for two LG monitors
 to get them to work on 10bpc
Date: Sun, 18 Dec 2022 11:00:31 -0500
Message-Id: <20221218160142.925394-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Roman Li <roman.li@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 tzimmermann@suse.de, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hamza Mahfooz <hamza.mahfooz@amd.com>

[ Upstream commit aa193f7eff8ff753577351140b8af13b76cdc7c2 ]

The LG 27GP950 and LG 27GN950 have visible display corruption when
trying to use 10bpc modes. So, to fix this, cap their maximum DSC
target bitrate to 15bpp.

Suggested-by: Roman Li <roman.li@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c  | 12 ++++++++++++
 include/drm/drm_connector.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4005dab6147d..b36abfa91581 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -87,6 +87,8 @@ static int oui(u8 first, u8 second, u8 third)
 #define EDID_QUIRK_FORCE_10BPC			(1 << 11)
 /* Non desktop display (i.e. HMD) */
 #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
+/* Cap the DSC target bitrate to 15bpp */
+#define EDID_QUIRK_CAP_DSC_15BPP		(1 << 13)
 
 #define MICROSOFT_IEEE_OUI	0xca125c
 
@@ -147,6 +149,12 @@ static const struct edid_quirk {
 	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
 				       EDID_QUIRK_DETAILED_IN_CM),
 
+	/* LG 27GP950 */
+	EDID_QUIRK('G', 'S', 'M', 0x5bbf, EDID_QUIRK_CAP_DSC_15BPP),
+
+	/* LG 27GN950 */
+	EDID_QUIRK('G', 'S', 'M', 0x5b9a, EDID_QUIRK_CAP_DSC_15BPP),
+
 	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
 	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
 
@@ -6166,6 +6174,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
+	info->max_dsc_bpp = 0;
 }
 
 static u32 update_display_info(struct drm_connector *connector,
@@ -6252,6 +6261,9 @@ static u32 update_display_info(struct drm_connector *connector,
 		info->non_desktop = true;
 	}
 
+	if (quirks & EDID_QUIRK_CAP_DSC_15BPP)
+		info->max_dsc_bpp = 15;
+
 	return quirks;
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 56aee949c6fa..4d830fc55a3d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -656,6 +656,12 @@ struct drm_display_info {
 	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
 	 */
 	u8 mso_pixel_overlap;
+
+	/**
+	 * @max_dsc_bpp: Maximum DSC target bitrate, if it is set to 0 the
+	 * monitor's default value is used instead.
+	 */
+	u32 max_dsc_bpp;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.35.1

