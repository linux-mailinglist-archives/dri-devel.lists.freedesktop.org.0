Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAD6C2596
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1860010E35E;
	Mon, 20 Mar 2023 23:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D442510E04C;
 Mon, 20 Mar 2023 23:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5oYewmPVzJr7pF/jZdwNl2CuVtUcF1gke/7oqUAuE6q9ZRl2lVrLWIkcUiQSzEDXG0lAHiRjF2OyBv4SI5N9f7CxQ8JNI8I2UcE6o86bMn1DpkujzzDW/xjRezKVVaCdaLU2ogd/YfK0tv9Nh6oHaRjZhJold9VYWjjbGZhTfO4WNQCcBCABe7eseiJcGSbRkgbkEcL8RRXnh6VMtfU2WyYLpopdYMHeWpjwnnEykORmlL6go7lU020s2JVD6QyJNN1iK0n2LDrYNlxU32Jy3JqOoCqCoXjhSMS0xWKZKZRltMKkGypk/TpCSkgXB35RFeJRVdtnIjmk/FlhjuSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxhhwYmCqTWBUXBzi/a5Nvz9ZEibnftHG8uJse0g5Gs=;
 b=DYIZS/A5/RSjf8fDjYuvA8pzkb0vfblSp5uWtTlyepfbgOHLU8flwDOm0+q668cml8tmjIazVCFjq31664E7KBSbPaC5zEqFujPimBe1K72ChGhkkQU27RVFh3DLM8G9pe3WG90xObTds+lxpKWW6682FrPD6lB9zVbblWgg9yzkalAG50Sl5fUhMdCgy54zejPQyrrqXdNtikXjkAX6L4+APIutTIxh7R3yR7The6gKEWm7PwgJj1VHR9Z7udmlgpeef0F+vE7eUjJc6IvG5BvOnZ8S4yUzl11dnLMT/69qK5WUPIMJYfCCjYhPMmS0O21dxor7JzwSMbods7rZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxhhwYmCqTWBUXBzi/a5Nvz9ZEibnftHG8uJse0g5Gs=;
 b=vOVonIyIykgHkFifSsRR5RAB9MaSTTtO5qxePyUXhVnoib8u366NIlswVneZww3GBlS8DCEwquBc2jFjL02+gH5WJUVAPa2j13qNbHudbUA7daKWudi0DsF7LIXoMg3h1xIxSmy4xfIHUlZZJv9vP0B96xUCV4QVWy71Al0MIzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 23:26:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 23:26:07 +0000
Message-ID: <1d319759-9580-7f3c-9618-7a496cf8d68b@amd.com>
Date: Mon, 20 Mar 2023 19:26:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 18/32] drm/amdkfd: add send exception operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-19-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-19-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f786e20-4a6b-4fea-f5ff-08db299a7b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kOQCXQS3X+IGWHsChjDB81x+id7Waaii8mDcScrozgnMLvq8i84q+nVl5R8DG3vCUO/0wyh2AxKQu3Cuzx8lJS7PYVEyyl3EUf/+1lmRPLozsN70keVl/H3dO5WC08QlV6POHTQvUR9Gke5duZ93ZXucqyAWZySeFHdakz+EF1NZ7RTf/EGEttrW0M95YidHtP1K/xRco3XDyKhkZKqbGvUD9zHRkOqtz3sFoViPFSmaB+PKhHkedHKFUGAow9YkqringJMZXoG/4LK9QC9IyRDw3MioNKED/RUAjdqdQuNBorjywsxHlsLoq2TZ7SOtAlFMddehhKXWdVSVf2RpxZ+Mjrc9iXbIi5wL9jA3qBzi0uaVzW+FdtSKs5uMmowL4PcwUbAuorK6dtLfBaWmuVYER6SjGU4VdHTc1tjP8xFSzycoCmT5TXCtxIOFhQ3tZ7qo8/TgJPfvbfz44GnKtfHn32o1yD4zaczXe3Wq+2obPtc+t7LDl4hTmSrrCMzTbJJh/McZDCF6esh0yEXH6Jzq/j7a6eWUEVv076gnar6Cm06BR5G9inssTQjJmxG24V1jSelVty55K0ZC5ig1i1704bu2x0fptQoW1wdGy/0WiR6x0PonAYXcfiWM8pIEhYrw7F44w5likZPoGxnHmjQTH54IRSCY53CqWCRv8ZhIaXo3ZD6pqpk98g88belOJgJKZAPzNducHJhlQ9Rw2tqZ3P8TZ1IkvmjxYqNElgM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(31696002)(86362001)(53546011)(2616005)(31686004)(6506007)(26005)(6512007)(38100700002)(6486002)(2906002)(36756003)(5660300002)(44832011)(36916002)(8936002)(41300700001)(83380400001)(478600001)(186003)(450100002)(66476007)(8676002)(316002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1U0SUNGQWpMZy9hU0RkSWVuNlNQa1J6bHVJM1NrejlnRkVTdnVBbWpYUUFk?=
 =?utf-8?B?ZFlJNXBuWjhpNSttWDlJL1dtYVVkUlJuRzAzT0RjS3FNb2pKdGQrd1FlNW4v?=
 =?utf-8?B?K0dzNzN1R0FzNUN0ZlVNd1pQWHQ0M0EvemI2M1ExeGV4L3ZCa0xndC9SMGEr?=
 =?utf-8?B?TEZGdWVST3ZaWjV0UVB6UzhrcEhSZ0N5TlRWbjZJczZFaUdOUXNLY0xEdWlh?=
 =?utf-8?B?UnNNQmg4SDh2cDRyZnlrakhyWEd2SHdOT21OZFhMaWh2aVlKbXRaR0hCVWZj?=
 =?utf-8?B?SWF4T05iTk4yY2FmcFZjaGdKY3ZDRlVYZFpjU2I1T1VBL0NuOURjQzZNbnlH?=
 =?utf-8?B?YlRRUEJEbWsyQWVXOWFkOTRzQ3dwNVNTTEhRSHN1MkJZMlVNdGgzTlpldmFt?=
 =?utf-8?B?Z2poSC95TDlVdlBjUDlqaG14WTJERmxGdWROMFNxYnZ0VFQyaWQweHNBSE1Q?=
 =?utf-8?B?bXZWRXF3UThzSjNKZ3IyRVpYSGJIdUlrTE5TS3RsRDdBeFoxdkpLMTcvRDRz?=
 =?utf-8?B?Z1VBRHhaVk55MFU4ZEdvdkZXT05zdUJFYjYvVnI5b1E5YTY2Tk82VzNIc1hq?=
 =?utf-8?B?S0d4SGFxM3NpNVhmVGRmNWZmVHovYktKL0pTMC9oV3c2cllRaGZ5ZGFIZ2c1?=
 =?utf-8?B?WThJWDZWWDYvTDRReGRvRndLaDVvVmpieDJrVThOZnZ4OTRaZzNReGVCMVkx?=
 =?utf-8?B?RDdWMWFmS1g1T0NyRldsQkxMZjlZL2s5dDl1NldnNTdMc3IwTmphTE9Mdmtl?=
 =?utf-8?B?b0Q4YWZjYlFNeFo4L1ZjSHNPSUdGSnV1emlMMDRTZldsdVZabWJwSU01citO?=
 =?utf-8?B?UmErYVBQY3g2NlBjbHdlVHFvb0VNa01DVk5RU2l3UlJQNTNESFQ3UFJsSGw0?=
 =?utf-8?B?blN0NEpCNm1HNXdBSWtRUGdXMkp5MkhxellXdmdIZWp6RGJlOTUwUEUzODFt?=
 =?utf-8?B?UU5sc0p3aFVwdzF5VE1TMm1FS2c5ajhDeHpxTUlSVm84VEhtUW9EbW1xVkQw?=
 =?utf-8?B?RnJmY0FaeGJVQzJWUnVGSnlUbVlnc3Jkd2RsR3RsZkJOaXhUZXROSmJVSGZJ?=
 =?utf-8?B?TkFXc2tHaHQ0VnMyZWM5Sk9GeDRyM1VjTlZGTkVIeE9VSUdqVGt1Mi84QkRB?=
 =?utf-8?B?M2JtZmVmaWYyUjBITG5KNUlUL0VDTGtxVmZkclFIbE9Dbzg0NXIzaVRRREFZ?=
 =?utf-8?B?TjV3VU83b3BsdmxjOFE0dzJJMGJMNkVhNVZTUEJJYytpZzVWbzZQRzJZUXkw?=
 =?utf-8?B?UVFJSVBiNndsTjczRXY4dXVORGNWR0l5ZkZlVmR2Z2RBUlQ5NDdrblhlclU3?=
 =?utf-8?B?aExZZnRWRnh2RE9zMSthTGN5WmhuMlhMT0dXWGFSZklkQ0xJSzNmMDdwblB4?=
 =?utf-8?B?dm1zRFhIZU8zQnJLMzJNVVU3Z2RpcnpsOG1pWkJ2UEE0clB5M2ZocWR4dFhI?=
 =?utf-8?B?UWIySXI2anpQckpFcmdGVnZtNnNpdExkN3R2cWxTRzI5UVlvblFLT2orYXpE?=
 =?utf-8?B?Zk8wdzNjaXd4T3VXeEVYZlZwNllxUTdrQTU5Y2xIcWlaWWxYQWlIaVpIbTA5?=
 =?utf-8?B?Q2JSai9SWnFiMEZucXZNUTAvbGFIZUZuNU81RWEvTWJ2KzJYN3pGdWpUcUZP?=
 =?utf-8?B?WXljdWJHaUhkVUlkYlR5S0o0NWtDTW1XZEFFTWN1U3IrTmZzTmVRTDM1eFBZ?=
 =?utf-8?B?bXVnYURkbGsvKzlZY1FBd2EvZS9MejFJMXp4QncvblVINHB2OFl1aGlBL3po?=
 =?utf-8?B?QURvZWxoY0tpRVVDUDQxSG8zeVBXenBhRTJvd290MitvWW5KKzNwaEw1SDJX?=
 =?utf-8?B?cU5PS0hqSjNmUndYNGZLZHN3c3lJbjg4TDliRkcvN0JPUHdBUFB0N2MyQk1Y?=
 =?utf-8?B?TVNSVFVIQUZUVGRZMkFxYUs3a215b3dmb2hnVG5OSXNkMG1YVU9vVlF0dEI0?=
 =?utf-8?B?RWZwY0xjQzFPazZhMlZlRWpWUXlDQTAzYVB0YXUxZCtDUjNReExmVGsvSTI4?=
 =?utf-8?B?T2RFcmtKZFJaUHV1YzBvWEV5L29aU3U2cU9UUVdjcm9sY2RablVoSFczZFF6?=
 =?utf-8?B?ZjB3YTlIWHFydmFCNEVRU0REMUlDMi9ENjdWaGYwcERJR20yV2Z5RDBhenJa?=
 =?utf-8?Q?3g5K7Iz8VgJAiRjy9WDzAS4Os?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f786e20-4a6b-4fea-f5ff-08db299a7b0f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 23:26:07.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzySfxz7ZwvUxAZSgDjFlhE6kbaqzdOmXEwSvemol1UHN5AhqmmccpbPintuwYSBWZ0kwGRU7d5z4V3qXFVQ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
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
> Add a debug operation that allows the debugger to send an exception
> directly to runtime through a payload address.
>
> For memory violations, normal vmfault signals will be applied to
> notify runtime instead after passing in the saved exception data
> when a memory violation was raised to the debugger.
>
> For runtime exceptions, this will unblock the runtime enable
> function which will be explained and implemented in a follow up
> patch.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |  4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  5 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 44 ++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  3 +-
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  7 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 71 ++++++++++++++++++-
>   8 files changed, 135 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
> index 5c8023cba196..62a38cd820fc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
> +++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
> @@ -118,9 +118,9 @@ static void cik_event_interrupt_wq(struct kfd_dev *dev,
>   			return;
>   
>   		if (info.vmid == vmid)
> -			kfd_signal_vm_fault_event(dev, pasid, &info);
> +			kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
>   		else
> -			kfd_signal_vm_fault_event(dev, pasid, NULL);
> +			kfd_signal_vm_fault_event(dev, pasid, NULL, NULL);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 628178126d3b..09fe8576dc8c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2738,6 +2738,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		r = kfd_dbg_trap_disable(target);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
> +		r = kfd_dbg_send_exception_to_runtime(target,
> +				args->send_runtime_event.gpu_id,
> +				args->send_runtime_event.queue_id,
> +				args->send_runtime_event.exception_mask);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index fcd064b13f6a..4174b479ea6f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -125,6 +125,49 @@ bool kfd_dbg_ev_raise(uint64_t event_mask,
>   	return is_subscribed;
>   }
>   
> +int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
> +					unsigned int dev_id,
> +					unsigned int queue_id,
> +					uint64_t error_reason)
> +{
> +	if (error_reason & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
> +		struct kfd_process_device *pdd = NULL;
> +		struct kfd_hsa_memory_exception_data *data;
> +		int i;
> +
> +		for (i = 0; i < p->n_pdds; i++) {
> +			if (p->pdds[i]->dev->id == dev_id) {
> +				pdd = p->pdds[i];
> +				break;
> +			}
> +		}
> +
> +		if (!pdd)
> +			return -ENODEV;
> +
> +		data = (struct kfd_hsa_memory_exception_data *)
> +						pdd->vm_fault_exc_data;
> +
> +		kfd_dqm_evict_pasid(pdd->dev->dqm, p->pasid);
> +		kfd_signal_vm_fault_event(pdd->dev, p->pasid, NULL, data);
> +		error_reason &= ~KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION);
> +	}
> +
> +	if (error_reason & (KFD_EC_MASK(EC_PROCESS_RUNTIME))) {
> +		/*
> +		 * block should only happen after the debugger receives runtime
> +		 * enable notice.
> +		 */
> +		up(&p->runtime_enable_sema);
> +		error_reason &= ~KFD_EC_MASK(EC_PROCESS_RUNTIME);
> +	}
> +
> +	if (error_reason)
> +		return kfd_send_exception_to_runtime(p, queue_id, error_reason);
> +
> +	return 0;
> +}
> +
>   static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
>   {
>   	struct mqd_update_info minfo = {0};
> @@ -175,6 +218,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
>   	}
>   
>   	return r;
> +}

Ah, here you're fixing up the mistake from the last patch. Hint: An easy 
way to compile-test every patch in a large patch series is with 
something like this:

     git rebase -i HEAD~32 --exec build_kernel.sh

Regards,
   Felix


>   
>   static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 2d5bc102f6b4..fefb9dc5cf69 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -38,6 +38,11 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
>   			uint32_t *runtime_info_size);
>   
> +int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
> +					unsigned int dev_id,
> +					unsigned int queue_id,
> +					uint64_t error_reason);
> +
>   static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
>   {
>   	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index 729d26d648af..0efd447762d6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -1225,7 +1225,8 @@ void kfd_signal_hw_exception_event(u32 pasid)
>   }
>   
>   void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
> -				struct kfd_vm_fault_info *info)
> +				struct kfd_vm_fault_info *info,
> +				struct kfd_hsa_memory_exception_data *data)
>   {
>   	struct kfd_event *ev;
>   	uint32_t id;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> index 0b75a37b689b..e092563f22de 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> @@ -362,7 +362,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
>   
>   		kfd_smi_event_update_vmfault(dev, pasid);
>   		kfd_dqm_evict_pasid(dev->dqm, pasid);
> -		kfd_signal_vm_fault_event(dev, pasid, &info);
> +		kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index e503bd94dda6..4cb433a21e3d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -945,6 +945,7 @@ struct kfd_process {
>   	bool queues_paused;
>   
>   	/* Tracks runtime enable status */
> +	struct semaphore runtime_enable_sema;
>   	struct kfd_runtime_info runtime_info;
>   
>   };
> @@ -1394,7 +1395,8 @@ int kfd_get_num_events(struct kfd_process *p);
>   int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
>   
>   void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
> -				struct kfd_vm_fault_info *info);
> +				struct kfd_vm_fault_info *info,
> +				struct kfd_hsa_memory_exception_data *data);
>   
>   void kfd_signal_reset_event(struct kfd_dev *dev);
>   
> @@ -1410,6 +1412,9 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
>   	       KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
>   }
>   
> +int kfd_send_exception_to_runtime(struct kfd_process *p,
> +				unsigned int queue_id,
> +				uint64_t error_reason);
>   bool kfd_is_locked(void);
>   
>   /* Compute profile */
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 0ef2d00af8b1..8519604f7249 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1403,6 +1403,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
>   	process->debugger_process = NULL;
>   	process->exception_enable_mask = 0;
>   	atomic_set(&process->debugged_process_count, 0);
> +	sema_init(&process->runtime_enable_sema, 0);
>   
>   	process->pasid = kfd_pasid_alloc();
>   	if (process->pasid == 0) {
> @@ -2058,6 +2059,75 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
>   	}
>   }
>   
> +struct send_exception_work_handler_workarea {
> +	struct work_struct work;
> +	struct kfd_process *p;
> +	unsigned int queue_id;
> +	uint64_t error_reason;
> +};
> +
> +static void send_exception_work_handler(struct work_struct *work)
> +{
> +	struct send_exception_work_handler_workarea *workarea;
> +	struct kfd_process *p;
> +	struct queue *q;
> +	struct mm_struct *mm;
> +	struct kfd_context_save_area_header __user *csa_header;
> +	uint64_t __user *err_payload_ptr;
> +	uint64_t cur_err;
> +	uint32_t ev_id;
> +
> +	workarea = container_of(work,
> +				struct send_exception_work_handler_workarea,
> +				work);
> +	p = workarea->p;
> +
> +	mm = get_task_mm(p->lead_thread);
> +
> +	if (!mm)
> +		return;
> +
> +	kthread_use_mm(mm);
> +
> +	q = pqm_get_user_queue(&p->pqm, workarea->queue_id);
> +
> +	if (!q)
> +		goto out;
> +
> +	csa_header = (void __user *)q->properties.ctx_save_restore_area_address;
> +
> +	get_user(err_payload_ptr, (uint64_t __user **)&csa_header->err_payload_addr);
> +	get_user(cur_err, err_payload_ptr);
> +	cur_err |= workarea->error_reason;
> +	put_user(cur_err, err_payload_ptr);
> +	get_user(ev_id, &csa_header->err_event_id);
> +
> +	kfd_set_event(p, ev_id);
> +
> +out:
> +	kthread_unuse_mm(mm);
> +	mmput(mm);
> +}
> +
> +int kfd_send_exception_to_runtime(struct kfd_process *p,
> +			unsigned int queue_id,
> +			uint64_t error_reason)
> +{
> +	struct send_exception_work_handler_workarea worker;
> +
> +	INIT_WORK_ONSTACK(&worker.work, send_exception_work_handler);
> +
> +	worker.p = p;
> +	worker.queue_id = queue_id;
> +	worker.error_reason = error_reason;
> +
> +	schedule_work(&worker.work);
> +	flush_work(&worker.work);
> +	destroy_work_on_stack(&worker.work);
> +
> +	return 0;
> +}
> +
>   struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *p, uint32_t gpu_id)
>   {
>   	int i;
> @@ -2117,4 +2187,3 @@ int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
>   }
>   
>   #endif
> -
