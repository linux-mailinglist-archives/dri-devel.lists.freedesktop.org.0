Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610B389BD9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269E6E831;
	Thu, 20 May 2021 03:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758666E830;
 Thu, 20 May 2021 03:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOckD7Xp90Fdhg772ZkNymtsEKESEqmagiPyc9hRV9LvXeCyaCMXzm76smM/GsuIRfJ3/4JGcvEObwU25AbfMOGYn/U+ucG7ToI98jDpGh96bwHdXOqdfIigEiA8geBQZOSNnZm3w93dgC/8YXOfDssIjog7yuwntkbGylE/JcCBJCZxzyB/Xuxiz+I+Wu5YCq6Pf/u2IUem08dpNmMnvmSvXL+aau47v4Ny6jCfOQgxT/V8ggTv2zq1wg07mlgfarJ39rJPzAcNBT2Z+n0lx0lOtNUPTxm91DFG6gE4JN8SEWziRY+y4j3usSen/A8grvJtfpHYICXHfejIBKDyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjBxnD2uzjHC8gnWYk/egZD8qf1wf2yN/u0ScxXNji8=;
 b=O9speyRTwgD1SKnCLIFWfrUPMgYo5cFcN/E30G51e4W047RlbnJXu7xUiAo4Q3W54q5zFOogyR8WeIDqCTFeBEiXO0eNkSCxd5KGly81rwWU6Po/cg18GSNlYBvVjG1+c+iO/U6LrTpORgFISA3Sj+qGAducHoVelbZTmCOtFNDcoZ3s2SvoayS6rLvd9sjv6k6mKG+ERrK9qNihRD325EGQedIRCiYxvtxRbnf+OjYuhndjfvEFubbc7ro2C9MZsccIIUD1PKKy+4lk8SPZlIP7HnAqK+r7WZUheHIK2jKTBKIGp/9XdqsLyQMCkAaEqcnFXuwg1sSygqcWMsfmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjBxnD2uzjHC8gnWYk/egZD8qf1wf2yN/u0ScxXNji8=;
 b=BIqO7WId9ZV8GGFl26qEX7CnPswtcaF1qolSaA1oRJcad1Pp8BH2yedJhEKt8ZAwMHBppC6Vz2CnVI4wnRtWgmuAh/n/KguuX+Xez0nVoSh5kOqdtAnqdR72IxMkTyh4JlQ6VZEUlqZIi/AqlHDAY723MYDgTKvsxJnYUxVKHSc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5097.namprd12.prod.outlook.com (2603:10b6:408:136::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 03:29:28 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:29:28 +0000
Subject: Re: [PATCH] drm/amdgpu: Add early fini callback
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
 <20210520032057.497334-1-andrey.grodzovsky@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ab262224-fd1d-31a2-72cd-54174fba17ae@amd.com>
Date: Wed, 19 May 2021 23:29:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520032057.497334-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YT1PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::32) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YT1PR01CA0123.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Thu, 20 May 2021 03:29:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8de8dd8c-c842-4cf3-48c9-08d91b3f791f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5097:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5097F622CD5480AEABFF7F96922A9@BN9PR12MB5097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8KCHFAWNSiDP07fFrCHoPR7DX80iQERBuqvup6j6Xxo8Zb2fZV8f3DOAPNuAqLNmzVl1PhRTmVQqfJqneNx8s37SBnToW7WJ9uNuyxf2uQnm0Wf4LuVjJtsBwBSDs6+PmNTXIDKHWwVehVkmlKQ1J2RAODZOjFR9dAAc0+93B6M8TcTkLM/UJ/oVyax47sxc6js8iSv5PEslrDEqWxyg9iWUQXkiYL5JBOVk4fYLqkILqqaJrvwlZzQLZJsWmsNfPmomJAm1ATkX8GCglxEkgo9Wfq4YABDjw4ByBkjqOUMjt1/Hw0BcT6R5LGK/qOXIC3lxcXzwFRVDxeFlr/0GOPmuDBVlrKq105qrCSviCfTrsMKu9H5yJdMGxpivdlCFyCHgYuxdgHuxF4sCZaBofJtGwABSAsSTaeRRCdnviRHou3uDU3oM5BqRl0v/RdMw9aKF+LzU1JE3m+lKrkiwSWzgKcSo1ZlKUQAV7huHZq/8ptsSd3KcAK9/+H++dpbZfJurq/rTPjmQ2DmzBX7ZsqLWspXOckqcoEZxA3iheuIP/94qVnJUH9asp/Po6hSph6EZuDgXnukk+lEUAQ5sW9L4k4t1GXKHPzeH9OUzK9bM5EgcIv88WIw3wnWzBZaKz++um/PUX6BSpjpnIDk7mDNYnegp/EtUkLmMeTjfTDF3Ifril0iiZ2067TMQrBs9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(2616005)(956004)(2906002)(4326008)(44832011)(66946007)(66476007)(66556008)(8936002)(26005)(5660300002)(6486002)(16526019)(8676002)(186003)(478600001)(66574015)(86362001)(83380400001)(31686004)(31696002)(316002)(16576012)(6636002)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUFTOXJXdHljb3U2ZHpiZ216alN5RWxBNXQvUlJFN0VFUTkzWE44My9GNzli?=
 =?utf-8?B?dk92a2JMcEZZemVxeTZuT2FEcStlVVBlZmJ3Vy9UekRVZXJ3WVA3REs5RmxC?=
 =?utf-8?B?Y1FuMkVjWkNxeWxUb3pTQmQ2TVlRMFhiZExEZVRHdEhLaUt5aFBZVFdsZjYv?=
 =?utf-8?B?NmU5L001QjhWOHRFS1BlY2ttZWRnSHl4c3Q4VVlRRTdvbVlkT2RQdmJRVS84?=
 =?utf-8?B?RkRXZmNlTHpTNm5La3NGR1hIUnZUaVNzdjhzdjhscjVYcHZqV3UvS005eHAy?=
 =?utf-8?B?OVBxNWN4WnlWeEpLMG9YbGtiK2x2YVFFT2ljMkY3bXJEZldaN0FwR21IQnBF?=
 =?utf-8?B?eG1PYkhCMWo5YytkdThuR0tRSVg1b0hiVUQwYXh3R1kvOVF2QzdsNk9KU2xo?=
 =?utf-8?B?a3BMZW5wejhFckNhOUVvVUdsOVZhTTYwYVZHYmRPQWljcFFzQ2k3ZkpVLzRn?=
 =?utf-8?B?Ym9PN2k1WitRNllJZ2tPa1RlL01LbFhJMXpmaTljRUhDSXQ4Q0orNEpqcUd6?=
 =?utf-8?B?M3YyUWdFMWRidGpLY0ZkTUpOMVJqOGxDbXc4eWhRcHllYm85L283L2F3Sy9u?=
 =?utf-8?B?NElvazFib2xsc2dZcHpCdFhMb1hTSGpHcmJhUWlEYWhKZ0ZWdU1SME9kdHFt?=
 =?utf-8?B?V3ZlZnI0S0tyNGJMWmcwT3Q0NlErTUozK0UwaE9sUDFFaXlxSmVEZFNBOVZq?=
 =?utf-8?B?OW1xeDkvblNHTnBZNjJ3TE11dm83MXppYmFuMUM2Yk1FU2tBZk5LQWxpbjBR?=
 =?utf-8?B?RDlSMjBOTzd6dzBZY3RwSTdYRVM3cmFEeUJsUHlLZ0NXZkZFMEc5RUsyMGxF?=
 =?utf-8?B?ZDc1N0hoNWVCOWwrd210b2xHd0drMWZiVm8xdDdsOVkrTTRtVTRDL0hMMHZt?=
 =?utf-8?B?MlVNblNvMThNcFFTRWtxbDJhZ2k3UVJ2dENZMGdJaksxQnNBQThEVzRYQjlI?=
 =?utf-8?B?cXlQWjNGb2FyaEhhT1JkQWwzTDFPMHdZcll6aHBjL3ZTRTM4QkkvU0Q3bUNp?=
 =?utf-8?B?R3pkV0EwUGtRUDhDMm9BUVcyRTIyWGo0U1FFd09yRFNjbDM4S212Mk9aNVF6?=
 =?utf-8?B?cTBkbWFGZzFGLzFxdnlnQWNCb0dpYWlTT2VkTXdDRytseTlkZEIrZ3ZHWktO?=
 =?utf-8?B?U0VGOHg2TWRxOG1PVVNBZndkamE3UFYyd0NvRnFZTy9NbTdycnFOWjhhMDhZ?=
 =?utf-8?B?bE1NVzFJOXRhWHJaTno0eWZmZ3VXZE5XZzc1c3ViZGxnN3Q2OXpSVkpSeHVK?=
 =?utf-8?B?SnpoUFFrMS8rY3Q0eHk5c2xnNk05b3FWeEc3Mk9nTy8yQlJLNDZ0TzgzS1Z2?=
 =?utf-8?B?VWM2OFZweDYzcWs5SDlZUXJBRzNpQTFGMThDU3BvMHZhYlhETXp3OHZtcnBl?=
 =?utf-8?B?RjU4ck91NXgrUnVyQUpaTkFGU1lkbmQ2cVZObWNoK3lnN056bzBlY0t6SkRv?=
 =?utf-8?B?a09kcml6YXBEK0pxM0ZwWExHOXVjWkVwakRxYkFaVGtIRnVHUlZtVzVvK1du?=
 =?utf-8?B?dGFsOWtvSkdsR3ZPbmZaTGlYNmVZREtSUmNzeG5MRzUvbWNTMTBaMCtiRkZZ?=
 =?utf-8?B?R3A5VHBqZHpJN1kyVVhwN0haUlFhT1ZubGdPUHAvb1FmaUhBUzNEV2ZwUlo4?=
 =?utf-8?B?OHM2TGxHSFcrMUY4TFlxcHhyLzh6amhwV1pvMFdhREFMSGxnS1FrVEVSaVZE?=
 =?utf-8?B?SGkvbVY1UjBvMFhTd240WEJvdXJMOVZmVmFnN2NIU1JxWGlaNjJFbEZFc254?=
 =?utf-8?Q?PtPkVlZEtvWUtkFIsDM2aY0mvBFXjFXOI8HTzdZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de8dd8c-c842-4cf3-48c9-08d91b3f791f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:29:28.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBSFNuOr4HKPB3j/PV/ol0MZoGNywMgJkiTUc8GzzOfuvPn9AoUPD0YBz6R+9xxrE3Tw9IweYu2GJ7TwXcCY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5097
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-19 um 11:20 p.m. schrieb Andrey Grodzovsky:
> Use it to call disply code dependent on device->drv_data
> before it's set to NULL on device unplug
>
> v5:
> Move HW finilization into this callback to prevent MMIO accesses
> post cpi remove.
>
> v7:
> Split kfd suspend from device exit to expdite HW related
> stuff to amdgpu_pci_remove
>
> v8:
> Squash previous KFD commit into this commit to avoid compile break.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Acked-by: Christian König <christian.koenig@amd.com>

See one cosmetic comment inline. With that fixed the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 59 +++++++++++++------
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  3 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
>  drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
>  6 files changed, 56 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 5f6696a3c778..2b06dee9a0ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>  	}
>  }
>  
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
>  {
>  	if (adev->kfd.dev) {
>  		kgd2kfd_device_exit(adev->kfd.dev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 5ffb07b02810..d8a537e8aea5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
>  			const void *ih_ring_entry);
>  void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
>  void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
>  int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
>  				uint32_t vmid, uint64_t gpu_addr,
>  				uint32_t *ib_cmd, uint32_t ib_len);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 8bee95ad32d9..bc75e35dd8d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2558,34 +2558,26 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
>  	return 0;
>  }
>  
> -/**
> - * amdgpu_device_ip_fini - run fini for hardware IPs
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Main teardown pass for hardware IPs.  The list of all the hardware
> - * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
> - * are run.  hw_fini tears down the hardware associated with each IP
> - * and sw_fini tears down any software state associated with each IP.
> - * Returns 0 on success, negative error code on failure.
> - */
> -static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
> +static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
>  {
>  	int i, r;
>  
> -	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
> -		amdgpu_virt_release_ras_err_handler_data(adev);
> +	for (i = 0; i < adev->num_ip_blocks; i++) {
> +		if (!adev->ip_blocks[i].version->funcs->early_fini)
> +			continue;
>  
> -	amdgpu_ras_pre_fini(adev);
> +		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
> +		if (r) {
> +			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
> +				  adev->ip_blocks[i].version->funcs->name, r);
> +		}
> +	}
>  
> -	if (adev->gmc.xgmi.num_physical_nodes > 1)
> -		amdgpu_xgmi_remove_device(adev);
> +	amdgpu_amdkfd_suspend(adev, false);
>  
>  	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
>  	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
>  
> -	amdgpu_amdkfd_device_fini(adev);
> -
>  	/* need to disable SMC first */
>  	for (i = 0; i < adev->num_ip_blocks; i++) {
>  		if (!adev->ip_blocks[i].status.hw)
> @@ -2616,6 +2608,33 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>  		adev->ip_blocks[i].status.hw = false;
>  	}
>  
> +	return 0;
> +}
> +
> +/**
> + * amdgpu_device_ip_fini - run fini for hardware IPs
> + *
> + * @adev: amdgpu_device pointer
> + *
> + * Main teardown pass for hardware IPs.  The list of all the hardware
> + * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
> + * are run.  hw_fini tears down the hardware associated with each IP
> + * and sw_fini tears down any software state associated with each IP.
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
> +{
> +	int i, r;
> +
> +	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
> +		amdgpu_virt_release_ras_err_handler_data(adev);
> +
> +	amdgpu_ras_pre_fini(adev);
> +
> +	if (adev->gmc.xgmi.num_physical_nodes > 1)
> +		amdgpu_xgmi_remove_device(adev);
> +
> +	amdgpu_amdkfd_device_fini_sw(adev);
>  
>  	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>  		if (!adev->ip_blocks[i].status.sw)
> @@ -3681,6 +3700,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>  	amdgpu_fbdev_fini(adev);
>  
>  	amdgpu_irq_fini_hw(adev);
> +
> +	amdgpu_device_ip_fini_early(adev);
>  }
>  
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 357b9bf62a1c..ab6d2a43c9a3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>  	return kfd->init_complete;
>  }
>  
> +
> +
>  void kgd2kfd_device_exit(struct kfd_dev *kfd)

Unnecessary whitespace change.

Regards,
  Felix


>  {
>  	if (kfd->init_complete) {
> -		kgd2kfd_suspend(kfd, false);
>  		device_queue_manager_uninit(kfd->dqm);
>  		kfd_interrupt_exit(kfd);
>  		kfd_topology_remove_device(kfd);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9ca517b65854..f7112865269a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1251,6 +1251,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>  	return -EINVAL;
>  }
>  
> +static int amdgpu_dm_early_fini(void *handle)
> +{
> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +
> +	amdgpu_dm_audio_fini(adev);
> +
> +	return 0;
> +}
> +
>  static void amdgpu_dm_fini(struct amdgpu_device *adev)
>  {
>  	int i;
> @@ -1259,8 +1268,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
>  		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
>  	}
>  
> -	amdgpu_dm_audio_fini(adev);
> -
>  	amdgpu_dm_destroy_drm_device(&adev->dm);
>  
>  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
> @@ -2298,6 +2305,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
>  	.late_init = dm_late_init,
>  	.sw_init = dm_sw_init,
>  	.sw_fini = dm_sw_fini,
> +	.early_fini = amdgpu_dm_early_fini,
>  	.hw_init = dm_hw_init,
>  	.hw_fini = dm_hw_fini,
>  	.suspend = dm_suspend,
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 43ed6291b2b8..1ad56da486e4 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -240,6 +240,7 @@ enum amd_dpm_forced_level;
>   * @late_init: sets up late driver/hw state (post hw_init) - Optional
>   * @sw_init: sets up driver state, does not configure hw
>   * @sw_fini: tears down driver state, does not configure hw
> + * @early_fini: tears down stuff before dev detached from driver
>   * @hw_init: sets up the hw state
>   * @hw_fini: tears down the hw state
>   * @late_fini: final cleanup
> @@ -268,6 +269,7 @@ struct amd_ip_funcs {
>  	int (*late_init)(void *handle);
>  	int (*sw_init)(void *handle);
>  	int (*sw_fini)(void *handle);
> +	int (*early_fini)(void *handle);
>  	int (*hw_init)(void *handle);
>  	int (*hw_fini)(void *handle);
>  	void (*late_fini)(void *handle);
