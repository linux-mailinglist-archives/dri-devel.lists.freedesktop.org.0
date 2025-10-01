Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F983BB0713
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D4E10E60F;
	Wed,  1 Oct 2025 13:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NtATZID/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E5010E60F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P31ny9NMXrEGQimZmOlVRNwGbecMpblzliLx+XsKSF6LaZRZS09p5VnAkFhXbJ/rvojnQu9YahhC54DkO2S1KU0YV4UxBrOTgDizdcQ5y6ysIe5Lh6Q0hxiKEKAYFTN5AN2LeqdS0Zu4eMFOYMPPFg4wWckyleqnZ1xZ/p8Pl17IAH/Q71X7XV/Dk4xFPEBtERNVwhJNw7frWDoV9jeM2sSbR6MZn7BmO4+XbNM9EQD5UkLLTWDDHJF+c9JzIKg0lewmJQ8dhV521TREUaIfZDeQTS2fCaRexGE9x7iSldsfWePeMEWO3K70aurqZKdH/IFKkXLxQaDWMgpL8Pyd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89hCCKLuETv6ZLW0S8fgCC/LvspHMB7wmO9QVbc7Q+Q=;
 b=lqVqtCI2J3PPZrHtZWxdf7Y1qM0idF2gLug5jzBTnm8terbvYvG9deDiAQcXbGMzRZ2rfT9kcMMkUAoEdjKDJz7JN/8chHafJyhPZfnbUW9/dDbJ5b4vVzNXzCUeM/O1Gu8tvjeO1609juy42a8wONdomqIkKakDR49H2ksihK7dM1flkVbZij7mBzcugHXe/e2JMI7/W8+1ML2RjBOFo7gGhBeWobVHOhxJZRV8mwWQGyD+XtUADbzbHG3XjdSzjUbdHy8pTuk64T/oHOA5IIChxgvhBW/f51jxpGP5Ww2QiWXGdFVFpI2Bua3jVx0HAtZt5ekRof0upRom3dpVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89hCCKLuETv6ZLW0S8fgCC/LvspHMB7wmO9QVbc7Q+Q=;
 b=NtATZID/9Hj17QLf9DleEL4XQanxNmlej+ovN9b1oCGA1IucPzYhKtk3rrsnJ0K3GRQcW8CteYJcKDD6F4yyKTNFDKZqR/cSlQBlMDN5BxE8Q+ogxShYP8erJ4YgIBm/1ufpekJAadSi35D9/T/d2eDNvR4Dh1idPM0gRnEAWJmWhu2AnlSIs8Fh8zoXGoyb3J3ooCOXXLVDTdpMGKTJ18aGJHBOvMEImizV5y3aybf1Lsb7DoSmh8wuI6YM8tf5FXHoPkkwzHIHdV486Sn1AljFDkO1Iu54plJwIULGfM+kgz9sYEcKzzhf/DS1+pIcihkX3G8WI7dQNwIvZBepAw==
Received: from BN9PR03CA0688.namprd03.prod.outlook.com (2603:10b6:408:10e::33)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 13:15:03 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::c7) by BN9PR03CA0688.outlook.office365.com
 (2603:10b6:408:10e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 13:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 13:15:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 1 Oct
 2025 06:14:50 -0700
Received: from [10.221.136.222] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 06:14:48 -0700
Message-ID: <abcef795-4c39-4334-9ae2-91e6fb3b11d1@nvidia.com>
Date: Wed, 1 Oct 2025 15:13:44 +0200
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
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c67a31-f489-464f-aed0-08de00ec8833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTJDcllVMTROdUFMdWVxWTZUMkJkSS9neGxzRElLbTBsRXJoM3pzemROOUNJ?=
 =?utf-8?B?NkV5VjIwbGpRWDdaaGdsTmp4M2cvME9mUThHQkRScUlmejFIMmJ4U2RCQThE?=
 =?utf-8?B?cUovSFFRQTZBVW0vWXY1am9Hc09oZXU5cjE5eVhGSWhOdFZjTGRMcDc3K2tN?=
 =?utf-8?B?TjVYdzQ5TDBMNUd1d2F0N1V3eTlKdnBjWG45WjV1aGZGbmlSWnZVQXRYNHJL?=
 =?utf-8?B?S1pEalh3a0ZTRWh1TUpqS0YyWm1JRnpXdDVsZzJCWndORnpXNnJldElYcGl5?=
 =?utf-8?B?NmJtQUhrU0N4ZHZjUUJwaktWV3liRzc0aG1QSzljRi9JYkQxNDVvZVZDQTlt?=
 =?utf-8?B?cWV2WitTcEp3eWIwZDZjUWdLVnV3S3llZVprdjAxc0V2Y1NlV283SDZNYmpE?=
 =?utf-8?B?VWhwb1hsVUV0cUNaR0gwY2VZRllicjQrUzBWcENFS1EwUzFiQTlsbEtadHVQ?=
 =?utf-8?B?ME9NbjJZZURZalh0M2JXQkpJdHRyKy9wZnBuL08xUXRxSHJHUmUxakhmWnk3?=
 =?utf-8?B?QXU3WHNqWjZ4YS9tamRyMWEybG1DcTVxU0VtS05lcGM1bTRzV0NlN0RNdFVi?=
 =?utf-8?B?aVFiR1pXeklhSjliZ3RCSkxkZVlEUGh0MHF4TnlTSGtETEZBY1ZIamw2VGIx?=
 =?utf-8?B?TllqaE1KS3FLamt1SllwZXozTnJkajFBM3RzQWVpUjBkWFdJNURNV085MDRu?=
 =?utf-8?B?NWxYZklLcmx1NXZldjVwWVpvSllsQW9oR2VNRVI2WnRsMXJTQWVkNmNsYnZo?=
 =?utf-8?B?YWVlVzByT2V0eW5qQXNwb04yTDcyd1RsK0h1TUVxRmU5Y1QyN3dXYmxIQzls?=
 =?utf-8?B?ZTZEb09hOTA1YjNMY2VmcktNNVhObG1DMTFGdzc3RHNKOUVJUGhaTitKMVNk?=
 =?utf-8?B?djl5Q1Z5Z1JIbTNhQUhhSmxoaU8yUHFwQTJxVkRVWGNaeGZVaEJsd0JoeW1k?=
 =?utf-8?B?enoxYktWV0dhL0dkOTJTRnQxMy9TbVU0cFJvUGlaMFE5SXhOVlQ1NlR2cklY?=
 =?utf-8?B?bTZVbHVmNXFUbHVIRFlPVUdpdWNuL2wrOFVCYnFDT1NJeTJSOWVCVUM2dUZQ?=
 =?utf-8?B?MG1WdHdkMmIwTXFGNEtVcWRidTJVWm1qR3gveldqbEQ5R2QrRnU4VEtaQjdj?=
 =?utf-8?B?T285N2N0QktaTUdXWlFZcUdLQVBaSElFTVRJSkRhOUNteFp3d3NoaitHYVpT?=
 =?utf-8?B?bnA4SDJQVDR5VjVoclU2dVJLZkVXSnpVRkhmRng2cUZYVUI4cmhSa3NtVytC?=
 =?utf-8?B?V05jVFJYQWtKRXAvb09iUndkVnB5VXJtdWpoUGEwb3NOaGM5bDByRTNqbEVY?=
 =?utf-8?B?Y1kzRG5CRlVrUG9ZOCtnY0loa3VUUzJGR2VhRW93bjlPcGdCSUZ3U1Y3b2VC?=
 =?utf-8?B?QTR2YVRoRnBQRDRFVUVMVmttYjFRZFFaNmkyMUQ0UXE2ZDJMN2ZQMVFxakIy?=
 =?utf-8?B?Nm1xMjk1aEhpd3lQNTJDSng3T0svdFVVbVVLN2pVWlNtS3dYdWd0ajlRWGNh?=
 =?utf-8?B?T3R3QW50dndZSitKY3dwTUJZQTlVZXhYaXBFelQ3YzJBN2xMUmdjOWdIdjlQ?=
 =?utf-8?B?ejhKVWxtbTBnMUQrVjRFRnk4cjBFRmFhUzloQ2x1N1dueGpkRkNxekc4clVv?=
 =?utf-8?B?MHFQaEp1U2dUWENYWE9hSU03WFVpMSs5cTRJdWFLcGFKNHRuSHhLbHd4THFp?=
 =?utf-8?B?L3Q3T08ydmpDcmUyUzF0d0p6WGh6cHNPcUE5cEtkRVk0SDJ6VWRjT2xRTTI1?=
 =?utf-8?B?VGRrMHc3VGxFeXYybGVNOUJjUTF6WjVPOFlSSENZb29UaGFiMjBMZXF5NE5K?=
 =?utf-8?B?SmMxTWxFRDFJRXhKdGwrQjVNSkU2Z3B3ZkVWWC9VVlBPSVQzaEdvOEhBVE1q?=
 =?utf-8?B?SkU5QzJ2eXQ0NDJtdDlDRzRyYUxWTVp0MUlTb1lLUkpPdlRaMVBFNUEwenQ1?=
 =?utf-8?B?aWtUY1lRUzlJUDhVSWdxNFdqaGprRUdoY3luZFlwRGFQNjk0WS95bW5hSCtX?=
 =?utf-8?B?OWVzUnVDOWhNRWFvclVWbmJ5OVNuVUxXVU9LRzRubjAvMWRBTUpEQzAraWN1?=
 =?utf-8?B?d09qc0ZhQWp3ZThFeUdhbkZhUDF5K1BsS1ZtWU8zbXlYNFpMZ2FadmhTR3gz?=
 =?utf-8?Q?dMCM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:15:02.8547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c67a31-f489-464f-aed0-08de00ec8833
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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

I am not very familiar with the code but I am curious do we not a lock 
to keep the list same?


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

Is there a possibility to hitting use after free here ?  I see kfree(bo) 
before this.


Regards,

Nirmoy

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
> +}
