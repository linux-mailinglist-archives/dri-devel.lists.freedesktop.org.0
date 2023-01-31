Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019EB6830D3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C478610E384;
	Tue, 31 Jan 2023 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3BC10E387;
 Tue, 31 Jan 2023 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177579; x=1706713579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbhmnjYzjP8lLP96u1p49FbiVsEues3mWvBt3I/H+m0=;
 b=jh8ffzvQnha+h82qLwGA7PWhzsRk9HWknxv7fK9Bj/wUqVwzvrR8TTKb
 7PTGZOGCev7NIVYUZh8E8mmGT5re6XIrqeiNuZ2dNLU0TSbmGVVhv/7x4
 xwpLX5Thzt59jF2/gduD8ZnOiWG8/nf4MyQmJaon+hU/u5DU86VeftMkT
 4Avvbc1DeCW96kJTivOFEkDUXaeiqdPV+Hl4UI7jN/rBoPvO5IFvq9YMO
 fYVV9VOO6zlWBTWHBl9OMfFC8RwaUY3yNDsGk5sArAUcAATU7Vk01fNCQ
 rsci/SnsXWgWf9AZF7mNIilQ3oWK06dsjAVGs2WvzbVS/KRvXxHfBz7rv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205639"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155353"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155353"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:14 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 15/17] drm/dp: Add a quirk for a DELL P2715Q MST payload
 allocation problem
Date: Tue, 31 Jan 2023 17:05:46 +0200
Message-Id: <20230131150548.1614458-16-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DELL P2715Q monitor's MST hub has a payload allocation problem,
where the VCPI used to reserve the last two time slots (at position
0x3e, 0x3f) in the hub's payload table, this VCPI can't be reused for
later payload configurations. To work around the problem in a follow-up
patch the driver needs to reset the payload table after all payloads
have been freed; add a quirk the driver can use to detect the monitor
and apply the WA if needed.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 ++
 include/drm/display/drm_dp_helper.h     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 16565a0a5da6d..e2cf4b4fe11ea 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2244,6 +2244,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* DELL P2715Q MST payload table must be reset after the two last payload slots get allocated. */
+	{ OUI(0x00, 0xe0, 0x4c), DEVICE_ID('D', 'p', '1', '.', '2', 0), true, BIT(DP_DPCD_QUIRK_MST_PAYLOAD_TABLE_RESET_WA) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2cd..fcd445921ec9d 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -620,6 +620,14 @@ enum drm_dp_quirk {
 	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
 	 */
 	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS,
+	/**
+	 * @DP_DPCD_QUIRK_MST_PAYLOAD_TABLE_RESET_WA:
+	 *
+	 * An bug in the MST branch device's payload allocation logic requires
+	 * the payload table to be reset after its last two payload slots get
+	 * allocated.
+	 */
+	DP_DPCD_QUIRK_MST_PAYLOAD_TABLE_RESET_WA,
 };
 
 /**
-- 
2.37.1

