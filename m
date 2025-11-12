Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02AC523FB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437AA10E718;
	Wed, 12 Nov 2025 12:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VDjkVwEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A58810E710
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxEa3JBcd14Bx7gSLE00hcXzxafOnx707Fe3SenDVv7/kdheOnpDdxzyYtjazFGqlHIyV8GSthEwi89F0SAEAJVCG3qEgAiRcXakLeuvw21/zsfKwyR9haO0w+NfsHjv3Eixk1olNUCh0l91LzvtzNrw6wP625F7w43bCGXLgoosC7flLOtWSjrAkfHTrX3g6WrixQSgJwm+GGN3pR8Ug8+5wvAp5RwNjiZSinEDzp0XIDcLV3tShHzpiIW2ciwBZVksugzy9eXCAyCtbQLeYdGL7CG04VKS7ri1MTumbiqQ6HjWVUh2CNxAaGUMYsbidZNjW0MSSV0gLsq4j2YmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dffdfZJC+MxcBqIgUD0EVlxD00ALVr1ShAvS2RSdbxE=;
 b=HwB8vl1Qm4mnLqR1cOVt9oWOmDIWP8P5f6TPBWujmOQYDaFCCgYUp/uClJiN0kf/CAo8jGhhDOBb/+BEEsNyrBhvhaTqJN8Wj8YOLsoTHYLOs0NRnTYsrEUVZnFwn7g63bf3mKhGUtDL8sfXGHibBGUeGA8Rng9UHB9pHSWazryUpHK2ZekUmoLu0AxFZH4p5e6oUDqyI+pp0MeXkMDexdOuyp5stZu4VhszGWRRMEmfURFAgFlLVRzXGJXw3229VHbL7hJohzVEnckfaxgH4DarJ6rt8yjxlI27vz5G2NDMnSC/H+9C+xEzCTpmaJmKJWKaIzWVjoBKuY/PFbd11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dffdfZJC+MxcBqIgUD0EVlxD00ALVr1ShAvS2RSdbxE=;
 b=VDjkVwEabPy8z6e+bcQeiTUn1OlnUbRJZ2dUBo43uXhVZHRUzUvQR0IuWXZGbPsuJb4qfdWQadMAtSe310uuRcJxSNKwYwnQ6KXzfX60eGfevzP+v6JLxMnrOHZtMxmrjEWzxrm9QeAoy+ySb3OobUXB4rU+3e7O0cZVKGJynbzLv9wCLJE5SuRuMhcTinvwIqHIO69pu/P0k+qCBiLzk0ftJfTxZ89Zuscu2RaA8D3TRWgrxuups15pieWBFGULal7/EKNP4LqVo6hTxy761b7fCyYBK7wLQz8QPmnKWijkIaHAI4pHfvwPmZaN7xwhF1h42tIgi+DSwRh4Pse4xg==
Received: from CH2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:610:57::27)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 12:28:04 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::9c) by CH2PR12CA0017.outlook.office365.com
 (2603:10b6:610:57::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 12:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 12:28:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:27:51 -0800
Received: from [10.64.161.125] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:27:49 -0800
Message-ID: <a8d33ecd-7be6-4ee1-8aa1-00edbcc739bf@nvidia.com>
Date: Wed, 12 Nov 2025 13:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/virtio: Freeze and restore hooks to support
 suspend and resume
To: <dongwon.kim@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <dmitry.osipenko@collabora.com>, <airlied@redhat.com>, <kraxel@redhat.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-2-dongwon.kim@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20251027205323.491349-2-dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ddd7df-40cb-4533-72b2-08de21e6ed92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2p4TXNLb0F4LzhIa0xaNEM1ZTd1UVNxTEx3QklWekpRaWd1anBzNVRSNVZF?=
 =?utf-8?B?aFpnbmxlR0hPLzZ1TDlJK2FFYWVsaEI3cWJ0M0xWU3R6NW1ndVI4eXpVK0Jo?=
 =?utf-8?B?S2NWb1RhWWQxM3NDc2JuN3o0QVNmYTMrN1lCZlFoK2RQbFFTell4TG9UcVRB?=
 =?utf-8?B?aUtidjNuVlowN0tDRUpaU0JDVE1FUVRJYnluTEZBUDYrMEtRMUttdHlQWVF6?=
 =?utf-8?B?WE9aODFJd2hXRzh6OWtYMUt2MUc5bkZHejlXUU01ZWFxMk9yMjFXTlNjMVRS?=
 =?utf-8?B?SVd3bHlSQ20zOUl0QTRHd0Q5WHNQTWZ6b3hsSzBwTFhlejRvSVJOOGJEc2Nr?=
 =?utf-8?B?dXI1TXM4YkwyZUZQU2NBeTc1N01WMVVWb3lsdjhtVUtEUmFJMERYT1hoQU9B?=
 =?utf-8?B?d1Bpb213RlNLTWpEQitCcVUvYkY1V3dnZU1aMitEY0lRKzRKTkN2MW9RS2VM?=
 =?utf-8?B?ejUxLzZxaDJLamNiV25zVWtjZnVwckdyVm1wKzNYU3d1NVZpNGRBNXc4WTlO?=
 =?utf-8?B?VHFHUDJJSVJSbFJLVE5uQnVpWFRVNHd0MWxpcmNzZXVEUk1PTnFvNStSMXMw?=
 =?utf-8?B?bjl6SUtVcVdVNkRZeTNLc010OUpMbDZqK1cyclJTTUF1K2NSWnl5N3BLdSs0?=
 =?utf-8?B?K3V5SHhMMDM0bWE4T2RPK0huaWUzTnVWM2QybEM2RE9ISWN2MkptMDRoUGtK?=
 =?utf-8?B?K0FmdXhsM1NHTG0zMks3djRxNGFnSmtsd2dKNm9HbkZKYjN2RGVPWXFrT1FH?=
 =?utf-8?B?QW9zdmhpT1RjbjRBV2RybWJMYitFczNwa3k1KzJiSFhJYzJKaTFHbnNYMVdL?=
 =?utf-8?B?SzMrM1l6MDNYZElxWThSR3Jjd3A0cExheG5GM2NadlRaMjNtbmZUQjVDdVRP?=
 =?utf-8?B?RkRDaEcvekRmNGZKS2w5dllwbUNabnhRR24yS3pBU1N1ZTZaYTVLcThHYjB5?=
 =?utf-8?B?b3N2MzAvdjl6NkFpc1hnVFcrRjhDSVhrSC9OWTJJT054c3NPcXMrUmtIQ1o2?=
 =?utf-8?B?U3RVbzRoMWU3blhxL1lJMWFQa0RFcmFSRGc5S0VITk1lMUVuSCtTU1BhY0xI?=
 =?utf-8?B?T200WWpEL0xvaHRiSTRPMU5hOXB3eFdwRmFkNkJpckUrVHVKMnNIVSs2azlF?=
 =?utf-8?B?REFYcEtoNXlWdTVvd0FmanFKdkZSZFZvWkJ0UHZCcnVFNkNMZnBkSU9xTitH?=
 =?utf-8?B?UUFucTUrOHc1TVM2MWIrUWt1SXhMWURYMXJzNnpJY0N4UHJiNEV6cU9VMlRs?=
 =?utf-8?B?Mmh4K0gxdFdyb01YeEF0WUJKYUdrNmNGdUx1WVgvc0xOTkY5UGt1Ry9wWlNC?=
 =?utf-8?B?U0VHMEk3ZjBydmtvQmNXUitqZXhORzhlcys0VVk5NVovTUttQzVOQ3ZQdlVl?=
 =?utf-8?B?dnNZQ1VlMEIyZGo3S21OTUZYd0htNzM1L05xQmxnUU9JYTBWbXBJakpxSDVa?=
 =?utf-8?B?Z2NyVkJhUkZKTHpGWFBpQjB6OXJsclV1ZzZ6MmhiZStISVZ6TEZxa1lJUEds?=
 =?utf-8?B?Znl4MWMxeGxaNXlPZ09rejA0WVBkMUNqWGRiUi9IT3M0MFJPa2VqZkZoQmJm?=
 =?utf-8?B?VXZNeFFJYlBMVWJoSWdoc1Erby9VbmsvQXZDeGZ1V1VMRXQ4ZDhETks2MXNV?=
 =?utf-8?B?ODV3eWluRWhGaTBrYityOFdEUzl3by9xcHN1RVVRUDJ0RzhsVGxEcitYNGZB?=
 =?utf-8?B?MUE0bW9DOGduaExoMW5vUGRqdUx0eU9QSG5wa1lIOWttaGh4RWl3aUM4TFVX?=
 =?utf-8?B?SEFOYTkvR1F3M3ZwM3pocHRQUjFWa0dQUzcreFhld0JUa0ZjV1UrTUlSMUNx?=
 =?utf-8?B?QUIwWExXSDM3djZTTzd5SWhsM1ptcGZQVVIrU1NadkFlQXZGNnFpcmQyYUJj?=
 =?utf-8?B?MXBEMFJiYmVVcUJmWEorY1J6RHNyazhndEJQcVN3VlBzOUNBeEN3UGRXS2tj?=
 =?utf-8?B?WSthdUI3aERnUUpIOVRFalN0MGZ5WTZ0SjZyMU90Sk5rL0RDWlhxa2VWdU5p?=
 =?utf-8?B?UmorSFpCems4SjVNbzNVMk11eEJVUE9kYkt6WnF5anNzVUkwOCtzVlBGdjcx?=
 =?utf-8?B?MDFYVEkxZnlTZUJKRUkyK0JyWG1iN09BTll2SHdaQm5CaUhmOGNFR2R1b3c3?=
 =?utf-8?Q?k1LM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:28:04.3665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ddd7df-40cb-4533-72b2-08de21e6ed92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888
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


On 27.10.25 21:53, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
>
> virtio device needs to delete before VM suspend happens
> then reinitialize all virtqueues again upon resume
>
> v2: 10ms sleep was added in virtgpu_freeze to avoid the situation
>      the driver is locked up during resumption.
>
> v3: Plain 10ms delay was replaced with wait calls which wait until
>      the virtio queue is empty.
>      (Dmitry Osipenko)
>
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>   drivers/gpu/drm/virtio/virtgpu_drv.c | 60 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
>   drivers/gpu/drm/virtio/virtgpu_kms.c | 23 ++++++++---
>   3 files changed, 77 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 71c6ccad4b99..676893e90a9f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -163,6 +163,60 @@ static unsigned int features[] = {
>   	VIRTIO_GPU_F_RESOURCE_BLOB,
>   	VIRTIO_GPU_F_CONTEXT_INIT,
>   };
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int virtgpu_freeze(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = drm_mode_config_helper_suspend(dev);
> +	if (error) {
> +		DRM_ERROR("suspend error %d\n", error);
> +		return error;
> +	}
> +
> +	flush_work(&vgdev->obj_free_work);
> +	flush_work(&vgdev->ctrlq.dequeue_work);
> +	flush_work(&vgdev->cursorq.dequeue_work);
> +	flush_work(&vgdev->config_changed_work);
> +
> +	wait_event(vgdev->ctrlq.ack_queue,
> +		   vgdev->ctrlq.vq->num_free == vgdev->ctrlq.vq->num_max);
> +
> +	wait_event(vgdev->cursorq.ack_queue,
> +		   vgdev->cursorq.vq->num_free == vgdev->cursorq.vq->num_max);

This can wait forever, add a timeout here with wait_event_timeout().


Otherwise looks good to me.


Regards,

Nirmoy

> +
> +	vdev->config->del_vqs(vdev);
> +
> +	return 0;
> +}
> +
> +static int virtgpu_restore(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = virtio_gpu_find_vqs(vgdev);
> +	if (error) {
> +		DRM_ERROR("failed to find virt queues\n");
> +		return error;
> +	}
> +
> +	virtio_device_ready(vdev);
> +
> +	error = drm_mode_config_helper_resume(dev);
> +	if (error) {
> +		DRM_ERROR("resume error %d\n", error);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>   static struct virtio_driver virtio_gpu_driver = {
>   	.feature_table = features,
>   	.feature_table_size = ARRAY_SIZE(features),
> @@ -171,7 +225,11 @@ static struct virtio_driver virtio_gpu_driver = {
>   	.probe = virtio_gpu_probe,
>   	.remove = virtio_gpu_remove,
>   	.shutdown = virtio_gpu_shutdown,
> -	.config_changed = virtio_gpu_config_changed
> +	.config_changed = virtio_gpu_config_changed,
> +#ifdef CONFIG_PM_SLEEP
> +	.freeze = virtgpu_freeze,
> +	.restore = virtgpu_restore,
> +#endif
>   };
>   
>   static int __init virtio_gpu_driver_init(void)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..1279f998c8e0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -300,6 +300,7 @@ void virtio_gpu_deinit(struct drm_device *dev);
>   void virtio_gpu_release(struct drm_device *dev);
>   int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
>   void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
> +int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev);
>   
>   /* virtgpu_gem.c */
>   int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 1c15cbf326b7..cbebe19c3fb3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -114,15 +114,28 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
>   	vgdev->num_capsets = num_capsets;
>   }
>   
> -int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> +int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
>   {
>   	struct virtqueue_info vqs_info[] = {
>   		{ "control", virtio_gpu_ctrl_ack },
>   		{ "cursor", virtio_gpu_cursor_ack },
>   	};
> -	struct virtio_gpu_device *vgdev;
> -	/* this will expand later */
>   	struct virtqueue *vqs[2];
> +	int ret;
> +
> +	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
> +	if (ret)
> +		return ret;
> +
> +	vgdev->ctrlq.vq = vqs[0];
> +	vgdev->cursorq.vq = vqs[1];
> +
> +	return 0;
> +}
> +
> +int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> +{
> +	struct virtio_gpu_device *vgdev;
>   	u32 num_scanouts, num_capsets;
>   	int ret = 0;
>   
> @@ -206,13 +219,11 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>   	DRM_INFO("features: %ccontext_init\n",
>   		 vgdev->has_context_init ? '+' : '-');
>   
> -	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
> +	ret = virtio_gpu_find_vqs(vgdev);
>   	if (ret) {
>   		DRM_ERROR("failed to find virt queues\n");
>   		goto err_vqs;
>   	}
> -	vgdev->ctrlq.vq = vqs[0];
> -	vgdev->cursorq.vq = vqs[1];
>   	ret = virtio_gpu_alloc_vbufs(vgdev);
>   	if (ret) {
>   		DRM_ERROR("failed to alloc vbufs\n");
