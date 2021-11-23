Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8F45AF16
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 23:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E10289ABA;
	Tue, 23 Nov 2021 22:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEA489ABA;
 Tue, 23 Nov 2021 22:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6xgqyvmZ8q7DslLuk6tlWe36ZOdQABvSATkMhFXKFcwsClQRS9c227S18mNJIy5gnypvwuBAutsRAUZBBKPjVKtkUtTWl0c1OxdM9zdSjoEObxRf8PLkVhads1V1n+2cRdCi4/sRhsaqvcRhi5e0Ez1NwYEPw7MWXspwB1H0n+PAAKeRT7HKXMjjIhrW8/mUriBVbGEphGDFBACQwDcXwogypvVAmIyW/+T4ND15GKQkTGjjKVzZ8qKHf/DopijjyzGzqGVWy8M2pUyGEZMbfCTO5xzbqmmECh+MidcZorsYaw25ivRlQUX9iRRua0+RgVjpu9exetwlrAMmFQ6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6Ew+kx3ZGTGb1uPeFg9nTAj00AcpxTGiCaSjMq0ao8=;
 b=VqHNiDcmQh+fNNIbPK27njsKb0DKHdmKGksYu6N7YoK5ZENgLdrt7fEUOICBOtGHEw0MkitzfPGXbCeLN4VsyWje0LlFJX8GHAc+zAkF8Jdg49omu1CHpXP34mzJTBHTC0YVS9jYtESGBy0mGrhhaea40y0CgORVjUZTeUqulwBVNF4OWVSrizz+Fhjpyln94wVqW5/Q4yoUSiqUwIjepAJYFNJridXMSVGvv0+7nR41ns79eAlAG20jTJRcQenrpQIcBUEufI0gIzo6pNmE60skNLrcz1Nq852nZXZvKbnQxuD/M1Maav+mVH1u6fesF5XrBfEkYuPj0Rl4H84cGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6Ew+kx3ZGTGb1uPeFg9nTAj00AcpxTGiCaSjMq0ao8=;
 b=JLNHvfjxARX0p9Hxjbo4DzhWKRu8wC67yVdz9iZogQNp1ulWLgUPtSlQv9BhLzIZgDZ6cY4RMrOYIYwvCIRO3WsCUgiY+fjjWNPLl9iJStjF7Nn+xIrQWsfH4P9VPyWpjQq0P0lR5YGmhu3P+Xz430AiUb3Hhul1wYfRBU6IXmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 22:31:00 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 22:31:00 +0000
Message-ID: <01edd5b1-aa75-4d95-287d-66561c4505e0@amd.com>
Date: Wed, 24 Nov 2021 04:10:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/6] drm: implement a method to free unused pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
 <20211116201807.147486-4-Arunpravin.PaneerSelvam@amd.com>
 <70b5facd-06cd-2400-dd94-1090fe3da7d6@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <70b5facd-06cd-2400-dd94-1090fe3da7d6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::28) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BM1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 22:30:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f0a4e04-a0b1-4394-45a3-08d9aed0ecea
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41255568F830963573F370A1E4609@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72HdfAKWO2UNBZJMjwQrcitIWnvLrpWhGWu0h4YxPBId38rZzAZt0qWQlFJWdtovItSa21MCYDnhpI6UyCasM+nLGJy3Cja90Rwbd4l4G3YrrBdCDg6M4jbdcEKd3fWZhnZCeCLCY/y0mP0aKd6PRCvvcZK+64aBBKZKTueGNC4b3WUBoKwP3uLJN8jKwm3ciT1Wq9oNkdORb4oB6ia/KMAZilkR7uH1KJugMGwqPClXLoF4YvgEWXCaNymtpI20sxFooYJWkXNmhIXbLpLfvX8DGFagbSaNOlKF+Gl3Q8NaTLONN7KYfifNGCPhELWY55wsMZCzhkuoFQXvHLH0FbwAuwX152g4dwuWzmkPYbOJR9KSygmoVwGwpEQInHGK1xzgdRIFJL2MWdhCO1LUkMe/m+yfzojPaOfJrBQSFy+TTLx6wte14ajm5uvdd0KXGeajKEqDoGFbCXmCczYFaAVXoKjSgIOH7jDeJeP5t85qP+zLI7mji+IG2GstbLEnuuH6L4OkvJT/IcKzsRYJTN02eUTm01nB2cshiE5g13NLgf6s2dM7voWxsAt5gyiA8GPVq5MtbO3phfXUc9rXzsXPF8rb4lUA3XKm0UpeklDCaz/YycNT57eWRicgCGKDCdG+yz431X6oZGg7B3YUclYn4sGBfva+QneMApdndGuKeHP7jEN0tCie/MpDMU+LGlZ68UbUxA5+hX8a5Ljtgh1Dkct6CIasXlzIJtMuvu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(31696002)(8936002)(2616005)(86362001)(5660300002)(316002)(16576012)(36756003)(66476007)(66556008)(38100700002)(26005)(6666004)(956004)(8676002)(2906002)(53546011)(31686004)(83380400001)(66946007)(4326008)(6486002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dlY3duSVV0djkvVHV1MzJGeXhoeEI2WEJFaGV1RWk2TnJhWlNtMHZxV0V6?=
 =?utf-8?B?TDl5MS9BMXdXeU1kZU9nTUtIcjZjR05qdUtzRzhTZTFwaS82NjdiVXI2QTcr?=
 =?utf-8?B?ek16RXVpQnNxQnMxR2xlS0g4dUxiZ0ZTUG5sYkliS2MxaWpWMFZHY3VwRWdR?=
 =?utf-8?B?K1E2V09zQ0ZSMnJLVnU5VW1UNjZic1gyL1lYZ3praERGWjRETTJFZzkwQTBB?=
 =?utf-8?B?aUtXSE9nejNKQUNpaHd2VGxlL0hwRmVBLzJNWmtvaWRGNEFPVGpjMFAzY3Iy?=
 =?utf-8?B?bmtGcG9WSkJuWUN4bXpoZEQ0QTRqbkJGVUU2SVVLcC95M0ZhR1lEazMrTGhm?=
 =?utf-8?B?dDg1aW0xSEFISllzd3huYVdtN01uZFhmMjkzOWU3bkhpZFozOGdZZDZvMFc5?=
 =?utf-8?B?U0U0bngzUVo0WmkwcFRPMkNQS1lIU0Rsei9QNW8xcWcrY1VXUWN2T2xrYm1n?=
 =?utf-8?B?a2RjTURWYnlUSkhyeDZrenAyYUhuVk1jTFhDemdPd3VtL01PT1ZPTldCV29C?=
 =?utf-8?B?ZDAyc0VLdisrVXFXTHVnVlh5eFJxQnRhdHhjelZtWmN0c1c4WjBsNDl4UFZH?=
 =?utf-8?B?RXBIempvZ3dlT0hWNno4Q2JmcTk1Z1NWOUZ2dDUxQUFjRzhSV2pxcElkaXhl?=
 =?utf-8?B?anpYTk11V2JyS0J3MDNES3NnM1MycTlmL2d4aEhxdEpoWXlveklOTTN2RnAz?=
 =?utf-8?B?eWY0SGtOY0hBYXowbFRuMkV2UkFyYUtJNFl4cDcrVGdqb005cmtrK0xOYU5z?=
 =?utf-8?B?d0FtSWU0OXNBb2ZpbTVvUzlQWkxmVVZlbVBRVUdXelJHd0JScFBtQ1pON3Bi?=
 =?utf-8?B?cll3MlJOanBDemlobzBXRGFxTjdlRDlhWUpybjh3cytBOG5GUFZWYy8rd2lm?=
 =?utf-8?B?MzBMMlg5dE92MVpQY3dBTU9HR1dKNHV3UVMvOXM3NUErSWJBc09oVVVKU1Iy?=
 =?utf-8?B?ZlVzZktLamllNTVWalZDelAyWWhDRTR1VlRqaDNkR1RaYS9Uc1BZRVlhdVNH?=
 =?utf-8?B?Ynd0QjFOOE16dG1xblQrV1V0RHNpTk1SK3hkc1VabFY1dHMvWEgzcnNGMlpQ?=
 =?utf-8?B?RUpBdnQyelp4eUFhUldLVXllKzJRWmtnYzZXcU1WUHg4WGk2YnhpYnc4dk0z?=
 =?utf-8?B?a1VJV0sxUG95NlZzdkFqSWdUWEhlVHFwNmNyQzV3cGtXbm1kbDVvTHNOY2tp?=
 =?utf-8?B?WDJnb0R3TitLNDRIUUNkTUwvWkhOVnJPYXM1UWlUN2RRYVpwWUUxSnp2YjVD?=
 =?utf-8?B?ZWZ1UFA2Q3R4NEU5YlpuTFJYRlBPSmVFK0Y0MnIySUp6S1BiNkd1UEFTb05E?=
 =?utf-8?B?NFlmamdnU2xUVmZTRkg0RjZlRUlHaUFpb0pjK21PNGdXVE1Ua3hZZW0vWlRS?=
 =?utf-8?B?bjFuYkQwMU5QaXYyMEFlcE13aVI4UVRud3JFcXVDRlpxdVRyQVdxZnp5RlJp?=
 =?utf-8?B?SC93RHh0QlJGYm9DaFpXVWFXMEdRUmliT3VaRDQ1dm12L1F3ekJBc2VWU2tj?=
 =?utf-8?B?NkU4MjJJbHFZajVodXluclNjQk5JRlArc1ZlNmdxVzIrQklFeXFHK0xtS3k3?=
 =?utf-8?B?Y0JCRWNsNU9kR3lyS0EvTEM4MjJDWWw5bGMzRGJkVUVhaThPRDB2cC9qOEh6?=
 =?utf-8?B?UHFzVlA1Skl4eFhBNFZYMThGTHdNeFkyS2pHT1lmbkt5MkNWVklvaHAvUnV0?=
 =?utf-8?B?SkdDZ2lGZEFyY1BhVU9qMnpDNjlmUTVKZS9OcUZWSXhOOGZhTDAvUGQzVE1C?=
 =?utf-8?B?WDh4MktqNDhsdEZBTEJvblJvRFo1aDZFc0tkemZtRFlNOW1wdDJvUmM5NXFo?=
 =?utf-8?B?QTJ1OGlldDZyQmpoV1dyVGxrVlh1SVNlbFZqQnh0RjZldEl6a3JTSGJ5b3dN?=
 =?utf-8?B?SjlpVS9GTTJyQkxmUVZIOVNTTzhDYnU4OWdzc3RRdm1kMXdDeEtRUGhpVFdQ?=
 =?utf-8?B?RUpqRTAxbklwcWtvdVRZYWRpOE5PaVRqYmFLeGpXSW45OHRYZFhWdEZuckRN?=
 =?utf-8?B?TitzZllhZjFQcFpPeTA4QXFJSmVBMy8vNXp1TDduQm4zVEZzN0g1MWxweis5?=
 =?utf-8?B?MUovdy9rZzVHYVZKM3JiQ2xyL3BLM0g4a0ZScldzUkRKZkVaY1hnMDk3VlVS?=
 =?utf-8?B?QVFqSFl0ckVDNVJleDRQd2dMcW1WZWg4QU1jUVF0d3JoNnJONEpGMEQ4RUZx?=
 =?utf-8?Q?/YakxURnzXfi7naJoy6jB/4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0a4e04-a0b1-4394-45a3-08d9aed0ecea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 22:31:00.3590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE4fNCXfcK2tFfUyzfaVcvjuzD+CnZideKyAK1NHQLl//NkY6HmCd3etnHffKs12ZkDEnIxKUHvNlpuT047Vmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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



On 18/11/21 12:32 am, Matthew Auld wrote:
> On 16/11/2021 20:18, Arunpravin wrote:
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
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 108 ++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  10 ++
>>   include/drm/drm_buddy.h                       |   4 +
>>   3 files changed, 122 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 0a9db2981188..943fe2ad27bf 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -284,6 +284,114 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>   	return s1 <= s2 && e1 >= e2;
>>   }
>>   
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
>> +	struct drm_buddy_block *buddy;
>> +	u64 new_start;
>> +	u64 new_end;
>> +	LIST_HEAD(dfs);
>> +	u64 count = 0;
>> +	int err;
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
>> +	new_end = new_start + new_size - 1;
>> +
>> +	mark_free(mm, block);
>> +
>> +	list_add(&block->tmp_link, &dfs);
>> +
>> +	do {
>> +		u64 block_start;
>> +		u64 block_end;
>> +
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		if (count == new_size)
>> +			return 0;
>> +
>> +		block_start = drm_buddy_block_offset(block);
>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +
>> +		if (!overlaps(new_start, new_end, block_start, block_end))
>> +			continue;
>> +
>> +		if (contains(new_start, new_end, block_start, block_end)) {
>> +			BUG_ON(!drm_buddy_block_is_free(block));
>> +
>> +			/* Allocate only required blocks */
>> +			mark_allocated(block);
>> +			mm->avail -= drm_buddy_block_size(mm, block);
>> +			list_add_tail(&block->link, blocks);
>> +			count += drm_buddy_block_size(mm, block);
>> +			continue;
>> +		}
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
> 
> Should always be true, right? But I guess depends if we want to re-use 
> this for generic range allocation...
yes, since we re-use this for generic range allocation I think we can
keep this check
> 
>> +			err = split_block(mm, block);
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	} while (1);
>> +
>> +	return -ENOSPC;
>> +
>> +err_undo:
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy)))
>> +		__drm_buddy_free(mm, block);
>> +	return err;
> 
> Looking at the split_block failure path. The user allocated some block, 
> and then tried to trim it, but this then marks it as free and removes it 
> from their original list(potentially also freeing it), if we fail here. 
> Would it be better to leave that decision to the user? If the trim() 
> fails, worse case we get some internal fragmentation, and the user might 
> be totally fine with that? I guess we could leave as-is, but for sure 
> needs some big comment somewhere.

Agreed

would it make sense to add a bool type input argument, so that we can
skip the split_block failure path in case of block_trim().

__alloc_range(mm, &dfs, start, size, ... bool trim)

err = split_block(mm, block);
if (unlikely(err)) {
	/* I think we can add big comment here for trim case */
	if (trim)
		return err;

goto err_undo;
}

> 
>> +}
>> +EXPORT_SYMBOL(drm_buddy_block_trim);
>> +
>>   static struct drm_buddy_block *
>>   alloc_range(struct drm_buddy_mm *mm,
>>   	    u64 start, u64 end,
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index b6ed5b37cf18..5e1f8c443058 100644
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
>> +		if (unlikely(err))
>> +			goto err_free_blocks;
> 
> Yeah, so maybe we could in theory treat this as best effort? But I guess 
> unlikely to ever hit this anyway, so meh.
so I understood that we remove the below 2 lines
if (unlikely(err))
	goto err_free_blocks;

would it make sense to print a WARN msg
WARN(err < 0, "Trim failed returning %d for ttm_resource(%llu)\n",
     err, &bman_res->base);
> 
>> +	}
>> +
>>   	*res = &bman_res->base;
>>   	return 0;
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index cbe5e648440a..36e8f548acf7 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
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
