Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC1387E4A
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28D6EC47;
	Tue, 18 May 2021 17:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4F6EC47
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 17:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1zm6r0bdD1veMHLpYv6LozVjJdrEsI4I+P0RzO2BPI5vnvRnRQzUYJlLeX6jBqLRI8kWkLksxxjRx3XeLcTnEjwxS+NI4lLlfIsc3F9O9vuCpvtfbBTY/bknCh639qWhweiBDRdzzvfkQbPyPLeJ4gEZoiFbgdpv6gCm/9wSLQtUx1QNjFDnRZDWEVfHrEhyfqaQQPXIFVEAq+I73KzvsbatvcWnQN2JXWngK41k8gY9asrVwRyxFcg7C2g38f+XBngYN+TNWDKylzDkJYWpXw4tR12MrEC0P74TVMJ5npw4/gDD+1nNDRM52j4UPmb1A7kjc+oBTS3B8X5C4qY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5TVcgc4f+8LjHPnbD1/wk1MPSuPzAKEOvL7lYgSSRA=;
 b=YEW5RCXeyEdqAARcQfsLNd1Ee5N0gZgLanNHuRaz0QHwSSX3EjiRY4eyNjYikqZlKg04+AUNAqTpITj/LludfnL3M/whIlq6ONx2OQdZSz3DRsHTTcsiREHRAgG7i6+8WgaBWLfS44Y7No/liiidLGsm94KZiqboQGVD5Vv/0kIDw9ZsoMIJl2bMlq1TgZI/BdCQ1W5FgrghTFKfnEcDlZuk4EJHnUFzAPq0z+NjSQ46pWKvCxckBbZTR/H8hqsmk1FQ62h9vyx8koH1oPifJmUw0JSl8Kw/JYyW+FBWOWpd2qIHmSd4gjmFxEqsf0z2AnIDfoBlxhRjD4Mv7mFkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5TVcgc4f+8LjHPnbD1/wk1MPSuPzAKEOvL7lYgSSRA=;
 b=UGA8VcLQ7vBrjU+tY7vjQapJtLz4Q1kH/vfc/QoSNwYyMNnEk2PerjZZN+WklXKN2SVnBHF6qDJWkGYSYIlhym8ZmGEYALVB4r/MpamoseCkayoofPnh70ls/NrnrEWN+qilh4aJGERKhhS3xKOtLwmT2o6cj+8+svUG6ZDzEQI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4929.namprd12.prod.outlook.com (2603:10b6:208:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 17:17:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:17:52 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
 <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
 <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
 <01128dfc-fb5f-6247-9feb-9cd05586d790@amd.com>
 <a924457e-321e-9f16-82c8-2462c2ae7043@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <51be0ce4-9698-2a1b-fcd7-0a42e4acc83a@amd.com>
Date: Tue, 18 May 2021 19:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a924457e-321e-9f16-82c8-2462c2ae7043@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: PR0P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 PR0P264CA0211.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 17:17:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05f1b694-d7c3-4e11-210b-08d91a20de75
X-MS-TrafficTypeDiagnostic: BL0PR12MB4929:
X-Microsoft-Antispam-PRVS: <BL0PR12MB492956BC981354B2152D6472832C9@BL0PR12MB4929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5IZwsBPKdi8Poc1PCMsWwMumAmuVkqS+6VvKnOwdnIP1QVnJQwXiYU2HhnKdBeaNvvwIWIjpSCleSE0xNUmVMoTGd+PD7KowdNSmU4k0rVTb4GZu6+rYKOBbD58HRYEUKZI+tIEuubt9Omtgk2BxTox3lNBaFGYY2DKjaWgxVd5+RxBIJZqHK9jLu6kFS9JYZqrKB+GZyw9Rnh6XJU7umvFQ8UDF4rN5gEaWzVQ+TqWw4A87TAi6WhEVVNVWKJiHSHm/0t4vRIMMBU18zwzexExPXJVdjtM7+4hTy7HEmPuiN9pdwP/+K+k2YgZEpas/q1ZAvUrKn1aoeFRygFaPL08lssnaJ/i2GOk/9sFd9sSPibenMFR/iylMWit87QQ7V9hIGRJhEjdZsu2MBt1V/tlEGc94HBtJxmckNhEMY37jTB65lzMnA0pddsWKgDyqu8/RIXEzPNIUqXMvxm4yPSJ9SLARbpLSqOMnvkOd8LvFddMgEzzE8w6z+VHSLuGW7n1jFeYjWaZy5MPIpKYDy8jce6qwRiewkQ4s9c6UyzO8n0kgk7q0hi2L7MlRbJsS7Sb2Wu9AQWs7HEnGUCJvn5zK3Tl+cPnkEoePxt+BVwHUUZIKm1V/rdPFuq29HVotwQ4dWKiryAmGk0t4a0+a1ehDheCqOKqEanmvxCBnhpfcOZCoW/81W77DntgF6D97
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(8676002)(6666004)(66574015)(8936002)(54906003)(83380400001)(38100700002)(4326008)(2616005)(86362001)(478600001)(16526019)(186003)(2906002)(31696002)(36756003)(66946007)(53546011)(6486002)(31686004)(52116002)(5660300002)(66476007)(6916009)(316002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2lKOVI4YW5nY1dJUlBDUFNlV0VHTk04WWxxZTM5bkkxT250ZFQ3a3ZkTGVq?=
 =?utf-8?B?NDRyWWRZelBpZGIycktCeW92MEYrNU5iZmYrV2g1bUdTREZEc016SkQ2WUI1?=
 =?utf-8?B?Zm0vTnI1Q2Y3V2twZWtaZmpySzByS3FuRE1GcFQ0cERhK3pvemtrZ2szQitW?=
 =?utf-8?B?TFI0TlFWZE82elYwVVZDSGFwcEhEVlB1VjVYbTlTSGlnNnFDTDBBdlB3eTF6?=
 =?utf-8?B?bFJsTnZsT1plSFkrbFo4eE9GWTVQN2NrSks2K1NNR0NsaGZWaXpzSFJjditT?=
 =?utf-8?B?Q1FEN05XZ2xwL3ZXNklyM3kwejlWQmljTEZtZW5IY0ZrRHB3VHYyVjU4RFF2?=
 =?utf-8?B?OWRhaU1XazZLdUxFY2QrY0FZdlNoZ3dwMlU2MUowZWlqRlZWQjZHQkFDSW4y?=
 =?utf-8?B?ZnJybGRvVVlFVEd2YlJleG5hUmFEZkpWQkJyd2tjV0lhRVA0ai9Ca2dHUjVY?=
 =?utf-8?B?bEZGYWVnQ1VZTkJ0NjIzZFhMMnl3YWdZOWFkMFlhZTdBVDVZNHZwRWwwb29o?=
 =?utf-8?B?b0ZCL0NFRHh2VVBCaCtqOW14Ymh4dHc2d3VvQ2dnMFU5N1FjZS9sQ1hRMTJO?=
 =?utf-8?B?WjBYVXZ4ZDBOM05iSG9vdWtDOTY1YnJBN1JzVUt3QXA0Ymh0cHova0ZQTE1K?=
 =?utf-8?B?a3JFYk0xK1ZUKzJSTXZ6dDRacmFrbS93Nyt6c0lZcTVEMzJ1eUdueTFKZ1Y4?=
 =?utf-8?B?OGNLNE51UGd2bEVQUmlCak11eUt6L1h5R0wyb0c3aEJVTDhqWHpiR3BBSnpk?=
 =?utf-8?B?SFp5WGdETGRlc1ZPQU5GUDBldWxwZFN3NkswSForVXRuaFRmdndhZE4yYk9z?=
 =?utf-8?B?Z1NXSS9YbUFBSzBlZW1qSUFhTGFIdW5NZE9odS9QRkw0SVF0RksycXpPcmIr?=
 =?utf-8?B?UFkxK0kzOFhGeGVwbzR5WTRFcHJuN1MyME0ycXNjU0VBTWs1N0luUk50eU5J?=
 =?utf-8?B?WmdZemhpQU0wQWRuLzNCWXVBNHU3QUowdkRBUm1FN2RITE1YZ1dVWWNXKzlS?=
 =?utf-8?B?Yi9NUyt4aXBMaHIvZkJrd0tuKzcrYkhacFVteGdMQ3liZGRCdStNR2NmZFh0?=
 =?utf-8?B?WFRmMlRVdkxhWkdmOFlsTlJUZFRDRjQ5SDZDMWI5N0ZRdzBJT3Y2RHhianFV?=
 =?utf-8?B?RGlxK0prRmR2Tm9IT0Y1WnBwQkFCMlNpVllkYzlKTEFiSTAyUCtZc05vbi9E?=
 =?utf-8?B?ZCtIdEk5RnRNenhlNnJ2L0pacGNXdTRVNWdMOU5oS2lvSjBmQ1BsdXkyaUw3?=
 =?utf-8?B?eVVZVXdVQ0R0aW9yQWlGRDJVVVNIM05pSjJSUzJhdm1XcVZaTHg1eWo2Z3lt?=
 =?utf-8?B?UlhFeTkwYUhsUWlVOTBDNElpWnNldXNwZk5yQTdMK0psMVF1NlJUanZ1NmlP?=
 =?utf-8?B?bzV3M1dtZms4cUZRUE5CTVdwN2IvLzZoSEUzTFJ5bEMxN29VRGIxTGVkeFd3?=
 =?utf-8?B?VEhVc1VwUW5wTGc1cEFyZlVscVR0d2Y0NjV3WW9tKzZYVTJHZ2VJQkhrRjY3?=
 =?utf-8?B?Z0JWNEVTKytieFNxU1FGZ01oYzN5cVVWVmR3ZWNnWEFUMlREc0t0TEM0NGZa?=
 =?utf-8?B?K3pMbHhzRGlQWmh1dzRSSVE1WFBBaDc5T0dGSjQxZ3NNTmQxREtQN0twYXk2?=
 =?utf-8?B?TWNrZGlqRFJZbnE1Z1A2T0VhQngrcWw1Z3RTNjh3QU5BbTRUczRaeWhWSXQy?=
 =?utf-8?B?a1BjckQ4RCtHaXg1R0wvcjI5K2xsTXM1T3hjNktSVFdGRzFGMUpTUUMyZzhD?=
 =?utf-8?B?Mk01N1FPM3pSR1l5d1QzRGpKUi8vMFg2NktFdzM0SmZySnRlc1hMVXRsYm1B?=
 =?utf-8?B?Tm5YbW1uMit5MG9QOFE3emRCcXBsNjYzTmtDeld2akU5SUhIT0FIQ21DME91?=
 =?utf-8?Q?DKxvoKOz5W6Xk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f1b694-d7c3-4e11-210b-08d91a20de75
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:17:52.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2sV9BkRBHXZwp9DHKAk6JU5GrAz2mX2mll49WbYJ6lA1dxDtGuiaRSXv02QlNLY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4929
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 19:10 schrieb Thomas Hellström:
>
> On 5/18/21 5:29 PM, Christian König wrote:
>>
>>
>> Am 18.05.21 um 17:25 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 5:17 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 18.05.21 um 17:11 schrieb Thomas Hellström:
>>>>>
>>>>> On 5/18/21 5:07 PM, Christian König wrote:
>>>>>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>>>>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>
>>>>>>> This allows other drivers that may not setup the vma in the same 
>>>>>>> way
>>>>>>> to use the ttm bo helpers.
>>>>>>
>>>>>> Uff can you please explain why exactly you need that?
>>>>>>
>>>>>> Providing the BO is not much of a problem, but having the BO at 
>>>>>> different VMA offsets is really a no-go with TTM.
>>>>>>
>>>>>> Christian.
>>>>>
>>>>> The current i915 uapi is using different offsets for different 
>>>>> caching :/. We're currently working around that by using 
>>>>> ttm_bo_type_kernel (no TTM vma offset at all) and i915's offset.
>>>>
>>>> Can you instead adjust the offset in the mmap callback like we do 
>>>> for dma-buf?
>>> Will have to take a look.
>>>>
>>>> That's really a no-go what you describe here because it will mess 
>>>> up reverse mapping lockup for buffer movement.
>>>
>>> You mean the unmap_mapping_range() stuff? That's not a problem since 
>>> it's a NOP for kernel ttm buffers, and the i915 move() / 
>>> swap_notify() takes care of killing the ptes.
>>
>> That design is a certain NAK from my side for upstreaming this.
>>
>> PTE handling is the domain of TTM, drivers should never mess with 
>> that directly.
>
> Hmm. May I humbly suggest a different view on this:
>
> I agree fully for ttm_bo_type_device bos but for ttm_bo_type_kernel, 
> TTM has no business whatsoever with user-space PTEs. That's really why 
> that bo type exists in the first place. But otoh one can of course 
> argue that then i915 has no business calling the TTM fault helper for 
> these bos.

Well the real question is why does i915 wants to expose kernel BOs to 
userspace? As the name says only the kernel should be able to access them.

>
> So for discrete we can probably do the right thing with 
> ttm_bo_type_device. What worries me a bit is when we get to older 
> hardware support because whatever we do is by definition going to be 
> ugly. At best we might be able to split the address space between 
> i915's mmos, and hand the rest to TTM, modifying offsets as you 
> suggest. That way a TTM call to unmap_mapping_range() would do the 
> right thing, I think.

Well we do all kind of nasty stuff with the offset in DMA-buf, KFD, 
overlayfs etc. So adjusting the offset inside the kernel is already well 
supported and used.

What I don't fully understand is your use case here? Can you briefly 
describe that?

Do you use different bits of the offset to signal what caching behavior 
you have? And then based on this adjust the pgprot_t in the vma?

Thanks,
Christian.

>
> /Thomas
>
>>
>> Christian.
>>
>>>
>>> While we're in the process of killing that offset flexibility for 
>>> discrete, we can't do so for older hardware unfortunately.
>>>
>>> /Thomas
>>>
>>>
>>>>
>>>> Christian.
>>>
>>>
>>>
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>
>>

