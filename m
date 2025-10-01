Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A5BB0789
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8488710E6FB;
	Wed,  1 Oct 2025 13:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FziB73TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010039.outbound.protection.outlook.com
 [40.93.198.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B13810E6FB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVuJWlzaAQldq4SZSolNKuAfQ9fbvyMf2LHYKUV0lwBkJ6ohtZ3iWqqfyIvqQU31dAywNvXbb1OeyRFzjmwjt2H1MiMdJN58gTF0tw/P4fvN5fQtBa/4y+YU8gW9LxLXkFbixBk/fMDMth/VI86cnFP3VicRxGLFY6z7Q0tHku0Qz8ZkiNzPh7RkYxBCvxrxmD7VBW2bxH6gD6p/WWV058u/0SbAgSbFDoikUBHIHO12qPYqmWF7KIAIMzGpxWYht2cvXooXgibOswbLf4IWg8LdwPb+Zn+KdmdlELgWNKw2fMqyM6f4EKnS9WQbuvn2xwtPaHv8sEv+wg0ow6IWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XELRhTMigAmEkNFdpMmQhupGZfR/glyThoGStW4Dfw=;
 b=xJ9HuExiaKegVFKgMj5Um8tQ5O2ZCiJg4DvDoiMdeHJtcU3MZwTAGIZVke8Fmo+BqiKhyFUU27Nv/LWoFoHv2/hWEYjlG7DZX9QcoeqPyoYxcyCc39WiEat8nrJyEBF8JUsOBUkXt+tf3Fi4mFLi/0JpX7TzXrzipPDn9jtWpBY3caOrJfTt1wKxqJFGg3/LThZIYNmoW2A5xsSlEHKnCiLfon2/A8Mw0rndKVLV6BPdmSuXbHIBXSppAXC4Eand28II+BKFVgJlTkBBS3NezSfPv17q5qy4xRstMidAv0DXa5FFiHgQdGzL78E4DKASmi32I7OnOJ+ok6+3kfJ4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XELRhTMigAmEkNFdpMmQhupGZfR/glyThoGStW4Dfw=;
 b=FziB73TKRmmvOMxFxfJLSp/OZU39+y79xQoafSzM0Bn0ihr45E2gLEi0XXNRpr+OMKvU14pzY7VLiWQgDYAg0JcK8VxUnsN4SPvoh+5IpkCpG8zi0EMsNP1HlhzS2U8Z11wEz2vN4YAVZTyX2/2D2Xu8rfs70ZtIal0A2WSvoHkcaSmggiBWu8AukFy4ItnW66LHlymHBgxXYtD3ocn9+lUt+B9h4nfUHV9PNTg7T9ZgeYAYRWqapnkJavMsZSiVqFAlYbeAIFZmHcO6wMzEZqX9OAg8XaBFJXHXI9vk6dlZixjWGpfLrqMM+4qDxpMhenLgJ2/lmwQcJtS1/lZAJg==
Received: from SA1PR05CA0018.namprd05.prod.outlook.com (2603:10b6:806:2d2::18)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 1 Oct
 2025 13:23:30 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::c6) by SA1PR05CA0018.outlook.office365.com
 (2603:10b6:806:2d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.5 via Frontend Transport; Wed, 1
 Oct 2025 13:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 13:23:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 1 Oct
 2025 06:23:14 -0700
Received: from [10.221.136.222] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 06:23:13 -0700
Message-ID: <481b6dde-3664-47bf-bc5e-9ed523d0586a@nvidia.com>
Date: Wed, 1 Oct 2025 15:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: <dongwon.kim@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <dmitry.osipenko@collabora.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-3-dongwon.kim@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20250924194755.1265531-3-dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e8e10b-0a42-4fb7-e0be-08de00edb674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU54V3E0dk14b3hZdnpxeFl4UE1iQnh4WDBIWUVmYURtdFIvajZway9rd1Ex?=
 =?utf-8?B?RWVMK2M1bzhiSDRDK3N5bXFwYUNnaFJlcHE3L0d5MVlPT0w1MUlkN1BxZnJr?=
 =?utf-8?B?WUsxbjNMdXcxVkFNY1RHcDlMMXlNbDRrK3BtcU53U09kak1kaHY5ck9Xbm5r?=
 =?utf-8?B?L0FlT0hYL3l6WERaUVhLWjBjaVZwWjhCVFA1U0lyZnV1b0FYeUo0eUZjSjVa?=
 =?utf-8?B?ckQ1WFB4bUJ1cW1MZWhRRVJyQy9pYVR2K01nQnJRWkQ3TS94eERRYVhBWTFn?=
 =?utf-8?B?QmxyQ3k1bTNQK0N0ZWxnNTF5c25pLzkwbmNaalVaUk9pYlVYOUUvNmdaeUdj?=
 =?utf-8?B?RUZUTVNxNitoT2JodFp3ZUJmMDdEV2V0MEt3NTFzM2cvSVp0TkRIZ0dteFhK?=
 =?utf-8?B?OUZIYmxydGRqTUlVbUtweFh3Vjg2U2o5dUhaZTFWb3VsZjArdnF3V2Flbi92?=
 =?utf-8?B?NE5SMmRtNFFtZDI1cDBlUjNkNlh6eWdaM1pybEgvSm44cjlGYU1CSDZOTEph?=
 =?utf-8?B?SG5DQWM4QXg3ZnladUVVSWgrNGJ5ZVRmbXU5eVgzQ2tvcXl0R0lNMGVCeVVn?=
 =?utf-8?B?QUkwOGR6ZGRHTUdiblRHMGZtVzFmUithd2p4TUdoOFhuQkJtL3lHOGU3R1Vz?=
 =?utf-8?B?VnQvbnpLSk05UHR4b0NaVkM4TWRMREt6Z0F2MDY0L05OUE13VU0yN3Z1VGM5?=
 =?utf-8?B?ck53bUNqVTExVWVqckVsaVJFTmxJQmZnRGVTOGVic0lLeExENFUvUFJhVVhW?=
 =?utf-8?B?MW50ZHRZSTFYU2dzVlQxWWduRkFzWG92b3ErSU9KQ0FBYzlmQnU1MFhIRStN?=
 =?utf-8?B?NndCVGYzK1ZrMnRUWFNETU1hODNGSWNrRFR5YjF3aE9ydWF4eDBtalZkQkk2?=
 =?utf-8?B?cUVzTTdOV0YraGJwZWNXS3FFa2lkRWpYQnBVeWFMV0pIak1FdVlzS1ZWbTc0?=
 =?utf-8?B?NmcwblIrNFR1dnRPS1lwOUdwejcxRWRpUUpBVGhuamErTVJ4OENWclEzbnp5?=
 =?utf-8?B?bU8xVkp2RnIwbG45V3c2WExEcnFVVFJERU5QYXkxb0xYQWdTTjZBK0VKRUd0?=
 =?utf-8?B?TEp1c3dwcGlxQkZlM1NYdmpDbElwbnFsc2cwa096OUtTN1VPN3F5cjVyRld4?=
 =?utf-8?B?Y0phZk12VzVXL0pxdjFVcmdzSWdZUXdmbmRZTGFtQnVHR3JHV2dXV2dYbHRi?=
 =?utf-8?B?YTR4ek9ZWEJXdWd1cldQRGsvd3UzWTkwNktwK25sUFN3LzNXZ3RHVFNORHpi?=
 =?utf-8?B?eEkydW5JdTBveXJhcFg3a3JBQkpGWlZsN0JScmVpZ05NeWlmdWlZVElYM0cv?=
 =?utf-8?B?eVZ2U0djOVlEWnBRZTJ0MHcrQWJTSXp5aGlNOVlmZVF4dGJYZlVmVHYwamVG?=
 =?utf-8?B?ajh4RjRXUGdVUWhXR1pIMmphQitJZklubFRaeWFQbzNqRURjOWZpRjRFZkUx?=
 =?utf-8?B?OWM3MWJvWnJBcG5GZy8rTjIvYlNrY3o0R2FwODFvYjVCMFhjcTFHK0hydXhG?=
 =?utf-8?B?L3Z3RXZYVlI2V2l3MzR4TUNycTF5M0VheEhWMlhlL0V5VThnZWhRUklVazRO?=
 =?utf-8?B?b09LTlpWclRoY08zWEx1OGs0SWdLbi9WOS8rdGlyRzlFRFhNUmRWU0ZSeXh6?=
 =?utf-8?B?cWY2di9ISHNLcXpvY2pRQU1Ed0FNNEZ4Z3kzdTMyZUFXYmhEZm9Va29WbjZr?=
 =?utf-8?B?ZGxEbWhRN1IzMHA4dzY5cWhVMU55bXpBQk1Tam1vQnpkcUdGSno0NUt4RkRZ?=
 =?utf-8?B?ZGk0NkdXc2NNRlY0R2N4T1gzdThOVlNBOE5ua250dTZmTFZRV3JjVk5QMlB3?=
 =?utf-8?B?dlo0ZTU0VExkdnI4ZjhOdWMrM280aFZNalROUGJNMTJCNTJuVTJGbDU5cElj?=
 =?utf-8?B?b3JaRXB2bFB4RmlQaWxDNU1iUHpjekpUYzQ3b0M3bkpadUFtNGZhc0xWdjJR?=
 =?utf-8?B?ODN1YTMwUHNQU1RuOU9lTjE5MEp4T0pGc3BPeEl4VG82Unl5RHVOZy9IRzVF?=
 =?utf-8?B?SVo0d2xtUTFkRTR2WFdXNktvZUczWmNMRVByRG9HM3VualEyelVPUTZtcDgw?=
 =?utf-8?B?eWFUYlRtV1NQOERDWkpTREhXdHVsWlp1akU0cGFHSEc3Uzh6ZXZTaG9FY0ZX?=
 =?utf-8?Q?vByM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:23:30.0021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e8e10b-0a42-4fb7-e0be-08de00edb674
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059
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


On 24.09.25 21:47, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
>
> When the host KVM/QEMU resumes from hibernation, it loses all graphics
> resources previously submitted by the guest OS, as the QEMU process is
> terminated during the suspend-resume cycle. This leads to invalid resource
> errors when the guest OS attempts to interact with the host using those
> resources after resumption.
>
> To resolve this, the virtio-gpu driver now tracks all active virtio_gpu_objects
> and provides a mechanism to restore them by re-submitting the objects to QEMU
> when needed (e.g., during resume from hibernation).
>
> v2: - Attach backing is done if bo->attached was set before
>
> v3: - Restoration of virtio-gpu resources is no longer triggered via .restore;
>        instead, it is handled by a PM notifier only during hibernation.
>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>   drivers/gpu/drm/virtio/virtgpu_drv.h    | 10 ++++
>   drivers/gpu/drm/virtio/virtgpu_kms.c    |  1 +
>   drivers/gpu/drm/virtio/virtgpu_object.c | 71 +++++++++++++++++++++++++
>   3 files changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 1279f998c8e0..55f836378237 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -126,6 +126,12 @@ struct virtio_gpu_object_array {
>   	struct drm_gem_object *objs[] __counted_by(total);
>   };
>   
> +struct virtio_gpu_object_restore {
> +	struct virtio_gpu_object *bo;
> +	struct virtio_gpu_object_params params;
> +	struct list_head node;
> +};
> +
>   struct virtio_gpu_vbuffer;
>   struct virtio_gpu_device;
>   
> @@ -265,6 +271,7 @@ struct virtio_gpu_device {
>   	struct work_struct obj_free_work;
>   	spinlock_t obj_free_lock;
>   	struct list_head obj_free_list;
> +	struct list_head obj_restore;
>   
>   	struct virtio_gpu_drv_capset *capsets;
>   	uint32_t num_capsets;
> @@ -479,6 +486,9 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
>   
>   int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
>   			       uint32_t *resid);
> +
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
> +
>   /* virtgpu_prime.c */
>   int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
>   				    struct virtio_gpu_object *bo);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index cbebe19c3fb3..08f8e71a7072 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -162,6 +162,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>   	vgdev->fence_drv.context = dma_fence_context_alloc(1);
>   	spin_lock_init(&vgdev->fence_drv.lock);
>   	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
> +	INIT_LIST_HEAD(&vgdev->obj_restore);
>   	INIT_LIST_HEAD(&vgdev->cap_cache);
>   	INIT_WORK(&vgdev->config_changed_work,
>   		  virtio_gpu_config_changed_work_func);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index e6363c887500..28fdfc70fa49 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -61,6 +61,38 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
>   		ida_free(&vgdev->resource_ida, id - 1);
>   }
>   
> +static void virtio_gpu_object_add_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo,
> +					       struct virtio_gpu_object_params *params)
> +{
> +	struct virtio_gpu_object_restore *new;
> +
> +	new = kvmalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new) {
> +		DRM_ERROR("Fail to allocate virtio_gpu_object_restore");
> +		return;
> +	}
> +
> +	new->bo = bo;
> +	memcpy(&new->params, params, sizeof(*params));
> +
> +	list_add_tail(&new->node, &vgdev->obj_restore);
> +}
> +
> +static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo)
> +{
> +	struct virtio_gpu_object_restore *curr, *tmp;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
> +		if (bo == curr->bo) {
> +			list_del(&curr->node);
> +			kvfree(curr);
> +			break;
> +		}
> +	}
> +}
> +
>   void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>   {
>   	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> @@ -84,6 +116,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>   		drm_gem_object_release(&bo->base.base);
>   		kfree(bo);
>   	}
> +	virtio_gpu_object_del_restore_list(vgdev, bo);
>   }
>   
>   static void virtio_gpu_free_object(struct drm_gem_object *obj)
> @@ -258,6 +291,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>   		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>   	}
>   
> +	/* add submitted object to restore list */
> +	virtio_gpu_object_add_restore_list(vgdev, bo, params);
>   	*bo_ptr = bo;
>   	return 0;
>   
> @@ -271,3 +306,39 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>   	drm_gem_shmem_free(shmem_obj);
>   	return ret;
>   }
> +
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
> +{
> +	struct virtio_gpu_object_restore *curr, *tmp;
> +	struct virtio_gpu_mem_entry *ents;
> +	unsigned int nents;
> +	int ret;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
> +		ret = virtio_gpu_object_shmem_init(vgdev, curr->bo, &ents, &nents);
> +		if (ret)
> +			break;
> +
> +		if (curr->params.blob) {
> +			virtio_gpu_cmd_resource_create_blob(vgdev, curr->bo, &curr->params,
> +							    ents, nents);
> +		} else if (curr->params.virgl) {
> +			virtio_gpu_cmd_resource_create_3d(vgdev, curr->bo, &curr->params,
> +							  NULL, NULL);
> +
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		} else {
> +			virtio_gpu_cmd_create_resource(vgdev, curr->bo, &curr->params,
> +						       NULL, NULL);
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		}
> +	}
> +
> +	return ret;
this should be "return 0" otherwise on success it is returning 
uninitialized "ret" value.
> +}
