Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523CE6FC90B
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532AC10E13B;
	Tue,  9 May 2023 14:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1C10E13B;
 Tue,  9 May 2023 14:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8KIjy3+nn+1PwtDlfQUkET9/lxTDe6Wk4m036w91a4oR2g0eiNxSAljsxoJlkChb5zVwemrcD9RAGFJTYxdCvYq3MJN+AgDsMd80WVJXHBWvCa8HFQ2n6c1B/6WPCM8F1qQ5etlhYDtBgUUVdSPeTrOBQ9J47OwQFQhJ4FuTNKJlFTX8+frtmIIH1VyMwZKuh6nSU1w8ZmKj7Y9QCu0DqozX3/ngTL1N62rx8bAB41aE2DWtpjypX86MZkCvao/geIIwm/wSzxCLC+QSxC+5qpW5V1os8+Xm5ekrry0/DGjVqyQZdHPLOlDSk9SKmy+1JZj30u1nFp0xxObPsGD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3Aw1PwAjtAeIseHOVcKB1AT3sAcQTZmMj8qnyAzbPI=;
 b=nXsMEga7cVoSO4TAd9jxbJjnV5m4nb9pWuiW6XmUNJ0DjBaADPNeyNVKgNe57Q4Xutz0GYUolpdCeEcoAdhVXmMQRkT09unRCJdVZXyy2+rIvZOJCCm2+58TcDMTGASgiB9I5nOFA1XqAobr6GPzjUsrQM5VCf/562oDAJIs5y3032+W+ghvIZEhUua7MmeOlrjKSTU4Z3UJU4VavVKYpt3AGEk1IrwDvKlQUGalmwBZTpyzETtbpgjFN0+VTviujMGc2dNMcprwFnLVv4smvCOkeB4bQE61UWBHS3FZ2kNkyHkqg9i6VaHKmWx+N/OU1Y0na3hxCJd4t5/MHF1ezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3Aw1PwAjtAeIseHOVcKB1AT3sAcQTZmMj8qnyAzbPI=;
 b=nIiKLh593sHjsY7BRPg8cn1F8H5Kq+xo5pBdPQ2x14QaI2XcRR8bgGrwAXW4v30FfWmXROn6GSx9WBAosumsozIOFVHSKsuSW+TifQMNAreyRIoLE0zgeRg5KxkI890lIg6oCn1ZG9LnZYaOacaLiMfrMN9mFb2Z33Qa8+bzExE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 14:31:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 14:31:30 +0000
Message-ID: <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
Date: Tue, 9 May 2023 10:31:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c1c7e6-4177-4158-7934-08db509a1461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zqzW5zACXwzVF7zrRV9hkKJK3mLFyG2B5jbX+gaaI5bg62F5OKUSL/3l/AWq5wax+I+f5qAPtLRcQ994zopHK6nufWFZvZ1CY+EmXoIwuCyGtP8Cl6s0q7fBUzqKJwMUz8NGKQQU5JgPF5qMntHXqM9gkyDpgUPHb/YLz6UjOxbIpks7NA5vXzHrh8ePgrLs6TJoqlSUTecmTR3xAsY+g7xl5gGilXs09EsRS81X5/Wy8BFdawJv7InWNQbVZho8dCKKUSzf8nmHwRlmv4uP0hmM5SCchjooU5ZN0Aly1dCJqDmc34Vw2aDRJXEFtGa74WN4a+V/CzbdimF5GXxRDIApYc2Sq1NepB/YxaD2eWboBzpVWK5k4vxO9fnOiLVODeHndwr5VgMdp5NE0HneiDFHMf0IgX31QRU25ogGVAcNvJMwbV8Yp5K5rJLi6ldIljozv46EBQ2SMXzRmT7n6H2X08+PZEgqWvX88pHJMUuuAKUU1beCan7wL+57KHPr8Q+BS2iXXgb1MQ3tHWrMRACY822pyVv2LNO+Cv4FbFsDmSTQhIutQIA9rTcfx8Ls2tnJWHGrhl5ntnuzHMjOe8Y9SA6dkzF+alQFn8Pp5nUifawHPn9Z7ytm+iVIpVm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(2616005)(83380400001)(2906002)(53546011)(6512007)(186003)(6666004)(6506007)(4326008)(66946007)(66556008)(66476007)(41300700001)(316002)(54906003)(110136005)(478600001)(5660300002)(44832011)(26005)(7416002)(6486002)(8936002)(8676002)(966005)(38100700002)(86362001)(31696002)(36756003)(31686004)(66899021)(15398625002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzFKNFRhR0NFNmp0NFUyUzdPUUFkc2NwelhuNXkrSzhydFE3cXRzY3hmV0xK?=
 =?utf-8?B?N2RRMmhRTUpoWmNBUGRiSzQwREhTWVpYQStZcGVCeXNzQ0RQOWJTNysrRys1?=
 =?utf-8?B?TS9lMnFaTmthSlg3NEFFZUwvWDRTUmd3NS9STk9YOW8rSUREeDFhZHdJaVpT?=
 =?utf-8?B?YTYxelMzV3EwTHlCeFA2SkJFNzVmdGFab081a1RjL0wrcEFzc0UxZmlKVUs0?=
 =?utf-8?B?ckdvUDZKMnpWaWg3dE9NOVVlUHZMK0FOUUdaNGJ3RU80VVRVMytWQWNFV2lu?=
 =?utf-8?B?NkNUbEhRSWkrb1hlaXNuWEpoa2VWaTZUYnRTdTY2VzdQSmZZY1UwQmFDVTQ2?=
 =?utf-8?B?aG00anNwZk4zKytQei82d21abjJjM29Ia25HaVRQdGZZNUNTelZUeXIzQ29a?=
 =?utf-8?B?QlphcGY4UDhITFVZVW1OTVZMSkJtRVV1ZWpiMEJqUHh4NE9JMzZsUlFIcVYw?=
 =?utf-8?B?OUNjdk9rd3lMaHZUR3YwOTJZYXVMUEFPTkwvWDM0RCs3RzFQeHNSaDk1RGts?=
 =?utf-8?B?Z3lTdUlWbU4yUSt2RzJIamd2RnpDWTZDUm9qazQycjNhZldJeHp0Vm44WkI5?=
 =?utf-8?B?aFdBVVk0OTJoNlNUbWs5SXdEVHlYaFJ0RUx1dlR1cnZKRkV4ZE9lMC9Gcm04?=
 =?utf-8?B?L3U0YTdndENIZWdGT2Vyd0VxT2NTMzBPUzJ1T2FNbnBOU01SQnEzdmcvaTIv?=
 =?utf-8?B?b002aVhUNlZMUXZTNDVSWVhGcVRTeDVqdktaMUttU1lhc2ZhdUJ3cXdTR2E1?=
 =?utf-8?B?SS9nMzdTY25zcGlGVnRma05kNEdJWnJCNkQzUVhHNGZSWHBFNGpQUjg1OE54?=
 =?utf-8?B?Q09DTk9NN2VVMDVYcGJkRG1Pck51UW1QZHBEbDd5SEw0L2lBTk1yV1dhbUlQ?=
 =?utf-8?B?aVl0dFVSNlQ2eU4zOWNwWkN6cGtrV2QvSmIyc3pwQTBTQVp5SjB2MXMxR0My?=
 =?utf-8?B?VEZpYTRxd1p3NndIMUZGUFg2OThCWWhJcVQyRFZhNVVjMnMwa0QrVFh2WFhU?=
 =?utf-8?B?Yk0zdzI0TzkxWU56eEpVeENmUTlyMllBb1g4NmJJbkJyZWx3c1NEbjN1cVl3?=
 =?utf-8?B?Q3hPVzZRZVVLT0s4dVNOZHNWVDR1QUpVMDgzZFJ6L2lhb1lFYVU0cC9SUVdF?=
 =?utf-8?B?WFV0T0xudSsrWG9qaEV0Z0pCaFMxYTcxK1hhTEhpNmpiK0JRQy9VZTM3WWFJ?=
 =?utf-8?B?WUJvMm41cG5VaTY3R1ZNdTJ1Um42WmVnKzBBem1yTjhWNVpaQVhGT0gwYU8w?=
 =?utf-8?B?YkRoQUVwemlILzJSa1h6d0ZWQzMyV1I0M3ZpRXIyRmpWU2E4WG5MS0RSOU1k?=
 =?utf-8?B?ZGFwaUp3bVR2b3R4NjlOeXZEaE55MWcyeG9wUEkvZ0lHNjVJN2J4NWlMV1Y4?=
 =?utf-8?B?bUpvaTkwcVdSdmhTbGNOZzlLNER6ZjNONmNIbnV6alFHeWE5WndiSjNnOUNX?=
 =?utf-8?B?d3IyZmVxSm16UTQ0RXo2ZnBVdEkxWnY2OC9oNVBibEZRSEdoczkrNGlzeGpm?=
 =?utf-8?B?aTFIdyt0T29Ia2dTdkdoc3R0VEp1Ry9JRnB2bXB6WjIyWWRCVkIwdDhKNHhh?=
 =?utf-8?B?WDFXb3BOdU0yWEhKSDlyVVNZVFlWSytTSWIxM01vem1TYkFaWmdDWWErcmM4?=
 =?utf-8?B?QzJZeEVFRGk2S25VQnFzUGlrWmRoM2ZHbmtHWGszQ3gyQWJDWXhTd3JwYnpW?=
 =?utf-8?B?UUFEOEh6SHBiZnplVnhJb3dHRTN5aGFNNXpuQ0x6VGZFOURLaGNoWVc2TUZX?=
 =?utf-8?B?cythU1hVUFN2TmRoMXlHZE0wcjB1TmVNQmdXSVNySEtCdjBQaUlSakVKNHVD?=
 =?utf-8?B?cmNmYW5wR0M5VWQ4eU1FMmIxc3NxQ1FqQ2ZBR3NvRWFnK09ERTN3QXd1NTJp?=
 =?utf-8?B?QUxlSkxDQXJ6dGRybFJxUEpjY3hSaDE2Sm8rSnVROFJCTFBnSytwRW1uaVpP?=
 =?utf-8?B?VGFTR3RtYUJiMXJUOXhhbVUxSCtZbVdwQ0R2YU5zQTYzY2VwUGo1Y0huWElj?=
 =?utf-8?B?dWQxNVQ1c1o3cGp0WktEbUZtNVJqT25LMGxhcmJOblVvUU9DWnNIbmJtWHYv?=
 =?utf-8?B?ZCt2d2dxTmRORjd0ZDhjRzFvU2MvdDdjRWhYQlAvWGhidGRQNVoremxQUlFh?=
 =?utf-8?Q?zkkpFvbBQQJHUQ8LbD4HFT0zJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c1c7e6-4177-4158-7934-08db509a1461
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:31:30.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRQkWXpADA8nh+CikM8xVSiQnieAjr7sq4WqwJVpKeibDjOS46x/YFOkkxpA4I/fw2N45qG3JPIM7MonSXabxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/23 19:14, Dave Airlie wrote:
> On Sat, 6 May 2023 at 08:21, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>
>> On Fri, May 5, 2023 at 10:40 PM Dave Airlie <airlied@gmail.com> wrote:
>>>
>>> On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> The goal of this RFC is to expose a generic KMS uAPI to configure the color
>>>> pipeline before blending, ie. after a pixel is tapped from a plane's
>>>> framebuffer and before it's blended with other planes. With this new uAPI we
>>>> aim to reduce the battery life impact of color management and HDR on mobile
>>>> devices, to improve performance and to decrease latency by skipping
>>>> composition on the 3D engine. This proposal is the result of discussions at
>>>> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
>>>> familiar with the AMD, Intel and NVIDIA hardware have participated in the
>>>> discussion.
>>>>
>>>> This proposal takes a prescriptive approach instead of a descriptive approach.
>>>> Drivers describe the available hardware blocks in terms of low-level
>>>> mathematical operations, then user-space configures each block. We decided
>>>> against a descriptive approach where user-space would provide a high-level
>>>> description of the colorspace and other parameters: we want to give more
>>>> control and flexibility to user-space, e.g. to be able to replicate exactly the
>>>> color pipeline with shaders and switch between shaders and KMS pipelines
>>>> seamlessly, and to avoid forcing user-space into a particular color management
>>>> policy.
>>>
>>> I'm not 100% sold on the prescriptive here, let's see if someone can
>>> get me over the line with some questions later.
>>>
>>> My feeling is color pipeline hw is not a done deal, and that hw
>>> vendors will be revising/evolving/churning the hw blocks for a while
>>> longer, as there is no real standards in the area to aim for, all the
>>> vendors are mostly just doing whatever gets Windows over the line and
>>> keeps hw engineers happy. So I have some concerns here around forwards
>>> compatibility and hence the API design.
>>>
>>> I guess my main concern is if you expose a bunch of hw blocks and
>>> someone comes up with a novel new thing, will all existing userspace
>>> work, without falling back to shaders?
>>> Do we have minimum guarantees on what hardware blocks have to be
>>> exposed to build a useable pipeline?
>>> If a hardware block goes away in a new silicon revision, do I have to
>>> rewrite my compositor? or will it be expected that the kernel will
>>> emulate the old pipelines on top of whatever new fancy thing exists.
>>
>> I think there are two answers to those questions.
> 
> These aren't selling me much better :-)
>>
>> The first one is that right now KMS already doesn't guarantee that
>> every property is supported on all hardware. The guarantee we have is
>> that properties that are supported on a piece of hardware on a
>> specific kernel will be supported on the same hardware on later
>> kernels. The color pipeline is no different here. For a specific piece
>> of hardware a newer kernel might only change the pipelines in a
>> backwards compatible way and add new pipelines.
>>
>> So to answer your question: if some hardware with a novel pipeline
>> will show up it might not be supported and that's fine. We already
>> have cases where some hardware does not support the gamma lut property
>> but only the CSC property and that breaks night light because we never
>> bothered to write a shader fallback. KMS provides ways to offload work
>> but a generic user space always has to provide a fallback and this
>> doesn't change. Hardware specific user space on the other hand will
>> keep working with the forward compatibility guarantees we want to
>> provide.
> 
> In my mind we've screwed up already, isn't a case to be made for
> continue down the same path.
> 
> The kernel is meant to be a hardware abstraction layer, not just a
> hardware exposure layer. The kernel shouldn't set policy and there are
> cases where it can't act as an abstraction layer (like where you need
> a compiler), but I'm not sold that this case is one of those yet. I'm
> open to being educated here on why it would be.
> 

Thanks for raising these points. When I started out looking at color
management I favored the descriptive model. Most other HW vendors
I've talked to also tell me that they think about descriptive APIs
since that allows HW vendors to map that to whatever their HW supports.

Sebastian, Pekka, and others managed to change my mind about this
but I still keep having difficult questions within AMD.

Sebastian, Pekka, and Jonas have already done a good job to describe
our reasoning behind the prescriptive model. It might be helpful to
see how different the results of different tone-mapping operators
can look:

http://helgeseetzen.com/wp-content/uploads/2017/06/HS1.pdf

According to my understanding all other platforms that have HDR now
have a single compositor. At least that's true for Windows. This allows
driver developers to tune their tone-mapping algorithm to match the
algorithm used by the compositor when offloading plane composition.

This is not true on Linux, where we have a myriad of compositors for
good reasons, many of which have a different view of how they want color
management to look like. Even if we would come up with an API that lets
compositors define their input, output, scaling, and blending space in
detail it would still not be feasible to describe the minutia of
the tone-mapping algorithms, hence leading to differences in output
when KMS color management is used.

I am debating whether we need to be serious about a userspace library
(or maybe a user-mode driver) to provide an abstraction from the
descriptive to the prescriptive model. HW vendors need a way to provide
timely support for new HW generations without requiring updates to a
large number of compositors.

Harry

>>
>> The second answer is that we want to provide a user space library
>> which takes a description of a color pipeline and tries to map that to
>> the available KMS color pipelines. If there is a novel color
>> operation, adding support in this library would then make it possible
>> to offload compatible color pipelines on this new hardware for all
>> consumers of the library. Obviously there is no guarantee that
>> whatever color pipeline compositors come up with can actually be
>> realized on specific hardware but that's just an inherent hardware
>> issue.
>>
> 
> Why does this library need to be in userspace though? If there's a
> library making device dependent decisions, why can't we just make
> those device dependent decisions in the kernel?
> 
> This feels like we are trying to go down the Android HWC road, but we
> aren't in that business.
> 
> My thoughts would be userspace has to have some way to describe what
> it wants anyways, otherwise it does sound like I need to update
> mutter, kwin, surfaceflinger, chromeos, gamescope, every time a new HW
> device comes out that operates slightly different to previously
> generations. This isn't the kernel doing hw abstraction at all, it's
> the kernel just opting out of designing interfaces and it isn't
> something I'm sold on.
> 
> Dave.

