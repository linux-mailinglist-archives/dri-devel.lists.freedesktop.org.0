Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F42DE1E3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 12:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7946E08E;
	Fri, 18 Dec 2020 11:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54926E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 11:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3iSmOAbbQgG3OY8L8S1jAC77FJb4HwGkzBXYsAYGT0yEMiHEoXf4C5HSCcVY6TWaUuPqFFt+h/B+VmRYd04+jRZBMz7hYwLE5xGJX99Yh3Xp69EF6DRLw/kI6vF8jT45FVHbk2z4ILQqvwXW5SDLkRq8ZOwnekyz+BG7LWbcK214eTqVNbrE20tJ3XN8w1feMKu6DgiZYXmeSxHQQUuW1gspQDAL/HtiS+TR4JwcGD1NDWvWXDFQRViUVEtbdALvnAiXRfcjrFsCOazNrwb4xZ0DtTmr9/Hwc7sD6mQco/Da00PfxMakAC4wWCJM6RKFQvV5eH7IIAiNj6q1y+SbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc7Zw77IGhv+Sc8aBVpgB1TB63ND5l0i1U3E1a5D8D8=;
 b=jgRC1PRqqw4VZUZuAvYX9ZVW3i87O5ZMTRZKgpuZzXAZUqtogITH3Li+W5K1wWvf0btYZv+GKJYIUzxIDw1ph1Yg3efbRjIaroNT4cU5qZ9z9cNOUzt2qoNXxKIxM8HjGqgxT2ZUiaB/MrD0qnbVsHtiFGKuX09NOmPvZWm5JauN7/A5tYqge1pm3/Fj1W71b6lrp6He3d/A9SFhJo3UwdHzg9IZ/b0gYQh4t20V4Zre7Wt8rallmuoizu/hXHaRR4YasLZd69X2VkOEjtLhXwf2mi/S7m4CIBKNIp0YOlPDv0fX4B2LE6bHByDJmaKirF++nl/73mtU2NmwVplTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc7Zw77IGhv+Sc8aBVpgB1TB63ND5l0i1U3E1a5D8D8=;
 b=C4CdaOGwOrs5D2xHYclAHVj4YwL1bHncMI4YH3R4W4V5sONeqZQsmsXobxjmU6cXZTOuz0ofij+J+LBMTsIx1HZyR4WoGrX2oP12l9QF4TngKUXCo0ZbkyaNzq5BqseSEwEyCnaiPhfMyJkeahmWAMfSYF2mkG2ycY5WbR+Fwno=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB1721.namprd12.prod.outlook.com (2603:10b6:3:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 11:21:34 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e%7]) with mapi id 15.20.3676.025; Fri, 18 Dec 2020
 11:21:34 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/1] drm/amdgpu: cleanup vce/vcn selftests
Date: Fri, 18 Dec 2020 12:21:10 +0100
Message-Id: <20201218112110.12338-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [93.229.45.20]
X-ClientProxiedBy: AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::44) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (93.229.45.20) by
 AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 11:21:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5cddf0c-0ed7-44b5-ef7a-08d8a3471415
X-MS-TrafficTypeDiagnostic: DM5PR12MB1721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17215D8E8F231B21EDDFFC4D8BC30@DM5PR12MB1721.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YGHUOoEoLGkTfU2NN6+ShNcdbNm+YRhTayWNFycFi7hPAM9vmkOI+DYfvN5UYfMaUsXLzW1H9NcRIsemKx3sKyKk1NAvDiQEnOX29ArAqCKr8XZxght1g2IW2JFY5R+RA7nu3qg2aB5DhYOzAOzU0pcvMln5OCr+eUus9/rpp9mtPHyPGtskZx+iQPVr2pFOzuN9Gad8a6DmT2uGAkSeg4Q2PyXBNFlOZ0xIfbyl9KxGc9YSaoALOv54ZGpRgELOZYHebpd4xiVFHQQUKLi4s5UGe/Xho4dxIWAIsiVrqc60vKKCZ2iGCV32LnT/ixlZzQEZLrMTUa5Ol1swqMYZPLQZRYeGOhcImqnEDokPzqJGRTHzzTiVo/Zu43FnUYOfkinNlsii5BpP9FpUUeGNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(6506007)(83380400001)(6486002)(186003)(16526019)(36756003)(2906002)(8936002)(86362001)(478600001)(1076003)(6916009)(5660300002)(66556008)(66476007)(26005)(316002)(44832011)(6666004)(66946007)(2616005)(956004)(6512007)(52116002)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k8ZF5u2/CsKF8VPePbUMSWNVDL0EYt5m82mW1EpoYNmDoPsj/x5Qm0hVexOA?=
 =?us-ascii?Q?mF/c/mp5N9LzEr0gqirScSjPK156k81BOBp49rD/cx08oepgAvXVv36Hg5T7?=
 =?us-ascii?Q?OJ5ldB59+SsRN5UEMUeapIDTSmTQDVEvKtqU5OS/ELYL7lSDX3wm0fs1FhY0?=
 =?us-ascii?Q?ls01SsZIGasltRpVDcnSnFvDx0YQPBv+P1UTW1aC6D2VF//kk7og678gN1Qd?=
 =?us-ascii?Q?lP8X/bBAkeXftjDgmeSm2Et5lpynC/rcz1bHZjbRUgm0xYyj4YvOm+b70L71?=
 =?us-ascii?Q?qKpNDOP6IMRj/0cYTIy1XWQ4rGD8n9mshJHpbx7C0pLGGlsPiineRrPhoK6P?=
 =?us-ascii?Q?JfAOPE53rwwQ9j/ybpe0PZX3gu9XB7Pu7sLF5kc6mYyUHATNkSWTeK4VE5S4?=
 =?us-ascii?Q?7KpPK9yyO4F9PSAuIZWpuwpVG5G8O41xbCzpn8Wa+jBOupc8omPOGrLG3s5q?=
 =?us-ascii?Q?2y0NuD7kbn/OWJY9xcrG841eefzM0sqkFiQrS0sLAOQ4f97E4M/SvMVvCWLj?=
 =?us-ascii?Q?IGM/1Kfr+8qCVk/9HLCJPMZPM6/0ekm8w7rluwG2qHkK69KnK+/ly0SGT1IK?=
 =?us-ascii?Q?wGqt0To4CmYXkKqJ3fkqJYPkA1pnGJnv/LeShqhM6x3UkoUeZHTmtv+Ng/1p?=
 =?us-ascii?Q?zkxj5aHfNeyo4lEMYFJmbcH1nUbLsophKBy49pjaArTjRHd1uQWtrk76IdN1?=
 =?us-ascii?Q?SSQ6XtUZltsCNB2ODYciqKbBRsU47VcHSJf9XWoNHfXHM+6J36FHhdbFQ+rr?=
 =?us-ascii?Q?CEHeyqdA2Xu+8G6jf4L/sC51aiVYlWhTnWGgq2DFn2wmE3c4Aj9xDiNX+s7J?=
 =?us-ascii?Q?DZFZE86N0+xQBJm45jkCDCwtz3pmxP1hIAKIbxGqwS66Q8BPYzE2DfMzCo3n?=
 =?us-ascii?Q?f7ESemiUEXJt4UuogQS/dETUjzohATJq2vmOvZCDtDTCuFWLWfWXNNqLgGWp?=
 =?us-ascii?Q?zz1wla5gW/9JD4tNsooUhQIstvYPz17Ad0VsioBznDusSXySFPIixV3V2zqO?=
 =?us-ascii?Q?AuVW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 11:21:34.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cddf0c-0ed7-44b5-ef7a-08d8a3471415
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qF4amlKdZOfhfD+WLn4Nw6Izqt+j3obxd6BU0+wFSqs7kVVkWSOQWOvQ3cmZYtRfkKPhetnCJ1P0f0kyw8O4aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1721
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, Christian.Koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use amdgpu_sa_bo instead of amdgpu_bo.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 17 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 47 ++++++++++++-------------
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 0d5284b936e4..bce29d6975d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -81,7 +81,7 @@ MODULE_FIRMWARE(FIRMWARE_VEGA20);
 
 static void amdgpu_vce_idle_work_handler(struct work_struct *work);
 static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
-				     struct amdgpu_bo *bo,
+				     struct amdgpu_sa_bo *bo,
 				     struct dma_fence **fence);
 static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 				      bool direct, struct dma_fence **fence);
@@ -437,7 +437,7 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
  * Open up a stream for HW test
  */
 static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
-				     struct amdgpu_bo *bo,
+				     struct amdgpu_sa_bo *bo,
 				     struct dma_fence **fence)
 {
 	const unsigned ib_size_dw = 1024;
@@ -454,7 +454,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 
 	ib = &job->ibs[0];
 
-	addr = amdgpu_bo_gpu_offset(bo);
+	addr = amdgpu_sa_bo_gpu_addr(bo);
 
 	/* stitch together an VCE create msg */
 	ib->length_dw = 0;
@@ -1130,16 +1130,16 @@ int amdgpu_vce_ring_test_ring(struct amdgpu_ring *ring)
 int amdgpu_vce_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 {
 	struct dma_fence *fence = NULL;
-	struct amdgpu_bo *bo = NULL;
+	struct amdgpu_sa_bo *bo = NULL;
+	struct amdgpu_device *adev = ring->adev;
 	long r;
 
 	/* skip vce ring1/2 ib test for now, since it's not reliable */
 	if (ring != &ring->adev->vce.ring[0])
 		return 0;
 
-	r = amdgpu_bo_create_reserved(ring->adev, 512, PAGE_SIZE,
-				      AMDGPU_GEM_DOMAIN_VRAM,
-				      &bo, NULL, NULL);
+	r = amdgpu_sa_bo_new(&adev->ib_pools[AMDGPU_IB_POOL_DIRECT],
+			     &bo, 512, PAGE_SIZE);
 	if (r)
 		return r;
 
@@ -1158,8 +1158,7 @@ int amdgpu_vce_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 		r = 0;
 
 error:
+	amdgpu_sa_bo_free(adev, &bo, fence);
 	dma_fence_put(fence);
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&bo);
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 4a77c7424dfc..ae4a80724ce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -488,7 +488,7 @@ int amdgpu_vcn_dec_sw_ring_test_ring(struct amdgpu_ring *ring)
 }
 
 static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
-				   struct amdgpu_bo *bo,
+				   struct amdgpu_sa_bo *bo,
 				   struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -504,7 +504,8 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
 		goto err;
 
 	ib = &job->ibs[0];
-	addr = amdgpu_bo_gpu_offset(bo);
+	addr = amdgpu_sa_bo_gpu_addr(bo);
+
 	ib->ptr[0] = PACKET0(adev->vcn.internal.data0, 0);
 	ib->ptr[1] = addr;
 	ib->ptr[2] = PACKET0(adev->vcn.internal.data1, 0);
@@ -521,9 +522,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
 	if (r)
 		goto err_free;
 
-	amdgpu_bo_fence(bo, f, false);
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&bo);
+	amdgpu_sa_bo_free(adev, &bo, f);
 
 	if (fence)
 		*fence = dma_fence_get(f);
@@ -535,25 +534,27 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
 	amdgpu_job_free(job);
 
 err:
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&bo);
+	amdgpu_sa_bo_free(adev, &bo, f);
 	return r;
 }
 
 static int amdgpu_vcn_dec_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
-					 struct amdgpu_bo **bo)
+					 struct amdgpu_sa_bo **bo)
 {
 	struct amdgpu_device *adev = ring->adev;
 	uint32_t *msg;
 	int r, i;
 
 	*bo = NULL;
-	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
-				      AMDGPU_GEM_DOMAIN_VRAM,
-				      bo, NULL, (void **)&msg);
+
+	r = amdgpu_sa_bo_new(&adev->ib_pools[AMDGPU_IB_POOL_DIRECT],
+			     bo, 1024, PAGE_SIZE);
+
 	if (r)
 		return r;
 
+	msg = amdgpu_sa_bo_cpu_addr(*bo);
+
 	msg[0] = cpu_to_le32(0x00000028);
 	msg[1] = cpu_to_le32(0x00000038);
 	msg[2] = cpu_to_le32(0x00000001);
@@ -575,18 +576,19 @@ static int amdgpu_vcn_dec_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
 }
 
 static int amdgpu_vcn_dec_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
-					  struct amdgpu_bo **bo)
+					  struct amdgpu_sa_bo **bo)
 {
 	struct amdgpu_device *adev = ring->adev;
 	uint32_t *msg;
 	int r, i;
 
 	*bo = NULL;
-	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
-				      AMDGPU_GEM_DOMAIN_VRAM,
-				      bo, NULL, (void **)&msg);
+	r = amdgpu_sa_bo_new(&adev->ib_pools[AMDGPU_IB_POOL_DIRECT],
+			     bo, 1024, PAGE_SIZE);
+
 	if (r)
 		return r;
+	msg = amdgpu_sa_bo_cpu_addr(*bo);
 
 	msg[0] = cpu_to_le32(0x00000028);
 	msg[1] = cpu_to_le32(0x00000018);
@@ -603,7 +605,7 @@ static int amdgpu_vcn_dec_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
 int amdgpu_vcn_dec_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 {
 	struct dma_fence *fence = NULL;
-	struct amdgpu_bo *bo;
+	struct amdgpu_sa_bo *bo;
 	long r;
 
 	r = amdgpu_vcn_dec_get_create_msg(ring, 1, &bo);
@@ -633,7 +635,7 @@ int amdgpu_vcn_dec_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 }
 
 static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
-				   struct amdgpu_bo *bo,
+				   struct amdgpu_sa_bo *bo,
 				   struct dma_fence **fence)
 {
 	struct amdgpu_vcn_decode_buffer *decode_buffer = NULL;
@@ -651,7 +653,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
 		goto err;
 
 	ib = &job->ibs[0];
-	addr = amdgpu_bo_gpu_offset(bo);
+	addr = amdgpu_sa_bo_gpu_addr(bo);
 	ib->length_dw = 0;
 
 	ib->ptr[ib->length_dw++] = sizeof(struct amdgpu_vcn_decode_buffer) + 8;
@@ -671,9 +673,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
 	if (r)
 		goto err_free;
 
-	amdgpu_bo_fence(bo, f, false);
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&bo);
+	amdgpu_sa_bo_free(adev, &bo, f);
 
 	if (fence)
 		*fence = dma_fence_get(f);
@@ -685,15 +685,14 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
 	amdgpu_job_free(job);
 
 err:
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&bo);
+	amdgpu_sa_bo_free(adev, &bo, f);
 	return r;
 }
 
 int amdgpu_vcn_dec_sw_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 {
 	struct dma_fence *fence = NULL;
-	struct amdgpu_bo *bo;
+	struct amdgpu_sa_bo *bo;
 	long r;
 
 	r = amdgpu_vcn_dec_get_create_msg(ring, 1, &bo);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
