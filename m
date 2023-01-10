Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025496644AE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D510E5DB;
	Tue, 10 Jan 2023 15:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFD510E5DB;
 Tue, 10 Jan 2023 15:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWCDlugXqDe+JggNBTMQPX/BtdYSnnmTBXlIgDqylozcqyaDSCd6RecIyZywRafeNJ2Wir8dSSoOxp9LZkFRMUOATg9v5KdlbvtT7mo53xZ3oexHNyGrwtYBfaXccZ0ZI1F2AfXf6rWITsbwYEWiTA1/nASCb9YEmFQMGddy3DpwK1GkXap+cTjfhJ+qd1S8FUvUO8Xmu6OCdmOAtqXvGt9Uku4W+IwReCcNcWhUSYMzn9Qlur+3BGrKu48HOoXzf9FVdkrETh7G79Nft4tpS/z2/7kuLXSf9cTcpznQNdANnz2YhiNdaiu3lA/ZN+n6dpUHV1SCsiJjPz8gTvWzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7jx9Zbzh2GGeCJ8VidX7HJtlXOjG6dyxGmsxqjIZ9Q=;
 b=JNIeQxXTG5LMvYVWO13yA8PRipJkDFRUCSZMT25bwNU4oIWwf9vgehmEwRLI4aa4UFIaL4emoAbvQiEhzWL3dHl/WFtpebWl0s7+8cmsbLK8WtH67gIrV30jtSqlIBUkRnKfttlzBNPth5lfeSVGWfFsXaos5H656cMeEmssqXIVOalyy+lpPQQSCK9Uu5NDQe/+HD01ugs9ZStbtcWr1E6zj7WR3aFfMpfDupJE2cuYiM7DGSUlCDIgaN3TSgYPT3ZnbLSPtzx6QvxAVRh/biIAfjqlNPTuipErcUZAeNFgO8we0cDuPai0ymTQp84zD0BLfk48J1WABv0P72Cr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7jx9Zbzh2GGeCJ8VidX7HJtlXOjG6dyxGmsxqjIZ9Q=;
 b=09oTFYY0yxlqMxOa7HajJK7jmG9vt35+a3R1AOZsEuE6JIzCZbyu7Dk/Z400DTGx4U//uewIKb7NcVyJxiG2ZKI9IxPhFJ3wO9kx2t+P8QjLC3sVjiGtfJJ0xox1sqJy3SaEGuAIkQEo/Wd3OUbbw93Dcn91LhsFndurr6eNE7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 15:27:00 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c6ec:8cc8:ced1:1aac]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c6ec:8cc8:ced1:1aac%8]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:26:59 +0000
Message-ID: <13418209-c381-b6b2-ed23-acc0763839c4@amd.com>
Date: Tue, 10 Jan 2023 20:56:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: Alloc high address for drm buddy topdown flag
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com
References: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
 <8f376efe-e19b-d1d5-031d-35df399bb6cf@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <8f376efe-e19b-d1d5-031d-35df399bb6cf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::18) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe2f5b5-2982-478d-1ed2-08daf31f1dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6jtmvik3bdvY3dHDTHsdXmiGWaajnTz4F9DMWILkVaDVbkhgnkzpaMHFoV+bysp7+dy8muUJ2WjsZyh1nZdJA0LasZbK8w/7VzC4bu6FgfJpsigbktu081UiJbM129xjpglm9IyyzOtPKr608UqK6l3S8mhlGJyIcMB62F7YlLvHKszKwhrqxM2UEqbBGY/Ckrppw3f4THAaEtkucbOkar1FlzWsGScdsZgOWkRNy6qghNZEMrZWbS0dZIHGgzhsoFm/PVArl+TOu4jq/MkSCktjc1Sfh+SjkXP3/ZsxZ8la8wTsIwnAJVaMu6caHgZic6a5pX83XxxYBDPQIDjZwsYmtkWuo/O9HiTMg3taWLFHJH8/FMW3+jyDTFhbjJfhxZG03MjeCh0hEyHXXQiDwrWqQ4FW8MlX8BBevzNJAlXDgu5ppgm/vyz5xenhoCYQ5gzq/pmgVy9FI+tWqHibOWqM/f9Xf9XUC8Lkn0vjTjJtgrSUqvujsbyWFCjU+3UzJ9YHQGI5lRBC7wHoKNH5Fk5qKQ+Zge6HxZuQaCtxlEXATUJIJ+uvZ9puI34fSueGFfPFtWqhPqyHRv9j/nnk72k8g+2SpSTroQnU9IzJ0/N5M6iEegk6jrr/vKOnhXIFxk9/ob3YH5zU7IDWlw2LHmsd+pRgYsBUW+SZqZ/fRnJVdd1pmrIDhPj3FumzNy0eAebLV7YpQivKhj3oPiJyEe3ZhREpU4Hbx24HBuhXNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(6506007)(6486002)(53546011)(6666004)(478600001)(2616005)(26005)(186003)(6512007)(66556008)(316002)(8676002)(66476007)(6636002)(86362001)(38100700002)(83380400001)(31696002)(41300700001)(66946007)(31686004)(36756003)(5660300002)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRRTStxaEVNMmFpdkxCeENISno2UXNMdmI2WEtsZW4rSkdOTHlTZm94cnZP?=
 =?utf-8?B?YnRnQ25IOE1sUXF3QzE5SGFYQzRCc1ZhcVlVVWNBSkYzM3F2NW9INmFxeGth?=
 =?utf-8?B?N080YmlZdlB2ZEZUU0Z4aXpDVUxVTTFXZVEvTzF0U2RicEdDbmpZZDZ5aURy?=
 =?utf-8?B?bllEYnJEY05ibVA1UzZia3RpYmFKWHNrQVpWN055UnV5M1RYaXJ2V1pxb2hQ?=
 =?utf-8?B?SXBTOHJuNEF3THpjZmxTcHR6L05VejdBUEJSWS9EODFRc01qTmdJYzM4ZlpO?=
 =?utf-8?B?WndpMllSa0xkTHBESWhBbzVLQ0J4SjRoalJqNERWWHNLOXBlWGs4SFFBdHNx?=
 =?utf-8?B?RWYzZlJnU2hhMlVaUm1PelROK1duSkM5SFJzNTNIdk9qOE5sTlBvYkV0ejda?=
 =?utf-8?B?T1UrRFJiWnZlRlJCMHBHdkxROWx1ZWU1VGZsT3BFNHJsRkZvZnRKMlRaQVd4?=
 =?utf-8?B?V3pPaEd3UHQ2dnUxc3VmQ0ZvYzdOYjYwRzhEcjk2bnUxL3RSWEEzQ0xjOUNW?=
 =?utf-8?B?dTlLOFhnNkJraTFIS3FoeGpGUThyK090MTQrakowdWJzdkthblNXRS9hY3hW?=
 =?utf-8?B?RHVxV3ZuYXlUdlVmb1JIcTZyUE8xU05pTGhsTHhHOHhyN3B5QjlCbGJWRVB2?=
 =?utf-8?B?ajBaQ2ZpOEEyOUI0UWJnSWhMc0hkcVM3bG43MlRXa0MwNEFxN1lCNVNTRUgv?=
 =?utf-8?B?d25URStnMWZaSmJNZHpkVkw1RTlDSGNXVU03YUt6dWZTMkJLZTlXM20yTU9T?=
 =?utf-8?B?dTdsSDN0NUk2OEFMMlpRTXduRDQwOXJzSE9ZbEs4M0FtTEhnUnBZNDZkaUVP?=
 =?utf-8?B?dkRHRmdJWEtGVUMwT1JDTnUzcExjSi9jSlBrazlPZ1U0Z2VYTW1ZdjhQNll2?=
 =?utf-8?B?Q0JBTUNUTzlJZ1UvYytmbVRqZXJUZmw3WDB0aTRRWUptRm16SThKN0xId2t0?=
 =?utf-8?B?WVVFN1pPbnF3dUZDaWx5a3RQRkpKVDE2SUlaaVVmZGZ2dm9TMGtJdGg2Tzhp?=
 =?utf-8?B?TW5UWjBVM1cralJkb3JHdVVsRkx4cU9HdE8wRGJ5SXBTVm9HOFI2OFVLVStD?=
 =?utf-8?B?cXJvVERKeldnY1dTbHQxY0R5eVM4dVI3RWpIb0NncU15T2xpMEJjcFk2V0dK?=
 =?utf-8?B?WDBBbnlpWjFoN0M4U1kzRi85Ky80VXFLQjdDOGtsb2p6Ykkram9YWFRnWkN5?=
 =?utf-8?B?Um9NWk9UMHl1Y3g2VWdLRHRuY21Hc29ZTXNZZHFTRUwxalNNN0IzWlRRMGZT?=
 =?utf-8?B?bEVEbDJxeXpnWmMzMlJWamY4akVYUWU5TDdqQjFSWkpsMlZuR2JWZkpZeXFM?=
 =?utf-8?B?dUNUNmlZZ1orRy9PY3JnVE5iYVpTWmlyaktLQ3EyUWtDT3FkcGZUNkJzdWJm?=
 =?utf-8?B?blRXSCt4d2tTOVU5RzZFdWRkc1VHSjV6V0JlblpMckpDaGE3a1F2anQ1WTNJ?=
 =?utf-8?B?OWo2dUFxYnRoVTFlNE1vbWFJaEJnRzQrQTJ4UnY1aWc4cGdPdkNkbFk4cHc4?=
 =?utf-8?B?amNQQkFVRzVjMHE0b1l3a2J1N09TL3JTZzh5eUZPN0RHU1VLdGM0ZlZHZHZU?=
 =?utf-8?B?cjhLZlRUeCszTGdQdzVjaEF2amg2Y1RCZUlTMFMzR3BQd3dtMk1POVZXQXhD?=
 =?utf-8?B?L1BWdlVkZWN4d3hNTlBWUkJTc3lvTExUOU5sd214dFBNSTVTTndpSmttQ04v?=
 =?utf-8?B?RHVWbEFPRkp2RERtRFpxTGN1cTI4bmhMeXhyNTY0RTI1aWdWSFc0OTU3WnFD?=
 =?utf-8?B?cTBlVG5NU1ZjVVRtZjNpR253WWRWME56ekZrTUNKVGRHaE55MnZJK01TSEQr?=
 =?utf-8?B?d2ZmYzEwL085SStWektBcFQ0TTBwWjIyR1dEblhQeUJ4YXRrK0t0ZHliRE5u?=
 =?utf-8?B?emhzNWZnRnFGZ3FSSzdXbEkrSGE3TTJFUW9KZVRiLzBlNm1CYm9wNnZDRjU5?=
 =?utf-8?B?NzBNbXhucUtCUTBxUkJqT010cWZZWUkrQnBzeW95RGd5OCtqZkJRR1l3b0pq?=
 =?utf-8?B?QmZJYURZcDJaUjhRMVdjdFpzbnNMTVNXYjZLZ0dna0dYZnlrdVFBMHYzVG54?=
 =?utf-8?B?Z08rK0RFNWlWajFBcGZVL2ZJd1NlMGtWM1AwaVpUaytva2c5RWFXaGdkV0ZK?=
 =?utf-8?Q?FqPDYphmp5OFRhGOAr4fwEmBM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe2f5b5-2982-478d-1ed2-08daf31f1dae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:26:59.7425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2f0X1BRhqeym6IJ9WCQ5CakmTrkn6+z9qhl8CyM3KQzWmDqr3X6eLVNe90fKiuq6W++JBlpFzx63QdKk5VKrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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

Hi Matthew,

On 1/10/2023 5:32 PM, Matthew Auld wrote:
> On 07/01/2023 15:15, Arunpravin Paneer Selvam wrote:
>> As we are observing low numbers in viewperf graphics benchmark, we
>> are strictly not allowing the top down flag enabled allocations
>> to steal the memory space from cpu visible region.
>>
>> The approach is, we are sorting each order list entries in
>> ascending order and compare the last entry of each order
>> list in the freelist and return the max block.
>
> Did you also run the selftests? Does everything still pass and 
> complete in a reasonable amount of time?
> I will try giving a run
>>
>> This patch improves the viewperf 3D benchmark scores.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++-------------
>>   1 file changed, 54 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 11bb59399471..50916b2f2fc5 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -38,6 +38,25 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   +static void list_insert_sorted(struct drm_buddy *mm,
>> +                   struct drm_buddy_block *block)
>> +{
>> +    struct drm_buddy_block *node;
>> +    struct list_head *head;
>> +
>> +    head = &mm->free_list[drm_buddy_block_order(block)];
>> +    if (list_empty(head)) {
>> +        list_add(&block->link, head);
>> +        return;
>> +    }
>> +
>> +    list_for_each_entry(node, head, link)
>> +        if (drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node))
>> +            break;
>> +
>> +    __list_add(&block->link, node->link.prev, &node->link);
>> +}
>> +
>>   static void mark_allocated(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>> @@ -52,8 +71,7 @@ static void mark_free(struct drm_buddy *mm,
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    list_add(&block->link,
>> -         &mm->free_list[drm_buddy_block_order(block)]);
>> +    list_insert_sorted(mm, block);
>
> One advantage of not sorting is when splitting down a large block. 
> Previously the most-recently-split would be at the start of the list 
> for the next order down, where potentially the next allocation could 
> use it. So perhaps less fragmentation if it's all part of one BO. 
> Otherwise I don't see any other downsides, other than the extra 
> overhead of sorting.
>
Allocating from freelist is traversing through right side (i.e top most 
address range) and for TOPDOWN flag allocations we just split the top 
most large block once and the subsequent TOPDOWN low order allocations 
would get block from same already split large block
For the normal allocations, I modified to retrieve the blocks in each 
order list from the last entry which has the high probability of getting 
top most blocks as we have sorted the blocks in each order list.
Thus the bottom most large blocks are not frequently used, hence we have 
more space for the visible region on dGPU.

For APU which has small sized VRAM space, the allocations are now 
ordered and we don't allocate randomly from freelist solving 
fragmentation issues.
>>   }
>>     static void mark_split(struct drm_buddy_block *block)
>> @@ -387,20 +405,26 @@ alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct list_head *head)
>> +get_maxblock(struct drm_buddy *mm, unsigned int order)
>>   {
>>       struct drm_buddy_block *max_block = NULL, *node;
>> +    unsigned int i;
>>   -    max_block = list_first_entry_or_null(head,
>> -                         struct drm_buddy_block,
>> -                         link);
>> -    if (!max_block)
>> -        return NULL;
>> +    for (i = order; i <= mm->max_order; ++i) {
>> +        if (!list_empty(&mm->free_list[i])) {
>> +            node = list_last_entry(&mm->free_list[i],
>> +                           struct drm_buddy_block,
>> +                           link);
>> +            if (!max_block) {
>> +                max_block = node;
>> +                continue;
>> +            }
>>   -    list_for_each_entry(node, head, link) {
>> -        if (drm_buddy_block_offset(node) >
>> -            drm_buddy_block_offset(max_block))
>> -            max_block = node;
>> +            if (drm_buddy_block_offset(node) >
>> +                drm_buddy_block_offset(max_block)) {
>
> Formatting doesn't look right here.
I will check.
>
> Going to test this today with some workloads with small-bar and i915 
> just to see if this improves/impacts anything for us.
>
>> +                max_block = node;
>> +            }
>> +        }
>>       }
>>         return max_block;
>> @@ -412,20 +436,23 @@ alloc_from_freelist(struct drm_buddy *mm,
>>               unsigned long flags)
>>   {
>>       struct drm_buddy_block *block = NULL;
>> -    unsigned int i;
>> +    unsigned int tmp;
>>       int err;
>>   -    for (i = order; i <= mm->max_order; ++i) {
>> -        if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -            block = get_maxblock(&mm->free_list[i]);
>> -            if (block)
>> -                break;
>> -        } else {
>> -            block = list_first_entry_or_null(&mm->free_list[i],
>> -                             struct drm_buddy_block,
>> -                             link);
>> -            if (block)
>> -                break;
>> +    if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> +        block = get_maxblock(mm, order);
>> +        if (block)
>> +            /* Store the obtained block order */
>> +            tmp = drm_buddy_block_order(block);
>> +    } else {
>> +        for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +            if (!list_empty(&mm->free_list[tmp])) {
>> +                block = list_last_entry(&mm->free_list[tmp],
>> +                            struct drm_buddy_block,
>> +                            link);
>> +                if (block)
>> +                    break;
>> +            }
>>           }
>>       }
>>   @@ -434,18 +461,18 @@ alloc_from_freelist(struct drm_buddy *mm,
>>         BUG_ON(!drm_buddy_block_is_free(block));
>>   -    while (i != order) {
>> +    while (tmp != order) {
>>           err = split_block(mm, block);
>>           if (unlikely(err))
>>               goto err_undo;
>>             block = block->right;
>> -        i--;
>> +        tmp--;
>>       }
>>       return block;
>>     err_undo:
>> -    if (i != order)
>> +    if (tmp != order)
>>           __drm_buddy_free(mm, block);
>>       return ERR_PTR(err);
>>   }

