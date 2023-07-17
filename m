Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A7756A54
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290BC10E03F;
	Mon, 17 Jul 2023 17:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7745910E03F;
 Mon, 17 Jul 2023 17:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR8QWBFVJebMkGs9kHkgaJyP3nnBGz1OvcxcM3MwR5tcwky8xhrjtkujmF96+223liwS2VHDDPPcDLjl//lUoqa0nysv55UlNgUwQ5ZDzegsW+BcFvpuQSwRU1eLut9k9lRelrSdjNRGDtV4TSkt/V8Hy1f64vTYCKdYdyn9456+8RTzaRkZt1gf/CCflgFOpubvjFtGhyoRXdm2xmVefSYK8N+gq0tuGJVhq8fqPgKKoe1d3nMuLr1qDEae5Np9YEUT8fFnkRlHpoYMkMXm4rDeGIxUSgKWkdhb0PjUnfL334P99YE9TO/OvjoYxoe9FI4NuCrtAMjciawpFesT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqDcIh3B9sOpYZYiKQzBixycYyJzN1tLgjjoyu/n2a4=;
 b=X8Nis8qgg4B9A/EE55xMHxeNbYhyPql2N4nnpZzVdZT+0FdHYU8OjSQBEIfU19dbpwEKy+Dflc4kTvE/zX3LrS5t44BMPUXRcTIjXKwa8l2i586zBVEDEoXSRWniUWhigiQ+sWZa6ie7jTmDIYw31ZZ73wtV3gLI0QD60CUybN8hLkVdDssPG2JQBaiafsB5lc7Snq+3Yw+alfMRvTspGp5n9IKYFkrbvSy+lyDYbqwI4WXVV17o3QKS+n+bO4Hq/kLfSemcbQSXUHLaLUYz7qRc2gXlvCmVSvEIfmyYgUURuj8xcFLCOdwCqWbWOosRPzTK1N2sILDVARnixa5kJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqDcIh3B9sOpYZYiKQzBixycYyJzN1tLgjjoyu/n2a4=;
 b=Z1IvZzMCPTfRa5X6hzA72qL7P1FnuGR8OEpxWrasbvyeus3rB5fWhQjroKfyctU3P0ver7Xat7JzupdwuuTnMJyyxuU1krlL49x7Vo7ow1L/wQGb0G3Kc5yzjTqxoUvHGnrpH4ZDAlGW1vwTho1TeaHU7096dLKa2HTw7SwOFZs=
Received: from MW4PR03CA0103.namprd03.prod.outlook.com (2603:10b6:303:b7::18)
 by CY8PR12MB7123.namprd12.prod.outlook.com (2603:10b6:930:60::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 17:27:58 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::84) by MW4PR03CA0103.outlook.office365.com
 (2603:10b6:303:b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Mon, 17 Jul 2023 17:27:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Mon, 17 Jul 2023 17:27:58 +0000
Received: from ETHANOL.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 17 Jul
 2023 12:27:51 -0500
From: sguttula <Suresh.Guttula@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH] drm/amdgpu: allow secure submission on VCN4 ring
Date: Mon, 17 Jul 2023 22:57:08 +0530
Message-ID: <20230717172708.4044221-1-Suresh.Guttula@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT050:EE_|CY8PR12MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0774c8-cce5-4410-abfe-08db86eb29f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zI9Gfl3V9jC/D4zO1QuhgiBLsdViMaLfvnsy9AVkgyOFzzLNwvOeMsLe97w6ZHbKB7gMMF0vxOOR7fMxQ5q0E6DwQjFmTg/Q1tKfRoFIGu/AHf4SFavKN4/tqtIYmKWbYh6dMxmHptSIw1jKqJt1BTJ7f5eSNL9dfe8YuDPspRPtSaHaTZwTzw8hwo5eoRBmIBSWIgvLAtIVb5gNQ0VGLGCu4vNYwBJYHlhZAwfqwz0AShUP3ipfJ7dKGFisTMrSSDGuo9J+xocMKjO1IQnZ5bR8lB/vzHF17U0UBdpfU9wFD0CNCKQjP8S32XyRAqd/bkaXrKsJ+2D8gIQrpiYiLEQ1aVs4NdVFjE+GUNWq6vp21FBP3jcw1Iy5m5Nr1kJqHL8uJkODoje29VTmxM7aN+nXaS9pq8ZG54xipkHXEpaRDsMpuhNquoDk+1CUNffw7hGYRB1Z7y/lqMyxbGFA5oAy3FoTE5H28cMBc2uUV7R0RR1V3gfz6PwyNaLJTptMMScYqHcFZI+W6Zz63S8XraSHmNtUdIok4AsLaqRRz/ocdYABLxqpU+PlO4H0ToCUDm+ccspu41plomEM2OTuqXWgvwqPP0o5YUv3adv40FVtNmvGsFSj+OCgj/1ZK1GbOZDBPlzA0mccikN5U/kCi7waKC5eqoeaifnLNWUYC4pLZ5JJ5J5twav4vFNKsYh5k1qsEEi+IP2T5GeXZVLnrxw6BgOc1LhUl+/Y/zv8SOvLbp8NQAGmVJkb/8VqwFOD+es4+OKS76FZp0x2MPm0GMpH0tOAxHzAHXarb1xIb9o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(2906002)(81166007)(356005)(82740400003)(336012)(426003)(47076005)(83380400001)(186003)(1076003)(36860700001)(26005)(40480700001)(2616005)(16526019)(86362001)(40460700003)(5660300002)(36756003)(8676002)(8936002)(7696005)(478600001)(110136005)(54906003)(6666004)(316002)(41300700001)(4326008)(6636002)(70206006)(70586007)(450100002)(43062005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:27:58.0937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0774c8-cce5-4410-abfe-08db86eb29f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7123
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sguttula <Suresh.Guttula@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch will enable secure decode playback on VCN4_0_2

Signed-off-by: sguttula <Suresh.Guttula@amd.com>

---
Changes in v2:
-updated commit message only enabling for VCN402
-updated the logic as per Leo's feedback
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e8c02ae10163..d2d89bb711b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1801,7 +1801,7 @@ static int vcn_v4_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
 	return 0;
 }
 
-static const struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
+static struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
@@ -1846,7 +1846,11 @@ static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device *adev)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
-		adev->vcn.inst[i].ring_enc[0].funcs = &vcn_v4_0_unified_ring_vm_funcs;
+		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2))
+			vcn_v4_0_unified_ring_vm_funcs.secure_submission_supported = true;
+
+		adev->vcn.inst[i].ring_enc[0].funcs =
+		       (const struct amdgpu_ring_funcs *)&vcn_v4_0_unified_ring_vm_funcs;
 		adev->vcn.inst[i].ring_enc[0].me = i;
 
 		DRM_INFO("VCN(%d) encode/decode are enabled in VM mode\n", i);
-- 
2.25.1

