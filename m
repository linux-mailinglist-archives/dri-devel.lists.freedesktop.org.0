Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D867B04E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E372A10E787;
	Wed, 25 Jan 2023 10:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09B10E782;
 Wed, 25 Jan 2023 10:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRXEQr5+USAFFOdh6EWhs9b2WS8rFQFyAMD8eYaZU+hiMaCFLIWjL+4tlA2uKP2q6BhvjuSom8yxhazOQEFbgrzpUfSzm3dJkyWkQcrcqGUoaXMp33V6wd33+ebpENXsLJ2GxjO70JwSKE3MiBssc+2AYLgCEVo3aH/Dtn242a1LEcqQKT5okW7J16QryvgpsIx1/gsxwWtlk+zCWdMtGuq3z6BsqnrCP2iKcCqbdmFpzNPYjkhhR7qOzkUqksK3UK+8Gdklt0j1cUrSwNlb1spixYwz9jYwxzUih8gUhZyff9q2N7z5EFscnPzaqsgVUN79dTw3yVezNrtU2paXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv7WdxW4NMV7v/aQnlNtlMMCM+ZwG8AikB0wrfN79ls=;
 b=Hl8TUMLIX+vvbdPJoXr7+tP+Qk345fHSNV/ZB+kdWwiPOUqhLJMu9aNnRU04jTugSrJazyNwRzioS+dNqZSYZ0lIvv+v6XqJ3sLfX1NgI79rwRl8hP25gsPFseyKidEfYR4IAhsCG88j5t3boQgavOteib3uECeRlWpLA5Vs2VUQTTSoQPV1gGlVVnXWOSAm11nSpsXKRF0E6B6nUa/okSZySeJRJFsPFGDNz+wcmJI+WDWb8qUUlfN0FcaX73Kb4fJ6i4meaXdBnbFFUXIn3Sphtwpr1XRjUHxs/iHldHQfSMMvtFrYxSWXNsvkotzRgGlhqDS0Gwhw2qSwbqAcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7WdxW4NMV7v/aQnlNtlMMCM+ZwG8AikB0wrfN79ls=;
 b=1x7lzqX7/XO4oHPpHFwnwLq/bda35Dk0ElmfTwpGRpGcRq3ef1PY41T9YcOd9IT/j27cBJLBAxcI8kdSKP7vpHUh07mN+lDOMdNg7lQjMHW34A9M+5TThdZJplKbWVu1ZEaIkTHc+b4Mvb2KiQT4Z3iJh0SAvZnTqNCk//GDj2o=
Received: from BN9PR03CA0069.namprd03.prod.outlook.com (2603:10b6:408:fc::14)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:49:18 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::6d) by BN9PR03CA0069.outlook.office365.com
 (2603:10b6:408:fc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 10:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 10:49:18 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:49:14 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and size
 from pages to bytes
Date: Wed, 25 Jan 2023 16:18:37 +0530
Message-ID: <20230125104838.23596-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
References: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|BN9PR12MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: bac1ab2b-2d75-4bd5-2d77-08dafec1cef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BdvZ4DYKGTit2Eg0Zndb3tANhX2IkhwT5IHnUbnQpsJ9oDJUMVL9reTlwp+XAz4Z/q2l7T7y5Ee8A3kF5srQh7RQFXKEzhGbqPHSjpB3/GL2WfnbL2zbttqkeD7xrE1/7UNoqjXwtBCf9jum0GYCX82sGmNjAT3TXpVGVHc+jHVGJTVx770Focf45P69bAokIEpPeb3ejS6DvNJ4rHinVb54C3/0SyrsFcgf2vRA3CUK0ekraZ2Kmxewo9EKMzTucUbf1yWZNkD3WowkSW25PIwlJmOYgF+XnSqqtadim7vI8i2Syf82iO9OuPoO7x34+KyfmbGwcVKNoxzVKp2N2PUZKp8pVR23UcUvO+ox6Goxn09XvbXpnNXbBf/6fpigNv8MARJXzw3WTVak8VxbkPO0J2Z0j8GVdKPCaE43gE2T/K1jojTEEHisIau7dwYlBbTPcoP8oAx247001iR5kH/XdR9ZWUW7XhDGFK2hhHBOx+swlYo1tVtRlvZL+tjP2tZlyKDHHWy8E2IsgDH2FKQvAJH+I0UG61sCLR3TuX59H1na64XBiuWFfJXbnGUWgp7dyHUn2vkUD4w88PLCoxqcgmr8w+pFom49v4OEKVI57yXuhfltqtVc3Q2kOJCz3i3vzCjENz/ojpGiE0k5hFqcMCI6s3MSE+u/OGA5tD3GGY7c13qecoaMxOQRxF5ar0GGoc6Q+7BqhHVO5jiijpYYfDA8k2kBjaW4tDJWJl0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(36840700001)(46966006)(40470700004)(86362001)(450100002)(70206006)(316002)(36860700001)(8676002)(110136005)(70586007)(36756003)(5660300002)(1076003)(426003)(82740400003)(41300700001)(82310400005)(40460700003)(2906002)(47076005)(186003)(6666004)(16526019)(7696005)(83380400001)(4326008)(26005)(40480700001)(356005)(478600001)(336012)(2616005)(81166007)(8936002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:49:18.0063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac1ab2b-2d75-4bd5-2d77-08dafec1cef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support GTT manager amdgpu_res_first, amdgpu_res_next
from pages to bytes and clean up PAGE_SHIFT operation.
v1 -> v2: reorder patch sequence

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..5c78f0b09351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = node->start + start;
+		cur->size = min(node->size - start, size);
 		cur->remaining = size;
 		cur->node = node;
 		break;
@@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		node = cur->node;
 
 		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		cur->start = node->start;
+		cur->size = min(node->size, cur->remaining);
 		break;
 	default:
 		return;
-- 
2.32.0

