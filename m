Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00485D810
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFDB10E72B;
	Wed, 21 Feb 2024 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RZBT93gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6110E45D;
 Wed, 21 Feb 2024 12:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGAz+k9JAWUtb1tA1ToFB9ltmLW1K9pHkSguAsDVSH0U2oElkh+2ehMkXnuV+55VSCFQ16rMwuDnF1xmO6oMHxSQiSM6J0pFGYN0NGNVH5tpI3tH3f4fRdCy6mNoOOUWcfRV2z8yyxI+oESntDPT3PhGcZNDoKS84y9TqQaQdOk3w0xC3cmoOJ95l9xU+YT/dlcdyNr8lPzlwTRa0fBokrclq7A4igM0Ugdt9QTi2j8+T9KkDhSlulr4W/BWnsgpNw1QiqmQeCeXjSoq1IO8LUj87nhp52DPz6JWlCg4QYZVTfwPxFHivYCwZk63vHKoqPwcnnIjYhk1wOP+z3MWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSsG+iT5A3u3wF8ai8yDWmiDJRVLn+1j3FhbDv2iHcc=;
 b=nYeceVfGed3/V0A+IlxBZLiSleovNVPn5Th5CAyO0kt5O1bE24yot6aX2mh0LWeJ9lZIQgmynpHR0LcGz8HHhmaiHIkg4y61dFcmgQMMkTpMIqewkbw2Dhe/tbAoqLLhk+4JmaWq0B+gN92ojIhxqM6aMZk3z//odIdt9rNFDBzjtuKlYgx4AuctOaHLOexxpBsAFm5DE1ff43QNvZgft8ZepBzsPaD2g7nUROdl22Bd3kwCBCPzb+gy9C7VWF4nUYJG+BF+w4Ds7UUyT7CEL2x6M9SM4hHJFytcsUBj99qSz6tdRE/gDFteIKIk2u6lportaOkI4WMHVjcWrGxcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSsG+iT5A3u3wF8ai8yDWmiDJRVLn+1j3FhbDv2iHcc=;
 b=RZBT93gh/aiDhHEamWkeyI0tmLfZMBiVzO3lIQEWkwMLvgYDYZGOeJ28KbPvGa94nTrc5vuiXJvb8AF9vr0snGGEjqb03TBz4pLzLQsAIciuqzyESTOZUiWS7a3TmtefVHPRRT+om56draeC/HMoUbFWWUxBbmzFgQBoicCTys0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Wed, 21 Feb
 2024 12:40:23 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6%6]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 12:40:23 +0000
Message-ID: <a0a9f34f-3c01-4ac1-8295-6dea81a03880@amd.com>
Date: Wed, 21 Feb 2024 18:10:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <09ad8b68-f91a-4ce0-aaa6-1eb29c120a06@intel.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <09ad8b68-f91a-4ce0-aaa6-1eb29c120a06@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b7125a-b935-482b-5ac3-08dc32da4547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOMibosJid0iBKlSqtVnkrs9v70R4495DAYwlHHzKo5gjl5VpO9Mtj2NTi3szD/OfG9Mo/GBetmTf7Hb+Pl14zoFmYaXDDUum35F3xo/Gfcw3r/myRDp1VLxwpNuOVEdbv5+4Heo2PFSpDqRQEZdpWOSF55Bma8HExBWorpQ0NBHKIHHRUGllBjKoJbDce8bGcw5oN1eIqwU6z31ZUa2EBotLKmxhTSdpBtazIYxYic3HPeFBJGNUVYQYTsJB129kEqjrWVrvNEEzzgdA0+Zjn/exNIbjPUjILSjpQLDtlAJabJlItbIQGRox/DP0eCks7n1xlz1VFGPqqArSWMMW1o81odLe3ADNHaEG0nEnU8u4F9sqcFmVdjihaJ+J/95tIiOINCrxUiRiPDHc7vtw9SnT/DZcqGcaOjhXoPDvm8Obq/TC6aCzKW5l0aryF0o+D3HLuSTdD8EQwuER0hi5EKnH/BXmZWp/4r6/e6aZLxs/1x+j1tu2OHfMpDIvhP3m6pIMmZT358omyfPwUM2RWyS2aqYpdbyfQXCIbq+bWmnEwgGs2sANg6ezjDLR6SU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXAzd1BqWGVOSHVCYkdORldPeGU3ZWJZTGh0akdCdHU1a2pnWU0vN3ZYZXNB?=
 =?utf-8?B?UHRpcFc0bk54SllXcmNTQ3BNUUgyN1Q0NXJTaERtK29UVjlodkY3OEpiZU0y?=
 =?utf-8?B?TlJjcG1KM2FGbVV6b25Qa3MrRHRDNUhSYTlHcTQ0dTAzdE9SN081ZVAwWWRC?=
 =?utf-8?B?OVcvOGthSzZEbE13ZXh1MHI5a1FXQ2FsRnByWVNtQUIrSFBQVmh0U2hWOVZh?=
 =?utf-8?B?OUJHTDROREJGdHdsUm8yMTR0UGcwcDk1WllvVkhwdkdXQWhyL2JPM3I0Y0FF?=
 =?utf-8?B?K1BBRG1LSDFnWTM2WkxMYnVmcEVLajJrTnhzaTNWRlh3VlNuem1jQm9DbSta?=
 =?utf-8?B?RE9maVpvQVN4OE9XY0t6ODRUTUJQNWd2VFpXMG9PbHFHWkpQa2ZtUzFmR1Y2?=
 =?utf-8?B?R3VYOEtPS3NVWjQ3bGttSU5YZXo4L1UvRFRjOTY1ekIxczFPN1dXdUlIQWhm?=
 =?utf-8?B?bng4QUNmdHVsL0N1c1p4ajFsNGdJV2lIenErR1NSZk9kcGVzMkF4eG9rY0Vm?=
 =?utf-8?B?NW5IcURqZURBME9yNEUvL2hkRTJodFB4Y0NuOU9JMUQvMmttdkYzMlMrR3Bw?=
 =?utf-8?B?RnQzSDhBY0ZtNDZjRGtmNFlPbVh5Q0h0TXNqbXREeGNpemdiajM1d1ljQVl5?=
 =?utf-8?B?M2ExRHU5alhud1FwZUxPK3RZS1kzY3JRamIwNUV2U3J3dDNNdHJibWdRV3VZ?=
 =?utf-8?B?Vy9Id1AwY2FpQjEvVVpyWnE1bThrM3B4eDQwd1hDRGtNOFlqT1ZSRXVNMlZZ?=
 =?utf-8?B?Y1M3N01IcjdsbEhzWjlydGVvcVhHUEdEUDA1d093UWVvcm9EYVRPeDVNYU9o?=
 =?utf-8?B?T1lRQVplOEpWWldLMWdFZFRFbmxYS25CS3lGdkZjMFlLYkx1dFZsd1pvVEhQ?=
 =?utf-8?B?cUMyM2JsQWt0bWNqZGhXSFJTYW5pV3ZOblJVWnNaS09ad0ZhV1NIeXJGVFIr?=
 =?utf-8?B?dEFXaVc2R0hpVHd6cW8yRjVNWUlLMmk5R294YXl0c2hZMkRMVEpiSnRKd25x?=
 =?utf-8?B?czVQWUFsZS9HNUpDeVJtWmkxV1BoR3F0Z011c3RoNjlLMkZQU3JHUS91ajl0?=
 =?utf-8?B?MGhvODVVY01QWnZZUGhwS3pFcnlDTjVINUpvczV2SmZyYktLWFpoWHlzemxh?=
 =?utf-8?B?RThjbG9iT3dOYUxGKzE5SjRWZWlRQ2FjT0RuSTFDbGRnTE1uZnJsNGx6WTRz?=
 =?utf-8?B?c3g0ZXd4b0htaUIxOWZjU2hIcStwdlJVeXRNWnBOK29kb1ZhNkM0bHF3eFpk?=
 =?utf-8?B?TmFNa0ttNXh1MkJzOVBZcmRCdVlJRE5Nbk5YK0FkSFlXNFFadmdDc0tIbFhO?=
 =?utf-8?B?a3I1dHNtUXh2ZDhldmN0NWl0ZDV5UW10eUJzQzNETUNlT1pEOWdob3duVXYw?=
 =?utf-8?B?U01LbVlaMytWYTRwR1Z4akdoaHFNRE96Z3FYVXpIM3g3UTl4VFFEQ2RrRjZx?=
 =?utf-8?B?M2w4eVFielJTNFhPTFhqRysrM3BQSGVsU0h3YzVaZzJSN0pySVZ6WU84UUw4?=
 =?utf-8?B?Uys1TVN6MEJzNkJXcDVIQVY2Y2d3SUluTnI3Q2hQRVNwV1o0S0ZDMS91K3gy?=
 =?utf-8?B?bGNQalZlaDh3emFhRDBPSUw2WGxTdnU1ZUtJc3JMelRSc21WdndxOGZtenBL?=
 =?utf-8?B?UVJIQU9ZMTFOS0ZZZ3RMVHk4Uk5aZlN1bmVLYk15VnZ0eXg0V3p4enYxelFn?=
 =?utf-8?B?WVNqUWlpb2ttSWJ2UjRXUy9sWkJCbVNYWE15R1FYYk80NlBRMFhNRExpVWZL?=
 =?utf-8?B?OGZhRVN2anV5NDllWkszK2RXalluV2hWV0J6YWU5N3ZXUm5haGRra1A0M01M?=
 =?utf-8?B?RHlwZzdKZktCd2hsNkJNa2dnQy9GSENjVUJyWEkrNTZUcldjREFrMW5HVXhw?=
 =?utf-8?B?cmNkeHR4NlU4RFhNWU1PYlJzSVFiZzd2TmpNMVRnclZTMEY1UHpqM0wyQjRS?=
 =?utf-8?B?eDkyZ2FZMlA4eWdOVDhGaTVNZmpiMHdFY0w3bW4va2pUd0Jxbmk2MW9EREU2?=
 =?utf-8?B?V3FFdHBUOERObDFONXdQYTBRdGRicXFwd0VmcDJCbjk3enl0RGRybmwxUFpR?=
 =?utf-8?B?andKeUFyakFJcE14NTgyS0xpOHhtbnJxbVI3Wkx2bmh5Wll2alpET0R4YTFz?=
 =?utf-8?Q?u92mshm3YZJ4SiFOwgy/jkKBn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b7125a-b935-482b-5ac3-08dc32da4547
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:40:22.9606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VToK4A+wqVoKvA7D/mDSQxtKSZXfJ9ERhnJNgdqxmFQyg5fzT1473FFFfBrT5vI+ALOjKkWLILBwRa+e24HZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233
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


On 2/16/2024 5:33 PM, Matthew Auld wrote:
> On 08/02/2024 15:49, Arunpravin Paneer Selvam wrote:
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
>> v2: (Matthew)
>>    - Add a wrapper drm_buddy_free_list_internal for the freeing of 
>> blocks
>>      operation within drm buddy.
>>    - Write a macro block_incompatible() to allocate the required blocks.
>>    - Update the xe driver for the drm_buddy_free_list change in 
>> arguments.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>
> Probably needs a new unit test.
>
> I think we are missing something to forcefully re-merge everything at 
> fini()? In theory we can just call the defrag routine. Otherwise we 
> might trigger various warnings since the root(s) might still be split.
>
> Also one nit below. Otherwise I think looks good.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 192 ++++++++++++++----
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>>   include/drm/drm_buddy.h                       |  18 +-
>>   6 files changed, 187 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 8db880244324..c0c851409241 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
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
>> index f57e6d74fb0e..33ad0cfbd54c 100644
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
>> @@ -295,26 +318,61 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>   {
>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>> +
>>       __drm_buddy_free(mm, block);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>   -/**
>> - * drm_buddy_free_list - free blocks
>> - *
>> - * @mm: DRM buddy manager
>> - * @objects: input list head to free blocks
>> - */
>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects)
>> +static void __drm_buddy_free_list(struct drm_buddy *mm,
>> +                  struct list_head *objects,
>> +                  bool mark_clear,
>> +                  bool mark_dirty)
>>   {
>>       struct drm_buddy_block *block, *on;
>>   +    WARN_ON(mark_dirty && mark_clear);
>> +
>>       list_for_each_entry_safe(block, on, objects, link) {
>> +        if (mark_clear)
>> +            mark_cleared(block);
>> +        else if (mark_dirty)
>> +            clear_reset(block);
>>           drm_buddy_free_block(mm, block);
>>           cond_resched();
>>       }
>>       INIT_LIST_HEAD(objects);
>>   }
>> +
>> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
>> +                     struct list_head *objects)
>> +{
>> +    /*
>> +     * Don't touch the clear/dirty bit, since allocation is still 
>> internal
>> +     * at this point. For example we might have just failed part of the
>> +     * allocation.
>> +     */
>> +    __drm_buddy_free_list(mm, objects, false, false);
>> +}
>> +
>> +/**
>> + * drm_buddy_free_list - free blocks
>> + *
>> + * @mm: DRM buddy manager
>> + * @objects: input list head to free blocks
>> + * @flags: optional flags like DRM_BUDDY_CLEARED
>> + */
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned int flags)
>> +{
>> +    bool mark_clear = flags & DRM_BUDDY_CLEARED;
>> +
>> +    WARN_ON(flags & ~(DRM_BUDDY_CLEARED));
Do we need this warning? In amdgpu we are using the flags field from 
amdgpu_vram_mgr_resource structure where
the same flags field used for to indicate the CONTIGUOUS, TOPDOWN etc as 
an input flags to the buddy alloc function.
If we need this warning then we should maintain a separate flag for 
setting the CLEARED.
Thanks,
Arun.
>> +
>> +    __drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
>> +}
>>   EXPORT_SYMBOL(drm_buddy_free_list);
>>     static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> @@ -327,10 +385,19 @@ static inline bool contains(u64 s1, u64 e1, u64 
>> s2, u64 e2)
>>       return s1 <= s2 && e1 >= e2;
>>   }
>>   +static bool block_incompatible(struct drm_buddy_block *block, 
>> unsigned int flags)
>> +{
>> +    bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
>> +
>> +    return needs_clear != drm_buddy_block_is_clear(block);
>> +}
>> +
>>   static struct drm_buddy_block *
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
>> @@ -369,6 +436,9 @@ alloc_range_bias(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> +            if (!fallback && block_incompatible(block, flags))
>> +                continue;
>> +
>>               /*
>>                * Find the free block within the range.
>>                */
>> @@ -405,25 +475,52 @@ alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>> +                 u64 start, u64 end,
>> +                 unsigned int order,
>> +                 unsigned long flags)
>>   {
>> -    struct drm_buddy_block *max_block = NULL, *node;
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
>> +{
>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        if (!list_empty(&mm->free_list[i])) {
>> -            node = list_last_entry(&mm->free_list[i],
>> -                           struct drm_buddy_block,
>> -                           link);
>> -            if (!max_block) {
>> -                max_block = node;
>> +        struct drm_buddy_block *tmp_block;
>> +
>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +            if (block_incompatible(tmp_block, flags))
>>                   continue;
>> -            }
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
>>   @@ -440,11 +537,29 @@ alloc_from_freelist(struct drm_buddy *mm,
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
>> +                if (block_incompatible(tmp_block, flags))
>> +                    continue;
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
>> @@ -454,10 +569,10 @@ alloc_from_freelist(struct drm_buddy *mm,
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
>>   @@ -524,6 +639,8 @@ static int __alloc_range(struct drm_buddy *mm,
>>               mark_allocated(block);
>>               total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>>           }
>> @@ -558,7 +675,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>           list_splice_tail(&allocated, blocks);
>>           *total_allocated_on_err = total_allocated;
>>       } else {
>> -        drm_buddy_free_list(mm, &allocated);
>> +        drm_buddy_free_list_internal(mm, &allocated);
>>       }
>>         return err;
>> @@ -624,11 +741,11 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>               list_splice(&blocks_lhs, blocks);
>>               return 0;
>>           } else if (err != -ENOSPC) {
>> -            drm_buddy_free_list(mm, blocks);
>> +            drm_buddy_free_list_internal(mm, blocks);
>>               return err;
>>           }
>>           /* Free blocks for the next iteration */
>> -        drm_buddy_free_list(mm, blocks);
>> +        drm_buddy_free_list_internal(mm, blocks);
>>       }
>>         return -ENOSPC;
>> @@ -684,6 +801,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>         /* Prevent recursively freeing this node */
>>       parent = block->parent;
>> @@ -695,6 +814,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           list_add(&block->link, blocks);
>>       }
>>   @@ -782,7 +903,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           do {
>>               if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>                   /* Allocate traversing within the range */
>> -                block = alloc_range_bias(mm, start, end, order);
>> +                block = __drm_buddy_alloc_range_bias(mm, start, end,
>> +                                     order, flags);
>>               else
>>                   /* Allocate from freelist */
>>                   block = alloc_from_freelist(mm, order, flags);
>> @@ -808,6 +930,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>             mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           kmemleak_update_trace(block);
>>           list_add_tail(&block->link, &allocated);
>>   @@ -846,7 +970,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       return 0;
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    drm_buddy_free_list_internal(mm, &allocated);
>>       return err;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> @@ -879,8 +1003,8 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
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
>>   diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 115ec745e502..1ad678b62c4a 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>       struct drm_buddy *mm = &mgr->mm;
>>         mutex_lock(&mgr->lock);
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mgr->visible_avail += vres->used_visible_size;
>>       mutex_unlock(&mgr->lock);
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a5b39fc01003..d81c596dfa38 100644
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
>
> I guess better to keep this sorted...
>
>> +
>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>
> ...so maybe move here?
>
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
>> +             unsigned int flags);
>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,
