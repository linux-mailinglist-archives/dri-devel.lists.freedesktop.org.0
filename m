Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C7640959
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 16:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB8710E6FD;
	Fri,  2 Dec 2022 15:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3ED10E6FC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 15:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2hTy2vUfBVq8O9mp06DG9qtNIhhMIjzqxF0thLZJNbzWQv+YSN9rCaszmH8tkwNFjBs/q6LmsZAUXfPHG9VTueL7g3J8Zh9GfqroAqJEdGKG/50bj8owgMI0ObcY/tB/BcD+slnAty+KwLxe61KLyCxRERqhbYWKCzUDoojsTDpda230wE/K6docQXgYczFSNKjX5haIVF5Ur9vWowPX8xcs0VwanlEO+2QFPy49bQ6ORPRusNF06MQMS/hKm0YmyPZ8xkGZRaSFh4+5/rToQi7bFy++HfbI758TdP0KEzMKDRo4LJANxzBA1RHSSDgL16ayS3Y1Qcw0oXI0w1atw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6/T41cufqScErBNRsJJ522pVjWCwKnJqFN7ZXboSpw=;
 b=P9j55mhdx4u86RifeJtC0lWV4u9YtJjp22z8W2+CA2jFD0sUwOOoQ0EfZpDvF6N8qKGTqSnY8S5lkHMtzUAsqjb4ePLXgkgUX0xkVrO4GSH25rsO5dDGeEGJ9ZPf9GYNH6qQUSytHkrLiOPkjMxIsIAUDA+4/qionzD2QPV01rzlWvdmj9fieQo2vKpg2kBIz2v99TzWIh6ozA3Xpd3Hna9oJbWN86fKcU173OZXuJh0T5nQiiwzrvM9NVmP8g0ToxHYVKxqdkOFFlbZCuCb970FtEiu/QNil2pjc/r2WJn98Og5feLPKpymoY/huLSruo7TngQB2hDZnBTs4emasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6/T41cufqScErBNRsJJ522pVjWCwKnJqFN7ZXboSpw=;
 b=IgpXW59d52PyPr5/p0fsJ7XtuQsS4UfVHglm0EcqPlyszHsfE3S50s4bS/hyWLpgsLLwgAro6KQAe/ekOg61piZ8DcfcHt7WY/l5Oehjm//qGJ3T9p3wbp6SnKYw/qqzrq2tj4mrNz7WgNuIc0VtrLq9bQGFUfGArtjWeiL6ujQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 15:27:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 15:27:13 +0000
Message-ID: <24b660e2-ea38-7038-c182-156e1371fdcb@amd.com>
Date: Fri, 2 Dec 2022 16:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Nicolas Dufresne <nicolas@ndufresne.ca>
References: <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell> <Y35LcspZ385IC4lJ@phenom.ffwll.local>
 <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
 <Y4cw36MUO+ftP468@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y4cw36MUO+ftP468@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: dbeb40b7-f000-4788-7bbc-08dad479afea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7F3iFuf4ct+id2++ncHgb0O0205V20FDNdmm01ePVusHpOk3beZN0eXRja6g4WMc3Yo/qsgk5NSftBRQ8Mcf9pGrrY/RGFJ82RzEKiV7gENpDnHSovUrsRjuMSbMJLdT600Lv0rP4m+Qu8Ok2gamwPHD/5W6P4Y+pX5OJMMwYFaJ1yKNeN/bMaJPJY3Az05BrYmsV/eQczhzJQsnO/qE1w2NonmhTHToOjncHIlL6ow1S3Jz0+GyVWw3jzSWJIP+nWmHrRJqaxddENfa1ry0Jv1RMkpQcPHqrZQA/8b6MCe0iqhOuNCuWzYu5PNrBeVzO0X38OP1cDjJl+wV+4FZkUWTNra3x8/Oz+x8ANmWPWbXLhyPUNp0gqHuz5exHdgu4ENcuQ3JlyN6mQ9oJ+H2HxRBqiQmZwDMXlexsQJ5NPkpcEeOBtv0ZSzn+Uqzq2VeljnTWhGNEUiNZiTu0IWbw/D9zZ2PewJImyTnQxhfHAtxtVuk0Pno8/xfnlg78fbhTXtz3kRAQXVptmsjvPFlOtUYEWjuCc63xzITOv11RDIsHCfNcaqxiaPXVTB+BcKrzHWI4yGoEuvO7P6UGKFDo5QXF6dsdqsB3RkrEsbZUGImUbLpS0pBHjk4LPxJZnvrfWaz6y/l5mF5izLfS1NXG1KUM/qrEy6I0nRX1xe4vJxi6Uleh6gMuE0j1MuQn2Nzke154w+ilBUEcOQjbAqmgou1Pa7ajuGk8oP86sOMmdFARYADzUfqjdSmI2EMnBkm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(316002)(966005)(6666004)(6486002)(478600001)(5660300002)(7416002)(36756003)(45080400002)(8936002)(2906002)(6512007)(38100700002)(6506007)(66574015)(2616005)(186003)(54906003)(110136005)(31696002)(31686004)(4326008)(8676002)(41300700001)(86362001)(66556008)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEgrWkNrQzFMS2ZySWpiU2wxWWQyL1hhU1JiY0FvS2NLUGpOWmpKZDlyR2o3?=
 =?utf-8?B?d21INVRNWWJhL3Z3ZW9mSXZoM014ek5RWlV2S1V5dXQ1Ym9PeFlEOFdRT3dx?=
 =?utf-8?B?QjJvOFNGdkhYUktqN1Z3S05Ick8xRjlTZ0tkZ2Vrc3BtOWJLVENkTGhwS3Ew?=
 =?utf-8?B?d2RWUSs1ODcxMXlJeEE1dVVuTjNCK0J5bzY5b0tCTmNpblRURUlTNHRWUzhm?=
 =?utf-8?B?NG5MMFlsNmM0bk0xMDJKbjNrWThIOTY4UzNJdHlGeFhEeVNGSUIrUTdBNUdZ?=
 =?utf-8?B?aEs1SGw4SCtXWW82N2R1Mkp2ZTRTME1QU2dRdjF0S2QycEJhZTNZbmRjcFlx?=
 =?utf-8?B?dXJ3VXlGZitsTzVXYyt6MFlZZmN2QTRwMkQwWCtFT2p3MVV3YXZVcG5LVzF3?=
 =?utf-8?B?bmFDTm9FY2Fka0g5aG84RFJyNzlIckdXc240czJMK2JWcThLVm5mTWU3WnRq?=
 =?utf-8?B?VkZpQTQxd0wxaWRSRGx0NEVQcGR2OFRSSWFlVXY0ZVFqbkdFY3R2N1gyd1hR?=
 =?utf-8?B?dElvdzBodjFtTkZmQ0dQeEFjWnF3c0kydnYxWEM0am9QSTh1MW5TTVQ0NzlP?=
 =?utf-8?B?UzlHc0hqMmxxNGsycTlqUVhieVJrUk9QZ1RyamJIN3lkS3lINjNVejY2OWtB?=
 =?utf-8?B?eU9Ga1JObHBWbXJnUkJET2NoMVovYkRlbTV3ZWtJaTdNa3B6a2o5RHFvd1lj?=
 =?utf-8?B?RFd3eEQ5VWwvUU1GamE1bG5tSzJXYVpnZFA3clFUdjg4RHBvN1pMdHFSaU5Q?=
 =?utf-8?B?dHJOL1JRT2hJM2dNL3dmZkhNcUQwVnpVenpVRGdScnFiNEVKSkE5WDR2VWRD?=
 =?utf-8?B?cEt2TWloRWFqMDNXNmI1MWsvL0xadUtzSExhd0xWTm02aTlTYVUxZlZQMHFp?=
 =?utf-8?B?RjdWUTFVbWZRcVZrYS9SWGQyejByYWFabGNJbHRYclFJbUplcTVDRVJwQXZK?=
 =?utf-8?B?UDBoMFpDR0RXek43aFc5YVBkRVZLZUFvMkI0SkdwY1B3alRWY2lvTlV3VVRS?=
 =?utf-8?B?YVZybUdSRXZhdlZ4bzlneHAzYkxMZ3IyTkUxYVJPc2pZcEpod2lRQVQyN0Jr?=
 =?utf-8?B?TTlQZjFTWGdYUTBSOHY2M3RuZUl2dENDOHBySkRJUFA1ZUdHeW1UaW5TbEtx?=
 =?utf-8?B?WlBtSmQ3TmFzQ1pLL096dEtvY2dFYVBKUzdyWHRjOFdvNThxUW1tbFdJeHFq?=
 =?utf-8?B?a1NjT2NZbWUvOEdGM2M1YnA4TTQ0cENSOWJpalIvLy9GOWdnT1lxTFVMS25I?=
 =?utf-8?B?OWxmODJTZGdFaEcvblBiZFZMaFlUMEtTTTBaM20yRjVuZEVrUTZ2UGtGMmtY?=
 =?utf-8?B?RTJpSU9ibm9FNkdrb1lMY2lvellxK0ZKb0pJTHFPMjhLdTVJSWZtY3JqUVN4?=
 =?utf-8?B?MnFVWTJhNmpJdC9wYmdJbGhrV0hsaHdmTzZkNkZQWG5LeDU5aUhqaTZQV1VE?=
 =?utf-8?B?T0JHWjZST3g4Zng3MzIrQ29yVVBjSXcxOVh4QkM5R0cxcTBaZi8rT3JxaXhm?=
 =?utf-8?B?TUlnalZCaFZmQnZzVmNFeWw2ZEErUGtTaHNMYVVoQlREdmxWb1BRNi9MRldR?=
 =?utf-8?B?RzdOU1dIb3drNnRObFBUZXNWbFRUQU56K0lUVUlxaFZMUVhhK203SDJUN3JL?=
 =?utf-8?B?NSs3Vjcza1B5a2xOVnpreWZBSE9rTkR1WlJUT3hBQm42bWhPWEFHSHFEelVo?=
 =?utf-8?B?b0NXcGpTckRsOEluSnJDbldoR0FSMFV3aVFXVnpNSUl6ZXNPNjNYSGNIODZ0?=
 =?utf-8?B?bXFQdjl4SWI0K1VwSEd4YWc3ektWVWhpY3RmTlpIOFMyUXNFMVVlbTJLdk03?=
 =?utf-8?B?cFVSZ2R2clhwTGNBTU1RQmFYU2wxQ2JuMXpoL3d4K1YxUVNEUjdwTG9lSzIx?=
 =?utf-8?B?TGZNQjNsYXVwMTJadENmUHVQZGQzWUh3YTF3eXJxRzVzM2JiWWlCYmtGclhx?=
 =?utf-8?B?ZnhKKzdrcDRUZC9DYjhJVm1VV3hSU0E5U3UzMllYZUViNGRBaks1NUF3d2Rh?=
 =?utf-8?B?K1NrUitON29HS0pJT3JWV2hsalk0VVRla3FybVF1ZEVZZlB6U01PYkZJSEk4?=
 =?utf-8?B?bDFjTWxqRUw0blIzK2ZQR0dnaU9pdldFcFhVWXV2SXFKZmxIYW5CNnZaQzhR?=
 =?utf-8?B?aXp4WVZhcXVpMHNqYWlrNnFOSXNubXovNjBIcWlzUUVTUVg4dll5RUtHSHBN?=
 =?utf-8?Q?h8k3bCQLy8VhoTJGlXRj4RA1Jg1xCHc6BO8pLehUcxpD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeb40b7-f000-4788-7bbc-08dad479afea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 15:27:13.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYT5Fqp43cNOSylF871+ESTcsIHzMLKKnpjhZgH2Yw4bX3+0Q5CiLGJ9kx9CbVTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359
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
Cc: Tomasz Figa <tfiga@chromium.org>, linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.22 um 11:30 schrieb Daniel Vetter:
> On Fri, Nov 25, 2022 at 11:40:04AM -0500, Nicolas Dufresne wrote:
>> Le mercredi 23 novembre 2022 à 17:33 +0100, Daniel Vetter a écrit :
>>> On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
>>>> On Tue, 22 Nov 2022 18:33:59 +0100
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>
>>>>> We should have come up with dma-heaps earlier and make it clear that
>>>>> exporting a DMA-buf from a device gives you something device specific
>>>>> which might or might not work with others.
>>>>>
>>>>> Apart from that I agree, DMA-buf should be capable of handling this.
>>>>> Question left is what documentation is missing to make it clear how
>>>>> things are supposed to work?
>>>> Perhaps somewhat related from Daniel Stone that seems to have been
>>>> forgotten:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210905122742.86029-1-daniels%40collabora.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C45786a08e6dc4af2816508dad2bdf957%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054011293521624%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=GjsoJGNoPozTS2SWeeirURzQatI5vfl9%2B%2BfzoavgTbw%3D&amp;reserved=0
>>>>
>>>> It aimed mostly at userspace, but sounds to me like the coherency stuff
>>>> could use a section of its own there?
>>> Hm yeah it would be great to land that and then eventually extend. Daniel?
>> There is a lot of things documented in this document that have been said to be
>> completely wrong user-space behaviour in this thread. But it seems to pre-date
>> the DMA Heaps. The document also assume that DMA Heaps completely solves the CMA
>> vs system memory issue. But it also underline a very important aspect, that
>> userland is not aware which one to use. What this document suggest though seems
>> more realist then what has been said here.
>>
>> Its overall a great document, it unfortunate that it only makes it into the DRM
>> mailing list.
> The doc is more about document the current status quo/best practices,
> which is very much not using dma-heaps.
>
> The issue there is that currently userspace has no idea which dma-heap to
> use for shared buffers, plus not all allocators are exposed through heaps
> to begin with. We had this noted as a todo item (add some device->heap
> sysfs links was the idea), until that's done all you can do is hardcode
> the right heaps for the right usage in userspace, which is what android
> does. Plus android doesn't have dgpu, so doesn't need the missing ttm
> heap.

Hui? Why do you think we should have a TTM heap in the first place?

As far as I can see we need three different ways of allocation:
1. Normal system memory.
2. CMA based.
3. Device specific.

When any of the participating devices needs CMA then user space must use 
the CMA heap, when any of the participating devices needs device 
specific memory then user space must use device specific memory (from 
that device).

It still can be that two devices can't talk with each other because both 
needs the buffer to be allocated from device specific memory for a 
particular use case, but at least all the cases for both none CPU cache 
coherent ARM devices as well as device specific memory for scanout 
should be handled with this.

Regards,
Christian.

>
> But yeah the long-term aspiration also hasn't changed, because the
> dma-heap todo list is also very, very old by now :-/
> -Daniel

