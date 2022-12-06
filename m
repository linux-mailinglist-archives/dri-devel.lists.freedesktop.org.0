Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09740644BE4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9110E343;
	Tue,  6 Dec 2022 18:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A709A10E343
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 18:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD7yyTIp5KiwdyomyKoSgB8w2sPXjNT/mqOPmRuid5O5qXxBDpf81SsooqskSVu472FHERZ2MK7AzzHkRc+LPzXZ7YtYmdNfupR2WCAVDtZM4+OZMwePO9m4C9aZ5l+9hMz8MjLQvjKwgiEyezGzE7xML5IFZkNI7Sps32rRjZJzd4THw+G4j14SO/RZZ4Di8CF+RSbERuFhedLug2++Ds9LeXoYrBKASIjRMGmkvPfvCmYNwD/Jv4XDaBQEcvQQ39Ujb80Oby0EE3R43GKJcqqyYR4N4aN7E2WFBXU13dgBymwUslxLepxroo+B/hMAke8Yqp2BIOW5p7H5AsuFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umQKZV/w4ROy/ak14266PgCeEUkD25K/9jb7awTrQXs=;
 b=Jm1MuWeqUfbIKnD4zsL4vDRAO7qSGvYvnerCZOJ9hQxamNHKDKfhfa5ehbBrGC3VEYyAwer/DyxjEuuup5b853Q0YYRqp+xHQtQAPj7rn3uTE3K5MMsbnST2QxmE/znIrfEbMA1+4FhK5ya42DMwwibtMY7YADby0PdkZSLRvHZADXbh+m+eAOInsUceRnfoIBAuQQ7EvDFcGw+Wg5+ZCNT6cS3vcylwcDCSUWKDRXl221gieO3oqcraJE43sjgMV7sxgAtbqCJFZdVeB2+aVK0Cl2riyzAB0uKXxzjpPdsK0iNh4MRUbNEl1Xkqkf3b+0NDq8Ktjdts3fYcFBxp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umQKZV/w4ROy/ak14266PgCeEUkD25K/9jb7awTrQXs=;
 b=OOpnWmEKjige3Izk5RbvlXvtrUmbIK1AoiaT16FKMm6FXGy28YJeZC5F4A3WiCBrryM+Ni+yLED/wtJQpP/VdG5aERQl0TMoLFQtEigRsYq0VCqI4yWIQ1atqN8rfV2Sh7VU/lDpW33o6sHVhGcIJPVCdhaO3KzPwPZ3A5SCXAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 18:37:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 18:37:51 +0000
Message-ID: <cedbf10a-b0ab-a460-b757-f495a3ffc167@amd.com>
Date: Tue, 6 Dec 2022 19:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Tomasz Figa <tfiga@chromium.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
 <45df0c693d5485cdaa30946704299d57e3dac977.camel@ndufresne.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <45df0c693d5485cdaa30946704299d57e3dac977.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa7a804-b07f-4277-34ae-08dad7b8fb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFPCcQFzvfYiaXawpqikGYAxp768JHt0MeZGe20u0cMc8ZWUylRHcv8yOzSpdA7skIIbWtaEOTrBPovEYdyqEZcBNOFPKGAoNpugViACalw964vDwNi0NSQIVHwx4qPCC+yKy9zF3EK2qGH9x0+Y8jKkx8MaacI9RXLo69pWtzEUhF1V5St4vUG0wSJ0lSXn7SX1Q1x0viOFjLkJ4rYfvm3LvQwxC0d5DICuIVMTjjOqcZgT5YXCfWodGLuOidMsuNSKqbbXfA466WUXPZaUa3EaC+3DjlLfSaRMFKiRga6hE4q2LLMnTE7g06zXvXvMeb37h3gt1lcb8pz777bPhQqN9zMZz8pxNVMbQFbZILxgy60AVEcgOzW7a/1QgDi1nuRfzPZe2niSj9frgRrUNaDidUj9ClzZ61LsyZFXqrmvLbkmKl4j2E/zaiA6KvR668B4P5kmij0gNSnoda90XeFPSm0ahnaQFTkxFVQ3xxoY1mQBxgBOu8YMjLXUHbgZh9gOEFGgoe79/UGbrJCE++h352ygVf3UH5Lszkz3jHt4bGA30DgLq4Iqre95Alb2OeGM3MyuDL9RRBuI1bmOrTAF8r30OIZENFVWSqccX4pKS8Rk9nSfyyf/o3AZi1Qgaei8Ea0EoafG0Ah7xO6RCRaxMnmBnZwEJ0eUa7pQfGwU7AhzbovOq5Xvo65QpcbgXqXc6E8N2YrYWMvfkop254puPM0G31fF0uU9UZp8hbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(31686004)(66899015)(478600001)(38100700002)(6486002)(6666004)(6512007)(2906002)(2616005)(6506007)(83380400001)(66574015)(5660300002)(30864003)(86362001)(7416002)(36756003)(8936002)(31696002)(186003)(41300700001)(54906003)(110136005)(66556008)(66476007)(8676002)(316002)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNreWUvNHZvQlJyeDFBcm5nUTZIYTJCdkxoYVlnR1czREVXc2M4cnFEK1NB?=
 =?utf-8?B?Rjk5dWV4azl3MHFjcXNqd3hEQVoyQm5hYXhHcmRMUWhLV0JTTmxWcU9FSFJ3?=
 =?utf-8?B?TUZna3Evd3N1eFg2NU1haldWRkswc2p0ZmQ5bklqZ2hSbkRkVjBvc0FZQ3l6?=
 =?utf-8?B?d1ZoOVV5QUpqQ1J4TkNFcmhYVkxLbFFTdTgyVUpLTjNiQTRTVk14SFlQYVRs?=
 =?utf-8?B?dC9aRnNaM0pSTFJOSHN3M1lJTjNhL1g1Ui9BTU4vTUhtdVplQitTOG1KZXNU?=
 =?utf-8?B?elhaYUh0VC9RVXNZeVd4Sm0vdzFZUEJEZWY4L09JUXFGMHR6VG5KWEN5ZkFG?=
 =?utf-8?B?WU9yd2NhWTREQkJBRitBQTF5bk41am9ldmwzZ1M1U002UnEvUWtEOGc1UzJ1?=
 =?utf-8?B?TUFtdDJQZzBOdlVvbS8yVW50c3pjVGRzS2JBSE9Bd2paOHNYelF6RnB4czJY?=
 =?utf-8?B?aUpQQkF1MXBxb1QrdlRrOGs4a25EYTZsMWtzRHFCcThSRVcwYVllV3VGbFNM?=
 =?utf-8?B?Zk91R1pkV0REQlkrenJKMDlXeXphR1pES1R0TUVENDV1TTlrRWdBVEpoK3FR?=
 =?utf-8?B?YTNDT1NBVERQeWZCWE9LWXUyZGE3YVJQM2VGYWRCajNjMCs3ZFBVVkZiOWpM?=
 =?utf-8?B?dGJYOTRjendBMll3cFhqejFlSHM4RzZDU0Nram9UcUtjR0NWWGl4Y0dNVnlP?=
 =?utf-8?B?RGNOcTdmL0VpWnRSMDN2Y2VJbHFLWW9seVJ5b05rUnZiaWZqTGxITE05bXF0?=
 =?utf-8?B?ZmxldlhrUGxuNmJ1a0VGRENmYkthWFhSYUJPM3BIZUZHQTFKalRtYkZEQTV5?=
 =?utf-8?B?eXFXcFZ3K25mZWVxRFZSNnFPRnNLYWMvdU9PMnNidnNrVkZMTUxuMXpWWjdw?=
 =?utf-8?B?ZE1yK1VNVTVkOXhuSkQ2cU12ZVVXZG96RjlJaE1OWFlnTDhJSmdQdUVMS1J6?=
 =?utf-8?B?V1Rsb2w1aUJpYmliR1JlUVZvclh6eEIyekNjbktaTzBMeVU2RUw2U0h5Qmhy?=
 =?utf-8?B?ZFlwL3ZQQklzNGxDT0RiT0ZESXBzMTZESFZKMWpPVllrOW93M1F6V25QRG8v?=
 =?utf-8?B?TUJqWThLTTBHNEpVc09xMWMvTk5uekpjRThYSzBsVndDQVhVQU1uZmlOMVZj?=
 =?utf-8?B?WEVzc3VaNzZWOG9QRFhjbnJZcWlQVTNKMzVQMUtEN2tqWjJnZTJvcW1NMk8r?=
 =?utf-8?B?VXlVcy9jSU1mMm9QajBmaUUrQjFNUVhMUFB0OTYwRk1IRUw4YnJXSDF5YnZz?=
 =?utf-8?B?aDlDaFpaeWJjWEFNNTl1UVE5K293WVB2dkdIZ1J2bGZ5ZjhXTXBHWXpDZ1F6?=
 =?utf-8?B?YmxYNGgyb2JBT1ZUTzhiakxwdTVNZW1QUlYwNjBpQlNHUUQ2YjdKTXluU0dW?=
 =?utf-8?B?NlR0TWQ4NXlvRnpvcHBpd1p0MVFHS0pjM3Q4YnVEdkFNVmtZTGl1VXJRcVYr?=
 =?utf-8?B?dlB2L2FXalJvOVo2enYwVU5vYStDYTg3UGhoM0VpNHNvQnpNcXZRdXUzR09u?=
 =?utf-8?B?aTBZSzZXaklkZGE5NUdsSUhXUnFjUnBXZEhBajhoYUw1RDZjL01TZnkvUXRM?=
 =?utf-8?B?dUNQWUJ5OWc2akJoa1RiQ2pMREpjS1hDMlZsOHQwSHRDS1hFNlcyS0xuY3oy?=
 =?utf-8?B?eUptTWxpajl4aTNLSElwUWlFM2xFdEtyZUlOTVByd2EyNzFmZS9UN0xMOWJQ?=
 =?utf-8?B?TXA5elZJMGw5dkxjcEMrTmIwK0hsc1hscEFXUFR5VUxKSWVEajlDcVdGNU13?=
 =?utf-8?B?Ny9sdmlrT2ZiWXFZVjV2Z0J6UldBY1BGWTFpVVhNUG5tTkY4bTdTMFZzSHQ4?=
 =?utf-8?B?N2FJNXI2bndhdndVWEVHeVBJRDJTWnpuenZUUmlWZU9ubXU3VEMrdTBhcVdP?=
 =?utf-8?B?YVRxV1FiZnVyV0l5bkQ3YTQzOVpLcVFyMmxYWDI5OGxkR25mdlV1b0tNT3Ny?=
 =?utf-8?B?NmwyQU9WdnRpRkMxVG1kZitkNTFIc1B1Tm93a08ydmRZU0VBajdEQnkzeUNY?=
 =?utf-8?B?NGJBQkl4MnpKaXlLMGo5WGhpZTd6dnNDU2VDV24wNGptOFdrdFEvV0RZTDha?=
 =?utf-8?B?Q2ZJZGZDUmh5c2w0YkwzbTczMG9lbzM1dzdaSlJyQS9WWVZxcVRLUVFhVHJj?=
 =?utf-8?B?c0lNcUI5QmpBbTYwY2lWMEp0MlZKa0JLQzUvVlpzcVNsZjgxZmxUVkU0QWxw?=
 =?utf-8?Q?1/tRU3UsN1WDGBtqD/82N1SPqlXZfMeBlPXHmwQVqk8M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa7a804-b07f-4277-34ae-08dad7b8fb25
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 18:37:51.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erNm1dV6hmW7V/x5S3650WX3Z/J5gEwAMuMhzQDBpwt+ioM3qpP+iZ5TB8tM2kSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126
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
Cc: linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.12.22 um 19:26 schrieb Nicolas Dufresne:
> Le lundi 05 décembre 2022 à 09:28 +0100, Christian König a écrit :
>> Hi Tomasz,
>>
>> Am 05.12.22 um 07:41 schrieb Tomasz Figa:
>>> [SNIP]
>>>> In other words explicit ownership transfer is not something we would
>>>> want as requirement in the framework, cause otherwise we break tons of
>>>> use cases which require concurrent access to the underlying buffer.
>>>>
>>>> When a device driver needs explicit ownership transfer it's perfectly
>>>> possible to implement this using the dma_fence objects mentioned above.
>>>> E.g. drivers can already look at who is accessing a buffer currently and
>>>> can even grab explicit ownership of it by adding their own dma_fence
>>>> objects.
>>>>
>>>> The only exception is CPU based access, e.g. when something is written
>>>> with the CPU a cache flush might be necessary and when something is read
>>>> with the CPU a cache invalidation might be necessary.
>>>>
>>> Okay, that's much clearer now, thanks for clarifying this. So we
>>> should be covered for the cache maintenance needs originating from CPU
>>> accesses already, +/- the broken cases which don't call the begin/end
>>> CPU access routines that I mentioned above.
>>>
>>> Similarly, for any ownership transfer between different DMA engines,
>>> we should be covered either by the userspace explicitly flushing the
>>> hardware pipeline or attaching a DMA-buf fence to the buffer.
>>>
>>> But then, what's left to be solved? :) (Besides the cases of missing
>>> begin/end CPU access calls.)
>> Well there are multiple problems here:
>>
>> 1. A lot of userspace applications/frameworks assume that it can
>> allocate the buffer anywhere and it just works.
> I know you have said that about 10 times, perhaps I'm about to believe it, but
> why do you think userspace assumes this ? Did you actually read code that does
> this (that isn't meant to run on controlled environment).

Yes, absolutely.

Kodi for example used to do this and it was actually me who pointed out 
that this whole approach is flawed in the first place.

And we had tons of customer projects which ran into trouble with that. 
It became better in the last few years, but only after pushing back on 
this many many times.

Regards,
Christian.

>   And can you provide
> some example of broken generic userspace ? The DMABuf flow is meant to be trial
> and error. At least in GStreamer, yes, mostly only device allocation (when
> genericly usable) is implemented, but the code that has been contribute will try
> and fallback back like documented. Still fails sometimes, but that's exactly the
> kind of kernel bugs your patchset is trying to address. I don't blame anyone
> here, since why would folks on GStreamer/FFMPEG or any other "generic media
> framework" spend so much time implement "per linux device code", when non-
> embedded (constraint) linux is just handful of users (compare to Windows,
> Android, iOS users).
>
> To me, this shouldn't be #1 issue. Perhaps it should simply be replaced by
> userspace not supporting DMABuf Heaps. Perhaps add that Linux distribution don't
> always enable (or allow normal users to access) heaps (though you point 2. gets
> in the way) ? Unlike virtual memory, I don't think there is very good accounting
> and reclaiming mechanism for that memory, hence opening these means any
> userspace could possibly impair the system functioning. If you can't e.g. limit
> their usage within containers, this is pretty difficult for generic linux to
> carry. This is a wider problem of course, which likely affect a lot of GPU usage
> too, but perhaps it should be in the lower priority part of the todo.
>
>> This isn't true at all, we have tons of cases where device can only
>> access their special memory for certain use cases.
>> Just look at scanout for displaying on dGPU, neither AMD nor NVidia
>> supports system memory here. Similar cases exists for audio/video codecs
>> where intermediate memory is only accessible by certain devices because
>> of content protection.
> nit: content protection is not CODEC specific, its a platform feature, its also
> not really a thing upstream yet from what I'm aware of. This needs unified
> design and documentation imho, but also enough standardisation so that a generic
> application can use it. Right now, content protection people have been
> complaining that V4L2 (and most generic userspace) don't work with their design,
> rather then trying to figure-out a design that works with existing API.
>
>> 2. We don't properly communicate allocation requirements to userspace.
>>
>> E.g. even if you allocate from DMA-Heaps userspace can currently only
>> guess if normal, CMA or even device specific memory is needed.
>>
>> 3. We seem to lack some essential parts of those restrictions in the
>> documentation.
> Agreed (can't always disagree).
>
> regards,
> Nicolas
>
>>>>>> So if a device driver uses cached system memory on an architecture which
>>>>>> devices which can't access it the right approach is clearly to reject
>>>>>> the access.
>>>>> I'd like to accent the fact that "requires cache maintenance" != "can't access".
>>>> Well that depends. As said above the exporter exports the buffer as it
>>>> was allocated.
>>>>
>>>> If that means the the exporter provides a piece of memory which requires
>>>> CPU cache snooping to access correctly then the best thing we can do is
>>>> to prevent an importer which can't do this from attaching.
>>> Could you elaborate more about this case? Does it exist in practice?
>>> Do I assume correctly that it's about sharing a buffer between one DMA
>>> engine that is cache-coherent and another that is non-coherent, where
>>> the first one ends up having its accesses always go through some kind
>>> of a cache (CPU cache, L2/L3/... cache, etc.)?
>> Yes, exactly that. What happens in this particular use case is that one
>> device driver wrote to it's internal buffer with the CPU (so some cache
>> lines where dirty) and then a device which couldn't deal with that tried
>> to access it.
>>
>> We could say that all device drivers must always look at the coherency
>> of the devices which want to access their buffers. But that would
>> horrible complicate things for maintaining the drivers because then
>> drivers would need to take into account requirements from other drivers
>> while allocating their internal buffers.
>>
>> That's essentially the reason why we have DMA-buf heaps. Those heaps
>> expose system memory buffers with certain properties (size, CMA, DMA bit
>> restrictions etc...) and also implement the callback functions for CPU
>> cache maintenance.
>>
>>>> We do have the system and CMA dma-buf heap for cases where a device
>>>> driver which wants to access the buffer with caches enabled. So this is
>>>> not a limitation in functionality, it's just a matter of correctly using it.
>>>>
>>> V4L2 also has the ability to allocate buffers and map them with caches enabled.
>> Yeah, when that's a requirement for the V4L2 device it also makes
>> perfect sense.
>>
>> It's just that we shouldn't force any specific allocation behavior on a
>> device driver because of the requirements of a different device.
>>
>> Giving an example a V4L2 device shouldn't be forced to use
>> videobuf2-dma-contig because some other device needs CMA. Instead we
>> should use the common DMA-buf heaps which implement this as neutral
>> supplier of system memory buffers.
>>
>>>> The problem is that in this particular case the exporter provides the
>>>> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
>>>> with that.
>>> Why does the exporter leave the buffer with dirty CPU caches?
>> Because exporters always export the buffers as they would use it. And in
>> this case that means writing with the CPU to it.
>>
>>>> Either reverting the roles of the importer or exporter or switching over
>>>> to the common DMA-heaps implementation for the buffer would solve that.
>>>>
>>>>>> It's the job of the higher level to prepare the buffer a device work
>>>>>> with, not the one of the lower level.
>>>>> What are higher and lower levels here?
>>>> The MM as higher level and the DMA mapping framework as lower level.
>>>>
>>> Hmm, I generally consider the DMA mapping framework a part of MM,
>>> especially its allocation capabilities. It heavily relies on low level
>>> MM primitives internally and exposes another set of low level
>>> primitives that is more useful for device drivers. At least it should
>>> be seen this way, but I agree that it currently includes things that
>>> shouldn't necessarily be there, like the transparent bouncing.
>> Exactly that, yes! Good to hear that more people think that way.
>>
>> Christoph made some comments which sounded like he agreed to some of the
>> points as well, but nobody ever said it so clearly.
>>
>>>>> As per the existing design of the DMA mapping framework, the framework
>>>>> handles the system DMA architecture details and DMA master drivers
>>>>> take care of invoking the right DMA mapping operations around the DMA
>>>>> accesses. This makes sense to me, as DMA master drivers have no idea
>>>>> about the specific SoCs or buses they're plugged into, while the DMA
>>>>> mapping framework has no idea when the DMA accesses are taking place.
>>>> Yeah and exactly that's a bit problematic. In an ideal world device
>>>> drivers wouldn't see memory they can't access in the first place.
>>>>
>>>> For example what we currently do is the following:
>>>> 1. get_user_pages() grabs a reference to the pages we want to DMA to/from.
>>>> 2. DMA mapping framework is called by the driver to create an sg-table.
>>>> 3. The DMA mapping framework sees that this won't work and inserts
>>>> bounce buffers.
>>>> 4. The driver does the DMA to the bounce buffers instead.
>>>> 5. The DMA mapping framework copies the data to the real location.
>>>>
>>>> This is highly problematic since it removes the control of what happens
>>>> here. E.g. drivers can't prevent using bounce buffers when they need
>>>> coherent access for DMA-buf for example.
>>>>
>>>> What we should have instead is that bounce buffers are applied at a
>>>> higher level, for example by get_user_pages() or more general in the MM.
>>>>
>>> I tend to agree with you on this, but I see a lot of challenges that
>>> would need to be solved if we want to make it otherwise. The whole
>>> reason for transparent bouncing came from the fact that many existing
>>> subsystems didn't really care about the needs of the underlying
>>> hardware, e.g. block or network subsystems would just pass random
>>> pages to the drivers. I think the idea of DMA mapping handling this
>>> internally was to avoid implementing the bouncing here and there in
>>> each block or network driver that needs it. (Arguably, an optional
>>> helper could be provided instead for use in those subsystems...)
>> Yes, totally agree. The problem is really that we moved bunch of MM and
>> DMA functions in one API.
>>
>> The bounce buffers are something we should really have in a separate
>> component.
>>
>> Then the functionality of allocating system memory for a specific device
>> or devices should be something provided by the MM.
>>
>> And finally making this memory or any other CPU address accessible to a
>> device (IOMMU programming etc..) should then be part of an DMA API.
>>
>>>>>> In other words in a proper design the higher level would prepare the
>>>>>> memory in a way the device driver can work with it, not the other way
>>>>>> around.
>>>>>>
>>>>>> When a device driver gets memory it can't work with the correct response
>>>>>> is to throw an error and bubble that up into a layer where it can be
>>>>>> handled gracefully.
>>>>>>
>>>>>> For example instead of using bounce buffers under the hood the DMA layer
>>>>>> the MM should make sure that when you call read() with O_DIRECT that the
>>>>>> pages in question are accessible by the device.
>>>>>>
>>>>> I tend to agree with you if it's about a costly software "emulation"
>>>>> like bounce buffers, but cache maintenance is a hardware feature
>>>>> existing there by default and it's often much cheaper to operate on
>>>>> cached memory and synchronize the caches rather than have everything
>>>>> in uncached (or write-combined) memory.
>>>> Well that we should have proper cache maintenance is really not the
>>>> question. The question is where to do that?
>>>>
>>>> E.g. in the DMA-mapping framework which as far as I can see should only
>>>> take care of translating addresses.
>>> The DMA mapping framework is actually a DMA allocation and mapping
>>> framework. Generic memory allocation primitives (like alloc_pages(),
>>> kmalloc()) shouldn't be used for buffers that are expected to be
>>> passed to DMA engines - there exist DMA-aware replacements, like
>>> dma_alloc_pages(), dma_alloc_coherent(), dma_alloc_noncontiguous(),
>>> etc.
>>>
>>>> Or the higher level (get_user_pages() is just one example of that) which
>>>> says ok device X wants to access memory Y I need to make sure that
>>>> caches are flushed/invalidated.
>>> Okay, so here comes the userptr case, which I really feel like is just
>>> doomed at the very start, because it does nothing to accommodate
>>> hardware needs at allocation time and then just expects some magic to
>>> happen to make it possible for the hardware to make use of the buffer.
>>>
>>> That said, it should be still possible to handle that pretty well for
>>> hardware that allows it, i.e. without much memory access constraints.
>>> What would be still missing if we just use the existing gup() +
>>> dma_map() + dma_sync() sequence?
>> Error or rather fallback handling and *not* transparently inserting
>> bounce buffers.
>>
>> The whole implicit bounce buffers concept falls apart as soon as you
>> don't have a stream access any more.
>>
>>>>>>> It's a use-case that is working fine today with many devices (e.g. network
>>>>>>> adapters) in the ARM world, exactly because the architecture specific
>>>>>>> implementation of the DMA API inserts the cache maintenance operations
>>>>>>> on buffer ownership transfer.
>>>>>> Yeah, I'm perfectly aware of that. The problem is that exactly that
>>>>>> design totally breaks GPUs on Xen DOM0 for example.
>>>>>>
>>>>>> And Xen is just one example, I can certainly say from experience that
>>>>>> this design was a really really bad idea because it favors just one use
>>>>>> case while making other use cases practically impossible if not really
>>>>>> hard to implement.
>>>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
>>>>> problem that this introduces for it?
>>>> That's a bit longer topic. The AMD XEN devs are already working on this
>>>> as far as I know. I can ping internally how far they got with sending
>>>> the patches out to avoid this problem.
>>> Hmm, I see. It might be a good data point to understand in which
>>> direction we should be going, but I guess we can wait until they send
>>> some patches.
>> There was just recently a longer thread on the amd-gfx mailing list
>> about that. I think looking in there as well might be beneficial.
>>
>> Regards,
>> Christian.
>>
>>> Best regards,
>>> Tomasz

