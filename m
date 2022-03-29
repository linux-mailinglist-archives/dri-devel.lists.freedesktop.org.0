Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44A4EABF8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644F10E4AF;
	Tue, 29 Mar 2022 11:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19CB10E1D9;
 Tue, 29 Mar 2022 11:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENfw6lmd+tlJbmnzejbDVQuHg2wt3pTNfQa6XVc+R5dxPBR0Gsycxe5mhHsSXodbBKXu6paTOIXdmPYfslYln43Ic10gHJb8sjXKFzJhacbNh/M9dp90fOjoCSv+L65uZA0ZWkO8CVUzDLCHnP7Gtc2gpld12uQx5ZZ1ZR2/70AMDcrBYLGBtspgs2pobhdYRsggIp/kvlh3drPnyZAp4aLsct/WjC748kDoU0dY3wv2y4Yj/oP/4HbWaO0u5VlpBIwURxgUucAPzuH8zvSYtnDIJy1XSoYstQUt0DJCml5UInZMSOYFVfb6mVEh3ZEkP/LGX6noixLPR3scTCd1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEqde9lXwFwMzd6rx0Wgkq8LgY2Hvb9hZIRrsj1sxqc=;
 b=Rk+GW202WKrj+tscK0nN9pIjDDKA4qynEjyda4NV8/ER8J0nm5kFwLBv9naQqqyGgCd0LuORSx+JRy9/WBl458jeoCNXA65VSRLRIOsIxL/zdSOuBHh28j62Dcf3Sj22mvPapbKMnldBpt9415WG6L7DtD/AZ2QF7WhihF/kgaXOpd8yb0O4SeXxdv8hRo8Yf8TLXyuuQASuePQOGP5yLJoE8bgUIGrbHb5vsH0g6kuDgH+7F6TOapx6XNBY0XH37fJzdM8ulok3QiDe91utURHr0cArRKnoP9FE3l2Oy3HFY0pUI5Dq+ME6Y1/Zp04lzlrPipBDCleNm3MVGMFZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEqde9lXwFwMzd6rx0Wgkq8LgY2Hvb9hZIRrsj1sxqc=;
 b=BrNf0kXpQ5g+ScsIEiV+1Z1eFXxksGiZDWqtP8hwe+iMIO/bXj1HhwT/I3cNFP2OT/jW9kav37ztjM+5A6KrIh3iT1hoe2gPKuc6kB4vYwclHZbYc2B5UFMmjdLqaP3qTqqDB/NTF700DBbDOEh5YxTMpp4E4n02hl6lTvlrYRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BN6PR12MB1298.namprd12.prod.outlook.com (2603:10b6:404:17::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 11:09:33 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:09:33 +0000
Message-ID: <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
Date: Tue, 29 Mar 2022 16:49:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
 <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::27) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e2ba38-b566-4047-72a3-08da11749a5c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1298:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1298200FFEF7AD63BDB9C219E41E9@BN6PR12MB1298.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p58BsOEn0Rq2TWu5E1sqjp9k5BrDHl0L2ZyUcHobsvbeYOhuZR145GAR1BQgE9hf5N+h9/cYAQAgOyoWDDRa56eWD6LaN7ueEIuOXlIqQAimiuxn2aefg5/bubvcUVkx6dBjMB2sDzN+gZSw7vH4JTbuIpYDfdDIatBY4jZenv1WmbM/Xo8VzYqwedQMeOu/0U8yXvgJ7j1SHr9xDmpQYgCVsci5P/hpIcAegOvV/EH419faqdIx0YTKRBlv2bl9PR3Kivi+UDrpH2fbK/Rdz/xpxCw9VQL9lT6L3uqyW85aGglvVMceoHAfCLoqo95Gk8q6WtooEuECEVxy8EDn+nYUHwphpSlK9Lypfk2R52bgW/QrKUtRi36I2oju+wojz7PHmB6Ns2XKx5do6oS2EIWSlVvEwSDddFa8fRSngGUzR/rekvZiHi88z63YtXaa0gofXkXOG95JKN3Acs2o9Gvf4l+duF9X59MIe3KNKB4mZsSzJAvs5pNs873bfLu0yKCSUImOczF75LAs0kptpG8hpholfW3cg1ef2G8vkZCihPZwiOLatrB6bRf3mz/8616s/ACseXSoT+MfvM6rU8vzmGFD1dEsBWdQSG5OH69PFqguTGZC38sUCNB3fmt5a4Jd5WmibYsWwFSU6lS+ve6mwGIjA2TRe0bUywfPUDpOoUq/4K+O2Ou9/xL8LksiG3JyTnoOt9fqFJq9B978V0pMuDbZdUF4agbISdpsso0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(6512007)(2616005)(6486002)(508600001)(2906002)(86362001)(31696002)(6506007)(6666004)(53546011)(38100700002)(66574015)(66556008)(186003)(26005)(83380400001)(316002)(31686004)(66946007)(6862004)(4326008)(66476007)(6636002)(36756003)(54906003)(8676002)(37006003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZnYkUvT2VIVVFNUEJRTXJnVll5Z2NCOW10SEJDZ1JKOHJWY2VCVDJsOUNN?=
 =?utf-8?B?NDI2eklGdTB3OW9rU3A2K1l4a2tEbG9NUlFoK2h3YnVaeDRQaVd2SE92TWhy?=
 =?utf-8?B?TDMyQjM0dzJRR0xvVEU4dDVsYUV0Rjg0OGI4dEdkSHpHWWdoUjBTRUFQVUFo?=
 =?utf-8?B?QjR6M1J5ZHVHaCs4S1laM3lEbXJrL3VFcEcrVlJHWU94SUxFOUpOZlB1bW1q?=
 =?utf-8?B?bWJDVHZna0FLa0ZsNitiZVltTUJrVm9vZzdqMFpFZEZFY3NmTFZuVm9uWG5q?=
 =?utf-8?B?RG13QlBXdkhaYUxrRlk2VXBseWJ1YklEUEk0dHQrcElYNDZoaE1QK3hQbERQ?=
 =?utf-8?B?aDgwY1ZIdUVqOUFzNzFTZi9IV3YrSGNhU25GZktmSkpmeE9wL1VQb1E5ODV0?=
 =?utf-8?B?UU9pKzdpQ3VaY1ovNldpQlh4ek9qUEZHR0R0VytJOUNFclpPM1NERXlOVzdR?=
 =?utf-8?B?RDRWSVBoK0dlM1NpZ3dhdHdaK2Vud29YM1BnKzFtLzNkZU5zcEs2WC96L3Bh?=
 =?utf-8?B?ZXFsL0ovckFQYjBIWDZTN0J3anlTcmgvNTdJSURaeTZQdzJOWEFjelBhWC9n?=
 =?utf-8?B?ZFpZZStlOWFMNW4rK3hxYjdDOGZ6Y0JqbWFpbTdOa21OWHhYWkpvVDllenBJ?=
 =?utf-8?B?YXFEbjkvM0E3dktYWXZKSjBtOFFWMnIrcm0xTVQ4ZFJ1Zm9RZ1RuNDhka2U0?=
 =?utf-8?B?N0dOdFBGMk9pNWYxMEdkM3dyUHpvRFZ6VHp0RHFBRkFVa0p2K29TT2R3Ymlr?=
 =?utf-8?B?SWF5Q3NmRVBUZXgwOWlzNTljRXQ1eS95ei81bUd2MXIwV2dzL3VKa0VrWEFX?=
 =?utf-8?B?dytHblJmTUx3bld1dDZjcFUzcUFDLzgzejF3Y2F1SXpoTlhXNzFEb0pGeWpk?=
 =?utf-8?B?bnJweWFrNDl2Q0hjZGpWVERRVWZWVUR5Qmd5YzBxekJpTklycmh6cENYRlFI?=
 =?utf-8?B?SU4rYjRaMlZubGxWTjFCN3BJWSttc0lqQ24zT3Q4T2FYL2J5UjJNV2hXMlBZ?=
 =?utf-8?B?RmhPamhYRFNXSW44M0xRbVhPUmp0K25XNFRTcVlzOE5wOVFxSW5IVzdoa3Qz?=
 =?utf-8?B?VDMrUXFBZkk5RnRpWm1sS3JlNTNiRjFXRFh4WXpQWWQvTTFza1FaT3BsRzRh?=
 =?utf-8?B?alQyTnRkb0RZb3pwdVBkb0MzZEJJbEZOclVJQlFOWkhuTEdhWEVrUytRaTFS?=
 =?utf-8?B?MzM2eEsxc2FGWjlISUhqMGJEYVkvd0dwMkMrc09JeXdMK3ZZdTRkQWZSa28z?=
 =?utf-8?B?OGwxa01mbkNtWE9pekJ5TlF1NjJyUTRjOS9zcUtjM3RkV0V3RXVNNnlLeEZl?=
 =?utf-8?B?RWVGS2hJR2ZEZzliRUJySVNZbXZoUXhBRS9zcUZHUGFmekNqNTUwZlJKQnZE?=
 =?utf-8?B?N3FScGYwVFdGaEE3aHhiMmRiMWVRR2V6emRsUmdSRm5tNmNpRk9FOFlXQmxV?=
 =?utf-8?B?Y2F3R204QnhIZHdTNWcrUXVHVC9uQlJnaEhaUVRKcFZxU3RvaDVDbk5yc2xs?=
 =?utf-8?B?RjZsRDh6T2VZcUtreERDQkNnOVZSU0MyeCt5dTU4ZG5TTnVVQjBzeUg3UHhV?=
 =?utf-8?B?UlRnU3JabHg5eEFtWXQ3OGd1eFgzTDY0Si92cldJU2tLVForRHNNbDlxeWJ0?=
 =?utf-8?B?aFpJTzI4RHZvQ1VBVlcwUTJMRHhSM1VTanBWTE9ZZnUwNmxYSWFtVUJMSHhD?=
 =?utf-8?B?ZXc4VXZzNWkrTU5JNk9KQ1QxUnA4dWdPZ2EzTTFjcldYZVZXWE4wK2grRzdU?=
 =?utf-8?B?d1FURjdBSDNXT0lLSFRYZmxDb2Z2T2tWMWhaNmV3VlFkV3N6UDd4eHU1NUkx?=
 =?utf-8?B?NlkxNnIwOGFUR2dvdUo5bEZkTC9TV1ozS3k5cjB0WVlHVjB4ajliY2VmMGV5?=
 =?utf-8?B?ZHVpQ0NGS3dPYjAwRmZpOUtPU202YUpvOTZsRG5WRXVXMUthK0dYbnV6aVk0?=
 =?utf-8?B?a3l3aXRDd1VaUGRDRHJrMldvS2VEK3R5dXEzZ0pxMVhzR3d5SndjVHQxZExz?=
 =?utf-8?B?VzhpUEd6eVkrcEJDTnpLaVB2aVRrelJaem9vT3ZBS1RDcDJpSC85K3A4MEF6?=
 =?utf-8?B?NmdBQXd4ZUpHZGlxZjQxTUpPQjJicWxvMUlXWERCSERyRE9iSkJCVTRhMDl4?=
 =?utf-8?B?UE45Rm1mOFQvbXZybTBYMGc0cFpmT00zdGlGSjF2M2hjdUZKUG8wRUhYWHhu?=
 =?utf-8?B?QW5iSjIvYTdFNVFkQ0c1eC83QTBZVFh6NWxyekh2R3I5MWozS3JaSTFZdEp6?=
 =?utf-8?B?RjhydUJrWndjUUNlQldITnZVeVJKL2RjMnl0WGhOaUhlOGJBd1crZVFwR3Ax?=
 =?utf-8?B?OFFCUms1NC80Q1NpNkVzUXNLNmg5MTMvcVVsSk83MlFEMG5CMmJNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e2ba38-b566-4047-72a3-08da11749a5c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:09:33.3099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db/YE6IxEQLEWmBpGZyqncidPU7MfPZAMI9GszNjllJtZe9JFiVpnkVKwmuSCMd5JoBsIe8L60axE9r3hT7ykw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1298
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
Cc: Arunpravin Paneerselvam <arunpravin.paneerselvam@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Christian König
> Sent: Wednesday, March 23, 2022 1:07 PM
> To: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; matthew.auld@intel.com; daniel@ffwll.ch; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
> 
> Am 23.03.22 um 07:25 schrieb Arunpravin Paneer Selvam:
>> [SNIP]
>> @@ -415,48 +409,86 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>   		goto error_fini;
>>   	}
>>   
>> -	mode = DRM_MM_INSERT_BEST;
>> +	INIT_LIST_HEAD(&node->blocks);
>> +
>>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>> -		mode = DRM_MM_INSERT_HIGH;
>> +		node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>   
>> -	pages_left = node->base.num_pages;
>> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>> +		/* Allocate blocks in desired range */
>> +		node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>   
>> -	/* Limit maximum size to 2GB due to SG table limitations */
>> -	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>> +	BUG_ON(!node->base.num_pages);
> 
> Please drop this BUG_ON(). This is not something which prevents further data corruption, so the BUG_ON() is not justified.

ok
> 
>> +	pages_left = node->base.num_pages;
>>   
>>   	i = 0;
>> -	spin_lock(&mgr->lock);
>>   	while (pages_left) {
>> -		uint32_t alignment = tbo->page_alignment;
>> +		if (tbo->page_alignment)
>> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
>> +		else
>> +			min_page_size = mgr->default_page_size;
> 
> The handling here looks extremely awkward to me.
> 
> min_page_size should be determined outside of the loop, based on default_page_size, alignment and contiguous flag.
I kept min_page_size determine logic inside the loop for cases 2GiB+
requirements, Since now we are round up the size to the required
alignment, I modified the min_page_size determine logic outside of the
loop in v12. Please review.
> 
> Then why do you drop the lock and grab it again inside the loop? And what is "i" actually good for?
modified the lock/unlock placement in v12.

"i" is to track when there is 2GiB+ contiguous allocation request, first
we allocate 2GiB (due to SG table limit) continuously and the remaining
pages in the next iteration, hence this request can't be a continuous.
To set the placement flag we make use of "i" value. In our case "i"
value becomes 2 and we don't set the below flag.
node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;

If we don't get such requests, I will remove "i".

>



>> +
>> +		/* Limit maximum size to 2GB due to SG table limitations */
>> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>   
>>   		if (pages >= pages_per_node)
>> -			alignment = pages_per_node;
>> -
>> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>> -						alignment, 0, place->fpfn,
>> -						lpfn, mode);
>> -		if (unlikely(r)) {
>> -			if (pages > pages_per_node) {
>> -				if (is_power_of_2(pages))
>> -					pages = pages / 2;
>> -				else
>> -					pages = rounddown_pow_of_two(pages);
>> -				continue;
>> -			}
>> -			goto error_free;
>> +			min_page_size = pages_per_node << PAGE_SHIFT;
>> +
>> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
>> +			is_contiguous = 1;
>> +
>> +		if (is_contiguous) {
>> +			pages = roundup_pow_of_two(pages);
>> +			min_page_size = pages << PAGE_SHIFT;
>> +
>> +			if (pages > lpfn)
>> +				lpfn = pages;
>>   		}
>>   
>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>> -		pages_left -= pages;
>> +		BUG_ON(min_page_size < mm->chunk_size);
>> +
>> +		mutex_lock(&mgr->lock);
>> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +					   (u64)lpfn << PAGE_SHIFT,
>> +					   (u64)pages << PAGE_SHIFT,
>> +					   min_page_size,
>> +					   &node->blocks,
>> +					   node->flags);
>> +		mutex_unlock(&mgr->lock);
>> +		if (unlikely(r))
>> +			goto error_free_blocks;
>> +
>>   		++i;
>>   
>>   		if (pages > pages_left)
>> -			pages = pages_left;
>> +			pages_left = 0;
>> +		else
>> +			pages_left -= pages;
>>   	}
>> -	spin_unlock(&mgr->lock);
>>   
>> -	if (i == 1)
>> +	/* Free unused pages for contiguous allocation */
>> +	if (is_contiguous) {
> 
> Well that looks really odd, why is trimming not part of
> drm_buddy_alloc_blocks() ?
we didn't place trim function part of drm_buddy_alloc_blocks since we
thought this function can be a generic one and it can be used by any
other application as well. For example, now we are using it for trimming
the last block in case of size non-alignment with min_page_size.
> 
>> +		u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
>> +
>> +		mutex_lock(&mgr->lock);
>> +		drm_buddy_block_trim(mm,
>> +				     actual_size,
>> +				     &node->blocks);
> 
> Why is the drm_buddy_block_trim() function given all the blocks and not just the last one?
modified in v12.
> 
> Regards,
> Christian.
> 
>> +		mutex_unlock(&mgr->lock);
>> +	}
>> +
>> +	list_for_each_entry(block, &node->blocks, link)
>> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>> +
>> +	block = amdgpu_vram_mgr_first_block(&node->blocks);
>> +	if (!block) {
>> +		r = -EINVAL;
>> +		goto error_fini;
>> +	}
>> +
>> +	node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
>> +
>> +	if (i == 1 && is_contiguous)
>>   		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>   
>>   	if (adev->gmc.xgmi.connected_to_cpu) @@ -468,13 +500,13 @@ static 
>> int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>   	*res = &node->base;
>>   	return 0;
>>   
>> -error_free:
>> -	while (i--)
>> -		drm_mm_remove_node(&node->mm_nodes[i]);
>> -	spin_unlock(&mgr->lock);
>> +error_free_blocks:
>> +	mutex_lock(&mgr->lock);
>> +	drm_buddy_free_list(mm, &node->blocks);
>> +	mutex_unlock(&mgr->lock);
>>   error_fini:
>>   	ttm_resource_fini(man, &node->base);
>> -	kvfree(node);
>> +	kfree(node);
>>   
>>   	return r;
>>   }
>> @@ -490,27 +522,26 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>   static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>>   				struct ttm_resource *res)
>>   {
>> -	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
>> +	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
>>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
>> +	struct drm_buddy *mm = &mgr->mm;
>> +	struct drm_buddy_block *block;
>>   	uint64_t vis_usage = 0;
>> -	unsigned i, pages;
>>   
>> -	spin_lock(&mgr->lock);
>> -	for (i = 0, pages = res->num_pages; pages;
>> -	     pages -= node->mm_nodes[i].size, ++i) {
>> -		struct drm_mm_node *mm = &node->mm_nodes[i];
>> +	mutex_lock(&mgr->lock);
>> +	list_for_each_entry(block, &node->blocks, link)
>> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>>   
>> -		drm_mm_remove_node(mm);
>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
>> -	}
>>   	amdgpu_vram_mgr_do_reserve(man);
>> -	spin_unlock(&mgr->lock);
>> +
>> +	drm_buddy_free_list(mm, &node->blocks);
>> +	mutex_unlock(&mgr->lock);
>>   
>>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>>   
>>   	ttm_resource_fini(man, res);
>> -	kvfree(node);
>> +	kfree(node);
>>   }
>>   
>>   /**
>> @@ -648,13 +679,22 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>>   				  struct drm_printer *printer)
>>   {
>>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>> +	struct drm_buddy *mm = &mgr->mm;
>> +	struct drm_buddy_block *block;
>>   
>>   	drm_printf(printer, "  vis usage:%llu\n",
>>   		   amdgpu_vram_mgr_vis_usage(mgr));
>>   
>> -	spin_lock(&mgr->lock);
>> -	drm_mm_print(&mgr->mm, printer);
>> -	spin_unlock(&mgr->lock);
>> +	mutex_lock(&mgr->lock);
>> +	drm_printf(printer, "default_page_size: %lluKiB\n",
>> +		   mgr->default_page_size >> 10);
>> +
>> +	drm_buddy_print(mm, printer);
>> +
>> +	drm_printf(printer, "reserved:\n");
>> +	list_for_each_entry(block, &mgr->reserved_pages, link)
>> +		drm_buddy_block_print(mm, block, printer);
>> +	mutex_unlock(&mgr->lock);
>>   }
>>   
>>   static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = 
>> { @@ -674,16 +714,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>>   {
>>   	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>   	struct ttm_resource_manager *man = &mgr->manager;
>> +	int err;
>>   
>>   	ttm_resource_manager_init(man, &adev->mman.bdev,
>>   				  adev->gmc.real_vram_size);
>>   
>>   	man->func = &amdgpu_vram_mgr_func;
>>   
>> -	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
>> -	spin_lock_init(&mgr->lock);
>> +	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
>> +	if (err)
>> +		return err;
>> +
>> +	mutex_init(&mgr->lock);
>>   	INIT_LIST_HEAD(&mgr->reservations_pending);
>>   	INIT_LIST_HEAD(&mgr->reserved_pages);
>> +	mgr->default_page_size = PAGE_SIZE;
>>   
>>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
>>   	ttm_resource_manager_set_used(man, true); @@ -711,16 +756,16 @@ 
>> void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>>   	if (ret)
>>   		return;
>>   
>> -	spin_lock(&mgr->lock);
>> +	mutex_lock(&mgr->lock);
>>   	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
>>   		kfree(rsv);
>>   
>>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
>> -		drm_mm_remove_node(&rsv->mm_node);
>> +		drm_buddy_free_list(&mgr->mm, &rsv->block);
>>   		kfree(rsv);
>>   	}
>> -	drm_mm_takedown(&mgr->mm);
>> -	spin_unlock(&mgr->lock);
>> +	drm_buddy_fini(&mgr->mm);
>> +	mutex_unlock(&mgr->lock);
>>   
>>   	ttm_resource_manager_cleanup(man);
>>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
>>
>> base-commit: a678f97326454b60ffbbde6abf52d23997d71a27
