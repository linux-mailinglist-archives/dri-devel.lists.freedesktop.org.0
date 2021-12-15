Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A44763AF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28810F9E5;
	Wed, 15 Dec 2021 20:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1C010F9DD;
 Wed, 15 Dec 2021 20:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbdQU0rZ95wc83WtPUC2oImfQWaGXoImPXj9VdCE3Ks9KHBdiFRvTx0yIadOAjD/oK5R7rTF8lv14e//In0y7IgOttyhLGwM919dpGHX6+qwRM07Q7/uYooU+HsX+yXf2LwEYNs7qz5/crdBHko7IhyeKIClgstEMtqm5fY+bPYEAgrsSHwn6WNvRme8UeZ2FGjUcKa0HPKkJFxIjV+33kESqJJ8yDQallRAHKlKX9IdETkbjAEGZufcB5oAZpx36xb3Tv9sOamGp0VBSLytp17LLa8Gzom+7SgkENSkTdt4KpwU18vHSBy1oeETyKFV1lYJGT0eLlYYatp052ym8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oheb/aNEVboMIGiSRS6J45pDmBDvu/FcwPYPqkkke4A=;
 b=QHEps6M5j2Tudk5ZV1b64k/31i8pHkz1c913iQLLuhRse9fYvcoNDOFsLpSN6q4GYbTD9N7JkLAk5c463crQIr/fh/Ka1APML+bOhGUP0ydQvT+RiPnxxucvqgmgyImw0MwXPh6tYSDSJLF35l7/q+jbNxxVCaqFBIq8Y79Fsq3WVRtEH5nlKiWrYvg5CiqqHElyoBm+9EthQlwSNFIBgz6OyKQ9Wue/X2Ev6/xs7se0pXSzvlMQ2NEW3czHsS/9IzYsPXVsHBrqy64nMWO4dq0iN2kMnkuMMTn9ilr2Y6D44PuT8xEtvLb2fpLMuM1Lx6yOpggnkDF+TTLWOZHt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oheb/aNEVboMIGiSRS6J45pDmBDvu/FcwPYPqkkke4A=;
 b=4SmdqLAcuekJikJtyu5tOrP1mSQnYyQL9U1y0EbMuda3nwJKZESY78CnX3MxPbM0nA1fWB2A7nabhRyCIjc1aGdi8W+4tdE2vsTAWmi1D+aCE74J88mejRMs8foww8IboBzqeIj1br3Vl15Fb5FkzAU17M5BMy7frxJSr/vlxVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 20:47:38 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 20:47:38 +0000
Message-ID: <1767cd81-b254-d4c3-db6c-b00336bf712d@amd.com>
Date: Thu, 16 Dec 2021 02:26:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 4/6] drm: implement a method to free unused pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
 <d73bbe41-f295-8da6-5395-ce59ffb6bab5@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <d73bbe41-f295-8da6-5395-ce59ffb6bab5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::16)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79cb56f4-f583-4dca-8084-08d9c00c20e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4783D3539CC119E42E8FF348E4769@MN2PR12MB4783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHrbr1wVUKezx+MLJUtgB+PRqW/DTYcJGZ3Eonort3W7Ii5FkydEXHErmm43UQQwZT2eQU+vOr/i5L9zDUur7NGq0kD5inZh6Ur4tHdVdhHE7AlQSO+iw8xgEBKpkpftFjLoZwHZElAixe5XxfH34sk7SCwO/p85BtWfnXjcc4D/GXzsgso5c9Z53u8WyiJ8oDQ9tB3gPxX616vF2iIzJ+WCn7Hmmzj9adJLIn9FzAvP/ernm1RaLExSMu8tGCZo/5HvTMpcWFpaOxedtvoIfDXcrzhzLfceGtHfbVN4fYdES0pK8ZoT2gWno4T0Xj/2jDbiMM+E9kj9eSnbbO+DrLPJ8TMoTRF22VGYR+Y/n0sec8hYSF8AtIXz89DWp2C3iSsHqVLagT9S7QRwWsp7NM86FNZ/6sUkLusE7GWGTX9lSKo8G9lM8fiE3F93KD5+WXdu4u2pmHaMAjRj7KIJwfVaIqZ60jDrK6IvtmApihgzrMqGTni7tsgAA8cYuPgwMGKDuxHk7kYiN01/KO03/+KBJFl1UfXfHJ+mte+vn16Y0zaLhivftceLQ3wz6MzPW40Pl/LbK7ccYwy5zVNvgzxxgkzAwyPzycrmBoF9dJdhCHu7yemTFxsem2aBjhP0ZQA4q+EobQKCV5/emSwodLIHEl3GvU0KVO/0FJB2AzP2O1pfdW/MhBWM2HXbYM7+HK+C5QCCOLnn5S50HhCWcDBZOXcjBZ1WCMVLb78ZARw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(186003)(8936002)(31686004)(36756003)(508600001)(6512007)(6486002)(31696002)(86362001)(66946007)(53546011)(316002)(6506007)(5660300002)(38100700002)(4326008)(66556008)(66476007)(26005)(8676002)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFld2NwZ0YxQ2JXR3J3QnFVM1BNMHNnQnFBMUNOQVhQQlpOMTVSYXJtazRx?=
 =?utf-8?B?SnFIZ3NGRkVpcWxEY2hMN08xY3RwQVpEMTNyZVcwYmtFYTB0TVhGb3pnQ05r?=
 =?utf-8?B?YlFRZUVBa2FMeFhuM3VsMjhjdGVqVnZ3MzczaHEwT3Y0SSt6a251bGoyV3Rh?=
 =?utf-8?B?V0ZDM045WHc2bDcwY2tIRHJacjBuMm5EeHZ3bE93cnpCN1dJM0tBRG9pMURs?=
 =?utf-8?B?K0VmazA5V0F2Vlp3Ry9WK3c5cFdUSzI0VTM2bE1FOUZrUjlpZVFGc0pESnor?=
 =?utf-8?B?OGQ4Q2ZHNDV6TEJySHFVSGlzRGJYYk9tUGcwcVpBT21KTnR1NFROSHI5Vllk?=
 =?utf-8?B?WmtMQzBJSWN5KyttQWJVelUyLzYrNG1YMTZFL21OSmJieEVNQ1A4eGsrZVIy?=
 =?utf-8?B?YWE2c0JoZVk1OW5tSUp2eDUxVkErOVBuYVpPWmcwOUNRdlFJQi9mcUVOUEZy?=
 =?utf-8?B?MkpOWXJaNThWMUJtRkxOWVpWRHZkMjNWZDN1V28vNWpTbW1seVF4VWttUmNR?=
 =?utf-8?B?VnlVc2xFU3JQMnNOOWFhdXJFaG90dkJQRW5YZ1FQMnM1eG1BdzA5RmoxK0NX?=
 =?utf-8?B?QnROZXA1RFRCN2xRYm5sQlJ3dVBIam0wSm5rL3kwUlRWM24vNmlxOFJIcktz?=
 =?utf-8?B?S0JxZnVUVEVsL2FWZHVzeDBwU3ZqNnpLNTBjdVJhek5wSEFjb0FLcXgvRi94?=
 =?utf-8?B?T1BZUU9iZzFBNkJ5L2kwUXBJc1M1NW84Wk1HeUk3Y1hCZXFoS0xLbGdRcVpa?=
 =?utf-8?B?S1g1Zm8xSW9WSDNBcmZ0R1FRNHR0OGVicDlOaGNqQUttQ2R1cHBlc0FSWktC?=
 =?utf-8?B?b3N6eDA1UDk2L1cwbnNOM2I1Yk0vZldBbVh0RUE2RmJvdmQvcDVINnJodFc1?=
 =?utf-8?B?V3NqYWNHTy8vSzZVU3AvNG5JTFBjL0hhbjE5RDdlU2VvVFcvUHVsNjg0THZn?=
 =?utf-8?B?RGp0K1BMbGd4V0xFbWNUdzIxcW9GcVoyd0JVWmtwaVpveExucXN2Vmxaanpl?=
 =?utf-8?B?OUVTZGJkb3hqYmVaQW4rcGw1MW9zUTQwOHlUU3h4NnFHU2E2em1UaWpMMyt3?=
 =?utf-8?B?MUVmRm9TbWVzSFZLd1duR2hSQWVsYVg4K040RnhFd2w3ekVTNmphSEpKQkNW?=
 =?utf-8?B?QmxZSVA1VytQUko5djVGcVNHaWcwRTV2REEvenVEdkJHQm5pYmJ5RzZScjB0?=
 =?utf-8?B?ZlJsdlRra2tDNk5xYlhJSXVONFVxeEdhUFJCajZnZjExbllFQjYyM04zOEsw?=
 =?utf-8?B?cncvMkRvbTNNaXZHTlozUmFFcWhzZ1dncDEyNXQvWGVGcVJ5a2tOV0RVaFpQ?=
 =?utf-8?B?VWZ2cHZBZi9abUMxZ25qTUZ4VlIxNkVqVXpnVWJtS0t0MDRoR1BCbU81cVd2?=
 =?utf-8?B?b0NoR2ZQVjhuTEQycEVKWmE2VGIwL0hubWdnbWxTQ1hGWkFERkhWRXZHV3VT?=
 =?utf-8?B?WC96V3B2RFRVcjFvcXdvcCsvaFpHNDVSRDBpNE4zQ2dMQ1ZEZ2FGMk1FcUMv?=
 =?utf-8?B?NFJjWkRCMHVOS3U1ZXNwUTBjb3NPMXp3S2lhK1JRTXRzNzcyaUR5RnJBWjNi?=
 =?utf-8?B?czZ6L1BkL0sxdG81bXVMbTN2MTF6WE0xZHdKSExOVmZXMmZ4VExPTGJtcTkv?=
 =?utf-8?B?eUJzd25MM0FKd1A3eFNUKzFvSXpDeTR1enRDY0JKUGhPeFd2YmRydGNWbmhm?=
 =?utf-8?B?dGpIRzZCd1YvQ1oyV1I2ZWplbFpjYzNFOU52WS9xTE5OVnlkMjJvR3REZklU?=
 =?utf-8?B?aVVweElFWjVnc3lKV1QzZ3BPajZRYXVIRzlUaStaWitCRmo4Tjk3ZkFUL1VT?=
 =?utf-8?B?aFBpOGRyZnMwam5XRFlxQjZ5ZmVPQS94NytaOGRqVXNKSjdkdEg5VUNVSXpy?=
 =?utf-8?B?dWZOa2IwMzExV3hxcFNmOFloTk1nSk5oMjczSW8ySkVtMnR1bHF1WVFaSW1H?=
 =?utf-8?B?WE1DeFcxRlFVdklnOU5nbytMWVNmYmVKcWFNVUFBN3NMUnQwbXNFNEdkclV4?=
 =?utf-8?B?L1NoRnF2bWNWK3NCbmo2SzR2anJMaU1XZlJubkNScWIzOFdkUGJrNC9Id2Mv?=
 =?utf-8?B?WktxQ3I3TG9IcFRoZEdIRFF5QlJtSFd2NmhCNmVUaXVKT0M0bHZjNjNiY2Rv?=
 =?utf-8?B?Nm1oU1dBaXIwSXAzWjFVVk9QdlJESk1qeVpIcUtaZGpKcVJrdjgxSGllSjlK?=
 =?utf-8?Q?zvxsUguoep646IS41ttcrzA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cb56f4-f583-4dca-8084-08d9c00c20e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 20:47:37.9479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwuVlf8njA3BDKS+UnB9C0ivxEDE04bxdJ7B7/aYxuaMRl4BT7hK9rbWjQhS51bv3zaaPE0/2+WamxYh5t9XEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/12/21 12:10 am, Matthew Auld wrote:
> On 01/12/2021 16:39, Arunpravin wrote:
>> On contiguous allocation, we round up the size
>> to the *next* power of 2, implement a function
>> to free the unused pages after the newly allocate block.
>>
>> v2(Matthew Auld):
>>    - replace function name 'drm_buddy_free_unused_pages' with
>>      drm_buddy_block_trim
>>    - replace input argument name 'actual_size' with 'new_size'
>>    - add more validation checks for input arguments
>>    - add overlaps check to avoid needless searching and splitting
>>    - merged the below patch to see the feature in action
>>      - add free unused pages support to i915 driver
>>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>>      are all globally visible
>>
>> v3:
>>    - remove drm_buddy_block_trim() error handling and
>>      print a warn message if it fails
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 72 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
>>   include/drm/drm_buddy.h                       |  4 ++
>>   3 files changed, 83 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index eddc1eeda02e..707efc82216d 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -434,7 +434,8 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
>>   static int __alloc_range(struct drm_buddy_mm *mm,
>>   			 struct list_head *dfs,
>>   			 u64 start, u64 size,
>> -			 struct list_head *blocks)
>> +			 struct list_head *blocks,
>> +			 bool trim_path)
>>   {
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy_block *buddy;
>> @@ -480,8 +481,20 @@ static int __alloc_range(struct drm_buddy_mm *mm,
>>   
>>   		if (!drm_buddy_block_is_split(block)) {
>>   			err = split_block(mm, block);
>> -			if (unlikely(err))
>> +			if (unlikely(err)) {
>> +				if (trim_path)
>> +					/*
>> +					 * Here in case of trim, we return and dont goto
>> +					 * split failure path as it removes from the
>> +					 * original list and potentially also freeing
>> +					 * the block. so we could leave as it is,
>> +					 * worse case we get some internal fragmentation
>> +					 * and leave the decision to the user
>> +					 */
>> +					return err;
> 
> Hmm, ideally we don't want to leave around blocks where both buddies are 
> free without then also merging them back(not sure if that trips some 
> BUG_ON). Also IIUC, if we hit this failure path, depending on where the 
> split_block() fails we might be allocating something less than new_size? 
> Also if it's the first split_block() that fails then the user just gets 
> an empty list?
> 
> Could we perhaps just turn this node into a temporary root node to 
> prevent recursively freeing itself, but still retain the 
> un-splitting/freeing of the other nodes i.e something like:
> 
> list_del(&block->link);
> mark_free(mm, block);
> mm->avail += ...;
> 
> /* Prevent recursively freeing this node */
> parent = block->parent;
> block->parent = NULL;
> 
> list_add(&block->tmp_link, &dfs);
> ret = _alloc_range(mm, &dfs, new_start, new_size, blocks);
> if (ret) {
>      mem->avail -= ...;
>      mark_allocated(block);
>      list_add(&block->link, blocks);
> }
> 
> block->parent = parent;
> return ret;
> 
> That way we can also drop the special trim_path handling. Thoughts?

That's a nice idea. It will work.
> 
>> +
>>   				goto err_undo;
>> +			}
>>   		}
>>   
>>   		list_add(&block->right->tmp_link, dfs);
>> @@ -535,8 +548,61 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   	for (i = 0; i < mm->n_roots; ++i)
>>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   
>> -	return __alloc_range(mm, &dfs, start, size, blocks);
>> +	return __alloc_range(mm, &dfs, start, size, blocks, 0);
>> +}
>> +
>> +/**
>> + * drm_buddy_block_trim - free unused pages
>> + *
>> + * @mm: DRM buddy manager
>> + * @new_size: original size requested
>> + * @blocks: output list head to add allocated blocks
>> + *
>> + * For contiguous allocation, we round up the size to the nearest
>> + * power of two value, drivers consume *actual* size, so remaining
>> + * portions are unused and it can be freed.
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_block_trim(struct drm_buddy_mm *mm,
>> +			 u64 new_size,
>> +			 struct list_head *blocks)
>> +{
>> +	struct drm_buddy_block *block;
>> +	u64 new_start;
>> +	LIST_HEAD(dfs);
>> +
>> +	if (!list_is_singular(blocks))
>> +		return -EINVAL;
>> +
>> +	block = list_first_entry(blocks,
>> +				 struct drm_buddy_block,
>> +				 link);
>> +
>> +	if (!drm_buddy_block_is_allocated(block))
>> +		return -EINVAL;
>> +
>> +	if (new_size > drm_buddy_block_size(mm, block))
>> +		return -EINVAL;
>> +
>> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (new_size == drm_buddy_block_size(mm, block))
>> +		return 0;
>> +
>> +	list_del(&block->link);
>> +
>> +	new_start = drm_buddy_block_offset(block);
>> +
>> +	mark_free(mm, block);
>> +
>> +	list_add(&block->tmp_link, &dfs);
>> +
>> +	return __alloc_range(mm, &dfs, new_start, new_size, blocks, 1);
>>   }
>> +EXPORT_SYMBOL(drm_buddy_block_trim);
>>   
>>   /**
>>    * drm_buddy_alloc - allocate power-of-two blocks
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 7c58efb60dba..c5831c27fe82 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	if (unlikely(err))
>>   		goto err_free_blocks;
>>   
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		mutex_lock(&bman->lock);
>> +		err = drm_buddy_block_trim(mm,
>> +				(u64)n_pages << PAGE_SHIFT,
>> +				&bman_res->blocks);
>> +		mutex_unlock(&bman->lock);
>> +		pr_warn("drm_buddy_block_trim failed returing %d for ttm_buffer_object(%p)\n",
>> +			err, bo);
> 
> 
> IIUC this prints a warning even for success? Anyway, I think we can drop 
> the pr_warn, since normal user can't really do much here?
Yes, I will drop pr_warn
> 
>> +	}
>> +
>>   	*res = &bman_res->base;
>>   	return 0;
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 316ac0d25f08..90906d9dbbf0 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>   		    struct list_head *blocks,
>>   		    unsigned long flags);
>>   
>> +int drm_buddy_block_trim(struct drm_buddy_mm *mm,
>> +			 u64 new_size,
>> +			 struct list_head *blocks);
>> +
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>   
>>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
>>
