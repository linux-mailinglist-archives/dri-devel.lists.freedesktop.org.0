Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7214E206C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 07:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B53C10E2AF;
	Mon, 21 Mar 2022 06:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190FC10E398;
 Mon, 21 Mar 2022 06:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIJZg4L1Y38tr0Za3U257qXLGDBqVDT3VWoncIHug52l15OyYcWyRB8yE+E0i644YXJYIbuaTOeHDNunlLJx/s+p7ks4L9jy8G5JIc4ET+hrPla+RoJnlKJ0NnToOErbZoUOxbFU34yTqab6jD7DOEcf5EZFsF/I0lC1o8xT9kyc5stirIEnpSbu2Q7MMJzG/V5SkxdgB55aqgz7I+xaa+goIGO6Uig524Jtf+w+MiM8Hpi3qyprU0l3xP9vimdYn6koOoxi/3zm3m9Lb/nkKqkYy9kcn8MDeLqTo25Q/JiW7zQiZ7k4Dqr2iAhX4nZT5cIpxmerT5VV70EFYQwN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lW+SygKLPgScO8xfEQ1p3yrCgYwccuZNWvNbcQLtLI=;
 b=K6svSokI2cdoo6Bp94Y5RFFftOZpR9dRWMowKmyjciZre5Aa42sw2ZjsPCpUL+2O6fdX6Zm9Usa9fooLeJf0A/s/xzlNCEUJZX1YpLy0Ln+5h6X74je1dk/0GgwmOP6Q8LNPZ5RjI7j5fJ205/2OTf1efspTNpF9AV9ySlcCSb8yUbPZZ7ZX2wAPAqwyp7baUI1fm6S09kAKXu/Ub1BZRJxUi2rTxAw7Cz0e2sHSsG9ShPFwV4IIlUITkyg/f0TvadVqlPr9NpXfaY+2a1KYdUf8ri6vT3QVkED3uqujKjnPIQycKfyVvuDJ6ynNHMfTf02Hj1beIbR3KBjqvG8KHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lW+SygKLPgScO8xfEQ1p3yrCgYwccuZNWvNbcQLtLI=;
 b=CueNRJKfwGQL4hcWJyFA98MP9ZErSahMtfapANT933xDocW6TL/EZXgEMyNzwAWqL3AMyQztsHlwsEPlGfRHwYs7WKHs6otx/bolxjIWUTtP2HoQKYyEoHGjXc2I1s5UY7URqyRRR2fssnFrorf7aVX0V1LHBlrkMl1cks4TFqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 06:05:01 +0000
Received: from SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef]) by SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:05:01 +0000
Message-ID: <e4ed9aca-6400-9e26-ce8f-62e43c0f5dbb@amd.com>
Date: Mon, 21 Mar 2022 11:45:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
 <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
 <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
 <3601c42f-0787-e21d-460b-44a5a100b710@amd.com>
 <a19344ef-748c-7692-8089-d39dc562d0b3@molgen.mpg.de>
 <537b9740-f7c3-dae6-a683-42dbef4e1b4c@amd.com>
 <720c3778-aaea-ab68-b1c8-28027e19defc@molgen.mpg.de>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <720c3778-aaea-ab68-b1c8-28027e19defc@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::19) To SA0PR12MB4349.namprd12.prod.outlook.com
 (2603:10b6:806:98::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba71021d-97bf-4c74-10cf-08da0b00bc2a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB45747A13889FFD8ED8BD67C9E4169@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: goDlrtzURzJ1b4BbfOVDdY7BEtKy71/G4leSi23wmeUKfVklS56qdDdzM6ySE4x9UwDnjLAY/6/m47S7PYTU4zeD837y8O5m1mnywwuFjCxMZFK5FY+PAbZlL8nXQG/aBKFAlUcScY1/5GQ18amFKWVXFw4/aACqMpaxHmzDDDV5eMijcWpTa3aTmtptERLjYnfXFGvonGf09pe3vqEx69H0NMBwwKl4xUOj/MkFE9KOGN2ZnzWkQVLHV/FTuzRZJW5/o3cXsqI81Qdcad6UES0uR9Djy5BwqVEOEdlaK1LT7uwuWar7aJK0oXuCxQqCyyQfruDijiYkIH+2NKfIuR/NLFyT4K2CA6YoVR+QsUkpkBibbmXtmcRoLbN9VwfRfLJc5Cs//oy9bDB4uuWK1TIi3QWcwAKa3MYToa+Lx5dINfeU6WKB85sGvaCcOoBMoLz08MSeCvm4Ziqg1Z7UQFrJzlfqThE2RISFWSvk8aJbAZnDCr74BcTUaHWI2ngkrYQhB/YqzzmguvP2Nn08ABznlvq6gnz6dS5iizDGdKcDP1OrI4wBJpKpAWSuxkM+XB561YywD3I4BNTsLkgHFT8HrZvAH6CIYkZ1inUwR3Yn63XH2SDA5MRMAHbuILJh7PXxRxZyd6kRnD6QMGgGAYkPQ3KBJJskHrnm2yANU96EhZ62lTzt0/IP7VhYka7RH1IIWg2cuY+i9pLuropVZ/cQgJwb1X+vskXtcAjj8C6JVN0mSaErn1gBKJYsuM98
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(966005)(6486002)(6512007)(53546011)(2616005)(45080400002)(26005)(66946007)(66556008)(66476007)(8676002)(4326008)(31686004)(6916009)(186003)(86362001)(38100700002)(8936002)(36756003)(6506007)(5660300002)(6666004)(316002)(2906002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzY5dDNqZVVWdjRqeGNFVzB6UFNHVnd4azlkMjZVRmUvNXB2TmJmQk15M3Va?=
 =?utf-8?B?dmt4K0VDa1N5V3ZZWnBneUV2dEw5aXl3RDB1b016Vkd6Q2pjZ2MxVlhlNHRU?=
 =?utf-8?B?aUJKVnA5T21ROHNZZ3lER2pKRFVJSmVhajhKSlljMVVQODU0RThCd3Q1OFk0?=
 =?utf-8?B?ZlpaaWtYcVZ6ZktxK1RCRVJhMncwVFF4NTg2Q1N6cHEwUHAydmhiK2xpOFJM?=
 =?utf-8?B?QXhySGZPakRQbU5oaTB3Vi9PYklML0dqNUQzd0JhbFFUTDEyblZpdVQ2dE5x?=
 =?utf-8?B?cHBkQ1FBRmRROW9KSHRGMGZQbXRTT3ZEN0l3R2FzWXNHOEhqZUVLMDJMZkNn?=
 =?utf-8?B?T1dKV2RhSUdNVUd6MGJ1Um9nNFNsaU9oS3lCTmRYbG1MalBBTE11VkRZOTQz?=
 =?utf-8?B?ZlVLN3A1RWQ3eXZJQlplTC9yUkdvWWtMcjc4ajZYSTFkZHlBdU15U0RFVmJJ?=
 =?utf-8?B?aVFtWkEzdG9YYVBsNzdyamJoSTVtblhoNzI3Tk1XMU1SM3kxNFowVnkzdERi?=
 =?utf-8?B?VTNnN1NaZU9iWS9SK0NnYlNpUU1yekkvVDU4U3ZQNGY0dDZZTE54M3VBeWoz?=
 =?utf-8?B?dU4wSUc3YlhXbjNWdnlOa05YK0Z6RjZRRWdJY3ZaVExLR0dsYUtOWk1wanhy?=
 =?utf-8?B?VjhmdGtOWlppTTNPZ1BmYkRIMnZQeTlmbHNFK2Zvd3I2aC9DaVRSamJQUFpi?=
 =?utf-8?B?SVRpbHNFYWF6Z1F4NlljTjhUYk9yYXpreGpJelNEczlSRTVEOUo0Nys2R1kw?=
 =?utf-8?B?SXFRM1VUb3JpVWkzTjdaTzNnOHg4L3ZLOVVFOG5xaUdVN3BwOVc2c2xxWHVY?=
 =?utf-8?B?emIyMlloKzVodW5xajI3bS80R3JWSXNxc1Zzb09tdGtteVJMTkU4VWFTQ1ZR?=
 =?utf-8?B?VDk4aUhWVm5SQUcyc3FVMHNtcWhvYnUxd256NnBJcUtrQm5tNlpHM1BpdEU1?=
 =?utf-8?B?dVBVWHF1Y29MbTg0TisxZlF5a0J0NS94dFQzNFhpS2V2aWx6MVBFcmpwbWIz?=
 =?utf-8?B?ZkJoV0Vkd3gxMTVVRjhBWm5SYmp0VDRXY3BVNFpsaW8yVzcwQUNvNCt3Mm1B?=
 =?utf-8?B?Mzd6Rzh3ZUZlT29zN0MvdWFsZlU2ZGg3NHhnZFhJQlgvUFIxVnpEeHA1VU9L?=
 =?utf-8?B?ZjVRdHl0aXBCZUtJbnM5d2dhQ3B6czFROXZzYzhwcXprZVdBOGpidkRRelEy?=
 =?utf-8?B?ekFvUTY3TDZiMmtwbFdPWGZYdHhzWTg2YmFWU3hGOW8wV2l3QzBJWWR4S0t3?=
 =?utf-8?B?RTd4aHN3WVlUd0tUQnZxaHR0Qk1neU9YSjkrS3I2NXdWUDFTWWtQeUgvakpY?=
 =?utf-8?B?OU53RG5SaHBCYmVqaCtZTks3LzYrL1hJMXBra0xja1NZcFhNeHFqR1JTQ1V3?=
 =?utf-8?B?ZDVPN3RxSUZNTzk2VTV0QmhubzhxZ0JjeHVQdGRDSFpiU1NiZytSNGNpOGVO?=
 =?utf-8?B?MnF1ZUYzbVZPZjA3UFBUVTRKbDBmQ0xaOUJReU9nTHNVM0ZpTHBVVmxneGJF?=
 =?utf-8?B?TEdyQ3JjemFXR3VRQUJ4V0t5eEVQakoxdndSVEFnUXl1UG5JNXBjNGhXYWNj?=
 =?utf-8?B?WUpEUDRHa1pTdk5xTWMvQWp2c2FGYmZBd2JsNzl2Qm5meTRxcy9JcDVIZXp4?=
 =?utf-8?B?WlRqVVVMWDV2eWU2QU9YdUczeW96WXdZV2hZdEVDeVdvNWNNNGVTTFQzc211?=
 =?utf-8?B?blFNSFFLZURqcjVxYVBuOGJwakJIOEV6c0ZGOWt0QlRCbVByaTBjelAza0VR?=
 =?utf-8?B?b0J6NThMbGE3M3JiNnlaSnhJQmtKRTJVdmxwa3JwblA0TlQybmZuTGRNS3p6?=
 =?utf-8?B?a2FCQXBHSEdQeXYrT3NTZ2tIODhkaVdPK0JLYnczRnVSbTc3NlJpTUR0NHQw?=
 =?utf-8?B?YWtyaHpmR1lLN1VSaEZVdFBNUGhjZGJKcEc5alVDTnBnRWMrczNERWlONGZG?=
 =?utf-8?Q?Q3csCQ42LJk3GgFWQ0X2sH1NOfiCfh/8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba71021d-97bf-4c74-10cf-08da0b00bc2a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 06:05:01.7698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZXM00FpeJhDiTdY6+sx54gkMcEa7JBS5AE1lA6Y9a1bCpHm3tE4WO4/Kq6HES6p21P7eZCeCZ0tiR/VSMmB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/03/22 12:28 pm, Paul Menzel wrote:
> Dear Arunprivin,
> 
> 
> Am 16.03.22 um 07:49 schrieb Arunpravin Paneer Selvam:
> 
>> On 15/03/22 9:14 pm, Paul Menzel wrote:
> 
>>> Am 15.03.22 um 16:42 schrieb Arunpravin:
>>>
>>>> On 15/03/22 2:35 pm, Paul Menzel wrote:
>>>
>>>>> Am 15.03.22 um 10:01 schrieb Arunpravin:
>>>>>
>>>>>> On 15/03/22 1:49 pm, Paul Menzel wrote:
>>>>>
>>>>>>> Am 14.03.22 um 20:40 schrieb Arunpravin:
>>>>>>>> handle a situation in the condition order-- == min_order,
>>>>>>>> when order = 0, leading to order = -1, it now won't exit
>>>>>>>> the loop. To avoid this problem, added a order check in
>>>>>>>> the same condition, (i.e) when order is 0, we return
>>>>>>>> -ENOSPC
>>>>>>>>
>>>>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>>>>
>>>>>>> Please use your full name.
>>>>>> okay
>>>>>
>>>>> You might also configure that in your email program.
>>>> yes
>>>
>>> Not done yet though. ;-)
>>>
>> done in v2 :)
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/drm_buddy.c | 2 +-
>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>>>>> index 72f52f293249..5ab66aaf2bbd 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>>>
>>>>>>> In what tree is that file?
>>>>>>>
>>>>>> drm-tip - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm-tip%2Ftree%2F&amp;data=04%7C01%7Carunpravin.paneerselvam%40amd.com%7C439b31d360ef495ab13408da071a6e1f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637830107357395422%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Z8KNmbUXmhk0xA8z7yHJN2j%2BRJ5VwpuMXww21mrC8x8%3D&amp;reserved=0
>>>>>> drm-misc-next - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Ftree%2F&amp;data=04%7C01%7Carunpravin.paneerselvam%40amd.com%7C439b31d360ef495ab13408da071a6e1f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637830107357395422%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Mwqy6NVTiR%2FoHFpLvXnQdE95kHoJJUEiig0Juz37ATQ%3D&amp;reserved=0
>>>
>>> Thank Outlook. Now everybody feels safe.
>>>
>>>>>>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>>>>      			if (!IS_ERR(block))
>>>>>>>>      				break;
>>>>>>>>      
>>>>>>>> -			if (order-- == min_order) {
>>>>>>>> +			if (!order || order-- == min_order) {
>>>>>>>>      				err = -ENOSPC;
>>>>>>>>      				goto err_free;
>>>>>>>>      			}
>>>>>
>>>>> Thank you for the hint. So the whole function is:
>>>>>
>>>>> 	do {
>>>>> 		order = min(order, (unsigned int)fls(pages) - 1);
>>>>> 		BUG_ON(order > mm->max_order);
>>>>> 		BUG_ON(order < min_order);
>>>>>
>>>>> 		do {
>>>>> 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>>> 				/* Allocate traversing within the range */
>>>>> 				block = alloc_range_bias(mm, start, end, order);
>>>>> 			else
>>>>> 				/* Allocate from freelist */
>>>>> 				block = alloc_from_freelist(mm, order, flags);
>>>>>
>>>>> 			if (!IS_ERR(block))
>>>>> 				break;
>>>>>
>>>>> 			if (order-- == min_order) {
>>>>> 				err = -ENOSPC;
>>>>> 				goto err_free;
>>>>> 			}
>>>>> 		} while (1);
>>>>>
>>>>> 		mark_allocated(block);
>>>>> 		mm->avail -= drm_buddy_block_size(mm, block);
>>>>> 		kmemleak_update_trace(block);
>>>>> 		list_add_tail(&block->link, &allocated);
>>>>>
>>>>> 		pages -= BIT(order);
>>>>>
>>>>> 		if (!pages)
>>>>> 			break;
>>>>> 	} while (1);
>>>>>
>>>>> Was the BUG_ON triggered for your case?
>>>>>
>>>>> 	BUG_ON(order < min_order);
>>>> no, this BUG_ON is not triggered for this bug
>>>>>
>>>>> Please give more details.
>>>>
>>>> there is a chance when there is no space to allocate, order value
>>>> decrements and reaches to 0 at one point, here we should exit the loop,
>>>> otherwise, further order value decrements to -1 and do..while loop
>>>> doesn't exit. Hence added a check to exit the loop if order value becomes 0.
>>>
>>> Sorry, I do not see it. How can that be with order ≥ min_order and the
>>> check `order-- == min_order`? Is min_order 0? Please explain that in the
>>> next commit message.
>>>
>> please check v2, yes when min_order is 0, the above said situation may
>> occur.And, since the order is unsigned int, I think it will not trigger
>> the BUG_ON(order < min_order) when order becomes -1. Hence I think we
>> needed a check !order to exit the loop.
> 
> Thank you for clarifying this. I still do not understand it though. With
> 
> 	order = fls(pages) - 1;
> 	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> 
> is zorder` always non-negative? Let’s assume it is. Also, can min_order 
> get “negative” (wraps around)?
> 
> I would add BUG_ON statements for these cases?
> 
>      BUG_ON(fls(pages) - 1 < 1);
>      BUG_ON(ilog2(min_page_size) - ilog2(mm->chunk_size) < 1);
> 
> Assuming “negative” is not possible, your case can only happen if 
> `order` and `min_order` are 0, right? If `order` is greater than 0, and 
> `min_order` is 0, the first BUG_ON in the while loop would be hit. If 
> `order` is 0 and `min_order` is greater than 0, everything should work 
> as the condition in `if (order-- == min_order)` is going to be true 
> eventually.
> 
> Could you please analyze this more. The current patch looks more like 
> papering over something, or I am missing something.
> 
Thanks for the analysis, Matthew suggested to add a simple check, I have
sent the patch for the review.

Regards,
Arun

> 
> Kind regards,
> 
> Paul
> 
> 
> PS: The commit message summary of your v2 should also be updated.
> 
