Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED70509201
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 23:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AA310F2BA;
	Wed, 20 Apr 2022 21:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C46A10F2B0;
 Wed, 20 Apr 2022 21:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oga6nEUrg5c5DWR1IPTC4Ct9mwDzLHfgTMUP0Obsf4hMLgJyv7gaG5csTGASFaTYKPpQei+96eZcFy2fbXJE+rzSKCG+izSI2zCbIcDzXTxyoifUUud4QTPcpy+NQQK1WPk2QWg9+UM0YYD7vnRenY/Icv8h2ZYdQeFU6m1GnbQqOYM3vXpTkuMDI8Rfc3VcTxaETdTvW3LUTj9/71n5VnmYjcCjwdTRCB+D8d/Fp9lb5hc+zThWkv94aa2fDwtQxLEiqQVxY2rjtvbqImqcdwY8OIFpRdT9XqhiPFZKHXxZ1yYueuaVCH4QopNa9hJgEKaz+bfHdXld/5GMYgfV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EwNNoLjKbcow+YYylUsOiDnWuBLWiO6WX3qq8+n6NA=;
 b=FCGYFqEh14LBn8M3DcVTLWM9hM8kL/tubiw3ZT/aVv2D85oOe3ULsDFotumBns/KVS5MoAzQfPStVhntoxhc6QkbfGafJc8twzXe7nqrggjce1VpKoEI1Mry3I2OXzEc+AIfwJeOs202l8Ec4ivNCJus92L9TqBlZ5D9il1J3MwLMy0ZZ8acOrK7fq51DpSjGSy9b+KN8bSpx+sRziSmfMrljZro4i9pp5qlbqiUQYtz30hLUkFtUtXOkeesOvRjrzAB0ujo4FNQKSYmVMwhsoPkSPhkZyuz0YCc3zkHWpu8cJhfIvkLaoZ1kD+gkgfXxThegUaUBbFWi3kUKpKT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EwNNoLjKbcow+YYylUsOiDnWuBLWiO6WX3qq8+n6NA=;
 b=H5JF9PpwWBcu/vtmNfyr2DOVlqxM+3a8PCa9kjSwqbT/arf8tjnS73SDDcWcac4rGNonaVcqK0TjaCgt8qqdnyXd9dj1RX5pLPDGnFuceDM2Qa+FtSqNtPTesvrrkNFCYuVNq8GozA2PSlTAfJJCgLDWCo96vF4JA/C93F7oaTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN6PR12MB1346.namprd12.prod.outlook.com (2603:10b6:404:1e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 21:21:24 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702%9]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 21:21:24 +0000
Message-ID: <6d1ec935-3b41-fef6-efe3-577f8316edd2@amd.com>
Date: Wed, 20 Apr 2022 17:21:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
 <b5f6cd30-d7c7-c615-9723-68746e35b4de@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <b5f6cd30-d7c7-c615-9723-68746e35b4de@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:610:59::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19de50f3-6d8d-4fa0-b4e8-08da2313b912
X-MS-TrafficTypeDiagnostic: BN6PR12MB1346:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1346A1BEA95E57C8911E259892F59@BN6PR12MB1346.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3XN4kK4WpMBgXLUfL7LemUdzg0WfoFhIZcKBGEeaakXxKmywHIhw2v5jTxGIADYdr6xr5TstI3fQ+oUB9Ow9U0cgoEgjxlxjFpVfbi33+UM7euUxy9Qdcwx3n4zlE2UE/rxtji/VjzJY9eNVxNAfAe0JPBc72BWSFoIPhzsm5/auLkwpaycO0cn50bLbP1+/VM27VNQk5Smyf9wEifoP/Yg+nOEQHRkRl3pS366h9i+KC7g7/cAvE0wS2Qn9DHp1ycqIjFGtheng/QaJXg1kjVHQhwnHf53fIZv7CD/HsK537MwvJpjy5B1oWOuVssw7wyo+0IgnRfp8vKTfa1OtbGD+JiXxfa54QaUNdOO3OrOwY+JTcZ1qOoKgmRUijViH51J9z579kI5H7ZKSd11C3oD56attxE2D9sJ0wFzGmeCt+L1PQMMDZLdsy5lh6gd1Q/XpKT/oaX6CJ37g/EzNcpggt9+seROAB9NIprhmAE9CLvws1SpQYXehdDTEJ5VK7TLMDecW0qp89EncLBHwB5cxWATl8VCR0nNwA6SxuOxiKKvCHxLVZ//9B1BNSfd3N738hOBU1Vg6Mvi7M/VnJMgHhRMyaNeM3fds+DwlI9B6tNAyW9voBDRS8JkzylrGPRktrS/YZcruo+7JWt89FRMMl/as3Btu+INT9LP3XdxkvYBjh5JrF6BdERgoINxJOWQTnrDW3zAUctxP8aqu7Nuf/6j+GRf1buUE4KhFkuSOnCADFDsb9wjSz1gpGgYgMJFBQuCP9vGAOT8DcVa/C4wK9KwbbOjvc8x52dqOkxrr52ima/anG04z1eHBAOubY3Wxgk1f7fiD9/+Yd/I9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(66476007)(36756003)(110136005)(66574015)(66946007)(38100700002)(316002)(8676002)(66556008)(31686004)(6486002)(26005)(508600001)(86362001)(186003)(6512007)(5660300002)(53546011)(31696002)(83380400001)(6506007)(8936002)(44832011)(2616005)(36916002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUQ3RHVKelNwdGFvK2pWVEhwRk1wdDdhbGlpeklOM1pjRmYvUWFZaWs2VEs4?=
 =?utf-8?B?Y1FCb1N0d2M5eE84ZmE3S0ZDQm4wNFZsZ0NzR0dtM1BValZoQnJjdWxTWTRQ?=
 =?utf-8?B?WGE4TXVRWWcxRW82MkYvWlI1Z0ZEbG0rZEVHc2xOc3pzaTVqY0JWN3IvMFdC?=
 =?utf-8?B?TUExa2dIUEQ0UTQzdG0zcytiRjAvV3lvMXVTNEw1cUgxRVhCTkRtMytXYXhE?=
 =?utf-8?B?Zk1PR1RoSmRkNFRob2RsZm1QU0hZUUdrSUlRTE1YMUZBQWs2T3VIemYxTzhS?=
 =?utf-8?B?OFYrejFyKzBEQVVmc0VDTnpKdEc0Q003U2FSVXpkL0NZdVF4VUcraEJSdkVI?=
 =?utf-8?B?NE1ZaHc4YkVLTm84VXZpZDlDRytGZjc4N01aWUdFMUVYQzVNaHR1a3hDcUZN?=
 =?utf-8?B?aXRoRWJ3K1R6aEdDc0N2SWQzcnZ5cjFTZFpWRlBwZzJXamZveVoyUmx3NDVY?=
 =?utf-8?B?Tzd4eVpOcHBRMVFTNzd4dG1jci9VbWVTRm1sRkhKSmhnNUU4eG1vemRRYlZH?=
 =?utf-8?B?L012U2NocHFYZjh2UkpGeUg4RkxkUTJPTzNMckZ2TEE2blU5dTJwWitDam9s?=
 =?utf-8?B?KytJbE5PRzdZRUNVSHAzR3ZoOTgyazJRdjJ4NXlIemN5ay9Pd3NOb0RWc2ty?=
 =?utf-8?B?a283bHM1cFBsK2I2ZDJpd0l5YnJBOUR3S2l4cUhpdjUzWU5yNE9vYWpBSEty?=
 =?utf-8?B?SmwvRENLSlpkc2h4aEpkdzRCT0EvQWNmTHdGbGhyUWw5bkdpblpURXlWcFE5?=
 =?utf-8?B?UW5wbGl5cXJFc2pJK0FNSkNyc2ltWXQxOFFyaStobk0xRUg3QjZSZWhFSS92?=
 =?utf-8?B?OHRvVTlvNmVoYnZiL0RXcDhhakJ1U1NIY01XekE0UC9nZ2pCaEtwR2VHUitx?=
 =?utf-8?B?RVFycVF0cnZYckVnSnZKZUZ3b0tQZmd5WUF0SzhCZjFUMU94ZzE5VStRZVpD?=
 =?utf-8?B?ZFBndVZDaVd2V1hYcFZIUGEyY2FaNFhTVHR0UzRWelprdjlJcGxIblVTZG1v?=
 =?utf-8?B?TkM5dW5FSHZXbzh3REZ5c1dpMGlvejlLa2UycmdoWllSdXBGNDl4Q2lncEVq?=
 =?utf-8?B?aHp3RjNFVlpxMlI5WlNIOHZpYkpSSDM0VVZtODlJNHdkSHJYWjRjSlFxNWo5?=
 =?utf-8?B?bFFVclVhbjNSRW9iLy9rWkxKM2xmN0FvS3VndVFSMHpoOXM3Y0NnQlNnTlVQ?=
 =?utf-8?B?VUVISzgwQkhiNlAySE5Yb2lPek1ueXZCV2s2VmtRUmFIZUp5bzZ6dGpiem0z?=
 =?utf-8?B?SDdMalpqZloySFppSHppYXRhUnozOEZnL3pUUFZXWDlaUklUNGltb2NpRmN6?=
 =?utf-8?B?dUhIaWlQdEh2V2NPQkZUdzRUdG5VdUdOUG5hejlpNGhwOVV2Q2pONmZpWERu?=
 =?utf-8?B?WVQrazExbGI3S241ZDllQ1JQVFRVMWR0NzFOVitYSzdnSTk2S3hVcVFGaS84?=
 =?utf-8?B?c3ZmekYvRW5Fb21kOTJpeWhreVU1T0xwQmdweDRaRWI4Q0h5NndhL29vZU5T?=
 =?utf-8?B?ZVQ3WWNiVE5uQnJTZ0h1UEExMG1Sd2tPWkJKL2pqYUF6RjJJWVJkWlA2Unht?=
 =?utf-8?B?cVVqZzJvN1VJOHc5MDc2SzRWcHN6ZmpHVjB1QUh5Y2JqZWgrdnIxRlpVQWlv?=
 =?utf-8?B?OVBURUxqeVA4azJ5SFFYaFBxcmJmSzYzSEJ0MTV6dW9zdmtqZFcyNkZyNDIx?=
 =?utf-8?B?R24wenFVZVVCYXFYMDk1Y0ZFVFFteDNNY2RITTN3eXNoNDcya0VUU09LN0xG?=
 =?utf-8?B?Zm5ZWG03UzYrZ2lJZEZBWHZ6clpmaEs1TC90YVF2eXU1UExqNTZ3Ujc0ZUhK?=
 =?utf-8?B?QVkwY2cvdDVCOEw1aTYzbUJiK0t2RlJXVnpIWVl4eXlXTUFQT0J3OWF1a2JM?=
 =?utf-8?B?RTFLTjhHUkczUXQxNFppZGhqbkdPVDc0OWdmZjlRRGdudU5HTlpnT1pkelFj?=
 =?utf-8?B?TEF4V1NNakZHem5kelZ3WjllUkRIdEFHUVo0NlM3SEl1ckFLWk02Zll3Y0dQ?=
 =?utf-8?B?UVViM3ROKzFxL1BybElGTnROK1Uva1ZlY3VpM3U4RmNDOEdXcTQvWEcrSSs1?=
 =?utf-8?B?YVNsSFN1azVyQmxNUTV1M05mL2pnNzgwUmhTaDg5NGQ0eGZKMjUvVWJ3a1ZS?=
 =?utf-8?B?ZnpTR3V6RlpQZlZjTVBaeEc3K3pxQUV2K0Uyamx4cE0vMTdzN3VNUFdtbUlm?=
 =?utf-8?B?L0FMSlJZN1d2WlByb3ZqN1FvUDFpVC8vcU43TTV5ZjNEZE9RNXZzSFBLNGlx?=
 =?utf-8?B?akkzWUt2citjZy84eGgwSUFIMi9yTmw4dHB2cHQyZlBUemRWWno4cndBMXQr?=
 =?utf-8?B?d1VVZmhDS0dIR2l1aUdvdWx5VU5DOEV0Mm5CSnk5ZkEzcUJkeHNLQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19de50f3-6d8d-4fa0-b4e8-08da2313b912
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 21:21:24.4114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83/XkYroARHCMpeeMIkoYhtM7e0Sv2nLzyQPstWT+HAAhFZM1L7++Q/m+pXFHukZnZoA+td98XWLojjl2plMpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1346
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


On 2022-04-20 09:23, Lazar, Lijo wrote:
>
>
> On 4/20/2022 6:26 PM, Christian König wrote:
>> Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> Hi Chris,
>>>
>>> 1) Change the test case to use something larger than 1TiB.
>>> sure, we can increase the size of BO and make test pass,
>>> but if user really want to allocate 1TB GTT BO, we have no reason to 
>>> let it fail? right?
>>
>> No, the reason is the underlying core kernel doesn't allow kvmalloc 
>> allocations with GFP_ZERO which are large enough to hold the array of 
>> allocated pages for this.
>>
>> We are working on top of the core Linux kernel and should *NEVER* 
>> ever add workarounds like what was suggested here. >
>
> AFAIU, for the purpose of ttm use, fallback to vmalloc is fine.
>
>  * Please note that any use of gfp flags outside of GFP_KERNEL is 
> careful to not
>  * fall back to vmalloc.
>  *

That's weird, because kvcalloc does the same thing. If that were not 
able to fall back to vmalloc, it would be pretty useless.

    static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t flags)
    {
             return kvmalloc_array(n, size, flags | __GFP_ZERO);
    }

Maybe kvcalloc is the function we TTM should be using here anyway, 
instead of open-coding the kvmalloc_array call with an extra GFP flag.

Regards,
   Felix


>
> Actually the current implementation documents the behavior, but it is 
> deep inside the implementation to be noticeable - at least not obvious 
> while using kvmalloc_array.
>
> Thanks,
> Lijo
>
>> Regards,
>> Christian.
>>
>>> the system availed memory about 2T, but it will still fail.
>>>
>>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
>>> fallback path.
>>>     the 5.18 kernel will add this patch to fix this issue .
>>>
>>> Best Regards,
>>> Kevin
>>> ------------------------------------------------------------------------ 
>>>
>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>>> *Sent:* Wednesday, April 20, 2022 8:42 PM
>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian König 
>>> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org 
>>> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
>>> <amd-gfx@lists.freedesktop.org>
>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>> exceeds kmalloc limit
>>> Hi Kevin,
>>>
>>> yes and that is perfectly valid and expected behavior. There is 
>>> absolutely no need to change anything in TTM here.
>>>
>>> What we could do is:
>>> 1) Change the test case to use something larger than 1TiB.
>>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
>>> fallback path.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>>
>>>> Hi Chirs,
>>>>
>>>> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() 
>>>> function to verify bo size,
>>>> but when driver try to allocate VRAM domain bo fail, the amdgpu 
>>>> driver will fall back to allocate domain = (GTT | VRAM)  bo.
>>>> please check following code, it will cause the 2nd time to allocate 
>>>> bo fail during allocate 256Mb buffer to store dma address (via 
>>>> kvmalloc()).
>>>>
>>>> initial_domain = (u32)(0xffffffff & args->in.domains);
>>>> retry:
>>>>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>>>>                    initial_domain,
>>>>                    flags, ttm_bo_type_device, resv, &gobj);
>>>>         if (r && r != -ERESTARTSYS) {
>>>>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>>>>       flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>>>       goto retry;
>>>>                 }
>>>>
>>>>                 if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>>>>       initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>>>>       goto retry;
>>>>                 }
>>>> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>>>>               size, initial_domain, args->in.alignment, r);
>>>>         }
>>>>
>>>> Best Regards,
>>>> Kevin
>>>>
>>>> ------------------------------------------------------------------------ 
>>>>
>>>> *From:* Christian König <ckoenig.leichtzumerken@gmail.com> 
>>>> <mailto:ckoenig.leichtzumerken@gmail.com>
>>>> *Sent:* Wednesday, April 20, 2022 7:55 PM
>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>> <mailto:KevinYang.Wang@amd.com>; Koenig, Christian 
>>>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>; 
>>>> dri-devel@lists.freedesktop.org 
>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>> <dri-devel@lists.freedesktop.org> 
>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>> amd-gfx@lists.freedesktop.org 
>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>> exceeds kmalloc limit
>>>> Hi Kevin,
>>>>
>>>> no, the test case should already fail in amdgpu_bo_validate_size().
>>>>
>>>> If we have a system with 2TiB of memory where the test case could 
>>>> succeed then we should increase the requested size to something 
>>>> larger.
>>>>
>>>> And if the underlying core Linux kernel functions don't allow 
>>>> allocations as large as the requested one we should *NEVER* ever 
>>>> add workarounds like this.
>>>>
>>>> It is perfectly expected that this test case is not able to fulfill 
>>>> the desired allocation. That it fails during kvmalloc is 
>>>> unfortunate, but not a show stopper.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>>>>>
>>>>> [AMD Official Use Only]
>>>>>
>>>>>
>>>>> Hi Chris,
>>>>>
>>>>> you misunderstood background about this case.
>>>>>
>>>>> although we expect this test case to fail, it should fail at the 
>>>>> location where the Bo actual memory is actually allocated. now the 
>>>>> code logic will cause the failure to allocate memory to store DMA 
>>>>> address.
>>>>>
>>>>> e.g: the case is failed in 2TB system ram machine, it should be 
>>>>> allocated successful, but it is failed.
>>>>>
>>>>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to 
>>>>> store allocate result (page address), this should not be failed 
>>>>> usually.
>>>>>
>>>>> There is a similar fix in upstream kernel 5.18, before this fix 
>>>>> entered the TTM code, this problem existed in TTM.
>>>>>
>>>>> kernel/git/torvalds/linux.git - Linux kernel source tree 
>>>>> <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&id=a421ef303008b0ceee2cfc625c3246fa7654b0ca
>>>>> mm: allow !GFP_KERNEL allocations for kvmalloc
>>>>>
>>>>> Best Regards,
>>>>> Kevin
>>>>>
>>>>> ------------------------------------------------------------------------ 
>>>>>
>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>>>> <mailto:Christian.Koenig@amd.com>
>>>>> *Sent:* Wednesday, April 20, 2022 6:53 PM
>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>>> <dri-devel@lists.freedesktop.org> 
>>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>>> amd-gfx@lists.freedesktop.org 
>>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>>> <amd-gfx@lists.freedesktop.org> 
>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>>> exceeds kmalloc limit
>>>>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>>>>>
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>>
>>>>>>
>>>>>> ------------------------------------------------------------------------ 
>>>>>>
>>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>>>>> <mailto:Christian.Koenig@amd.com>
>>>>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>>>> <dri-devel@lists.freedesktop.org> 
>>>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>>>> amd-gfx@lists.freedesktop.org 
>>>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>>>> <amd-gfx@lists.freedesktop.org> 
>>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>>>> exceeds kmalloc limit
>>>>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>>>>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use 
>>>>>> vmalloc()
>>>>>>
>>>>>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>>>>>> when __GFP_ZERO is set?
>>>>>>
>>>>>> And even that is really the case then that sounds like a bug in 
>>>>>> kvmalloc().
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> [kevin]:
>>>>>> it is really test case from libdrm amdgpu test, which try to 
>>>>>> allocate a big BO which will cause ttm tt init fail.
>>>>>
>>>>>
>>>>> LOL! Guys, this test case is intended to fail!
>>>>> *
>>>>> *The test consists of allocating a buffer so ridiculous large that 
>>>>> it should never succeed and be rejected by the kernel driver.
>>>>>
>>>>> This patch here is a really clear NAK.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> it may be a kvmalloc() bug, and this patch can as a workaround 
>>>>>> in ttm before this issue fix.
>>>>>>
>>>>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>>>>>> {
>>>>>> ...
>>>>>>       if ((flags & GFP_KERNEL) != GFP_KERNEL)
>>>>>>               return kmalloc_node(size, flags, node);
>>>>>> ...
>>>>>> }
>>>>>>
>>>>>> Best Regards,
>>>>>> Kevin
>>>>>>
>>>>>> > to allocate memory, when request size is exceeds kmalloc limit, 
>>>>>> it will
>>>>>> > cause allocate memory fail.
>>>>>> >
>>>>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>>>>>> >
>>>>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com> 
>>>>>> <mailto:KevinYang.Wang@amd.com>
>>>>>> > ---
>>>>>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>>>>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>>> >
>>>>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > index 79c870a3bef8..9f2f3e576b8d 100644
>>>>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object 
>>>>>> *bo, bool zero_alloc)
>>>>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >   {
>>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
>>>>>> > -                     GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->pages)
>>>>>> >                return -ENOMEM;
>>>>>> > +
>>>>>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>>>>>> > +
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> >
>>>>>> > @@ -108,10 +111,12 @@ static int 
>>>>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
>>>>>> > sizeof(*ttm->pages) +
>>>>>> > sizeof(*ttm->dma_address),
>>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->pages)
>>>>>> >                return -ENOMEM;
>>>>>> >
>>>>>> > +     memset(ttm->pages, 0, ttm->num_pages * 
>>>>>> (sizeof(*ttm->pages) + sizeof(*ttm->dma_address)));
>>>>>> > +
>>>>>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> > @@ -120,9 +125,12 @@ static int 
>>>>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >   {
>>>>>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
>>>>>> > sizeof(*ttm->dma_address),
>>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->dma_address)
>>>>>> >                return -ENOMEM;
>>>>>> > +
>>>>>> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
>>>>>> sizeof(*ttm->dma_address));
>>>>>> > +
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> >
>>>>>>
>>>>>
>>>>
>>>
>>
