Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6B4516CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 22:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F2B89DA6;
	Mon, 15 Nov 2021 21:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D8A89D89;
 Mon, 15 Nov 2021 21:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmhHE/IShPdcbANwBga0B/tUi3sijK2sPg9/09hJO7c3tZpxqLaEr6YISHa35R36msvgqLh6o0pWsTqS6wZphRJyUPMHyHw1V4v/r8kX3t1Mz1epAmzNLWrYvyp6RwK2a5NOcA0H9HM1nCzRSEYQOsh+Wfso4bNyvC+Gl6+mMeI83sFE+yRxfvr1Jv3dVc7U80myf/wWfQa47lj6iMkUux0YfZzvdNkjMHOt2mKd9qR9VeCfDGObNIcdtd39RKp4hd5HKQT0j7uN0ElX5Iy/cSYbObMx8G94NuRv4G6LeSwP9hKVcaAvsRZOHs06apZRq0j98DvsT+7FgicIOBdECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ1UgOFepbgBY1dYMX50rizilKasxHx86BVxnh+x1co=;
 b=HRydhuTXILI4X7rTcx8RJipNpw8jJ7AfJwNJwjFqIXY3cqXP4yieKP1TvTppC9srqJepi0MpRn6KfK4LhRAore1CWK0O9HaN/AgFTEW3sx+26dM17Du6IBajwMvdJpS/uAvTUzgU4a5MmBMqddGq+94ScMM1M4faFwM+nxT/neljBE8FgqfUTiwDGYovi1kA4B9c9TCJGKicIPPu/Qxx64t3cZI6zv47tt4FIRamNwlGW72zZtL/Wrb70XAEwD0Z1bYO5qTFbq0ya5IvO8zusTohRiV/ftmToOmfAdtuKknkSOsyLickvd1DmvhA6useNB+Ju0pDaNSHnPotwFxyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ1UgOFepbgBY1dYMX50rizilKasxHx86BVxnh+x1co=;
 b=4bZOGLgP/Uyd97Llgu5m0oaOmBs6m+a80+gu+qJ4yWLS4+NwhXVAVtjTa5Xgo984DusazCgnELOexHRjUBwm5/vG64+RiaBWh/Fy08YqVMDJjN+vRaPENcsDDgv9Br+KeI3bgpwgP6PXWTKnRbYEFKwZCihfJ4F9A78q+hgkiYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 21:42:51 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 21:42:51 +0000
Message-ID: <2b40f5e4-25ed-06f0-b380-0ca083b4ffd6@amd.com>
Date: Tue, 16 Nov 2021 03:22:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Arunpravin <arunpravin.paneerselvam@amd.com>
Subject: Re: [PATCH v2 2/8] drm: improve drm_buddy_alloc function
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-8-Arunpravin.PaneerSelvam@amd.com>
 <781f4204-ec6b-7094-a96b-0f4c196ffaeb@intel.com>
 <868400cc-7a48-6420-5c58-cf976f91ab7d@amd.com>
Content-Language: en-US
In-Reply-To: <868400cc-7a48-6420-5c58-cf976f91ab7d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:98::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 21:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad3402c0-62eb-428b-b613-08d9a880df5e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255F8424CF4D11C1D78B270E4989@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3P0UaVyWuQUIGWYlC9x5xNyCwblaeOqLFXdUb1nkUOapsudRUyjk5ZEbKTm46iQ6zgNbAa+W5QGD+W/xFyAzBI9BlwtcL57hnLvj7IATSgJtldz/rDyIHRwkGrYsskMYYTUhAxAhJkW9EAiuLeceyymqCheqTuxRyZFEOMHFHUH4MSZiSEPVa+9WbSMb2tzHI+tTJVyuZHAntIQLSt1zT0D5R9egJYqnFhEyyM8jNjP5sc5CUHDLYiPWbkpETJhkcdIfJiYVu2dT1rHbymAXtGPUSVrU3CXja6UDyYeli4poknkfVboSmovy1rOaA5THsWMbS4UDqiSkJ0ruYgne5BSH2CQpW8b8BbgjGHVGLsxc3pi+4MWMzz5O4uJAKPQvzM6YYT++StFsc2fWP+/bncWr8BZpKb86pjWUSYhIwabe+IpNO5GC0Y2wBveNLFymCFTrRwcSiNjeyVLz1dpY8myH7Y4ceY/qQ00tfX0NWHgcqQDrwZd03r0dTPRP5B58idSCNz6SG4DsYYT2t7PmRkzmm1vQJWxKOWCHZObWgupaEQ7WqX/CDpLy+Ty/R61m0N1AblpDt+P6P271SfcfrHj0gCG1UKw3S6k9DHyavJyIVB9pAQpekwRTET/DbJ+R2PxUKJUqvdu+T+hwonAcEZhVK82Tsle3qda3d+sA3ThJj1UPrp1Vo/GFowgKlGDr2ZSm3aciCpbRsrW/IwlXiMGYr9LSdyXOXFtFIIOzXPDWuctULMWLMJtlyOarAmz1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(8936002)(86362001)(16576012)(2616005)(5660300002)(956004)(8676002)(36756003)(2906002)(6666004)(316002)(38100700002)(26005)(186003)(6486002)(83380400001)(66946007)(508600001)(66556008)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5DczNTQTQ1QlhoRWpiNXRkWkVzdWx5UmJpVURxUGExREIwM1BwOXJHN0RX?=
 =?utf-8?B?QW9yQlIzQlhwUXdEL2Q4WmRJLytWejNEcVRTUUZjb01UNmJCSDdXYkRQRVBr?=
 =?utf-8?B?dGVSa1pHWDdiTFJXbzczMzdZNStKaTlwaXZyRGtDTHBFdW1sZXFyUUpIQ2cw?=
 =?utf-8?B?R213SGRrYkJhcHRJL0NWZm5iZGJGcFc2eE5hcnB3TXVmTWFhSXRLbi9IWTd2?=
 =?utf-8?B?bEVXZjcrUVBCNkZkVmNZR0VHU1hNVUVwYjFab0J3WU1KZVVGbVRubk9XK3pC?=
 =?utf-8?B?UW1Na3dvTy9HOGNvd0gwcE5PVkJpcmlDS1RwRkV3R0FNeTRCaUVwa0ZrYldy?=
 =?utf-8?B?TUd4a2puRit1c3BscTdwcEpPOGhwR2xCVWxWTEZnZTlwOGtna0tsYWxDRjhh?=
 =?utf-8?B?MGN0eFFpQkRac2xJamNvWlZpTkd6Q2lOZXJMd0dralZJbDl1T0dHcG4xUzRV?=
 =?utf-8?B?NUJFWWRuV01OTS96bjhFakJKZkxvNnZTeU9INy9MaHp3QVcwMHRURzFobTlQ?=
 =?utf-8?B?MytKY0NxZTNYUndJUy81QWtuK24wN252ZUVaWHBKZWlhRTJ4VkVLaGVYM1Rl?=
 =?utf-8?B?KzRDb05TeXJuUG55N3RVYU5OK0JuclBIWkd4T1ZkcmZaVnFvQjF1UmVxUW5Z?=
 =?utf-8?B?NVhIY1VqVGladktselNaTnZQWS9XZUpmcFJSdEJobUduT0VEQnY1VFpESzR1?=
 =?utf-8?B?eUtueW9ZM0RBMlc0MjBDZXdoYmZIdGhPbkY1aWg0eEx5bTRVdE9kVFdTamQ3?=
 =?utf-8?B?ZXVnWTVrSmcrdmxTOEFxTzhoWjdRSTBnaWpRT2gxY1JMMEpMQnplY1ltVHVu?=
 =?utf-8?B?Z3M2WUdSOU0rTjhyejR2MVZqT3pEUS8yaU9lOUlxQ2VCMkNldGQzcGhaL2oz?=
 =?utf-8?B?MEZ2SjdvbXVZVWlNRG9zWnlCSDRxM2FOUFJmVnFIa1MzclBuTlUxN1loR2dF?=
 =?utf-8?B?b1BWM01SbXFuNmVlNnkvR2tlK2dEc1NsY3MyZ2V3UFU5WEtVK1hndWRMQ0tK?=
 =?utf-8?B?Rlg3cnhDcy84VjkyWHJvWHVQRmMzeFQySWdPTFpKQ1ZNUHVwU2JNeDRNWnBV?=
 =?utf-8?B?REpkTHZmK1BnVnhrS2xiV0FRYTcyempqTlVZc2NEK050RVJPSWlyZDFzYkJm?=
 =?utf-8?B?aU5wMi9aVjBlZ25OVlkvNnpwQ1lRcWZ3L1hBOGdKU3FEa1YyengzbWs4NDFS?=
 =?utf-8?B?dWlSaUJ1aUU2alJIVDBUUWFqQk1xd3R5elFaSURWVm5JV2ZnK00rNklwajVu?=
 =?utf-8?B?NENrSnZEV0lkVEkvTkFPRkNRclNXMDlPTWgvOHRUekJUMUV2ckNRek5RY0k3?=
 =?utf-8?B?NlVsZmxCYldsaENJUjd6Q3N5dlYydWFNL3FSZFY1QlBIZjF6VFFDR20rTVBL?=
 =?utf-8?B?elVWbWRjRnRieXRUQlg4N3dmY25jVW1jdmRHUFhFRk4wQ09ZdWNRWTMvTjgy?=
 =?utf-8?B?K2l6aEY2NnpzV1BvdEdzR3BmSlQxU3A0KzdMdmZaYjM0NWtqUEpyZ3liUE5o?=
 =?utf-8?B?VVoxN0pTVDlOTEpKODZ4cWdEQjBob0xEU1BxVWVucnpRTUpmR3dhYVFrSWEr?=
 =?utf-8?B?SjRXcVgyZkNsWms1SXlqYUdha1dWdjJrRllkbWc4U0s0TzZ3ODlYdzRnNnQ0?=
 =?utf-8?B?YnVQSmhBUlBKOWpEdmJSZEROdWFaVDRTaVYxVjBOTGV4c3VDMVgraDh0Ui9V?=
 =?utf-8?B?Z0V6QlVtdXNpYTdvSkFLcG9zUFpGcVpkY3FmK1habGY2UTJRL1FxZDlQa1RC?=
 =?utf-8?B?UFYvWEw0S3JQV2N5YnA2bmtNQ055Uzl3cTNpZjZZOFk4OUZpSjdFeE9VVTA1?=
 =?utf-8?B?aUlqY3YrTWVmdSsxNU9oZ1FTMDBXSVBJZjVYVy8vSEJOZHNyelBnTmJkbzJh?=
 =?utf-8?B?YVhUNWJndlZUWFZTWFk2cFY1dHdMUTdtOXBhbkI5OGlaR2Nyb1hUQVMyY2R3?=
 =?utf-8?B?M25ad2N0Z2w2UHBEMklOakp3cmk1blhSOStOK2c5M1Q3czgvR1FDSFlRSHMy?=
 =?utf-8?B?dDV0LzlsOVdEWlpzT2dMNG05Zk1GMFRwblBGNzE3a0ZpMHZFSFpZbnBiT0pN?=
 =?utf-8?B?M2t6RGZaSzlaUkRLNER5MFdHNm5NRDhuZmtNdUhWSXBQTDRERXlMM0t0TENm?=
 =?utf-8?B?Mm01NjhUSkN5WTNmUmdMVUpCUmhRaTVRREJ4K1YzdHptaEhnVGZESVdZS0lS?=
 =?utf-8?Q?M0Wk7NWEWpG67j9xURFlj+Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3402c0-62eb-428b-b613-08d9a880df5e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 21:42:50.9688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osSlwijzH504Qwmiq7WAb773LUtdLHuL0BlLlm20b1GcSi3Vod+QWe/OZ3MxLuRg96MIXyyRqfYePQXTOtfCuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
I am preparing version3 of the buddy allocator,
Please find the updated comments.

SNIP

>>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>> -			  struct list_head *blocks,
>>> -			  u64 start, u64 size)
>>> +static struct drm_buddy_block *
>>> +alloc_range(struct drm_buddy_mm *mm,
>>> +	    u64 start, u64 end,
>>> +	    unsigned int order)
>>>   {
>>>   	struct drm_buddy_block *block;
>>>   	struct drm_buddy_block *buddy;
>>> -	LIST_HEAD(allocated);
>>>   	LIST_HEAD(dfs);
>>> -	u64 end;
>>>   	int err;
>>>   	int i;
>>>   
>>
>>>   		if (!block)
>>>   			break;
>>>   
>>>   		list_del(&block->tmp_link);
>>>   
>>> +		if (drm_buddy_block_order(block) < order)
>>> +			continue;
>>> +
>>>   		block_start = drm_buddy_block_offset(block);
>>>   		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>>   
>>>   		if (!overlaps(start, end, block_start, block_end))
>>>   			continue;
>>>   
>>> -		if (drm_buddy_block_is_allocated(block)) {
>>> -			err = -ENOSPC;
>>> -			goto err_free;
>>> -		}
>>> +		if (drm_buddy_block_is_allocated(block))
>>> +			continue;
>>>   
>>> -		if (contains(start, end, block_start, block_end)) {
>>> -			if (!drm_buddy_block_is_free(block)) {
>>> -				err = -ENOSPC;
>>> -				goto err_free;
>>> -			}
>>> +		if (contains(start, end, block_start, block_end)
>>> +				&& order == drm_buddy_block_order(block)) {
>>
>> Alignment looks off, also && should be on the line above.
> 
> [Arun] ok
>>
>>> +			/*
>>> +			 * Find the free block within the range.
>>> +			 */
>>> +			if (drm_buddy_block_is_free(block))
>>> +				return block;
>>
>> Would it make sense to keep searching here, rather than restarting the 
>> search from scratch every time? Would it work if we pass in the total 
>> size and min order?
> [Arun] yes, I will rewrite this function

I tried to rewrite the function, AFAIK, in case of end bias allocation,
we have to restart the search on every new order computed value from the
requested total size since we have to find a free node in the required
order level traversing from left to right, here continuing the search
for the subsequent order value would skip the free nodes present in the
beginning of the tree.

In case of actual range allocation, as handled at
i915_buddy_alloc_range, we can continue the search from where the
previous allocation happened since we allocate all the blocks
progressively within the start and end address values.

alloc_range() handles both the cases, having a penalty of restarting the
search in case of actual range allocation. Please let me know if any
suggestions?

>>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>> +		    u64 start, u64 end, u64 size,
>>> +		    u64 min_page_size,
>>> +		    struct list_head *blocks,
>>> +		    unsigned long flags)
>>
>> Do we need to validate the flags somewhere?
> [Arun] I will move 'unsigned long flags' to enum type declaration
I tried to move 'unsigned long flags' to enum type declaration, it
creates an ambiguity in i915 driver as both DRM_BUDDY_ALLOC_TOPDOWN and
DRM_BUDDY_ALLOC_RANGE are mutually non-exclusive. So I think its better
to have 'unsigned long flags'.

AFAIK, we don't need to validate the flags since we check flags using
'flags & DRM_BUDDY_RANGE_ALLOCATION'

>>
>>> +		BUG_ON(order > mm->max_order);
>>> +		BUG_ON(order < min_order);
>>> +
>>> +		do {
>>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>> +				/* Allocate traversing within the range */
>>> +				block = alloc_range(mm, start, end, order);
>>
>> Ok, so blocks might be in a random order, which is a slight concern for 
>> actual range allocations(not the bias thing). Can we somehow make 
>> alloc_range just do the old behaviour when end - start == size? Not the 
>> end of the world though if not.
> [Arun] I will change the alloc_range() block allocations to bottom-up,
> so both actual range allocation and end bias allocation blocks will
> start from lowest address. And, since we are traversing the tree from
> left to right, blocks will be in order.
> 
> And, alloc_range() handles actual range allocation demands the same way
> as in the old i915_buddy_alloc_range() function except alloc_range()
> make use of order value to find the blocks within the actual range
> allocation.

Correction - I will change alloc_range() block allocations to bottom-up,
so actual range allocation blocks will start from lowest address (not
the bias thing), and since we are traversing the tree from left to right
progressively within the required range, blocks will be in order (not
the bias thing)

alloc_range() handles actual range allocation demands the same way as in
the old i915_buddy_alloc_range() function except it restarts the search
(since we are handling both end bias and actual range allocations in the
same function) and make use of order value to find the blocks within
start and end value.

Regards,
Arun
