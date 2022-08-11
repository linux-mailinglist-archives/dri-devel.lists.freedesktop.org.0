Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7D590625
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EEE2B6DE;
	Thu, 11 Aug 2022 18:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C572B716;
 Thu, 11 Aug 2022 18:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLU90gOWCaG2FnDWxAD38p29tcPatiPg5qty4B+52TbNGKdfqJ+p2s61hEbvYWnT/lRECPvQW5sr56RyXvjanDv4/d/i8kiIFyBen7VqoW1n54t6RoY8r4oryujchsgWulk+M9zuVqiDk6Ori7GFF3Ag+eTabjoQX4uVn5tDISsNVsaoei7QV4/t4YNBkWICFRcnlIFcXGtGaFbjWByo/umIttIVB8JPVWJhnVXdL8CPQlWVr32cpUJLie2myY0rSTfIeqLrr82qhVRrHr9cyhmCRimD/PBE/9sU3VWVTWWwPcbJ8/zp34y6AqrabLVC+ip++pqmRWJcRu+2AcZnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=timqpckBfRhbWsGHEn42+tLc54XtQGdgMoFK2dCnqds=;
 b=X85/LAn+lFru1aKwDYCkbekecqlDAAO4zynDFDwM+dlOdTvAKI9Ds/AqI7HU2bt1Yb/atdripPwlPj2siOUt70kKNPmjTOveFcvBApoWJSfYyuqVAMKx7CpMCwO7BUU3fs0QB1mPbhtz4v82tcVpGJT827QKS7dJmn/A4SwR+/6dtp+wv5L5RIsPuyYfQSEPBb5tfSb5JhQIf6Jo9QMzfUuvQhNffJ7/nBxVmHTwmGdil7gnW07YVpMcL2E7ZRIQR1zReSIAq395d7EOBN8qG0lAvIp00Winkocl/+brl+i4qp6pGe6hXOjbHBw8mFmicHX0S0uTZVZmmS9zFLJTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=timqpckBfRhbWsGHEn42+tLc54XtQGdgMoFK2dCnqds=;
 b=DSohfxvZqozpUDFdbUGaLLSPSa4qzfO2r9SC/TFZXnvgDHh4ASWipyxNv+6slcLT2LSwXcNFZ+KdI39Twnk6M2z5fbE4LYhmwehSziWOYWmcacNRfAc0Zmk6BtSByNqgkDA3fKTniKcY7BdckJ+sb8IuXMI+ah/JQnNerT0ZwpU=
Received: from BN0PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:e8::29)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 18:00:11 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::1d) by BN0PR04CA0054.outlook.office365.com
 (2603:10b6:408:e8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Thu, 11 Aug 2022 18:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 18:00:10 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 11 Aug
 2022 13:00:09 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/amd/display: fix DSC related non-x86/PPC64 compilation
 issue
Date: Thu, 11 Aug 2022 13:57:58 -0400
Message-ID: <20220811175759.1518840-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
References: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6b4697c-eefd-4c26-1423-08da7bc3558c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4053:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cnmYBLMt1h29tUH9gFU/UHibwt6K/lI021ZNYhI/XKQCJVIH1di9jIHxzQCDd+yYk3NOQfRb8zfBRAGybCHdayn1lBwCxFbWd72eDhB4JKeeF6otOojpk4/Zza5O6yCNTJW760qgbTFEZgxFvQtkxoPDDP7yXFUMACh+VhvyUj/+hpZyN84WoPXFnh/Qwi75Iio/oepyqAPPhJw3ViIXtD52lekK4vgThNj2glgkF4CEjoSIMZAEBZ+bYSVWtx3lxtbdYD21Yp0qNrZN009j2rXv/SlQETnJr0zOjfxL8PPLtWv98u7ne1F2dqROooMnkSTWwbC16o4RpLMb9prlUeuOwj3TEJK1yohxOlaZTnMZ3cct7GraAFLDLeaC7tmP5XrKfSXc+QHky2Z7BoWQnyjInLQEkB7QbPrr67jeWHZihpMUIspbHnssfYBGEeIb1Nwob20NL6bq/FD6/0FbAdgvmewBX4g8TlY89WzXj/JFZK9ocuSnjZvnrHVlXVM57Q+qIQ2BzP7mlv5u9fnjISZDyWJtwG9ZPkorIdL9msk62+5/lWtCupToj0uOGQodvFSMaovyC06pnHGSrDf4+30dtF+JXtWzHmbQn3l5H80P+x/AWgda4ok04GqnaADooAt58waH7x4TdJjWsKwpAjAc5854k3SD2NEiFxB+RrjQ6eOoU/jUBTWWaeJioYhVvqYP9K+njsKBAy1xAQ9FttIQC2rjjZ6gGc2KbTl4dQA7jf58sX8u7SSlGwgoUPP59siesbQ2aWRXv7nOHONpK+068cPLVYC76EOBKyV5m212Q2XbEVp541SzgBjEzLEZGeMetFeAN+Z6JPkqcu33v2w8p3qGP0LgUgsOhcS5Rxh3bfIv/L20IE5ScMhJu/+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(40470700004)(36840700001)(36756003)(7696005)(478600001)(6666004)(86362001)(41300700001)(26005)(356005)(81166007)(2616005)(1076003)(47076005)(336012)(16526019)(186003)(426003)(83380400001)(82310400005)(40480700001)(70206006)(5660300002)(4326008)(8676002)(316002)(6916009)(70586007)(54906003)(36860700001)(82740400003)(44832011)(8936002)(2906002)(40460700003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 18:00:10.9491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b4697c-eefd-4c26-1423-08da7bc3558c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Need to protect DSC code with CONFIG_DRM_AMD_DC_DCN.
Fixes the following build errors on arm64:
ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Fixes: 0087990a9f57 ("drm/amd/display: consider DSC pass-through during mode validation")
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: Fix WERROR build failure by guarding unused variables
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index ef6c94cd852b..ce6929224a6e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1387,8 +1387,6 @@ bool pre_validate_dsc(struct drm_atomic_state *state,
 	return (ret == 0);
 }
 
-#endif
-
 static unsigned int kbps_from_pbn(unsigned int pbn)
 {
 	unsigned int kbps = pbn;
@@ -1416,17 +1414,19 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
 
 	return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
 }
+#endif /* CONFIG_DRM_AMD_DC_DCN */
 
 enum dc_status dm_dp_mst_is_port_support_mode(
 	struct amdgpu_dm_connector *aconnector,
 	struct dc_stream_state *stream)
 {
+	int bpp, pbn, branch_max_throughput_mps = 0;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_link_settings cur_link_settings;
 	unsigned int end_to_end_bw_in_kbps = 0;
 	unsigned int upper_link_bw_in_kbps = 0, down_link_bw_in_kbps = 0;
 	unsigned int max_compressed_bw_in_kbps = 0;
 	struct dc_dsc_bw_range bw_range = {0};
-	int bpp, pbn, branch_max_throughput_mps = 0;
 
 	/*
 	 * check if the mode could be supported if DSC pass-through is supported
@@ -1461,13 +1461,16 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 			return DC_FAIL_BANDWIDTH_VALIDATE;
 		}
 	} else {
+#endif
 		/* check if mode could be supported within full_pbn */
 		bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
 		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
 
 		if (pbn > aconnector->port->full_pbn)
 			return DC_FAIL_BANDWIDTH_VALIDATE;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	}
+#endif
 
 	/* check is mst dsc output bandwidth branch_overall_throughput_0_mps */
 	switch (stream->timing.pixel_encoding) {
-- 
2.37.1

