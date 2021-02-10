Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42D316089
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91A76E99F;
	Wed, 10 Feb 2021 08:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E560C6E99F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 08:05:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic6NZNX6e8sAAp8R7X6ZZYNskfeQWFdnrnD5x4vepuZE50gpFzCg156Sw5Vh77h8KbDVEyzAa7VWhbdjx+BQs7ClOmkxzQYUbXkqxxXJ3D453LgXavCYLBXF0EF7Cw1nUj9iHW5XJMfWTJUlfDzbVyC6e/rWtgeAm+S+Le2AM688mXv86pBy3Nn6/Tg9yBfxZB17ae6L4SnKMDUVs6JWoNLB/7B3WzUKaEjCIo9UEkNH3buaBPLYiKH4CPwAoRP5CUibxJJ65j15TuHAclVAY9Z4ZfOtGqdTf/2OPdErBS2KJ9ATtBOoi2669QHyRgOmDyADpa1ZAdZ5P5ivIacAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl3167aigB5XKb1aaYpUksHpjgXFWRZLiDrbq4tkrGU=;
 b=AgzcvVNrjIfVwJC3MNjVskhei2mw16+PcpkDV68rG5+ihh78xpAftW6Gww82pziOFiRy7oFfVKWsln8R3uZ5e34SV3lENwIydOUD9u18NiC92zPpviRdNnecZblFuQWbQRETmAqd2NifmQ5xk1PUPhQtYjnLo14spu+aOmCT4p54yac3mqVvH9cuUCEbwzqQLD5sC2rYkTBWeot5nCPMSqPl8i/qnxJsCue/9FLdIDDN0vPrBYq90IUxRGm1D0nE1z0xpMu637nQdrtGLccrzKhEyaQDCC1mrCWQYzW3+x4xz5Vcohw4+9c98b7+bW9uuX9CU7mgPMaXh8uwZhORNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl3167aigB5XKb1aaYpUksHpjgXFWRZLiDrbq4tkrGU=;
 b=yCz7CGnBoRfQOYX/Tov7eLi6RxhMpYXWNkbDTf/0FRe5K1+SlE2E89M0AMwYe3MlPk/Y+tqjEfpt/MRaaEXDc9PthOrNCy1W8IFmZUJCCbFx2moDKfUTo1XlhNkBVreb3wWFN0iEshwvW49llHdD0pfB6gYkQYjzuv/0xTGylY8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 10 Feb
 2021 08:05:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 08:05:33 +0000
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
Date: Wed, 10 Feb 2021 09:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2ef01dc941684a15a4f30e6239ae42df@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: AM4PR0302CA0025.eurprd03.prod.outlook.com
 (2603:10a6:205:2::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 AM4PR0302CA0025.eurprd03.prod.outlook.com (2603:10a6:205:2::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Wed, 10 Feb 2021 08:05:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a56c7f8-7e60-4ccf-d4d6-08d8cd9aa40b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40612F27E625DDF6205DF0B5838D9@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcjh5oxpMOgQHDKExHPDlA++rk+MkCqcsVE9z8yBJMk+ADCsj9U7EUcGPRlm82RkFNfWHrCSSWTJpeYu7sOSvsFdCAYT2aHeFt7cvLIh0+mErSdil0h1ZzYLSNYIRn49/2WU94wqXz8MzWij67PmIop6u2RALGMcos4dbaLbHyPyOY2BrqhNT6p1kMqmezdmZ453qpvOx1jmRM2LpkWkKwQoSqs+SqmFZ8evrt/stM/+P4dSj/4qy9+KjkmxQLfGRV1a7AiFUVTLIexF0S1Td3w5t++X+T3bUCddARmFen8lEECFKdxKXI3sAbp1xDm27gRysI4g5lM2A87f25dBuLrhta5GCzqEjqPRqv9OZ2Xal7Ej2xcvGaL1R+doB6zkTeNDAVuyHFlsNP4s6ocXTImmV5N067C5WdjbHkar9DK5RmmCCPjN6sLYB5+0dLRzN12ITLjegAQxa7rxN+J6aBwKjjIJyzkwPslpKQf3R9HYwhETXNuztsEcIHpAyIoQGadotGNGNIP6CwEfO9u3IM7sEwxKc8jvtGUflVTbOZuZ5YDMtmfQU4kH3cO122ppetrvHLpMwItMxDnSDo80MJVQBQm1jqTRBRxLmnxD+tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(186003)(16526019)(86362001)(2616005)(8936002)(7416002)(83380400001)(66556008)(66946007)(2906002)(66476007)(53546011)(31696002)(6666004)(5660300002)(54906003)(36756003)(31686004)(52116002)(478600001)(6486002)(316002)(110136005)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWIzbUdNTm9MWUFRa2hnQjFnVTJXUW1zMUE3MlFJenYwUnJaaUN1Qm1ONjFS?=
 =?utf-8?B?L0hqaVJudkczL05JaGl2Z3lkZVoveHFOMm5iMmQ3NkxkRjI1aVhNMGRBdzI0?=
 =?utf-8?B?Y2x5L3M5aE12dFgxT1pZVjR3dTlmM3ZFS3k4dm9lRjgzVFlIelk3UXdadGpI?=
 =?utf-8?B?U3hNSUVHUGtsdXdmd1ZxR2dZdjd3eE5PdGpxUzhhb0FSaVpNNmR5NkV3OU44?=
 =?utf-8?B?dll6VW5tL3MrMXhzdzJ3eS9hWDEyNndpc2tlUGt0U05NOGRURERPemRQQVdv?=
 =?utf-8?B?SlAwcGsvSHlTRnlFcmltMGJYK1hOVEVGOE9SSGVsNW53ck0zSHRMRm5seDdP?=
 =?utf-8?B?U3VZU3FKN1JwSjhxWUxoYWo3d3IyUkt2V05WQUsrRmlhR0JQKys5bzZQcFZZ?=
 =?utf-8?B?elEyZzZCZEd4WHRpMTRiNkhlR2dUUUdwRUpLQ0phelRsemxkL2tnNW5CbXdO?=
 =?utf-8?B?WncvQ0xmcWxZN3JkbzY3NW54Qld5ZXRVTDcrZlJMa1U1eFVFcllQQzU3SFo4?=
 =?utf-8?B?QkM2c0liSGVaUkNSY0xCM043bXp1ZW00SFZlQ21aVTNFaDZIdUE1UXVTdVA5?=
 =?utf-8?B?aU1EZVlLcExKditNb1pQUjhDSGpIdnFPZkxsV3VmamRKNnF1clV3eFhWUHJZ?=
 =?utf-8?B?dFFOM1NVOUkySVA1WVBVaUxtTFlNejhPaDcvZTg1cGJ0TmNHTjdFbFNTTGRI?=
 =?utf-8?B?RytBbmJNR2pJVCtPVnJoZ3l0QnFGZitGOURsZ2lvYUVhQ2NWMTZlKzJTaCtt?=
 =?utf-8?B?WDRJRWIwb2YwelYrcEJsTXFrR1hoK001b0xETGJVa2Zmcnh0c3B2T2RncEcx?=
 =?utf-8?B?cmF2bkZnT0NlTmJleEhXK0piNDd5MXh6WDJRV1BVSmU1aEIyaTgwc1N4Tmt2?=
 =?utf-8?B?eDVQT0YrT1lVaStoZllQeWR6emI4b0hiUWNmeE8rdllPbjRieldtMUFzeksw?=
 =?utf-8?B?TnZJS2x5UVJmNldMMm5wSnlZUHo4LzZaVFZvTzVibkd5RW04MWkyUUhBT21n?=
 =?utf-8?B?ejU5ZDc3eldqSUtaM21LUUwvL2x3RS81dm9uSWJIVzRkZTN5dkNyVkVubENv?=
 =?utf-8?B?aFdaV2s4UDNEU3JyYkZJSldrRHhYRkVmRTlhVERUZExBRk40czJJNVR5N05J?=
 =?utf-8?B?RjQxY1RTelpSeWx2NFNOcXBSY2FZYjgxSlBjL3JnMVUzVVREMjVVTnBiSDJH?=
 =?utf-8?B?Q0l3Vlk2R3c0WDVYQlo5Q0VjNE9hMGFYdldJcVlZRm9WenJZekE2cExPdHI5?=
 =?utf-8?B?VHkyQzV1bWdpODQrM3dYM2RFZkZNRmZLbExtelh4Nk04dTc4azF6a3JaaEh5?=
 =?utf-8?B?TkhYNmhuSCs2ZDhKVXEyd3dINkxaK0VSclg0TlUwTGt6eThNNkE4S0N3TnNk?=
 =?utf-8?B?dUVxT2V4MzRCdlU5QkZiV3I2UUZNN0p4N2dKUWRCaE1kb0NKc2d0bXRTUU9k?=
 =?utf-8?B?S2FhWXBub0w5QnRab2h2Kys1YkxJdSs3Rm5SekxZVURYbTVaVW4ybjMrdVk3?=
 =?utf-8?B?WGVhUTR1V1NBSnE0WmxKalNpM1hwa1JJTWFVamhXU2NoSjZTcjlYdmFzN2Qy?=
 =?utf-8?B?QlhjVTZ6WjZnelFqdjhFRmptcXUwNkE0bWZTYXdRQ0Q0SWlidGh5WFFxd1Nx?=
 =?utf-8?B?WGd3TEtURjhsNDd2ZU84T0tZT3YrSmh1d0tsOHpCR0tKRWRmUmxLVHFPenEy?=
 =?utf-8?B?M1dTY2p2OHkybmFCTHJZQnFaN1Y1SDdJcnlFSHU5OVlCZ3V2ODFwWnQ1emtQ?=
 =?utf-8?B?cUtFTzFlT0hPTzRrR010UGRTWnBmSUw5c20zVnVUYVdDaVdsUGhhVlNYQkJR?=
 =?utf-8?B?d3hkSDNjTDNCUW1ITzBXKy9SR0poWDE0UEVwTFlESWtxSFlYNkVxTjdIUG1O?=
 =?utf-8?Q?mnKuZVkTazylW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a56c7f8-7e60-4ccf-d4d6-08d8cd9aa40b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 08:05:33.7549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJJ+wpJm1/X74N7lfQiRNyVgoFkrcAEyp/E5mjG7n5MT8SOC4xd0CQtiGRr6rg1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

Am 10.02.21 um 05:47 schrieb Kasireddy, Vivek:
> Hi Gerd,
>
>> -----Original Message-----
>> From: Gerd Hoffmann <kraxel@redhat.com>
>> Sent: Tuesday, February 09, 2021 12:45 AM
>> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>; virtualization@lists.linux-foundation.org; dri-
>> devel@lists.freedesktop.org; Vetter, Daniel <daniel.vetter@intel.com>;
>> daniel.vetter@ffwll.ch; Kim, Dongwon <dongwon.kim@intel.com>;
>> sumit.semwal@linaro.org; christian.koenig@amd.com; linux-media@vger.kernel.org
>> Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
>>
>>    Hi,
>>
>>>>>> Nack, this doesn't work on dma-buf. And it'll blow up at runtime
>>>>>> when you enable the very recently merged CONFIG_DMABUF_DEBUG (would
>>>>>> be good to test with that, just to make sure).
>>> [Kasireddy, Vivek] Although, I have not tested it yet but it looks like this will
>>> throw a wrench in our solution as we use sg_next to iterate over all the struct page *
>>> and get their PFNs. I wonder if there is any other clean way to get the PFNs of all
>>> the pages associated with a dmabuf.
>> Well, there is no guarantee that dma-buf backing storage actually has
>> struct page ...
> [Kasireddy, Vivek] What if I do mmap() on the fd followed by mlock() or mmap()
> followed by get_user_pages()? If it still fails, would ioremapping the device memory
> and poking at the backing storage be an option? Or, if I bind the passthrough'd GPU device
> to vfio-pci and tap into the memory region associated with the device memory, can it be
> made to work?

get_user_pages() is not allowed on mmaped DMA-bufs in the first place.

Daniel is currently adding code to make sure that this is never ever used.

> And, I noticed that for PFNs that do not have valid struct page associated with it, KVM
> does a memremap() to access/map them. Is this an option?

No, even for system memory which has a valid struct page touching it 
when it is part of a DMA-buf is illegal since the reference count and 
mapping fields in struct page might be used for something different.

Keep in mind that struct page is a heavily overloaded structure for 
different use cases. You can't just use it for a different use case than 
what the owner of the page has intended it.

Regards,
Christian.

>
>>> [Kasireddy, Vivek] To exclude such cases, would it not be OK to limit the scope
>>> of this solution (Vdmabuf) to make it clear that the dma-buf has to live in Guest RAM?
>>> Or, are there any ways to pin the dma-buf pages in Guest RAM to make this
>>> solution work?
>> At that point it becomes (i915) driver-specific.  If you go that route
>> it doesn't look that useful to use dma-bufs in the first place ...
> [Kasireddy, Vivek] I prefer not to make this driver specific if possible.
>
>>> IIUC, Virtio GPU is used to present a virtual GPU to the Guest and all the rendering
>>> commands are captured and forwarded to the Host GPU via Virtio.
>> You don't have to use the rendering pipeline.  You can let the i915 gpu
>> render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
>> buffer sharing with the host.
> [Kasireddy, Vivek] Is this the most viable path forward? I am not sure how complex or
> feasible it would be but I'll look into it.
> Also, not using the rendering capabilities of virtio-gpu and turning it into a sharing only
> device means there would be a giant mode switch with a lot of if() conditions sprinkled
> across. Are you OK with that?
>
> Thanks,
> Vivek
>> take care,
>>    Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
