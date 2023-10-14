Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE667C9259
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 04:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20C510E092;
	Sat, 14 Oct 2023 02:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07CD10E008;
 Sat, 14 Oct 2023 02:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfI08IbLaldKABG7t5O6teBQAAJJvYHbMjwu1YyBQqg+amXwVyyCg8v84S+l3bzPDPD8BoygQz9BixPvk85Th71QGd1Xw3GpNI/h+pf48QfydtGlYamjQfLbFTCnSJ5olsSvuIBV/s8yUd7+GDW3M34jrZ18Thq7ndKdSW2htz9G/5UdJO7rUJDGPrZEhl2T0uDkgvQ71XB1vzFm3cIxNXOKRE86Y1DfLtDVXfiUS5BHiB34SNX4NX/wG6SZwPLYCUNZLRtjEhBdlVE0XDP8ZShce2GjedztqigSQj3o1u8LfsihezPIpJ5gSVI0Qp49fRAKHpHbiUf6VjixspOUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCQJAcOH4Xx/SOGPRMC63iEieokyTf3X/Do92uJiw7E=;
 b=H5/HJ6yrr2W6j5zNdVikqUpxoMrc0DvbTD+gdmja2O8gtjgj5/u1Rld0aJFyvWXUKX1mg4CKIyGNIjK4Tr7KaubeHl1nzN27FiwhnqUYmXdEZtVlJkpgk66q6cxSssH1bKJe/Pl2k3fCjQh+9u6tOFz8vltiMEDSleezB36jEFzjs4Nbg3lraFx69Bfdc4W8CsP2rb3Nx5mlqOfajUGBaw9XJhswT5qNIH1QjS8cBCu/+2DmQLDF5MH6FsQEQ4tdjdp3SElC1jV4jU8D8bb0xFyDmezDli816AK470v3NV4scwhtojwtlQcEj/cy+reUTJ0fTA1uqxMCiXcRKZx0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCQJAcOH4Xx/SOGPRMC63iEieokyTf3X/Do92uJiw7E=;
 b=EebhA9RkwXkWnjUpjzmnfF6zCtoThVqPG5xaVOiyhRGPOLUFuHP5aHSmyBr9CkmxVfvSaKTttSQnGml4tLoLcDxTBUQI/hU+z/L4rhU/MkvSN6kTxedPnln82yoWACyxvQjvekoa0yeQqoZWPnVujK7w61B5HEdzDPPiWX6SmI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 02:49:43 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 02:49:43 +0000
Message-ID: <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
Date: Fri, 13 Oct 2023 22:49:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-6-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231011235826.585624-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ea385e-4d13-48f3-c525-08dbcc6037fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kpVfpstIUGRDk+4esWZrlsMCEZCGUULpbu+Ulu3lIf5O8OMa//3+cQwqU8RQ4P9ro8b+V7Pary6wdb5U5tapGAkvzKWt5b1wgBqaxybWXPBFHzYHsHLVvfm36qfCnR4Z6ZPlARp7mGslKj+sOrUi8dNY+iH/wVXgIjd/mvm9DA61EsO8+YucDWHdk9dTN/c4l7hOAHzQsSY6YM5bo9Sq859jbW51eBfjqsJWareCpHmjG5hE+GPglBjYPxDJpid5wZcOarmqaw4FrVrb9o/v6x3XfNC5Pr201qbBnxUxQPz1/j8IH6oQv2FPrbSuAP8moPt6x6k+ozc/CQr/zk+V2X5BGDpxfRRhqpJXJU30S/0jmmHQmxPjvn28Dg6Dnr4ahTRa6uBXAW6wQrQbQrq07LXjxGaeD/uzgY72iJ+BJCzVeAl13HVbdQoSmWoIaMIRm9pbszyYMoUIOQP49qtVcbNfGaIevmT4AmfnwBDuAvriAh7bTMd9rhfuFVIG9nXVshesR4cmRLBzIWszRH2K4rftRQoZ1Dn04T7AK5Fv6XWuaV9sEl/T6hUFU5r/FzYi63aeB73IJyOLEt0mPNBgWLGF0/7h6cZoKR9iTqwfP4A/UBI0QxTvRSS0WelvESa2KBLEQxNt3SyXHhsZA/F5rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(316002)(8936002)(38100700002)(8676002)(31696002)(86362001)(66556008)(36756003)(4326008)(66476007)(66946007)(2906002)(31686004)(44832011)(41300700001)(53546011)(6506007)(30864003)(7416002)(2616005)(4001150100001)(6512007)(6486002)(478600001)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGliRHVndEVTOVppeVJTMmVjM3RtZmt4R29KQjNaSVQwWVJiNEdibUZvcWlO?=
 =?utf-8?B?NEU4dWV5UE5ZK01FZy9waUd4NnQ3Zjl5d0xENVJZZVhwZzFPazRvV2NVZ1lG?=
 =?utf-8?B?UmhXd2RPeUxMb0FwU3NVSzdvaHA5MG1Qb0gvTzgrMW5FNDBxckRadnk4cW05?=
 =?utf-8?B?S1YyU2lTcGwvV0lLNHNjQml0YVV3NXRvRG1LSzJWMlFZdGNKSFVOVVF4bjR0?=
 =?utf-8?B?dUxYTHB2QlIvL2czbkkxS2kwMUcwMFlna1A2VDlUUXR1NFNBWXAxREwveVM3?=
 =?utf-8?B?Lzc5RmRmZWtvZFI4MjZXS2dDUWJSUXdVbnJxUWxmUEZZQWFOeXVYUFk0UnJQ?=
 =?utf-8?B?TzZBYjVJcGhackY3WkI4YWRreFZzNVcwM1hkbCtTQjBGTFFtMGdidWdlL0Jh?=
 =?utf-8?B?QWRMWHFTbDRGdk4zWHRrV1FSNmEyaDhMWEc5ak91aExEcGdhcWpaaWpJNVBK?=
 =?utf-8?B?Y3EwaUpIRUN4UXAreUxibDg5OUp4dVFrb2RnZE1DWFYwRVRaeEsrTFlhY01l?=
 =?utf-8?B?OGdTdDAxVVAzQmZwTCtXc0tLYkd4UG85S0lucjdhNVdXWlh2MlY5U0UwaTF6?=
 =?utf-8?B?MkZCY2YxL2M3UlVZMk11MzRMUkRCdTFHUkgzYmFXbWoxZmNWc3hYWmRZaXhX?=
 =?utf-8?B?TEVNeXVzUENIZ240UVo5US9lN3lNdFc4MVlxQlR1MFV2a0d0RjEvc0RSS1RF?=
 =?utf-8?B?SElmVElIQmVQVmd2NWwzVDNhQTVHYklITVJkZWFFelJnUG90Y05CMU13K0ZU?=
 =?utf-8?B?Y1hUdWlDYWdYSUN4QW42V2JKVFBodXhhbWgzQTJvQklTemZOU3JtTk1YRGJt?=
 =?utf-8?B?dHZveThnblRsenVKYVFPTDhMbzk5RlpMSkZ4d3NGQkZoNzBVTjBqRUV6aGc1?=
 =?utf-8?B?am9pTEtwdzlWSGdPNUkvdjlNeVl5a2RGSGZQc1pRSzFjM3JYaGpFaVJ6Qm1v?=
 =?utf-8?B?U2o5TjM1TmJ0cEpZaGd1YjEzS2diQ3VTOE0yNTBwOHZkWXVqUDFKdW9IKy81?=
 =?utf-8?B?bUdsN1JtTHNCaE9laDNaVFdNcGp3TktsdC9UeHh1bmI5ZXl4d1g1cnpMUy9q?=
 =?utf-8?B?Y0IrRjduNmlqUXJSNC9kMS9LM016S3RjMGhOdWVKU2RtZUxabndkNHZ4b2d6?=
 =?utf-8?B?UXFQR3JzNEZmVXlaU1lYQjBFY1hmLyt5UGxEWE0vSmE4VEV2Y3dRdVFCa0pK?=
 =?utf-8?B?NjBraWlRVzVRbVdpam8vU1FyK1dpY2NPN1NBeDNrU0dnOExPVTY5RDh1TzZG?=
 =?utf-8?B?bGVZb1JOUzk5ZkFJRm5POWl2TGZ6b2ovL0x1U25LaDlhaGRjQytMMVNxZzZt?=
 =?utf-8?B?dGRBYlhLNEdpK0wzQ0hCSlJ1QlE1VUljVGYxVHdNTjdobEorTWdzNUQ1OXFC?=
 =?utf-8?B?SllCL2JNRUpWMjdGaTBSWWRFUWZ1TWZzTkdvOWNnVVpnYTVLYjNYSGtCc1VL?=
 =?utf-8?B?cWRzcjRwS0dJZ1lUZDVrTFdBbnFmdXZnNXJ6TXduTFh4bUMxQ3dLZGJDUXg1?=
 =?utf-8?B?OUtmdUk4ODVrSkVtQUgrQllQTXYrZ2E4dWdxYWZlWG1KRmxQcGwwcXVmNFBi?=
 =?utf-8?B?MmhWK2MxNzFua3VFdmlva2M1TXMzR1U1R0FxYTBjM3UyR0NkT0Z1eldpTGV2?=
 =?utf-8?B?RDV2UUpja0w5Qk1rdkhlSUZxM2szcHpOalBtTUJFUUd4Sjh5bGxPZVhYNlpy?=
 =?utf-8?B?RjFRMWYrRm51QUFXaFF5dXR6TkRQOTU5NmFrTkwyWmVrWUYrbERXeEYrdWlB?=
 =?utf-8?B?Y29VSW1KSXJJU00xak0zM0szdVpkOWppV0xhcVpHYVZZdnE5bGppUEY3RGlW?=
 =?utf-8?B?M05WWEl2dVR5bHIwenlnUnd1Z3V1djNYRUFxYlE2VjNpTHBFU1hEWjA5eS9y?=
 =?utf-8?B?blRBSDVrNXpZS2llRkhNa2hzeGJpYU8rajAzQzRIUGJUQ2tNZFRuUVNFWDVz?=
 =?utf-8?B?NGRSdmRLdTRUQkw3UzVVODk1ak9HZXNXekUxQjJYQmdUb2tTdkJWUjhtSXdX?=
 =?utf-8?B?WlFJQzZlRllZelA1aXNHNk1MVjR6dnJQZnhYMFprSk5pM08rU1hRZ0NnNUhI?=
 =?utf-8?B?UVFsejN6eU5DSVlNS1A2V2dVYnFpdFQ0SktPd2EvdktVNmpRSzhzTlNhWnhs?=
 =?utf-8?Q?57YenaestMBJeQIOsJp7BI4x3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ea385e-4d13-48f3-c525-08dbcc6037fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 02:49:43.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XIURmbjy1TzG7DQWgf66fAuxw1xXXvDI/86lKoqUdtrthlhilEQvrH4UACBQpKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-11 19:58, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> v2:
>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>      timestamp in free_job() work item (Danilo)
> v3:
>   - Drop forward dec of drm_sched_select_entity (Boris)
>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> v4:
>   - Replace dequeue with peek and invert logic (Luben)
>   - Wrap to 100 lines (Luben)
>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I wasn't able to apply this patch on top of drm-misc-next at a48e2cc92835fa.

Create a branch off of a *clean* drm-misc-next and rebase/reapply/cherry-pick all
7 patches on top of that clean drm-misc-next branch. You should also run
scripts/checkpatch.pl --strict on all your patches, or integrate it into the precommit
hook, see githooks(5), so you don't have to run it manually.

Set format.useAutobase to whenAble somewhere in your Git configs (global/local),
or use --base=auto to git-format-patch when you format your patches before
git-send-email-ing them.

Repost your patches.

The base commit will be added to the bottom of the cover letter. It should
be an ancestor (or tip) of drm-misc-next (git branch --contains <base> --list etc.).
If it is not, your base tree wasn't clean, and you should redo this process.
-- 
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 287 +++++++++++++++----------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 178 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7dbb3392124d..cf4c23db7547 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @peek: Just find, don't set to current.
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool peek)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (!peek) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}
>  				spin_unlock(&rq->lock);
>  				return entity;
>  			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	list_for_each_entry(entity, &rq->entities, list) {
>  
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (!peek) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			spin_unlock(&rq->lock);
>  			return entity;
>  		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @peek: Just find, don't set to current.
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool peek)
>  {
>  	struct rb_node *rb;
>  
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (!peek) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			break;
>  		}
>  	}
> @@ -282,13 +290,98 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  }
>  
>  /**
> - * drm_sched_wqueue_enqueue - enqueue scheduler submission
> + * drm_sched_run_job_queue - enqueue run-job work
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +/**
> + * drm_sched_can_queue -- Can we queue more to the hardware?
> + * @sched: scheduler instance
> + *
> + * Return true if we can push more jobs to the hw, otherwise false.
> + */
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +{
> +	return atomic_read(&sched->hw_rq_count) <
> +		sched->hw_submission_limit;
> +}
> +
> +/**
> + * drm_sched_select_entity - Select next entity to process
> + *
> + * @sched: scheduler instance
> + * @peek: Just find, don't set to current.
> + *
> + * Returns the entity to process or NULL if none are found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
> +{
> +	struct drm_sched_entity *entity;
> +	int i;
> +
> +	if (!drm_sched_can_queue(sched))
> +		return NULL;
> +
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
> +	/* Kernel run queue has higher priority than normal run queue*/
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i], peek) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i], peek);
> +		if (entity)
> +			break;
> +	}
> +
> +	return entity;
> +}
> +
> +/**
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched, false))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
>   * @sched: scheduler instance
>   */
> -static void drm_sched_wqueue_enqueue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>  }
>  
>  /**
> @@ -310,7 +403,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_wqueue_enqueue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -576,7 +669,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  				drm_sched_job_done(s_job, fence->error);
>  			else if (r)
>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> +					      r);
>  		} else
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
> @@ -885,18 +978,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>  
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - *
> - * Return true if we can push more jobs to the hw, otherwise false.
> - */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> -{
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> -}
> -
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> @@ -906,43 +987,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		drm_sched_wqueue_enqueue(sched);
> -}
> -
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the entity to process or NULL if none are found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity;
> -	int i;
> -
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
> -	if (sched->single_entity) {
> -		if (!READ_ONCE(sched->single_entity->stopped) &&
> -		    drm_sched_entity_is_ready(sched->single_entity))
> -			return sched->single_entity;
> -
> -		return NULL;
> -	}
> -
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return entity;
> +		drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> @@ -974,8 +1019,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  						typeof(*next), list);
>  
>  		if (next) {
> -			next->s_fence->scheduled.timestamp =
> -				dma_fence_timestamp(&job->s_fence->finished);
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =
> +					dma_fence_timestamp(&job->s_fence->finished);
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -1025,74 +1072,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
>  /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>   *
> - * @param: scheduler instance
> + * @w: free job work
>   */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *cleanup_job;
> -	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
>  	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> -
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> -
> -	if (cleanup_job)
> +	if (cleanup_job) {
>  		sched->ops->free_job(cleanup_job);
>  
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> +		drm_sched_free_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
>  
> -		s_fence = sched_job->s_fence;
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
> +	int r;
>  
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
> +
> +	entity = drm_sched_select_entity(sched, true);
> +	if (!entity)
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +		return;	/* No more work */
> +	}
>  
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	s_fence = sched_job->s_fence;
>  
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
>  
> -		wake_up(&sched->job_scheduled);
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
> +
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> +
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}
>  
> -again:
> -	drm_sched_wqueue_enqueue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
>  
>  /**
> @@ -1159,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1283,7 +1340,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  
> @@ -1295,6 +1353,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e67b53c3546b..625ffe040de3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs
> + * @work_free_job: cleans up jobs
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -519,7 +520,8 @@ struct drm_gpu_scheduler {
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;

