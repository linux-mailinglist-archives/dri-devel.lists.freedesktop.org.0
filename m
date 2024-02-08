Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E777184E478
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311B10E44A;
	Thu,  8 Feb 2024 15:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="baPmPIhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1737810E3AA;
 Thu,  8 Feb 2024 15:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDBVbA4dBjh1BCJJeUq/GB/YOpJdE+v5CIFPM4QBGR/L7XHL7q+puaqvU/RrYuyyWA4F2g6ZvA8WUiBiGvFnqahthrgFRadaP4pwlhpwZKtuyFT30xTo+RaQDw5J9k1Ot/EURDfNjuj7SmUyhVQ8HlYfrYZtws4o7WBiQRoFEKY7FT7KBwEzD7Yy59Ol1tHCquG2s5TzA81i3v8hzFztN7GNvrRlE035azWo5i39wY0OcAL5crbq5wXL2BkKuoLHqCNnC2x2xBnkgpPeMr+inQ6eixFllp7rpMUI18R8lKcZQTtXkkfYgwaV9wlcLByPgAhSviu/EIp11MLU10pgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLaz0TuW94ZQYxejhtqEs7hDNlT1art3v3FY0A+c4rw=;
 b=P1zW+9QQkmbQxbj+K2Ras8O3sx0pHICtrwuyv5s8wg+9PoZm1Q3BoqrMLUj8Mz5xstFSEwhcD7datcKwhYSPxrU4y4X2To9TMgwIa5D9vDXoL2A9T3iUIB4NXeTmEDqFpt3rrSEiBGpKR/ajM++Y3V6swYzfWWx+UltHosQ7oF7sAjXWu+ciLzg+9d2yhwluUzn/8zfh4N+fp4RcwZ32KgaI+MljX/zwge/MNDnMsErwCe1rQPuEDMO3chFPqtQxLXfpOGhyXeUaptw8xT2XKidg+Gmhmtq7ZIDDWBg8/LfX+fwQbcLmiiAOpGzjyxfVR5igYbHe9Gbtx7TOlKrUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLaz0TuW94ZQYxejhtqEs7hDNlT1art3v3FY0A+c4rw=;
 b=baPmPIhnkW1/J9tTS/Xspj7x1HGPpP2Tm8MhwugTGSwzLMzgENbgZrrid9sSQ5CsCC1fE8cIDbde2PgQnKnqGRrMdO+Q4YrL44oflJl7eecfzBehw0/EyDAKY9uOjbye7gfDyW4DUlC10cPhNbuqcP0yYgrUC5U8CGUAi3HmjHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Thu, 8 Feb
 2024 15:56:11 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 15:56:11 +0000
Message-ID: <f13d40e3-8a33-6cee-a972-81d3515aea63@amd.com>
Date: Thu, 8 Feb 2024 21:26:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com
References: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
 <a9ff4f53-52d2-4b0e-aedb-eefdcc92f931@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <a9ff4f53-52d2-4b0e-aedb-eefdcc92f931@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::31) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: f176ffa9-8020-443c-948a-08dc28be7873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBhS2oVmghk9hO0QbqncFifPJt/guE7BR14RGGchlGg/oVZ+iVmzm42qLF5nt+m6tOQpWuz+CnKdlZ3XzCaEvA9av7q8awYC0SryWdtXklkGXoPZv1xHRZrcr71ti8n+MFHp1bJJIm5SocqmNziv7OD3x2ECOFRV0nCnfXpI21FTVXOaoy7962225Kx7+KqkYgQ+NNA57cT4CPcWvnmKIs+E744izaS1ULiDnorctBVYbF6Zx1xZmNAQEV/LGpn6sHWLa3FW2RicChXtkE4ac4My1Ih8H+pY42Ovafp92TW1II79KJxLQG0hXui1sjerCjgkpsq8lZOLO0Bu+Aar/RWdqNjQOAZRKvRw67/u+21Qiw+K/05LEo4aJV7m/S/tHqRak+x5LQeYnsyZwWTZ7E6kRLYck6tE2EL8u6+CPh2n/8T9CgD9UoXK3cTIbo0vfdwvqTtuXrlgFh+wsnfLMBbSxooKikG8bAQsAMFZQmPsNdDypeAoUCC1+iSQLwfwwViqD5l8fgRNDGP/1hdl9EcN+S/aVAS29sYigAEMnPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31696002)(41300700001)(6506007)(53546011)(26005)(6486002)(478600001)(6666004)(2906002)(66946007)(8676002)(30864003)(66556008)(6512007)(316002)(66574015)(966005)(5660300002)(83380400001)(38100700002)(2616005)(31686004)(86362001)(8936002)(4326008)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHlCL2E2MHd3LzNxR3Y5eTR4UjQzM1ZZMnZhMVJ1RG53SUF0eTFWSzJKaTE5?=
 =?utf-8?B?NjI0b2JLcll4ZHNXZ2IyMHpvUnlsUUJYV0Vhd29ZZkluc1NhN0lXdHNzYjZ3?=
 =?utf-8?B?MUZ1UWNJZnh0OHF2WGlxMEc2M0RpRzJqS3ZaS1dHM2xTNEpIdGxESWJhOVdG?=
 =?utf-8?B?dlp6WTM2d0ExeStTSkJtNHYrOWs5ckk0TTBXYmViTHU1OUI0MkJVcjZNVnpL?=
 =?utf-8?B?RUhla3dISFMvaEFIdWJWRWJVT1JUMzA2RnByWGJkSnplNE5odkZkWXgyNW1D?=
 =?utf-8?B?SjRpSHRIR2twOVB2c2hMUnkweHdDOFJWUEY1L2hCVEhESTdRTzlwZDU1TTlB?=
 =?utf-8?B?NHRWK3JKMm1aVVloZHJGM0FvVEQvYkZ6YnlZcUx5WGlSWlFESjRGK1AxS2tv?=
 =?utf-8?B?Y05TeDdCYUtNSHdZNWRLZXd4eUdIak5oeWNWQ0JPSVRrVUNtb2NwSk13WE1Z?=
 =?utf-8?B?NjU2UzVkVEhhT0FxNzNqQSt1cTJINFRYL1BxQXhSbllHS1N0aFlEWTBxUXBF?=
 =?utf-8?B?cFN5WGVwdG5rMzVIZ3hOWDFUZ2liUy9Oc0pYQklaYlB1S2czMFVCSkFicTl5?=
 =?utf-8?B?eW5Qdis2NHYzV2hOUEFMc1MzUHY3c2ttclNPOC8xb1prRmgrV3hlNFJqazlH?=
 =?utf-8?B?QzFCeFUzQ25GQnBRZ3lub040OVN6SmxPTmZtYXZXdis3dFI0WEZGVDEvVDQ5?=
 =?utf-8?B?TzZrVktjZmRWaEk5TDkyM0VNUUFBQms0NGI0L1pPaW8yNkk1aDgxemIyWTBp?=
 =?utf-8?B?NW9GTTdocnROTnkrZXhoYlcvNmFkOUZOa08zSTYvc21WODZ0Zi94THZUNGJa?=
 =?utf-8?B?L3FqUUdUcVNKdmJmSkxvcEtiZ3NVTDdoTmVxTzdodEswMFFIeGgxMDRQR0ZK?=
 =?utf-8?B?b2czOEd6eHRLd3RyR0FzamlZNVZrb1BZeHlxWUxncmFxbHd1MTdiMGE1MGZH?=
 =?utf-8?B?OEgvaE5Mb3pHT2dXZkc3amVUL0VzQTBsQm9YTnJHV25OaEREalY5clFYUThh?=
 =?utf-8?B?Z2pjTVdwSmVIVDFWYjRtZitjRjBGU24wUkxwWWhrSlJ5c3lSb3Zhakt4LzNy?=
 =?utf-8?B?MXlERGVsSFhlaTZZZWh5eE5JUEZmSWI2aklzY3lZMkhBNjF4TkJJLzAxRUlV?=
 =?utf-8?B?dDRpTWs5Z2ZodGkrVllGc2hpTjl2SnBaM3YwdlpDVzQxa0FkQWJGcTEwSVJZ?=
 =?utf-8?B?TXBoV3Q0eEUrai85WXJNMk1vT1drb0hyNjc4KzVFSjVKNzNxcmY2RFdWei9B?=
 =?utf-8?B?TzVEOUovbmM4K2RXdWNoTmpTd0ZodnVGUG1uQlkvcE8yV2xZSmlHZW9GMFBq?=
 =?utf-8?B?cTEzV3J5ZkhjWjdNdVJjWERmY2VkYmI0S2ZtUGRVOGdtVW90YWlzL1ptbkYz?=
 =?utf-8?B?cGVuTHJSVW0rR0JTUzVTOXVzRVpqSWFiTXo4aWhkeDRlUlpwYUptaTJoamVR?=
 =?utf-8?B?RTlPZGNENzFNSFo0Q2N6eE93MHplL3l1SFVaNE81eVdhcitTYjNSdmlLZDlH?=
 =?utf-8?B?VllPcjlSb2lEOWxUTE4xMW1HOThYYkF3TmFDL3dpdlNsdG5LNmFXekxFNTBj?=
 =?utf-8?B?N2tjaS9YQk80VDJZR2xwbnVRZVdjQWNhbGhHTEp1bzBEU2Y1aWxQazFOU3Q0?=
 =?utf-8?B?UGRwQ0RsaWptNDJuV04vS28veGkzTmhqR243d2x2RFhKM2tVd1BUOTRiTmlh?=
 =?utf-8?B?ZDQ3MVlFeUNYRFNhMmN2WmY3NXRFakJVRG80WnZiZWVOZ21KeENML1pzOHRV?=
 =?utf-8?B?b2ZZcGxEL1B0b0dUY3paVHZWamRlY2dFVEZvVDRvYTZ5bE00cVBMZnRMbzUz?=
 =?utf-8?B?L00zYmRrMlRxZFNUNjNlWGdDdkZGR1ZWRkxsKzVOZ21DWWJuakFuVWZOSHY2?=
 =?utf-8?B?MG1pSFNkejNQK3Z4UGV1YVFIdm1INHFnYjFqZkowd0dPMFhyc2hRWm1YUW1F?=
 =?utf-8?B?NjNESjFyYXI4NXRFSUcxQzBINnF5TU5DNm83SmFVZ1hwSkFkRUZTSUVJZXds?=
 =?utf-8?B?L3AwczBWY3o4aFZjVmY4aThDbEwzNlZpQjdRKzJ5RFR6R0RXakU0dzJkYk11?=
 =?utf-8?B?OUdXYkorTzIzU1VHaDdyVzZ5N2MwMVp0QlZnVjZYdlhPbjhSZ21KRytHTzRU?=
 =?utf-8?Q?7crUwiUlz9+UvFtPpNEhDkts/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f176ffa9-8020-443c-948a-08dc28be7873
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 15:56:11.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5e0gxu3opU+/HP8DMlxBBY6G8fytKHUm8pq2GnwQb/EG5jbvWir3ixBvW16rOrYXPFJFtXj/he1WcH+s9pU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897
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



On 1/31/2024 11:52 PM, Matthew Auld wrote:
> On 30/01/2024 19:48, Arunpravin Paneer Selvam wrote:
>> - Add tracking clear page feature.
>>
>> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>>    successfully clears the blocks in the free path. On the otherhand,
>>    DRM buddy marks each block as cleared.
>>
>> - Track the available cleared pages size
>>
>> - If driver requests cleared memory we prefer cleared memory
>>    but fallback to uncleared if we can't find the cleared blocks.
>>    when driver requests uncleared memory we try to use uncleared but
>>    fallback to cleared memory if necessary.
>>
>> - When a block gets freed we clear it and mark the freed block as 
>> cleared,
>>    when there are buddies which are cleared as well we can merge them.
>>    Otherwise, we prefer to keep the blocks as separated.
>>
>> v1: (Christian)
>>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>>      cleared. Else, reset the clear flag for each block in the list.
>>
>>    - For merging the 2 cleared blocks compare as below,
>>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 169 +++++++++++++++---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>>   include/drm/drm_buddy.h                       |  18 +-
>>   5 files changed, 168 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 08916538a615..d0e199cc8f17 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -556,7 +556,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -589,7 +589,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> @@ -897,7 +897,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
>> *adev)
>>           kfree(rsv);
>>         list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, 
>> blocks) {
>> -        drm_buddy_free_list(&mgr->mm, &rsv->allocated);
>> +        drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>>           kfree(rsv);
>>       }
>>       if (!adev->gmc.is_app_apu)
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f57e6d74fb0e..d44172f23f05 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>>       __list_add(&block->link, node->link.prev, &node->link);
>>   }
>>   +static void clear_reset(struct drm_buddy_block *block)
>> +{
>> +    block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>> +static void mark_cleared(struct drm_buddy_block *block)
>> +{
>> +    block->header |= DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static void mark_allocated(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>> @@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
>>       mark_free(mm, block->left);
>>       mark_free(mm, block->right);
>>   +    if (drm_buddy_block_is_clear(block)) {
>> +        mark_cleared(block->left);
>> +        mark_cleared(block->right);
>> +        clear_reset(block);
>> +    }
>> +
>>       mark_split(block);
>>         return 0;
>> @@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>           if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   +        if (drm_buddy_block_is_clear(block) !=
>> +            drm_buddy_block_is_clear(buddy))
>> +            break;
>> +
>> +        if (drm_buddy_block_is_clear(block))
>> +            mark_cleared(parent);
>> +
>>           list_del(&buddy->link);
>>             drm_block_free(mm, block);
>> @@ -295,6 +318,9 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>   {
>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>> +
>>       __drm_buddy_free(mm, block);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>> @@ -305,10 +331,20 @@ EXPORT_SYMBOL(drm_buddy_free_block);
>>    * @mm: DRM buddy manager
>>    * @objects: input list head to free blocks
>>    */
>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects)
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags)
>>   {
>>       struct drm_buddy_block *block, *on;
>>   +    if (flags & DRM_BUDDY_CLEARED) {
>> +        list_for_each_entry(block, objects, link)
>> +            mark_cleared(block);
>> +    } else {
>> +        list_for_each_entry(block, objects, link)
>> +            clear_reset(block);
>> +    }
>> +
>
> Can we not merge this into the list iteration below? Thinking we also 
> should try to not trample the clear bit here for "internal" freeing. 
> Otherwise internal free will mark it as dirty everytime. Or is that 
> intentional?
we can do it. I missed it for internal free
>
>>       list_for_each_entry_safe(block, on, objects, link) {
>>           drm_buddy_free_block(mm, block);
>>           cond_resched();
>> @@ -328,9 +364,11 @@ static inline bool contains(u64 s1, u64 e1, u64 
>> s2, u64 e2)
>>   }
>>     static struct drm_buddy_block *
>> -alloc_range_bias(struct drm_buddy *mm,
>> -         u64 start, u64 end,
>> -         unsigned int order)
>> +__alloc_range_bias(struct drm_buddy *mm,
>> +           u64 start, u64 end,
>> +           unsigned int order,
>> +           unsigned long flags,
>> +           bool fallback)
>>   {
>>       struct drm_buddy_block *block;
>>       struct drm_buddy_block *buddy;
>> @@ -369,6 +407,15 @@ alloc_range_bias(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> +            if (!fallback) {
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    if (!drm_buddy_block_is_clear(block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(block))
>> +                        continue;
>
> Maybe wrap this into a helper?
>
> Also looks like we missed updating Xe driver here.
>
> What about something like this (completely untested):
> https://gitlab.freedesktop.org/mwa/kernel/-/commit/bf71cd468796dfab2ac40318aa323b6e1f31e4a2 
>
I merged this patch and sent v6 for the review.

Thanks,
Arun.
>
>> +                }
>> +            }
>>               /*
>>                * Find the free block within the range.
>>                */
>> @@ -405,25 +452,58 @@ alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>> +                 u64 start, u64 end,
>> +                 unsigned int order,
>> +                 unsigned long flags)
>> +{
>> +    struct drm_buddy_block *block;
>> +    bool fallback = 0;
>> +
>> +    block = __alloc_range_bias(mm, start, end, order,
>> +                   flags, fallback);
>> +    if (IS_ERR(block))
>> +        return __alloc_range_bias(mm, start, end, order,
>> +                      flags, !fallback);
>> +
>> +    return block;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +get_maxblock(struct drm_buddy *mm, unsigned int order,
>> +         unsigned long flags)
>>   {
>> -    struct drm_buddy_block *max_block = NULL, *node;
>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        if (!list_empty(&mm->free_list[i])) {
>> -            node = list_last_entry(&mm->free_list[i],
>> -                           struct drm_buddy_block,
>> -                           link);
>> -            if (!max_block) {
>> -                max_block = node;
>> -                continue;
>> +        struct drm_buddy_block *tmp_block;
>> +
>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +            if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                /* Find a cleared block */
>> +                if (!drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>> +            } else {
>> +                if (drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>>               }
>>   -            if (drm_buddy_block_offset(node) >
>> -                drm_buddy_block_offset(max_block)) {
>> -                max_block = node;
>> -            }
>> +            block = tmp_block;
>> +            break;
>> +        }
>> +
>> +        if (!block)
>> +            continue;
>> +
>> +        if (!max_block) {
>> +            max_block = block;
>> +            continue;
>> +        }
>> +
>> +        if (drm_buddy_block_offset(block) >
>> +            drm_buddy_block_offset(max_block)) {
>> +            max_block = block;
>>           }
>>       }
>>   @@ -440,11 +520,35 @@ alloc_from_freelist(struct drm_buddy *mm,
>>       int err;
>>         if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order);
>> +        block = get_maxblock(mm, order, flags);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>> +        for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +            struct drm_buddy_block *tmp_block;
>> +
>> +            list_for_each_entry_reverse(tmp_block, 
>> &mm->free_list[tmp], link) {
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    /* Find a cleared block */
>> +                    if (!drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                }
>> +
>> +                block = tmp_block;
>> +                break;
>> +            }
>> +
>> +            if (block)
>> +                break;
>> +        }
>> +    }
>> +
>> +    if (!block) {
>> +        /* Fallback method */
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>               if (!list_empty(&mm->free_list[tmp])) {
>>                   block = list_last_entry(&mm->free_list[tmp],
>> @@ -454,10 +558,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>>                       break;
>>               }
>>           }
>> -    }
>>   -    if (!block)
>> -        return ERR_PTR(-ENOSPC);
>> +        if (!block)
>> +            return ERR_PTR(-ENOSPC);
>> +    }
>>         BUG_ON(!drm_buddy_block_is_free(block));
>>   @@ -524,6 +628,8 @@ static int __alloc_range(struct drm_buddy *mm,
>>               mark_allocated(block);
>>               total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>>           }
>> @@ -558,7 +664,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>           list_splice_tail(&allocated, blocks);
>>           *total_allocated_on_err = total_allocated;
>>       } else {
>> -        drm_buddy_free_list(mm, &allocated);
>> +        drm_buddy_free_list(mm, &allocated, 0);
>>       }
>>         return err;
>> @@ -624,11 +730,11 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>               list_splice(&blocks_lhs, blocks);
>>               return 0;
>>           } else if (err != -ENOSPC) {
>> -            drm_buddy_free_list(mm, blocks);
>> +            drm_buddy_free_list(mm, blocks, 0);
>>               return err;
>>           }
>>           /* Free blocks for the next iteration */
>> -        drm_buddy_free_list(mm, blocks);
>> +        drm_buddy_free_list(mm, blocks, 0);
>>       }
>>         return -ENOSPC;
>> @@ -684,6 +790,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>         /* Prevent recursively freeing this node */
>>       parent = block->parent;
>> @@ -695,6 +803,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           list_add(&block->link, blocks);
>>       }
>>   @@ -782,7 +892,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           do {
>>               if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>                   /* Allocate traversing within the range */
>> -                block = alloc_range_bias(mm, start, end, order);
>> +                block = __drm_buddy_alloc_range_bias(mm, start, end,
>> +                                     order, flags);
>>               else
>>                   /* Allocate from freelist */
>>                   block = alloc_from_freelist(mm, order, flags);
>> @@ -808,6 +919,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>             mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           kmemleak_update_trace(block);
>>           list_add_tail(&block->link, &allocated);
>>   @@ -846,7 +959,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       return 0;
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    drm_buddy_free_list(mm, &allocated, 0);
>>       return err;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> @@ -879,8 +992,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct 
>> drm_printer *p)
>>   {
>>       int order;
>>   -    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB\n",
>> -           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>> +    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB, clear_free: %lluMiB\n",
>> +           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, 
>> mm->clear_avail >> 20);
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 0d735d5c2b35..942345548bc3 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     err_free_blocks:
>> -    drm_buddy_free_list(mm, &bman_res->blocks);
>> +    drm_buddy_free_list(mm, &bman_res->blocks, 0);
>>       mutex_unlock(&bman->lock);
>>   err_free_res:
>>       ttm_resource_fini(man, &bman_res->base);
>> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct 
>> ttm_resource_manager *man,
>>       struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>> +    drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>>       bman->visible_avail += bman_res->used_visible_size;
>>       mutex_unlock(&bman->lock);
>>   @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device 
>> *bdev, unsigned int type)
>>       ttm_set_driver_manager(bdev, type, NULL);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(mm, &bman->reserved);
>> +    drm_buddy_free_list(mm, &bman->reserved, 0);
>>       drm_buddy_fini(mm);
>>       bman->visible_avail += bman->visible_reserved;
>>       WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index ea2af6bd9abe..e0860fce9ebd 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -83,7 +83,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>                                 top, max_order);
>>       }
>>   -    drm_buddy_free_list(&mm, &holes);
>> +    drm_buddy_free_list(&mm, &holes, 0);
>>         /* Nothing larger than blocks of chunk_size now available */
>>       for (order = 1; order <= max_order; order++) {
>> @@ -95,7 +95,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>       }
>>         list_splice_tail(&holes, &blocks);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -190,7 +190,7 @@ static void 
>> drm_test_buddy_alloc_pessimistic(struct kunit *test)
>>         list_del(&block->link);
>>       drm_buddy_free_block(&mm, block);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -236,7 +236,7 @@ static void 
>> drm_test_buddy_alloc_optimistic(struct kunit *test)
>>                                  size, size, &tmp, flags),
>>                             "buddy_alloc unexpectedly succeeded, it 
>> should be full!");
>>   -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct 
>> kunit *test)
>>                           drm_buddy_block_size(&mm, block),
>>                           BIT_ULL(mm.max_order) * PAGE_SIZE);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a5b39fc01003..f7311b59f2b0 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -6,6 +6,7 @@
>>   #ifndef __DRM_BUDDY_H__
>>   #define __DRM_BUDDY_H__
>>   +#include <linux/bitfield.h>
>>   #include <linux/bitops.h>
>>   #include <linux/list.h>
>>   #include <linux/slab.h>
>> @@ -25,15 +26,19 @@
>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> +#define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>> +#define DRM_BUDDY_CLEARED            BIT(4)
>>     struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>> +
>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>>   /* Free to be used, if needed in the future */
>> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>>       u64 header;
>>   @@ -86,6 +91,7 @@ struct drm_buddy {
>>       u64 chunk_size;
>>       u64 size;
>>       u64 avail;
>> +    u64 clear_avail;
>>   };
>>     static inline u64
>> @@ -112,6 +118,12 @@ drm_buddy_block_is_allocated(struct 
>> drm_buddy_block *block)
>>       return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>>   }
>>   +static inline bool
>> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
>> +{
>> +    return block->header & DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static inline bool
>>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>>   {
>> @@ -150,7 +162,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>     void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>   -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects);
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags);
>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,

