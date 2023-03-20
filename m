Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD46C225E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8476010E645;
	Mon, 20 Mar 2023 20:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE47510E63C;
 Mon, 20 Mar 2023 20:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeZ03eckdTo1gqG8VvExWl3U7ne14wN7n8xTdmLuLtUTq7jEXTWPiefaursJaT7kO0E3x68Gkk+s8ITNkXPkXwfMI/9rRB+fd/cwZEdxQAcs6bP+mXH0nsHvrr9VhZQtm3fEFRmp+Txy/JiacltsrqVOwQvL9n/BMT096Kftx2LJL6pISR7shGo3JzZx5LfKz/9l617iEuQguz5ffpQtlQ45GcGgiwca3h3Y0HU2IlexBDcOPwq3UhrdrneKgAo532IM0vY7wCDv0qYUeMpwotyBaum4nWeXP3w44YP8V6H2/yTue3HdN45Y/WhmnPEVE+hb+eGinbuE9njli33d+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1lMq9SLafKVX3VQCv/Vu2iKIG6+mCPwi5iUPX73QCw=;
 b=aZSklyti3CCGYoOaPXUFDV4NCeBRbfajigbrTAD9Oj77CVuHUz6VdandHHaVhBwB0BP5DLWTHvNxzS8SdA009qmEZjndwT4TClnGCfeJ1+iVUAobKRC5sFL2u/EGNEYEJJUhbzoZJkXD0bdE6FKjyw8RGuNokFdQ2yKdgTrru41HrN2w/2yb8ROen2OeilSaDXfG+xZ/fondQCwROGcVvwEWZq/dAdcrFirRYW/PAxNlcxufO80s0hMY/EGRfFCTjd6C4pB8O2nppe7CJ7ARvt637ujng5oWxGNvTSoGcaZ8luHHig8hA6f7nFRZ25IjgJ3XrMwsEb9YhCNezz6PNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1lMq9SLafKVX3VQCv/Vu2iKIG6+mCPwi5iUPX73QCw=;
 b=oECJYq6KYhxA+ZbAjJqf5KgbRT5GbCoo9HRJ8CsTLUCGrNCl2TyzkLiicvG2K9TDL7KfQcUHhEZaEZt50YEsWqPpZCDi8uOU65eMdXps0YEfX7x8cs5v8D6d5pen47G5bsYHMWPJf+VMxd8EAJtb/F1Q/3kWUa4b+nofZxbtB4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 20:16:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:16:26 +0000
Message-ID: <e1991c95-d9f2-f20e-6e0e-045e0a391d12@amd.com>
Date: Mon, 20 Mar 2023 16:16:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/32] drm/amdgpu: prepare map process for multi-process
 debug devices
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-14-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-14-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4033ba9f-4958-426a-6daf-08db297ffb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhcWtLekA8BMROAX1Xvd1QRZ2tHhzLrjO7Grkp6GX8+kgbZDiXzCqxDe3B27HNcamd7+tFT8TFkij8kglJkDSJ0E0Bmw59q546A7BtbJ1IFholk8oz64WIB9rmMt2heGZd5Bhz46Ujfn8sewTvKVH7hEhsgtV1xEhRYdvL3vEV1PQBYtSXaDIO3Cv+GyV6a0qzZLa7fD7tGxVV2tq3y8zTzH8edEJ3xqU006TbXTRNUITvESu9XRYN/76+Mqv3VUgtwGe7gypapto167nkyIg9Y3bkwHBC0JHhD0QDJpEAloGbcd0OtZfGrdb7pLBEgGJjS+r184yQOFQecUQZL9Z20eu85qycYtm0L4xkvNVhNzf3mw/2Bvgc85nhRhEia/okFfjASyxFohuxMnaEg4Ld+MLCWLwXu2rRII1CbngmlRgHQWpWQvEP9H4Ix+NzKeAvMpMH88X/p8Ro+RxFySHorL6nZCetZ8S4bW7beVN50jPpXID82Yblpzxgc6ekYGFDmO7m6DBtJEPN2wQ+YVINZPcdHRKEHgutsAVAeWBFqbHGZpM4pVJFFDR5MJXAme/aoL5PQk8WjVUDmQ9wXdFeaMs0lMHeoWq/adfji8FD55Esv4Zbu9S5S7jOFTkMxwj7Jd8JxXb76AVJA4yx5deXjwVvdDLNpaqTmXVIRaq2wqYo1mwS24nYipVoEgBjNPhWGAUSHBAIhLLIunbmNa+233kVIMpzxNSdYwKSc/MXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(44832011)(8936002)(41300700001)(5660300002)(31696002)(86362001)(36756003)(38100700002)(2906002)(83380400001)(6506007)(31686004)(53546011)(6512007)(478600001)(36916002)(186003)(6486002)(26005)(8676002)(66476007)(66556008)(66946007)(450100002)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2t1U0hxZmRmVlcvQjI4VGlGUUhtcnRNL2hKVS84cDYrNjlFOFJQVTlpNTAr?=
 =?utf-8?B?ZGU0VS8wWnJvRUFzaDNxWTAxVmVVMDIzbFJ1eVBMelRFMlhqQVN2TWxOMzAx?=
 =?utf-8?B?MDlteVhXN2s3T0xBbzgwVk5nempZWkNVdzZNK1JQMDZIbHVPNnJpQ0k0Z0k3?=
 =?utf-8?B?OTgwMjZsTzNKZm5jM2NTcW5yeHBiNnNOcWFrbEM1bC9rbmdMeDE3VHE3Ukky?=
 =?utf-8?B?WXlyWmcyWkVSbDQ0RkU5b09vU3E1TjUvRDZIaUwyYjFLQVorajdmazFKMEhn?=
 =?utf-8?B?K0xkTk93WFBXSWtaWFlXQ3pOKzg0bC9wWGE2di9hS3NsZ1FjRUttVDVGdlhx?=
 =?utf-8?B?aDlvb3V0YU5kS2xiV00weVd3Rm9MVHVrUU50Nk9UUjJyOXhRNnYvdE9leGdw?=
 =?utf-8?B?Yzk4S1NoZitPTHNWM3VFby8zdU1pUDM3LzVydjBnYWZkWnFvZFBySnNiVS9I?=
 =?utf-8?B?ZGdyZExqMnRGNk1uRVFrTVNIQzd6RkJ3cEEyRnBpYnhob1lXVVpZYUVxY2ZL?=
 =?utf-8?B?ZmRxUWp5S0FrL0RVQTNJWEo1ZGNFcFE3TGFTZXoxM2Z5VTZzdEdqZVVaR2pZ?=
 =?utf-8?B?aFNOTkw5Q2ZyOTBtU2xSTHNqMlhyaHhURUVQWkFoWmlqSjlzUlFBa2FYZVdl?=
 =?utf-8?B?T3R1akQwVjRlcU9WRTNsTCtoaXRpZUU3cjRsdFB1OGI3dW5QYUdGRmpKZG90?=
 =?utf-8?B?NzR1aXBRRnlNWUM2bytlYUhHeVZZZktEbnpMc2J1bC9TbDljcFQ5S01naTFz?=
 =?utf-8?B?Sm9DSmo0YXI5TytTUVZFL3g2VmxUVnNsYUJzTE8yTDdsc1MvNGFVM1RUUHJh?=
 =?utf-8?B?K3htV3h4bWFVVTVTMUdyejMyaWxSRkxGOUhOdTFHZEFmZjB2ZGMwUW14QWh1?=
 =?utf-8?B?bXRadFQ2OCtUQ1dhRnkyM0dodXp5ek1iWVJCTUVpcjlzdmhkYitrQ3JmNmtp?=
 =?utf-8?B?dU5QZnZ6dEFnM3dTakYzbUFnakNaRTVRbXNUclVtNEc3NWdCVVVYUXREWk15?=
 =?utf-8?B?OEtTRkdmdEFsYVdBeTJiWHIxYW5CK2JhbkRPajRFZ3IvSkViT0dsaU1BZWM0?=
 =?utf-8?B?UFdsNi9pSDd3SWFkZzZ5cVVJcExEMEVVTkJWNGU0MC9SUlRiNUpjbmxpaERR?=
 =?utf-8?B?bzNrd2oxQlNwUmgxREd5QjhJL0NzZGJVZEcyMmNnTU9Vdnk2WVR6ZXNnMFd5?=
 =?utf-8?B?ems0ZXVLMUZGVGNVR1VlckxMbWxQYU9GSkpXMWphUEdmSytSaExRSDRZL1pH?=
 =?utf-8?B?YS96aXZRMkRrUkRUekw4bFg0MTNaUSswRTAzVk1wWldXVm1IMUpidnRkYkF2?=
 =?utf-8?B?YjBpNHluYjVPcHVBMXB2MXhYbVFGMVFGc0lHUkt5K1k5UXJRMEk0YWNybm1q?=
 =?utf-8?B?ZHVadURlV3EveWRhYTJ5bjl1TVRDL0s0NkVkc1lNcUJSeTMvTXBtcy9DdkVy?=
 =?utf-8?B?bStWWnh0QUVBMUZ2Ri9BK09wd3B0NmQxSUhZMlZsRmhEem1MTVI4K2JjNTlo?=
 =?utf-8?B?a0VoMHJ6QzRIR0NMT0MrZGFIUE9KWjNyWTZpazVxZkN1RjRrQjFSQnNKMzht?=
 =?utf-8?B?US90Vkc0RGR1RzRkTXZ1eXJFSG55cGdSd0xlbEQrSDU2NStOeXlwVllmYlM1?=
 =?utf-8?B?dTVJakk3TU1aOG01dzNBNTdRb0NmcW5tQ0E3VDc1ajZESjExeVdBNUxEQmU4?=
 =?utf-8?B?U25IU0VRTGh6S1JTdFFWV0RZT2RrMTIvZFFXUXMxcjgwdUZNaVJaaU9CaFlJ?=
 =?utf-8?B?M1BVOURMclJpRWZ6VHh5VkwvaUlPZWt3bmlEVEJjT215b09FS2FONm40akt5?=
 =?utf-8?B?WEZsNXRMWVVWQ2pQdG9VdnRXQ3N6VVFOb2o3TlY0MHl1NzRwN2djbXd0ZmlU?=
 =?utf-8?B?UEY5TGd2TmZsUlV6L1Nia2xtRzFHeXF5SHdIbDVnVEtaVVF2NWRCQlhaeHVm?=
 =?utf-8?B?N0Nvemhia0tObEVZa0dNS3RwYnRBVEUrUWh6ZDQwbUNpUkVZNGZZL2ppdDda?=
 =?utf-8?B?Zzd6bW5RM3Y5czNyeVJXVFBaY21La2p3eTM1dGFjNFRQR1ZEeWsvQ3VEYnFv?=
 =?utf-8?B?cHExTVREMEVnSDZKK3V5SW53bTJhdFBEdk8zQ0lVbmsvNXJ0anRqalluekVl?=
 =?utf-8?Q?zQJS16AHfnuj52m8Ki2EEhoQn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4033ba9f-4958-426a-6daf-08db297ffb91
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:16:26.3285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zexgtSCvTT2OYlodNkTmcQQuLIXbyAWSLxCYV+PnuboQDuM/jv66hp7xmEE+5F8iWrxyoL5nJnYumCDMocNmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> Unlike single process debug devices, multi-process debug devices allow
> debug mode setting per-VMID (non-device-global).
>
> Because the HWS manages PASID-VMID mapping, the new MAP_PROCESS API allows
> the KFD to forward the required SPI debug register write requests.
>
> To request a new debug mode setting change, the KFD must be able to
> preempt all queues then remap all queues with these new setting
> requests for MAP_PROCESS to take effect.
>
> Note that by default, trap enablement in non-debug mode must be disabled
> for performance reasons for multi-process debug devices due to setup
> overhead in FW.
>
> v2: remove asic family code name comment in per vmid support check
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  7 +++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 50 +++++++++++++++++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
>   .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 15 ++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  9 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 ++
>   6 files changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 8aa7a3ad4e97..53c5a3e55bd2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -32,5 +32,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
>   			uint32_t *runtime_info_size);
> +
> +static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
> +{
> +	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
> +}
> +
>   void debug_event_write_work_handler(struct work_struct *work);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0cd3a5e9ff25..2517716d7cbc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2554,6 +2554,56 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   	return r;
>   }
>   
> +int debug_lock_and_unmap(struct device_queue_manager *dqm)
> +{
> +	int r;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
> +		return 0;
> +
> +	dqm_lock(dqm);
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, 0, false);
> +	if (r)
> +		dqm_unlock(dqm);
> +
> +	return r;
> +}
> +
> +int debug_map_and_unlock(struct device_queue_manager *dqm)
> +{
> +	int r;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
> +		return 0;
> +
> +	r = map_queues_cpsch(dqm);
> +
> +	dqm_unlock(dqm);
> +
> +	return r;
> +}
> +
> +int debug_refresh_runlist(struct device_queue_manager *dqm)
> +{
> +	int r = debug_lock_and_unmap(dqm);
> +
> +	if (r)
> +		return r;
> +
> +	return debug_map_and_unlock(dqm);
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static void seq_reg_dump(struct seq_file *m,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index 0cb1504d24cf..bef3be84c5cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -286,6 +286,9 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
>   int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
> +int debug_lock_and_unmap(struct device_queue_manager *dqm);
> +int debug_map_and_unlock(struct device_queue_manager *dqm);
> +int debug_refresh_runlist(struct device_queue_manager *dqm);
>   
>   static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 363cf8e005cc..f19c506da23d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -88,6 +88,10 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
>   {
>   	struct pm4_mes_map_process_aldebaran *packet;
>   	uint64_t vm_page_table_base_addr = qpd->page_table_base;
> +	struct kfd_dev *kfd = pm->dqm->dev;
> +	struct kfd_process_device *pdd =
> +			container_of(qpd, struct kfd_process_device, qpd);
> +	int i;
>   
>   	packet = (struct pm4_mes_map_process_aldebaran *)buffer;
>   	memset(buffer, 0, sizeof(struct pm4_mes_map_process_aldebaran));
> @@ -102,6 +106,17 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
>   	packet->bitfields14.num_oac = qpd->num_oac;
>   	packet->bitfields14.sdma_enable = 1;
>   	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
> +	/* TRAP_EN is set on boot so keep it set in non-debug mode. */

I don't understand how the comment relates to the code here. Where is 
that TRAP_ENABLE bit being set or preserved?

Regards,
   Felix


> +	packet->spi_gdbg_per_vmid_cntl = pdd->spi_dbg_override |
> +						pdd->spi_dbg_launch_mode;
> +
> +	if (pdd->process->debug_trap_enabled) {
> +		for (i = 0; i < kfd->device_info.num_of_watch_points; i++)
> +			packet->tcp_watch_cntl[i] = pdd->watch_points[i];
> +
> +		packet->bitfields2.single_memops =
> +				!!(pdd->process->dbg_flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP);
> +	}
>   
>   	packet->sh_mem_config = qpd->sh_mem_config;
>   	packet->sh_mem_bases = qpd->sh_mem_bases;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index d557a7ae756c..8f1e2f9023db 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -782,6 +782,12 @@ struct kfd_process_device {
>   	uint64_t faults;
>   	uint64_t page_in;
>   	uint64_t page_out;
> +
> +	/* Tracks debug per-vmid request settings */
> +	uint32_t spi_dbg_override;
> +	uint32_t spi_dbg_launch_mode;
> +	uint32_t watch_points[4];
> +
>   	/*
>   	 * If this process has been checkpointed before, then the user
>   	 * application will use the original gpu_id on the
> @@ -918,6 +924,9 @@ struct kfd_process {
>   
>   	bool xnack_enabled;
>   
> +	/* Tracks debug per-vmid request for debug flags */
> +	bool dbg_flags;
> +
>   	/* Work area for debugger event writer worker. */
>   	struct work_struct debug_event_workarea;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index e935158ab311..94c6545a58b4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1556,6 +1556,11 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
>   	}
>   
>   	p->pdds[p->n_pdds++] = pdd;
> +	if (kfd_dbg_is_per_vmid_supported(pdd->dev))
> +		pdd->spi_dbg_override = pdd->dev->kfd2kgd->disable_debug_trap(
> +							pdd->dev->adev,
> +							false,
> +							0);
>   
>   	/* Init idr used for memory handle translation */
>   	idr_init(&pdd->alloc_idr);
