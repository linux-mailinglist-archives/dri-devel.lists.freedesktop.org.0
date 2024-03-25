Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58963889412
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 08:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8817910E665;
	Mon, 25 Mar 2024 07:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="se46aAkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736DB10E4F7;
 Mon, 25 Mar 2024 07:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaQqrrWKv6jMhDNKgiaqjIAI3/0t/l7Q21hC9RyaJ2aDxxsAUbKhdTiU8ooM+vZCMqTqNjZFKBq06Nu652Br7QEVSsf1V3Rc5zvpsW1eImL72XokC3L7poipTz8u1ASLaO2hynNaeHF15y9WbY63VugZbUG9L4Cv60sq5EfIppZcfnfNkRluKC0EenNzSWpbLhqcZtH+YDYsnrAdogGdCHMAcfu0RojbIdKvfCGuc8WUa0ujwX38VdGnSFalbZeteEUcyovZRg5X2pQzyVTP2HM0DyEOp/Srfy8ZHkrygfxVMqwf7hNhHlv6u3rI3MfmbYJR8l757jcC2QS/oJZ71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ylr3GqeiuxXsC2VL0ECVYcJBRyFMuQubbJv+NwKx2b8=;
 b=Mn2hdkDXSVNuXud2WhmMCRew22l0RqD9L1fhDUuYs/2FJYkxHhMdFnt1R7yM5kjpv5lcqAtSoQCVfceUcD3+oJUaEn8gNsDxqDo3Mn8VVBV7MYXQs5xU+Zc45XbdPMQP4O9EgcLIC7g1WoBhN0DKtq3JtJlDO76RgzTRyr4yCFhtjCpgz8re6kfgH/0hVsVh/GTcwXP7Gmvr0othsC/Rv/a81LSvIhog3ZUrnGx45MUmlB8lfTziyafnHfkgASah5deFVv2CxtjNkxsACfs5k3P0PcyE7FJI2MUgUdJ0ZvebnJStB62uCXbgQIF+ZFnkpt6D+ONEsBCp0VDejFCG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ylr3GqeiuxXsC2VL0ECVYcJBRyFMuQubbJv+NwKx2b8=;
 b=se46aAkvTolbFZ5/mPoj5ru0nunqchXmX1aIsPMg/c1SmyZRkv7vnt+c2prcaNQwNP3/CAPbnNbprbaFMY/L1nn9PIl99pdnD67PPrRAUc5ErwkLmqaoj26AMtX0akwlNrEdt/UFiAiUkYgEnSXQtl7JV0eIMGltRikNDUy5q+Y=
Received: from CH2PR18CA0052.namprd18.prod.outlook.com (2603:10b6:610:55::32)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 07:45:55 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::87) by CH2PR18CA0052.outlook.office365.com
 (2603:10b6:610:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 07:45:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 07:45:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 02:45:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 02:45:52 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 02:45:45 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH] drm/ttm: remove unused paramter
Date: Mon, 25 Mar 2024 15:45:40 +0800
Message-ID: <20240325074540.2426476-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6cf5a-7fca-4f33-41cb-08dc4c9f9a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9id76sDrQVai8acDqYsGlc8e+Hxfr6ZgohQEXmuHxyLcmbVBsgbZ6nSeVHRG+TyDZ5yeV9tXT8MHs3SFkQKz65nNMXAyDKD2j4iy4v6G3IjfrWwPAUQuAAcZ5MJQ1wklkS2lSXahp7lB4UpjIbOzYH/VxZuL/F4zyU6Q7MQHt5jt/rbONAJEdf9lkjlOS1X3Ez8hKcG3WF0jbLivIL9Wsxv/3Ue4EWAtAqQurZQUPGFIElYc5kGY6coytGn8BEtlh5bFSHJ91N0QKCG3gI8vFm5jfHQqB89WBT6PWLydopHSrnBibj6DwRp7dUHRk2ZA7sk7M+PD0r/vq6OqWBiRcH5rXPYVlE7LoTW8rgnsjWIzcB5J2Vsix2b78A+Uc+H50n0RPkG1+yyWtOixJuVwHnuQUgB0woqk4wwVoqoo1X3ZRJ49TjJOjCYcw3AgENgt/4eSmaGL8fmNBKa2pBdLoe2u08zkspvLJ5anriE2pp/EvB8mSKkDr0wPDInx2wS3A78Ve8u4/OWzHuRXX/G1gPAhvbzT1RtJbleoRyTS1w7g8OO17mIdyI1t+898HdMhV76ZI5v88pg/6CNe2OBNb9l32RnKB8t74J1c3QActYD91SIC/hxgKztPgeXRRfSU1dHOnwv9Ff5m8FdVBAF0cZm/AY7PX5i+EWtALeEmG+RO7X85REQLrL5uaUqXcs3SjwNDy2MpynYbYBd3ko38NnM/S5K83TGtqZ4afMVoiZQ9RDH2z7cg2Bzig/MyFqxt
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 07:45:54.6624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6cf5a-7fca-4f33-41cb-08dc4c9f9a04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003
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

remove the unsed the paramter in the function
ttm_bo_bounce_temp_buffer and ttm_bo_add_move_fence.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b..7f08787687a7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -402,7 +402,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
 EXPORT_SYMBOL(ttm_bo_put);
 
 static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
-				     struct ttm_resource **mem,
 				     struct ttm_operation_ctx *ctx,
 				     struct ttm_place *hop)
 {
@@ -470,7 +469,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		if (ret != -EMULTIHOP)
 			break;
 
-		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
+		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
 	} while (!ret);
 
 	if (ret) {
@@ -699,7 +698,6 @@ EXPORT_SYMBOL(ttm_bo_unpin);
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
-				 struct ttm_resource *mem,
 				 bool no_wait_gpu)
 {
 	struct dma_fence *fence;
@@ -753,7 +751,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 			return ret;
 	} while (1);
 
-	return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
+	return ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
 }
 
 /**
@@ -802,7 +800,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		if (unlikely(ret))
 			goto error;
 
-		ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
+		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
 			ttm_resource_free(bo, mem);
 			if (ret == -EBUSY)
@@ -866,7 +864,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 bounce:
 	ret = ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
 	if (ret == -EMULTIHOP) {
-		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
+		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
 		if (ret)
 			goto out;
 		/* try and move to final place now. */
-- 
2.25.1

