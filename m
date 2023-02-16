Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143469A285
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CEB10E1A1;
	Thu, 16 Feb 2023 23:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90CD10E1A1;
 Thu, 16 Feb 2023 23:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zhtk69Nv5jdKKhxsEv6MaAdrAvIXe+VoZva9Kh1uG4Izk2h8UzEwmmhu1r3xJ4PZB3e6IlYiLqP77vXyqPTnAMJVPui/zbGsWdNwljzUKOiFEZXooyYLGyWGA0IZ4QNKX9NQZaJ9+Ax+JK2964K/uMCohf2ypYkaOMEIfl8tVI8kamjERVnact/a9wQnywxcM1dRPZXF0FniglzcXipVecmNw9uJin+tcwiwDY3jUXyiRsHRxadfiWTWszcSB7RjN6z/g1oHpVvi77OzcnPQK+K4PgSGw1UsZODq2ILbYyG8rhfvLDwB52L22HPtpB+SzQveMItboTyGp6K2Q7ZI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9Y5K2I5ttzL/ykYwK8L3RCFiH6ZYACn3tLrj5SO0Go=;
 b=ZM35ZRjMuhk/ByodeW88lrVmIpPxYelYa9qpVh8WRuyZP+pin6spPWYt2o3ePguM22ZeD9y0LiDSukxlmscrAr2TM7N7llytVUeJNyFa22QoJMeAwTbi1O9kCeOAU4W8F1r5hYyj9IGIBCjN5arw47qXgiRb9xi9Uky4lBa7NlVIkb+sbntglniqRe7AH2oaqxrlDfkkTkqim1lBdbI6VYhwCApfk3PCPupepyqb2eji0pEnpvkIBDGyWzgYViqFtOHX5ku5uuAaVcmeRiAq0hZEV6CT7u3BIWzgnyuPq++7ZoOM6R7+UOws/8Ytu0FPePwSLqgrxwfAHznxDHVefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9Y5K2I5ttzL/ykYwK8L3RCFiH6ZYACn3tLrj5SO0Go=;
 b=bVw66PHfV87NsIsyzi0OvEgjAFAgl7UpbGS7xUIL2heHFx08oaYWWNqZRF3D50RL1PxUqWMBLEN7N2cd0nFHU6+q6CRNHatlkBc6RLiAgy7rnK8g1Wx1nNy2vvsrRP4TeX/WuWwsoxrZ36DoUibmXVxi934TXeUvOPRM/UeeNYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:44:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:44:49 +0000
Message-ID: <c6c974ad-c4e1-2803-c49f-e826ec47c52e@amd.com>
Date: Thu, 16 Feb 2023 17:16:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/32] drm/amdkfd: add debug and runtime enable interface
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-2-jonathan.kim@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-2-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::47) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dec49c6-888f-4674-ee83-08db1077ca8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +O6Kub45znfx4hv85HzsV25e9L1JQ9wunwvrrmvOkIY1jfs6g5D8NuatQrQGtlxLCCuxd2oaop0JzhOQ1234jYiw5mQ70FVhXQCY0MBHHRbsx5v32Ap6ZVtbWh+DgMUq/7Lodm5+KsK02P8ckjlqXQZrKYGXbPmOBmShJI/lZ9vaMTu/2k6KxL3cWE7Nxa/Q4tVvxkYiTzgjWwF3WwXWJpXhtpkCUyCMh9ErN+mYpXvVD98CuxBiZS4Eajz4PalgYUFVqTPC0HQHtvwZXbf0wR5lI+L/PPlfQVVTLBWUgwWRxIVZH33W6cVLr2RTcoNlfUlYiq4/j/IlygbUxQfKwF8I0/sT/2NYuu9OQrHFYk4bVikDAoHlrk4Zw0a9GNZdNTw1ZT/Ju8q1yA+k8jFurXVteM2TGmGSbT8nxHZMIsC/7Gwe+MwwR6UGsY0DwATzA2lVKEUtOHyWwo71eWFFFPuONhHlnR1lqP6L+IeHj0hcr0rTICUqO4ghAaDUZ+L9sFCeZ7GUfXktgrb0U9+xJMrdQqxTi4XXmENe2vIqYu798m/rOER3raF+vh2+z8Zm+hi9ot1J6CZl8duwBtGrew49Hn9RZJdm6fm2CI1ywnaBAcusUPAp+0oZox9cdmWlSomyv+4snHsk4Hr5tYBUeGcfbv2T56BjVW0OT64TnC4//r1moD+hW6dpaB/yaP3ngUjYEijSFvES4353QHIuLhhBNW8LG0dNKik6+ns8yQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(30864003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWwrUkxuQWc5bnNmSm1aK1VLZ01uNmdEcU9odzd2WUtLRCtLU2lZZjZtREwy?=
 =?utf-8?B?ME9ETzQ4RXNBK2ZBU3oyQ1R2a2IxeFpZbkt2dThlUVpGWnpzeHFUYWpxUE4r?=
 =?utf-8?B?Sk9nMWtQb0tnTTZ3eVFyYUNOTVZwYktZNVJoN1crZGdvRUxWZ0E3Q2k3UFpa?=
 =?utf-8?B?WGZWb0dSakVPdUEvRjRFeXMxakNkakloSzViVUpzQjg0TWZPZjhaeDJobmlN?=
 =?utf-8?B?eVIrdStPcXlYVWxWQVhXTlhzYVhlU0IvVm1ybG16ZmNDVCs2Z0tMS3RrMEJJ?=
 =?utf-8?B?VGpOMGZsenRHa0pmSUI1SzByVVRXb0o3UVVhMUt1TWNPb2JHSkk5U2JFaUlr?=
 =?utf-8?B?bUJmZzFTSjlSRzFpV25wTVArZFN5TTgySmpKek45RGZySjB3cE5FNy8rUENF?=
 =?utf-8?B?NkZOemVJYTIrd3VPbEtmNDcwZ1FZWU8vYnRTOC9GaDd6VGd5VlVWOWZBZ21Y?=
 =?utf-8?B?SzFQUzlSOU1JeW1hTkszdWI0dHVsNC9HSS9EUmVLdWVJeFkyTDNWYU5xZHlG?=
 =?utf-8?B?ejdEeXZ2SVhTaWRYOTYwL3RMbW1pczlSVTQ3VkMrYTFIWnk3aXpSV21pc21V?=
 =?utf-8?B?UnpzSmd2ZkJSaEFaaHlxTFFQdjJ4UXZJUi8vWnhwNlhmK3BzZFdhbUlic2Nr?=
 =?utf-8?B?VmpycVRaTmRuNW1ZQ2Exd1ludStxWTc2d3BXOCtrWC81d1Z4YWRmbzF3WFdv?=
 =?utf-8?B?UGppZlRpNG1UUDRIS0xlSHlubXpmaWsxQWxQbUErNytxMW5TWC84NkN4VldN?=
 =?utf-8?B?Y3YxR3pRS2lyUDJmOUluWnlxNnlsWkFVUTJZYTRXV2QrZDBMSTVkT1YyeHk2?=
 =?utf-8?B?RW8xTTQ2OUtLTkVlQmN6a3M2T1NyN2d0OVR4eXhZSWJ3c1hndWZjc1RZYzVk?=
 =?utf-8?B?Y3pyZHhzZytPWkFjZjdFYTBQcHdzbCtaU1pTc1ZieWxKejh5TVZ2ZDZlUUlt?=
 =?utf-8?B?TVo0WkdlVnlrQzlLZU9pem1ydDNDWkNOZHZLOXljTHdtWFNMZXovSkdTRlFB?=
 =?utf-8?B?ZzhrQUFseXVKelgzd2c2MFNzV1dDd1YwNjFQcEsxT3NENVREZHJUamhwd1Uv?=
 =?utf-8?B?Wk9wd2lhdjFGNWFKL0RkcHdOdzRleHA2bERjYXgwNVRMbmpRcU5oa3RGWFFV?=
 =?utf-8?B?czcrRWhUcEJ0YzA5VTdxMzBDRHJUZG5RS2RBeG4wWXhaMVEwckJ3NE1mWGxM?=
 =?utf-8?B?M2pET0ptc3NaMGx5aWdra2tHM0lOSXRxRmZub3JZZVZZS05hbm9qZnFkc0Zj?=
 =?utf-8?B?OXl4T2IxKy9UZlBWNlZUVFlKNkxjcVdielVZWG1xZEFrc3RwWlFnM2ZaeTRT?=
 =?utf-8?B?TlpLMHRnUzVPNkc2ZHFMbzM3K0k0Szh0UlJ3WEc0bXA2dUEzTVVPd3g2VnhX?=
 =?utf-8?B?RTVSd0RWa1pxcWxrRXlQa0lKTkNib1R0NlMxVjRNaXVEVFBremZQWnV4QjE2?=
 =?utf-8?B?aFBaNHdadWo5TytMR3VRTTRta1hLOXg3a3Juc3llZHk0N3NKSDFSSGhZZFV5?=
 =?utf-8?B?SkwxekQzOWUxaTIvQXJSM1VOU0hKanhtV2JvcXVKdGtZeUJCRFdRSk5VMUhq?=
 =?utf-8?B?Y0pSL0JUZU1PeUt4RXh3MDdSYStHT0JkVU5xaGlPd0U2cHJhdkp1Q1lsVXZj?=
 =?utf-8?B?eGI5aUNJZ0VLUGtUSUFHYmJkWWg5WFJuM1FINW4vL1JsbVFhUWRYRUhUR3ZX?=
 =?utf-8?B?THpvaStEQVpJYWluL0xxbXJpbzJqUEFsRXNFMEZIV0RLRytWVGdnRVFpWWov?=
 =?utf-8?B?V2gxT2ErSDVkMVE3RXhpWGRQVVRxWlFXSlY0NmZvN1o3OHIxaSt0TGJKVU93?=
 =?utf-8?B?WS8rTk9TMlJHczFaUUhNMWVlZk1nZ2pUcm1BZkVPNWc3Y1hVTEZPQWowbTVv?=
 =?utf-8?B?TkJVdjBLNHlkTTBMZTd5dWRrc050SHBsOFdPZS8xQmRuQ2kxRXFlQ1pVZkh1?=
 =?utf-8?B?b0x3VWVnZ0hIVVdtdExjNU9tRGc5aXhQaEpveWRqV0ZsOWVFeXpUVXJJeTVm?=
 =?utf-8?B?VVRkT3g2WDFNb0JLTVZmc0pnSUh5WmpQcDgwQ2JhbXVMbUc1R1dBMkZGb2ZR?=
 =?utf-8?B?WlEycTQrcTNNeW04Q2U2SG9NaURQSXlRaGkzMHB2RTZDYTE5L0wwTHVEWXVH?=
 =?utf-8?Q?+F4U8+c8g4UTh5r+9+ovrkl+M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dec49c6-888f-4674-ee83-08db1077ca8c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:44:49.1255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uTUnQ1y/GW6dsKwhKybBhNEdBOwD8pDmurK75Iw/GtGCo1AgTccqrOOLG34g9dlFfx3L9Tuq2b52LtbZ0aoXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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
> Introduce the GPU debug operations interface.
>
> For ROCm-GDB to extend the GNU Debugger's ability to inspect the AMD GPU
> instruction set, provide the necessary interface to allow the debugger
> to HW debug-mode set and query exceptions per HSA queue, process or
> device.
>
> The runtime_enable interface coordinates exception handling with the
> HSA runtime.
>
> Usage is available in the kern docs at uapi/linux/kfd_ioctl.h.
>
> v2: was previously reviewed but removed deprecrated wave launch modes
> (kill and disable).
> Also remove non-needed dbg flag option.
> Add revision and subvendor info to debug device snapshot entry.
> Add trap on wave start and end override option.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  48 ++
>   include/uapi/linux/kfd_ioctl.h           | 663 ++++++++++++++++++++++-
>   2 files changed, 710 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index f79b8e964140..d3b019e64093 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2645,6 +2645,48 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
>   	return ret;
>   }
>   
> +static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
> +{
> +	return 0;
> +}
> +
> +static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_dbg_trap_args *args = data;
> +	int r = 0;
> +
> +	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Debugging does not support sched_policy %i", sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	switch (args->op) {
> +	case KFD_IOC_DBG_TRAP_ENABLE:
> +	case KFD_IOC_DBG_TRAP_DISABLE:
> +	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
> +	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
> +	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
> +	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
> +	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
> +	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
> +	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> +	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
> +	case KFD_IOC_DBG_TRAP_SET_FLAGS:
> +	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
> +	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
> +	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
> +	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
> +		pr_warn("Debugging not supported yet\n");
> +		r = -EACCES;
> +		break;
> +	default:
> +		pr_err("Invalid option: %i\n", args->op);
> +		r = -EINVAL;
> +	}
> +
> +	return r;
> +}
> +
>   #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
>   	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
>   			    .cmd_drv = 0, .name = #ioctl}
> @@ -2754,6 +2796,12 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>   
>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
>   			kfd_ioctl_get_available_memory, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_RUNTIME_ENABLE,
> +			kfd_ioctl_runtime_enable, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_TRAP,
> +			kfd_ioctl_set_debug_trap, 0),
>   };
>   
>   #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index 42b60198b6c5..9ef4eed45c19 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -109,6 +109,32 @@ struct kfd_ioctl_get_available_memory_args {
>   	__u32 pad;
>   };
>   
> +struct kfd_dbg_device_info_entry {
> +	__u64 exception_status;
> +	__u64 lds_base;
> +	__u64 lds_limit;
> +	__u64 scratch_base;
> +	__u64 scratch_limit;
> +	__u64 gpuvm_base;
> +	__u64 gpuvm_limit;
> +	__u32 gpu_id;
> +	__u32 location_id;
> +	__u32 vendor_id;
> +	__u32 device_id;
> +	__u32 revision_id;
> +	__u32 subsystem_vendor_id;
> +	__u32 subsystem_device_id;
> +	__u32 fw_version;
> +	__u32 gfx_target_version;
> +	__u32 simd_count;
> +	__u32 max_waves_per_simd;
> +	__u32 array_count;
> +	__u32 simd_arrays_per_engine;
> +	__u32 capability;
> +	__u32 debug_prop;
> +	__u32 pad;
> +};
> +
>   /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
>   #define KFD_IOC_CACHE_POLICY_COHERENT 0
>   #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> @@ -766,6 +792,635 @@ struct kfd_ioctl_set_xnack_mode_args {
>   	__s32 xnack_enabled;
>   };
>   
> +/* Wave launch override modes */
> +enum kfd_dbg_trap_override_mode {
> +	KFD_DBG_TRAP_OVERRIDE_OR = 0,
> +	KFD_DBG_TRAP_OVERRIDE_REPLACE = 1
> +};
> +
> +/* Wave launch overrides */
> +enum kfd_dbg_trap_mask {
> +	KFD_DBG_TRAP_MASK_FP_INVALID = 1,
> +	KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL = 2,
> +	KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO = 4,
> +	KFD_DBG_TRAP_MASK_FP_OVERFLOW = 8,
> +	KFD_DBG_TRAP_MASK_FP_UNDERFLOW = 16,
> +	KFD_DBG_TRAP_MASK_FP_INEXACT = 32,
> +	KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO = 64,
> +	KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH = 128,
> +	KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION = 256,
> +	KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START = (1 << 30),
> +	KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END = (1 << 31)
> +};
> +
> +/* Wave launch modes */
> +enum kfd_dbg_trap_wave_launch_mode {
> +	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL = 0,
> +	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT = 1,
> +	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG = 3
> +};
> +
> +/* Address watch modes */
> +enum kfd_dbg_trap_address_watch_mode {
> +	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_READ = 0,
> +	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_NONREAD = 1,
> +	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ATOMIC = 2,
> +	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ALL = 3
> +};
> +
> +/* Additional wave settings */
> +enum kfd_dbg_trap_flags {
> +	KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP = 1,
> +};
> +
> +/* Trap exceptions */
> +enum kfd_dbg_trap_exception_code {
> +	EC_NONE = 0,
> +	/* per queue */
> +	EC_QUEUE_WAVE_ABORT = 1,
> +	EC_QUEUE_WAVE_TRAP = 2,
> +	EC_QUEUE_WAVE_MATH_ERROR = 3,
> +	EC_QUEUE_WAVE_ILLEGAL_INSTRUCTION = 4,
> +	EC_QUEUE_WAVE_MEMORY_VIOLATION = 5,
> +	EC_QUEUE_WAVE_APERTURE_VIOLATION = 6,
> +	EC_QUEUE_PACKET_DISPATCH_DIM_INVALID = 16,
> +	EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID = 17,
> +	EC_QUEUE_PACKET_DISPATCH_CODE_INVALID = 18,
> +	EC_QUEUE_PACKET_RESERVED = 19,
> +	EC_QUEUE_PACKET_UNSUPPORTED = 20,
> +	EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID = 21,
> +	EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID = 22,
> +	EC_QUEUE_PACKET_VENDOR_UNSUPPORTED = 23,
> +	EC_QUEUE_PREEMPTION_ERROR = 30,
> +	EC_QUEUE_NEW = 31,
> +	/* per device */
> +	EC_DEVICE_QUEUE_DELETE = 32,
> +	EC_DEVICE_MEMORY_VIOLATION = 33,
> +	EC_DEVICE_RAS_ERROR = 34,
> +	EC_DEVICE_FATAL_HALT = 35,
> +	EC_DEVICE_NEW = 36,
> +	/* per process */
> +	EC_PROCESS_RUNTIME = 48,
> +	EC_PROCESS_DEVICE_REMOVE = 49,
> +	EC_MAX
> +};
> +
> +/* Mask generated by ecode in kfd_dbg_trap_exception_code */
> +#define KFD_EC_MASK(ecode)	(1ULL << (ecode - 1))
> +
> +/* Masks for exception code type checks below */
> +#define KFD_EC_MASK_QUEUE	(KFD_EC_MASK(EC_QUEUE_WAVE_ABORT) |	\
> +				 KFD_EC_MASK(EC_QUEUE_WAVE_TRAP) |	\
> +				 KFD_EC_MASK(EC_QUEUE_WAVE_MATH_ERROR) |	\
> +				 KFD_EC_MASK(EC_QUEUE_WAVE_ILLEGAL_INSTRUCTION) |	\
> +				 KFD_EC_MASK(EC_QUEUE_WAVE_MEMORY_VIOLATION) |	\
> +				 KFD_EC_MASK(EC_QUEUE_WAVE_APERTURE_VIOLATION) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_DIM_INVALID) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_CODE_INVALID) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_UNSUPPORTED) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID) |	\
> +				 KFD_EC_MASK(EC_QUEUE_PACKET_VENDOR_UNSUPPORTED)	|	\
> +				 KFD_EC_MASK(EC_QUEUE_PREEMPTION_ERROR)	|	\
> +				 KFD_EC_MASK(EC_QUEUE_NEW))
> +#define KFD_EC_MASK_DEVICE	(KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE) |		\
> +				 KFD_EC_MASK(EC_DEVICE_RAS_ERROR) |		\
> +				 KFD_EC_MASK(EC_DEVICE_FATAL_HALT) |		\
> +				 KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION) |	\
> +				 KFD_EC_MASK(EC_DEVICE_NEW))
> +#define KFD_EC_MASK_PROCESS	(KFD_EC_MASK(EC_PROCESS_RUNTIME) |	\
> +				 KFD_EC_MASK(EC_PROCESS_DEVICE_REMOVE))
> +
> +/* Checks for exception code types for KFD search */
> +#define KFD_DBG_EC_TYPE_IS_QUEUE(ecode)					\
> +			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_QUEUE))
> +#define KFD_DBG_EC_TYPE_IS_DEVICE(ecode)				\
> +			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_DEVICE))
> +#define KFD_DBG_EC_TYPE_IS_PROCESS(ecode)				\
> +			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PROCESS))
> +
> +
> +/* Runtime enable states */
> +enum kfd_dbg_runtime_state {
> +	DEBUG_RUNTIME_STATE_DISABLED = 0,
> +	DEBUG_RUNTIME_STATE_ENABLED = 1,
> +	DEBUG_RUNTIME_STATE_ENABLED_BUSY = 2,
> +	DEBUG_RUNTIME_STATE_ENABLED_ERROR = 3
> +};
> +
> +/* Runtime enable status */
> +struct kfd_runtime_info {
> +	__u64 r_debug;
> +	__u32 runtime_state;
> +	__u32 ttmp_setup;
> +};
> +
> +/* Enable modes for runtime enable */
> +#define KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK	1
> +#define KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK	2
> +
> +/**
> + * kfd_ioctl_runtime_enable_args - Arguments for runtime enable
> + *
> + * Coordinates debug exception signalling and debug device enablement with runtime.
> + *
> + * @r_debug - pointer to user struct for sharing information between ROCr and the debuggger
> + * @mode_mask - mask to set mode
> + *	KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK - enable runtime for debugging, otherwise disable
> + *	KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK - enable trap temporary setup (ignore on disable)
> + *
> + * Return - 0 on SUCCESS.
> + *	  - EBUSY if runtime enable call already pending.
> + *	  - EEXIST if user queues already active prior to call.
> + *	    If process is debug enabled, runtime enable will enable debug devices and
> + *	    wait for debugger process to send runtime exception EC_PROCESS_RUNTIME
> + *	    to unblock - see kfd_ioctl_dbg_trap_args.
> + *
> + */
> +struct kfd_ioctl_runtime_enable_args {
> +	__u64 r_debug;
> +	__u32 mode_mask;

As discussed offline, this will get a capabilities_mask field to be 
returned to ROCr to help with core dumps. Other than that, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +};
> +
> +/* Queue information */
> +struct kfd_queue_snapshot_entry {
> +	__u64 exception_status;
> +	__u64 ring_base_address;
> +	__u64 write_pointer_address;
> +	__u64 read_pointer_address;
> +	__u64 ctx_save_restore_address;
> +	__u32 queue_id;
> +	__u32 gpu_id;
> +	__u32 ring_size;
> +	__u32 queue_type;
> +	__u32 ctx_save_restore_area_size;
> +	__u32 reserved;
> +};
> +
> +/* Queue status return for suspend/resume */
> +#define KFD_DBG_QUEUE_ERROR_BIT		30
> +#define KFD_DBG_QUEUE_INVALID_BIT	31
> +#define KFD_DBG_QUEUE_ERROR_MASK	(1 << KFD_DBG_QUEUE_ERROR_BIT)
> +#define KFD_DBG_QUEUE_INVALID_MASK	(1 << KFD_DBG_QUEUE_INVALID_BIT)
> +
> +/* Context save area header information */
> +struct kfd_context_save_area_header {
> +	__u32 control_stack_offset;
> +	__u32 control_stack_size;
> +	__u32 wave_state_offset;
> +	__u32 wave_state_size;
> +	__u32 debug_offset;
> +	__u32 debug_size;
> +	__u64 err_payload_addr;
> +	__u32 err_event_id;
> +	__u32 reserved1;
> +};
> +
> +/*
> + * Debug operations
> + *
> + * For specifics on usage and return values, see documentation per operation
> + * below.  Otherwise, generic error returns apply:
> + *	- ESRCH if the process to debug does not exist.
> + *
> + *	- EINVAL (with KFD_IOC_DBG_TRAP_ENABLE exempt) if operation
> + *		 KFD_IOC_DBG_TRAP_ENABLE has not succeeded prior.
> + *		 Also returns this error if GPU hardware scheduling is not supported.
> + *
> + *	- EPERM (with KFD_IOC_DBG_TRAP_DISABLE exempt) if target process is not
> + *		 PTRACE_ATTACHED.  KFD_IOC_DBG_TRAP_DISABLE is exempt to allow
> + *		 clean up of debug mode as long as process is debug enabled.
> + *
> + *	- EACCES if any DBG_HW_OP (debug hardware operation) is requested when
> + *		 AMDKFD_IOC_RUNTIME_ENABLE has not succeeded prior.
> + *
> + *	- ENODEV if any GPU does not support debugging on a DBG_HW_OP call.
> + *
> + *	- Other errors may be returned when a DBG_HW_OP occurs while the GPU
> + *	  is in a fatal state.
> + *
> + */
> +enum kfd_dbg_trap_operations {
> +	KFD_IOC_DBG_TRAP_ENABLE = 0,
> +	KFD_IOC_DBG_TRAP_DISABLE = 1,
> +	KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT = 2,
> +	KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED = 3,
> +	KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE = 4,  /* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE = 5,      /* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_SUSPEND_QUEUES = 6,		/* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_RESUME_QUEUES = 7,		/* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH = 8,	/* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH = 9,	/* DBG_HW_OP */
> +	KFD_IOC_DBG_TRAP_SET_FLAGS = 10,
> +	KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT = 11,
> +	KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO = 12,
> +	KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT = 13,
> +	KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT = 14
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_enable_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_ENABLE.
> + *
> + *     Enables debug session for target process. Call @op KFD_IOC_DBG_TRAP_DISABLE in
> + *     kfd_ioctl_dbg_trap_args to disable debug session.
> + *
> + *     @exception_mask (IN)	- exceptions to raise to the debugger
> + *     @rinfo_ptr      (IN)	- pointer to runtime info buffer (see kfd_runtime_info)
> + *     @rinfo_size     (IN/OUT)	- size of runtime info buffer in bytes
> + *     @dbg_fd	       (IN)	- fd the KFD will nofify the debugger with of raised
> + *				  exceptions set in exception_mask.
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *		Copies KFD saved kfd_runtime_info to @rinfo_ptr on enable.
> + *		Size of kfd_runtime saved by the KFD returned to @rinfo_size.
> + *            - EBADF if KFD cannot get a reference to dbg_fd.
> + *            - EFAULT if KFD cannot copy runtime info to rinfo_ptr.
> + *            - EINVAL if target process is already debug enabled.
> + *
> + */
> +struct kfd_ioctl_dbg_trap_enable_args {
> +	__u64 exception_mask;
> +	__u64 rinfo_ptr;
> +	__u32 rinfo_size;
> +	__u32 dbg_fd;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_send_runtime_event_args
> + *
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT.
> + *     Raises exceptions to runtime.
> + *
> + *     @exception_mask (IN) - exceptions to raise to runtime
> + *     @gpu_id	       (IN) - target device id
> + *     @queue_id       (IN) - target queue id
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *	      - ENODEV if gpu_id not found.
> + *		If exception_mask contains EC_PROCESS_RUNTIME, unblocks pending
> + *		AMDKFD_IOC_RUNTIME_ENABLE call - see kfd_ioctl_runtime_enable_args.
> + *		All other exceptions are raised to runtime through err_payload_addr.
> + *		See kfd_context_save_area_header.
> + */
> +struct kfd_ioctl_dbg_trap_send_runtime_event_args {
> +	__u64 exception_mask;
> +	__u32 gpu_id;
> +	__u32 queue_id;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_set_exceptions_enabled_args
> + *
> + *     Arguments for KFD_IOC_SET_EXCEPTIONS_ENABLED
> + *     Set new exceptions to be raised to the debugger.
> + *
> + *     @exception_mask (IN) - new exceptions to raise the debugger
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + */
> +struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args {
> +	__u64 exception_mask;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_set_wave_launch_override_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE
> + *     Enable HW exceptions to raise trap.
> + *
> + *     @override_mode	     (IN)     - see kfd_dbg_trap_override_mode
> + *     @enable_mask	     (IN/OUT) - reference kfd_dbg_trap_mask.
> + *					IN is the override modes requested to be enabled.
> + *					OUT is referenced in Return below.
> + *     @support_request_mask (IN/OUT) - reference kfd_dbg_trap_mask.
> + *					IN is the override modes requested for support check.
> + *					OUT is referenced in Return below.
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *		Previous enablement is returned in @enable_mask.
> + *		Actual override support is returned in @support_request_mask.
> + *	      - EINVAL if override mode is not supported.
> + *	      - EACCES if trap support requested is not actually supported.
> + *		i.e. enable_mask (IN) is not a subset of support_request_mask (OUT).
> + *		Otherwise it is considered a generic error (see kfd_dbg_trap_operations).
> + */
> +struct kfd_ioctl_dbg_trap_set_wave_launch_override_args {
> +	__u32 override_mode;
> +	__u32 enable_mask;
> +	__u32 support_request_mask;
> +	__u32 pad;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_set_wave_launch_mode_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE
> + *     Set wave launch mode.
> + *
> + *     @mode (IN) - see kfd_dbg_trap_wave_launch_mode
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + */
> +struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args {
> +	__u32 launch_mode;
> +	__u32 pad;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_suspend_queues_ags
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SUSPEND_QUEUES
> + *     Suspend queues.
> + *
> + *     @exception_mask	(IN) - raised exceptions to clear
> + *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per queue id)
> + *			       to suspend
> + *     @num_queues	(IN) - number of queues to suspend in @queue_array_ptr
> + *     @grace_period	(IN) - wave time allowance before preemption
> + *			       per 1K GPU clock cycle unit
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Destruction of a suspended queue is blocked until the queue is
> + *     resumed.  This allows the debugger to access queue information and
> + *     the its context save area without running into a race condition on
> + *     queue destruction.
> + *     Automatically copies per queue context save area header information
> + *     into the save area base
> + *     (see kfd_queue_snapshot_entry and kfd_context_save_area_header).
> + *
> + *     Return - Number of queues suspended on SUCCESS.
> + *	.	KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK masked
> + *		for each queue id in @queue_array_ptr array reports unsuccessful
> + *		suspend reason.
> + *		KFD_DBG_QUEUE_ERROR_MASK = HW failure.
> + *		KFD_DBG_QUEUE_INVALID_MASK = queue does not exist, is new or
> + *		is being destroyed.
> + */
> +struct kfd_ioctl_dbg_trap_suspend_queues_args {
> +	__u64 exception_mask;
> +	__u64 queue_array_ptr;
> +	__u32 num_queues;
> +	__u32 grace_period;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_resume_queues_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_RESUME_QUEUES
> + *     Resume queues.
> + *
> + *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per queue id)
> + *			       to resume
> + *     @num_queues	(IN) - number of queues to resume in @queue_array_ptr
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - Number of queues resumed on SUCCESS.
> + *		KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK mask
> + *		for each queue id in @queue_array_ptr array reports unsuccessful
> + *		resume reason.
> + *		KFD_DBG_QUEUE_ERROR_MASK = HW failure.
> + *		KFD_DBG_QUEUE_INVALID_MASK = queue does not exist.
> + */
> +struct kfd_ioctl_dbg_trap_resume_queues_args {
> +	__u64 queue_array_ptr;
> +	__u32 num_queues;
> +	__u32 pad;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_set_node_address_watch_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH
> + *     Sets address watch for device.
> + *
> + *     @address	(IN)  - watch address to set
> + *     @mode    (IN)  - see kfd_dbg_trap_address_watch_mode
> + *     @mask    (IN)  - watch address mask
> + *     @gpu_id  (IN)  - target gpu to set watch point
> + *     @id      (OUT) - watch id allocated
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *		Allocated watch ID returned to @id.
> + *	      - ENODEV if gpu_id not found.
> + *	      - ENOMEM if watch IDs can be allocated
> + */
> +struct kfd_ioctl_dbg_trap_set_node_address_watch_args {
> +	__u64 address;
> +	__u32 mode;
> +	__u32 mask;
> +	__u32 gpu_id;
> +	__u32 id;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_clear_node_address_watch_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH
> + *     Clear address watch for device.
> + *
> + *     @gpu_id  (IN)  - target device to clear watch point
> + *     @id      (IN) - allocated watch id to clear
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *	      - ENODEV if gpu_id not found.
> + *	      - EINVAL if watch ID has not been allocated.
> + */
> +struct kfd_ioctl_dbg_trap_clear_node_address_watch_args {
> +	__u32 gpu_id;
> +	__u32 id;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_set_flags_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_SET_FLAGS
> + *     Sets flags for wave behaviour.
> + *
> + *     @flags (IN/OUT) - IN = flags to enable, OUT = flags previously enabled
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *	      - EACCESS if any debug device does not allow flag options.
> + */
> +struct kfd_ioctl_dbg_trap_set_flags_args {
> +	__u32 flags;
> +	__u32 pad;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_query_debug_event_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT
> + *
> + *     Find one or more raised exceptions. This function can return multiple
> + *     exceptions from a single queue or a single device with one call. To find
> + *     all raised exceptions, this function must be called repeatedly until it
> + *     returns -EAGAIN. Returned exceptions can optionally be cleared by
> + *     setting the corresponding bit in the @exception_mask input parameter.
> + *     However, clearing an exception prevents retrieving further information
> + *     about it with KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO.
> + *
> + *     @exception_mask (IN/OUT) - exception to clear (IN) and raised (OUT)
> + *     @gpu_id	       (OUT)    - gpu id of exceptions raised
> + *     @queue_id       (OUT)    - queue id of exceptions raised
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on raised exception found
> + *              Raised exceptions found are returned in @exception mask
> + *              with reported source id returned in @gpu_id or @queue_id.
> + *            - EAGAIN if no raised exception has been found
> + */
> +struct kfd_ioctl_dbg_trap_query_debug_event_args {
> +	__u64 exception_mask;
> +	__u32 gpu_id;
> +	__u32 queue_id;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_query_exception_info_args
> + *
> + *     Arguments KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO
> + *     Get additional info on raised exception.
> + *
> + *     @info_ptr	(IN)	 - pointer to exception info buffer to copy to
> + *     @info_size	(IN/OUT) - exception info buffer size (bytes)
> + *     @source_id	(IN)     - target gpu or queue id
> + *     @exception_code	(IN)     - target exception
> + *     @clear_exception	(IN)     - clear raised @exception_code exception
> + *				   (0 = false, 1 = true)
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *              If @exception_code is EC_DEVICE_MEMORY_VIOLATION, copy @info_size(OUT)
> + *		bytes of memory exception data to @info_ptr.
> + *              If @exception_code is EC_PROCESS_RUNTIME, copy saved
> + *              kfd_runtime_info to @info_ptr.
> + *              Actual required @info_ptr size (bytes) is returned in @info_size.
> + */
> +struct kfd_ioctl_dbg_trap_query_exception_info_args {
> +	__u64 info_ptr;
> +	__u32 info_size;
> +	__u32 source_id;
> +	__u32 exception_code;
> +	__u32 clear_exception;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_get_queue_snapshot_args
> + *
> + *     Arguments KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT
> + *     Get queue information.
> + *
> + *     @exception_mask	 (IN)	  - exceptions raised to clear
> + *     @snapshot_buf_ptr (IN)	  - queue snapshot entry buffer (see kfd_queue_snapshot_entry)
> + *     @num_queues	 (IN/OUT) - number of queue snapshot entries
> + *         The debugger specifies the size of the array allocated in @num_queues.
> + *         KFD returns the number of queues that actually existed. If this is
> + *         larger than the size specified by the debugger, KFD will not overflow
> + *         the array allocated by the debugger.
> + *
> + *     @entry_size	 (IN/OUT) - size per entry in bytes
> + *         The debugger specifies sizeof(struct kfd_queue_snapshot_entry) in
> + *         @entry_size. KFD returns the number of bytes actually populated per
> + *         entry. The debugger should use the KFD_IOCTL_MINOR_VERSION to determine,
> + *         which fields in struct kfd_queue_snapshot_entry are valid. This allows
> + *         growing the ABI in a backwards compatible manner.
> + *         Note that entry_size(IN) should still be used to stride the snapshot buffer in the
> + *         event that it's larger than actual kfd_queue_snapshot_entry.
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *              Copies @num_queues(IN) queue snapshot entries of size @entry_size(IN)
> + *              into @snapshot_buf_ptr if @num_queues(IN) > 0.
> + *              Otherwise return @num_queues(OUT) queue snapshot entries that exist.
> + */
> +struct kfd_ioctl_dbg_trap_queue_snapshot_args {
> +	__u64 exception_mask;
> +	__u64 snapshot_buf_ptr;
> +	__u32 num_queues;
> +	__u32 entry_size;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_get_device_snapshot_args
> + *
> + *     Arguments for KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT
> + *     Get device information.
> + *
> + *     @exception_mask	 (IN)	  - exceptions raised to clear
> + *     @snapshot_buf_ptr (IN)	  - pointer to snapshot buffer (see kfd_dbg_device_info_entry)
> + *     @num_devices	 (IN/OUT) - number of debug devices to snapshot
> + *         The debugger specifies the size of the array allocated in @num_devices.
> + *         KFD returns the number of devices that actually existed. If this is
> + *         larger than the size specified by the debugger, KFD will not overflow
> + *         the array allocated by the debugger.
> + *
> + *     @entry_size	 (IN/OUT) - size per entry in bytes
> + *         The debugger specifies sizeof(struct kfd_dbg_device_info_entry) in
> + *         @entry_size. KFD returns the number of bytes actually populated. The
> + *         debugger should use KFD_IOCTL_MINOR_VERSION to determine, which fields
> + *         in struct kfd_dbg_device_info_entry are valid. This allows growing the
> + *         ABI in a backwards compatible manner.
> + *         Note that entry_size(IN) should still be used to stride the snapshot buffer in the
> + *         event that it's larger than actual kfd_dbg_device_info_entry.
> + *
> + *     Generic errors apply (see kfd_dbg_trap_operations).
> + *     Return - 0 on SUCCESS.
> + *              Copies @num_devices(IN) device snapshot entries of size @entry_size(IN)
> + *              into @snapshot_buf_ptr if @num_devices(IN) > 0.
> + *              Otherwise return @num_devices(OUT) queue snapshot entries that exist.
> + */
> +struct kfd_ioctl_dbg_trap_device_snapshot_args {
> +	__u64 exception_mask;
> +	__u64 snapshot_buf_ptr;
> +	__u32 num_devices;
> +	__u32 entry_size;
> +};
> +
> +/**
> + * kfd_ioctl_dbg_trap_args
> + *
> + * Arguments to debug target process.
> + *
> + *     @pid - target process to debug
> + *     @op  - debug operation (see kfd_dbg_trap_operations)
> + *
> + *     @op determines which union struct args to use.
> + *     Refer to kern docs for each kfd_ioctl_dbg_trap_*_args struct.
> + */
> +struct kfd_ioctl_dbg_trap_args {
> +	__u32 pid;
> +	__u32 op;
> +
> +	union {
> +		struct kfd_ioctl_dbg_trap_enable_args enable;
> +		struct kfd_ioctl_dbg_trap_send_runtime_event_args send_runtime_event;
> +		struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args set_exceptions_enabled;
> +		struct kfd_ioctl_dbg_trap_set_wave_launch_override_args launch_override;
> +		struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args launch_mode;
> +		struct kfd_ioctl_dbg_trap_suspend_queues_args suspend_queues;
> +		struct kfd_ioctl_dbg_trap_resume_queues_args resume_queues;
> +		struct kfd_ioctl_dbg_trap_set_node_address_watch_args set_node_address_watch;
> +		struct kfd_ioctl_dbg_trap_clear_node_address_watch_args clear_node_address_watch;
> +		struct kfd_ioctl_dbg_trap_set_flags_args set_flags;
> +		struct kfd_ioctl_dbg_trap_query_debug_event_args query_debug_event;
> +		struct kfd_ioctl_dbg_trap_query_exception_info_args query_exception_info;
> +		struct kfd_ioctl_dbg_trap_queue_snapshot_args queue_snapshot;
> +		struct kfd_ioctl_dbg_trap_device_snapshot_args device_snapshot;
> +	};
> +};
> +
>   #define AMDKFD_IOCTL_BASE 'K'
>   #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
>   #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
> @@ -877,7 +1532,13 @@ struct kfd_ioctl_set_xnack_mode_args {
>   #define AMDKFD_IOC_AVAILABLE_MEMORY		\
>   		AMDKFD_IOWR(0x23, struct kfd_ioctl_get_available_memory_args)
>   
> +#define AMDKFD_IOC_RUNTIME_ENABLE		\
> +		AMDKFD_IOWR(0x24, struct kfd_ioctl_runtime_enable_args)
> +
> +#define AMDKFD_IOC_DBG_TRAP			\
> +		AMDKFD_IOWR(0x25, struct kfd_ioctl_dbg_trap_args)
> +
>   #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x24
> +#define AMDKFD_COMMAND_END		0x26
>   
>   #endif
