Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCD58E6DA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 07:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DDEEB2CC;
	Wed, 10 Aug 2022 05:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B6DEB226
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 05:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyBoNMO9NkNOUVJvairHGMt8Iv5/ol0FJhhnyGE3Jg3vnyLd5YVxvm23sCFjnOwRyGQr23Ee0C/G/MKR6s1eL++eaVj7e6PpIOl6aa0DgV12o68zwia9g3ywlRzh/hHEwzoJJuMzNPFY2cEy7NKmw5v4Zk9DFr9q6dnqd1bI8ht5gWGEqwuiJXmAAMnIXumLtdzzJ1LLN8aGbN6aYp9R7axkSZyV02FAV59eDIjGJ6jE4DTVY8E45rTXRnGAhSbm3JFJFvcQdVfEg0Vrk8khBVNLk+129UTSm8pN+aynnGw9dyo0PzPS3008UpJ2o7sLxywXq1dmxcDS4eYK5qGfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7/TDF2eWXC0UqWxTepQfK9zXwsTNOllxMc5CldvwJU=;
 b=JvJdyBtCBH2guvD3KiZ9lLEHcyTFTxiEOkznrC7ZoVdbRq2kysjx01Y2wFRPbP7oaumcszpIOzKnDmLJNAmvSo4pAtB5pPtYH8s63uaRAZ2sWPNRK8GP6NJuA6tn2Ym+1N3SzCES7y91wi7iVmbw5mz8z0BPuf3He7JkBGWY0rLt4g9kS/JbbBqbwLgJjrozv46j48t74I++eEBhakh+RRJ5YtFoYr5qFn3Y7g6grsL4RzS4HnGqlUCcgjF72al1bZcuIXISXvIzodYIyA5uDvzbji2KfwrAAlXb3puoGIWxNfVugn7XjrZQ4rPfDQmweWLfuNq504timyMHyFPj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7/TDF2eWXC0UqWxTepQfK9zXwsTNOllxMc5CldvwJU=;
 b=uVSwGm38yPWrqzEcWE+yQ8KeLiI5IulQdIyzp6gaarXAglpF5WjMbgLbt2jTieBiI2oYiEXLZiDwCOMBiTmJSOuNfs6T/WUilLA2Dph5GomicIA4LsxB2mtzRavIikkwk7t7OOfFbQ3+q22wPTXISonTWbTk1StZJMG+XkG+O9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 05:55:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 05:55:21 +0000
Message-ID: <298c183e-6608-6550-6a3f-3283edc43f39@amd.com>
Date: Wed, 10 Aug 2022 07:55:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] Re: DMA-buf and uncached system memory
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
References: <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <CAPj87rOykZv7bjNhHPT4StrsPz8Y_DWqab4Ryq=Qqh77LS2e=Q@mail.gmail.com>
 <578953dd-6298-2bfe-a8fb-52004b84fd17@amd.com>
 <YrY0cQY1BTL5H7Xp@phenom.ffwll.local>
 <5eeefadd-7804-3876-c8da-3e6f1bcb9dc0@gmail.com>
 <YvJzM1km0iJ3eFnR@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YvJzM1km0iJ3eFnR@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a016b1a-740a-405f-e58e-08da7a94e8d1
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6712:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hK7k6b4aQcVRwvFyRtEvSic3S94dLudMnUC26kw8LVJU0FjOidfxcxm6oHb7H2RfhC3suEbevZPp1RdHAAVjt3w4KucyeFeQRB0b3jnYvaI1jRV1tIGuJLBo2FDNyoexsgRi7sC7yGdGcLpEiaWq72MGL7cAbOVPE/Qoxic5zs98p786sZszz6o72nZgXLXYcWwhV/+cufgUCYdu4DHK6Vb8GVjD4D+7c3aEu4OkkWEhNb0TCw1NCVCEZIideRtR1heFIwMJus7QqEENjchcv4n4g/ZpL1kpWOQBlQwgB6BcSuDk2cpdpQc31yCCitVh1yb16xY6rNF6d6dbGr/7lQ/sSmmSeSU/pucH3XWE12bPPbx71yKUSbz82HfXDUJD0SikGHul0yUvTSyGe6zXj0fenjdYCAX9neWzI6WilOcs/c603nkONeamBRazeg/KOsxQnNGI690DbGb24NKuYTPQ15LIzy5C/ZQjVBmGbznSqM4lk6mp7McS9UpbtnieWoTusSgVpEn9t7yJJQBzmpVoDQrZbiDcgJkOj7RYCirtz8tTZW6icyynsrkVLhm235lCXv5hNR3SdfVcfMua+zx5fdqS1NTHWi3n7+i27lqAWEBjyXyTMPxdn8dheahaVlDaIgEaBoW1wZAjzQz6CB6O7Dr4hIKNTfTbMtoagR7AfRebVGFrAn56nBUhHstY+EXMjYcCJE/ualjfRWGNJu1Olkjxt8VBsbWYwC+vk1S210pPuFMg2mcIDJEg8Z/DA7j8Ya4vzwfpNIRrNzT+wWhzKe6ALg2cIEgP0aMt+6RzNQ7n/8/KIyJcZ9ItWS431ab0C/cCnjz8PVjfBSxXWuZKds8/w+H09iSRcpDlx7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(6486002)(478600001)(41300700001)(921005)(6666004)(6512007)(6506007)(86362001)(36756003)(31696002)(66574015)(186003)(31686004)(83380400001)(2616005)(110136005)(8936002)(8676002)(66476007)(66556008)(66946007)(316002)(5660300002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZ3Q25lRFI0K1lBMkhlZU94Ym01S3VON2pkTUMrWTZ4OFhwMTE3MDB0cmdI?=
 =?utf-8?B?cmR1eFF1U1RHbEpRZmpXdGEyNVB5NGovaWc5VW1xK1RyR0M5UkRtMjczS1lY?=
 =?utf-8?B?WVNBUUtjV3B2M2FzQzhQYlRacFRVTTkyRmt3ZFkvZWxpS1RzdVJzUFBvdmNJ?=
 =?utf-8?B?ODBJSG1WUy8vblJGUGRJVm1wN1J4aDd0Wm5oT210eWxiTks0TG1UWmZYVzc2?=
 =?utf-8?B?NG0veXgzRG1RdVZYOTkwWGJvNk91Z2Y0dkM4NURieG9VaHc1MWNBa3JvZmEr?=
 =?utf-8?B?OVpqcDZ3MEZxUzJVTmNVYm5TakNsMUViL0h5UkFadFluWTBSZFIrK2QrSCtC?=
 =?utf-8?B?SEg1U1AvdFR1OEhZYTBUaU51cjlUUy9VMjByZXJtcHhCbHB0RHRncWFDLzdy?=
 =?utf-8?B?RDhTZEV4VHBhNmhKdlZMd3RGNHB4elBVMnpTWjVxZW53ZnE5VGoyS3FQeWdH?=
 =?utf-8?B?SmpabU83MTFLZHBRTXM5UUR6djlmRnBNZWptMGpUWnZaZzdnbXNFR1JWMjFX?=
 =?utf-8?B?RjB2U2ZXOEE0akJsdE00dWtLekNHVlh5aGNubit1YmFpMkNtYmJjR0tsbkZn?=
 =?utf-8?B?WDFYMzNneGtRbWlRbmhwTTd6NWF4Zndma2d2Vk1oZFQwc1ZtUklaVDZMb3B2?=
 =?utf-8?B?cW44S3NoeUdVNituTGpBYmhjTFZxVEhBSGZtVFVkQUMxeTJjQjVSaHYxai9a?=
 =?utf-8?B?eW44Rzl5TTRNMjdHMlIwQ1NMRjFzMldpdldpNEc3cy9RdktUd2IzY3QzeEox?=
 =?utf-8?B?VXNncmVieE1Nb3c2REszU3BsUEVJYnVjblhaaGJtclcydFVnQW1hQXZuS2Ix?=
 =?utf-8?B?K2RUaDQrRWFsRW1WeFp0V0VkaWVYY3NseTBYNWZBZnUvT2gxcloxbFg5b2hu?=
 =?utf-8?B?TU5uWS84ZXBJNjd5NjByUEYwclBFUnZBbENpUUtzUzk0VVcxMThvcjZrUStt?=
 =?utf-8?B?OVZHTjZsRVAwUUkvelZsd2tsMW9lR2ZJcUZYUURYYWlsNEMwc01NLzNhb1hk?=
 =?utf-8?B?eFJudm5Xb3RYRFRPWStCNXIzeTQ2MmZEdy8zVFY2djJsaU82N3BIdlErdG1Q?=
 =?utf-8?B?Sy9CM0RJN2lsVDJLa2dQcCtYdEdCaTRzeERjZlFVcWlqM0dKYno3SXJiQmpG?=
 =?utf-8?B?Y0dJYXVEL0pKRjIyN0xLbW5rSkZVamorQ2pPMTdZNHFKN3N5YTI5cVJFTE0z?=
 =?utf-8?B?RzlrUS8xVVgrTXA2NVJYN1I2MGxpNVZvT3h4cUNJTlJKbzRoS0Rtc2hxYmtU?=
 =?utf-8?B?bnRmbUpvc2RDRXh0VHhWalZ0QnRTUE5oN0FVQUNrYWNFMTZOTDZ4bG9SL0xi?=
 =?utf-8?B?U2ppVmREb0ZuS0YyYWI0L1dNRktQSi9UWnViWUpMek5EWlh2eDhXdVQ5QnA4?=
 =?utf-8?B?OWtla1pQa1BJY0I0QjFpeWRZcC9LbjVmZlJYU0R0NzJ4NWlpaWtJcDhVKzJN?=
 =?utf-8?B?bFpiL3FuZ1pqRXdXMGxGdmRtNENxQjgveExtejlEK0lxL0x0L3VUNndDbGha?=
 =?utf-8?B?SjZYVHkxMmhWVk1BVGRqZjMyNi93UjlCU3BLNG1NekFZNWFOb002TS9hL2xS?=
 =?utf-8?B?V2dVRmNSbCtOY0NzZ0hxSUozcmtpUHRkVU44cGM2a1kwQmZCRjlZeE4rZVhm?=
 =?utf-8?B?T2JMVmtPTnlxWnJDdFNEMVpmeDI4c0hUbzhoZ0RIZWh4WGkrNjlTZ3BxSXpI?=
 =?utf-8?B?MTlodWV6Y0xwZ05vOXBsbWt5WTNWM0psc3JPS0RpZVNJcE80UUNlR2QrRmNr?=
 =?utf-8?B?UGp0NTVUc09BMnYzRHhCRmsxK1BSc1VxMmdNMWZQVTBZb2FUbmNCTHRVYTJH?=
 =?utf-8?B?K0hXV20zY0ZZUzQzcVdscUtmY0ZHMFR0RHhVdTZiVW1tZ1UwbXBXTTh0bUxs?=
 =?utf-8?B?SmhYQWlhSWxwUlkwUUdqTFJzYk4wcVh6a095cUlteG0yV2RWRmVFZm5ucEI2?=
 =?utf-8?B?c1hUbnk0MFhqK3JWRnErU3hsOEZRRnUvM1hRaFJvemRVMk1HRlRJMWtRTVcy?=
 =?utf-8?B?ZE5HN0Z0WWxHMkNiVkc3ZWNiMnMxNnUzc3haOVExbGowUjNGNmYyZzYxZnNS?=
 =?utf-8?B?UmFYNkNRRFhNYStVajB4WVI1cm1tYzFESit3b2xmZVhjSTFBYWFGaUZOVU1F?=
 =?utf-8?B?VlJZdlRQRlBBUkNxWlNRY3VSSW1GaWRnUkpTcG1WZTdwZmsrNWtmWXZ2ZW1U?=
 =?utf-8?Q?kIg4V+venBtZSq6GQosUSEdnYmJnEmrHYI+B9uhbEz6u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a016b1a-740a-405f-e58e-08da7a94e8d1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 05:55:20.8664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcf0iiC0InK2h3Y/qJ5kS82TF+yM1adp6DTntXQhAR3xEe4CzaPDltyq3g5YfPSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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

Am 09.08.22 um 16:46 schrieb Daniel Vetter:
> On Mon, Jul 04, 2022 at 03:48:03PM +0200, Christian König wrote:
>> Hi Daniel,
>>
>> Am 25.06.22 um 00:02 schrieb Daniel Vetter:
>>> On Thu, Jun 23, 2022 at 01:32:18PM +0200, Christian König wrote:
>>>> Am 23.06.22 um 13:27 schrieb Daniel Stone:
>>>>> [SNIP]
>>>>> If it's really your belief that dmabuf requires universal snooping, I
>>>>> recommend you send the patch to update the documentation, as well as
>>>>> to remove DRIVER_PRIME from, realistically, most non-PCIE drivers.
>>>> Well, to be honest I think that would indeed be necessary.
>>>>
>>>> What we have created are essentially two different worlds, one for PCI
>>>> devices and one for the rest.
>>>>
>>>> This was indeed not the intention, but it's a fact that basically all
>>>> DMA-buf based PCI drivers assume coherent access.
>>> dma-buf does not require universal snooping.
>>>
>>> It does defacto require that all device access is coherent with all other
>>> device access, and consistent with the exporters notion of how cpu
>>> coherency is achieved. Not that coherent does not mean snooping, as long
>>> as all devices do unsnooped access and the exporter either does wc/uc or
>>> flushes caches that's perfectly fine, and how all the arm soc dma-buf
>>> sharing works.
>> We should probably start documenting that better.
> Agreed :-)
>
> Are you volunteering to type up something that reflects the current sorry
> state of affairs? I'm not sure I'm the best since I guess I've been too
> badly involved in this ...

Yeah, already working on this. But you know, normal human being with two 
hands and one head.

With all the workload I'm pretty sure people would have cloned me by now 
if tech would be just a bit more advanced.

Christian.

>
>>> We did originally have the wording in there that you have to map/unamp
>>> around every device access, but that got dropped because no one was doing
>>> that anyway.
>>>
>>> Now where this totally breaks down is how we make this work, because the
>>> idea was that dma_buf_attach validates this all. Where this means all the
>>> hilarious reasons buffer sharing might not work:
>>> - wrong coherency mode (cpu cached or not)
>>> - not contiguous (we do check that, but only once we get the sg from
>>>     dma_buf_attachment_map, which strictly speaking is a bit too late but
>>>     most drivers do attach&map as one step so not that bad in practice)
>>> - whether the dma api will throw in bounce buffers or not
>>> - random shit like "oh this is in the wrong memory bank", which I think
>>>     never landed in upstream
>>>
>>> p2p connectivity is about the only one that gets this right, yay. And the
>>> only reason we can even get it right is because all the information is
>>> exposed to drivers fully.
>> Yeah, that's why I designed P2P that way :)
>>
>> I also don't think it's that bad, at least for radeon, nouveau and amdgpu
>> all the migration restrictions are actually handled correctly.
>>
>> In other words when a DMA-buf is about to be used by another device we use
>> TTM to move the buffer around so that it can actually be accessed by that
>> device.
>>
>> What I haven't foreseen in here is that we need to deal with different
>> caching behaviors between exporter and importer.
> Yeah we should have done caching explicitly and full opt-in like with p2p.
> The trouble is that this would have been a multi-year fight with dma api
> folks, who insist it must be all transparent. So the politically clever
> thing was to just ignore the problem and land dma-buf, but it comes back
> to bite us now :-/
>
>>> The issue is that the device dma api refuses to share this information
>>> because it would "leak". Which sucks, because we have defacto build every
>>> single cross-device use-case of dma-buf on the assumption we can check
>>> this (up to gl/vk specs), but oh well.
>>>
>>> So in practice this gets sorted out by endless piles of hacks to make
>>> individual use-cases work.
>>>
>>> Oh and: This is definitely not limited to arm socs. x86 socs with intel
>>> at least have exactly all the same issues, and they get solved by adding
>>> various shitty hacks to the involved drivers (like i915+amdgpu). Luckily
>>> the intel camera driver isn't in upstream yet, since that would break a
>>> bunch of the hacks since suddently there will be now 2 cpu cache
>>> incoherent devices in an x86 system.
>>>
>>> Ideally someone fixes this, but I'm not hopeful.
>>>
>>> I recommend pouring more drinks.
>>>
>>> What is definitely not correct is claiming that dma-buf wasn't meant for
>>> this. We discussed cache coherency issues endless in budapest 12 or so
>>> years ago, I was there. It's just that the reality of the current
>>> implementation is falling short, and every time someone tries to fix it we
>>> get shouted down by dma api maintainers for looking behind their current.
>> Well that explains this, I've joined the party a year later and haven't
>> witnessed all of this.
> Yay, cleared up another confusion!
>
>>> tldr; You have to magically know to not use cpu cached allocators on these
>>> machines.
>> Or reject the attachment. As far as I can see that is still the cleanest
>> option.
> Yeah rejecting is always an ok thing if it just doesn't work.
> -Daniel

