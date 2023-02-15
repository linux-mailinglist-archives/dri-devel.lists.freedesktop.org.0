Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAD697DED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0099B10E251;
	Wed, 15 Feb 2023 13:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57B810E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gla+InO9cTH8EbWuLGHuybJsZQyWyeugxHnv6ZvKs7eGZ8LhiB/9yH4fxHC+g/Lw6nDPH1w0xO1ERrL33ibqJEFV6CJsp3Ga0FQIAUFNZZsUiyFZt4oD2ZWug3Qfy47izoLyQUX60GPmZdJBwD7jhUs3UqkB0qkHhttRrWLXt+SlsLnXaMLz/p9bYlEojbWxpds7vQz1D48DC8pwACXOnmoxiIhxUEPYi8GJorWjwhypJJeB67BQ3ZJN1In/5SfMrdOWsIRCS0OTxYazPaonjKi5ha9RA/J4YWLnz3kc3aO8riP1IjSy2AUKGa1lb0r9P8Q5L51A72Yim06grLo1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vClbQz23pdUeA1g4Ajnl/gbH4EDPRSB5Uj4kcCCzy9Y=;
 b=XgEhX539pUS4doTsJjUvZv5q7RicftkbfMevm0ZzwNw1TD+qlPpQ1GbtBe50WO3eeiOgIqGMXY0F8NK8TCYN+ulxe/NS5LVObf+fyPTzizHLA55Gtizsf6z8t5LOdoD33LEuCVCVvW8JzW+hemzP6U+Z0B2v6eLjdBsVjGkxW4lWXoZzZYFaeEIlGceuWJR4aLRaLGcw5oVCKl0/u7tl/X5SxQl8KdUS+xuW3ty2BgWqgQrPq/un7OVwwrE5+4wbBMwrvqe5jEzmWPObUVjLIyLtTfM2ZByM48nxw/36KEmaWJn/PUXDqzMtQhh9I+AL57C3GGDq42zMyDCoa0rDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vClbQz23pdUeA1g4Ajnl/gbH4EDPRSB5Uj4kcCCzy9Y=;
 b=dUmmqvaOKdJDvgdvuhkUJdXQsT1fd+j6MQxmVT3NZsxdmGnIHIakasVVIovFbWIH0ZGV9R681iqryBOv46XjpwGYkpiyCSJPa4p92tUs8tqb5QFYhMLdLmilQeZYqnCWUY1Q7W2fwZPBl/CA0V179Paz+PgH8LhhgxIHaM8czQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5370.namprd12.prod.outlook.com (2603:10b6:610:d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:56:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 13:56:13 +0000
Message-ID: <9daab4a1-0282-4168-becc-f5563f49f213@amd.com>
Date: Wed, 15 Feb 2023 14:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <c5fe8089-49e9-2bec-eac5-e8a035412cf3@amd.com>
 <db4d83f3c3c8dc4f3ef5f850fe4c1c04aa648d47.camel@crapouillou.net>
 <bf3771bc-bbdc-8a9f-b9e7-425812a66ea9@amd.com>
 <0a128bd44ee7f33369b19b1e984c9e6ffc926ae4.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0a128bd44ee7f33369b19b1e984c9e6ffc926ae4.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b86c2d-ad3c-4876-eae1-08db0f5c66a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EUabZrtitV7ueduV4XpW4NaF+U5BpeZaCsX6GySaKJ44C5Z3JY5NdnbZitjazgNWSY9F4myy+wL4KPDg6hIoZPyOXveXnUpfLWrONczaTJHlE/LNJnTH30ssUelejr8K28/xc9h8lIZOFBQm6UmxJPAR5NR3qDaBSL5ax2AYvN42YLAIlQGt8sDsgvrYGW9QluzUqyLRrWxJOskjlJm1LRvTdI33Fgstt3jxlZTX0SlzZfa6fk52Tm3YakCHH9knBzmqyZM0yqZSOZc1b/GgcqCGI1HAXaYAxJHnMDWUlhZG9STUT+2JgoP7qrxmd7vTYoCXFk0z1sRk57o/YIZQxvlH9+PFUtKZHkCl3QWhp6Ai/fqagJduiuT+3YfgdrlbM4We44/9ce9BHVKrket0H9dSFZ/rQodqf3AnA2L/MXyCCQPCQCUQRUYGFfR648QF2y8uyx1Zad5WDFB2C68uMIzlzTeYtRunKgbYS/jnfZ3QzG5bBJCJverrEH2uKnV1NKVuRdvfTCZ0pKsWXI5xsc4PH6tJrdL9ICegF1wGR0NPZj+qt+PQFhMVjrFoSXk1OszKGAH2+Xh3XGOwfZq0q2lxss+/oq1Fr/0K6DmCgW7cWeuWmf7FefWZoV/LTftuTnOdJbWzGYGALyYEWf0WNg/7TcJR1Y/ho5eiVHVjomXjPCa2ifQ5LiEYT8porwwY/OLI6gXTJHWHZD0ZqcePjq2yL4+F/ujR83BEEn4iBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(8936002)(41300700001)(36756003)(5660300002)(2906002)(478600001)(110136005)(6486002)(966005)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(38100700002)(31686004)(2616005)(66574015)(6512007)(186003)(6666004)(6506007)(86362001)(31696002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzhXYlRhL1NwbmpSbkN1akIvbEk1Z2dXb2lYL1hTeEZFSi9JUk1TNzhHdDZF?=
 =?utf-8?B?WVVMb3Z6WVlMRzBvbjlUVmR0MHBSTERmY3FMZ0JnQnQ1VFcvbm1SYkphdzhI?=
 =?utf-8?B?aEVmb21saEFqR1VMYUdZaXI4SVB3czVwaXRab3FZWEFVdDJVZ1JabVg2Z0lo?=
 =?utf-8?B?UldzaEhEQmp5T2tlUXFFNFhuVTVSWitBWTY3aDRuOWdXQldBLzBjN3dRYzFM?=
 =?utf-8?B?eVdZUkZXRnBheTZkWG1Oa1lKYlN2bmU1bnZnbGQ4MmtmZXdicXF6N0ZFVEdP?=
 =?utf-8?B?QzJwdkpCNmpxNXZtSnIxbjZldWh6OHRYRHVKWVFidzRnT3JldUpWZ0wveDhl?=
 =?utf-8?B?b3EyUjFoTFRkOHh3MzBOWTkyM2ROUklZSmF3eWE2bUxDdldKNnhma2p1SjNw?=
 =?utf-8?B?YzJjK3RDV2FpQUxhR29IWmk1NHVicGhtdi9weHZkRWRNWURBUjF0NnNxcU9h?=
 =?utf-8?B?bU1hWStMQXp0eUtMZUcrcS9Jak4xUk1CTzhZOFJaazBmV2krMHl1UE5sN0Fw?=
 =?utf-8?B?MmEvdlZCSzVZbFJYekdVS3ltSGY2TzVhSEhncW52SmRDUXc1cDBrVVgwOXJa?=
 =?utf-8?B?RmxGWFRaZDJOMGg3T2l1VFlVb3cwb0RPK0E4N1pJWWdvQ0J1TnNXUGdrT0FZ?=
 =?utf-8?B?M3pYQnhWNFhhV1hVV0gwcVVPdkNCNVEvbDJ5ZDdaNEdMMGVGd0hyUVlmNEU2?=
 =?utf-8?B?aVR6cGdaN0tINXJPUE9heDFtTTFmemFBSlNRdW9wS3BuZExQdmtSNnlLZkt2?=
 =?utf-8?B?U0FqbWplbk45RzQxaWtGM29pdFNSQXd1SEdobW1SZ1hicnpLNFN2Ty9EY1pY?=
 =?utf-8?B?SU9YeEJHQWxFSEp2UTdZZEpxRFRTb3k2UlhMMGZFN0N6bHBZTnJlUHlvS1Rn?=
 =?utf-8?B?SXh2SmdJWjc5Z3JINUpmTTg1emU3NzZyNkVBNGIrNUNrSjAyUUhPVzB1bndv?=
 =?utf-8?B?VW1MMXUxUUlmMklEVms0MkxReTduY0hNcUxPYjRUUmlsZEZWd2NpOE0rNTRI?=
 =?utf-8?B?YlpZeUk3YUlSL1o1MFVIZi9tRkNuWXU3aHoyc2tjMGY1UGk0d2FlT3k4WlZt?=
 =?utf-8?B?bXVHckFBRTRKcXFNSXpzTlV2QjRBN0E5eitmbHdKTDN3UWlXczZCQmlYdkx0?=
 =?utf-8?B?eU85VFpyeFJQQmdwY0dxc1FwNzRhbkFxZzd2V2Y0MW9XbTNkNTlsSmhhTkt4?=
 =?utf-8?B?TGdkZmlocjhzRldEWDhrMjJpNzFtWG1sWnEza1JoRnFISnVmVWEycEhoTDBX?=
 =?utf-8?B?Wm0rN1YweHU2S09YRWNxVExOK1B2SnhJOGdXMHJxdlJnNHcxdmxocFhGaGVx?=
 =?utf-8?B?M2YwMnlKK0IybW9UV0J3MWdML2U1d1ZkTlROWUNnZnNGYWVGUTBtYThveWlW?=
 =?utf-8?B?bUlLN2wrc3pDRk5nTUhHR2JNbkNNR1VRdlprS1QzY1EyM2QvcXZndGFnSkcy?=
 =?utf-8?B?VktyLzl4aEdaZHcxQVFydlZ5OHJnRk1VSURsN2hQaDc1anZ6UUNEOERPelFt?=
 =?utf-8?B?UENibm10cms2bko3aVlrWWJSbEU0SjFuOXdtRjBZdWFncjdoNW05cWh5Z2dm?=
 =?utf-8?B?WFNpUDRoY25URWNkeXNEMjJSRmpVSjR5NENKYWFkbG5WbkpyN3lXRHVQcTVG?=
 =?utf-8?B?a28vSWt3WXFhN1BlNTlQQ3VmZ2JEMG1FeTRMQkJYTTdKcmw0T0h1eEltLzFL?=
 =?utf-8?B?UzU4Y1Z4QTJSVTBzTVNpS0dhZnByNGk4ZjA0Z2VJQm1tWHJTR0g3bFNQWVgz?=
 =?utf-8?B?cDRVY3U5OVd0ZGRrTVFZYVIzN2wvQytBZ3dnSkZqdnY3cURZUzZFcE5DZzhJ?=
 =?utf-8?B?YmJ2K2xlTTVBejg2N1o0Z3NIRzdnc20wbUZiUGp1VXU3aGRhMXRWVEV5UGp6?=
 =?utf-8?B?bHJrbW5UbEtzTEZYRXA0NzEvZk9LeVhrZlo5cnJ0eUNPR3RzMzlibkllMTha?=
 =?utf-8?B?dCszNC9wZmNTMmt0a082aHl4SlBQYWRpc1prQnYxcGpIMXlGMzYzeDZ0cEFh?=
 =?utf-8?B?d29uNWtKUnhlVjkzbjZqYkdBVDBDdlJCM01hYkU4ZkQ3YkxlODR5VnlZQ0VO?=
 =?utf-8?B?WG04WWVqRzlkNmlxbU01bmd6akRTUklJSWlReUJBeXowRmV6UkVJaTF5SXlW?=
 =?utf-8?B?UDBmTElTU1hFNjB0QVErWGZJVllYR2ZoSjliK3ZQcWJkaDQxUUovdlpMSHh4?=
 =?utf-8?Q?hAdGuYJBNg9DqnRfHmVhvfF0G1rp3r1Xnp2Uk4tS0yP3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b86c2d-ad3c-4876-eae1-08db0f5c66a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:56:13.7980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q884Juw0gpPgZIBCFtkQ+sV67qiOESjZOcqGu6fC2F7IgwvcgcK+P6t9wNAci7sF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5370
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 14:52 schrieb Paul Cercueil:
> Le mercredi 15 février 2023 à 14:46 +0100, Christian König a écrit :
>> Am 15.02.23 um 14:24 schrieb Paul Cercueil:
>>> Hi Christian,
>>>
>>> Le mercredi 15 février 2023 à 13:58 +0100, Christian König a
>>> écrit :
>>>> Hi Paul,
>>>>
>>>> Am 15.02.23 um 11:48 schrieb Paul Cercueil:
>>>>> Hi,
>>>>>
>>>>> I am working on adding support for DMABUFs in the IIO
>>>>> subsystem.
>>>>>
>>>>> One thing we want there, is the ability to specify the number
>>>>> of
>>>>> bytes
>>>>> to transfer (while still defaulting to the DMABUF size).
>>>>>
>>>>> Since dma_buf_map_attachment() returns a sg_table,
>>>> Please don't assume that this is an sg_table. We just used it as
>>>> container for DMA addresses, but this has proven to be a mistake.
>>> TL/DR, why was it a mistake? Just curious.
>> The sg_table should have just contained DMA addresses, but we had
>> multiple people who tried to use the pages instead.
>>
>> This works to some extend, but goes boom as soon as somebody messes
>> with
>> the pages reference counts or tries to map it into an address space
>> or
>> something like that.
>>
>> We got so far that we now intentionally mangle the page addresses in
>> the
>> sg_table to prevent people from using it:
>> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#L763
> Isn't that breaking the chains though? I'd expect page_link to be
> mangled only if !sg_is_chain(sg).

Those are filtered out by for_each_sgtable_sg if I'm not completely 
mistaken.

>>>> There is work underway to replace the sg_table with (for example)
>>>> just
>>>> an array of DMA addresses.
>>> Ok, so I believe at some point we will need an equivalent of
>>> dmaengine_prep_slave_sg() which takes an array of DMA addresses.
>> Well we will probably come up with a new container for this, but
>> yeah.
> Understood.
>
> You said there was work underway, could you point me to the
> corresponding mailing list threads and/or code?

That's not really released yet. We just discussed it a bit when Daniel 
added the sg_table mangling after this went boom for the third time so :)

Just use git blame to find the patch of the mangling and read up on the 
mailing list discussion around that.

Regards,
Christian.

>
>> Regards,
>> Christian.
> Cheers,
> -Paul
>
>>>>> I basically have two options, and I can't decide which one is
>>>>> the
>>>>> best (or the less ugly):
>>>>>
>>>>> - Either I add a new API function similar to
>>>>> dmaengine_prep_slave_sg(),
>>>>> which still takes a scatterlist as argument but also takes the
>>>>> number
>>>>> of bytes as argument;
>>>>>
>>>>> - Or I add a function to duplicate the scatterlist and then
>>>>> shrink
>>>>> it
>>>>> manually, which doesn't sound like a good idea either.
>>>>>
>>>>> What would be the recommended way?
>>>> I strongly recommend to come up with a new function which only
>>>> takes
>>>> DMA
>>>> addresses and separate segment length.
>>> Alright, thanks for your input.
>>>
>>> So I would add a new dma_device.dma_prep_slave_dma_array() callback
>>> with a corresponding API function, and then the drivers can be
>>> converted from using .dma_prep_slave_sg() to this new function in
>>> due
>>> time.
>>>
>>> Vinod, that works for you?
>>>
>>> Cheers,
>>> -Paul

