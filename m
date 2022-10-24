Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E50460B74A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C4D10E776;
	Mon, 24 Oct 2022 19:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D0110E761;
 Mon, 24 Oct 2022 19:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEaZgvYzrsKaSFrdcR9FRVBHmff3hupPhn68+woh4+atgjvZlssuDwzGa9TW5BrlQZLeCmbqsNZUYs4uQTySmN2EE1uCqg8VmBl+UQrqpuwi28x9nPwau5r4vM0JG+dN417GOmrMeCyl7lujXuo2jrkIOVPXmT6HSvkTGLaxEcCHNBlR2OKRiGf/ZW72ftLpZC3lxO2Ohy+KvZCZv+IDesfHeAUWbGAEf2DHr6F53DCE5eUMOag6EqRfE5CwSBP45mcgsws9hOs3X88YwYI/FLJdn+vU2Wg5w/kQM4MIw7kpyhjrb74PzO03zbTbKnm+7Djb3bpPw9K501TXnEgO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMnXVaY5RyOYqYXy5gC6NAtXTn+KN1+YVIUuZP1m2vo=;
 b=UxDCb57bUNSTGm8Wvlb5/Fho3HkbcXnyemKMPumvusnyJFh1om9C+WePII1yB4rMVsDmgcNqwqrHmm3uPectS1nrpJA32h801fFkVF+oqk4bUtIuqfEoCjbKsL63WyxlgEuyEZJvjWmJNFvkTYVm8onmQYdC9gzTV1GbhrpQc7GO5rpUL6x9e8bm8NpYsYoa/83+1ZNQIqEota/wVVYx8Q2iIPXHpVv0xqSxRn/OJlcJP66KqZXWQk0/t1+T8ERQf0O6pYQDtyQZlV3v8n2aGY7gtmKDF5NSidXcAkuvdXR2U8fWs7PbUDk54iRS2wbGEqWqTOLyjmzW7XyWFOyKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMnXVaY5RyOYqYXy5gC6NAtXTn+KN1+YVIUuZP1m2vo=;
 b=XTW2o5/Uy8lulNObSwvAFtxB1Wxn6r649n308k0BqALxAi3Lz6ofET3LST5fT/Foeu1qQ496JwwBUTC0sBapM6omeOcOIEOnqgHyKGU+dZX1abtKzHVne9QFGlqraHxz6yx51EGDG0suSH8zWFEia2GU0pRlNP2NvVtfsrweSFA=
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 19:22:13 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::57) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 19:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 24 Oct 2022 19:22:13 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 14:22:11 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm/amd/display: use max_dsc_bpp in amdgpu_dm
Date: Mon, 24 Oct 2022 15:22:22 -0400
Message-ID: <20221024192224.180507-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024192224.180507-1-hamza.mahfooz@amd.com>
References: <20221024192224.180507-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: 92db5140-9e84-4811-f9c3-08dab5f50dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m1wwP7LWmmKq16133R2GpHrHGODxDK76P9W26bNZihFCxPCqRJoKd0h+Wnpz4YKPdmfn0u2tdjBMPppbSOetOXNBcBkxuyb7Zc68b6DD5CDgJiUnAmL3LwsIq1YKD+b83gvGbLLXAEJ35oJV1gkx/0kEy0aNqros0t028uL1avfzCNjkHjs7g0Y7pM6Smdd49PhuvIBuPlLdKNu+7yA1vVBX3G4zB+/dyqVn0FPZBnH97nykSIVXOUo2tdOUYofNo+/mJqiRMcik/+i2g7eAnNvJoMv6hvFVpUcNPburrL6MGenk6PslB4sJUeIDVcm3PjR7+FAgDlg93eON+vFVZNqPe48b6NZjtb6XQEwWYEVeoe2o7Vz67RvR3eVoWzYV64+sc2Cu86mTFxSymmNg6sYzmNSTQLIsz6tri7751iz3Qpxpn7Asg8LhpdKMxldppj1lZQ5Hb83CeJhI6amkTzhoxydecQeJBIeaKLyHtECZPW6F2EOlY6aAh3MFQF6FipdbGUyAU9tWV8H8zDyNUuHDkXN4tSh57iOiQ44NFKHHbjMstYCPD1I/t6XCywMX8z9+eKui3H8+YLSThQaLqLqs/s4R1XzL65v6SgiFrL52LnndfmQq8SQ4ylUIcZcxNlCG6RY9m9FLMHZ6F6nhn1kjUJk2beruYHzXBgfqCLgPC6G/gZMSS5DppEtFLrXzQPd4REOBGSDt6ycRkIQ95Xm5/6+LbhuMh19aVm1BpDY2czwolU7Des3n+J+BZ0D8lbG3T6AVx4xg9NdKoSICEgVphslLRs7mwY9WIyS259APecOGxsN0fSZ8deNBiJTgHPwCWPakRFD5YtACc8/Nzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(70206006)(478600001)(54906003)(316002)(70586007)(7696005)(6666004)(8676002)(4326008)(81166007)(41300700001)(47076005)(26005)(8936002)(336012)(186003)(426003)(5660300002)(44832011)(1076003)(2616005)(7416002)(2906002)(83380400001)(86362001)(40460700003)(16526019)(36860700001)(82740400003)(356005)(36756003)(82310400005)(40480700001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:22:13.0995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92db5140-9e84-4811-f9c3-08dab5f50dea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Leo Li <sunpeng.li@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <roman.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since, the quirk is handled in the DRM core now, we can use that value
instead of the internal value.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     |  6 ++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 11 +++++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 63f076a46260..9b9cca8cb71a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5618,16 +5618,14 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 {
 	struct drm_connector *drm_connector = &aconnector->base;
 	uint32_t link_bandwidth_kbps;
-	uint32_t max_dsc_target_bpp_limit_override = 0;
 	struct dc *dc = sink->ctx->dc;
 	uint32_t max_supported_bw_in_kbps, timing_bw_in_kbps;
 	uint32_t dsc_max_supported_bw_in_kbps;
+	uint32_t max_dsc_target_bpp_limit_override =
+		drm_connector->display_info.max_dsc_bpp;
 
 	link_bandwidth_kbps = dc_link_bandwidth_kbps(aconnector->dc_link,
 							dc_link_get_link_cap(aconnector->dc_link));
-	if (stream->link && stream->link->local_sink)
-		max_dsc_target_bpp_limit_override =
-			stream->link->local_sink->edid_caps.panel_patch.max_dsc_target_bpp_limit;
 
 	/* Set DSC policy according to dsc_clock_en */
 	dc_dsc_policy_set_enable_dsc_when_not_needed(
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index ce6929224a6e..eb42c0e21a28 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -670,15 +670,18 @@ static void set_dsc_configs_from_fairness_vars(struct dsc_mst_fairness_params *p
 		int count,
 		int k)
 {
+	struct drm_connector *drm_connector;
 	int i;
 
 	for (i = 0; i < count; i++) {
+		drm_connector = &params[i].aconnector->base;
+
 		memset(&params[i].timing->dsc_cfg, 0, sizeof(params[i].timing->dsc_cfg));
 		if (vars[i + k].dsc_enabled && dc_dsc_compute_config(
 					params[i].sink->ctx->dc->res_pool->dscs[0],
 					&params[i].sink->dsc_caps.dsc_dec_caps,
 					params[i].sink->ctx->dc->debug.dsc_min_slice_height_override,
-					params[i].sink->edid_caps.panel_patch.max_dsc_target_bpp_limit,
+					drm_connector->display_info.max_dsc_bpp,
 					0,
 					params[i].timing,
 					&params[i].timing->dsc_cfg)) {
@@ -720,12 +723,16 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
 	struct dc_dsc_config dsc_config;
 	u64 kbps;
 
+	struct drm_connector *drm_connector = &param.aconnector->base;
+	uint32_t max_dsc_target_bpp_limit_override =
+		drm_connector->display_info.max_dsc_bpp;
+
 	kbps = div_u64((u64)pbn * 994 * 8 * 54, 64);
 	dc_dsc_compute_config(
 			param.sink->ctx->dc->res_pool->dscs[0],
 			&param.sink->dsc_caps.dsc_dec_caps,
 			param.sink->ctx->dc->debug.dsc_min_slice_height_override,
-			param.sink->edid_caps.panel_patch.max_dsc_target_bpp_limit,
+			max_dsc_target_bpp_limit_override,
 			(int) kbps, param.timing, &dsc_config);
 
 	return dsc_config.bits_per_pixel;
-- 
2.38.0

