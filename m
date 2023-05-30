Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78643716EA9
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178010E426;
	Tue, 30 May 2023 20:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224410E425;
 Tue, 30 May 2023 20:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jd9ph8/MLq81uCSAINS2FruVVQ38JhMbF8jgZyQ7gKxHSDGjv0VIVThucJoSQvO/48Q86CQbmV1in4qErvgyUf2b93jUMkgWQ0EdF78+xJu109VlFSS9pRSMYZxQbV2OBY239UPBrZYoH3qMg4YSoUMJTz4sYkfcMOgfPEJ559Xh6pK4Uqa0DAkCI83ol4kiie14MhQrhaTJF7ytq3Xx27xWBQLVJiv8Kjxb8fi9xSFgpi3sRrw/th1n1nSWxIPkZM5qVUEuQL81ploElzSlwAUoJFL1oTNaahcKpbgQgS5KIA/PndayJ1c92RU9AF4wj7uSAyUIvcwniSLyeH7r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Tr87vEYhFlG8Eag9u5hEhP/TAFoGGeVmA201iSOVHQ=;
 b=XtT8q5UnCm5+q4MJXfWVW/XqD6e/d34vDTEw7Rg6S6OAWJzJqflJ9tQtu2RZDgJ+PQ2CpBJ/dumqGlDwe+NqzIRhIMJ/n7MDq+EkUtPC8ZPPGvCO4PVEDxeg0iQs28SWxO2xQqVQ/kddIwhAAnazUVtOei8jQ2iseXYYshIS4qMVbbSJ985jEH/G3FLi3nzeRYqtwX74Ec0UJuLj8jzXUb0pjqMY3efb/FG8+8wL0ESLTGBKrjXkxebGuW1ajzZCJzqfWhTENg36WWZxxPhkZA9+8bywiVDgm3ajtZ+5igpnhtjzMu60ZVKt5ZIwII2Gmploy/XnBoJP7W5fP4Mc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Tr87vEYhFlG8Eag9u5hEhP/TAFoGGeVmA201iSOVHQ=;
 b=EKPGeY2OTLIzco29Rc6yBByZlj9VyzOvavcEnDe9rOdM3qRyx8ABREiFjxE0u9T3d3OXDDwwQSG16WGYg5TnJBxhddz315QxwTJnEEZk1G40c9sJBi9yFUPa4mM5IgCkSFxDViQ91LMmzs58nns9QO5NEULurJGzaMxJOWO0zk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 20:30:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:30:19 +0000
Message-ID: <fa22a4f3-3f5e-a189-1576-b2be39e16856@amd.com>
Date: Tue, 30 May 2023 16:30:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 28/33] drm/amdkfd: add debug set flags operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-28-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-28-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 7719de48-65d5-4b3e-d096-08db614caf5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scVaVNXSLWBWTDLislqWkoDTQqtP1I4N8pQvjQghhnzF+R4HZH2noI1VRy94Q8B0ZE2xLmbAMvwNfNB5/Yiv4JG64/MDKwhFhj0jsXhxQAYk0p7tBV7c8jdfxjgJ5w6mLAQ4yGOLNnrOp6xElyQAYjb4hMDzN7ZuA3Q+qzJyrBmxnyiHNIbG5gVT/jKeU45EJ4fZOeJ37Z6ua10KRSePomqJ58AOYtFZCkoddNW+mmSmsI0dgPu6SeB4DIjwLrE1nQs4CTtIRo5LM2g8bZ27wn6l6oYEEH7zq/gT2fK36vPJ1mEPb5qwAbsqEJE/s25XguswppV5kaMykVsZuzxXXCNTfxPqLcyK67swCyRIz45lZt+Uw9P7acN7YQ3YiISdMsxMGHnFe6SpXivHVXaHfhPBNXRsNUvLs5/zvsi681i+kty5F2WY5ZcN/UVsSz0aWSefrd9f2eT73JlRsYYvurpeSsD8ecYjk3o0YGFKsk7LQtgYbvSkTrfqBO9x6eqejIkXcm9wI+apj8f/5djwiUCai2qnvWVGF/XGOq+wep1qgUD5a8ZyCSSp0W1uWtil441UVHYpauaP21bJViUlvyb1tgOqgPM4IG5cqYEdgu6HWHaK3+dgMEOsD4LxmZ81xiRQ1H+CTGdjqVSKSBZh6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(36756003)(478600001)(2906002)(8936002)(44832011)(5660300002)(8676002)(86362001)(31696002)(66556008)(66946007)(66476007)(4326008)(316002)(450100002)(38100700002)(41300700001)(2616005)(6506007)(6512007)(26005)(6486002)(186003)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVptaTMvUVZUM3ZFS3hzWUVIUDNOdXFvNmplMW9WTzZ4RGhFd0tkcWRCSU5h?=
 =?utf-8?B?d3NKU2V0OGdSSUxyaUFZTFN5N0VGNkxxM2hjT1hXZXpIVWJVeXA1V0Jka1ZS?=
 =?utf-8?B?ZlRaQmNqeWYzZ1Q1U2lMaFU0Z0Q5cGgyZGhKaUM5andJRkRvWGs0OE5uNTZX?=
 =?utf-8?B?bitDK3ZzYmY3M1k4aTZML01Pdmc3b2x3TC9OL0dUOURTUFA2MEY0NWFWWGRx?=
 =?utf-8?B?R0dmemdMdk05Sk1LVzhFNGVXdG55REc0MTd0ZWphMm0wTFZDRDEydUVLQ3lI?=
 =?utf-8?B?S3lWRkNZTUZ6NzJCZFo4emUvYlRZaUlrV29YaS9veGJ1WHNLNUJzcm15WnJV?=
 =?utf-8?B?cEZwZnl1VUgyTUtqME5CUmlJMTh0UEtvNkJnVnZ2SE1PK1RJNzU5R1hlQVVI?=
 =?utf-8?B?cE9INHduZ2Q0TWVFYTd6VURZZ2hHUEhQOFpqYjdjekFwQlVtT2hMbk9WdG9M?=
 =?utf-8?B?T2xLL2VOSURNV3ZpTXVXMjQ3MDA1M3drT1ZFNnZBNExMSHl5RHUrMHk4TWls?=
 =?utf-8?B?cG1ZSlRBM0Z0R24vR3EwNTMyekFtTzdZa0xxVDhpWE5UQThuTVVHRUFrb21B?=
 =?utf-8?B?S1BScnJJMDF5b0dOTGxhOGMrWXBtNEZJeGR4ZDlvTW9nTitFY0w5SFBmS1k3?=
 =?utf-8?B?TURtaTJwZUtrb0xPQ0c4dkZyNllKT0FLbFBHayt5THArWnpCc1B4ZVlZZE1Y?=
 =?utf-8?B?SDRjcUlDcm8zUUVVR1NsbDJFTW5GRWNGT0dVSWhIMnBLeDRmOGRJejZqb2VV?=
 =?utf-8?B?ZURJL1hnTmJZWXIra1JOVjc3VzExeUZHZ3Y5WFAyaVdsVk5FRzgrY0Y0Rk9l?=
 =?utf-8?B?aGNQYm1OamRabmpnc3ZoOGZjKzU3Y05uaE11RlRXYVRwdEx0N0Y5NWo0T2dU?=
 =?utf-8?B?MzRpWUQ2QWdCUHdYbGJtVjZmN2NBYy9YbmNDa2szbUV3WEJGSTlYTG1FNTk5?=
 =?utf-8?B?T3l2Q1FHTVJnc3NLejdWbG0vQUsyQ3V2V3FheGNxQzZFdU9PMzZGYlRoUHM0?=
 =?utf-8?B?dEhWL1Z3WlFzMWpCSkRMYWdqU3B5Vm80Z1dxY3NOeUxDWFovN0IvbXoyQWRJ?=
 =?utf-8?B?eEhVbjlTSE9Db2NYRVBNWVBpbk51VXpESW5yRTdRQUovZFNPV1hOOUVLamJZ?=
 =?utf-8?B?NkpqVG1xWWphT1B1ZE5KMGQ2aUcvU3pwWjdnZHFSR1ZWb1JnODJYWHdNekxN?=
 =?utf-8?B?c005VEtVK05nbnVqam5KZUFkUWwxaHIyWHYrZHcvQmxOeWlVMGJ3Q0NwZjhT?=
 =?utf-8?B?QW9Sd2p4eHhkUzlnY2RGZ2QraUppTUZFMURrZi81SUpVZGVCQU1menE3Nysw?=
 =?utf-8?B?N05XMEpZb08yQUMwZUM5ckJMakNscHNpSG16b3liZlVXQ21jQm5sZ2grK2dT?=
 =?utf-8?B?QWhEbUUwWE8yaTMwZ0htYS9BRmJ3QmFyZ1d4MXFuL3RtRVNSYUErVXI5OEFv?=
 =?utf-8?B?SjBCYkkyMUt5dituY2FCejZUVXVSUWxZNDZxTnlWSFFGcmc0dlpTS04yZFVZ?=
 =?utf-8?B?NkVqWm81Ylp4cEgvU05FeDJreERFUTYrWlZBVHVaTDZ1cjhwa1RsVHBwYlRz?=
 =?utf-8?B?ZGl4b3VzNmZVYlJWcnh1YUN0MmRra0p1eVcybUNJcmtrMXl6WEhzRUMvR1k1?=
 =?utf-8?B?d3Z3aVkrd3ovcWhiL3l4R0laR0FnZzJiWjZrNUNrS2pEalNaU0FqdG5saDVT?=
 =?utf-8?B?WFdJbzg3OXBuSEZSNzIvY3Fya0N0b1J1VlZDSmU1R0NoQUFwVVVBdTdQQWlF?=
 =?utf-8?B?VUZKT1Z4Q2dUTzlMdUFVUWl1OVRtK3FUbThOMk1zRW1RLzJxR1R6Zm40ZEdB?=
 =?utf-8?B?VHFNcDg3ZWd3aHlwNjdTSnRHODVSVnRhRXNpNGdFdUp2N3BoWHR1d29semdl?=
 =?utf-8?B?MnRCeWFPUEoweHU0MzZRN2xUTjFpcjhYQ1IrZVJnM0NGMEZPSHlMOGpLNytu?=
 =?utf-8?B?blRQY0pKeG51cldCU0d1c1A2YS9PcE5JR0tpUDRNL01LQ3Y4anZ1dU1ZaTRK?=
 =?utf-8?B?Mmg4aXl1dUQ0d0E3ZmFPZmF3eXUrUnZTT0psNTExTXFFRmJBTlUySm5nUElO?=
 =?utf-8?B?aWFPcm5ZNXhxdXRLRTB4OHNxTUkzS0NvczgyMzdTc2FCVnVCdEY0b3NyMVlP?=
 =?utf-8?Q?+7AEZk6gbojQ0SdHqC3U0tlQG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7719de48-65d5-4b3e-d096-08db614caf5c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:30:19.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87mNt7UjogVe7/D4TLMVAOViWSmzGYccLkwJCJNoEZndKEqyRsQ7ZNUR6Me/iDjxxclB+pMxEwCU7T5nbL5hOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Allow the debugger to set single memory and single ALU operations.
>
> Some exceptions are imprecise (memory violations, address watch) in the
> sense that a trap occurs only when the exception interrupt occurs and
> not at the non-halting faulty instruction.  Trap temporaries 0 & 1 save
> the program counter address, which means that these values will not point
> to the faulty instruction address but to whenever the interrupt was
> raised.
>
> Setting the Single Memory Operations flag will inject an automatic wait
> on every memory operation instruction forcing imprecise memory exceptions
> to become precise at the cost of performance.  This setting is not
> permitted on debug devices that support only a global setting of this
> option.
>
> Return the previous set flags to the debugger as well.
>
> v2: fixup with new kfd_node struct reference mes checks
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 58 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  1 +
>   3 files changed, 61 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e88be582d44d..e5d95b144dcd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3035,6 +3035,8 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				args->clear_node_address_watch.id);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_FLAGS:
> +		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
> +		break;
>   	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
>   	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
>   	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 4b36cc8b5fb7..43c3170998d3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -23,6 +23,7 @@
>   #include "kfd_debug.h"
>   #include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   #define MAX_WATCH_ADDRESSES	4
>   
> @@ -423,6 +424,59 @@ static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
>   			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
>   }
>   
> +int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags)
> +{
> +	uint32_t prev_flags = target->dbg_flags;
> +	int i, r = 0, rewind_count = 0;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		if (!kfd_dbg_is_per_vmid_supported(target->pdds[i]->dev) &&
> +			(*flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP)) {
> +			*flags = prev_flags;
> +			return -EACCES;
> +		}
> +	}
> +
> +	target->dbg_flags = *flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP;
> +	*flags = prev_flags;
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
> +			continue;
> +
> +		if (!pdd->dev->kfd->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r) {
> +			target->dbg_flags = prev_flags;
> +			break;
> +		}
> +
> +		rewind_count++;
> +	}
> +
> +	/* Rewind flags */
> +	if (r) {
> +		target->dbg_flags = prev_flags;
> +
> +		for (i = 0; i < rewind_count; i++) {
> +			struct kfd_process_device *pdd = target->pdds[i];
> +
> +			if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
> +				continue;
> +
> +			if (!pdd->dev->kfd->shared_resources.enable_mes)
> +				debug_refresh_runlist(pdd->dev->dqm);
> +			else
> +				kfd_dbg_set_mes_debug_mode(pdd);
> +		}
> +	}
> +
> +	return r;
> +}
>   
>   /* kfd_dbg_trap_deactivate:
>    *	target: target process
> @@ -437,9 +491,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   	int i;
>   
>   	if (!unwind) {
> +		uint32_t flags = 0;
> +
>   		cancel_work_sync(&target->debug_event_workarea);
>   		kfd_dbg_clear_process_address_watch(target);
>   		kfd_dbg_trap_set_wave_launch_mode(target, 0);
> +
> +		kfd_dbg_trap_set_flags(target, &flags);
>   	}
>   
>   	for (i = 0; i < target->n_pdds; i++) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 7f0757c2af2c..ef8e9f7f1716 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -57,6 +57,7 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
>   					uint32_t watch_address_mask,
>   					uint32_t *watch_id,
>   					uint32_t watch_mode);
> +int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags);
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
>   					unsigned int queue_id,
