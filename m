Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B0493DD1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F390310E258;
	Wed, 19 Jan 2022 15:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1149510E284
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZKxie5buYGzC2rFvEwMlp5rJg6oIFIBefKgtDY7PbPnoPiDK9NAr6pbu5Wo1ryhgDgCF8N4E+OOFtk189nvl7gtL8ZLsTMGAkQzbJHjqFOgt4OThAdnMOneaK7vz+IdbGtKaJe1LN08usLFZZEEjQ0coh98sydRnPbg4SBxIS1TVllhLBSknmcr8S9Wm3ch3Pho5zTTWYdI8WAv2oX2rHrHBIsu8+zEs9y2HcCYtqSsRJtKCfc+49pMyHgg5HvxQy/QcJ1SrU833+8QbW49c5S2/NeYELU+I4N9ko/UC/Esv8Qtux+ZJlNfRMzpNnJRUvR/vEmaa30U2avETQfg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4/YeMl2TEMpTeoo5r3iFsKRGITSfa4Dl/Y3WVvxr5o=;
 b=gGpuMZNmRuC4qBKBdX8gAijJQroU2gZGy7RVRItifwygTewaWNkTpQ9aLI331QFAhUi77LyVfH42sD6X+XAySNtQgIFd6UTfPNqES9/x6xXO/K1jSCvwgKSZnlsBhrV/gIQAoBEBmjsJWYoC4YYym2bsoz3H5tI6KUSCOX0gwkkt0XTezAg7ZW+swwvyFhn96Zc4jiuYCfSio4gKqLMYnbivnJC1NVTJOXKGRAM5F5OikDuDmlA0AfD76FHGYKfQvqlWnv8zDO9/CFZF/DAzmiZfEmIIPFfIQd9O6qfKsuL9zzaX4rhfjHAeiW0RyskuSP7TEuE1b09UEJqJcmXTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4/YeMl2TEMpTeoo5r3iFsKRGITSfa4Dl/Y3WVvxr5o=;
 b=lFSRcNDzAU/WM1JIpxTGPJmH4n+kUYYFD45mWj2jVAfAe6s5UYdkodwksbBnauuQIWrIY9PJEDl6bDUmKaSE9dXutcmAkpKZfHx7ip1vV8pxOH2VPlEW14lCarLx9FZ+67r3XhOI8x5AClzAs+ZNpHIBn3DYRdu19ClGZQCRgmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5224.namprd12.prod.outlook.com (2603:10b6:208:319::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 15:58:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2%5]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 15:58:42 +0000
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to
 a cgroup.
To: Hridya Valsaraju <hridya@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Hang Lu <hangl@codeaurora.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Chris Down
 <chris@chrisdown.name>, Vipin Sharma <vipinsh@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 cgroups@vger.kernel.org, Kenny.Ho@amd.com, daniels@collabora.com,
 kaleshsingh@google.com, tjmercier@google.com
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
 <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
 <Yeg0GGi0tdnnCLHg@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com>
Date: Wed, 19 Jan 2022 16:58:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Yeg0GGi0tdnnCLHg@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b62f1d92-664c-4e53-30ca-08d9db6490a6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5224:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5224CEA486659CD6BF31D09B83599@BL1PR12MB5224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shQLBLBhuWmduF3Qt0muQxSZh5ZyIE8ODFf4Y30CHyxtJ8Xz4WTfn7Xamgy22zfWq8g6wCp694chfJU0ycungJuf+66gGajY7UWusvIavdNUQL7sdCauel1t8/eoxmrMFAROSM2uGcN01WexIdZAkWfEzY5h3i8xrZqUlA+/wlheQn6EY0nzH1XCpB7qC+PZc9uU1LaToFxRFy5RVcVWClyh5cZfRAa00PI56ykgSdYvTQdsabDmbsbjbJNriwp8bRZ+hN1tGz2x6Ca2oHOzgiGX8w7pQ/1FNHcmjMM86EQ4VRnOAWRA34Ib8Opwg9zDv3srGySBomxprsVq73MPu01aXFWI3OdxcWlKpdxk12Y8bOnRcZ6lqFPbMI/lS+6H0yQPtj7xUCy9bf+nqFKT0PGq/IugMnan/AMHPsobZRzYDjsq6YreDsc2o9V5BOR2iMMkcrJmn2hPL5YgUaSF/OwzubVJkDElJxH526K0RWdrJFilFdWaDd/Keb07dH3udC68MoUIheEbReG+eamjOzfiwdmbDCuIgdrVeBsQPxUxggCv4bNzo1U/3T8Tll7DYkSV7AfoCMHLXtBC/GrX8vgeUQQBF8Y7coZVirs5JKqH1p2xoseUOl0e5pGGOwDfSkY76JDirNddQFlzMa8Xt7By70tt66tM+rgB53gMPX52IxGFlLhkAKGSh/DZbMAwBBvQNPDH8BUvOF+q2tziIPARIjF2crm84lMYHHNYrv9nOo5/a47/6FVd89ZkWah5YyBvHF7xR5gHMSyPpsMVMTSz4YcLklNakU/ZGUkosoWT0SrsaBYZMN2Zi4FtO7DIsLLq5l1pjUavxVIFBJUCyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7406005)(6666004)(508600001)(36756003)(6506007)(53546011)(7366002)(6512007)(8936002)(31686004)(45080400002)(31696002)(966005)(2616005)(7416002)(921005)(1191002)(8676002)(316002)(6486002)(86362001)(186003)(66574015)(5660300002)(66946007)(2906002)(110136005)(66476007)(66556008)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3R3UTI4RGpJTjlEWTYrNzNMdDNJVkdWQnFEc2NITWFVQkN1bDlocmhzT0hh?=
 =?utf-8?B?WjB4akJ2cjNPVml5QnNHRUs2QlNMTldndjlFR2ZwOHpwMCtxdzlOc1JjWjdP?=
 =?utf-8?B?dU9wYUlTVEVtUnk3VW4yOWx4ZXpUSGVBT2o2ZFEzb3pCZTJWdGpNdFFDdmRi?=
 =?utf-8?B?WldHOGd3K2xZeXdVSjEzVVR2ZUxwVGdJSHVKYVc5SnlkaU82NDNzODlQYk5C?=
 =?utf-8?B?dDNMZGJTS2NTWVBnWW9CeVNDTGU2anVjU2lOT2E5c3BzUktBbDVGVXJ6aUlD?=
 =?utf-8?B?eTNWRlZJNU5FUWlET3FZUjRaRTRxdWJ4cE0wRFlJNFFGMXJGQjlVWHkxckhr?=
 =?utf-8?B?cnBvKy9TQ21lbUxCdHpQMm9SOUcxWVRwUzl5TmphUEEwRkxJR2JGQzJmdFNo?=
 =?utf-8?B?UzkzR0dmbnlaVnkrZlY3QXVOUjlDcVl5cXMvbVlHV1FUdjNML0o2ODhBNHFi?=
 =?utf-8?B?QnE0d0V1dXBidkFlZjlvV1ZWa3FQVXllSVFOY2k0Q3IwdUI5ejRwWWh5Rzh6?=
 =?utf-8?B?OEhKRVhuZGYvd2JVVitLYXhWUXF6d2JBaWcyTWpnQ3lQclNENk53Zk5CNnpJ?=
 =?utf-8?B?elRMa0J0YWdPU0F3SklYK21yS0NDN1N2K2V6UGhMaitHcjAwVUo2RHhvK3lh?=
 =?utf-8?B?aURPZG5Ta2JCc2FSMGJQeWpBSGI2L0w4ZGdPODdTTlNmcFJhM0VUemFRQlp4?=
 =?utf-8?B?MHRlQmkwMVFBZVpqYUdsZjBoblBNQ0N1VlU0RktzRW1OWGVFZ1dndTNDUm5v?=
 =?utf-8?B?SVpHUmoza1UwR3lwTjNsTlloVkNVVmxCU1RjYTF5WlVlamFlYUNDWUpScjVO?=
 =?utf-8?B?QSt6MDBBNVFpVDlIN0VBWnMyRW9wU2pOd3RUbUk5blhIemhBcmtrVGtpcU11?=
 =?utf-8?B?V3JIbWVoWlYrenZGcWJ0SVZ2b0pFeWRUUUdWbm40aEhlV3hyNi9jNFlJSTVi?=
 =?utf-8?B?Q1ZyVStUR0l1QmpiYXZFS1drZ3RRamNwSjltTlBNUTR0QXpZM0FYcmt4RGQv?=
 =?utf-8?B?b2ZiOGVIUVkwZ1I0bDVYbmt0ZWtjaCtoQzVQbW5LNXhTSmZ1YkxLczY5Zm5D?=
 =?utf-8?B?cVd1Z3RsaHZhR3dXQ3VJVXRtdG4xcmgyb1dJYVN6Y1FrNXdlYTJRY3VMTTBz?=
 =?utf-8?B?ZW1nUHZGSmxablRzOUlRWjRyeFQ5Y1IyK0oza3owOVBNSzB2bFMwRS9BaGtB?=
 =?utf-8?B?NVhFSXBnVG1nZzJFMGJCTWx3NEJlR1h5anFBbDJubk5sc1VKTzUvQkxPWnlK?=
 =?utf-8?B?Y0Q3VGI1cWhyVnNXdEFtQUJiZnJ1WFNwM3RCY3JVS3RUYmxSRndITTJvNVJv?=
 =?utf-8?B?TDRKM2NFSGYzaWE4a0cyVnRJL0JtN0svaVoyNXEzVnp3UVZzeW4rc0d0d3FO?=
 =?utf-8?B?aUsxajFRMzZua0VnVGRFWHROQWNhL1c2TmVnZVhPMjJnVjZ0S01JUE55RGkr?=
 =?utf-8?B?amxEazFjSkJnWndiL2dRWTlHOUpYaDZlSFpKZE00bzBDRmMraGg3a04xQ044?=
 =?utf-8?B?NVkxTWRtaUNnVEZ5bjNKblF0TS9hR09XeGdGMnRtazJKaEJtK0lqRDc4bkg2?=
 =?utf-8?B?WGtJcDZPMWNCNVRvalU5Wm5uSytxZlFvY0RjTEU4OXNxbU03WlNMNEExR2FP?=
 =?utf-8?B?eHhmaDBFSTd4WldQM0VtOHE0cWpSbFVxVlNzeitQRVlzbjAweEkyWXMvTEdP?=
 =?utf-8?B?aHZIdjhlU3MyVGt6SnhsUmlndWQvTVhQY3pkRTlYem0vekF5bkFhdUYrcDZH?=
 =?utf-8?B?WVVXMDRhZEp2ZFEyWHZsVWsyZnBIak9idW1pampsMFh6TExSZHRhRWt3K0x5?=
 =?utf-8?B?SzRWaE9rbkd3eTYveCtKWDJielU3WEpzanA1cUVVT2lSWStSbU9RelZDc1o1?=
 =?utf-8?B?QnVHQ25XWllUMjVmNXR0TkNOK1NFdU9TUHVOTjZFdW9oQ0lGRXUrZ1FyMHRl?=
 =?utf-8?B?aE5OWThobUVISmVPN29EN2VhSVJHcGQ5ZmIxakNHZkFWZWdqSlVEektyWGhk?=
 =?utf-8?B?RWoyOEIrUjBQaTJmUkdrNnc5WkNRdWpZeEtKZi83Zk5QN0JWSWdBQ3lsdWlB?=
 =?utf-8?B?Z2hOT1Y1SjIzRWN6VHZ1dzhVRlhHL0NCZXRkTVJuSGtJd2V3TkdVM24raW5S?=
 =?utf-8?B?bzRzZlIwVmQrRnJjNVgwMnZoSVMxRTdhTlowbVgxb2lFOG56Mkl2MnpSZ0l3?=
 =?utf-8?Q?ZZHjFSh5giqzajgX7F93Jks=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62f1d92-664c-4e53-30ca-08d9db6490a6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 15:58:42.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+g1CnHcA7nE6SJcY09D4acmY1WsQB+p4AlprQRKIGPz551IBEhNvZNs9vVPoe1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5224
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

Am 19.01.22 um 16:54 schrieb Daniel Vetter:
> On Tue, Jan 18, 2022 at 10:54:16AM -0800, Hridya Valsaraju wrote:
>> On Sun, Jan 16, 2022 at 11:46 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
>>>> The optional exporter op provides a way for processes to transfer
>>>> charge of a buffer to a different process. This is essential for the
>>>> cases where a central allocator process does allocations for various
>>>> subsystems, hands over the fd to the client who
>>>> requested the memory and drops all references to the allocated memory.
>>>>
>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>>> ---
>>>>    include/linux/dma-buf.h | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>> index 7ab50076e7a6..d5e52f81cc6f 100644
>>>> --- a/include/linux/dma-buf.h
>>>> +++ b/include/linux/dma-buf.h
>>>> @@ -13,6 +13,7 @@
>>>>    #ifndef __DMA_BUF_H__
>>>>    #define __DMA_BUF_H__
>>>>
>>>> +#include <linux/cgroup_gpu.h>
>>>>    #include <linux/dma-buf-map.h>
>>>>    #include <linux/file.h>
>>>>    #include <linux/err.h>
>>>> @@ -285,6 +286,23 @@ struct dma_buf_ops {
>>>>
>>>>        int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>>        void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>> +
>>>> +     /**
>>>> +      * @charge_to_cgroup:
>>>> +      *
>>>> +      * This is called by an exporter to charge a buffer to the specified
>>>> +      * cgroup.
>>> Well that sentence makes absolutely no sense at all.
>>>
>>> The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
>>> behalves of the importer and never by the exporter itself.
>>>
>>> I hope that this is just a documentation mixup.
>> Thank you for taking a look Christian!
>>
>> Yes, that was poor wording, sorry about that. It should instead say
>> that the op would be called by the process the buffer is currently
>> charged to in order to transfer the buffer's charge to a different
>> cgroup. This is helpful in the case where a process acts as an
>> allocator for multiple client processes and we would like the
>> allocated buffers to be charged to the clients who requested their
>> allocation(instead of the allocating process as is the default
>> behavior). In Android, the graphics allocator HAL process[1] does
>> most of the graphics allocations on behalf of various clients. After
>> allocation, the HAL process passes the fd to the client over binder
>> IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
>> uncharge the buffer from the HAL process and charge it to the client
>> process instead.
>>
>> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsource.android.com%2Fdevices%2Fgraphics%2Farch-bq-gralloc&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C838d25da974d4ea4257508d9db63eb70%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782044488604857%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Qn7JeyF5Rq9tnrGw1KgNuQkpu5RbcrvPhDOa1OBJ6TU%3D&amp;reserved=0
> For that use-case, do we really need to have the vfunc abstraction and
> force all exporters to do something reasonable with it?

I was about to write up a similar answer, but more from the technical side.

Why in the world should that be done on the DMA-buf object as a 
communication function between importer and exporter?

That design makes absolutely no sense at all to me.

Regards,
Christian.

>
> I think just storing the cgrpus gpu memory bucket this is charged against
> and doing this in a generic way would be a lot better.
>
> That way we can also easily add other neat features in the future, like
> e.g. ttm could take care of charge-assignement automatically maybe, or we
> could print the current cgroups charge relationship in the sysfs info
> file. Or anything else really.
>
> I do feel that in general for gpu memory cgroups to be useful, we should
> really have memory pools as a fairly strong concept. Otherwise every
> driver/allocator/thing is going to come up with their own, and very likely
> incompatible interpretation. And we end up with a supposed generic cgroups
> interface which cannot actually be used in a driver/vendor agnostic way at
> all.
> -Daniel
>
>> Regards,
>> Hridya
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>>    The caller must hold a reference to @gpucg obtained via
>>>> +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it is
>>>> +      * currently charged to before being charged to @gpucg. The caller must
>>>> +      * belong to the cgroup the buffer is currently charged to.
>>>> +      *
>>>> +      * This callback is optional.
>>>> +      *
>>>> +      * Returns:
>>>> +      *
>>>> +      * 0 on success or negative error code on failure.
>>>> +      */
>>>> +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpucg);
>>>>    };
>>>>
>>>>    /**

