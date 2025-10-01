Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D0BB0608
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D59310E2ED;
	Wed,  1 Oct 2025 12:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T5hM4MQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FFF10E0AD;
 Wed,  1 Oct 2025 12:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XILRTRxKNofIkoVJ4TGPOV05owKMpCgft3fm4skoasmGjuYJ03w2/DMTcu0W+gNkxZpfojhMZRCxJJqZu6yRn5TRUW19E3nnyHlOd0Psber4g7trvRSEXsjFa4P2WxWOHZHxd42k9npTjbfyVL65q16S1bJCPkPgpeLXCtPi8cH/e8qF545oqQw4u4Rke8YNb7XtOH2bw2Xa+GxoxNIE6VD8rN1wqrHmCmA3+2InzeuzHM436KGBjjNwQMkGb40AycG/ivFp2GKrq8ezz7lEjsY14wgWexV3Iuu0f5G3BGCTdoPNsHRQ4f92f+PSXdUzN2AZlF2DM6M0jWjF2yRGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NVyq93/yuTHP7WQ/0VCB59I8MzW7qM+7Z+8CJwmjTw=;
 b=jk/TGJbudFYIauEfDEo9nni1Tr4262rVMjHKxFAjQBzQ6GDsXtj04yy5sTCf7K0K0IvVgzrF1LsUZgoAgrnZMQdU/96TCOsGse3oqHFiulv3BPeHzve3bqs/Zudj79laAF+nsjh5fdZQVgeS0E/LFe/A/J5zWbEeYoSGtCUyYMpa9bULIm6/lkpI1aWFaUB/SFHdHwCK1ND9yu9uNXyOysQcVa33rzhHB1DBqErL8frnc50HZQ290eE1EVrVarH6Nn7Z/7ETeP8JnBOyjwUCKS8Lj34tMby3ceyY3V00TT/QQN+PD9EGPE62T7Ddn0A2uz/U8lL9cEEnEdqKbqy5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NVyq93/yuTHP7WQ/0VCB59I8MzW7qM+7Z+8CJwmjTw=;
 b=T5hM4MQPtBAZ4gkyDC9mcL2hBW2gFZFly6OYb52AY+Bbv/89zPAlRLpHkEpK91VHJBYIA9ULJXRoYXuN6lNjV4QnA+fQ+rvBipNRoehF+Gc1wOwHeZGhpietWVzXhjlEGyXOwLKkM638g4HYnFno1n+9R9+y6KnQL08F12AEPklwk92qLrONHexxhokp+p+W84Fur1sxNeSIAM/pUyf+AS52hbN2EEupDblYV+QX13upjmFd2iBWC4WpWct/tBJtT/eP8OgX81t+mcbjX83M4guDiIxInibDMANGatA9f9pQqdKs4cQXWLJg1bRQVkonexVN841ok5gwjXvTDkEwRQ==
Received: from SJ0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:a03:3a0::32)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 12:47:47 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::d1) by SJ0PR03CA0267.outlook.office365.com
 (2603:10b6:a03:3a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 12:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:47:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 1 Oct
 2025 05:47:36 -0700
Received: from [10.221.136.222] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 05:47:31 -0700
Message-ID: <f0cc9358-98b2-48c4-b080-c16728dcd40b@nvidia.com>
Date: Wed, 1 Oct 2025 14:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <lyude@redhat.com>, <dakr@kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <jfalempe@redhat.com>, <javierm@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251001121610.367243-1-tzimmermann@suse.de>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20251001121610.367243-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 41348a3f-3c04-4329-e7c0-08de00e8b94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHMzTm05M1Y2ZXN6Zk5OUkdjR2FUeXFCcmpJaEc1ckdnblNBSzlLT2hxUlRL?=
 =?utf-8?B?dmxVNmJydU5adHlCYkpOb095M3M5c0xMeGVYRmhteXpqRkY2bmliWXVEbWEv?=
 =?utf-8?B?TXpRREVaMVN3c0tRWk5pNFlXd0drRnZleGxJNmlUZm9kY2crdkpkRGtMa3N1?=
 =?utf-8?B?UEJRT0ZMOHpMRUtKUjVkYktITG1uTmwyQ3EvS0ZmbzJBSmJrNm8waWswNTlv?=
 =?utf-8?B?U1djcWtjY1hhdGRtVTcwck9Iam1nUHB3VlprRUdtQW1LMjBXTG9nbDZlNHA5?=
 =?utf-8?B?OEx3ZSs0djVkQXBBZVB3bnlBTENqeDc3WmswNWdmeHp4NHhrTi95dXN4bXpu?=
 =?utf-8?B?bnFmMzRxUmJsSldZZUlVWk90WXBmSmlqYXBlMnJjc3ArYWtWYWRkNWFyaUNG?=
 =?utf-8?B?Vm45S0tkNnlmZ1l1UzNicEhwQmJFV0dwWldCRDEvSkdHUFRla1gvN2w1OXpt?=
 =?utf-8?B?eUYzTzlWOHk1VVdBNW5Wa2hHUGhoa3g1WWgrWkZTT1IxNGdXN2NnMXpaWjFL?=
 =?utf-8?B?Wi9mQ2EvYmtxY01acDZtcUVjOGRSSEsycGJ4RkxTYW51UWVKOEp2bWdXSDEx?=
 =?utf-8?B?WUExQ05vc3VFVGNpMTZmYVBVVi9wMnhZaWJma21xV3RVQ05vN3lKSVQ5WTJZ?=
 =?utf-8?B?YUFGVzIyUDQ3Ri96S2NPRnpnMjE4Z2h1eUc2TXVPNWVVaTRrUGhZSy9DQ2Jz?=
 =?utf-8?B?VldGcTRHd0VnZ3ppdzdFREYxaE5iYythVXNNM0tIdXBJRU1waDVRdHV3ZWVU?=
 =?utf-8?B?RXZVa1F3OEhvNnJFTlJFMFI0YmlIbVcxb0VEOE0rckZZbExuL0Nvalc4bHRr?=
 =?utf-8?B?azdGeU1EYThVUVVlZlhNSUZRaHNFYnFGQWdoV0FydGxQYmVaSXBwbFRub2hQ?=
 =?utf-8?B?eU1hQm4zK0pCMnBNalltaElGK2xSRVViZkhVV0lXWDBQcHMzTHdOejRIa1Nu?=
 =?utf-8?B?eGxoYmNVZkxxSk8wTTRTd1lNV3hMS01KU2hsSHN2MlBXYllOd3h2QXJaOHBT?=
 =?utf-8?B?OE5KQUtDckY2L0M1a2lvNEpZNXdDUXJ1SEliNlFlR2NVTnJuQUdEUjNhb0RL?=
 =?utf-8?B?Q3lyd3ZRenZIcnFncEdmNUdIZ0pLcEVFbWtJYTJWaGZjd1VEYng4NE8wd2Fm?=
 =?utf-8?B?OG1yOEJqLzBKUERuYW5QeU5FTHBBbVYwelR2azNFN2RJbWJCN1lSODN6U3NE?=
 =?utf-8?B?RnVNVVpCRDR5QjY1SmlEd2p6bnVIRmpCUWZlbmlFUVlyRHIzdFM1RlhZckRS?=
 =?utf-8?B?azEwZDBXYUtxR0NaaVhOWVpLSkZDSUJpZVhMQkM5MzFXLzdJekVmSDhsNWFz?=
 =?utf-8?B?QllyNnVBQnUxM1E3SjJpVXZIckUrRHBIZXNGa2IwZmZ6OWZxRFZUcHFCZ2R4?=
 =?utf-8?B?ZTg3Z1dyNnFSR3pwWFd0dzFBbWZCZmt1ZEdvK3RXZFZNVXZsRjBJUGo1cXVv?=
 =?utf-8?B?QVlUWDZrZDYrYmYvRjlIMnJJRklCRXpBQlMwbHpVVm0rSDg4YmgyUUlZNkla?=
 =?utf-8?B?TUloS3FlTDBDZmlyUUU2KzRnZVlkQ0NVcTBKWlZnd2FoT1BWRUlFdnNvcVZU?=
 =?utf-8?B?Nk5NK3hYSklmMjdBU3ZjQlI3TzFoZTdGY09Dd1lnbnkvOXBFYXFZOFo1TjBi?=
 =?utf-8?B?TGJPMkxiRzl4d3RZN1BRblBzc1JOZy9vMnpvejdEdHNEUUE2L0ZyYkdWRmJX?=
 =?utf-8?B?YldPQmZMcnh6b3IxQStRemhyaDkzWSttR1c1V1Mwbkp6TlNycytKTXQ0ZThC?=
 =?utf-8?B?dDRQNlBSQ2QrVk43T2phNkVlUkZSOVpXbGNpS2dJOWJTWVpOMHRsMVA1WHhM?=
 =?utf-8?B?UGRnS3B6WmpDV01WaTVnZWRjRFR6L2VSYVVEQnBjYURabHNXaC9mQW1aS21z?=
 =?utf-8?B?WnN5MXUyVEVXMTJESndEbGlSVkFqazZkMXEyZlF0UFl5T0F5LzVZWVpiYXh6?=
 =?utf-8?B?aGZzbDFUaEZQaHoxWGppSDNWNHpjcWVEMkdQbGJIWmlkdThVU0tYVlZDNjkv?=
 =?utf-8?B?WlJBOFA0TFJtZkNDdkEydWYwZUM0L0gzS2NvbkU2VjEwY3ZXaUh3U0t2Mmdi?=
 =?utf-8?B?KzRqTHlVbDZwT2xUVEVmR2pONGhzc3B0RnVsMVpBNDBidmx1cVVkbGpTdDF0?=
 =?utf-8?Q?p64nQjdDr10ovUbmmjeQQ6Yjb?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:47:47.4234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41348a3f-3c04-4329-e7c0-08de00e8b94e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825
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


On 01.10.25 14:15, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]
Acked-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
> This patch would preferably be merged through drm-misc.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++----
>   drivers/gpu/drm/clients/drm_fbdev_client.c | 14 ++++----------
>   drivers/gpu/drm/clients/drm_log.c          |  4 ++--
>   drivers/gpu/drm/drm_client_event.c         | 16 ++++++++--------
>   drivers/gpu/drm/drm_modeset_helper.c       |  6 +++---
>   drivers/gpu/drm/i915/i915_driver.c         |  6 +++---
>   drivers/gpu/drm/nouveau/nouveau_display.c  |  4 ++--
>   drivers/gpu/drm/radeon/radeon_device.c     |  4 ++--
>   drivers/gpu/drm/xe/display/xe_display.c    |  6 +++---
>   include/drm/drm_client.h                   | 14 ++------------
>   include/drm/drm_client_event.h             |  4 ++--
>   11 files changed, 35 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a77000c2e0bb..f068e26d5080 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5212,7 +5212,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>   		dev_warn(adev->dev, "smart shift update failed\n");
>   
>   	if (notify_clients)
> -		drm_client_dev_suspend(adev_to_drm(adev), false);
> +		drm_client_dev_suspend(adev_to_drm(adev));
>   
>   	cancel_delayed_work_sync(&adev->delayed_init_work);
>   
> @@ -5346,7 +5346,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>   	flush_delayed_work(&adev->delayed_init_work);
>   
>   	if (notify_clients)
> -		drm_client_dev_resume(adev_to_drm(adev), false);
> +		drm_client_dev_resume(adev_to_drm(adev));
>   
>   	amdgpu_ras_resume(adev);
>   
> @@ -5951,7 +5951,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>   				if (r)
>   					goto out;
>   
> -				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
> +				drm_client_dev_resume(adev_to_drm(tmp_adev));
>   
>   				/*
>   				 * The GPU enters bad state once faulty pages
> @@ -6286,7 +6286,7 @@ static void amdgpu_device_halt_activities(struct amdgpu_device *adev,
>   		 */
>   		amdgpu_unregister_gpu_instance(tmp_adev);
>   
> -		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
> +		drm_client_dev_suspend(adev_to_drm(tmp_adev));
>   
>   		/* disable ras on ALL IPs */
>   		if (!need_emergency_restart && !amdgpu_reset_in_dpc(adev) &&
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..ec5ab9f30547 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -62,26 +62,20 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>   	return ret;
>   }
>   
> -static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_fbdev_client_suspend(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   
> -	if (holds_console_lock)
> -		drm_fb_helper_set_suspend(fb_helper, true);
> -	else
> -		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
> +	drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>   
>   	return 0;
>   }
>   
> -static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_fbdev_client_resume(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   
> -	if (holds_console_lock)
> -		drm_fb_helper_set_suspend(fb_helper, false);
> -	else
> -		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
> +	drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..fd8556dd58ed 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -319,7 +319,7 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
>   	return 0;
>   }
>   
> -static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
> +static int drm_log_client_suspend(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   
> @@ -328,7 +328,7 @@ static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_l
>   	return 0;
>   }
>   
> -static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lock)
> +static int drm_log_client_resume(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..c3baeb4d4e6b 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -122,7 +122,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>   	mutex_unlock(&dev->clientlist_mutex);
>   }
>   
> -static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_client_suspend(struct drm_client_dev *client)
>   {
>   	struct drm_device *dev = client->dev;
>   	int ret = 0;
> @@ -131,7 +131,7 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
>   		return 0;
>   
>   	if (client->funcs && client->funcs->suspend)
> -		ret = client->funcs->suspend(client, holds_console_lock);
> +		ret = client->funcs->suspend(client);
>   	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>   
>   	client->suspended = true;
> @@ -139,20 +139,20 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
>   	return ret;
>   }
>   
> -void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
> +void drm_client_dev_suspend(struct drm_device *dev)
>   {
>   	struct drm_client_dev *client;
>   
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry(client, &dev->clientlist, list) {
>   		if (!client->suspended)
> -			drm_client_suspend(client, holds_console_lock);
> +			drm_client_suspend(client);
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }
>   EXPORT_SYMBOL(drm_client_dev_suspend);
>   
> -static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_client_resume(struct drm_client_dev *client)
>   {
>   	struct drm_device *dev = client->dev;
>   	int ret = 0;
> @@ -161,7 +161,7 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
>   		return 0;
>   
>   	if (client->funcs && client->funcs->resume)
> -		ret = client->funcs->resume(client, holds_console_lock);
> +		ret = client->funcs->resume(client);
>   	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>   
>   	client->suspended = false;
> @@ -172,14 +172,14 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
>   	return ret;
>   }
>   
> -void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
> +void drm_client_dev_resume(struct drm_device *dev)
>   {
>   	struct drm_client_dev *client;
>   
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry(client, &dev->clientlist, list) {
>   		if  (client->suspended)
> -			drm_client_resume(client, holds_console_lock);
> +			drm_client_resume(client);
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 988735560570..a57f6a10ada4 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -203,10 +203,10 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
>   	if (dev->mode_config.poll_enabled)
>   		drm_kms_helper_poll_disable(dev);
>   
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>   	state = drm_atomic_helper_suspend(dev);
>   	if (IS_ERR(state)) {
> -		drm_client_dev_resume(dev, false);
> +		drm_client_dev_resume(dev);
>   
>   		/*
>   		 * Don't enable polling if it was never initialized
> @@ -252,7 +252,7 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
>   		DRM_ERROR("Failed to resume (%d)\n", ret);
>   	dev->mode_config.suspend_state = NULL;
>   
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>   
>   	/*
>   	 * Don't enable polling if it is not initialized
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 95165e45de74..162e50315beb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -978,7 +978,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>   	intel_runtime_pm_disable(&i915->runtime_pm);
>   	intel_power_domains_disable(display);
>   
> -	drm_client_dev_suspend(&i915->drm, false);
> +	drm_client_dev_suspend(&i915->drm);
>   	if (intel_display_device_present(display)) {
>   		drm_kms_helper_poll_disable(&i915->drm);
>   		intel_display_driver_disable_user_access(display);
> @@ -1060,7 +1060,7 @@ static int i915_drm_suspend(struct drm_device *dev)
>   	/* We do a lot of poking in a lot of registers, make sure they work
>   	 * properly. */
>   	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>   	if (intel_display_device_present(display)) {
>   		drm_kms_helper_poll_disable(dev);
>   		intel_display_driver_disable_user_access(display);
> @@ -1257,7 +1257,7 @@ static int i915_drm_resume(struct drm_device *dev)
>   
>   	intel_opregion_resume(display);
>   
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>   
>   	intel_power_domains_enable(display);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 54aed3656a4c..00515623a2cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -765,7 +765,7 @@ nouveau_display_suspend(struct drm_device *dev, bool runtime)
>   {
>   	struct nouveau_display *disp = nouveau_display(dev);
>   
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>   
>   	if (drm_drv_uses_atomic_modeset(dev)) {
>   		if (!runtime) {
> @@ -796,7 +796,7 @@ nouveau_display_resume(struct drm_device *dev, bool runtime)
>   		}
>   	}
>   
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>   }
>   
>   int
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 9e35b14e2bf0..60afaa8e56b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1635,7 +1635,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>   	}
>   
>   	if (notify_clients)
> -		drm_client_dev_suspend(dev, false);
> +		drm_client_dev_suspend(dev);
>   
>   	return 0;
>   }
> @@ -1739,7 +1739,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
>   		radeon_pm_compute_clocks(rdev);
>   
>   	if (notify_clients)
> -		drm_client_dev_resume(dev, false);
> +		drm_client_dev_resume(dev);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 19e691fccf8c..d3cc6181842c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -324,7 +324,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>   	 * properly.
>   	 */
>   	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(&xe->drm, false);
> +	drm_client_dev_suspend(&xe->drm);
>   
>   	if (intel_display_device_present(display)) {
>   		drm_kms_helper_poll_disable(&xe->drm);
> @@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>   		return;
>   
>   	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(&xe->drm, false);
> +	drm_client_dev_suspend(&xe->drm);
>   
>   	if (intel_display_device_present(display)) {
>   		drm_kms_helper_poll_disable(&xe->drm);
> @@ -481,7 +481,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>   
>   	intel_opregion_resume(display);
>   
> -	drm_client_dev_resume(&xe->drm, false);
> +	drm_client_dev_resume(&xe->drm);
>   
>   	intel_power_domains_enable(display);
>   }
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..3556928d3938 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -70,13 +70,8 @@ struct drm_client_funcs {
>   	 * Called when suspending the device.
>   	 *
>   	 * This callback is optional.
> -	 *
> -	 * FIXME: Some callers hold the console lock when invoking this
> -	 *        function. This interferes with fbdev emulation, which
> -	 *        also tries to acquire the lock. Push the console lock
> -	 *        into the callback and remove 'holds_console_lock'.
>   	 */
> -	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
> +	int (*suspend)(struct drm_client_dev *client);
>   
>   	/**
>   	 * @resume:
> @@ -84,13 +79,8 @@ struct drm_client_funcs {
>   	 * Called when resuming the device from suspend.
>   	 *
>   	 * This callback is optional.
> -	 *
> -	 * FIXME: Some callers hold the console lock when invoking this
> -	 *        function. This interferes with fbdev emulation, which
> -	 *        also tries to acquire the lock. Push the console lock
> -	 *        into the callback and remove 'holds_console_lock'.
>   	 */
> -	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
> +	int (*resume)(struct drm_client_dev *client);
>   };
>   
>   /**
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
> index 1d544d3a3228..c3f318788b71 100644
> --- a/include/drm/drm_client_event.h
> +++ b/include/drm/drm_client_event.h
> @@ -11,8 +11,8 @@ struct drm_device;
>   void drm_client_dev_unregister(struct drm_device *dev);
>   void drm_client_dev_hotplug(struct drm_device *dev);
>   void drm_client_dev_restore(struct drm_device *dev);
> -void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
> -void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
> +void drm_client_dev_suspend(struct drm_device *dev);
> +void drm_client_dev_resume(struct drm_device *dev);
>   #else
>   static inline void drm_client_dev_unregister(struct drm_device *dev)
>   { }
