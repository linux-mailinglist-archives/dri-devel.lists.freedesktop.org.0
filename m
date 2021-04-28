Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6136DAEC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9076EB57;
	Wed, 28 Apr 2021 15:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431516EB56;
 Wed, 28 Apr 2021 15:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFwRuG5tkViwEfW4DPgxupIF+9EaPw2KvL7exd/wz3z5kWl6b2o3jQ1Q5E7ZgpU93XL2UCKU7TsoO3RiR+1XWp3+sjbXlt9rylXUKsFjspy/YHVMPLeZazgzvNmQWgn0EeE0wbBrB8ksgUQ+to4ndEMRGPa28Y6wLWIynyA7B89qZBM4l3ZOzQAobdyCntDvzdt5IHJ3wqnfb5ZMvxT4Leb5l8MSybV0mcVB99DX/KjQX+u/0Yf3dUHL6e3ZGKBo020KSvwJh+1dqF/UcnRpVjyn+V82er/d1rKzETFPEpNAOZ2Ouz1OGM3sDZtiCbrjE9zgxnxntsgapTQZWBFYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kl0aLQAmNahoOIDFtRxdbIzMVzZ6VQMzp8rC5XcQuQ=;
 b=hRkuR2tNeCqShA2L/r+LwoH/jv4RccJvIsnQ9dcPXUgcasor9JjzgWUVD9GtkOaW5uB7l++bhLYA3xdXduj6HoIEwGKTf5SsD+48+Wola9rMvQU5zGvVOabM7vro0TQcpsd0h/OtL/lJrl3UMHUqWhIsPy3ubUk3jwzOKCD75hjvNKgzzKEVDXVFTpdcIuNDD69xQ6dXy0BuGKXXu0pK/WTq0YCo2LCxHg6g4jfmN0cqPjiYPiJT2IaxE5sU9Bm8PKwZliYtv58pS0MVlB9rlgdRYwYQcnlj8bULOcpbLfCurzD1yD0vF4cAin0we6H1g3rjlgZWKuNJOYzbpaCZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kl0aLQAmNahoOIDFtRxdbIzMVzZ6VQMzp8rC5XcQuQ=;
 b=i2ucHVk2Epuy1kTta89dpRqxHts+hGnN8fTxneM/wOYUpY5a72rMsgw65WIt6fIGIwkXXUltu1BOEDzSP+pUpKgG7NVzjwyYe66PR3LCZGt7IU9moE35ehsFDEXoqCAoTcvvZKk8MHOywVwSWGS5Roms+QXwRjZihU/abG47GO0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:41 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:41 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 05/27] drm/amdgpu: Add early fini callback
Date: Wed, 28 Apr 2021 11:11:45 -0400
Message-Id: <20210428151207.1212258-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0fc8a25-58e5-4a7a-95e0-08d90a58111c
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462B91FC19B272AC66615B1EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qL7hocYNB6vrMdupSfiC6WWT25F4GgtMoowe8B57imH2uKW8CFvEcfEMTD2Tm8JlZ+dAcek/prPVjJ8P4wkZEeN5kJPHimS9hjGjuDdnm7IWWGlV2yNC49d3Mpn2uP5Rz2KlVtv3i7C+eD+BizWeCM1HgReQSKzXOz4eV5IR1IOQI0/jWm2TG14bpTEcaZNpMnfJD40OqzO+B/3MVOeLeyrPP88Eyd/RpcTBkxIuujIS1FJAbIHMCMavC2fy4MJzQe9RnkfPA8gMwyF07kwEyZf4xztq3H5Bsc57eyhp5RmSyufMkQg65UENZS1AnH3g0HSyRppMOjlRcShpkryhii404Mp1o1P5zEH6g01Ooa05AdY95rcVJdvRRCI9pxHTJhqryZU74ZsxZ02zDchxxMOUUcBRg6KmeE802B/mJVYhLz2KebWp+1clV8MBUFQFDnOYVilcrZKdGBAGYWTjC8/16mQWgzap0lnqenxiCb0myRxwUlsjgaswUgWbGjK/FEsg+oKRpgDQVo4FRZSt/69HHAJ887lKTRmcgF1nCz8ToegQGFS0HcI+iH4yq4wPuacLvu0UL3mYXdKNz7uJhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JFeIrK+G8d8IYM7zfB0yaUZyh26Uq86Afb1MaPSyEhJQZK607Ew/JNrpxGdb?=
 =?us-ascii?Q?FrYytUIT81vH+cFG7icQIAFfzo5VNbaOVQ6iKjV01WhhOnoa0IBgNXD7YpfN?=
 =?us-ascii?Q?hH+jis5HjPsJhhhx1xfUKUU4vdVTKs6VXTwRsWrLyQjE39afSQnaUUwZ5L5h?=
 =?us-ascii?Q?6Yeh4z8ApUy0/lyokX1zlxRjoK7amkcoxrUOYm7/4V1WxxKLgE2ezp37jVnm?=
 =?us-ascii?Q?A4+YQGfq/s3LR0g5mCAEBML/f8cB2GUsPac3zUYqthCQE+J2dVJB3Bk54K+u?=
 =?us-ascii?Q?bZLNfov5O85Y5XjTn5co/0VWXi4zyMcTysGufJPWrSgK2gJkdqNIp7AYSwiH?=
 =?us-ascii?Q?4hQhGOqu8ou8YHmx3YFWqX4JGl7vtVJf+FaQSGnzLrjM8Rt6BDLFkFHNZQdE?=
 =?us-ascii?Q?5MNzRwPAnO0SD58jEntdJske7wKd849DJt+qzDhnGmeyCVZAqeyDGHdBJsTs?=
 =?us-ascii?Q?J7++Ge0ARd8l5U3csjYIkRn8eaQf5KB4DgL5LOwGokqXhLRyMH9W/HWBcGRg?=
 =?us-ascii?Q?z307E3ZaOZQYqQmDordilh0VPnQB+0DriQh8vwSAoaOR87Y/lloJKwRQZeEd?=
 =?us-ascii?Q?bJQurvZ0B/hW+3dTfYE8MGqfXWWOM09oBAwXFbGPtRbqvp/Yk4mxzptPvBvr?=
 =?us-ascii?Q?gDP6sUpxGYpqiYVNSEFbJjl6VG1RzlHwywhv0KmwtiOOa5ASqN4WcoqszaYv?=
 =?us-ascii?Q?c5w1iGOMm08SUTOO2m+S/doBriOFmAIeqdEIo0+1ukikVC/rjPUryTh1pyVK?=
 =?us-ascii?Q?ypSTftBBNWOD+O7OtiLIbBFnovMYmXWTeIK4pz0xE0JeVlDGohHwmhyc15ng?=
 =?us-ascii?Q?+fpGWhs9F1OUpDS8Y/9uxNFV2VnvS3dEhtkgYnYWoBA/Z2mwABqXz6g6++2d?=
 =?us-ascii?Q?glS3/C8ZCOi/h1QJl2ojCIG3zSAasSfa+uX7bK5qxbJPGpRiFbWLXZ8nK0p9?=
 =?us-ascii?Q?r3Ymn5bKH43fmGu/t/rUiaYjZHzVcecUj9CZiFUqP5Lb1QPEWwNnr32ariIA?=
 =?us-ascii?Q?VbkmctURLG0SxCg75LvZe57x7aopfM9wYn/EWL7MlmnuE0kO8yfayAqGQacz?=
 =?us-ascii?Q?OLI8TQXFFek3mLO0nDoXVIVgPjZ0i3gVLZ/dJpN6SBzLe/tcOALxckS80B4V?=
 =?us-ascii?Q?n2eWSCbkGIR4w4cuWeiS1ttveSZdd5Z2XzgZaXzq6YT6ynIc6P9P3eobrqv1?=
 =?us-ascii?Q?dKXpS7NQ6DcWvO6sRgQ46Y8x5WTeg8DrqT6etLhYEoRlEihl8tewrCZMVf9q?=
 =?us-ascii?Q?Xb1jNXtpjozZhM0pK906DX8PHATtF1B/ACiZ1wUmsKqJ2w6v+ERRq+WzWi1o?=
 =?us-ascii?Q?GkpQq3PlfoUXSEzKNZ4X0B5CduEdvSSvoMW4q9CdT5Zt1I6XTCvm6LRICahw?=
 =?us-ascii?Q?PbpjKoYnMjK/tVUpaVhou90FID8t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fc8a25-58e5-4a7a-95e0-08d90a58111c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:41.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kI4PxMbOtOqC2go+6ZkktfQ/M22LZcgUocW4HbRFhdN1EUSvA/7gvl+6tqFoXKgsN2ODP5pfHz2DdyunPi/Ixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use it to call disply code dependent on device->drv_data
before it's set to NULL on device unplug

v5: Move HW finilization into this callback to prevent MMIO accesses
    post cpi remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 59 +++++++++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
 3 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8d22b79fc1cd..46d646c40338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2536,34 +2536,26 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
- * amdgpu_device_ip_fini - run fini for hardware IPs
- *
- * @adev: amdgpu_device pointer
- *
- * Main teardown pass for hardware IPs.  The list of all the hardware
- * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
- * are run.  hw_fini tears down the hardware associated with each IP
- * and sw_fini tears down any software state associated with each IP.
- * Returns 0 on success, negative error code on failure.
- */
-static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 {
 	int i, r;
 
-	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
-		amdgpu_virt_release_ras_err_handler_data(adev);
+	for (i = 0; i < adev->num_ip_blocks; i++) {
+		if (!adev->ip_blocks[i].version->funcs->early_fini)
+			continue;
 
-	amdgpu_ras_pre_fini(adev);
+		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
+		if (r) {
+			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
+				  adev->ip_blocks[i].version->funcs->name, r);
+		}
+	}
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
-		amdgpu_xgmi_remove_device(adev);
+	amdgpu_amdkfd_suspend(adev, false);
 
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
 
-	amdgpu_amdkfd_device_fini(adev);
-
 	/* need to disable SMC first */
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (!adev->ip_blocks[i].status.hw)
@@ -2594,6 +2586,33 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 		adev->ip_blocks[i].status.hw = false;
 	}
 
+	return 0;
+}
+
+/**
+ * amdgpu_device_ip_fini - run fini for hardware IPs
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Main teardown pass for hardware IPs.  The list of all the hardware
+ * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
+ * are run.  hw_fini tears down the hardware associated with each IP
+ * and sw_fini tears down any software state associated with each IP.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+{
+	int i, r;
+
+	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
+		amdgpu_virt_release_ras_err_handler_data(adev);
+
+	amdgpu_ras_pre_fini(adev);
+
+	if (adev->gmc.xgmi.num_physical_nodes > 1)
+		amdgpu_xgmi_remove_device(adev);
+
+	amdgpu_amdkfd_device_fini_sw(adev);
 
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.sw)
@@ -3624,6 +3643,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
+
+	amdgpu_device_ip_fini_early(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 55e39b462a5e..c0b9abb773a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1170,6 +1170,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	return -EINVAL;
 }
 
+static int amdgpu_dm_early_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_dm_audio_fini(adev);
+
+	return 0;
+}
+
 static void amdgpu_dm_fini(struct amdgpu_device *adev)
 {
 	int i;
@@ -1178,8 +1187,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
 	}
 
-	amdgpu_dm_audio_fini(adev);
-
 	amdgpu_dm_destroy_drm_device(&adev->dm);
 
 #ifdef CONFIG_DRM_AMD_DC_HDCP
@@ -2194,6 +2201,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.late_init = dm_late_init,
 	.sw_init = dm_sw_init,
 	.sw_fini = dm_sw_fini,
+	.early_fini = amdgpu_dm_early_fini,
 	.hw_init = dm_hw_init,
 	.hw_fini = dm_hw_fini,
 	.suspend = dm_suspend,
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 43ed6291b2b8..1ad56da486e4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -240,6 +240,7 @@ enum amd_dpm_forced_level;
  * @late_init: sets up late driver/hw state (post hw_init) - Optional
  * @sw_init: sets up driver state, does not configure hw
  * @sw_fini: tears down driver state, does not configure hw
+ * @early_fini: tears down stuff before dev detached from driver
  * @hw_init: sets up the hw state
  * @hw_fini: tears down the hw state
  * @late_fini: final cleanup
@@ -268,6 +269,7 @@ struct amd_ip_funcs {
 	int (*late_init)(void *handle);
 	int (*sw_init)(void *handle);
 	int (*sw_fini)(void *handle);
+	int (*early_fini)(void *handle);
 	int (*hw_init)(void *handle);
 	int (*hw_fini)(void *handle);
 	void (*late_fini)(void *handle);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
