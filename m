Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D576B2C4E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 18:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56010E1C3;
	Thu,  9 Mar 2023 17:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D3610E1C3;
 Thu,  9 Mar 2023 17:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TROoRjGsc2SEmvRZyLz21GfdxUc9Hexxd5yrzGazVw1VyrJbU+L01r7+nE1Cylx2fIXvI3UJbdUF6uIdZLFZqlkXW/U46oNA7ROHkw1fJS4fJHpgUY1GSbmwNxiUWevbi5Bgw0gNnmSder9IrA8UWVXo3ydlaYymkO2W/NXvLbNnsense1dy7wYWWXxx9NRpfGea0f5/c1+RLpkh1Z3eRp66ULcsp/b53GAJot0qm5z+/1BWEURSAzOY345coz2ZTzd3diytfcKuCV3YIQwvc5x79kBvAe8fTCoqq6lxzGm8W01WmI3t+6fqJWp22azUp2BiFjaZk7mEg6Ms2jeZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M05B/sCAOl5u/sDJmSdiV6LYvmMwFOBvNZOaYQ2m6a0=;
 b=kzKJ5wybG04T0MXwaJop/sz+8hYEnx+VTpQTXCag/1O6U1CfdcmjB8qwvEsjiMoxg65Z7iyzsTQQDoSBUMGm3+d0zvVZSgS0NFXH377HF0BP/9MJj7d5B/LK4hLUF+FcXlE1m17kv6Z5LZbgGG0tG2aAk9wm6cje+kWFCYQIbLD4zS+e23BvjTM/WV6Pcyw5YgTQgiwEJZpjD0tbbVq9ocZuZUPz6Ka1Nrzueb/q/J0rZdGs4EoHc2DbbecUUIbajql97svMnMnjNCEyCv8jnIMSGjNI91wwP1mbQ2P/LSpmE33xosjDx64QDxARMtx3dbn8Akb4TpNm8d1kt8zxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M05B/sCAOl5u/sDJmSdiV6LYvmMwFOBvNZOaYQ2m6a0=;
 b=CPaBe/prgFHzgL+CKfoBzRus1L6SB3BdXUwD9ST2eE8VwGYkCYO+vx9PujViZ7W7/CYtwfJKK4oeTmZcXpVzB+UEA2KU4nfRAzvX0N/iQ3tLU+6jsMHYA4NpFW02202ResP7OjDDENxCbwhMDQcGLswiJWzWQ1Y78uqsJpfICK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 17:49:34 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 17:49:33 +0000
Message-ID: <64aef893-50d5-be6f-75c0-b9c8293fcbfe@amd.com>
Date: Thu, 9 Mar 2023 12:49:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdkfd: fix potential kgd_mem UAFs
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230308213724.3396058-1-olvaffe@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230308213724.3396058-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0018.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY5PR12MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ef6519-238b-46b3-7aa7-08db20c6a45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zd07nYRdke9tjzDezklaBaz6vevERhFBrd5Jupl8TJahoDetwohAKiWb13wKUKcNyl07a2hWXYIDP40xMvtCc3Bz8rFCfTc1Epg2XK+65TCJScJefc01tQqupV6gT65STUs3nPPpha9FPMlbHgjJHxIKcXu54u22hm42G+kLx5eJACSi/tonSck879X7g4p2ljC8v9fJFEFxgvRg4zoAgTPaTJEtzu58hhPBGp/nDq337hnf6XSD2uDCADJp8WCmqhKU/GFnV2sF36QfIx6VTehF/Txra4nd/yqEDdvsEAuL8nxYUodfA+XuAw4YJxmDviS8PF/gvtOADsy3rlIAoxt9LJxJaT1bMVkjOZqiGyIlz0N3q5FzrSjQjrDGT0MGEXOlSgaH+xd69jKzCiVK4nNuNNT0YW2N1dPL9xMQuDRCn5YGUrt5iV9QCK5sQv09eUaip+DwUTmMcDuG86LbPph8Wrq788STmdVqTfAWk0dNXrO5pcs+DiA+eUmIW3QZCrtnPMvRM5KMqTJMn1Jn5Z/hW2YHZ0yvBD3IF/mI7H+JZAcPwGQo/UoBuGZH3e3tKvPHJJfRyFcJrlZ7LQmYxhxomYeBjnB8ELrlb1zBFXXuC7p78INvStMKVsRT4IBTrlrHZm38vXVSgFsyq0vRaDCO/x7pQrtco9pE4rRy3PVEtrJxStjFegCE2FS5z2AnQL7hmbNWNfhuUbUf27wzvUqFdtUEmPeHFW5s8l6Aatk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199018)(31686004)(83380400001)(36756003)(38100700002)(54906003)(478600001)(316002)(2616005)(6486002)(6512007)(6506007)(186003)(5660300002)(26005)(44832011)(2906002)(41300700001)(4326008)(8936002)(66476007)(66556008)(66946007)(86362001)(31696002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pKbHVFQytXUXFaTmpFNVhFZmZIdDVmUXZFYnA2bkowenMzWmJ3aTBra0Qz?=
 =?utf-8?B?U3R1QUxzOXpEbzFlbEY5N0dqY05FL2laMFhBVEFZcnp0c3p5RE9YR3lBRFpB?=
 =?utf-8?B?QTg3RXFkRG4yZ05ud1VzaEo5VkdxNGRHTGZXYnZmNlZ0Zm8va2NCZ0RjM0s3?=
 =?utf-8?B?U0l3NXo4MVdnWllObS8zOHVBempYejEyVTRDSk0vZmNIZWtmdVBJYSs3d3hi?=
 =?utf-8?B?YlJDaW44VHV2WWphWk04alBqT3RvM0JuNGFPYVd4WURqUzZCRmdVZTFhSUZk?=
 =?utf-8?B?VE1MdW82bjdndC83citvd2ZPemFLSDRtdURXTWVhb1NqQ1lkNTdZYlR3NzQy?=
 =?utf-8?B?UVgrNElPWW1KR3F3MVU2V00zclIvaWNlckl4UGx6Ly9vNnFTVVFxdGpNUklT?=
 =?utf-8?B?VXI3OVYzMFhvbWxQZEIyUzhBcWRZYXRhdGY3THNFb29HaGR6ejYrNHFGUWpQ?=
 =?utf-8?B?cXY2d3VmcnJ3RUVyUzlZZXVTdjVQSEtONUF0V3hRdUhuNU9Gb0Y0dytWUHFT?=
 =?utf-8?B?a09GNkZVNHhLemw1cnMyaW93NXk3dEREMEFEYmZVUmtZTE1WQzRMZHZlUE1p?=
 =?utf-8?B?UVo2dlNIQkgyM2w0NmQvSGcva3lHQTRHOHFJMnNMR2QyanFPUExnNVQwM2Zi?=
 =?utf-8?B?WHBJUm11OXV4ZGdFbnk1bVVUdWR6NUFSZ3NFdExCYVk0cWN5WS9teW5iR1R3?=
 =?utf-8?B?NExucms2L0prejc3My9EdTRjeXVCSmlMb0MyNThROXBxZENCVzFPdlJGTklX?=
 =?utf-8?B?cGFBcDNVaHBPMG4vYUJQOExZMWloOFBlRlYwMG5JNWtTenVyVU1uTitZR3Rh?=
 =?utf-8?B?UUhJbFluM3JnQzd3VlVXR29EZHVWanQ2ZGhiTVQ3TjVzMXBwZ2xhYXNTbmpV?=
 =?utf-8?B?VW1CN2liRmxFZkhNb0hZeitOcVk4L0tXRCs2dXRrc01LQ0puM3NDQmtJeHE4?=
 =?utf-8?B?c2w3QThaVWFZY1JHdWg1NFR1am1ZdmtwU3FUS3BxcWZuUWd3OCtKNnBPYjNU?=
 =?utf-8?B?ME1JNWJYa2V1SWtrMTNBalQ5L2EyVG4vYkFGcWtGVm8vSlVtaWd2d05pWTBI?=
 =?utf-8?B?U1RGK1N3WmFSaWxUancvb3d3djNubi9RdlN2N0ltS0x2ZGppSE9HYkM5elE0?=
 =?utf-8?B?ZUpWOXBMeWZuTkwrUE1DdVhEd3ppa3N4SjZpRGNvV3dxLzR3UzE4WWFnd3BD?=
 =?utf-8?B?amdIMWhYTDlWcTRlUTdNTTVkeGhoa29XS1RsL1A5ZWJjLzlMYnhiTFM1YURk?=
 =?utf-8?B?WDQ3aW84eUtXMEl1Y2hWa0dJUmc0bzc0djdLUlVMdVpLN3lySHFMLzlMZ3o5?=
 =?utf-8?B?aHU1OWhoOTB3WE5PUnNOUDViVlMvbmRHQWNSSGJWYVJWOElSQm5zTVZWa0to?=
 =?utf-8?B?bExzQzhrdDNFZ05JZUFIUTAxbSt6bCt5Q1dPRjZBOGc2Q0JGOHFTM2M3YUZx?=
 =?utf-8?B?SExOYkJvN09aZ0Q4UklZZ3ppd2EzT0dmaG12ay8zMHE2bTZLcVR4bzlBNmxS?=
 =?utf-8?B?Y0Q1NEVFbFRZTGJTcUhRTzJSUDg2aVcwZEdvVVJxYWhzUkFNeG8yNUswd01S?=
 =?utf-8?B?b25zSFFhMDNQSFNtTjhnOEhJYm1tRDdiN0VFZyszMXMwaDJmVW9ZRUVCZG1P?=
 =?utf-8?B?TUp6ekJUMjArM1ZwNDFDQm1FSm5pMnEzTWwzcm1IZXVkWEM0eWNmY081QlRa?=
 =?utf-8?B?ZUVRcHhQS0liQUdndG5xRmc2TkdOaDI1blpPRFN6L3VXa3dMM0orWHVEbGdN?=
 =?utf-8?B?WDZPSHRXQk4yTStZNXUyK3luVG9Ddk94c1NicHgzcFNucmtISFdueTJmaXBj?=
 =?utf-8?B?aVB0WFIxNHRVakpjU0NpS0FmSjVXQ3lxb0hZWWZyMDFDUUl0QkF6Vmo2MXgw?=
 =?utf-8?B?QmFoWkRkL1hNc0t3ajA4dVMrUmVPdDgxMTRzcFBITXdra3BWdUVXaGdvUE9F?=
 =?utf-8?B?MVlkVTJ1NGtOL09OaGJHVDYwNWpKblhLeFVpYS9wYUt6L1I0RHBjQmlRUHYz?=
 =?utf-8?B?NFhPa2RZYStGK1J4YzJiaVRnSy9lL2RtRXd5OXVVRU5yVXRFaEVpaCtZbG1h?=
 =?utf-8?B?d3NYbWlkRjRUUWhLWjRNS2hFU3lOYW9wbk5HRFhWL09YRU5pTVdneWt2THdR?=
 =?utf-8?Q?33yuVmdtqv0IJGAvABqBbNeyb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ef6519-238b-46b3-7aa7-08db20c6a45c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:49:33.7756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+zTs4C5XS3jIbCB8y7U3blHAnghiSsubUJ1B9yCPl+QEBaqQ0RZuGASa/7fySUEW5h65e7jV8aiB19M0S3eGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-03-08 um 16:37 schrieb Chia-I Wu:
> kgd_mem should be accessed with p->mutex locked, or it could have been
> freed by kfd_ioctl_free_memory_of_gpu.

Thank you for the patch. It's not just about accessing kgd_mem with 
p->mutex held. It's also about holding the mutex continuously. I'd 
update the description to be more explicit about the invariant being 
broken here:

kgd_mem pointers returned by kfd_process_device_translate_handle are 
only guaranteed to be valid while p->mutex is held. As soon as the mutex 
is unlocked, another thread can free the BO.

I can update the description and submit the patch.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Regards,
   Felix


>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 6d291aa6386bd..3c630114210d6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1293,14 +1293,14 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
>   		args->n_success = i+1;
>   	}
>   
> -	mutex_unlock(&p->mutex);
> -
>   	err = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev, (struct kgd_mem *) mem, true);
>   	if (err) {
>   		pr_debug("Sync memory failed, wait interrupted by user signal\n");
>   		goto sync_memory_failed;
>   	}
>   
> +	mutex_unlock(&p->mutex);
> +
>   	/* Flush TLBs after waiting for the page table updates to complete */
>   	for (i = 0; i < args->n_devices; i++) {
>   		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
> @@ -1316,9 +1316,9 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
>   bind_process_to_device_failed:
>   get_mem_obj_from_handle_failed:
>   map_memory_to_gpu_failed:
> +sync_memory_failed:
>   	mutex_unlock(&p->mutex);
>   copy_from_user_failed:
> -sync_memory_failed:
>   	kfree(devices_arr);
>   
>   	return err;
> @@ -1332,6 +1332,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
>   	void *mem;
>   	long err = 0;
>   	uint32_t *devices_arr = NULL, i;
> +	bool flush_tlb;
>   
>   	if (!args->n_devices) {
>   		pr_debug("Device IDs array empty\n");
> @@ -1384,16 +1385,19 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
>   		}
>   		args->n_success = i+1;
>   	}
> -	mutex_unlock(&p->mutex);
>   
> -	if (kfd_flush_tlb_after_unmap(pdd->dev)) {
> +	flush_tlb = kfd_flush_tlb_after_unmap(pdd->dev);
> +	if (flush_tlb) {
>   		err = amdgpu_amdkfd_gpuvm_sync_memory(pdd->dev->adev,
>   				(struct kgd_mem *) mem, true);
>   		if (err) {
>   			pr_debug("Sync memory failed, wait interrupted by user signal\n");
>   			goto sync_memory_failed;
>   		}
> +	}
> +	mutex_unlock(&p->mutex);
>   
> +	if (flush_tlb) {
>   		/* Flush TLBs after waiting for the page table updates to complete */
>   		for (i = 0; i < args->n_devices; i++) {
>   			peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
> @@ -1409,9 +1413,9 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
>   bind_process_to_device_failed:
>   get_mem_obj_from_handle_failed:
>   unmap_memory_from_gpu_failed:
> +sync_memory_failed:
>   	mutex_unlock(&p->mutex);
>   copy_from_user_failed:
> -sync_memory_failed:
>   	kfree(devices_arr);
>   	return err;
>   }
