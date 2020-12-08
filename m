Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E92D330C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 21:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3DA6E9B6;
	Tue,  8 Dec 2020 20:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0C6E9B6;
 Tue,  8 Dec 2020 20:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR4ww4JRxS3Qf3tD2FAbVPIGtoljZiFqnxdFBN4ssKr7bSHu/RXs9ASJ10PbHAzWIStKKDal33TgLCFcDv/H/H+gOEIrC6BrM4VMvHc8VMxi7HzhPUH/VeaY7nwSmmqqrMKgUiAHc9725HCZTzKmuWotnblgvpVEDFMAfJOB3rcR8tFFgDJbsxCHtSkJXp1TW9sBYhX51/J7EQHWFbxAdUQd9MAvfRhvW7LAKs5tGq3ASxCjlb0ZCREeWf1Qs9RtK5MgF/VREpc4YNx1uH6ScZaXZuufjwD1Q5cMAmd9wXpWgVa9aNkvRXmWIcIita+QzXpcXLjx1ta3k2TEwncyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX+vyPS8I7+reRtmr8wBh/1J5cMy9h4nvE3ctEi2IAM=;
 b=Kjm7K0cm5GLotmgVP1sSNVLQo5yf74IXy3ttme1GyZxpd4DY4bRnAkH7jnp+QcuGVu/DcxQbIhUXx3CleI2yCkXgWH989kd1Nw+hn809+I4q+AdJ5YddGOQD1qoqQUdx5IhEc0/bX7X4ae1nH6Xi/LS43yjmz02UeGk9sLxHgxAjxilW0vCAjd6PFS0SAa7A0y9XUUtg/YJdCJBmyoaJt3/swDdI3fms5s7ytTUgw7CRPs9ZzOLJJkG8pO+3cqHaVzDiKtYFIXCjo5AOqFoDY7pZ8OTlmxDskO4yU0f/xzj9b53E4JgnoTZ7eREdqhw4MlWJe6wxKWRZikR/Ghbc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX+vyPS8I7+reRtmr8wBh/1J5cMy9h4nvE3ctEi2IAM=;
 b=uPb1dyr/oJ5TqNeiUlzrPZX2ckonJDAyIKNv/zE7Whmw9PPR9FyBXrPFXNm2mbQSGrEhR8odzlS9zMHgqZ6+Y/Trz8niYS8e6XZFIiVnOeIRHk8LddlZwzELckzylhP2rkYaTKlYnQR28vWosysfdH/hw7nRE3yksLcoKIXR2qk=
Received: from DM5PR16CA0004.namprd16.prod.outlook.com (2603:10b6:3:c0::14) by
 DM5PR12MB1227.namprd12.prod.outlook.com (2603:10b6:3:76::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Tue, 8 Dec 2020 20:16:21 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::e7) by DM5PR16CA0004.outlook.office365.com
 (2603:10b6:3:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 20:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 20:16:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 8 Dec 2020
 14:16:18 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 8 Dec 2020
 14:16:18 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Tue, 8 Dec 2020 14:16:17 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for
 imported BOs
Date: Tue, 8 Dec 2020 15:16:15 -0500
Message-ID: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d879e008-bbd9-4b37-19c0-08d89bb620f1
X-MS-TrafficTypeDiagnostic: DM5PR12MB1227:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12276B0DCBCD0DA808B5C452EACD0@DM5PR12MB1227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cI0YoJF8yAq6lajX2WzTGhc9/oHrWRZoqkNV9xGepZ2qAAEXrosyZI0uCXnikhXGVFi07+Q6jbY38M392ArgqnUn60tuYhd/LW9udTQ9fhdUvM7n5pUeOYnRUGV18bi9Z5spcrd0dNNqfe7eryfOMY5vtWUJAYMkQ7TcVLIFQwOId8cKKF6O+ukvLHtksQtNKc0hZ4DVanWfntSOlZzLKOd5BdCB65EnLbQajl1B37qDpo33cHyHlpvu4DnZgDAHZm9ex9PqlmKPwJnJmro1eENWJjLi9fq93nisDd8hG/ncL8vgt/n49Rfnw9GByf09Ngh848OzC/Xk9ezCzo9sWrFVtREL1W75qaHoIV/kBhPhZBc6DglLcJcvxkUNSkO8j0Erd3STMuMNq0Z1I3RqZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(46966005)(82310400003)(54906003)(356005)(70206006)(2616005)(44832011)(2906002)(86362001)(186003)(70586007)(336012)(4326008)(508600001)(47076004)(5660300002)(8676002)(7696005)(36756003)(8936002)(81166007)(6916009)(426003)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 20:16:21.0910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d879e008-bbd9-4b37-19c0-08d89bb620f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1227
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com,
 tzimmermann@suse.de, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For BOs imported from outside of amdgpu, setting of amdgpu_gem_object_funcs
was missing in amdgpu_dma_buf_create_obj. Fix by refactoring BO creation
and amdgpu_gem_object_funcs setting into single function called
from both code paths.

Fixes: d693def4fd1c ("drm: Remove obsolete GEM and PRIME callbacks
from struct drm_driver")

v2: Use use amdgpu_gem_object_create() directly

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  8 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 41 ++++++++++++++++-------------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e5919ef..e42175e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -424,6 +424,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_bo *bo;
 	struct amdgpu_bo_param bp;
+	struct drm_gem_object *gobj;
 	int ret;
 
 	memset(&bp, 0, sizeof(bp));
@@ -434,17 +435,20 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	bp.type = ttm_bo_type_sg;
 	bp.resv = resv;
 	dma_resv_lock(resv, NULL);
-	ret = amdgpu_bo_create(adev, &bp, &bo);
+	ret = amdgpu_gem_object_create(adev, dma_buf->size, PAGE_SIZE,
+			AMDGPU_GEM_DOMAIN_CPU,
+			0, ttm_bo_type_sg, resv, &gobj);
 	if (ret)
 		goto error;
 
+	bo = gem_to_amdgpu_bo(gobj);
 	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
 	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		bo->prime_shared_count = 1;
 
 	dma_resv_unlock(resv);
-	return &bo->tbo.base;
+	return gobj;
 
 error:
 	dma_resv_unlock(resv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index c9f94fb..ccf4d80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -70,26 +70,12 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 	bp.type = type;
 	bp.resv = resv;
 	bp.preferred_domain = initial_domain;
-retry:
 	bp.flags = flags;
 	bp.domain = initial_domain;
 	r = amdgpu_bo_create(adev, &bp, &bo);
-	if (r) {
-		if (r != -ERESTARTSYS) {
-			if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
-				flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
-				goto retry;
-			}
-
-			if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
-				initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
-				goto retry;
-			}
-			DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
-				  size, initial_domain, alignment, r);
-		}
+	if (r)
 		return r;
-	}
+
 	*obj = &bo->tbo.base;
 	(*obj)->funcs = &amdgpu_gem_object_funcs;
 
@@ -239,7 +225,7 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 	uint64_t size = args->in.bo_size;
 	struct dma_resv *resv = NULL;
 	struct drm_gem_object *gobj;
-	uint32_t handle;
+	uint32_t handle, initial_domain;
 	int r;
 
 	/* reject invalid gem flags */
@@ -283,9 +269,28 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 		resv = vm->root.base.bo->tbo.base.resv;
 	}
 
+retry:
+	initial_domain = (u32)(0xffffffff & args->in.domains);
 	r = amdgpu_gem_object_create(adev, size, args->in.alignment,
-				     (u32)(0xffffffff & args->in.domains),
+				     initial_domain,
 				     flags, ttm_bo_type_device, resv, &gobj);
+	if (r) {
+		if (r != -ERESTARTSYS) {
+			if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
+				flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+				goto retry;
+			}
+
+			if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
+				initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
+				goto retry;
+			}
+			DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
+				  size, initial_domain, args->in.alignment, r);
+		}
+		return r;
+	}
+
 	if (flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
 		if (!r) {
 			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
