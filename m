Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47D6CB0F5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 23:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF8210E403;
	Mon, 27 Mar 2023 21:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9E110E27E;
 Mon, 27 Mar 2023 21:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvRVRML/IaDSOUhy1A29vQ2IerJYrMP1pFNaFjMTqiV2HG3RbxToCiWhVZf6+u+gHzDpGfcpYcCc0Fo0jetLKpjVqRRVzOAeT/b5YKLbCMvZOjTlgwCunkMuaYqK6ztAV0n5vtryMm8gf7qz4J1FKFbhL6jT5Idl64055hs4LCjrMR69236gT2uBIC9y6CRN02bT0mUOWK8cpL3cFlfvWAygZE2S9rKhoBQs+SY4kqEbLhEC7DMMmqaQNPlH2ykj03YX40yr7B02VKrtHljCqBQbwxS2k8j+jp7Dor69S+wUhtvcBy241/YFl/S/Kp//8boqNwJ6JpB9ixmZ3xYEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miMDGF+5gZneVtXt0a7+Z5XZmpCTAkH47H0WvjSgpEo=;
 b=kN83PmjWi2xZaKkSEbDu2OdJdUbnRWU73Fpv/y1OvyPGaaKQ4cGK18NUmwlUc5Ql4yj23eUL0vKsust54jg1bnyFtPYMutUELElse6W0fXUsrQpu5yrXRdIOhZ4kKYjHODwsre/oxdnKB6+RZaNe4I1jBSEGHcSGNQgA/c5clyxA7ZBS1NQi9kc2qMV6j6bR0CLbk4T9IjHakKlTkxirTSof8bbJxqPUUzqh00HGPu5xnP1fu9rw1YFaY5ycyD74vueDM8xPtZqXlqG4CwYADyT41pUl2LatafTbbxCH2SEPv1/yZVLnSoZLgadHt7qP1b4ZgQN7rGHeDnHK7Km8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miMDGF+5gZneVtXt0a7+Z5XZmpCTAkH47H0WvjSgpEo=;
 b=Yuctr8VCpzVAnLx+lz897qeqntmQslMgMVUrLITmbBR1ctSaHhB7ybgM1EdueYaJUYwUEyZ2+Gox0SH/JT7aKGiazBCEKEP6UHY+EWhwPRpMpY7s1r03XRxmG3pIlMOaccY4tmalyas0XiPe3Kms9XKYzpdVkb4YCxm9Djws6yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Mon, 27 Mar
 2023 21:47:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6222.031; Mon, 27 Mar 2023
 21:47:26 +0000
Message-ID: <2a773bb7-535b-38e7-bec8-131c1abca7f4@amd.com>
Date: Mon, 27 Mar 2023 17:47:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/34] drm/amdkfd: add debug and runtime enable interface
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230327184339.125016-1-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 314ef557-50a4-4de9-0c5a-08db2f0cdac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jybKCZSD7oqFI2AN6uRYt3fuAoNzOEfWsDyUe8GZqIO2Wby7bZ4wi4s+kGo1/TS8S4mQRKCzQFQNVGMBUZY3IaxtEqUgZR7BKW1h3MDNnHmbfGO8Sy8emAFLOe622ETi0DcZZV2ppaKUCQFVvm6NIjm/UVcQVmCVgwuLTHoPD+MGgou+f87ffblzTIgggLT21XRBfE9q9PgnG/NDz8fbXHaq9iAaKxXgUe97OGeshKjelvFT24jneu0Gpl4+GY7x7CdPKriHMhVPXnvPOpCryCUI2r6iCJ19PCmsiQWg8bu3TYXXvV7aF6pEFcCs5hnNTKuawpjfDOTdF8IlbDbcuJMpJpbh/X+aLhspBW9j0YT4tUlxx1+dd+AmwNciqY0U2LdGweFHcFCS8hbIc+o2YO4xH/vumJdtkNEmOxgAg/aVg4vaJ9Qv8WdZoRQhYD6p3aZQBjjycSp0yodga7UiHobzVXQbTdCptj2A7NIGq3LoPwe22tWMLG05BBKmVaZPR6fb4zF0h0vwA9+WxYeTl0H9XRYYGH8CUetwVauaiUpo35S4IqNe1j/9pil/leqHXt0lfaR9CpyiwHjLRB2DS4bCraxKRa7ACms2BT+F1PuOLK8aqW8SmvTKah37KRBrT6l7Ky2cn9kznB00BT/vtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2906002)(83380400001)(30864003)(44832011)(5660300002)(8936002)(36756003)(31696002)(38100700002)(86362001)(316002)(26005)(6512007)(6506007)(53546011)(66556008)(66946007)(8676002)(66476007)(450100002)(186003)(6486002)(36916002)(478600001)(41300700001)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJCS3ZQYWNLa3E1UU8xZ243OU4wK2Iva1QyRVZnUVBrMXZ2eEtoKzFCbWNG?=
 =?utf-8?B?V3htZ1ArcjlKWEswckd2dWt4NzVmVkRQUFZUczBmTmVDS0lKcE1zR0M2QlhS?=
 =?utf-8?B?bnZDNGZLUVJhdzFQeFVVcVlLZmgydHMvSEtvYzY3Ukt1Sk5ReFNKbE5qQ04y?=
 =?utf-8?B?d1ZMb2ZtQk1ZbEFQbm91dEc4VXpMQmFnOFByNzVmM3Bsc0JXQjV3NXlvMDl3?=
 =?utf-8?B?eENmZzhRSUlPQmdKbWt6MG82Y0dBQzN5czkwVDUya2RNTnlzL3NuSWVqbTRZ?=
 =?utf-8?B?SytQVjdtOUJOSnBUTTZRalpFMkZZanNpeVB5K2RPOWxLeWxjRzV4aSsyYkVC?=
 =?utf-8?B?NG5UeTIyd1FUYnQ3bDhxT2xEclVzRzdkUVhrWDVBUzVhV01UZmpwZFY5cnRN?=
 =?utf-8?B?Kzk1YThUMm9FMWtWY1I2eEVZUTBheFNaUERCNDBORDlQeFJncGpVSUtmWXV5?=
 =?utf-8?B?c3VnZURMNWFNanhVR2w3amprRG1Db1A0UVZqWlUxU3FnTWcvT2NqdG5HVnlM?=
 =?utf-8?B?ZjZLenhCVHBkRldlcWh5NlNTV1dnMWpJK3g1WUFBMy9hQ04vUC9pODZxYUlG?=
 =?utf-8?B?RHNvSkE4WDFzVUdadWgxQ21IaGd2M3hwVVltQ2ppR2VGZHJvd0s1dWZWajI4?=
 =?utf-8?B?OWVBTjd1NjJ0UFRORzl2aUNiL0krdVJsenc2NnRoU1FwOTRNdVl3M0tFTTFs?=
 =?utf-8?B?cXBDV2NYRDIwNTAranRnSW9oZHIycDdkaGlEM3k4a0NMczZCWEt4K2pleXNi?=
 =?utf-8?B?T3hVcUFZdmVTcVNnRHQvMkJJR2NlcEhucGtCV29Idlh6WSt6c2hRNjYzVElx?=
 =?utf-8?B?c1dlZGtiNVZQVmFyVlB2NEhRa0Q4SVVXcXl2U2tEL3ZWUDNwVXNQbTBTNEYr?=
 =?utf-8?B?ZUZ0VENTRlhnQ1BxazRPcWtWOEJvbG1wSWFZMWtDa2VKNUsyK2gvVXpXV08v?=
 =?utf-8?B?M1Mzb2FqbVdNYW4yZFcweWlMR3Zkc2IwcTZoaGhCSGY2RXR2ZERJalV2SkNi?=
 =?utf-8?B?Y0V2UUJvWnNuWXBMWHVZTU5hZ29aNVdUdC9QUHgxaHJhcEY5emg1LzFVbWhi?=
 =?utf-8?B?R2VvZ3RLY2lMSlZJdzhjQ0MwV1kzbkZyb0RpR2ZKd25OQ3I4TDhaUWFselRY?=
 =?utf-8?B?UlJkT1VLTjlHSHRRM1FUalBTK294WG12VVE3MjVCSnhOODZ5cU5rUndRWnlk?=
 =?utf-8?B?VDRlRG5pRmxaRlR4Tm55Q3htSHVsbzdpS3FnVFBGanAvd05NU3ZiandFS0o0?=
 =?utf-8?B?VXY2OVhFZW5oV1p0M0hncUhacmt4Z1ZHU2ZwNXZ6RWR1NWpuYXNib3VMdWNa?=
 =?utf-8?B?YXNGcS9CVkdBald6bEV3NTIrVGF2ekhjZGtIVkpraTdOTU1taTNPTWR0cFBO?=
 =?utf-8?B?aDJJQUJhTEliS2ovR0xZLy8xU2Z3cVQ4TkR3dE5uVXArNzlocXg2aFNtT0FK?=
 =?utf-8?B?eEtub0RibmlIRHJlZE9mOG5tNnhyVWFJcGZ1TTRCbUp6Mk1pUlJySUNtSUV1?=
 =?utf-8?B?a2JOTG56L3RVNEx1SEx3OWkvbDVTOGswSHZ1WUpteFRHQWU5T0NzVitZN1NU?=
 =?utf-8?B?Y0RjZnZ6QmlPYnY3eDdRY3lLd3o3WW43Rk5WaEp5TXUwV0wySzFNbE1TMndG?=
 =?utf-8?B?ZFpLeExyWWxmQmlFc1FBNXRSOHlDNHdTbjlOUmRlclk5eUEway9Kb1dPWUJw?=
 =?utf-8?B?di9HVE5RSnRjUWNySG1yQlE0ZFZ3SG9oYlpuM21GNXhyd1pQQW1JUVMwUFNK?=
 =?utf-8?B?VmhDRi9XVk9RWGM1VGt5azVTdEliU3JieUpwSXpvQ0N0bWJoR0JoQnhueWor?=
 =?utf-8?B?bUs1a01WVkFLb1pkc1dXdm5UUW5MclNWSkRvMEtSZU0yUk5QTksvNWZqWkRj?=
 =?utf-8?B?YmxCbXEwdytjSlUzWm5POVZnVzJ5cmNORG1OSmFPbVcrcU10cXJaL1lFOGxL?=
 =?utf-8?B?aUlSN1VTZXBxS1dpOG44enByZFcwVjJXNE1MNjNpbWVQRUZNK1lqbDU2L1ND?=
 =?utf-8?B?VVZERDFUUk1UVWV2OG1XMW0wYjVtMXdSRk9zbC9uRnl5NTQvaDU1dVo5U05F?=
 =?utf-8?B?a0RPOWJkZ29oMHJIYXp4dkl2OXJoaUhvN0pKWG13aGFrYnN3d2dPMC9ZR2tO?=
 =?utf-8?Q?uYBEb1LJzzfP0edO3P1anTi3N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314ef557-50a4-4de9-0c5a-08db2f0cdac6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 21:47:26.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyD7mB1jCKSuxX7tYeLMvJ2JFsU5Ry5EWvRIhiZ9BRSFDh+r2Y3ZNErlfBzbd+d8np8Y/oo2Lge4d1OQC6+Dag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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

With my comments on patches 8 and 21 addressed, patches 1-33 are

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Patch 34 needs a more thorough review and testing. It's not an essential 
part of the patch series and can be finished later.

Regards,
   Felix


On 2023-03-27 14:43, Jonathan Kim wrote:
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
> v3:  previously reviewed but updated context save area header
> struct from suggestions on patch 25/32.
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
>   include/uapi/linux/kfd_ioctl.h           | 667 ++++++++++++++++++++++-
>   2 files changed, 714 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 7228a3db63a2..13a630391a6a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2715,6 +2715,48 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
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
> @@ -2827,6 +2869,12 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>   
>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
>   				kfd_ioctl_export_dmabuf, 0),
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
> index 2da5c3ad71bd..0e05c0f3f348 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -110,6 +110,32 @@ struct kfd_ioctl_get_available_memory_args {
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
> @@ -773,6 +799,639 @@ struct kfd_ioctl_set_xnack_mode_args {
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
> + * @capabilities_mask - mask to notify runtime on what KFD supports
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
> +	__u32 capabilities_mask;
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
> +	struct {
> +		__u32 control_stack_offset;
> +		__u32 control_stack_size;
> +		__u32 wave_state_offset;
> +		__u32 wave_state_size;
> +	} wave_state;
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
> @@ -887,7 +1546,13 @@ struct kfd_ioctl_set_xnack_mode_args {
>   #define AMDKFD_IOC_EXPORT_DMABUF		\
>   		AMDKFD_IOWR(0x24, struct kfd_ioctl_export_dmabuf_args)
>   
> +#define AMDKFD_IOC_RUNTIME_ENABLE		\
> +		AMDKFD_IOWR(0x25, struct kfd_ioctl_runtime_enable_args)
> +
> +#define AMDKFD_IOC_DBG_TRAP			\
> +		AMDKFD_IOWR(0x26, struct kfd_ioctl_dbg_trap_args)
> +
>   #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x25
> +#define AMDKFD_COMMAND_END		0x27
>   
>   #endif
