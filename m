Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E339F6654B1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F178010E6FB;
	Wed, 11 Jan 2023 06:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ED910E6F1;
 Wed, 11 Jan 2023 06:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP56hBxdBGShn6cOtR9yjYbpN+kyan2INllUus/PzMeNKIJVKFC1vjVFMr5p8jrHNprgLZ1qMmMEmHC+apoJpQpLgUSx1ffgbEb/o2/Y3GQNMlgxcCCJvYIXyZPuzFLM7ExUsqIl4+bqJPP+WTavHOBQgIfbXwOFSGflFNMWq7msMqf5hLVvVvE+dw0VLGVlA2RsRzP93XeW9Vj31MJM7N0pL+QRR9HIczjRpXfeFbvSpYYrsTKLwer2+fj2WC2Y2MPthdBGcNfx7i+FQ1lsa/Ufzp75U94NtfCiD3Lc1is4uhS4UFiwHEUJJdEyUzIoKKfA+lq/8odL7DDd+pyfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/qeUh7S6/2i+kDiqlzhItj7sxHWJ7Ck9Me0toGfJUk=;
 b=XigH5aKua/287ViZPcA2Tt5ZaBZlqT64H78WjrqBRNliR9dr/d5sJm43q+qd+yk3sLfPMpVruim/5a6h7SghC1NmWGq7zgDaA0Jql+v8foJqcZ9mdaiygnnRl9qOlgtlrQc14MtQUCQdouOvjf1phUOofevOt13ccwIc/eT2P7ymnNwqSMgiq64+qAZfGpi+lUwSLCadRb7o9D0aB+TLrH7khaeULaDknGDzpvPs6ye9NdEO/KwvO2Lf3jfCls5MN3OqUqD/w8q4+f3QUvAJwKwL1sH7wjjIL+LueQZAuVRxX6a6s2UbaucT4Zkzov0hKKAONdqyMM017EP4g9i1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/qeUh7S6/2i+kDiqlzhItj7sxHWJ7Ck9Me0toGfJUk=;
 b=a8G/7ZKeoYXXBu8uQWuE3xDawcHG8SJumwNcut1XazdqkYHjmIvoQI0Wdm+xCJ5dvkAW5sYxtYPwvAxnyf2snztqc17/K3qDwwjzsN5ZGnkLUwGdpIpDWKHlc3cDes6+69EXUztZcF4nscGA3Ty6aTXemkM50NdCeEmAFzVroZc=
Received: from DM6PR02CA0049.namprd02.prod.outlook.com (2603:10b6:5:177::26)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 06:36:26 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::78) by DM6PR02CA0049.outlook.office365.com
 (2603:10b6:5:177::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Wed, 11 Jan 2023 06:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 06:36:25 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 00:36:20 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 4/4] drm/i915: Clean up page shift operation
Date: Wed, 11 Jan 2023 12:05:24 +0530
Message-ID: <20230111063524.2374038-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
References: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT038:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f83a3e-edf9-4a19-940a-08daf39e29ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QY2scLMNw9ETbTmO1RrJGm90tTqSYlOe+NN8hzOdNLeCeaNSmIbzTTO/GUCc1vTJRPd/lPxXTZYSGfCwFNbI23W4R8IY5Dq74xiP87CtOIy02sCmImTW0GENXb0JRwxfZ5e0g1dPlmjI/UQTtimRuaAkreKD2+vravibCp1BtGZyvxp5utyClF8FDmcSajxkM/jXXOftYGwfujvYpfsQICtdecegeSd2cEeAX73vfFYaFzWBbWfwzjqQTiDIUZpSuWLxcijgCSkq2DoTQA0T5okP+8zpr9puu+g5Jo35SWmo334JLsSVGWJtkWgp/0XRHgLvSxYcQ//qYsjvVBtpDTmsp4v9ZnV/uf6IK4NHaMPUoxm1JUrTJKBgdVqKtn/9Tu2h6H+uv5doRVodfn6CDsFU1E3ZlXZHPlEWC9P01srkLA5T7G1p3+rAxn4h8HAiZAS0a7zcJ31CtfmcEkh0FFtoGtKAiZ/l2doo3/wg25qLycv6uSuW/MzUiwS3lGGtrG90zfqXU7VDU46wlj2Q8yNtGCinBpYOIKv2YjLg7lRoeOujvCRGgvpAHhAv3soqUTtjrA0bV529EhcZR7ntZPovW5kXSF5hZkQw1IkjREqooo86DaEdndX4Lio/ZLUHkkROM1UJYHIjVDjfqD666ysQ5eY6iHDeU4QfqAYzv6qyJmYW/S6g2Y9clEYtLTsBAYbXfSDja3dt9QXU7sp1Qe/4dNbtlQNh0GG0uea284c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(40460700003)(1076003)(426003)(41300700001)(110136005)(54906003)(316002)(2616005)(70206006)(8676002)(336012)(4326008)(36756003)(70586007)(36860700001)(450100002)(86362001)(82310400005)(81166007)(356005)(83380400001)(82740400003)(5660300002)(8936002)(47076005)(40480700001)(2906002)(7696005)(186003)(478600001)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 06:36:25.9317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f83a3e-edf9-4a19-940a-08daf39e29ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 114e5e39aa72..bd7aaf7738f4 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
-	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
+	i915_refct_sgt_init(rsgt, node->size);
 	st = &rsgt->table;
 	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
 			   GFP_KERNEL)) {
@@ -105,8 +105,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	sg = st->sgl;
 	st->nents = 0;
 	prev_end = (resource_size_t)-1;
-	block_size = node->size << PAGE_SHIFT;
-	offset = node->start << PAGE_SHIFT;
+	block_size = node->size;
+	offset = node->start;
 
 	while (block_size) {
 		u64 len;
-- 
2.32.0

