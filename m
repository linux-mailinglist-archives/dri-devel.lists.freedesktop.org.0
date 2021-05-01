Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64F3704CC
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B490A6F62B;
	Sat,  1 May 2021 01:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906886F62D;
 Sat,  1 May 2021 01:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGjsNpKqSFfN1S9n+DK0BqNOSLpQrOqDB4TEjCvOH24HSgYS1VNfyGbjx/erpIqFRziXxyRueJiSVL4PmJkP8rYS9A1glXkgXorU1OCgRPUrrAeSpzcbF8prDtSjOSKr6pzky8gIf43och5gkPE9mXmDC1h3yjdsnXEG/Cl9B4X7UuJDRCe9335P+go8UsBQVsSwVeNW5tRF/libEhdqG5F5S6PUKZlvFxvD80sisZXci8IbkWw1QfD4wK303AnBz8bECr0TMbpqKFJvZ/yc+opZ7CLnk/frBGWgxL0D4hV1vVFX+5SYxiIJNCe0+8Yruy6CIaJURBPvPA0UBioCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwNqNO7MWzIZf9LFjo8c7I5WO9TTBTmlm5CBu+JA5uk=;
 b=JZ1Nk6qF+1Zl/EuIRR7dH/y7W8A5JakfVdhk77uudm1/S3JHuyOg6kbzprqFwOa1Bb0xOUO33FUIkpxXSkuDzxTY1WMuSvCI033q4XzkL3GhoZoury+FZ6p5gJMLPH6TS2xwIHU+xEtldd/Tst/PiOzjAY1KrDjLYoJ+bC3mPyAojyoUfXpR7pXgUFpflASCDrwX/Aj2S4h04fXAFFwBmaMZpwOUxK1InUUhxvcrnoVYJNcsjQworGag3GOu5Gwb46TrJ0gbfIQoXskgkdSINZqzQsLzfubHhcWWLDid3J9nlquOFIjhrDvK9hWjPMypAkCfSa9ujxufKRDEZNqv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwNqNO7MWzIZf9LFjo8c7I5WO9TTBTmlm5CBu+JA5uk=;
 b=2WNOK+RacK77sCZMj+Ckw9dYrswzi1Q55jES7uHHr6Cxr0k0T4qhZbXTUzCQM3Xsr7/GqOWC+9IQXJfVYf/UVl9FfzDPOAJ+mAumqLzZ6GYYtwzo+DFlDxLJIDeG4uFgRY0KwyE6NAAMROJbsYajbdN9Ux0f2ehcd65XNK4qLSY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:23 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:23 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 06/17] drm/amdkfd: CRIU Implement KFD restore ioctl
Date: Fri, 30 Apr 2021 21:57:41 -0400
Message-Id: <20210501015752.888-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c6314d-d19a-4658-00b7-08d90c449a28
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB414209F1EA641CFE998EB9E8925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /n93Z9pWzEihitbT2/jRrLTYJw3ue61SaVbDtiDdwaz4OKWNDdtPsLj0wcXtzGzUX/9UfIPvFW/pWYSXdjss+Od8hCTelEYsMSK1YXU5YfbK+vMGqtFXMVCASIYb1d8fjoXONW3oKAXmaSBidp6CJNmgWBntHUR8yzvyTSSVtBtOey5R/IeK7bOS7vkQuEXo5nRZsJFd9Oh4LzxBIpiBr2ndvKNTp5Zq2dS0J7wgImuOJjP9E4JDCh7mA1gJOYXqndKe7VJ2MUOpcBTdWBiGnTAjgSe8gEizz6Q8ZOYRyiqCXwRUgDf6pENyCryRXYx223/q7+5vjIyiYtyi+e2m+PEi/Kh6v7Y1lXnKw3p11eGBMtYlglT/BXLhoqGp5HHCUxJBmTUU6gzL2lPXyptqMLIP6M8SSH70UUbZHH3Fs3bbK2WmelZjN3DH42JHA178AerTueTShJS2oYffMvPdCZQ6PflJ7p2uOL6SW8zjU2Za2HRTTBvDdP38ifb62RuQDiBo2HMMAwcc2jSwaPL069iHIoCggLA3dO20rsbWpYI4BpyPTr271dX/pFevubghUjOeVgqnVzKCn8jhmHPSFLezD2I40jscEbAGktr1wn+DEN7BmgHm5jf9loMUA5dmO8ImpwnK4EaGQT9FW6piBFri8cJu8wBRv/fx3SckVfUJTQSsW0GyDB1TZpxkhngY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(54906003)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(30864003)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tDV+Tc9GbFpxXPDwjQWaTGMYv4lOzC41eArmQXPhOZbx6n4yICFPTKUe0pP5?=
 =?us-ascii?Q?/gSjBTdiFrTdpA9RkllblssJQBpBSw9xHl0DXwqKerygW7DLM2sIIy9WEaTq?=
 =?us-ascii?Q?+xbCmc0Ttls6MTRRodhf6bYyczJz0SUwxCdiyGqZb22bAgBikZluC2MJX/XJ?=
 =?us-ascii?Q?T7EiSpl60+umI3vZm8Sm6z6KHIsZYbBUzU8cgwcKBrCEZGVvEZazVe1EymeR?=
 =?us-ascii?Q?jGJ4p26ZMmiwTkvMIKAcRzBCKyTM10G1toFcSXRz3sO8r1XPMUGM2/aknk4D?=
 =?us-ascii?Q?7aiF1bxYPxrTw+NhU7/+cgZDp+p+mjz5MgVuEgNlOlaW9SVGeo3fDFKqxRyw?=
 =?us-ascii?Q?KANfwQdvXmgMpR1YR9M4Xoc8c2CqJxCELtUFqHRyuKq7c8TVQSlx1yazOnvw?=
 =?us-ascii?Q?ixu5Hkq01T39A/dWhugNvM6IgCYAlWFHTCypl2ZaLgkCz3Y2ybo3sXbATvjq?=
 =?us-ascii?Q?RfFu44KD8Vp+hA/DzOZhMsZspID8gAwVdu/ME4OfElFbdkmpJTOLuDq/hRit?=
 =?us-ascii?Q?cf1lh6jxpCLnX3Xo2teoj6BOS2TUZH7B2vLjd9t3Icp5P2nfiyEF0ab57qNU?=
 =?us-ascii?Q?o6Vz+0LiU+QNm1rmuOz0gsEEalQU/QPDZzYLfOuZqO6QQlhBJC03dTy8lvA/?=
 =?us-ascii?Q?ofSGynW1vc9ZpsOQH2K7iEKVGr+gqVP+s8w0CE8RuOEikAq929op2MKyz6bF?=
 =?us-ascii?Q?3t8ltU/DbJJPg1hgODj34goNa5sqbv0WANrfhfYznKpX7M6OY8BJ7umCLavQ?=
 =?us-ascii?Q?6oLdWsyjUBpPmJXqaLkwRt6sO7bVYZJNUjcO5Nuy0HiO3PkR3rtwuc+HK507?=
 =?us-ascii?Q?XnWId5WaGjYEmoxqf/nJ+KfyslvZN1U7rC1XMTRSO6doYcxQCK7euBNMqWJq?=
 =?us-ascii?Q?+vFL5NwKZDAsT3/+ijePtIxjzjq0HbmByxZGEZgH3D/DWp30pwONXkI4VwqY?=
 =?us-ascii?Q?6aWWw31kzA5d6eTR3Qb3X3HT0uliJPAMQ+wlrdy397mnD0HaJRbhnO8zT6lV?=
 =?us-ascii?Q?Of8KsG3S2fawM049v/A1zVSmIrJj1UPlLZLnnDvmGg+DRBaZ04Nx0mHHY8tO?=
 =?us-ascii?Q?thLk9L3xu6MiGCZKAHJ5+YHPBwGJzsvUwhfKlg2udxG+BpFybWa+FNHmt/lg?=
 =?us-ascii?Q?dRPC1NxD5shmBFWWUME6wV+PhQDR6Yfz1LZ3ZZNVOjuV3ZuDY4kSRK9Galt2?=
 =?us-ascii?Q?tUYHNaGRzl8eo4Mdo99UQjyaZD6mCzitjUHmJGR2PJ+ZxSsbgCpkGe8OTjd/?=
 =?us-ascii?Q?jnRGlVEjWlW/5LoaOOf0OdG3n1ukK5tiEHIPxgTxVQrueVDWq2V8HvyUIFw6?=
 =?us-ascii?Q?SvaMUoRYcewFc8+eytIr1Fdb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c6314d-d19a-4658-00b7-08d90c449a28
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:23.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5a8xv1aGlk98aTXX4WuXX+yinF8biw3MmMpy3PUWEc1cgPEJdiBnL2BbdDCwJPsGM0k5TTXmwXyU4L+2LZJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This implements the KFD CRIU Restore ioctl that lays the basic
foundation for the CRIU restore operation. It provides support to
create the buffer objects corresponding to Non-Paged system memory
mapped for GPU and/or CPU access and lays basic foundation for the
userptrs buffer objects which will be added in a seperate patch.
This ioctl creates various types of buffer objects such as VRAM,
MMIO, Doorbell, GTT based on the date sent from the userspace plugin.
The data mostly contains the previously checkpointed KFD images from
some KFD processs.

While restoring a criu process, attach old IDR values to newly
created BOs. This also adds the minimal gpu mapping support for a single
gpu checkpoint restore use case.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit 47bb685701c336d1fde7e91be93d9cabe89a4c1b)
(cherry picked from commit b71ba8158a7ddf9e4fd8d872be4e40ddd9a29b4f)
Change-Id: Id392516c6af409f1e92303d8dc21411764f2d8fa
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 321 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   6 +
 2 files changed, 325 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1454f5613e60..95d81d00daa9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1804,6 +1804,94 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 	return -EPERM;
 }
 #endif
+static int kfd_devinfo_dump(struct kfd_process *p, struct kfd_ioctl_criu_dumper_args *args)
+{
+	int ret = 0;
+	int index;
+	struct kfd_criu_devinfo_bucket *devinfos;
+
+	if (p->n_pdds != args->num_of_devices)
+		return -EINVAL;
+
+	devinfos = kvzalloc((sizeof(struct kfd_criu_devinfo_bucket) *
+			     args->num_of_devices), GFP_KERNEL);
+	if (!devinfos)
+		return -ENOMEM;
+
+	for (index = 0; index < p->n_pdds; index++) {
+		struct kfd_process_device *pdd = p->pdds[index];
+
+		devinfos[index].user_gpu_id = pdd->user_gpu_id;
+		devinfos[index].actual_gpu_id = pdd->dev->id;
+	}
+
+	ret = copy_to_user((void __user *)args->kfd_criu_devinfo_buckets_ptr,
+			devinfos,
+			(args->num_of_devices *
+			sizeof(struct kfd_criu_devinfo_bucket)));
+	if (ret)
+		ret = -EFAULT;
+
+	kvfree(devinfos);
+	return ret;
+}
+
+static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bucket *devinfos,
+			       uint32_t num_of_devices)
+{
+	int i;
+
+	if (p->n_pdds != num_of_devices)
+		return -EINVAL;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev;
+		struct kfd_process_device *pdd;
+		struct file *drm_file;
+
+		dev = kfd_device_by_id(devinfos[i].actual_gpu_id);
+		if (!dev) {
+			pr_err("Failed to find device with gpu_id = %x\n",
+				devinfos[i].actual_gpu_id);
+			return -EINVAL;
+		}
+
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd) {
+			pr_err("Failed to get pdd for gpu_id = %x\n", devinfos[i].actual_gpu_id);
+			return -EINVAL;
+		}
+		pdd->user_gpu_id = devinfos[i].user_gpu_id;
+
+		drm_file = fget(devinfos[i].drm_fd);
+		if (!drm_file) {
+			pr_err("Invalid render node file descriptor sent from plugin (%d)\n",
+				devinfos[i].drm_fd);
+			return -EINVAL;
+		}
+
+		if (pdd->drm_file)
+			return -EINVAL;
+
+		/* create the vm using render nodes for kfd pdd */
+		if (kfd_process_device_init_vm(pdd, drm_file)) {
+			pr_err("could not init vm for given pdd\n");
+			/* On success, the PDD keeps the drm_file reference */
+			fput(drm_file);
+			return -EINVAL;
+		}
+		/*
+		 * pdd now already has the vm bound to render node so below api won't create a new
+		 * exclusive kfd mapping but use existing one with renderDXXX but is still needed
+		 * for iommu v2 binding  and runtime pm.
+		 */
+		pdd = kfd_bind_process_to_device(dev, p);
+		if (IS_ERR(pdd))
+			return PTR_ERR(pdd);
+	}
+	return 0;
+}
+
 static int kfd_ioctl_criu_dumper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
@@ -1842,6 +1930,10 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 		goto err_unlock;
 	}
 
+	ret = kfd_devinfo_dump(p, args);
+	if (ret)
+		goto err_unlock;
+
 	/* Run over all PDDs of the process */
 	for (index = 0; index < p->n_pdds; index++) {
 		struct kfd_process_device *pdd = p->pdds[index];
@@ -1908,9 +2000,234 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 static int kfd_ioctl_criu_restorer(struct file *filep,
 				struct kfd_process *p, void *data)
 {
-	pr_info("Inside %s\n",__func__);
+	struct kfd_ioctl_criu_restorer_args *args = data;
+	struct kfd_criu_devinfo_bucket *devinfos = NULL;
+	uint64_t *restored_bo_offsets_arr = NULL;
+	struct kfd_criu_bo_buckets *bo_bucket = NULL;
+	long err = 0;
+	int ret, i, j = 0;
 
-	return 0;
+	devinfos = kvzalloc((sizeof(struct kfd_criu_devinfo_bucket) *
+			     args->num_of_devices), GFP_KERNEL);
+	if (!devinfos) {
+		err = -ENOMEM;
+		goto failed;
+	}
+
+	err = copy_from_user(devinfos,
+			     (void __user *)args->kfd_criu_devinfo_buckets_ptr,
+			     sizeof(struct kfd_criu_devinfo_bucket) *
+			     args->num_of_devices);
+	if (err != 0) {
+		err = -EFAULT;
+		goto failed;
+	}
+
+	mutex_lock(&p->mutex);
+	err = kfd_devinfo_restore(p, devinfos, args->num_of_devices);
+	if (err)
+		goto err_unlock;
+
+
+	bo_bucket = kvzalloc((sizeof(struct kfd_criu_bo_buckets) *
+			     args->num_of_bos), GFP_KERNEL);
+	if (!bo_bucket) {
+		err = -ENOMEM;
+		goto err_unlock;
+	}
+
+	err = copy_from_user(bo_bucket,
+			     (void __user *)args->kfd_criu_bo_buckets_ptr,
+			     args->num_of_bos * sizeof(struct kfd_criu_bo_buckets));
+	if (err != 0) {
+		err = -EFAULT;
+		goto err_unlock;
+	}
+
+	restored_bo_offsets_arr = kvmalloc_array(args->num_of_bos,
+					sizeof(*restored_bo_offsets_arr),
+					GFP_KERNEL);
+	if (!restored_bo_offsets_arr) {
+		err = -ENOMEM;
+		goto err_unlock;
+	}
+
+	/* Create and map new BOs */
+	for (i = 0; i < args->num_of_bos; i++) {
+		struct kfd_dev *dev;
+		struct kfd_process_device *pdd;
+		void *mem;
+		u64 offset;
+		int idr_handle;
+
+		dev = kfd_device_by_id(bo_bucket[i].gpu_id);
+		if (!dev) {
+			err = -EINVAL;
+			pr_err("Failed to get pdd\n");
+			goto err_unlock;
+		}
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd) {
+			err = -EINVAL;
+			pr_err("Failed to get pdd\n");
+			goto err_unlock;
+		}
+
+		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
+		pr_debug("bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
+			"gpu_id = 0x%x alloc_flags = 0x%x\n"
+			"idr_handle = 0x%x\n",
+			bo_bucket[i].bo_size,
+			bo_bucket[i].bo_addr,
+			bo_bucket[i].bo_offset,
+			bo_bucket[i].gpu_id,
+			bo_bucket[i].bo_alloc_flags,
+			bo_bucket[i].idr_handle);
+
+		if (bo_bucket[i].bo_alloc_flags &
+		    KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
+			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
+			if (bo_bucket[i].bo_size !=
+			    kfd_doorbell_process_slice(dev)) {
+				err = -EINVAL;
+				goto err_unlock;
+			}
+			offset = kfd_get_process_doorbells(pdd);
+		} else if (bo_bucket[i].bo_alloc_flags &
+			   KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+			/* MMIO BOs need remapped bus address */
+			pr_info("restore ioctl :KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP\n");
+			if (bo_bucket[i].bo_size != PAGE_SIZE) {
+				pr_err("Invalid page size\n");
+				err = -EINVAL;
+				goto err_unlock;
+			}
+			offset = amdgpu_amdkfd_get_mmio_remap_phys_addr(dev->kgd);
+			if (!offset) {
+				pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
+				err = -ENOMEM;
+				goto err_unlock;
+			}
+		}
+
+		/* Create the BO */
+		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->kgd,
+						bo_bucket[i].bo_addr,
+						bo_bucket[i].bo_size,
+						pdd->drm_priv,
+						(struct kgd_mem **) &mem,
+						&offset,
+						bo_bucket[i].bo_alloc_flags);
+		if (ret) {
+			pr_err("Could not create the BO\n");
+			err = -ENOMEM;
+			goto err_unlock;
+		}
+		pr_debug("New BO created: bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n",
+			bo_bucket[i].bo_size, bo_bucket[i].bo_addr, offset);
+
+		/* Restore previuos IDR handle */
+		pr_debug("Restoring old IDR handle for the BO");
+		idr_handle = idr_alloc(&pdd->alloc_idr, mem,
+				       bo_bucket[i].idr_handle,
+				       bo_bucket[i].idr_handle + 1, GFP_KERNEL);
+		if (idr_handle < 0) {
+			pr_err("Could not allocate idr\n");
+			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd,
+						(struct kgd_mem *)mem,
+						pdd->drm_priv, NULL);
+			goto err_unlock;
+		}
+
+		if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+			restored_bo_offsets_arr[i] = KFD_MMAP_TYPE_DOORBELL |
+				KFD_MMAP_GPU_ID(pdd->dev->id);
+		if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+			restored_bo_offsets_arr[i] = KFD_MMAP_TYPE_MMIO |
+				KFD_MMAP_GPU_ID(pdd->dev->id);
+		} else if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
+			restored_bo_offsets_arr[i] = offset;
+			pr_debug("updating offset for GTT\n");
+		} else if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			restored_bo_offsets_arr[i] = offset;
+			/* Update the VRAM usage count */
+			WRITE_ONCE(pdd->vram_usage,
+				   pdd->vram_usage + bo_bucket[i].bo_size);
+			pr_debug("updating offset for VRAM\n");
+		}
+
+		/* now map these BOs to GPU/s */
+		for (j = 0; j < args->num_of_devices; j++) {
+			struct kfd_dev *peer;
+			struct kfd_process_device *peer_pdd;
+
+			peer = kfd_device_by_id(devinfos[j].actual_gpu_id);
+
+			pr_debug("Inside mapping loop with desired gpu_id = 0x%x\n",
+							devinfos[j].actual_gpu_id);
+			if (!peer) {
+				pr_debug("Getting device by id failed for 0x%x\n",
+				devinfos[j].actual_gpu_id);
+				err = -EINVAL;
+				goto err_unlock;
+			}
+
+			peer_pdd = kfd_bind_process_to_device(peer, p);
+			if (IS_ERR(peer_pdd)) {
+				err = PTR_ERR(peer_pdd);
+				goto err_unlock;
+			}
+			pr_debug("map mem in restore ioctl -> 0x%llx\n",
+				 ((struct kgd_mem *)mem)->va);
+			err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->kgd,
+				(struct kgd_mem *)mem, peer_pdd->drm_priv);
+			if (err) {
+				pr_err("Failed to map to gpu %d/%d\n",
+				j, args->num_of_devices);
+				goto err_unlock;
+			}
+		}
+
+		err = amdgpu_amdkfd_gpuvm_sync_memory(dev->kgd,
+						      (struct kgd_mem *) mem, true);
+		if (err) {
+			pr_debug("Sync memory failed, wait interrupted by user signal\n");
+			goto err_unlock;
+		}
+
+		pr_info("map memory was successful for the BO\n");
+	} /* done */
+
+	/* Flush TLBs after waiting for the page table updates to complete */
+	for (j = 0; j < args->num_of_devices; j++) {
+		struct kfd_dev *peer;
+		struct kfd_process_device *peer_pdd;
+
+		peer = kfd_device_by_id(devinfos[j].actual_gpu_id);
+		if (WARN_ON_ONCE(!peer))
+			continue;
+		peer_pdd = kfd_get_process_device_data(peer, p);
+		if (WARN_ON_ONCE(!peer_pdd))
+			continue;
+		kfd_flush_tlb(peer_pdd);
+	}
+
+	ret = copy_to_user((void __user *)args->restored_bo_array_ptr,
+			   restored_bo_offsets_arr,
+			   (args->num_of_bos * sizeof(*restored_bo_offsets_arr)));
+	if (ret) {
+		err = -EFAULT;
+		goto err_unlock;
+	}
+
+err_unlock:
+	mutex_unlock(&p->mutex);
+failed:
+	kvfree(bo_bucket);
+	kvfree(restored_bo_offsets_arr);
+	kvfree(devinfos);
+
+	return err;
 }
 
 static int kfd_ioctl_criu_helper(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 74d3eb383099..9c675755369a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -758,6 +758,12 @@ struct kfd_process_device {
 	 *  number of CU's a device has along with number of other competing processes
 	 */
 	struct attribute attr_cu_occupancy;
+	/*
+	 * If this process has been checkpointed before, then the user
+	 * application will use the original gpu_id on the
+	 * checkpointed node to refer to this device.
+	 */
+	uint32_t user_gpu_id;
 };
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
