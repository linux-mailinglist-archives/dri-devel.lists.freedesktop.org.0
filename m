Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D9596C55
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495718ABAC;
	Wed, 17 Aug 2022 09:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2D18ABA5;
 Wed, 17 Aug 2022 09:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRF3Du+Wlo8hFAyUyR0Hqxmrg2SV+8E7yy/thteyaEQBD6dOSZdRxzM1me445+7JAjQFe/6nvfZL7tcPrqFlkZWB2n0EfJt7nrKVQdy3JyJJzMN2weXlMPQeWF0/7RfBjPasjm8ty/m+ZWntNhXDxfJxfEotuSgQKeEpTA/TJ9HORc/WIzKfl5RkX8McZ+YgRk/vyLIfmeusR2z2UslZbCv+xN2m1KJUhWzVaDf8Auma9tcZgLbQCCddCj9B+DKA1UbAv9B85LkBTnQ0BfB9ULD9KM1cdB38zCVJvcPODqM2aNNF1xQJhhS+jpz4Fw/1Y0Lm814ZWcNLxn0QjfKTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bCmDBJKec/OlKE2p0rElCX+nkHM+P2v2nNkC4m4v5I=;
 b=LGx0X4P+ip/oCOnAADc3KJJCfvWjhAldGXCnDswVbcv+AGb6siGYh4WaEZjJ5UCRsylr0YLdURRxniBZqlOeLjRBhSatUEoH9n3nd/EI/G0yZ0y96VQJQ6d7RexCqRTBy36wusjq0t8548zTKQTeNotPRt2pHjuO4K61FkRTCAeRzLc28r6lmgcgOeYMhaE+DPZITs/xnJgwo0nU8FynLONSD6z22p8Oj8p2MubZrE4br/XGMucI0K3yup/IzM73HcZp+O2gAMDXTYE0lGEF2L5nrmA2qpGgK0OJxPSk0krfL7n++NWRL+97iqzuxgqvWUHNCQlvahnieFuefzweJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bCmDBJKec/OlKE2p0rElCX+nkHM+P2v2nNkC4m4v5I=;
 b=265EVCkKE6jGi7zn3s1bRdHIoMXRRIaWHOytQTIhb3lhkp9RP7x4oYhT8Mbjuf3WIrmciMFiHvNcIHn4dqEou7TwqinFsjFvW19ssFObutThrZZ1Pwyn7y1cxgXaJaqgIUstSXaym/cPGCsNguOTdTSp2ufGMBZENKnozyR7x2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3746.namprd12.prod.outlook.com (2603:10b6:a03:1a7::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 09:57:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 17 Aug 2022
 09:57:13 +0000
Message-ID: <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
Date: Wed, 17 Aug 2022 11:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f4ada2d-9972-411e-689f-08da8036db8d
X-MS-TrafficTypeDiagnostic: BY5PR12MB3746:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NozLA5iBMyfdFVRFW1silDVWMd++0/qyS7SbW+HJZ1FrBV/ZOX6bc/P9wheF9xASdKDdK+Ee0qoswhYXB/WJxiKj5Mew9q4w2FRLqyYsZMJatR8mxwIiDigquBxcMT+QLf1ugL4y814GTKFGIrIoTul4A/aHPwN1n+r6LsdAQF1XmfOPRA3PS/0wrGPP2Alwdc6E2boYgKWc20xvwoOaKRgIHU0gLnEyvgUtPi4caz2viLwKeryryYw8VhZmf/yOqSYOKB8sZ4qMeCIeUDv3ExLH8J0x5k6fUkhbvbaPiVdu6ekBDvw/croiXYHdONS5v9mbwUd5zq2G2qFo/Xd5PlDA48HPvKZunkHWt0GEX44EXKvViGvit1MAJshHu/w1CtqBUmAjHxSVFdLQIkAMfl7wQ1j1GtRx/IcqSayG9KdNSsDOcZvP21e4Dm2huAA9Zn/XfQPL5DWtnaaQOfqfUl90Sxdl1bAvpUg/GrCdWYoQbAyEWkAX1wXACyVnT9SzHFHm8mU3vNWpv/erylpSryk4ysUbHKngiTnyl1NBazaP/gLrOsR0IV1EQ1FLSe1nI+FSdv6kdJPhyizzTOQnZxlWuhlYXZcDSgCeA7GlgRX9FpJZJ5gJSWp6kVeesA+h2Y9mfTTEUA0i3D5+s8GQEdp/3xZk4se3ml4kEcz+2nNqQjFyTTU8oBuv/AuT3ZbZBHsNjUDjpgDAEzDjkJpXBjBsrMwDL2nwVrfPzDICpHbUuLZa/YHJC/rcKQWD9Y8dqMDZW2xsixgBNAJGG1jPQpwXzJoALPrs+62JZJCzxozCGuhWourSNUsTjeNsU7MxlCz6kkVApgT+e27Ey8HhSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(41300700001)(2906002)(6666004)(6486002)(86362001)(38100700002)(31696002)(8676002)(66946007)(5660300002)(4326008)(316002)(7416002)(478600001)(8936002)(54906003)(30864003)(66556008)(26005)(66574015)(31686004)(36756003)(6916009)(66476007)(186003)(83380400001)(2616005)(6512007)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkFEVXdTcEFyMHZaZXVHdW9NTndlVHFuSGdDQmcvaG0wdXVmYjczdTNXUmhF?=
 =?utf-8?B?MHNFZmxmd1ZaOEo2dXJOYUlyVkJwSnIvRzZwK1c2TTd2SmdqSmU5amNuMFJG?=
 =?utf-8?B?WlVGZGMxMjNZYkZzUkE2U2JXSkdsZzhIbjFUbEw3U3c1RkNUelpXRlErZlhu?=
 =?utf-8?B?eFZpZDJOU0tBVlBKbGFTSDZjT3paMEZWeTBHMzUvOVV5dFFJTFlQUVpIaUEv?=
 =?utf-8?B?SWdNVXZqNy8ySlFqK2o2UW51L016NXAzYkRTQUloMGI3RDFiSnlKZ0M2Y2ZO?=
 =?utf-8?B?MUE3a3JDbFNXV1pMc29DeG1rSzBlRkZ5SExWZ0JYbWdnMC95MlV6aGV0clo3?=
 =?utf-8?B?ZUtNSzZqTmgvSFNueFRGVnNjSmFVbjNpNUY1R2JwUEdGdUJzWHB5OTNxa2lu?=
 =?utf-8?B?VEp0QkhsTGp4UXliZmhkaE4xajdWTGlFVTNUdzVqVzhRbzhaZFgyaHJyZVQ5?=
 =?utf-8?B?aFZhTXBPVVgvUG9DMklpQTRIVmlaY0h6TGFnd0FLMGl5bnBSL0V3NDFXQ1Ra?=
 =?utf-8?B?SE4rTnlJZ3hub2FWYWp0UlRUYjRrbHdVQjdyaXlsMVRLTGgrTjlmVzlJS0Ns?=
 =?utf-8?B?RzdTb3I0cy93OW52cVRhT3lGbE1iZ3ZEMFcvd0xxTFlrUDFWL3R2SllmUU14?=
 =?utf-8?B?TlVDbXdZdWlmT1FxaEZKeVNseUVQMmxqenRyR3RFTEorSzQ3OGhFcTNnYWpH?=
 =?utf-8?B?SUhOdDBFOWZ6TVpBVDVUQXlIQVJiQzFjN2pJbDBIa2VSVkYvN2hOVnc2ZkVE?=
 =?utf-8?B?ZTNVMVowRDJxcThoeE1qSEYyUThmb09YclhpZjEvNW1oUWFTKy9yMWtPMXZS?=
 =?utf-8?B?UmNRUXEzZlU2d0VhMGF5TUpMM2VQZW1Gb0k2TFRCWHlJV0JDaHIvWWdGVXNT?=
 =?utf-8?B?Z05peFkyU2VxYklKR2tzbkd1OWp5bU4yWE85VWVlZkRIbWVMS2QyRmFWV25i?=
 =?utf-8?B?Mjl0TC9KaDNQOXJ1QlBXOE1CY0lEcEZQVGhCVDRFdHRMc3JvNnplZDducTBh?=
 =?utf-8?B?dHQ1UjN6MmF6V3ptdkZzSG5aelFTZ3lzbTJ4ZEt6N3ZqNTVWN3o1MlFpUnp1?=
 =?utf-8?B?Y0g1OHVBV0I5VGVqdWVhUHZNN1NYdy9FL01ZV0RoSG41UmJCdUxCcG9nT1Fr?=
 =?utf-8?B?dS84T29PYysyWTZWSE16eTFoaVEzUE9Ud3VqSE5IUVNlWE45QTNPOXRYT0RK?=
 =?utf-8?B?dVZFU3l3MzE0SG1jVHRmQlRxclEzS3pGZ0trNEV4ZzdzSi9mdnhFUXpVSytV?=
 =?utf-8?B?dm02V09pMFRoZWJadTNhc2JNZkVHZDM3T3V2V0NaZEdCQTVyZXRRQXEzQTVU?=
 =?utf-8?B?UFFqb1dCcnZ2WHFaTHJ1RUVmYTJVR1h2QitheWpkc1FuRTNoYVQ2azZlaWZo?=
 =?utf-8?B?NUhuRkVzYUVQLzJwc1prUnczSUg0K0NTL2hhVkRDOVRmQ0dKQ2h3SElFQ1RB?=
 =?utf-8?B?MGJPaysxUi9VclZFbFBibHR1ZnlTYWE4TWFCaCtLY3k4N2JtRUsvWnpRdlpp?=
 =?utf-8?B?MjJYZ0lMZzdtS2ZORlI0VEN0VFhDdlIwYWZGZ1hJT2dQTk1iTk82R0NyYXYx?=
 =?utf-8?B?WS9ibVh3bWh4RXcrRUNQd2kxeUJwMHNmTmFxa2EyMTRFdkFwcFM3UEE5NGpR?=
 =?utf-8?B?amMzZHlqZzB0VTB5UkFmSkNoclF1NC8zOFRlcE5rdTBiS01Na3R2dUU4eFpD?=
 =?utf-8?B?R2h5S2ZXMUtWQUlUMmFmT3E5Z0l4MFQ3aG80cGZ2YWdncHQybVVvazZlVkxR?=
 =?utf-8?B?bnVZZW50WUk3bExTN0FvYlQ4L3pYbXVkdmNJS0pGTSt5VTNCUytlSi9Udmoy?=
 =?utf-8?B?SU1IMm5DQTlrbkE5QXRLMTF5NmZ3QzlYckJPemtmelhhZk5HVlgzTzFHbnh2?=
 =?utf-8?B?RTZSRnE4RDJ2UERpd3lFcFM4NDh0N2N6RHpMRzU5SExSajVNWG1UaVFtQW9D?=
 =?utf-8?B?SlFFcnkzMFkyZFo1WGFZWCtmTjBTTHUwcktUZmR0RVJLc0JNQ2Y4Y1hPb2ht?=
 =?utf-8?B?Y0hrdGtCcEpmTDltUUhRaVM0SDVtZWVlaUp0ZlRiSndoMW1tOWpRR2Y5ZFBN?=
 =?utf-8?B?UTZvOVdZQ2ozMW90YW41ZFRLZHhObUZYRW9NZ2RXYkNXTHBUS1RpS3dmNTdu?=
 =?utf-8?Q?XMiK6lu5V/zwO2GMYu9u0RiWH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4ada2d-9972-411e-689f-08da8036db8d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 09:57:12.9225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/JNyvncEb3wbUp7l6oneMWYXaad4rnTCaFMt5n3QO8QadRCyOWuBHVlsFg/33Uz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3746
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.08.22 um 19:29 schrieb Rob Clark:
> On Tue, Aug 16, 2022 at 9:51 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.08.22 um 16:26 schrieb Rob Clark:
>>> On Tue, Aug 16, 2022 at 1:27 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 15.08.22 um 23:15 schrieb Rob Clark:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> This is a fairly narrowly focused interface, providing a way for a VMM
>>>>> in userspace to tell the guest kernel what pgprot settings to use when
>>>>> mapping a buffer to guest userspace.
>>>>>
>>>>> For buffers that get mapped into guest userspace, virglrenderer returns
>>>>> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
>>>>> pages into the guest VM, it needs to report to drm/virtio in the guest
>>>>> the cache settings to use for guest userspace.  In particular, on some
>>>>> architectures, creating aliased mappings with different cache attributes
>>>>> is frowned upon, so it is important that the guest mappings have the
>>>>> same cache attributes as any potential host mappings.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>> v2: Combine with coherency, as that is a related concept.. and it is
>>>>>        relevant to the VMM whether coherent access without the SYNC ioctl
>>>>>        is possible; set map_info at export time to make it more clear
>>>>>        that it applies for the lifetime of the dma-buf (for any mmap
>>>>>        created via the dma-buf)
>>>> Well, exactly that's a conceptual NAK from my side.
>>>>
>>>> The caching information can change at any time. For CPU mappings even
>>>> without further notice from the exporter.
>>> You should look before you criticize, as I left you a way out.. the
>>> idea was that DMA_BUF_MAP_INCOHERENT should indicate that the buffer
>>> cannot be mapped to the guest.  We could ofc add more DMA_BUF_MAP_*
>>> values if something else would suit you better.  But the goal is to
>>> give the VMM enough information to dtrt, or return an error if mapping
>>> to guest is not possible.  That seems better than assuming mapping to
>>> guest will work and guessing about cache attrs
>> Well I'm not rejecting the implementation, I'm rejecting this from the
>> conceptual point of view.
>>
>> We intentional gave the exporter full control over the CPU mappings.
>> This approach here breaks that now.
>>
>> I haven't seen the full detailed reason why we should do that and to be
>> honest KVM seems to mess with things it is not supposed to touch.
>>
>> For example the page reference count of mappings marked with VM_IO is a
>> complete no-go. This is a very strong evidence that this was based on
>> rather dangerous halve knowledge about the background of the handling here.
>>
>> So as long as I don't see a full explanation why KVM is grabbing
>> reference to pages while faulting them and why we manually need to
>> forward the caching while the hardware documentation indicates otherwise
>> I will be rejecting this whole approach.
> Didn't we cover this on the previous iteration already.  From a host
> kernel PoV these are just normal host userspace mappings.  The
> userspace VMM mapping becomes the "physical address" in the guest and
> the stage 2 translation tables map it to the guest userspace.
>
> The resulting cache attrs from combination of S1 and S2 translation
> can differ.  So ideally we setup the S2 pgtables in guest aligned with
> host userspace mappings

Well exactly that is not very convincing.

What you want to do is to use one channel for the address and a 
different one for the cache attrs, that's not something I would 
recommend doing in general.

Instead the client pgtables should be setup in a way so that host can 
overwrite them.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> If the hardware can't use the caching information from the host CPU page
>>>> tables directly then that pretty much completely breaks the concept that
>>>> the exporter is responsible for setting up those page tables.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>     drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>>>>>     include/linux/dma-buf.h      | 11 ++++++
>>>>>     include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 132 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>> index 32f55640890c..262c4706f721 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>>>>>         .kill_sb = kill_anon_super,
>>>>>     };
>>>>>
>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>>>> +{
>>>>> +     int ret;
>>>>> +
>>>>> +     /* check if buffer supports mmap */
>>>>> +     if (!dmabuf->ops->mmap)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
>>>>> +
>>>>> +     /*
>>>>> +      * If the exporter claims to support coherent access, ensure the
>>>>> +      * pgprot flags match the claim.
>>>>> +      */
>>>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
>>>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
>>>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
>>>>> +             } else {
>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>>     static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>     {
>>>>>         struct dma_buf *dmabuf;
>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>
>>>>>         dmabuf = file->private_data;
>>>>>
>>>>> -     /* check if buffer supports mmap */
>>>>> -     if (!dmabuf->ops->mmap)
>>>>> -             return -EINVAL;
>>>>> -
>>>>>         /* check for overflowing the buffer's size */
>>>>>         if (vma->vm_pgoff + vma_pages(vma) >
>>>>>             dmabuf->size >> PAGE_SHIFT)
>>>>>                 return -EINVAL;
>>>>>
>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>     }
>>>>>
>>>>>     static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
>>>>> +{
>>>>> +     struct dma_buf_info arg;
>>>>> +
>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     switch (arg.param) {
>>>>> +     case DMA_BUF_INFO_MAP_INFO:
>>>>> +             arg.value = dmabuf->map_info;
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>     static long dma_buf_ioctl(struct file *file,
>>>>>                           unsigned int cmd, unsigned long arg)
>>>>>     {
>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>>>>>         case DMA_BUF_SET_NAME_B:
>>>>>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>>>
>>>>> +     case DMA_BUF_IOCTL_INFO:
>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
>>>>> +
>>>>>         default:
>>>>>                 return -ENOTTY;
>>>>>         }
>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>>>         dmabuf->priv = exp_info->priv;
>>>>>         dmabuf->ops = exp_info->ops;
>>>>>         dmabuf->size = exp_info->size;
>>>>> +     dmabuf->map_info = exp_info->map_info;
>>>>>         dmabuf->exp_name = exp_info->exp_name;
>>>>>         dmabuf->owner = exp_info->owner;
>>>>>         spin_lock_init(&dmabuf->name_lock);
>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>         if (WARN_ON(!dmabuf || !vma))
>>>>>                 return -EINVAL;
>>>>>
>>>>> -     /* check if buffer supports mmap */
>>>>> -     if (!dmabuf->ops->mmap)
>>>>> -             return -EINVAL;
>>>>> -
>>>>>         /* check for offset overflow */
>>>>>         if (pgoff + vma_pages(vma) < pgoff)
>>>>>                 return -EOVERFLOW;
>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>         vma_set_file(vma, dmabuf->file);
>>>>>         vma->vm_pgoff = pgoff;
>>>>>
>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>     }
>>>>>     EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>>>>
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index 71731796c8c3..37923c8d5c24 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -23,6 +23,8 @@
>>>>>     #include <linux/dma-fence.h>
>>>>>     #include <linux/wait.h>
>>>>>
>>>>> +#include <uapi/linux/dma-buf.h>
>>>>> +
>>>>>     struct device;
>>>>>     struct dma_buf;
>>>>>     struct dma_buf_attachment;
>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
>>>>>          */
>>>>>         size_t size;
>>>>>
>>>>> +     /**
>>>>> +      * @map_info:
>>>>> +      *
>>>>> +      * CPU mapping/coherency information for the buffer.
>>>>> +      */
>>>>> +     enum dma_buf_map_info map_info;
>>>>> +
>>>>>         /**
>>>>>          * @file:
>>>>>          *
>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>>>>>      * @ops:    Attach allocator-defined dma buf ops to the new buffer
>>>>>      * @size:   Size of the buffer - invariant over the lifetime of the buffer
>>>>>      * @flags:  mode flags for the file
>>>>> + * @map_info:        CPU mapping/coherency information for the buffer
>>>>>      * @resv:   reservation-object, NULL to allocate default one
>>>>>      * @priv:   Attach private data of allocator to this buffer
>>>>>      *
>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>>>>>         const struct dma_buf_ops *ops;
>>>>>         size_t size;
>>>>>         int flags;
>>>>> +     enum dma_buf_map_info map_info;
>>>>>         struct dma_resv *resv;
>>>>>         void *priv;
>>>>>     };
>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>>> index b1523cb8ab30..07b403ffdb43 100644
>>>>> --- a/include/uapi/linux/dma-buf.h
>>>>> +++ b/include/uapi/linux/dma-buf.h
>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>>>>>
>>>>>     #define DMA_BUF_NAME_LEN    32
>>>>>
>>>>> +/**
>>>>> + * enum dma_buf_map_info - CPU mapping info
>>>>> + *
>>>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
>>>>> + *
>>>>> + * Importing devices should check dma_buf::map_info flag and reject an
>>>>> + * import if unsupported.  For example, if the exporting device uses
>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
>>>>> + * CPU cache coherency, the dma-buf import should fail.
>>>>> + */
>>>>> +enum dma_buf_map_info {
>>>>> +     /**
>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
>>>>> +      *
>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
>>>>> +      */
>>>>> +     DMA_BUF_MAP_INCOHERENT,
>>>>> +
>>>>> +     /**
>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
>>>>> +      *
>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>> +      *
>>>>> +      * The cpu mapping is writecombine.
>>>>> +      */
>>>>> +     DMA_BUF_COHERENT_WC,
>>>>> +
>>>>> +     /**
>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
>>>>> +      *
>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>> +      *
>>>>> +      * The cpu mapping is cached.
>>>>> +      */
>>>>> +     DMA_BUF_COHERENT_CACHED,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct dma_buf_info - Query info about the buffer.
>>>>> + */
>>>>> +struct dma_buf_info {
>>>>> +
>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
>>>>> +
>>>>> +     /**
>>>>> +      * @param: Which param to query
>>>>> +      *
>>>>> +      * DMA_BUF_INFO_MAP_INFO:
>>>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
>>>>> +      *     caching of a CPU mapping of the buffer.
>>>>> +      */
>>>>> +     __u32 param;
>>>>> +     __u32 pad;
>>>>> +
>>>>> +     /**
>>>>> +      * @value: Return value of the query.
>>>>> +      */
>>>>> +     __u64 value;
>>>>> +};
>>>>> +
>>>>>     #define DMA_BUF_BASE                'b'
>>>>>     #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>>>
>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>>>>>     #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>>>     #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>>>
>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>>>> +
>>>>>     #endif

