Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E329E59FD23
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA49B68F9;
	Wed, 24 Aug 2022 14:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EBBB68C8;
 Wed, 24 Aug 2022 14:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdfaOCD8UItrKdjj5smo37nBjrh0DguRBirnKQW/lTGY3q9GYdO9vmnYj08pcS/NkuVa28yO4XXXLTn9Qv4/mr+Cub9HGiM48RcV7cIINpuQ94KWIoQVD+Kz1BDDJk9u7O1I3U7AvoQ3BAIs8xT/0GllG2sDSc5qhBDdAn9CNkDVqwRku23okkah51d7CcI0jeuBISGkkbVuiCClEp+NU+FCnQUqgVVCfaFKiPj7pfNI9vOgVlKB2+zScwuGijFSprQ/jbpRVYKNlbn4fz/1H/L2oNp1i7nh7UNh55FCCProSjysc3aMOqIvP4VSilsLFoGOkhtlSaEHLYcY2xBBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNUGml4+ccRms0vJMkNK+iigsqv+QLIkHIT/N1fZb5s=;
 b=YUG1+m7FGAv/FMlLANOx0YaCWIfQGDq2HdxeMCvVD69y32HoZj/PjcdxPqJbCN6uto9UEIY8J4scauHY5sCKY+dunIGL47OF2AjR7TIxZ8eVRdSO7aj58DMIz8gTVfqCZYNUPbWjbZ+nDofddIo8U6zBM78D9zJ2vJQ+1RYEcjYXEnQapS4qLNP3I+HvfJPqwek/8RdYELSZQBdwn0R3lScX+sUKeAwormtpysih2D5YmfUJbNLRvoto5BpKaIIxTFyPwHjGTfWEmCWYwJN/CwjJV5PU83+09KHaNwBZ+clrebN6aQcltrD1ViZcP6/vtvFC/oa+Ep2EMeawor0p5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNUGml4+ccRms0vJMkNK+iigsqv+QLIkHIT/N1fZb5s=;
 b=oQ4COQ5eQUeNDzyURoB+4TtP8B4LwQMg8U4S/ceg5WW6xucKgF1fAZyZWLHyn6YjlG4/eLneElBzkLgMJTCHYaCiWRBYHwGbKiJrtPw5XcqgghyAl/7MjGfir7w7QMopQdOkxhKftFzPpHwSK67ow/xa6ZHP2S1+OMG42lvDWAQ=
Received: from BN9P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::24)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Wed, 24 Aug
 2022 14:24:12 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::96) by BN9P221CA0026.outlook.office365.com
 (2603:10b6:408:10a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Wed, 24 Aug 2022 14:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:24:11 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 09:24:07 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Wed, 24 Aug 2022 10:23:53 -0400
Message-ID: <20220824142353.10293-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.36.1.74.g277cf0bc36
In-Reply-To: <20220824142353.10293-1-luben.tuikov@amd.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2430a23f-8bd2-487f-fa99-08da85dc5079
X-MS-TrafficTypeDiagnostic: PH0PR12MB5401:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FeSZAYGa2oVidUdg8VDZYahxhGwHECLat87Qjm31EV74+bj7FB0G6A8C7624AlVAJq3XP3hQ4VUudLvfpT64IHOpVqr1OtYUoIJ7kDeTXaa4fZQpA7WfYX2a5y4xkXSEjUWJRMKI6G8ZKQjl9BnjXphWRRvgrABytRGUKZawPI329NCWOW2s/VakjzssJV9HtuAuf36TgXYE4mUEMGC4bMFxMqYVJPdqWGrK2RnJAJV2hq+t6iHYK9R8xMppfqMkLCHAYUSxcyIv5RUmtyVvPKF44HRsLtOH1UVQCT3Pga7BexlFMSGIARU7Szo/df04dpXvgdzFJMqEmLPTQEz1UqcY3Uu7cCbfKVexz8djJx0L92dsvImtCiJQlyy4CjzzT0H7MkkgjMXOOx9O8/BQSVLaN/NSltVXegFMOE7gRLHYyhr4rFMLUlcipxMBcX4KGVSpU4eKcJIAuJMUwIcoWLDwfqEL5dTx2nfhWVvO4R3ng9SVI1FkT1JX218+72y76Tcwt4idlbWDKbx6nijRmNZCTD5D54IDASoyKLhXAlNQ6rv+IL3e5RmEUwerqJ9f/BJwrQrXdBo2rfMa1v30XSyhcCblLQJmOtcNmOTOqa8mzxR7VQx4JmefKvAj/kTqkvHwtt9ytDNg68pyzagH7BIXQnER4XSto+sRv4kNCUtveAcMX6Uo68TiNirjBkQ0sO3tK+MSSvxM87uIpSnQuWuAiSoSz0QQQqK+sJZqJFhYb9ubXRec87opyYZqYrjN2ZvWiUSUJqYhwHRuChHq/hIrC8haeTCVCCQcIxb3XZ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(40470700004)(36840700001)(46966006)(70586007)(41300700001)(316002)(44832011)(5660300002)(82310400005)(70206006)(4326008)(478600001)(54906003)(8676002)(36756003)(8936002)(6666004)(110136005)(82740400003)(2616005)(2906002)(186003)(16526019)(336012)(1076003)(40480700001)(83380400001)(426003)(47076005)(26005)(36860700001)(86362001)(356005)(7696005)(81166007)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:24:11.5192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2430a23f-8bd2-487f-fa99-08da85dc5079
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

That should not be necessary any more when drivers should at least be
able to handle a move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 497ee1fdbad7bf..a1c4dc031cae63 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -607,16 +607,10 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
  */
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
-	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
-	if (ret)
-		return ret;
-
 	/* If already idle, no need for ghost object dance. */
 	ret = ttm_bo_wait(bo, false, true);
 	if (ret != -EBUSY) {
@@ -624,14 +618,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
 			if (ret)
-				goto error_free_sys_mem;
+				return ret;
 		} else {
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 			if (bo->type == ttm_bo_type_device)
 				ttm_tt_mark_for_clear(bo->ttm);
 		}
 		ttm_resource_free(bo, &bo->resource);
-		ttm_bo_assign_mem(bo, sys_res);
 		return 0;
 	}
 
@@ -648,7 +641,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -662,13 +655,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
 error_destroy_tt:
 	ttm_tt_destroy(bo->bdev, ttm);
-
-error_free_sys_mem:
-	ttm_resource_free(bo, &sys_res);
 	return ret;
 }
-- 
2.36.1.74.g277cf0bc36

