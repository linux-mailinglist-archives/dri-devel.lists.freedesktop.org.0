Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1058B11B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2275DB9E58;
	Fri,  5 Aug 2022 21:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162C5B9F22;
 Fri,  5 Aug 2022 21:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbKOfUpy2yE9P8meDxpQTXKEe3+k4nLd21ak8QRPjdSscew7afTyBWBSoim6NAd7HSJ343gWESX8B/OgXnNTLntNxJi1KCbEtgEVi4AffietJiDJgcX+mNSum8qHwqKkgsvvwn/YNiXTM3YXqBHVQSbAN5o92V535pqyy/7Qhj+hfkKSt6f/Ub9dXqzHFfx2+CkVP0VPrA2zLJ/qSvxh/x2uRkdvTPIh5vmzp7vTfXCeHTLAnCsdUrGfIC5h6ZUxEKD+sEcFOkGWTlgtJb6jWAZtRw6gNXS9DHeeVH8CXz1GJjaxyV9Wyv6kGXmo1/g8j5r4fzDxU2ol1Ww9rFdE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMV/5siWxXnv210kmjQxAFuYzXgXHltlxohiAkYazos=;
 b=A2qKtGhpEwer6J/Lzh6YfKtz37YHy33+zSxaKISY8j3xBZTHN/fg/ui4IRxWjEkMUILSOg+QdmPHAH1DTb2nU3asTQ3k65uAvZ8H35IMODo1Lfz6o0tXaKLHbVMu4bFWonYKH/9C7QCWyVcCnnE/A7k+SWhRIUvPFo2ZTAP5n0DknEmzqswZITSTENPzHfx3ksKyraGdaZRgE808NXM5AgGI7YZCqp/qz2ecoZIpcM11OfvUxExHRueE/TAdGVq9ZXMB8X7BWAJINKSULJ0BvHliYMKVaSwXfaae172oq63NCvIL0jFp41KrP9/2E4dCTDcoSaDufQ6dxT74dTzPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMV/5siWxXnv210kmjQxAFuYzXgXHltlxohiAkYazos=;
 b=iEfpSgYWv/yHE09OUCUPDzkSBLhZ3K8IgLKw39SJykHazSfPdP6frHeTj2IhxdSWCiLovYB6bMRfyFSsoUeOrCpVA24oAy/mAw+/uVZ6vX+KR1zHObnFJ8KmGUYh9GD6PPOMAKQGGOD1OnCftGSBaPdzndnUNDyCnDmqThpSySQ=
Received: from DM6PR13CA0044.namprd13.prod.outlook.com (2603:10b6:5:134::21)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 21:13:36 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::6e) by DM6PR13CA0044.outlook.office365.com
 (2603:10b6:5:134::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.2 via Frontend
 Transport; Fri, 5 Aug 2022 21:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Fri, 5 Aug 2022 21:13:36 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 5 Aug
 2022 16:13:33 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] drm/amd/display: consider DSC pass-through during mode
 validation
Date: Fri, 5 Aug 2022 17:13:04 -0400
Message-ID: <20220805211317.176672-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805211317.176672-1-hamza.mahfooz@amd.com>
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42563859-2efe-4d38-15a5-08da77275c6b
X-MS-TrafficTypeDiagnostic: MN0PR12MB5956:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXEgVKuZmz0UIfSYuEhVOWSQz6y8q/d3x/cwdTcME75cDoBMC6rb0d91XNnVQKgxf5WmjgxU8o6p6ebQM3xS6EMoPAvkCtOEYQ4HFpuVUHqYaJbJ4ou36C8aSmYseqBlqp7DTMRPDmDg0MBdgmugZ7Jx9xLYnJRRRkBnGpkbcnaXUKDBPSTrs9C7HjOKI86v5Xb/oJtvkjGq9K30Z9qUwDP/UhL0BY/fnSAhUu6Dy9q1scW1ESxuwHfSmYuXPn6ih2X2blHD+3H9/gKtgFGQ7RsHixMRfHmh/6AfFX728TkG/WPcHyh2pPS8vRhjoBSwd6xgQtYedJkENh9fJkdA064qIbs6XcOsogHmqNsblb4zT+A71/qZ7xBto1JGRV5FwPfs1d08U73nOPCaMq7ZedGCKsIY6Io8qWdgv1HtjQ3Q4nwa2t0teS5Q4R9x2kHl5z+wgIL6XZXabbXmkJUGUKVfR9OnEHnRgjU6UV5xUd04dwpj2hEgU2BcABoqPOgE9Sj1C8mD1j1STo1bpW4F4b9hfxvknPJ3JWLE3L2lqARgZwm4vlpL8xC/DKrIE9ohVyIp7pFa7oAoIrMeJgW/qaiVlNUj89UlTGaa9+lZagm71tXs5cQhDOY8phrbP7V13s0fyBJX7C+Zlml+tsXqLDcIxi55cv5v42stxvyNS1peDA4InbDOlCefD2t8nwMelfjxJam4qpodh1oP74Z+Kia5REnFEjlBzvFOYvL88gjD93zJxOfkkqRMl4bXqr5752naVo6VOBAG2ZJNrUa8B74+JgpTqNZ8I6i0PgCQurUkXkCHdZcrWTH7qvCKzY5PRO1lZjsmax2m3ft9BSOyBgHCA7fRIe8RqQjHt61zz+lA/eNveQEwCMwi5uBdYauB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(40480700001)(8676002)(4326008)(36756003)(5660300002)(7416002)(44832011)(70206006)(70586007)(316002)(82310400005)(2906002)(54906003)(6916009)(41300700001)(478600001)(26005)(7696005)(86362001)(16526019)(36860700001)(8936002)(356005)(82740400003)(81166007)(47076005)(426003)(186003)(336012)(2616005)(6666004)(1076003)(83380400001)(40460700003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 21:13:36.3204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42563859-2efe-4d38-15a5-08da77275c6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956
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
Cc: Ian Chen <ian.chen@amd.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Imran Khan <imran.f.khan@oracle.com>,
 Kees Cook <keescook@chromium.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Leo Li <sunpeng.li@amd.com>,
 hersenxs.wu@amd.com, Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a mode validation routine for DSC pass-through. Both the link from
source to hub, and the link from hub to monitor are checked, according
to the current link training result and full pbn returned by enum path
resource sideband message.

Pick up the minimum value as the bandwidth bottleneck for the end to
end link bandwidth constraint, and check if the maximum DSC decompression
bandwidth can fit.

Co-authored-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: use multi-line comments, use a temp variable in kbps_from_pbn() and
    add a debug print statement in dm_dp_mst_is_port_support_mode().
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 79 +++++++++++++++++--
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2e74ccf7df5b..ef6c94cd852b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -36,6 +36,7 @@
 #include "dm_helpers.h"
 
 #include "dc_link_ddc.h"
+#include "dc_link_dp.h"
 #include "ddc_service_types.h"
 #include "dpcd_defs.h"
 
@@ -1388,17 +1389,85 @@ bool pre_validate_dsc(struct drm_atomic_state *state,
 
 #endif
 
+static unsigned int kbps_from_pbn(unsigned int pbn)
+{
+	unsigned int kbps = pbn;
+
+	kbps *= (1000000 / PEAK_FACTOR_X1000);
+	kbps *= 8;
+	kbps *= 54;
+	kbps /= 64;
+
+	return kbps;
+}
+
+static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
+					  struct dc_dsc_bw_range *bw_range)
+{
+	struct dc_dsc_policy dsc_policy = {0};
+
+	dc_dsc_get_policy_for_timing(&stream->timing, 0, &dsc_policy);
+	dc_dsc_compute_bandwidth_range(stream->sink->ctx->dc->res_pool->dscs[0],
+				       stream->sink->ctx->dc->debug.dsc_min_slice_height_override,
+				       dsc_policy.min_target_bpp * 16,
+				       dsc_policy.max_target_bpp * 16,
+				       &stream->sink->dsc_caps.dsc_dec_caps,
+				       &stream->timing, bw_range);
+
+	return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
+}
+
 enum dc_status dm_dp_mst_is_port_support_mode(
 	struct amdgpu_dm_connector *aconnector,
 	struct dc_stream_state *stream)
 {
+	struct dc_link_settings cur_link_settings;
+	unsigned int end_to_end_bw_in_kbps = 0;
+	unsigned int upper_link_bw_in_kbps = 0, down_link_bw_in_kbps = 0;
+	unsigned int max_compressed_bw_in_kbps = 0;
+	struct dc_dsc_bw_range bw_range = {0};
 	int bpp, pbn, branch_max_throughput_mps = 0;
 
-	/* check if mode could be supported within fUll_pbn */
-	bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
-	pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
-	if (pbn > aconnector->port->full_pbn)
-		return DC_FAIL_BANDWIDTH_VALIDATE;
+	/*
+	 * check if the mode could be supported if DSC pass-through is supported
+	 * AND check if there enough bandwidth available to support the mode
+	 * with DSC enabled.
+	 */
+	if (is_dsc_common_config_possible(stream, &bw_range) &&
+	    aconnector->port->passthrough_aux) {
+		mutex_lock(&aconnector->mst_mgr.lock);
+
+		cur_link_settings = stream->link->verified_link_cap;
+
+		upper_link_bw_in_kbps = dc_link_bandwidth_kbps(aconnector->dc_link,
+							       &cur_link_settings
+							       );
+		down_link_bw_in_kbps = kbps_from_pbn(aconnector->port->full_pbn);
+
+		/* pick the bottleneck */
+		end_to_end_bw_in_kbps = min(upper_link_bw_in_kbps,
+					    down_link_bw_in_kbps);
+
+		mutex_unlock(&aconnector->mst_mgr.lock);
+
+		/*
+		 * use the maximum dsc compression bandwidth as the required
+		 * bandwidth for the mode
+		 */
+		max_compressed_bw_in_kbps = bw_range.min_kbps;
+
+		if (end_to_end_bw_in_kbps < max_compressed_bw_in_kbps) {
+			DRM_DEBUG_DRIVER("Mode does not fit into DSC pass-through bandwidth validation\n");
+			return DC_FAIL_BANDWIDTH_VALIDATE;
+		}
+	} else {
+		/* check if mode could be supported within full_pbn */
+		bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
+		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
+
+		if (pbn > aconnector->port->full_pbn)
+			return DC_FAIL_BANDWIDTH_VALIDATE;
+	}
 
 	/* check is mst dsc output bandwidth branch_overall_throughput_0_mps */
 	switch (stream->timing.pixel_encoding) {
-- 
2.37.1

