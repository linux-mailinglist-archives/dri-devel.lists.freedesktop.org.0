Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9715FDE0B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 18:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B07C10E28A;
	Thu, 13 Oct 2022 16:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918EA10E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 16:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbKXS6LXI9hDUI0s5Rvg7iHpZj4MHBOYwlVvUFWfQAKSAOtPy4Ji5OdxOg2awUKhdwjk+jvnIEQxaxYiX4xKnd8964YIMF3OPFhmkaFQA6WRRBaDDJVCQuxN+Av9wUDQlTKEObgZUAJJjtZlqWUteFt7dpk84R1FXiCpTHmeWj8OX5p9xF7gxlvds0JOfB7J8W7SXuckmv4aLWPm44NZz1+VcfljQ6mI1sbp1w6m2I0lDqyk6IHZIx8i/AkArSjI5fq3tCDp7XTAshXxchmSPgVgiVSybuwSjshBeiKxgF9mLyILjVr4Fe4gZmAN27VLtT3tKZlwXP+CoaaLSokZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cvw33UuqjQmpMoC+a8qOhGXtRCOu8LkgXgpKeH9g8V0=;
 b=XlincjNpo4G3Y7bbG0k9sPic9bGECqsfjZ0tqKn55kDi0qvuASbw/aTfsuB4BEvgIptXx+WmyRIv5IdY6qW3rw8184epfePYp1ymSMntS8uNiyHDxlMjK23tGhYQHLisCO4pfZQUqqOBIQF6CNbgb0V4cz8F05FNFI61CPsZf6zHtWapiVulAwecbX+vg/p+m6OkKRzvJOqj7J+w0W8GcgWkPSPlNqtiBIjIegUg9yKDNbe2zCCkhIZyPzzpI6+a+qS69QolF8EcW9rRsIWeF77cWzEErOzxTf5HZEbXWsDxck92PwE1zpMFIIcTaVQap8OPf9l58TJSxKJ4n1m0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cvw33UuqjQmpMoC+a8qOhGXtRCOu8LkgXgpKeH9g8V0=;
 b=bC3PMKQ/wKqMn57TbTxAFS3knC7ZZdbzJ5mGbpjrMeSHZMXvHGFiY8BKUnilHR0aQiWZ4klfaqlNWm+XuGI5KfwFxBuloUYTT7IB9Slr38CViStBeHf3vpPToNWrElHUiEVN9FmtPZZOxVEI33synZx66VMx2OLVQ9iPK6/auac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 16:14:40 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f8ad:96ef:844a:73c6]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f8ad:96ef:844a:73c6%2]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 16:14:40 +0000
Message-ID: <8d0e74ac-6897-59b0-c734-5618ec8c8e4a@amd.com>
Date: Thu, 13 Oct 2022 21:44:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20221012132200.13011-1-Arvind.Yadav@amd.com>
 <e9bc5b4f-1aac-2aad-3dab-958c5192f9e0@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <e9bc5b4f-1aac-2aad-3dab-958c5192f9e0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::8) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|CH0PR12MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e213ef7-1adc-498f-fc65-08daad3607c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5SZ54F8EXXSNwpyTrl2S1dzIoHFPtBAalaJqEVgZPYweuM/VNu+crhOI0QAfitQDTFcWXAysRPLK4Ps664uDr/iPDdBehp+rIpmMqiEl/uItMWHx1mBryxNwd5vLohrFaBRdqWU/2AlsnAYHgyUnLlDFkCOUZ2wINiSZt/NATmBReiJDpvyz6wjxtZXG7xW1DUCcYA0OVhoJ6LPGAkhLGRO5CIhCi3so7rysKlLt0KPCY3klZBTRUFFlltQKPv5hNojpFACDU2KYSQ+bPDfUZt+wl7xkMH/r5TMzvM6cPAXC06H6jU7+NU7xOAYHoA/tn7bPsNCCm8rBVOAbXC1dwgS2yqTDrCDpIX7BATIYkrTwxHO04ZyHyxVSVp0gap8/71y6W9dtXdhmsqKGS47el0hZ5l7snACEtDxRLzqSl5MrWcKj5rIDdd1aS+3m9Tjl0Jrwpk4G6dJFLWWq0mNOKNsR/EoC9YtN6yYpzvN/s+sZuNCboD9Di+Swgp57o/kIS+nO42xqL/1hebdal1/d76xn4/5nZrxH3GLB2RZCiyS9tMl+NsE1Dup2jUT48oEcb/aTY4f0JmcvBT7MlDLG4tqSXNa1BVhWjvWr5Rknedg0KlHcIbMUBVLA+iNUuYf0hlztgLprlwyGw4ItNyjvac/jRO1lYBN5mxhBIePqvByhRC8i9mCeSLOnjRLfD583VSV2I/jYBtKYT7rasKHXVwrj808YD1bgQxYYmyHM/GSGzcbqY/Onx3mFkdTCd5VEIyea/V5ddVVJer6Gd7U5zjmDCeJ9boJ6KSeLGUTGqwuZmbshnSN+4LWrgB6r2BM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199015)(110136005)(316002)(478600001)(6636002)(6666004)(6486002)(66556008)(31686004)(8676002)(66476007)(66946007)(2616005)(6512007)(8936002)(26005)(53546011)(41300700001)(186003)(5660300002)(6506007)(2906002)(66574015)(83380400001)(36756003)(38100700002)(921005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXYrWnNyaGtONU9rdHdjTmwvSnYrZnpnbnpQWXNjb3NmY2RWNDVYd3ljSVoy?=
 =?utf-8?B?WUM0aDJaeDhQL3RYaVQ5alJJVzRkcGY5bmM0Q3N5QXFhSTFDQ0grdHdvY1E4?=
 =?utf-8?B?NC8zS2F5NDkvay9MUHRMRXZEYk9DR0duREFmekdlTlJocnRRN3hsMUpFNUg0?=
 =?utf-8?B?cXhLU1dSbVdReCs0dG5VRnhJK0swcUxUQWZoVHV6Um1EWmlpRlpWdjdqQS9i?=
 =?utf-8?B?M0tIWFY2dXByOTBzeHBkOGFwNXZpS2V3RVZHVEJ0cmU5cEhIZUtjeUxiWlJ5?=
 =?utf-8?B?Wk0xQkZzc1BLdFNBZWxPQXFGcnZCMXVNU3JXVHMzanMveFJMdjl1ZWJmOVhz?=
 =?utf-8?B?SlhVNGVxREtzR3J0WlNuWHFtU0FRVXpDNlVaYmsxWkw1MVMyOGFYdFluS05T?=
 =?utf-8?B?b3YxRmU0U3hMWmxpNGQ5MUZDNmVXQXIxRUZ4bVQyS3ZlUWFocis2akdWWENy?=
 =?utf-8?B?eFJJd2pycUZZNm13V2k5TzYzOHhudnVNT2UxMm40STdEaTdMYjI5K3I3TFpq?=
 =?utf-8?B?anhpZnRVZjJxVmdoOXVsNWZNV25wdWZkZFg3eEtWbndOdUR2WWtIc0tQMlJX?=
 =?utf-8?B?YWlGcWFab2RSK21mUGswQ25PSUxhemlnMVlMRCs0Yys2bVdOYzY3VFJ5U00x?=
 =?utf-8?B?MC9LS1M4eUFoMStka0QxREhZQjVRMHB1YW5RVWpaOXZld1dWYXRLd1NuTW1U?=
 =?utf-8?B?cUJyQklUd0c1aWZQU2poeXo2NGh0ak1ET0dDODRSa2wvWm05UGlxWG5PZU9x?=
 =?utf-8?B?WUlOYURGT3B2VTkzQ3ZTZ0tCVTVaM2cyd1YzbHpQbXhBR0pjWVBiUzBlWEtW?=
 =?utf-8?B?bm1uMG1JanNHSmFmL3ZGNnJoSnk2THZIUUo4R3dkdXcrZHdXbmxxa3NzNU1w?=
 =?utf-8?B?R244WXFiOUZURnlQOGhLc1JMaE1pbmpxdlNpRVBiVlBYQkVvVVdSWlhGZVpH?=
 =?utf-8?B?eTB1N0ppOXF6Y01zbFA5eDBSQkNvQUNZTG5md3NmTGpSTTV2WjlNbTlRMFMr?=
 =?utf-8?B?K1Q2c0F1bldpcnBvVWJabGhqNm1SSktWZVhRMVRzZXBtUnQ1THpQUElqYWY2?=
 =?utf-8?B?RnpQU3JHajVlSUlRZno0czA1NUQwZnZweHQvYkIvOUorZ3YxZUpVZ3hOWC9t?=
 =?utf-8?B?TjhkQVp1Wnl4eW9HakdBRW1nM3NjbjRZTzNYb0dBQi80cmNWbnRjM2dZNERw?=
 =?utf-8?B?b2wyay8wM0FOeW9TM280VXpaWXpIWmJPVFpTa2drWFVmRXpoTDBjNUFMWVVO?=
 =?utf-8?B?bDVwZmp4QTNqaDEwZEIrNVZ6cnhGZjhLVmR1YzdxTFpqZkN6bzBxM01VeFU5?=
 =?utf-8?B?NEF6MlBkZmFyL1I5RlBSZExjdHNTcEJVMStlOWdUeHBxSzJOODE1S3R6TUVq?=
 =?utf-8?B?RWNtYnFydXZ3aGdYWStEbktscXhNamtoOVNoZGpCNlluZ1V1dXhMZENpWWYz?=
 =?utf-8?B?NTl6UVpxVHdBZy85b3Mxeno3bjkrazlZcjAwVXQyNlJqSGFGL2VaUHhMZ1VI?=
 =?utf-8?B?cjdKQUtmZDRVUmt4VjNIWm51d3Vvb21tdkFwaFZ5T2NrdnJyMy91cXBDeGZX?=
 =?utf-8?B?N2l0K2FZc3dqRTByQXZtRzM1bnZOZFNvZFFraDFhNUpNWlJqK3NSMWg1SVQ0?=
 =?utf-8?B?NDdldldHbThaM0pkSFdmdGZmd2ZoSmJEaHpHVXNVaHdmQ1M1OVRpOEk5S2lG?=
 =?utf-8?B?WXVON0xsejZGc01TdHBZS3duL1pyZ3ZWTCs4WTRXTzBqSjFFL241MTdzcWMx?=
 =?utf-8?B?UTlEKzlaVXFzc05haVI4dWxtQ1ZEM0Nwb1hXWG5IeUFtQjltdU5LQ3Y0cjlw?=
 =?utf-8?B?d283Wlh6YVNZS2VuU0cvQlNIMzV1SzVXS3UwMldnekFqemZ1TitDZ3BnbTZv?=
 =?utf-8?B?WFFmSTdwdlJzQ1JseHZheFRZSjgwTFc0MnpwZWZqRkZiM3oyb3BtQWJGNVhN?=
 =?utf-8?B?OHdzWjlCV2c2QmdsY2g1UGgrQUc3cmRJcHFGSUl2MGdUTXZoMzVjbGt3L1cy?=
 =?utf-8?B?clRrTlFBSHZVUTBEandRUFcyUFVYc2hPdW5HSmFzVElwU0dVTmpJbFpoQ0FF?=
 =?utf-8?B?SHFnUitiNHdiQlVIZFI0NmFsYXd3QkNhM01FTGpSTG1TcFhYWFYxSVgzdG40?=
 =?utf-8?Q?xwIM3+bBcp2DnfYeAv7vsPXiz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e213ef7-1adc-498f-fc65-08daad3607c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 16:14:40.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZzCBhZCW3hs0ztHEGDyhSWKXgqU+HcBgxNb/om6Ceyw8cbxJFa9DHz88lFzSdRv7cQ78/HI51lQU+Ni9FBU5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5139
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


On 10/12/2022 7:05 PM, Christian König wrote:
> That essentially looks like the right approach, but I would go a few 
> steps further.
>
> I think we should add a drm_sched_fence_set_parent() function to 
> sched_fence.c and move a good part of the handling into that C file. 
> Just a simple signal function which tells the scheduler that it should 
> decrement it's counter and wake up the main thread.
>
I have added these two functions in sched_fence.c . Here, I have used 
drm_sched_job_done() function as it is.

Is that fine?

void drm_sched_fence_add_parent_cb(struct dma_fence *fence,
                                    struct drm_sched_fence *s_fence)
{
         int r = dma_fence_add_callback(fence, &s_fence->cb,
                                        drm_sched_job_done_cb);
         if (r == -ENOENT)
                 drm_sched_job_done(s_fence);
         else if (r)
                 DRM_ERROR("fence add callback failed (%d)\n", r);
}

bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence) {
         return dma_fence_remove_callback(s_fence->parent,
                                          &s_fence->cb);
}

Thanks

~Arvind

> Regards,
> Christian.
>
> Am 12.10.22 um 15:22 schrieb Arvind Yadav:
>> This is purely a timing issue. Here, sometimes Job free
>> is happening before the job is done.
>> To fix this issue moving 'dma_fence_cb' callback from
>> job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000088
>>   #PF: supervisor read access in kernel mode
>>   #PF: error_code(0x0000) - not-present page
>>   PGD 0 P4D 0
>>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>>   CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
>>   Arvind : [dma_fence_default_wait _START] timeout = -1
>>   Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
>>   RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
>>   Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 
>> 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 
>> <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
>>   RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
>>   RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
>>   RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
>>   RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
>>   R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>>   R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
>>   FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) 
>> knlGS:0000000000000000
>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>   CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
>>   Call Trace:
>>    <IRQ>
>>    drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>    dma_fence_signal_timestamp_locked+0x7e/0x110
>>    dma_fence_signal+0x31/0x60
>>    amdgpu_fence_process+0xc4/0x140 [amdgpu]
>>    gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
>>    amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
>>    amdgpu_ih_process+0x86/0x100 [amdgpu]
>>    amdgpu_irq_handler+0x24/0x60 [amdgpu]
>>    __handle_irq_event_percpu+0x4b/0x190
>>    handle_irq_event_percpu+0x15/0x50
>>    handle_irq_event+0x39/0x60
>>    handle_edge_irq+0xaf/0x210
>>    __common_interrupt+0x6e/0x110
>>    common_interrupt+0xc1/0xe0
>>    </IRQ>
>>    <TASK>
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>
>> Changes in v2: Moving 'dma_fence_cb' callback from
>> job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
>> instead of adding NULL check for s_fence.
>>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++------------
>>   include/drm/gpu_scheduler.h            |  6 ++++--
>>   2 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4cc59bae38dd..62d8eca05b92 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct 
>> drm_sched_rq *rq)
>>     /**
>>    * drm_sched_job_done - complete a job
>> - * @s_job: pointer to the job which is done
>> + * @s_fence: pointer to the fence of a done job
>>    *
>>    * Finish the job's fence and wake up the worker thread.
>>    */
>> -static void drm_sched_job_done(struct drm_sched_job *s_job)
>> +static void drm_sched_job_done(struct drm_sched_fence *s_fence)
>>   {
>> -    struct drm_sched_fence *s_fence = s_job->s_fence;
>>       struct drm_gpu_scheduler *sched = s_fence->sched;
>>         atomic_dec(&sched->hw_rq_count);
>> @@ -280,9 +279,9 @@ static void drm_sched_job_done(struct 
>> drm_sched_job *s_job)
>>    */
>>   static void drm_sched_job_done_cb(struct dma_fence *f, struct 
>> dma_fence_cb *cb)
>>   {
>> -    struct drm_sched_job *s_job = container_of(cb, struct 
>> drm_sched_job, cb);
>> +    struct drm_sched_fence *s_fence = container_of(cb, struct 
>> drm_sched_fence, cb);
>>   -    drm_sched_job_done(s_job);
>> +    drm_sched_job_done(s_fence);
>>   }
>>     /**
>> @@ -506,7 +505,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>> *sched, struct drm_sched_job *bad)
>>                        list) {
>>           if (s_job->s_fence->parent &&
>> dma_fence_remove_callback(s_job->s_fence->parent,
>> -                          &s_job->cb)) {
>> +                          &s_job->s_fence->cb)) {
>>               dma_fence_put(s_job->s_fence->parent);
>>               s_job->s_fence->parent = NULL;
>>               atomic_dec(&sched->hw_rq_count);
>> @@ -576,15 +575,15 @@ void drm_sched_start(struct drm_gpu_scheduler 
>> *sched, bool full_recovery)
>>               continue;
>>             if (fence) {
>> -            r = dma_fence_add_callback(fence, &s_job->cb,
>> +            r = dma_fence_add_callback(fence, &s_job->s_fence->cb,
>>                              drm_sched_job_done_cb);
>>               if (r == -ENOENT)
>> -                drm_sched_job_done(s_job);
>> +                drm_sched_job_done(s_job->s_fence);
>>               else if (r)
>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>> failed (%d)\n",
>>                         r);
>>           } else
>> -            drm_sched_job_done(s_job);
>> +            drm_sched_job_done(s_job->s_fence);
>>       }
>>         if (full_recovery) {
>> @@ -1053,10 +1052,10 @@ static int drm_sched_main(void *param)
>>               /* Drop for original kref_init of the fence */
>>               dma_fence_put(fence);
>>   -            r = dma_fence_add_callback(fence, &sched_job->cb,
>> +            r = dma_fence_add_callback(fence, &s_fence->cb,
>>                              drm_sched_job_done_cb);
>>               if (r == -ENOENT)
>> -                drm_sched_job_done(sched_job);
>> +                drm_sched_job_done(s_fence);
>>               else if (r)
>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>> failed (%d)\n",
>>                         r);
>> @@ -1064,7 +1063,7 @@ static int drm_sched_main(void *param)
>>               if (IS_ERR(fence))
>>                   dma_fence_set_error(&s_fence->finished, 
>> PTR_ERR(fence));
>>   -            drm_sched_job_done(sched_job);
>> +            drm_sched_job_done(s_fence);
>>           }
>>             wake_up(&sched->job_scheduled);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 1f7d9dd1a444..9a96d49dfd75 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -281,6 +281,10 @@ struct drm_sched_fence {
>>            * @owner: job owner for debugging
>>            */
>>       void                *owner;
>> +    /**
>> +     * @cb: callback
>> +     */
>> +    struct dma_fence_cb cb;
>>   };
>>     struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>> @@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct 
>> dma_fence *f);
>>    *         be scheduled further.
>>    * @s_priority: the priority of the job.
>>    * @entity: the entity to which this job belongs.
>> - * @cb: the callback for the parent fence in s_fence.
>>    *
>>    * A job is created by the driver using drm_sched_job_init(), and
>>    * should call drm_sched_entity_push_job() once it wants the scheduler
>> @@ -325,7 +328,6 @@ struct drm_sched_job {
>>       atomic_t            karma;
>>       enum drm_sched_priority        s_priority;
>>       struct drm_sched_entity         *entity;
>> -    struct dma_fence_cb        cb;
>>       /**
>>        * @dependencies:
>>        *
>
