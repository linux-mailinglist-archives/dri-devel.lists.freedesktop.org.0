Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFB785C4C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081DF10E428;
	Wed, 23 Aug 2023 15:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26A10E428
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 15:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kijs4TGjCNo6w2N50iHgGqrPDLnB0eB51hWxGzuj++OQ7N8hR17ky36hvgq/YR5fKKS9C+iwXgGTufTQIawU9EQsWzlo1npstPkasuAuL5uBqZ+nXZVNe6EoWTUzDya9rn0kUWGalm9yp+U4NXGnypruYHDCZvJdKZlBaQboKpwxQ0wTlkR17pSQOZfHhEygJXhBAtSWVEvOxE26ePPZaeEMqdbLL0kXQ1bSf9sg1XYO9kv+qsCzNNjZYx4ZeDL9ztTgivBgRdhTO6lYF4yTd2jgKOm3P2pE1/AcGabX91Fb3RxABVtzkp56JU9Qjz/XKZH9ej9mFarJ3iLotGKd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XRjni0mxtP7zxswX5KKb7ejs9T9Kj99T47OPZIe2SM=;
 b=cYYJ2nA3nREvRO7yWcVgcLR4xd2U/i/EpPVY8jmJW6MceJzOS6Q/Hxm4rn3rf3KojNneIzU6UzTzFcPi2BB7F/5JGD54j5dsC0wxvVDuntSiCHPceoJ/p1QxZzXEGC20UPNTapWHvTbG89mi6ffGs9kdSN02qvDF0xmMohVpNIhR0UgqvM1xE5IZJ/dn/7MOumyqFDT+9NADG23cWklvMXnJ8g6SEGS5Wk7O6WckJiC4xVBntjnHVFlLHigQAdVPHLz0XBUt83B/Wrylx4n8gNjilxzr9DJbmOqX5fWLBZI3AWcWPHdxu407da0aD+2c2QhONvc+HgtNIW2SYK4NOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XRjni0mxtP7zxswX5KKb7ejs9T9Kj99T47OPZIe2SM=;
 b=BdMDqQeAJpIQ9dl55jRCpip7wiFjTdd0wIKmQolkltpfia375CvKulP29CBlJjHPjOrjjeThQS9ciFaDWEnKW/fH42hpzx0Qfm3VPDRRGumA1uD8JlcZvP6VkwcwC1lFcxIx63vawBOFoV3QexcgvkSBV9yER3no5tIx6z/l5xo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 15:38:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 15:38:51 +0000
Message-ID: <a3adfe87-31f8-3f8e-6165-6ca4f9144b96@amd.com>
Date: Wed, 23 Aug 2023 11:38:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/prime: Support page array >= 4GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Philip Yang <yangp@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230821200201.24685-1-Philip.Yang@amd.com>
 <690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com>
 <97714a7b-8ea8-0b23-f851-aa337026ce21@amd.com>
 <fd742874-8d85-98e1-b40e-8be2e8b0b6bc@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <fd742874-8d85-98e1-b40e-8be2e8b0b6bc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: a495fcee-769c-425e-c240-08dba3ef0cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTyp1dxTFsKyo5V6sAAb8eNiFlTvEFyu7oWc3mgcsJHV7rWoYP+hgDL38bHXGCfBXrpsJp6jvl2gIei6XSnhltky20Zbdi7Hz6G3YLHtzh0NtIAt5TIUJUvtyUVIR69IvmGTYCeVoFAzaAsl8YQ2JEY0pIm07SKEO7qr7iJAnCCktlth4m580BAwG+PF9I+luj/WOxxNLWV0D66J3HePIUaLKRrt77pzPtSDsar/0YS51v+5HB40rAw9mMyiLY9BnLNL8IuPa0JfLexWzBzqW5DZjWqe34YWE1jm1K6AGnhsko3G1gG3JARRRnDgIJ6Kj8fZf0QpTIq7gTTc5CMh1NkpMvqoeKOfMfIO+YIB8V1sLIkMZ1fkbMPwbtFPgqiVTOMVU+FZFtPDYyfuHT0I3LsKdBvtRohrGwpibN1C2vXquoW/O/noPMz/ucJgi7Jxl6am6BzR4/9nLaFC6dXdF2GpZlvoD4JoZisdfxVPSKDU6CfADkkWHPacN9LYFZ54ShX9+jjg60+IbdXJm/hodB6ox821RYz3fgdFMMXtdLLWE8H2euAQKou6di5tSoeUe0lGWe9nc7kuxZVvWrNrf0srznlmay3lG5/6RraoPbho8WJQry4p5nkesXh+3u5ndD/bujfef4QMomOATBE20Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(1800799009)(186009)(451199024)(83380400001)(2906002)(53546011)(66946007)(6506007)(6486002)(36916002)(478600001)(2616005)(26005)(5660300002)(44832011)(66574015)(8676002)(8936002)(38100700002)(6666004)(31686004)(110136005)(66556008)(66476007)(316002)(6512007)(41300700001)(31696002)(86362001)(36756003)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWhjRnlJQitjRkd3K3cvUXQ0SXpORytLZjgwNThMRlZOcmNJcFkveDl5Mlhj?=
 =?utf-8?B?NzhDd1lLckxzdldpM3UrYlZvbTE3emk4ZWFxMUJHaTdyV25FWTZLQ0ZPVnky?=
 =?utf-8?B?dFllVEFtUXp4Q0p2UGZIQTU3Yy9USVFqRjBjdmlwWUlnUDFJc0YrTUNhOVVS?=
 =?utf-8?B?RTZPVW02RlJRSERTa1hCZy81SmtDVXJJMnBVNHhRYW9HNVAzbFk4aUNmejRi?=
 =?utf-8?B?bCtNSENIQy81NnpGTHg2ME1oRFNMVU5MQml5NTVpaTZuWUJISGdOQll0VEhC?=
 =?utf-8?B?OGFsTXpoTkl3S1JZeHZhQWNwdldUU2lEQ2hXWGlHYlZyWTRkZGcxWmtaQ0Jt?=
 =?utf-8?B?RDlieVFFNzRNdFdqSHNVMkZLMFMvdEdxUHhBd0J4QStTdlFPa201V1lYOGxW?=
 =?utf-8?B?a1UvUlBVVGZzRVdPaEp3ZENFK2NYYXJ2eTlRL2tEeXY2UnpZbUwrNGVCWFR5?=
 =?utf-8?B?QjhOZzhVai9vWDdpNitDN1J1aUoxUGZwNTJLYkdlUjVXWEtjbkJWd0cvTW8z?=
 =?utf-8?B?RTJlaVVYdHdUVU9BQnVqSnkvdUlzaU4wVTErdkVTYmd3RkwxcDc1ZXRDS3o5?=
 =?utf-8?B?dzBHVVZzNDFIWUNUQVpwQlBxeW1abmxBTFlyNGJRUWxyZWtnVFVkL2xKSnY1?=
 =?utf-8?B?K01zYkRpMjBhVDg2SnVEMzVEcG52dlVtTkIwaHFTMGxCODgwem9xcGFhNDBl?=
 =?utf-8?B?RG85cDZIN0xLVWw3OWwyNTNuRkN3b3E2MEJUU0JwOVZDR1M3a1ZuRVdSc2xY?=
 =?utf-8?B?dkdEYzhBaVpaczhFNDRadFcrT3JSNHlQYThBTUN5aTNScW9jREZHRFk0VU5U?=
 =?utf-8?B?SHNuelJEcEZKam1Za1JsVXowQlpaQmVkMUNWYVo5L1BnMlpnZVhtd0xkd2pi?=
 =?utf-8?B?OTFqMDZic3dtUzVwNHM5VjRRS3pUNXFwRHdteFJqcVk4UXFMeUl5UHVRcFl2?=
 =?utf-8?B?dCtCeWZUWmtrZFRWNUFLbHhDamlBUDdORzNWZUhXempUMmtDaW1sSGF1TFlC?=
 =?utf-8?B?YnpScUhFUlZOMVl0NFdxekJMWmVXYjN3a0lBc2hoWTNEMEpQUVBEbmdVZllq?=
 =?utf-8?B?cTg5ZnVoMGJVajZLV1ZCNUphdVRzdnpOZ3ljWkZvYmJTL2djU3pOVVNnZGhW?=
 =?utf-8?B?QjVIN2tSS25id24rcnRiZG93aHJTYVIzMFIzMTNwREFFbFdCR25uSTYvbDJO?=
 =?utf-8?B?WlBBc2dUclo4cnhDK2s1YW9IeDhtSk1sLzh0QzlENVN4eGw0U20xak1QQ2JT?=
 =?utf-8?B?Q1RjMmpNTFBMdW9VZkpCVG1ObDk5eGdXM2RZemdhS0wyU01jeGZRM3pXR3lK?=
 =?utf-8?B?SUNaUnp4Y2Y2SEYwNGw2WG9hNXBGSFJpWVJDcnlkUG9YWU1qM3Y1OTg3TDlu?=
 =?utf-8?B?c2ZsbERLc1o4d0NOWDVVcFdySVhZdlJUQ0JmM0hjUi9EbFJrdTRDcCtXQzFC?=
 =?utf-8?B?RzdubTNHa0tqaHBkSVVZYUtRdHZOOHBJTGpZNWU2bkhhWnV5UDRBUjZ2aERX?=
 =?utf-8?B?cEVHMk5RdGEvbFB5L0JHc3BDK0FjTUZEaHpXRFhad2ZGcW4wY1BsSlZlRzZq?=
 =?utf-8?B?RVhUa21aUk9RUGJEZ3Z6ZWZCR24xQVpobWwrVUxDYUJUTWNDL3BYb1dlNGEw?=
 =?utf-8?B?dEdjVWtOZnQ5VEwySEpPWkFLY25NRUdRWkRCQ1kwak9XQmF2ZlRiczdPQm42?=
 =?utf-8?B?ei9DbHNWTGdNN1VTZVJsY0Q2R2RiUzNNcHhodGVIY244OGl3WGExbGkxaC9y?=
 =?utf-8?B?N0RhNndhVy9WajFUbVovZURmQUhjbXcwWVY1NzJWbjc0VnRnWmw0eHg0SFZp?=
 =?utf-8?B?VlhaREdzd1ZDQ0had1hKOE5wa0syTnNsTXdORzlYQUR0bldIUmRIczhuc0FW?=
 =?utf-8?B?aGRkWmNOS2Z5SjBYZnFtdHlNOVVkT1VHS0tvVmV6SjJCUXJCdm9lRS9lZjBR?=
 =?utf-8?B?c1RpdWxHd2EvejluMXRpd252M2RQcEcwWFpqdkthN1kveldCLzNSUTJ3ZjZW?=
 =?utf-8?B?ZVpCaTFaOHdEMnRYcWFpNjI1dkE0Z3ZVMDIrVmRGcVAvL3pSLzBhc2JjOHRu?=
 =?utf-8?B?RE5LNEloWWI0M1FLSVNjWUQvT3Q1YVdTSnNCR2l1YnAxUXgzZ3BVdjJrR01j?=
 =?utf-8?Q?rSw5ZKNkBy2UN+mW+rMt7bCTB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a495fcee-769c-425e-c240-08dba3ef0cdd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:38:51.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWFJSVmHPUSYzJwoUMxefLTW5D9uOD5DKIzRrckz39T+2y7lzJuEvm+PyZZMMphu06glN/LznuLIOyX2Wu7GWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261
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

On 2023-08-23 01:49, Christian König wrote:
> Am 22.08.23 um 20:27 schrieb Philip Yang:
>>
>> On 2023-08-22 05:43, Christian König wrote:
>>
>>>
>>> Am 21.08.23 um 22:02 schrieb Philip Yang:
>>>> Without unsigned long typecast, the size is passed in as zero if page
>>>> array size >= 4GB, nr_pages >= 0x100000, then sg list converted will
>>>> have the first and the last chunk lost.
>>>
>>> Good catch, but I'm not sure if this is enough to make it work.
>>>
>>> Additional to that I don't think we have an use case for BOs > 4GiB.
>>
>> >4GB buffer is normal for compute applications, the issue is reported 
>> by "Maelstrom generated exerciser detects micompares when GPU 
>> accesses larger remote GPU memory." on GFX 9.4.3 APU, which uses GTT 
>> domain to allocate VRAM, and trigger the bug in this drm prime 
>> helper. With this fix, the test passed.
>>
>
> Why is the application allocating all the data as a single BO?
>
> Usually you have a single texture, image, array etc... in a single BO 
> but this here looks a bit like the application tries to allocate all 
> their memory in a single BO (could of course be that this isn't the 
> case and that's really just one giant data structure).

Compute applications work with pretty big data structures. For example 
huge multi-dimensional matrices are not uncommon in large 
machine-learning models.


>
>
> Swapping such large BOs out at once is quite impractical, so should we 
> ever have an use case like suspend/resume or checkpoint/restore with 
> this it will most likely fail.
Checkpointing and restoring multiple GB at a time should not be a 
problem. I'm pretty sure we have tested that. On systems with 100s of 
GBs of memory, HBM memory bandwidth approaching TB/s and PCIe/CXL bus 
bandwidths going into 10s of GB/s, dealing with multi-GB BOs should not 
be a fundamental problem.

That said, if you wanted to impose limits on the size of single 
allocations, then I would expect some policy somewhere that prohibits 
large allocations. On the contrary, I see long or 64-bit data types all 
over the VRAM manager and TTM code, which tells me that >4GB allocations 
must be part of the plan.

This patch is clearly addressing a bug in the code that results in data 
corruption when mapping large BOs on multiple GPUs. You could address 
this with an allocation policy change, if you want, and leave the bug in 
place. Then we have to update ROCm user mode to break large allocations 
into multiple BOs. It would break applications that try to share such 
large allocations via DMABufs (e.g. with an RDMA NIC), because it would 
become impossible to share large allocations with a single DMABuf handle.

Regards,
   Felix


>
> Christian.
>
>> Regards,
>>
>> Philip
>>
>>>
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_prime.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>> index f924b8b4ab6b..2630ad2e504d 100644
>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>> @@ -830,7 +830,7 @@ struct sg_table *drm_prime_pages_to_sg(struct 
>>>> drm_device *dev,
>>>>       if (max_segment == 0)
>>>>           max_segment = UINT_MAX;
>>>>       err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
>>>> -                        nr_pages << PAGE_SHIFT,
>>>> +                        (unsigned long)nr_pages << PAGE_SHIFT,
>>>>                           max_segment, GFP_KERNEL);
>>>>       if (err) {
>>>>           kfree(sg);
>>>
>
