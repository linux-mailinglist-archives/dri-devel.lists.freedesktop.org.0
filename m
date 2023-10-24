Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18D7D4D96
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 12:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7D10E31C;
	Tue, 24 Oct 2023 10:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9C10E31C;
 Tue, 24 Oct 2023 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698142912; x=1729678912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XPyfBpnhxXPgf0FDxskGfQUAM2UFQpJmgvZkgov5+/Q=;
 b=ASRcxcy1CqVYJJD/ZhftVvZEhrtF1uC+6bBoMfgD62J4tCe577j4qGnX
 OB0tB5S6gpY46NYK1S2dkXL4XBvoUsW0JQTKOYMUjgiCJ/UsACshjjAdk
 15mb+ILfXJ2gNM31SyJbKle2W9Gtz9LC4NamycbAG2jrHzoh04VpwfaLv
 VP74nom2pNZ40RnsGlCW1lVsTd5YI1kdacoSYEP7B5qy3Npnwn+bx6qMH
 oVpI4ew2nueH5s6VT5a3KP6mKBJUQrzKxPzXF0vRCEcO8Yp9Ot3jNC9Gb
 Y9iSH1ISq5Mv+aH15j/P+PkgDKiDH0qbLCZ8ka+UEZ0z2stEXz2XE755K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473251949"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="473251949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="902118275"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="902118275"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:19:30 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/29] drm/dp_mst: Add HBLANK expansion quirk for Synaptics
 MST hubs
Date: Tue, 24 Oct 2023 13:22:16 +0300
Message-Id: <20231024102219.4035939-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024010925.3949910-8-imre.deak@intel.com>
References: <20231024010925.3949910-8-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a quirk for Synaptics MST hubs, which require a workaround - at leat
on i915 - for some modes, on which the hub applies HBLANK expansion.
These modes will only work by enabling DSC decompression for them, a
follow-up patch will do this in i915.

v2:
- Fix the quirk name in its docbook description.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 ++
 include/drm/display/drm_dp_helper.h     | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e69708..e5d7970a9ddd0 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2245,6 +2245,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
 	/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
 	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
+	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
 };
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 3d74b2cec72fd..da94932f4262b 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -632,6 +632,13 @@ enum drm_dp_quirk {
 	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
 	 */
 	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS,
+	/**
+	 * @DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC:
+	 *
+	 * The device applies HBLANK expansion for some modes, but this
+	 * requires enabling DSC.
+	 */
+	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
 };
 
 /**
-- 
2.39.2

