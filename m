Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8C6C2587
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AF289135;
	Mon, 20 Mar 2023 23:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4065489135;
 Mon, 20 Mar 2023 23:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg75qMtMfFKS728PqWeXMtR8OLxGmDb/RlSiESLDz018CW1Fgd7KDSX7YGP5cwxIVaPFM4ojabSVz3RwbanTIDYxrRkd1j47R405ue/JQpilVgovMhi2fJtSHBK/lHqzXiNtAkRYqoVVyQRZT+gCTK45E0ihp28LtErHZPmopn6REtTcTRUYgj2CrtV+rK7CfOW4RPEdIPf5qj2mBLPQDCxd9y/16J2SRNqFGQbSmn633UmHfUsEXf/48FSmwyjPdnj4EQBFaRyAWXknwt83GZCIm5KgWKaYHybELrCeIBo9zRUK8VdCB5S8Dsit9ucGStzm2dUmXj1SIw7+kt1X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKYCtG25FpnPsW+Hi2MjcXUXf+643WER5nOwZdZ5t/o=;
 b=oae64tOb2QsLAYG1kymsWtmmRge/2LGa5T+Q8lTJnb+kDs6MzDJTDsX05mTJzmkPNioJNCcg5/33vHlO25jbQgucDTWhBCkEmBbOCN+cG0517tSqNP8rpkKHfAXn8QEwVWP5Pw3P+jB9VV0xhWn1jAFwyoeK7F/mz07UKHVk7mJVKJQXXm7BDREoDtFLZ2OIkDIrc4Zx49oSO2DS8l+c8an9kx9rTKVVP+Qv/EffX0Y6WRiX/0l7Kyguufo9iTLuWdi9ds7PTlGpAkFAoEsNMA7+Po+rlMdJlFqZH9Md8om/YpQlpH8m9zORDk63x2AChX+owC+4hNMzilFuaLYxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKYCtG25FpnPsW+Hi2MjcXUXf+643WER5nOwZdZ5t/o=;
 b=0wkCv/YCci26njBPurr2RSXUe8A9bpTbsRrRMTzHYoHUZ7Nk1ZwkTRutxK8YNx3VQq2tBQ+GWw8FcR0uBAlANSdhrluc6UVfcYMRYEuxAaSSzjD/oeyzvA71yrDeNV46rXpiuZN+NG9EO1K3yJikEpg030UTp6xYMxP/JKcV1sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 23:18:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 23:18:12 +0000
Message-ID: <ba78e2a2-b4e7-bc58-3c08-1c447a1da3a3@amd.com>
Date: Mon, 20 Mar 2023 19:18:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 17/32] drm/amdkfd: add raise exception event function
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-18-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-18-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0259.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3100b1-5428-41ea-d46a-08db29996052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fu4mGoXtEubEinBCaeI+sJm51fGgpHvTELUr7qV6CXRtaeZ2dy3Yunw1aD7hSr2yV++sNsmfQBox5Z3GIy4wcTWqS+Ze9JZvwn3NRd/r5KJNns948hbBKFx5pprjRunXD9P6ZIsmvjP7VB4NDk7cnE7lcfRKzBTodCb+/yL+qi8k+LX0grUXaNNVUoaMAX/GmmguaWM1cHZ7umA9JvEruV2eKlWJ8oo96DR//5iAf2ttvOM2wYYUeoaaXjCOvyMcfYos6mP5rssR/FGOKXxM5h1R2Hw8goKKXkJrb012Fji1BoyMXeSUEe+3AYL7YdT6IKSFz+MVpst2bNpghH2H/z3Hte26860Wm1CgBS7/VIgjRVyvyJqPsxt0orbo4HYjxF4ZaysHGByc1Im57b2GoHwvzmxACCYNmvQcGULaUhAbkZM3gjldoeY/oeOD84NXAZ+GK7/7oGb+oF2LDj1KccMqm7fdHPtKBKhe/Xu+BEpefT1P6LWfNLDImQsD/Wz+5X1zAfhW39IruKy1KNIWpThITxL6nhrsrEY+8gf4tI53ecREhvq8R+K3lZCMnQZPZou8wbsQFOBdYTiVKTVf8QgbCNxA4L03KZ/uXevkZ+KUeq+PgrtKqKovtN4LoUbEg9kWD9YagFPmB73FlfXZbJA5ipq0QlFVTJojDM9xT7IIX6PRGN86FIkDO+dUAqH+l3ic+5iMo3k6UxwuFAXphX+dHMt44YZJ0E4qBGbqgg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(31686004)(2616005)(83380400001)(478600001)(316002)(6512007)(36916002)(6506007)(6486002)(8936002)(26005)(186003)(53546011)(66476007)(66556008)(86362001)(44832011)(38100700002)(2906002)(66946007)(5660300002)(31696002)(41300700001)(450100002)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtoVjgyUWJJOFErbFdmc3BZdC9XTWpGTXVoTk1IVUV1M2dSbFl4UXRFamp4?=
 =?utf-8?B?VXppUnV5WFNQUHMrT3NEU1piZ2hRaEpMWDlaTi9EN29yZHNITFhnK3ZJT2lW?=
 =?utf-8?B?V2tVUEI0MTE4U1VBWDErYzFCeFhsZDZpcHRLdmJ2VkdiR2VaMXYwVThrOWxZ?=
 =?utf-8?B?ZytEVFRrZkNQUFpyQU9qQkVmVkYwTnlhbjN2RWJsREtreW56WndVcDJtK2Zh?=
 =?utf-8?B?QnphL2xuZW9pMk1kSzZWSU9lZ0xZYTJCZ1JITGNpcDRPMEhMbFdNR3gxYVJt?=
 =?utf-8?B?NTRWOEdHWnhsRnNEUUllMnZ1VE1aWDVoMGpPdjNGRE50T0dGaFlWQUgwckZ1?=
 =?utf-8?B?RlBQUS9oL2ZRWklsbkRzUnl2bFZFa1dhQmNPVFVGSThXRUx1d3Z5L25ucVZV?=
 =?utf-8?B?NTdQWUVHQkNIejUzQThoN3BobVdzaW4wSGk2TzFndE1mbTZuSk9ERkZXUlpZ?=
 =?utf-8?B?eEV0U3AxNVg0UFArbWV0a09hdmRRWElLLzNTRWNPaWMyREtNeXdNeCs4eHo5?=
 =?utf-8?B?YVM0aVNRQjdyRHVlZlF3NVZnWFFLZnovM0hHVnZGK054WktrOVdaaXVudld4?=
 =?utf-8?B?Zi9CL1BsTUgrMi9sVUVRQzEvYXBXZzlMWnI1ei9RK3hNc3dIN0kxR0k1eita?=
 =?utf-8?B?MENaTllNUG8yZEtIOFBOTDZZUVNKQk9iQnNlSi93akdkY3pEbTNERTZaMWVC?=
 =?utf-8?B?UDk4K0ZwRFNreFp1ZU90L3hUdTUrbWtNa003dTVxTDZIUHdra3JPR2dxbm5F?=
 =?utf-8?B?N3czSkVRSjczTXdnUUk4cXRyVWQwNXk0UnN6QWlwQS8vbHlUUzZGZGhzSTRU?=
 =?utf-8?B?L2EzZVNKTFpoREZmQW1CNFJuR1VORk9QdDZkRUw4MVIxRlBsWmorVXdHMFg4?=
 =?utf-8?B?aTBzUE94amtwai9hRU5BM1Y1bkdYVDZXV0NKeTZRVlR1bHV2QXFTNzh0K3Jy?=
 =?utf-8?B?eFB1VmtyM3dyb0xGa0RJZWFSV2R1NjZhOTBEVHVCZENtNUVZWUE5SGhRSnRG?=
 =?utf-8?B?NjZFVnkxNVI3ZkVWZ0ticVVVdFY1UVgrOGYxOUluNCs5YzJscmoxWmVqTGNU?=
 =?utf-8?B?SFBoc2VRcEZyTXlhRXArU0pCZDdRSGhCNUQyT1EzdjRrZ1F0Q0ZPS1dOem93?=
 =?utf-8?B?YytkZnhwMU1Ya2xtb1phL0diSEdkVVVZM1hmWW80MWsrbDgrMmhaK0lNK2pv?=
 =?utf-8?B?RGZnTGUvN2JBdXJ6L21Mdnd2TGsvZFMyUHVpWnZzTE1Ya2RCUFJKYXVuTWxX?=
 =?utf-8?B?emJ5U3VoeE1hR3RwR3dTTGhaQnpHK3ovM0s3aUpXclR2Nmk5NnBIaGZJZks4?=
 =?utf-8?B?RHVScEZxc3pseHhURXdmdW85YWdHTEpWdHQ5MGhFNUFWaXRQRkZOMVpuVSth?=
 =?utf-8?B?N05tbHExSUI4aERXYmhzRktsMFhVOGRVcUZSZzhSQklPUXhGZjNpcjdBczla?=
 =?utf-8?B?MmhaNEFMWTJreHB6K0tNcHF1MWY0ZkJpNU9BZGpYcTFlU3ViWVlSNmlVT1hy?=
 =?utf-8?B?UDlMdHdJeUk3Zm5zc0hFZnhEcWpnSGZ0TUkzZ1IvSk9YNXVkd0p3bDZFZ2ds?=
 =?utf-8?B?b29TU3NIdmdQUlFaVTRqV2xza25yUHRBU3ZHc2plVlpQaVFGM041YkNqVTBi?=
 =?utf-8?B?a1ZNdHVuSkloL0lrN3NieFlZZFd3UCs0Uk9BMlA5U0Ywcm9nSGlDc3J3ejQ5?=
 =?utf-8?B?RkhXY0pXOVM5alZOZkxIbUxPS255MEJNc3B3Z3NoRHNxalFYVW5zZmY0OXI0?=
 =?utf-8?B?UTFwUTRyMEwrb1BRY1ovR0s3SHhYNGlTMWZDN2tFaE5pblh3enN4MzlsV3Bw?=
 =?utf-8?B?QjNlUm1ZR1h1SVVlWDhyVlY5UkdLSEkrWEJPajZRSDhaL3VBMyt6S3dTa2Y3?=
 =?utf-8?B?blZxSEhXQ2FYMXF6QUFybGRSaHFieHpLZlVQcUNWWHl3bXFuQy9vWDRLanhY?=
 =?utf-8?B?ci9VZzJNNHRyMFlONitSYk9tWVMySFliM1ZMZ240M05HaEIwZ3JpdXNoZ1B2?=
 =?utf-8?B?a3RVUk9HbU1GdDc1RFoxWG1HOEY1TmdQSnRoeWRheXRCK1lYcXpQMDUrbkFO?=
 =?utf-8?B?OTh5cDIxTldBSHVoVzd5bTRaSDdSbmdSYzBPL3dKNitWNm0yYVNYd0JISzMw?=
 =?utf-8?Q?bi6yxwgub/B14wAEV6EEi56f6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3100b1-5428-41ea-d46a-08db29996052
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 23:18:12.7550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWOmBHzdXbClYoT6h5NNugBMe0inBo3KALVGYf96KDaNStVLZ3SZmxXs5UMt286kiX3w/xkTKpq1a9HvCEy3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956
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
> Exception events can be generated from interrupts or queue activitity.
>
> The raise event function will save exception status of a queue, device
> or process then notify the debugger of the status change by writing to
> a debugger polled file descriptor that the debugger provides during
> debug attach.
>
> For memory violation exceptions, extra exception data will be saved.
>
> The debugger will be able to query the saved exception states by query
> operation that will be provided by follow up patches.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 91 +++++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h |  5 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  7 ++
>   3 files changed, 102 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 659dfc7411fe..fcd064b13f6a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -38,6 +38,93 @@ void debug_event_write_work_handler(struct work_struct *work)
>   	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
>   }
>   
> +/* update process/device/queue exception status, write to descriptor
> + * only if exception_status is enabled.
> + */
> +bool kfd_dbg_ev_raise(uint64_t event_mask,
> +			struct kfd_process *process, struct kfd_dev *dev,
> +			unsigned int source_id, bool use_worker,
> +			void *exception_data, size_t exception_data_size)
> +{
> +	struct process_queue_manager *pqm;
> +	struct process_queue_node *pqn;
> +	int i;
> +	static const char write_data = '.';
> +	loff_t pos = 0;
> +	bool is_subscribed = true;
> +
> +	if (!(process && process->debug_trap_enabled))
> +		return false;
> +
> +	mutex_lock(&process->event_mutex);
> +
> +	if (event_mask & KFD_EC_MASK_DEVICE) {
> +		for (i = 0; i < process->n_pdds; i++) {
> +			struct kfd_process_device *pdd = process->pdds[i];
> +
> +			if (pdd->dev != dev)
> +				continue;
> +
> +			pdd->exception_status |= event_mask & KFD_EC_MASK_DEVICE;
> +
> +			if (event_mask & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
> +				if (!pdd->vm_fault_exc_data) {
> +					pdd->vm_fault_exc_data = kmemdup(
> +							exception_data,
> +							exception_data_size,
> +							GFP_KERNEL);
> +					if (!pdd->vm_fault_exc_data)
> +						pr_debug("Failed to allocate exception data memory");
> +				} else {
> +					pr_debug("Debugger exception data not saved\n");
> +					print_hex_dump_bytes("exception data: ",
> +							DUMP_PREFIX_OFFSET,
> +							exception_data,
> +							exception_data_size);
> +				}
> +			}
> +			break;
> +		}
> +	} else if (event_mask & KFD_EC_MASK_PROCESS) {
> +		process->exception_status |= event_mask & KFD_EC_MASK_PROCESS;
> +	} else {
> +		pqm = &process->pqm;
> +		list_for_each_entry(pqn, &pqm->queues,
> +				process_queue_list) {
> +			int target_id;
> +
> +			if (!pqn->q)
> +				continue;
> +
> +			target_id = event_mask & KFD_EC_MASK(EC_QUEUE_NEW) ?
> +					pqn->q->properties.queue_id :
> +							pqn->q->doorbell_id;
> +
> +			if (pqn->q->device != dev || target_id != source_id)
> +				continue;
> +
> +			pqn->q->properties.exception_status |= event_mask;
> +			break;
> +		}
> +	}
> +
> +	if (process->exception_enable_mask & event_mask) {
> +		if (use_worker)
> +			schedule_work(&process->debug_event_workarea);

The worker definition should be in the same patch.


> +		else
> +			kernel_write(process->dbg_ev_file,
> +					&write_data,
> +					1,
> +					&pos);
> +	} else {
> +		is_subscribed = false;
> +	}
> +
> +	mutex_unlock(&process->event_mutex);
> +
> +	return is_subscribed;
> +}
> +
>   static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
>   {
>   	struct mqd_update_info minfo = {0};
> @@ -88,7 +175,6 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
>   	}
>   
>   	return r;
> -}

This looks wrong.

Regards,
   Felix


>   
>   static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   {
> @@ -114,6 +200,9 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
>   {
>   	int i, count = 0;
>   
> +	if (!unwind)
> +		cancel_work_sync(&target->debug_event_workarea);
> +
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index f199698d8d60..2d5bc102f6b4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -28,6 +28,11 @@
>   void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
>   					uint32_t vmid,
>   					bool stall);
> +bool kfd_dbg_ev_raise(uint64_t event_mask,
> +			struct kfd_process *process, struct kfd_dev *dev,
> +			unsigned int source_id, bool use_worker,
> +			void *exception_data,
> +			size_t exception_data_size);
>   int kfd_dbg_trap_disable(struct kfd_process *target);
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 75521d96e937..e503bd94dda6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -495,6 +495,7 @@ struct queue_properties {
>   	uint32_t ctl_stack_size;
>   	uint64_t tba_addr;
>   	uint64_t tma_addr;
> +	uint64_t exception_status;
>   };
>   
>   #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
> @@ -786,6 +787,11 @@ struct kfd_process_device {
>   	uint64_t page_in;
>   	uint64_t page_out;
>   
> +	/* Exception code status*/
> +	uint64_t exception_status;
> +	void *vm_fault_exc_data;
> +	size_t vm_fault_exc_data_size;
> +
>   	/* Tracks debug per-vmid request settings */
>   	uint32_t spi_dbg_override;
>   	uint32_t spi_dbg_launch_mode;
> @@ -921,6 +927,7 @@ struct kfd_process {
>   
>   	/* Exception code enable mask and status */
>   	uint64_t exception_enable_mask;
> +	uint64_t exception_status;
>   
>   	/* shared virtual memory registered by this process */
>   	struct svm_range_list svms;
