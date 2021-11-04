Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1B4450A5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271F36ED27;
	Thu,  4 Nov 2021 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEFF6EC23;
 Thu,  4 Nov 2021 08:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7ZOyUx69efvjo8devfsaSUw2gZiGQWLXSHETVcBKx+wtIklKuXUMf/FEZky8XCi3CR8jtc44oMob/uJHtZA3LfLntnM3AUfr+oWDqxW0d57D9IzfFM1Zcmc8g9GbXGoMLDDWkKo/op+e3i4cmOQiYsKZzztmRlmK7JEtfWdbpFo0IHwNk4UMnvK+XsRLrWZ1WobMaSBcfIPAYEy+wUwMEhqa6cULgFKTS1jvA+p8YYQaX02/qun/vBbgnp9ZBSNcfV0x8ALWW3AVVlPamXT9SH4MC0L0Ivh4N47XJ9GkhqWVWtjvYqZ4kwZWjAGh+QaBx6vyp3KXK31I/OV611XXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5eSNGQ85pWIm0lc7bvN0lKOiBCeSgOXBdg+6GMMniA=;
 b=LhGV1hDRKNO4xvczzrGW8yavfllWPOt4de2z561baIzC8i6+4j4Dh1U6TrnE7tj0UBpE8Wg6guUsx2tOBbayNs0Vnwdlwn9y54vkzi71htdk1pHyQktJ/iR1gh55UqtlDEVOuGbcuUspqxRcLRjbUTVRtc9aq+fYVm9Z1lbRbtCfuhLdTB5V1Xb4jZa0Xnn8bvHVQSmJClRIb3i93DkHmUFS5kB55CNnDYlTGF8xg74fOz5zGVbTUSymAO6MsyW4xe5Qy39BJxP0DriAOPAbfFjufDujiqgfd/roeKdYQHNkCyORIGxn7z9rDXZjaBgs3UyQk8kc8k6J9jPaZ/aqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5eSNGQ85pWIm0lc7bvN0lKOiBCeSgOXBdg+6GMMniA=;
 b=p5xtxFy7qQ9G2iT/zP0JwX3e79bBK+pfpG/xwtSv+0BOvGSJdha4H5L3/dpNdtRZADrpvGTTU3w3RQwZOboxvRLySISmzTymie1d13lpENYO231guGBRINYrEFGa5FrJbrHgWQ62m/e61LoYgpIYgXImzosAf8pMwgj657euOCM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1776.namprd12.prod.outlook.com
 (2603:10b6:300:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 08:55:04 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 08:55:04 +0000
Subject: Re: [PATCH 8/8] drm/amdgpu: add drm buddy support to amdgpu
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-6-Arunpravin.PaneerSelvam@amd.com>
 <55adb714-45f9-5af5-33df-ce4f4526a8c8@intel.com>
 <3b5fb9bb-13a0-a7db-cea2-1515aec96742@amd.com>
 <40e7dc08-9d5c-4ddb-3875-e018eb2791b9@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <07390c37-e1ac-5343-c5b5-6e1da10f8d5b@amd.com>
Date: Thu, 4 Nov 2021 09:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <40e7dc08-9d5c-4ddb-3875-e018eb2791b9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::28) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM6P194CA0015.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 08:55:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5e479da-c091-48f0-2b71-08d99f70caca
X-MS-TrafficTypeDiagnostic: MWHPR12MB1776:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1776A205ED024C968F86C47D838D9@MWHPR12MB1776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZhUCzf1CZFdOD65NupvLXAk5SoHthTx5iKgnMBipFjEEBVcnUip8w/tu3bh2EhJ3v3zIBG59XnHqkTes4CkxUiUDxkCcUEcX7N1q7wV8U+nyguU6aKoEf4v4Q+Xb/tHiIFokmDVWUckJJqgPlhII9iDTN4uChPU6l4erMxpeocrKSTuH9cf8vYtcoT4nVo/1XIzJf5M8z+sxyBMS6L/QivrALX901H9zDd+E+7JxyJfs23Gby1b1dpAqg5sJPbHwliL8DkC/4/mKBMc+v2wqG51FSZDw8sYLylmdlPLYdcmDR5sXG6uJB9Fci7NG+muLcuPy/xNfy5dpHns7Rg6oL+AR18WcGNNcZsRbfKpXxypXc0p5e4j4dfUzbRJXUGcJ4LzfDwe3BdBpgssjl3ebz6K8QIp4dch3Tm+t80QxUJqthjYQ3ODfJxC3yhsPOykZ/nBL0dSHIXEd95SrDDvspZwVtrO6d5RhOBvCxOob8kA82LCtyYYQhzjvCqyi7Fw7mhEBaQYgFQEVq37wbguLXrAKZrJWFZE/b2KZVKQvrKiiVQmSO20Bo5Jfu968sDUPAWFfmCZSsZNHepyzHS40m5+LgSGHYLMGXurBQHvT0hBzbHirEUOhM6OX5nSYdTEKCQfd6Yr6UGGIQz6qJBNrzSYZ/cuVQdPAIlk2ASdawlw7U9yPjb4uZlQdbWWWeWvC/MGDhbJGDYPVpMVwfjORCaZSDbzXk1Xx8xFnLyyYF6yfgd6LQFI5Ks9J8gGV2GD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(2906002)(66946007)(83380400001)(38100700002)(110136005)(36756003)(53546011)(5660300002)(8676002)(66574015)(4326008)(86362001)(8936002)(6486002)(31686004)(66556008)(16576012)(26005)(316002)(186003)(2616005)(956004)(31696002)(66476007)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGpRZVJvT2N4R0NaMEVEQWc5eVVwQW9UeXdlNm8xNGhPTWZqOVZaUzVSdmh1?=
 =?utf-8?B?MW4vS2lWRXdYSTM3MmplNjN5amRGRVArUGZ2ay83aGhGbkorZ0kvamJCMmY2?=
 =?utf-8?B?UXpXMmlkTUxyN0w4ZW1tZWR4MEtBVzJHOU4rbUlHS0pWSGIvTHZENGZaajhZ?=
 =?utf-8?B?VVVMLzNPSHlJZ2xBMzY0Y3lQU283YVFFZGtzUUZ2ZFgwVW41b2ZxaGEzUFhh?=
 =?utf-8?B?WTBkb3dTNVlmd0IwVGhrWnk5UGJGSTZodFdYUCsreERxU2s0QlhtZ2dLbE5J?=
 =?utf-8?B?cmJ3dGt6TUVWdzRWRUZPcE1vZFlqYWFzTEtvUkt3clBlNHdOWHlSalVyUzJC?=
 =?utf-8?B?ZlkyOHZNUk45cXVieC8rSGk5NDVrWXRSR25zejBiQXptM2Z4TUdmR3k3RUV5?=
 =?utf-8?B?SW1zZWR1SlhRcjIxV3NmODJ4OEFFVVVBTnNXMXcyR0swQTEwMHVtaXA3U01u?=
 =?utf-8?B?d3E5Y2o0d2NINytMVkVuMFplQlBuNXdNWW94K09GMHR3a1gzamNwREdHSmUx?=
 =?utf-8?B?M0xhMWg2QmpaRlZKNy9uZjNuV2EvRjVEL3kzNyt1VW9aL2dadnFqOGNoV3Jr?=
 =?utf-8?B?aFBlcUpvdDhWVFM2RURXa2lnaHA4aG5MOXZGSTBlME8rTEZxdytPa1hJNnlP?=
 =?utf-8?B?bTRDRnRkeXJWMU1NUzNIRVRLQVFXbkl4ZDZubWZDbzBycGszSG1sSkptdW52?=
 =?utf-8?B?YnhrR0M3RktKaWlhcmhNZ1pMc1NwQnJUK0NpN0VFTzhYUUxISWdJbkhZL1R1?=
 =?utf-8?B?cW5BNEpza1REYUNvZHd5RkRuaktLWUtQeEcwaGNHUm9BeUdCVWY2VlRDcVlF?=
 =?utf-8?B?MjRxZkxobG5CV21qYkRTb3JneE5XWHhFcGl5bDRBd2NJbWx1S044OUgwdTJz?=
 =?utf-8?B?Y1pmSGdVRHNyVWE3bzRKS0ZnZU84ZG9mUzkyOUZtWmozMDdBNDVEWXlKQWk0?=
 =?utf-8?B?cjNCRXpwNG5pU2JLbDFkWGhXczVhVUNaOTl3ZGhkS3g1WHY4b2JJYmxNT3dU?=
 =?utf-8?B?ajZjY1Nlcnk1RS9RZk9hYVR0cThVeTdmbVllaVVwTGtQWU1uam1BNi9kUW5Z?=
 =?utf-8?B?dm5aRGQvQmJRV1ZoQTIwTUJlMnI5N0tONzFvZ0hMMy9BWUdYUklOaitVdll5?=
 =?utf-8?B?U05uSjVPb080S0VObXZWbEVxTmdid2hqUUpuUUJWemNvdXdMSzR2MkRkUjJ0?=
 =?utf-8?B?TzhFdTVENDNBcDA3L05qekZxak9mcDZBU0RYM2x6c0JVcGFXNlNUYWQzVW1j?=
 =?utf-8?B?cUhuRzBqOEJlZkRUSlUvM1R5cDdRODl5S1lhTDZpcUI2T2pVQmc2N09QZ2hh?=
 =?utf-8?B?cUwwZGQzMDVURkdVdlgvM0NjY0pkMWgzYUZVNENVOHBkK0hFcjhZaUdMRENq?=
 =?utf-8?B?WTRBeCtZeEhvZEVZOE45dUZXV3VIT0drbHFnU1pSRXdYTUVydWVmUjFqSDVs?=
 =?utf-8?B?ay85UFcxT2hBOWJqVXB5cE5jaXpUWEsxZENEMmVhNlhuZllseG5WQnBHSWJh?=
 =?utf-8?B?NGM3R25kY2hvMXVHaEdoMWoyOExSb2Y0NGxSRlJIVE1NUzlHWHNHc2RnTi81?=
 =?utf-8?B?a25ZQjRlejAxQXdjbWVlZzRVL2VnbHRWNHZob2pJQlVSU3VvWjFFY2NUbHFB?=
 =?utf-8?B?UXJYVmRSZUcza1VCRU5Ddkl1V09FUnNrNk1WVXpGb0JDVWVBUUpIUDE1b1VB?=
 =?utf-8?B?VXBtR1dabDg5UGp2ekdUdnpsaHBrTGtGY2NaQ0kybFgrM3ZlYnRtUzFxOXRh?=
 =?utf-8?B?SHI5cm40dW9tS1Q4UG53cU1HZmxXcHg1MnA5VjZXbm9Kb0pZa3lyRzV3NHNw?=
 =?utf-8?B?WVh5c0pzbk1KTjB3UEVOVDgzdk1weHNZZ1dzQ2xuSTdvdDhrVlFpYlc4cGY4?=
 =?utf-8?B?YzJZdm1GNUlxOGtVbjgxVmFrbzE0OHZobFFjcFhLQXBGVkJWOS9KNjhxTnZ4?=
 =?utf-8?B?OEM1KzNpWlhGQjdKTFNWd1BkQkpCTWFBTHJvVXhTd2tEcGxaOFR4UU0xZ24x?=
 =?utf-8?B?VlVaamlyNStaWWNNZ0VVZ0pJRjdJTXVocGd1MGRubUxCL0pXWUlUQjdOSTlI?=
 =?utf-8?B?eklYYjFxRFVtVzJDN2xLSFNFTktWSlNGY1p3WHBJelJqSkR5OFhuVjNEazRG?=
 =?utf-8?Q?YwWs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e479da-c091-48f0-2b71-08d99f70caca
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:55:03.9155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ynjdiwtn4Mj57HmgkELwzZImKKpfwfsJ6udkKlWVCt1adGLQ02DcB+Ya7OJuKtX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1776
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.11.21 um 09:49 schrieb Matthew Auld:
> On 04/11/2021 07:34, Christian König wrote:
>>
>>
>> Am 03.11.21 um 20:25 schrieb Matthew Auld:
>>> On 25/10/2021 14:00, Arunpravin wrote:
>>>> - Remove drm_mm references and replace with drm buddy functionalities
>>>> - Add res cursor support for drm buddy
>>>>
>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>
>>> <snip>
>>>
>>>> +        spin_lock(&mgr->lock);
>>>> +        r = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
>>>> +                    (uint64_t)lpfn << PAGE_SHIFT,
>>>> +                    (uint64_t)n_pages << PAGE_SHIFT,
>>>> +                     min_page_size, &node->blocks,
>>>> +                     node->flags);
>>>
>>>
>>> Is spinlock + GFP_KERNEL allowed?
>>
>> Nope it isn't, but does that function really calls kmalloc()?
>
> It calls kmem_cache_zalloc(..., GFP_KERNEL)

Oh that's bad. In this case we either need a mutex here or some other 
approach to avoid the allocation.

Christian.

>
>>
>> Christian.
>>
>>>
>>>> + spin_unlock(&mgr->lock);
>>>> +
>>>> +        if (unlikely(r))
>>>> +            goto error_free_blocks;
>>>> +
>>>>           pages_left -= pages;
>>>>           ++i;
>>>>             if (pages > pages_left)
>>>>               pages = pages_left;
>>>>       }
>>>> -    spin_unlock(&mgr->lock);
>>>> +
>>>> +    /* Free unused pages for contiguous allocation */
>>>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> +        uint64_t actual_size = (uint64_t)node->base.num_pages << 
>>>> PAGE_SHIFT;
>>>> +
>>>> +        r = drm_buddy_free_unused_pages(mm,
>>>> +                        actual_size,
>>>> +                        &node->blocks);
>>>
>>> Needs some locking.
>>

