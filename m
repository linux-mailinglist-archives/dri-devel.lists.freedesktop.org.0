Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E66C58F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145110E402;
	Wed, 22 Mar 2023 21:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9F10E3EE;
 Wed, 22 Mar 2023 21:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ0QvWSEP7b5Yw7ZCyJv2ijof8uPZHXQVy1ttAlcR/kJTu13DuIzD8+tqGi+FhUd4oKEJszVdi7vgksvXLinzlpNBOpZOnzgnRzrg2RAaUBF+S0k2T9qUL+fkj0LvX0FfF0yEX3eGlw7oUxB0s7Ye69YX8HgNk1piW9Wai5KYuShxVqaw0fPidUXWH+t7G35xw5C0bDgdkqWxfjDCzccEbC8lw8ijHZC99YAB6Ahv30ud9plzMVZicrHCta8dvUJWbHR8BOuQCuGRvf4GMpskCr4Zl61BEQU2+oG8w6be1ZryAaOmFvUTz6KKTcITiCOWP5ZV/z4MiTL9KJp0JNyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85Mwz0IPClx4YXTN71AmxGyvf6T6GaswBuWtmGC+HJ8=;
 b=FsoBgjg+cxTE/CBlKPBnU4TQ4qlbEnr9K/59JirJJInAGCpzgQO99BMW6t4lRA5OJWZcxePQZw5ZvjonnFrU3ndsyzJrGu8X9ASphB7n83m/oUVGWUGLCY+4AYA67ZNdVnFBVjyj8WUuQ67ujfpO2FbtnIMNbschMQk0+ymVS5HA9DD6lVhx6+jDbWHV+iNrrug131SW+9TEQHkSfBuikzsoCqQDJUj1y58m5VXmCzhoTdIvRwQFIimsfYga13e367k0jqvJUDFFAB8I2OqMJ2cDYAnVHL9/VEyA1MpbYbABPj7kaZtW/LUMmXbn9M5yOyTqWR1aIHjzvm8d6/+kIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85Mwz0IPClx4YXTN71AmxGyvf6T6GaswBuWtmGC+HJ8=;
 b=AHxmqDsvnYtOTqlf0iwiyQzXOoUzSfLVrSicEFxuw4uS+a/+oL1y9PclWKtFlzenZBvbQESh8DuovDEkjro0+wREVlkUB82U3en4xSEekExw1lbZhsxkvzpn1A/O5H9+4fjeS9NwhuFmLsXi4Zf7mEEQ8k61srGCVgAOyKPxtrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:47:39 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:47:39 +0000
Message-ID: <9d75cfa7-47a7-320d-a209-2eac1d0b99c4@amd.com>
Date: Wed, 22 Mar 2023 17:47:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 27/32] drm/amdkfd: add debug set flags operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-28-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-28-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0025.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::38) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 50223beb-1c4c-4668-8a36-08db2b1f0e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnsomki9Q6gT4KUEsdo3mdkCnvrYzyje2huC2cvhT0jCEFcPviW5TGltR89z9fQ+TgoCE1EYiDvb6i/rrSxfHGyEMFX8BAOy9M12PjA2SsHQ9L4DWOM9MMAJa60tEGPXZTePv3jVjqfC5g5yorEzPPIdSkiIf3DTjDjG24az2hTlqwhhHfn6og/PpWgFYrVX5J7lvmBErdp4+sdEJN/aj6sAW8HfBp2nMpRmjGaz+FW6X3jWYnsld4wSqr7IkL9B5rAoykxdaTa5jxWmkLf1Mao2C1KeTdprC22Z5D90GXhebsoDlSZ2nsBajg6yOaiEhI/1o2t5zdku36/T2atFIuxvS8XbEVSwbnnbBBUVferr8b280g28rhZYjvFizt9Mcxv6Fvc/Isu0YI4gf7phvZ+MVb/KrXKX9xeySav62WmijwGgNin8ew5OWLN6S8zRn6H9/L3kDhPvaqAD/A5i+rgwV7oK8S1yvGCPcEMehIkcbf3Zmtaig7tmEFkJjPCDuJ1FqhFTruKVcmFJf520XxgpbUbutdxi08IZ+jIDZs6ryvxIYDjgd82E+NVareZTAiSYG4V0Ub/iaQdQq39ZVKI1bEnSII6WqWOA9Vot4ZX3ZehPkZHLXyGSzH849HQ7U3m90Ka05v5u9m64jxBeBdh0WOzOX83UUWcNC7wgobkOiG10Kzajn2RUtOYxc3fCxuVSUHYVPQMrc/dViVg8aBl/9dtQ1iCk13Jv/OyOFZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(2616005)(31686004)(6506007)(26005)(6666004)(6486002)(83380400001)(8676002)(316002)(66476007)(450100002)(186003)(66946007)(6512007)(5660300002)(44832011)(478600001)(2906002)(41300700001)(8936002)(38100700002)(66556008)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNwQTY4WTl0SzVocFkwUGttQkxPWllrNzhkelZ1TzcxZzhpZ2kvRG1TTGl2?=
 =?utf-8?B?S09vcGFEdFJTTmhoempsajFFMUptSkw2ZHg0RkI1NjlSSHFBZmcwa0JpQWFJ?=
 =?utf-8?B?T09BU0pZTGhpamhvWEhyTGcyN2pUUUdMLzR1QmNGWE16bDNXTFlxSmlSWlp2?=
 =?utf-8?B?WDBKOU9qaW05SUljQXBlbTdleU0xQmhVTGRybXNrTVBUb0pvYkRYZndjZFlq?=
 =?utf-8?B?aDZ3QjZTL2hWRUlpeDVRMUZ6d3EzMnBFL1laZmwxM0pBNDZ2N2VqWS93SEJR?=
 =?utf-8?B?NGlqSVNuU0I3YVRnV0NlMTRxZjQyc3gxcUFOK05UVkh6anVDNVRqVVhpT0JQ?=
 =?utf-8?B?ZGI3S3BXUURNSmpRUTFzTjBtMkVlQW9rZjc1ZzY4YkhsSDYyTDBOVjlXdndT?=
 =?utf-8?B?dlhVOFY3NjFZOGVvTWwrUmUreU1XS2J6NVZDQ055MW5jODhGVlg5ZVZseXdY?=
 =?utf-8?B?di9YN29BZXpqaHN1RGtUWU9sK0lWSndKTGhmUFB1NDJuUmIvdHVETkFNUXFl?=
 =?utf-8?B?aGxySGFCMFRIbjMxanNSTjRqbnBlVUVGc0p1Rlg0UkdYN01hNjE1cCs1QU43?=
 =?utf-8?B?c3VLV3JhbUphOUdhU0paRTRMQlJFeEhnYmlvZWZZdlNRa0JOTkwzeU01b3NV?=
 =?utf-8?B?L0FpM2xuMll6WDFjZzJwbkpHemtDTkNZVTZlVzFLZXAvb1RXNGRSTC9vUG93?=
 =?utf-8?B?end0Y254OFB0eDlQQmdySHZIRzRNQ01HajhPQ1ZOR1RHUm1wd21GZFdSbk9u?=
 =?utf-8?B?L3M1d3hHaGpnaHNubTBrakd6VUVNVVFsdS9BZDJuUlVSYUpTVUJQS09jT1dD?=
 =?utf-8?B?a0ZaRGh4S3dRTDBCQjg3ZU5XNFRnbVRHQUFlakNGZnZqN3d5ZEwrcldhYnAx?=
 =?utf-8?B?NXJCM0EzNHkyMERXM0Z5c0ZlTnRuVy9ZY3ViSDh0MFdyeEFsMkd2Ukh6bC9M?=
 =?utf-8?B?SUlFMm9GUGY1aG04d3JnZnlzclNEUU9HYUhmUFNNd1VpOXgwallMWFhkRWwz?=
 =?utf-8?B?cWIwMnRaMXlmV1Jmb0JDYlhEbFBmWjkxNU9kVWpLNlROUkhDWlhXYk94UGl6?=
 =?utf-8?B?VlRFYldXNlpCL0xORVI3NkgzWWpCcHRKczVTcFFkdHhSMHFmM3Jwb3BWeG1M?=
 =?utf-8?B?aWRlUVpxR1NBSi9PdituYzQ4RkxySmtKRnIvSXBBQTBxZXpHRktzOGEwL1hW?=
 =?utf-8?B?L2ZqdjRNNWtpajdoQkFGQnN2czNKVWNvcVlQSHhnL3d5b2RyVitKc3RQN0Zx?=
 =?utf-8?B?d1BlV3pnTzRmbGJ4QVB2S0VsZ2VQSWdud0cyTFY5VEJDTmxLT2tNZFlqOVg2?=
 =?utf-8?B?SVpBRlVHRkhnS3cxQ0lpdGpsMER1N09VZ1BuSTVkS0lTeG5Nd01FK0JxUm9O?=
 =?utf-8?B?Ynk1VG1BTkNKU0lXQm1aa2JnSmhjS1JvQlNRRThST2h2Mi9zdklmK0ZiZDF2?=
 =?utf-8?B?WGNmdHp4Z2owdDhtY3BDYzRFdHEwT0VCWjFhd1RXVlhTS0VuWHR6ajFmcTl0?=
 =?utf-8?B?L2dWMXlpakpHeFdoVzNydkhUZnhtRkNwUFJkalZSS3pSK2V4OHBKb2piamF1?=
 =?utf-8?B?RWJYeXBvT1VTMTVFMGQ2b2x1U0VMb2JKRkt0K21ocUNSdXQ1UTVMaGNVRy9m?=
 =?utf-8?B?YVQ2S1hJendCdExTZGZCaFg2bHhFeUdKQ2NpaVVVV0kvSStacGtDWTZpZ2hh?=
 =?utf-8?B?ckg1TUZBR0ZuUUxKbEFXN1VLM1NQWnZvSXNncVZWQy9LaEZQYlcxeWd5cDc5?=
 =?utf-8?B?ZUVVMkh1c01jNlF2K2NlZ3MwZnRjR1VEaHlIaUIrUnYyY2tMZlVkMEQ3d1dm?=
 =?utf-8?B?dWpzaWhlODVuQ2JvdjEwdXFxNFZDOVU1L2E2WEtKZ2F0SC8wVWltSXdMdDhq?=
 =?utf-8?B?d3RkbDA4UHdtdDVGbTgwMVdvZmRCdnNZU052OEVjTjJJcnZ2NDZSVjhFbUFt?=
 =?utf-8?B?RjV6OVlsRFZIdU1uMytVbnlHNjByMHFleTB0WlNQeHFhQUVHQlN5K0EveXUy?=
 =?utf-8?B?RU93dTF2dmY3U0RxMXF1UGRCQ1NzaGs2VFdSa1lQaFVhZEk2ZExuSWRZMkQw?=
 =?utf-8?B?ZmpyaVRlM3g3ZkVDU2pRbitSc09SOU5RU0MrZ3VBTi8wMkUyTHREL0pmVkkz?=
 =?utf-8?Q?s4iZP522InazMHIEJrbrx4jsi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50223beb-1c4c-4668-8a36-08db2b1f0e62
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:47:39.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyISfl55GJIXWJRBMzmqsdvdbT3vc1zEMUgU/+dlDzYejupxXKO1njy9D5Ba8n13s+F8agakh83mZQjKogAB1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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


Am 2023-01-25 um 14:53 schrieb Jonathan Kim:
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
> v3: make precise mem op the only available flag for now.
>
> v2: add gfx11 support.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 38 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  1 +
>   3 files changed, 41 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 8f2ede781863..c34caa14b84e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2947,6 +2947,8 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				args->clear_node_address_watch.id);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_FLAGS:
> +		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
> +		break;
>   	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
>   	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
>   	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 8d2e1adb442d..77ba7da2bb9d 100644
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
> @@ -425,6 +426,40 @@ static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
>   			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
>   }
>   
> +int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags)
> +{
> +	uint32_t prev_flags = target->dbg_flags;
> +	int i, r = 0;
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
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r) {
> +			target->dbg_flags = prev_flags;
> +			break;

Do we need to roll back changes on the other GPUs when this happens?


> +		}
> +	}
> +
> +	return r;
> +}
>   
>   /* kfd_dbg_trap_deactivate:
>    *	target: target process
> @@ -439,9 +474,12 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   	int i, count = 0;
>   
>   	if (!unwind) {
> +		uint32_t flags = 0;

checkpatch.pl will complain without an empty line after the variable 
declaration.

Regards,
   Felix


>   		cancel_work_sync(&target->debug_event_workarea);
>   		kfd_dbg_clear_process_address_watch(target);
>   		kfd_dbg_trap_set_wave_launch_mode(target, 0);
> +
> +		kfd_dbg_trap_set_flags(target, &flags);
>   	}
>   
>   	for (i = 0; i < target->n_pdds; i++) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 63c716ce5ab9..782362d82890 100644
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
