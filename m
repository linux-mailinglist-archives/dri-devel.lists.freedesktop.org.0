Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4306C2230
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E8010E314;
	Mon, 20 Mar 2023 20:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA4810E314;
 Mon, 20 Mar 2023 20:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boh7cXVj3LRG1jC6ljdz5z4XSsULFwUNTQzUGBqZ5fPLbxeo/aOY9GzaIUBxmvujVTRMMKI8zDet2fBRJFuuuwdxTBOGE3mqIXw42tYOGdbZYZNSNTdJTUy7zEY/k7u+hPhjv338gJqVVzUxjbKePY0YgcP6zjVVconJeslLKmCyfYqVf5x7phVqxQrVuTBogEBYW1QSkk1o7IxzDgBYwlH4MPgis/pASOHXux5g7BRsJprJCGkUSG35WViKA+QegPrs2aX0Zg3Beu/MRrttnEyRpOMMMQAnt6/L2TMY78tJrt6Sxz9QI+w7eQpN1FA1tx30+OiBwq2Dy1XITb7qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPe9IrsQiNehT4aV3xpie3Dp3f7FQlsgkyeH3XbjZQg=;
 b=BVNEjVhDWE/QNC4RIQr9+Cmu/Ec+yPHVEVpGmRBsuNVqkmIEJ0CcnwUjliWqqT5F2BKj5h+H4gWexT2v1P7hITF+ewIRGQh808vFfPbH3v2SjWiOf0PgpB3sSrDrCIObfpYHWSqLXTsZ0+2bK9TwK1MIqWeLjFROAU6BtZMG/TcGVlK27cfKlGBunMOh5e7UCSVWscgrdF0wdBzru05r3rPfT5USuSJqTLsllkPKUzpMRxS831NXLAc8/ZmphcqyKEFs2JWFe86Z5Fdm0nZDKT4DMDSLxnaZ76ZWHeCJoOkeABSq5MfjH8Ile7zBBbrbfTGqACPSh16bMlfe0gDqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPe9IrsQiNehT4aV3xpie3Dp3f7FQlsgkyeH3XbjZQg=;
 b=UyzEUIF/PjnMJFhq1DCnklde9dwILLkcrZk/JncFcfaYaBr23OdWzPAYanFXvRAyDjaL8JKIbX1rtzlfXUtAbOvFgp3YhSaxcXJ9OxbJrggTje3r+WwKlWusoss+EY1JlbiVM9BgxetDb73rtoPTytIMMlvCQS59qLdsf7HV8S8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 20:06:18 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:06:14 +0000
Message-ID: <93fabe02-5700-684c-f94e-81d3e3ec6048@amd.com>
Date: Mon, 20 Mar 2023 16:06:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 12/32] drm/amdkfd: prepare map process for single process
 debug devices
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-13-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-13-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b479b9-cb49-4cd4-9f73-08db297e8ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3MSvtcG05ahHJ+q+YtwuakhKDoeuzjvEA2GPUwcDI6t0b7hJda6RRclOz0bwfuEBKP1LY8ANKjP0ndDmb5u19UbzolYxTH3OlhpqlMmjz8HIWQu64SdAW7TusxwpxCqPyPZqgonPBd37bfoxpQ110jpQrt5fMwMNZ41q5i5ukaIyqaSz5Usv9OZ2uZ9rBDujO/HizySCF+TVsMf36Z1lTb9eJ9BpUx6I21XE40XP5abUGy2PU7MLfS4MKn7+CKv34nZwQUB2DsSqluxbbhoIdP+P37edSvUk3lNhZOKQFR0ol8DojTeWmAHuvgXZwoM2tGTF4Kcgx4yHJovuHplB54/P0H0LNVCUowNVRv9z+/LZjT0VDMwQ4rnlP+giIdXbIqVRVWvL/9xJ3IQ3tVpk9TZgXCZmVqljkkR92cP+8WRHLieoPc7N2FbrakOHKBAoJy2QXJyUFmUrauVlkdIYkmojVBCJatUEqiC118hNb6AtOSegLu8uiz0BVJwzdIlppTToXRe6bF2sDtKRtan8xdif0F9gLDhKRuL+qnoJpGniqbq+AzHXPIBe8U61uc3kFoU9gKwzcknBXTiwHDcqcTPW1rI30zaO9VW5bxYNvcH70Vc78tgsK/xTH4bzfHMLWZrGBTyRTXT904ndfIC+lANWgdPKpogb83wWxcc0HKN25Mfuj5xhnXE0VBVrEo4pdtZSjGiYc42DVEdkzadRNVPnknkuGYTkFzkl7F6Mz44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(66946007)(6486002)(66556008)(66476007)(8676002)(450100002)(5660300002)(6512007)(316002)(2616005)(41300700001)(8936002)(44832011)(26005)(6506007)(53546011)(83380400001)(186003)(478600001)(36916002)(86362001)(31696002)(36756003)(38100700002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JXQjVnUHBsbUJINUZnZndEQTJ2Qi82dmhJekFpbTlxWWNFRHlBZ2IrNVht?=
 =?utf-8?B?eUg3UWVhWGZubjU0QUN0bkpSQS9uUHZjazVqbG8za09ueEtHNzNYYkoxWjJP?=
 =?utf-8?B?M2phenhWUzFvcllUTWtrYnVJbmtiNHhCTWI4dkpWRWhrOWt2Tnd4ZGVJOUlp?=
 =?utf-8?B?NHVkUjd2cnZSQTB1M1dHYVNCYVNkT2JXdHUrYUd5UzlxdTJzYy9JZnl2aXFx?=
 =?utf-8?B?anIyaGpKUHRnak5oeFZZRzdNM0owOE9RblNJbngvL3ZqTm1GbjA5endXQ1ox?=
 =?utf-8?B?WUJ0M3lXRUhQSUxUcGo5NkFBUjRGNjZZbzBidW1zVlhUWmxzNUl4aDIyaGlw?=
 =?utf-8?B?YXJWay9iNEd2c0hROWRzS3pmQnpYaHByQVloVm9JUlc5bjgwQWlBdmdFQzRM?=
 =?utf-8?B?RTl3M0Zlc2hsTHFicER5eFVCWlNRT0hXaU4zNEx4Ym1QU2h1cGttTHZyQWNP?=
 =?utf-8?B?anIvNCtNeDBjUXFkSVJ5OHg5UlkrQjVub0tsMWpXZ3BpVmpVeTNZQVJCM3V4?=
 =?utf-8?B?MlZvcUpyR0FrMmxCamJBS0xuTXdxUXVVUnNFN25KZ2tnZVo3eU1LUmk4UFFs?=
 =?utf-8?B?Qy9tU3RvLzJDTEVjb2UyRURySVJSZDZySStTMVhXbTJSWkxXclNlU25CTW05?=
 =?utf-8?B?M1J2cStiS1NhbjdtL0V1Y3FUM1I5Ni9iYVd5OVRCSlFtdkwxS1pFdHJVdEFW?=
 =?utf-8?B?WXovbWhqT2NJMHcxaWJrTm0zVFNYVkJIaHlFTytYYmxKTERCZGpwNGswdkdL?=
 =?utf-8?B?Ri8wUDNHWmNmYVhYaisvNmlQdzZuUzNOOEU1VVF2NDIrMWJDSVNHNUZyVHo2?=
 =?utf-8?B?ZURmM0h2RWUvbk4zdDJpcCtnWDBhbEd3RXhLSW5kU1IvNzEvTGxrZGdVTFk1?=
 =?utf-8?B?Qnl2S21sOW1GYUM1TUJHSWxwMHREUlNCRVJmRFpGZ2J4R2pKTnhielhjallC?=
 =?utf-8?B?Mk1iYzNXOXB1eHVKN3YvbnJKeE14akdnZG1RMUhUVTY3cERyTU1pay9qSEVW?=
 =?utf-8?B?STVNN2R1elBHRkw0OVg2NXVBSXdIQTlPZ0FncHh2WGJXZzBCelNBbUJOV0oy?=
 =?utf-8?B?UlJuRWZ4blRad1BzZ1NIazdFZGc5d3ZJQ1JEcDEvL2hwYVFJRnlMNk5NTjBq?=
 =?utf-8?B?OUQzRkk0RzVQNGNVVlVDbzVoa1lBaXYrRS9EQndrNUxSb3JEOW4wR3FNZkZo?=
 =?utf-8?B?YTBYR1RrLy9iUEJJV0hRbE9LYW1UVTJEU1d3OHBpeUh5djdNMmR4cnFnV0VB?=
 =?utf-8?B?OGdjajFEczVyOVVBTHBrMm1QN2Y4VUw5dGJDMGtzM09kbjdiNzYrd1RNc0xh?=
 =?utf-8?B?MHBoTVJtUGNPSkRCMXlJcVh2VGplTHFjNk9iZWNqL3BObi9MS0lLY2RwcHdV?=
 =?utf-8?B?alhCYWhJNE1LZXZ5ckRPOXNnQjJESFhtMVZjRVBHN3NKaFp6OVpseHpPK0c0?=
 =?utf-8?B?SDVORzJMckE1bTlWdC92UHpvSnFSWXkwLzRIZFJIYkp4d0RQNDZQOVVEWVow?=
 =?utf-8?B?WWlYdEVlT0Ewb1pnUEhEMTVuRFFYOWZWWWtTNHk0VktoMGMrRHp5VmNrbE8x?=
 =?utf-8?B?cElVd2xvankvMmZ0Uy9qWXhuc09jd1dHR24rdnZDeGVvRlgwRnNJYmphMjNt?=
 =?utf-8?B?ZjFnMWpkMXBITURxNkhlK1kwVFlhd3RZUlF0ekdSRXAxUzBIQlM4dHNXdndF?=
 =?utf-8?B?SVorRzRUdE90dGsvbTFSOWsrbWVzTlVRMUNQcVVNSU9pb1JReFVSVXAxKzhR?=
 =?utf-8?B?N0huYmh3OGcvRW8rNzRRMFFjNk41eDZwakhRYVl5SVdwZDhrM3pkTjFqYzZZ?=
 =?utf-8?B?UzFZcnBkYkFBdXdobmpLZU1iWDV1NTkrQ1JScTFvVitUV2JIMXBkbG14Wkcz?=
 =?utf-8?B?cEtWZVJsaHZDMTJJcTNtNyszWFhQQUtlVEVzY2Fmbkg4eU91WmZNNW5pdXNQ?=
 =?utf-8?B?WjZiRVlKdFZ1dUw3MFVmU3IvazFrWEcreGtpU1pIQitGR3krcUtWVUoxZDMr?=
 =?utf-8?B?UFg4emttNW1rWHBYS1ZwTXJMeDQxdm00Tjk5YnAyUXN2bUZ2WUIvWUUxam1E?=
 =?utf-8?B?RElkNkU4bytidnhmbW1vNzlzRWNEb1VmVitkZmxQRkM3aTVyZ1Z0Z0pVL2gz?=
 =?utf-8?Q?7WI/2vCzsBQNFpl8R4FOIzlcw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b479b9-cb49-4cd4-9f73-08db297e8ec1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:06:14.2447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLe0ZpF+ya2S+9RTsDXGKU3Iw7WDulEWJc+xUuR2QqbdZsTUuDCrMDI+u5LjuzKjafC8MX6+NBg1cauR8rJchg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
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
> Older HW only supports debugging on a single process because the
> SPI debug mode setting registers are device global.
>
> The HWS has supplied a single pinned VMID (0xf) for MAP_PROCESS
> for debug purposes. To pin the VMID, the KFD will remove the VMID from
> the HWS dynamic VMID allocation via SET_RESOUCES so that a debugged
> process will never migrate away from its pinned VMID.
>
> The KFD is responsible for reserving and releasing this pinned VMID
> accordingly whenever the debugger attaches and detaches respectively.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 101 +++++++++++++++++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |   5 +
>   .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |   9 ++
>   .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   |   5 +-
>   4 files changed, 114 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 7556f80d41e4..0cd3a5e9ff25 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -1490,7 +1490,7 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
>   	dqm->active_cp_queue_count = 0;
>   	dqm->gws_queue_count = 0;
>   	dqm->active_runlist = false;
> -	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
> +	dqm->trap_debug_vmid = 0;

Are you removing the INIT_WORK on purpose here? Looks like a mistake 
that would break GPU recovery.


>   
>   	init_sdma_bitmaps(dqm);
>   
> @@ -1933,8 +1933,7 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   		if (!dqm->dev->shared_resources.enable_mes) {
>   			decrement_queue_count(dqm, qpd, q);
>   			retval = execute_queues_cpsch(dqm,
> -						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> -						      USE_DEFAULT_GRACE_PERIOD);
> +						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);

Unnecessary formatting change.


>   			if (retval == -ETIME)
>   				qpd->reset_wavefronts = true;
>   		} else {
> @@ -2463,6 +2462,98 @@ static void kfd_process_hw_exception(struct work_struct *work)
>   	amdgpu_amdkfd_gpu_reset(dqm->dev->adev);
>   }
>   
> +int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
> +				struct qcm_process_device *qpd)
> +{
> +	int r;
> +	int updated_vmid_mask;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	dqm_lock(dqm);
> +
> +	if (dqm->trap_debug_vmid != 0) {
> +		pr_err("Trap debug id already reserved\n");
> +		r = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD, false);
> +	if (r)
> +		goto out_unlock;
> +
> +	updated_vmid_mask = dqm->dev->shared_resources.compute_vmid_bitmap;
> +	updated_vmid_mask &= ~(1 << dqm->dev->vm_info.last_vmid_kfd);
> +
> +	dqm->dev->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
> +	dqm->trap_debug_vmid = dqm->dev->vm_info.last_vmid_kfd;
> +	r = set_sched_resources(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	r = map_queues_cpsch(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	pr_debug("Reserved VMID for trap debug: %i\n", dqm->trap_debug_vmid);
> +
> +out_unlock:
> +	dqm_unlock(dqm);
> +	return r;
> +}
> +
> +/*
> + * Releases vmid for the trap debugger
> + */
> +int release_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd)
> +{
> +	int r;
> +	int updated_vmid_mask;
> +	uint32_t trap_debug_vmid;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	dqm_lock(dqm);
> +	trap_debug_vmid = dqm->trap_debug_vmid;
> +	if (dqm->trap_debug_vmid == 0) {
> +		pr_err("Trap debug id is not reserved\n");
> +		r = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD, false);
> +	if (r)
> +		goto out_unlock;
> +
> +	updated_vmid_mask = dqm->dev->shared_resources.compute_vmid_bitmap;
> +	updated_vmid_mask |= (1 << dqm->dev->vm_info.last_vmid_kfd);
> +
> +	dqm->dev->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
> +	dqm->trap_debug_vmid = 0;
> +	r = set_sched_resources(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	r = map_queues_cpsch(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	pr_debug("Released VMID for trap debug: %i\n", trap_debug_vmid);
> +
> +out_unlock:
> +	dqm_unlock(dqm);
> +	return r;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static void seq_reg_dump(struct seq_file *m,
> @@ -2563,8 +2654,8 @@ int dqm_debugfs_hang_hws(struct device_queue_manager *dqm)
>   		return r;
>   	}
>   	dqm->active_runlist = true;
> -	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
> -				0, USE_DEFAULT_GRACE_PERIOD);
> +	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD);

Unnecessary formatting change.

Regards,
   Felix


>   	dqm_unlock(dqm);
>   
>   	return r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index fb48b124161f..0cb1504d24cf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -250,6 +250,7 @@ struct device_queue_manager {
>   	struct kfd_mem_obj	*fence_mem;
>   	bool			active_runlist;
>   	int			sched_policy;
> +	uint32_t		trap_debug_vmid;
>   
>   	/* hw exception  */
>   	bool			is_hws_hang;
> @@ -281,6 +282,10 @@ unsigned int get_queues_per_pipe(struct device_queue_manager *dqm);
>   unsigned int get_pipes_per_mec(struct device_queue_manager *dqm);
>   unsigned int get_num_sdma_queues(struct device_queue_manager *dqm);
>   unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm);
> +int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd);
> +int release_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd);
>   
>   static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index f0cdc8695b8c..363cf8e005cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -34,6 +34,9 @@ static int pm_map_process_v9(struct packet_manager *pm,
>   {
>   	struct pm4_mes_map_process *packet;
>   	uint64_t vm_page_table_base_addr = qpd->page_table_base;
> +	struct kfd_dev *kfd = pm->dqm->dev;
> +	struct kfd_process_device *pdd =
> +			container_of(qpd, struct kfd_process_device, qpd);
>   
>   	packet = (struct pm4_mes_map_process *)buffer;
>   	memset(buffer, 0, sizeof(struct pm4_mes_map_process));
> @@ -49,6 +52,12 @@ static int pm_map_process_v9(struct packet_manager *pm,
>   	packet->bitfields14.sdma_enable = 1;
>   	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
>   
> +	if (kfd->dqm->trap_debug_vmid && pdd->process->debug_trap_enabled &&
> +			pdd->process->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED) {
> +		packet->bitfields2.debug_vmid = kfd->dqm->trap_debug_vmid;
> +		packet->bitfields2.new_debug = 1;
> +	}
> +
>   	packet->sh_mem_config = qpd->sh_mem_config;
>   	packet->sh_mem_bases = qpd->sh_mem_bases;
>   	if (qpd->tba_addr) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> index 795001c947e1..bb6edbc27de7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> @@ -146,7 +146,10 @@ struct pm4_mes_map_process {
>   	union {
>   		struct {
>   			uint32_t pasid:16;
> -			uint32_t reserved1:8;
> +			uint32_t reserved1:2;
> +			uint32_t debug_vmid:4;
> +			uint32_t new_debug:1;
> +			uint32_t reserved2:1;
>   			uint32_t diq_enable:1;
>   			uint32_t process_quantum:7;
>   		} bitfields2;
