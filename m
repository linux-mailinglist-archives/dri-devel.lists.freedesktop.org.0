Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A041F8937AB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 05:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F0E10EE0B;
	Mon,  1 Apr 2024 03:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EptjNCsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204BE10E222;
 Mon,  1 Apr 2024 03:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTuGI84iShHnTnBV709Vb9JR0D/W1PltNTVoCkOFBr7Qk435A8WMlOitzZWothGmMiyCASVbM3dOFxklgn62yGEKy/Ede64pJ9pW8Ip2vAzVuiMGDfC9qNYeASCmvgOS7TaPSEPeJvB0t18A3oHx13C6/mK4QD2LTBBIAYwLc4ktbGCIRLXKVIQaP4dZflV2PuYir3DJS2n+FlfvqmbNLBI5HNj20Dm3YsNvd/9PtkWR4tSwS/cVvTI7/1DDb45zT5cYIUmdaX5bwCI9Yz5+xcZDZRZhJqZYpJ/hR8tYbi4NN4kGbAzndoMLobDGHT13IPvZa2KXjCQLnSn1vtH9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnNM3eG7Zw0mAiUoimEy7bgavhdFJOCXfzP9B3Wg9g8=;
 b=FJYPUrJu9VE2sJrpAbyv6qRFCjqieTJBPEnmxM1LxQO3emqjTIj+nnNBUzIMQjZ0OTYB2IlmW3LqQNo6cmHJZck1OkSBaMVeywp6od3JXRGJ0KSdKtT0tU2bSQ8e/IjT2R2iMLX3G0j55M/z5eyKafEP+iVcZeEc+0qx8rMVcQVVvaT7uufBuo7TwlR0+BWEzIc/X6BH1ESEgr+pNUuxyelZPj5QCMFzMtHqRD3TgLodEjv8GsdTyuvhd6+gcUHO69mc63QQz56Gajvvlux/WZ05PhWqG0cWLkN79lIXH8SgXZpqBogTpdQDxjRsekGIT4i5rS02KcZTLtvSoIQsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnNM3eG7Zw0mAiUoimEy7bgavhdFJOCXfzP9B3Wg9g8=;
 b=EptjNCsbCVicg4Sz5YyXK83TxUrADJGsVSFhX1yQK1UkabCEeUvPmFKMDTU/J1JQY+e8N1G+yd4HfTHzY1l8nIXPwyjaWrHMe2ThqNHxjQpaxA9YxQPEpgMi37JgQeZgec4oMFUEjJ+rgGvSJk8lmf1dTLZwDzLQVlcCAF+NgZM=
Received: from BN9PR03CA0209.namprd03.prod.outlook.com (2603:10b6:408:f9::34)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 1 Apr
 2024 03:04:57 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::c5) by BN9PR03CA0209.outlook.office365.com
 (2603:10b6:408:f9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 1 Apr 2024 03:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 1 Apr 2024 03:04:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 31 Mar
 2024 22:04:56 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 31 Mar 2024 22:04:44 -0500
From: <jesse.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V2] drm/ttm: remove unused paramter
Date: Mon, 1 Apr 2024 11:04:43 +0800
Message-ID: <20240401030443.3384494-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e86c02-aa2f-48b0-0d9a-08dc51f882df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OAPuRBMHfvN/f6LqLFXvLpSqD38uCzU5q8FrP5wgApFsLmt9UVH7pvAsBmz94miAh/GACeerC6WnuTGqf3oft24dwY0I3vo5qiRgI/u4wqU1YnAJrVFc9UtiizdILmHZky5cY8lziHODYKJdciRjI40aKbR5ox+4yr0u5wSMQhw+auny8S43npvwqoCVI8jlXEZmbAa5bcGO6q/6QNegO6RnI5RXQC+GJcm8pLBcNuPo9Bif4ZRfr5xHKZD8aTyEJrq9q96PZKKQxUzJB2GXMf9VeP44hWIkJCrzJqouoskxGSUS26jAtzLtpJtDiBx+GIBkR4HQ4DPQUJ5zZcmmAm1kC3GqZ1QVsjof60eb6htCzbC1us504GQet96PYGMoRNv1k5PBqe/cC48orrz05VLzjo08b68AnFQk86uPFx317Vk+lMae26R4SIFhdSNtbL5slRtndhFUJk2uRXRYmwXFQQ/67Wiuhm8/iTIK3ZBSVi7Unzl/s64oICYe+EmYDjPQIpwiXJotOwYtg1jOubg8zu0pQlR8xjl2nJ7a7ZuB+TVdHXlzb3kY+8nkgMz5TG0F7e+3R6wxL/NBYnojFnk7JDCIBiJgHluUIt/UFQ5eFwPYE0p3XB9+PTMkEyT4QIxSArU5sjgP3KrAZCF2tuelAdsjIk7t5GtVs4bkCnTlWnVl+qXHvEGvNlqH/nAj891/OlhU7VqRptbILgHMhVZGEhT99M+CA6jHJx/u4XAlzduRB35eHmGkHP+m8+so
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 03:04:56.8694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e86c02-aa2f-48b0-0d9a-08dc51f882df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

remove the unsed the paramter in the function
ttm_bo_bounce_temp_buffer and ttm_bo_add_move_fence.
 V2:rebase the patch on top of drm-misc-next (Christian)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e059b1e1b13b..6396dece0db1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -402,7 +402,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
 EXPORT_SYMBOL(ttm_bo_put);
 
 static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
-				     struct ttm_resource **mem,
 				     struct ttm_operation_ctx *ctx,
 				     struct ttm_place *hop)
 {
@@ -469,7 +468,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		if (ret != -EMULTIHOP)
 			break;
 
-		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
+		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
 	} while (!ret);
 
 	if (ret) {
@@ -698,7 +697,6 @@ EXPORT_SYMBOL(ttm_bo_unpin);
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
-				 struct ttm_resource *mem,
 				 bool no_wait_gpu)
 {
 	struct dma_fence *fence;
@@ -787,7 +785,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 		if (ret)
 			continue;
 
-		ret = ttm_bo_add_move_fence(bo, man, *res, ctx->no_wait_gpu);
+		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
 			ttm_resource_free(bo, res);
 			if (ret == -EBUSY)
@@ -894,7 +892,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 bounce:
 		ret = ttm_bo_handle_move_mem(bo, res, false, ctx, &hop);
 		if (ret == -EMULTIHOP) {
-			ret = ttm_bo_bounce_temp_buffer(bo, &res, ctx, &hop);
+			ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
 			/* try and move to final place now. */
 			if (!ret)
 				goto bounce;
-- 
2.25.1

