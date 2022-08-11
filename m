Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D5859036C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1672714B0A6;
	Thu, 11 Aug 2022 16:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24F11B229;
 Thu, 11 Aug 2022 16:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYR1HOE1CS/yChqO1nk1qUEI5GkMni4/4hyH8oZpDlHWmjbM50xS1NBt0ACwlFQAicYj/wIakiTSEEGBEeZQ6Wdl+DUqYdjJImkwb8UQkusDtXGtjzksMWHIuiXQchu8X0kCRrwdAsvEfVMdoa5GtdaYVCmIFy6zhXG8oYaKUhZBB51yBjQD6nSx/TbbVJzQDtQR2mroVrO+8g11gRZWn2At0i0yD4p8oVjljEW61uwnnC+mMhmzxpBBRy6FDVjR83nNnDS/3YNV9OoZh5gkf8dArJcSOvMR/1wVZGt+9tGYe2NqavHwVvCd9eaMPk+SQhl7K90GtDCYvzNPDSNZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08O0Lgt/6qG7zz+CVZEcuC5Mr+62j1ha2DulHnxSeUU=;
 b=Z4KKXOxSFZGPfjD9EjgcANP6gIcc35rfsiPXeH8/u6yibbzvCh2zhpx4Fks8yAziM/09LlRStJ+T7CeRm5/gUfUmF7xK13kKhK7KAHFE1UTUn+y0EbXGGlopdQhYZfxmbQ9YUBRRVVvHL4NIBMf+jX7Zdf5eDAVmSDRoZZAWPBR9MCzyt8WInGyXQiVN2KSGo4u5TALFYO22P6IRp2lJ5mykK1Xp2r1p4ArPmMvkVxndRpa6My7FKVO+pmqVMgfNngzQOYxPVc8uuvowV4TY2EmGC0e8Erh49Ef8Vh5IymEtkATDI9wCM5H7B+g1ge5dEMh4exeRlUMW9UkxpB+VeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08O0Lgt/6qG7zz+CVZEcuC5Mr+62j1ha2DulHnxSeUU=;
 b=JqwS+JpkrbW099b8D/CFKcYQwWFsPOcVsPCKo+wlfsEbhuODYG9Go9UetNKyvksztPcp3S6m58VeM3LMq8l+5tDsFUZSrrTdUg20laRg8SfPoAYSDaNpTUF7FsqHhQfG65hbVAWH0hO0ekbK8sr/uJKLFHzwYd59zKvD4DwsbIg=
Received: from BN0PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:141::10)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 16:24:20 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::cd) by BN0PR07CA0010.outlook.office365.com
 (2603:10b6:408:141::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.12 via Frontend
 Transport; Thu, 11 Aug 2022 16:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 16:24:19 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 11 Aug
 2022 11:24:05 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: fix DSC related non-x86/PPC64 compilation
 issue
Date: Thu, 11 Aug 2022 12:23:07 -0400
Message-ID: <20220811162307.1384962-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cae2537d-af5f-40f2-40a5-08da7bb5f17a
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //lcgFveT3XjMUAWPXCbQk4CJwH7t1thlvr+v6rTnzS+/FThQwfUya+yNzeGVChTb2sQahsoUOeLQPwue17WnmNWg99WWZc/waYr9AbrdjUSW8YffUilA2unM9neBVuUjGoa6bBvXH3oBG5DuuVnrYpDPWEKU8ZHw4tUotm+F1TPvfYQjrtgbMKLedWyD2Lr0LplbT/lIYwYLnd0/q3tZl7xhqAdl5EmnocqCzjcLMQBS8+b2ObVFH9h7d6/zeLqQxs2Sq9qzW4JFL+w4g2guLe6QoatDA51rpGrbMXamas5UdN0jvwc37ChtlwUYV+K+PA7g68SpS8ztQ1fXlm/O3yeT0hh49De8LWPwiDpIRKELzcwAxjjO7P9WpY0nVEvDLFKh6affaSUc5w+GKNiyRGhcX4ZkNjNs7zfFrW+S2NgBcgFNymLRrEkYH3YcngBowpXwZ7LDFV6hoD1fM6I6vZQEzFkImQ0DjhI/Yahz0RLMai3oT24rE4oaFwUZerysT8Y8ra4/TCuXTmXDlpppGykhza1W/T3Wrb9stWHm58mWyZqpghUJC9WCHKwyq+nEnV9LT4jMnm40+8q833PKc24hoQiTLkZqMIynzXzcGQOcmyOHulCmAa78LKfvD+InqAUwBmlW1Hmtpkp22PRDa2/Idij55bSAgESbAklKztMQaZFUQn/kD1fpgrwxbLKBLMnD1a7lS2592w7P074A69BY+4siv530uUGZ2nc08DJhpYRQ4osdX7p/RebCT7y5JKWjWivnhW3Yhy2qb4XYLf2hWn8gbOjO1q8+Iad5sofcCv+B6Ii+PjeI4iZleb+SdWeJ67KU9grLgV44IamSuNrWS81o/d/79y8wCI3stpxUI8R8RXFXNc9EoeNviSj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(7696005)(41300700001)(26005)(40460700003)(426003)(2616005)(1076003)(336012)(47076005)(40480700001)(82310400005)(16526019)(186003)(83380400001)(8676002)(70206006)(70586007)(4326008)(2906002)(8936002)(5660300002)(44832011)(478600001)(54906003)(316002)(6916009)(81166007)(356005)(36756003)(86362001)(36860700001)(82740400003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 16:24:19.5558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae2537d-af5f-40f2-40a5-08da7bb5f17a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index ef6c94cd852b..0c52c0867211 100644
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
@@ -1416,6 +1414,7 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
 
 	return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
 }
+#endif /* CONFIG_DRM_AMD_DC_DCN */
 
 enum dc_status dm_dp_mst_is_port_support_mode(
 	struct amdgpu_dm_connector *aconnector,
@@ -1428,6 +1427,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	struct dc_dsc_bw_range bw_range = {0};
 	int bpp, pbn, branch_max_throughput_mps = 0;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/*
 	 * check if the mode could be supported if DSC pass-through is supported
 	 * AND check if there enough bandwidth available to support the mode
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

