Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648B3FD8A4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 13:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073916E18E;
	Wed,  1 Sep 2021 11:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695326E18E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 11:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeAbVS3CWUQIdI+ThTthw+PjagCn8EJFrpvLru7jcjykblo17brwaCCIZoDR7i2vQG77ZH5w25+cLdMQZqVlRk4JQKot0DKwCajUblLRNWvHnvBQ5eZjchi66DNVvXmA5OXJxLM4DNFBaCINlcd/gLXL9gelqGjY7JaL49vbXy4eaVN9RXekW2+qFFtC6koVuWoutulxdMAX6jUOHYxv0JmXV5FViJeRZDflljS+qp0rKZmmdRfZYdPCLCJV3Pa/XkM77HnKlGOaurQgh+fRM8Q/dsrqwLA+koFYN+aUWQ5oYfnd6SR0ArOIFZ7bUNgTOJApB1elLBfOKzu3lmZwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dr33EPyZXCQNosmfOQhzHWvuEL9t/JGFwYUSgSFtR9c=;
 b=DmoDSkon4KPdTVptgXO554w7FVp7a02a+4PYaTyOnyODNGvOzwmZ57tdPZowC4gn89yERcisF0w8jTRYaSpYmzsaPUkf49tmPPE8/60T11tpcLcwisYk4pqBsKAc88jQzH3C7l3GyNZgCNczmUNFe/pYSqraRBkLngkAk3+AaLQSp7JSOgbU6ErsJmW+8cRhCL7RskP1amEAV8dau96wk4GzVC8we7IRmLe6acLfEDRaFTlVrq8efPQtXwiSgt65MAho/hh3/fYYRRjdo1UaGbBjOkuvnEB7XQwYYnrxURtwB6Qn44dc1RKKkOAi8Vppjkztce3q8/OBaJxwa5bySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr33EPyZXCQNosmfOQhzHWvuEL9t/JGFwYUSgSFtR9c=;
 b=NYx//n8UBh34568MlUcyG0RBHTSDm+YTELT/VgRIf+ZOxoge6FXQk6T5rCQiJqg6G6gswZC2Hw22ojanOsKKGKZHbwoLJcgaHLDMMGcC+ONGoNWYVFpBm+DnT64CpMzJD0KAkTyIvWOFCGSKnbmljPQmWU8s+EjfkTnDYloQcqI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 11:25:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.025; Wed, 1 Sep 2021
 11:25:04 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <b961e093-b14c-fcdc-e2fc-6ca00cde000c@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <98463545-c27a-77e6-0a5c-a658743ce86e@amd.com>
Date: Wed, 1 Sep 2021 13:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b961e093-b14c-fcdc-e2fc-6ca00cde000c@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0080.eurprd07.prod.outlook.com
 (2603:10a6:207:6::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM3PR07CA0080.eurprd07.prod.outlook.com (2603:10a6:207:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Wed, 1 Sep 2021 11:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 516cc220-88bb-4409-609a-08d96d3b24fc
X-MS-TrafficTypeDiagnostic: BL0PR12MB4659:
X-Microsoft-Antispam-PRVS: <BL0PR12MB46593A3A026AB16C9411F8ED83CD9@BL0PR12MB4659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFurmUUT8yvo0hjKd/bsMh3o83mzF2HE4jzPbpe9gudBskkp9o1VBT4H0PRGibfTE4Cubrh/2Vn/SYw4DC0IEhLRIZXIJCRBVgVgrGrwctZT3939kh9NYNoJIEdpukB9fXztMHlsxqwI7BZWFcfIYfAFhcDo/GHghbcAZWqphOLmhMxppjga9vgkI5k5rT+uGoYDvI7uYoV9OPj6exeyhpHRYfS3WEBquo9NhmorG1rmH5IVuW0GYuoO15j1SlRxk/gZNWXK3+i7mHLWNCphwR7w/EVbwG1duPsZPQdSDmMzJIgaw+yGSRVy9SAapWmyDRYLPnPXVnSMaQxmzTMWdSIAiFLpJuh9B5VzOUTpoFe7GTvLffupxGvYrSoGSTUW7zl8Dt48dlCL3ynUtsdwTqQ3vYR/htKFiKlGj/Ea/gRijhY4DwO01LgmlkqilvDQLQAOXqYIWx0nJZxelNWdiwFRJx7u6TN5kCgTYkZmfdDdd9Mxhd3X6LuY7cqGfNCCtEPuf9quHitYScKp6y+9AVzlckEighK4hGXMHOM6ClhKVMW/2cQArr42LJGc5oiG7d6q6iGg2PAYkpn76Hc+0t9mtfalPUuzDd1eZGdEuDcdnWkriMH4s2QCcKAvG355ClsUvENr8qnbrrS3T8vS0yp6MBmLT9H4BNXRyTjFjNXkQnJpJ6RRH+2vfaBh5CwxHoJgZjs2LL0amNHRWgK2M2DFQzPCYEQ+gejotprBZlw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(2906002)(4326008)(8676002)(6666004)(31686004)(7416002)(186003)(478600001)(54906003)(86362001)(110136005)(2616005)(16576012)(316002)(83380400001)(36756003)(38100700002)(31696002)(8936002)(956004)(66946007)(26005)(66556008)(6486002)(66476007)(5660300002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZDYW5LMG9CTTBZcmdnMTg1NlY5UG1MY055a3U3V1RhZVpLdWpzTlRqZjNp?=
 =?utf-8?B?eEZ0NVZXVnl4UUo4OWtaVjFMSWxsYWRzOFRGRHQ5TDZiMUtkSTFBYnRuOEdq?=
 =?utf-8?B?bUdhbks2a1J2MTdVY1BsTWhsYndwTGpOSHczM3JxSkJXeGttTVVvN1NyRHFW?=
 =?utf-8?B?azdBczBUQnNGSk5VM09nSTNIaDJRVnMzRmRBRnBPNjlzTTVWbUY2WmZxRngr?=
 =?utf-8?B?ZEN2bXVzNERPYjVXZkhFQWxFbS9OM2Z3bjJRV1l1WnpLeHdLVVFmZm94TnZJ?=
 =?utf-8?B?UzFxWUJQOE5hbTJkU3h5OGFtMjMzNTRVYmlwenBrU3o3b0F4N3RwUjYvR2xH?=
 =?utf-8?B?aFVHaVVWTjRIeC9JWlhPSHEvNHB4WFRUcXpGVWN0cFBhV0ZDMWJ0VFlJWEFR?=
 =?utf-8?B?V2plekN4MHZrUXBFTGloS1RtNS9scG5iS2VCNEd5L2xNcEJYYnNQQ2E4L0Vk?=
 =?utf-8?B?NHY3RnU4M2RjaTM1UEtLVmJsc2lwT3BtV291ZlRKaUtqU0NEWDZLNUdpNm9j?=
 =?utf-8?B?aGVOYS9jWWM1V3JpZCtRMWtwdk9ud0E3T2s0WVM4bTU4a2xiV0JUbnBpUS9D?=
 =?utf-8?B?WW9senk5Rnl4blFNZXhvSGgxTC8wY0cybTBSd2VhdDl5U1lsM0laM3hVbEtV?=
 =?utf-8?B?eUREbHBkUWFHaTN0N1hqRFZzTWxIUTVVWWdaNGpXSHNGeVdmWHoxWnBzSVRr?=
 =?utf-8?B?Uzc5b2txZzJrNENJT2RRQnNaZUYwZEdJSTZJOG84RzVBSWkyazdnNHRwakFv?=
 =?utf-8?B?M0ZGTUc2SlZUdTdTcURsaWtzL0taR2FHTWRvQzFFVmlXREpDYmloMzRhKzlG?=
 =?utf-8?B?emFjSmkrVUlObEFTU0ljVFk3bkZaZUtTV1QwbVZGbXV2eHBQOWVGN1ZISGlN?=
 =?utf-8?B?bDFKMXFqWEFmTXpTZWJuWVVsTlgvTTQ5SWtPa1NZZXd3V3hkcWlZeWFhTkpq?=
 =?utf-8?B?cWZCTFdlcGY1eWJOejhIbERmK1dPQmNBSWhzNFVJbFJOYWdac0xyTDN6V0lS?=
 =?utf-8?B?b3h3bnJsUHZ4Wk5adzNibk5MazVnL2hxZ2R1ZTM0aWs3VFJ6Q1k5MFQ0aCtR?=
 =?utf-8?B?cVpxeWxSdUpkbjlTVlJwR1oveHR3amlFdzNOSjBKa1BMT3VidXNJYzNXMWdW?=
 =?utf-8?B?MkNXT2ZlOWs2QXY5NnRtVlZLT2Y1VFM0ZzM1Rm9SMWFrclI1T3VwM0VoVW12?=
 =?utf-8?B?NUhPOWZVYUJQQVRuZm9rWmRnaFFVb1p4eGd1R3NyaGRvSFprT0NvMkhNMDhx?=
 =?utf-8?B?cnlVTm5NRXNxZFRnVG0wQmJwZ2dFMEtYWVBEWC9XQTBZOE1sby9NbllUdXI5?=
 =?utf-8?B?M1V4SnhVOW5IcW1xMlN1OFNCaDRTMGVxUS9ReHFEb3ZaekRmdkRydks4ZHRI?=
 =?utf-8?B?WnZ5THVTVFhmVjk0TkJ5bTlHZHZycndJQ1Q4YlNueEhEaFlIZlBiUmxKNDdi?=
 =?utf-8?B?dlhWd2RCNkVTU1UrRkNvT1BkV04wNWZtaUJUQVBFZzAzQ2xJclJjVFBESWlO?=
 =?utf-8?B?SXF4L2d3STZzeE1WV3hMU0hFU1lJdWRkMm9ORFB1QTZITVY3RG1tb1NWUnJt?=
 =?utf-8?B?blJUOXVyL1F0YlFyTEM2SjBOTFNHNWJJUXhaSlhCdUhEc3k2YjIrRGdzcXhR?=
 =?utf-8?B?ZHp0azM3Y1B3RDBIcldqankwTkwwdkhUTzNieUFOZmdpdWVRZENjYVdWTzcy?=
 =?utf-8?B?ZzlRbHZXbTc3aHpSUlJIckVpWVNKU1NwbFJWT0FzcVdZZ3FvZ0N5NkErdjZp?=
 =?utf-8?Q?WawsIJkhkrN10JTu73qsfzaUBZ4kH+q505+Pffd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516cc220-88bb-4409-609a-08d96d3b24fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:25:04.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCeAIZQsVvLVY+kCICZmBoVXVNyxHKNEmtsWns7ZBAP/IEsfmzEYt0nBDC3UzIn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4659
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



Am 01.09.21 um 13:20 schrieb Gal Pressman:
> On 24/08/2021 20:32, Jason Gunthorpe wrote:
>> On Tue, Aug 24, 2021 at 10:27:23AM -0700, John Hubbard wrote:
>>> On 8/24/21 2:32 AM, Christian König wrote:
>>>> Am 24.08.21 um 11:06 schrieb Gal Pressman:
>>>>> On 23/08/2021 13:43, Christian König wrote:
>>>>>> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>>>>>>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>>>>>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>>> ...
>>>>>>> IIUC, we're talking about three different exporter "types":
>>>>>>> - Dynamic with move_notify (requires ODP)
>>>>>>> - Dynamic with revoke_notify
>>>>>>> - Static
>>>>>>>
>>>>>>> Which changes do we need to make the third one work?
>>>>>> Basically none at all in the framework.
>>>>>>
>>>>>> You just need to properly use the dma_buf_pin() function when you start using a
>>>>>> buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
>>>>>> after you are done with the DMA-buf.
>>>>> I replied to your previous mail, but I'll ask again.
>>>>> Doesn't the pin operation migrate the memory to host memory?
>>>> Sorry missed your previous reply.
>>>>
>>>> And yes at least for the amdgpu driver we migrate the memory to host
>>>> memory as soon as it is pinned and I would expect that other GPU drivers
>>>> do something similar.
>>> Well...for many topologies, migrating to host memory will result in a
>>> dramatically slower p2p setup. For that reason, some GPU drivers may
>>> want to allow pinning of video memory in some situations.
>>>
>>> Ideally, you've got modern ODP devices and you don't even need to pin.
>>> But if not, and you still hope to do high performance p2p between a GPU
>>> and a non-ODP Infiniband device, then you would need to leave the pinned
>>> memory in vidmem.
>>>
>>> So I think we don't want to rule out that behavior, right? Or is the
>>> thinking more like, "you're lucky that this old non-ODP setup works at
>>> all, and we'll make it work by routing through host/cpu memory, but it
>>> will be slow"?
>> I think it depends on the user, if the user creates memory which is
>> permanently located on the GPU then it should be pinnable in this way
>> without force migration. But if the memory is inherently migratable
>> then it just cannot be pinned in the GPU at all as we can't
>> indefinately block migration from happening eg if the CPU touches it
>> later or something.
> So are we OK with exporters implementing dma_buf_pin() without migrating the memory?

I think so, yes.

> If so, do we still want a move_notify callback for non-dynamic importers? A noop?

Well we could make the move_notify callback optional, e.g. so that you 
get the new locking approach but still pin the buffers manually with 
dma_buf_pin().

Regards,
Christian.
