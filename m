Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3D76654AC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2110E6F7;
	Wed, 11 Jan 2023 06:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACA410E6F1;
 Wed, 11 Jan 2023 06:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbNxrKDRraEh+Jghp4uIR2KhIQFu8UnW4rdH1xi4Mmeyi9ESCJRyz89+h1dC+ruD1x83x+jZ19/nELQV5aLn5Z5iQRbTTqsw09iI/MYjhAYx87RsupCQTKF8DbiBNyT9XF2t0qdOrQsUxPZCDGthARbHe+dTyj/RjP27rQM5rIbgY3uD5GigCQ85ww1+4SnDWIPqMJo0fajtWlkzt3fgbaEDIUlFuYGrrwd0j51lwBd+1BDE9k/u7L7fLlxVXg/FxepJKAh/MwQIqmD3KktrMhPJSDm7/h+EcJ8LReq9qBwDxx9Pq8R2RnBKT2RxGrbaYdIXoSWXu6+TngK64d+fWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WztLbGY00PScpjsni/Sx6LQw2eO/Uq39nuKhOpiGdo=;
 b=JfQ4OFxshgMP635aT4uIGSO/MkvCNb+LOwLSvZtHDojQ/+5Kj71GTX2KgApZTq7PobD6A1qS4RBnAvXCf617jP8kkJ7qrFtvEVrFqs6jl4fex3v8SqiN6E7Vy2mOr8kHE66pcL7PyQTrf+Wc4UprV5v6cqyj/2kVeBJjnAiCEMVSNwtC1oGLWWZRqIAjygL951yldCHBXwKpNDLlLe0NT82SokfO6l0x/2i2T4eW33dISyll+q5WuS0iO93EjioJHgAtvfvT1hKZLtm+wQLh4oyBTyvEiLfl0NDsFk/O0cphJhRlkiJrbh87LuM7NkPKRZWnxE1Pc5+x5sUNrV34ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WztLbGY00PScpjsni/Sx6LQw2eO/Uq39nuKhOpiGdo=;
 b=WW3n0t3LBRvUMJx0prmMlUvppCYdl3LEv9h7AKIHA1ZTaq0fqmOAc7MZRZO7PybggSBFuGnwcFsugsdomIZzMpDhM2CMkvIvAggwvoToLzWi4U3vGaIWDq+3w7OdYLCLDRmChMcAeHqh57YB4jrYrDjFObfr1XZvNRbVQU8bHWU=
Received: from DM6PR05CA0054.namprd05.prod.outlook.com (2603:10b6:5:335::23)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 06:36:22 +0000
Received: from DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::2c) by DM6PR05CA0054.outlook.office365.com
 (2603:10b6:5:335::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 06:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT076.mail.protection.outlook.com (10.13.173.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.12 via Frontend Transport; Wed, 11 Jan 2023 06:36:21 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 00:36:15 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/amdgpu: Clean up page shift operation and GWS and
 OA
Date: Wed, 11 Jan 2023 12:05:23 +0530
Message-ID: <20230111063524.2374038-3-Amaranath.Somalapuram@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT076:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 0360bf5d-6dfe-4355-1b54-08daf39e271f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwCq1MJKxSAjY9M+NgG2nRHJCx/dwOAABf+gWEm17QC3v7bGdg2aZKolkczDM1e2G211DrQ+DnMpgt+Tj1KsbsKs3oY69foQ+QkjGXE6AF2Xga7CZcmydCG3sfvNAuNXsxTOzvzd+Mqt4EhRF35Mtr2QNr9LvtuJPtG1PfcL/P0emIGmivngMsLlupjDGJAwvCg4fWF9qT9QWiFMB7X8arD4tRUIT1HjASorUjd2cMArQU+xaYeGckKX74PIyoYAkFsFZlth8efOtWd02tSjzt1AdYSD5qsdvLXeqZrehBr31H0Bd3t3o7M4U6Tk9peZXa3m8puiS/HRpRFQNJnxyyjj5oEhkKp/r45U5f9A3ctSdcaYoz49yJOpszU7EoSQRE4Z8t6R2KF71LC4zvoLX0JLpcREcr7BiPoHBpN+Mh3i7KsvDxEaZpff6LFhJIJQvwci1r+3O0OOXXCBft+5h3t27MZ00iHTo4jIgTSHMjIOxtYMEMYnRYoPlRkVEETUiNT5vY6ujMN9Lud9crqm6dwwBfH3iESrJbhO45CwTG4y3ZoPy6KZEOpAn2VVSSHLWhWIgoa4R6gN0LUYx5BL3Y5YWcx+XOF5NlZ5ngubipY7gbwqi9KoMqbHjHYbEGaBezh/C7qL2kPIAdeXWLbr3SbL+fUpzLh+TfO47/eoxlF2aPpEpJo8iUC68yFEQIESJJlOiOcIq/VDGY4iT7uOEK/VBcd+HTw2QHkX16jUeCI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(356005)(81166007)(36860700001)(70206006)(86362001)(83380400001)(450100002)(4326008)(41300700001)(70586007)(54906003)(8676002)(40460700003)(110136005)(426003)(8936002)(2906002)(5660300002)(316002)(40480700001)(16526019)(82310400005)(1076003)(336012)(47076005)(2616005)(186003)(26005)(7696005)(478600001)(6666004)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 06:36:21.2297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0360bf5d-6dfe-4355-1b54-08daf39e271f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     |  4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 12 ++++++------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 974e85d8b6cc..19ad365dc159 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
-
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..f92b61350efe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -91,11 +91,11 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		break;
 	case TTM_PL_TT:
 		node = to_ttm_range_mgr_node(res)->mm_nodes;
-		while (start >= node->size << PAGE_SHIFT)
-			start -= node++->size << PAGE_SHIFT;
+		while (start >= node->size)
+			start -= node++->size;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = (node->start) + start;
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

