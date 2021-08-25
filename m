Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B93F7815
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 17:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00776E30F;
	Wed, 25 Aug 2021 15:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD046E30F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAyWUsumwcsxLKgj2W93KZRWf6i1GL4c/1vEsKKlJ8jZi75IhEmBsvVdFj7/OK0ptjCUGuGaucCe/jA33VXumLJXijA20wLpo8p8Nl6Qm/2/N1aIvgU8UGL4dWdpfcYtJ+A3SoY42XUeXXXn25kznLYGIshttekOt8cz87q0uNey8ADZd7ir26HyPDIkk79bw3NPFPZDFdHSqVwJz/TvTAesIh7y2x8hLV0d+HJti/LFlCmduZHdZsrKUl6jFeKU/qTewy8k+YHNJJZHEiQp4jTEPXScGfVFCo1oNgs5Ia5s/aNcsfdcR2q5v3P7ojlTAJMwPIhdcnUnqOjRgUvwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOO5FKGIX96K2tTeT5pKpWLfDkHmVMnSo4Lbue3zFAE=;
 b=QhGicfC7QlJUOkPFsPcKI7WyrOGh6qtJv3tw4eGxDtZeO6pBOWCqmFi8c15rU9yJ9WubGrH/0INJaKF0r3tor2XW/gMlcikvC8E8KWxGpV0yD3b1xfwczxs467/9DzkF+CnGBOq+/vpohGKappP4Y4q9yUtrdNpp664sjH7YL9+LEhuQYgtGpuqrVMbwFQ5rLzqIzMFuBBjBqFDR3LvTjHX+KyTB9SdwC0hnyPFGCfg7zXr61tHocVfEW4lz3vBOrzdoixJEFBrOufo0oU+1g90hCUanjHHe6ffL7rS89wJ9uFx5MJEf7fWfWiXdOozugahpopugLlYT9GX3dXv8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOO5FKGIX96K2tTeT5pKpWLfDkHmVMnSo4Lbue3zFAE=;
 b=fld7MQ3+ZWDFSh6rjnn1u5yxuNe6GfvwEiZ4Z2wL4uBWWXzm24idUzfcfdXG03/BoIdgqhhXD/mtVveoN0r2jRvCsKqrdEMcmqiM6TKxkZDhl8Mk+bh8+qM7Oxlu+FMqpSBQOc8+MqeYBrF3hdG1uLp/ayJVeqUBvcZD9j9Vmow=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2387.namprd12.prod.outlook.com (2603:10b6:207:44::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.25; Wed, 25 Aug
 2021 15:14:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 15:14:15 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
 <20210825123802.GD1721383@nvidia.com>
 <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
 <20210825144736.GG1721383@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <92ae1a45-3903-8228-c299-7ba1506079bb@amd.com>
Date: Wed, 25 Aug 2021 17:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825144736.GG1721383@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:de26:aaa6:84e1:c609]
 (2a02:908:1252:fb60:de26:aaa6:84e1:c609) by
 PR0P264CA0089.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 15:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c887efa7-1a7b-4822-74a0-08d967daffe4
X-MS-TrafficTypeDiagnostic: BL0PR12MB2387:
X-Microsoft-Antispam-PRVS: <BL0PR12MB238726A3B85129972D47D47183C69@BL0PR12MB2387.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3F8mTeYE/WWiW6BZuIAbsIxHM1DgYUM7hw2W51LAsLcHhnqzErkO20Fgypc9NSyCkq/Pw8jOc3zpggyxVBmZDiEW+JmJdWfiDEwU0CA2l2TxX6sE8tTHarTj7VzPXHupNGQT41SpAX0OG/MvXAF03+1KWJov3IhOpm2hwW/g10jTfPbncsgJCNDUJdweg4+G6AmWneNhBjovxT1nMHmsbOIwAOUhRo2xGRxckJQUbHXbRHjWqvHBbb5Q16iyGl/CZX7StnBk17Q+Wwd2CqxlBUmadQnR9HXTP/hl92E882gid2LjtCMFxeHO7NuuEF0SWW8/R5XykT/EcXuUPTUS/Ty8zMcB7AmZW0NE8gjz9o40SQvNxsVD+5vehOw2gOK3T6txHScfj1RZappa5zWk+Kfi1frGkwi/Tu7mLOyaxWltdDGIrnvn3OUtL1jSm5y85m1blm2+lrZR9wx1+ig7Y1vfENMXTQTKSgDoBP9Gnldk8vIfe9jMt8cOdiCPvPxbU2kTKRP2YayNfUr+/cmwt2TPmrVVbAlLHvMkVkUXz356pBFm2jgvkB9i0ZC9eDfqsF+BusAYMmdoyRM0mjashJxMbhNj3Cf0S6iIxLgnx4WDx9lgZbrRII9wQd3K4T+WY2/Bn9Cyod4zFYSLHA684cDEFdLTFxeAy5VrwydnhtUul8slGBYa75L2JleQV9Z166BooYRwjSYgHXZtbTfJI0FeG02k4m99YmZmCIh26kHLQaIMEja7QVN/2M/lBqG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(4326008)(478600001)(5660300002)(36756003)(8676002)(38100700002)(66574015)(66946007)(2906002)(31696002)(6666004)(83380400001)(86362001)(186003)(316002)(54906003)(2616005)(66476007)(66556008)(6486002)(7416002)(8936002)(31686004)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnhxckpoNU1qSFBVWWY4LzVqZjI1MnZMdk56QmtJVW9QRGhLUEVDcHg4eGxX?=
 =?utf-8?B?VzVYUi9RWGR0a0hBYVk1VXJnallCSHY5K05RdFhnTGVETllPT2VVb21KT1gv?=
 =?utf-8?B?Vmp1S2xMT2hacGx0bXNPRVc0cG5DYVlESXl6VkhzM09FWGwyampHY3hnazBP?=
 =?utf-8?B?QTZHTm9nWGoyNWFYQTFoaU9GTkZPdnNkN2xqa3c3UzkwRFFuRTFCQmovUk80?=
 =?utf-8?B?ZVlvdnlPeGp6eWZtSEdrMzBTYzdxM3Z3TE9sZ1NkaTZOS0d4K3JiMmtRYXNr?=
 =?utf-8?B?UytEbVF3cUpROGpsdURIYXpFNTc4VFVGcko0K2IxQWNXdHBxcXJFcTR2c1ZX?=
 =?utf-8?B?bGZiK2RzL0xTbktXdGFqQUw4eG4wdHdLNTR1dzFEZk1XTGpvLzgza0JsWjJS?=
 =?utf-8?B?eFdFclRTMTNFaE1BOWJBeGZTeHUyRkx0Y3V2cmYyRkpabmp5QkFKWVlKUEhr?=
 =?utf-8?B?TWlKcnQrclg1NWRIMnFVTEhVTkdqRzlIMGZ2YmZveEtNMys3ZjFMcmlVVUZv?=
 =?utf-8?B?QnpQekg2dXhJaGJna3dWTzEySDJSTXRnaDJxdUwvRE1aOEY3Zkw5RTIrZ2Zu?=
 =?utf-8?B?UDJRYnhRR1hhY003RWdnS0JvN2FFWmN4Z2ZNTjUxR2s5TnU1OTV3UC80NjVq?=
 =?utf-8?B?Q0JFVFJHZXExWm9ZNkx2MTdjNkFpLzdTOElxTkZqYmJ5VXBsOEhXdUhLZUtV?=
 =?utf-8?B?VFRvbXE2MFRSeUdLWXhmRllaeVpxZ2pwWHdhVkYwQUtpNGhxZHdIc3VkUmFP?=
 =?utf-8?B?SXNDL2hxRXY4c3VVcy9kUWgyN0w4d0FwNng4YnMrU2s0OWdiRWhkNC9XR1pC?=
 =?utf-8?B?WmFKdWxHM2phOTljT2J1aVZrS08rYkpmdVFTWlJST2V4R01wY1E5MjNGOW53?=
 =?utf-8?B?VEdkV2pkUHBjMzNOcHBsMzQ3VUQ5dm1WNWRmVUM3ZEZibXJMUllDM1prZ0Jr?=
 =?utf-8?B?M0FGeGh6alNwbkE0K2xkNUcvQkhmZGZ6NWVhRjgvSjRTYUVNUW5kaXJGcUJB?=
 =?utf-8?B?N1h2cVYzYjk2Uk9RUVAyKy9sa0hZbXFDbHpRQ3JoWFdLMnlhNXFFOUxaTFNy?=
 =?utf-8?B?bEZnb3dBbk9VRWR4T1l5d24xMWpnRktXSVlUejlVaTRQbGV5dDl3aUw1YUZo?=
 =?utf-8?B?SEhORlFaY1BsQkRzSTVkV3JHOTlZbkQzdkJDOTNOWnJXcTBDeHpSUE9NTlAz?=
 =?utf-8?B?cVRaYXpKK2FnYkJiaXRRWncwWXF4dUYzaWg5TE1ha0VNUnVRTWtBd3c2T05R?=
 =?utf-8?B?Tlp0OE9VYU0wRjN0M2JCQmQxYUxleXphZFFDMkNQWmNteVRsbjdwSFBmOHB0?=
 =?utf-8?B?OEl6TXBmMEFxMU9Zby9CajhaVUZidnY1MmpRVkgyVW95THdsMkhHcjZwWVk2?=
 =?utf-8?B?aDVjdW9jUFJGZGlhb3piUmVHOWlZNXVmWlV3enhOOHl6dUlleDdWdy9EVlpX?=
 =?utf-8?B?WDFWQ2JUbTNwdE1RalFRRHVtWmR5MUdhY1g2Vks3RE9KS1FCeVBwWWpIU2p6?=
 =?utf-8?B?WHU3Rng1Yk42bVlTVVNpUDN2YllPMHdiZmY3bTk3d3VldWhldlZmV0JJaGpl?=
 =?utf-8?B?WVdVUnJoUGJNMEM0TWczNmlRY0p0KzVyVHVTSU55T1FwakpCTnBPY0pKKytj?=
 =?utf-8?B?STNaM2VLbTZ2MUE2ZTBldWVjdG5uRjJYM2g3S3g2TnFzR2IzZmVXL0dZMEhH?=
 =?utf-8?B?dU04aGFRODhER2RsN1Mvb29JODgwQkNXRjBBZUlSVEFhVXp0VDFRUG41Qk5B?=
 =?utf-8?B?N2xRVk0yeXNkaWtaNyt3bTZPTTEyZDJkSS9QK29SRGlicEhQcXc1K0duMFR1?=
 =?utf-8?B?bzBWc3poS3VLZUN2OHcvamxiQVVOWGdqVDk5UUlJSGVZMWZiejJNdUNSVlNM?=
 =?utf-8?Q?ZlKn4hX7A6rMC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c887efa7-1a7b-4822-74a0-08d967daffe4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:14:15.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBG22QAwxxrSWzjPdOh2ICK3pBYx4LfExDrg50EQ25joZXNcTdILPB150qbI/xbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2387
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

Am 25.08.21 um 16:47 schrieb Jason Gunthorpe:
> On Wed, Aug 25, 2021 at 03:51:14PM +0200, Christian König wrote:
>> Am 25.08.21 um 14:38 schrieb Jason Gunthorpe:
>>> On Wed, Aug 25, 2021 at 02:27:08PM +0200, Christian König wrote:
>>>> Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
>>>>> On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:
>>>>>
>>>>>> The only real option where you could do P2P with buffer pinning are those
>>>>>> compute boards where we know that everything is always accessible to
>>>>>> everybody and we will never need to migrate anything. But even then you want
>>>>>> some mechanism like cgroups to take care of limiting this. Otherwise any
>>>>>> runaway process can bring down your whole system.
>>>>> Why? It is not the pin that is the problem, it was allocating GPU
>>>>> dedicated memory in the first place. pinning it just changes the
>>>>> sequence to free it. No different than CPU memory.
>>>> Pinning makes the memory un-evictable.
>>>>
>>>> In other words as long as we don't pin anything we can support as many
>>>> processes as we want until we run out of swap space. Swapping sucks badly
>>>> because your applications become pretty much unuseable, but you can easily
>>>> recover from it by killing some process.
>>>>
>>>> With pinning on the other hand somebody sooner or later receives an -ENOMEM
>>>> or -ENOSPC and there is no guarantee that this goes to the right process.
>>> It is not really different - you have the same failure mode once the
>>> system runs out of swap.
>>>
>>> This is really the kernel side trying to push a policy to the user
>>> side that the user side doesn't want..
>> But which is still the right thing to do as far as I can see. See userspace
>> also doesn't want proper process isolation since it takes extra time.
> Why? You are pushing a policy of resource allocation/usage which
> more properly belongs in userspace.
>
>> Kernel development is driven by exposing the hardware functionality in a
>> save and manageable manner to userspace, and not by fulfilling userspace
>> requirements.
> I don't agree with this, that is a 1980's view of OS design. So much
> these days in the kernel is driven entirely by boutique userspace
> requirements and is very much not about the classical abstract role of
> an OS.

But it's still true never the less. Otherwise you would have libraries 
for filesystem accesses and no system security to speak of.

>>> Dedicated systems are a significant use case here and should be
>>> supported, even if the same solution wouldn't be applicable to someone
>>> running a desktop.
>> And exactly that approach is not acceptable.
> We have knobs and settings all over the place to allow Linux to
> support a broad set of use cases from Android to servers, to HPC. So
> long as they can co-exist and the various optional modes do not
> critically undermine the security of the kernel, it is well in line
> with how things have been evolving in the last 15 years.

Yeah, that's exactly what I'm talking about by adding cgroup or similar. 
You need a knob to control this.

> Here you are talking entirely about policy to control memory
> allocation, which is already well trodden ground for CPU memory.
>
> There are now endless boutique ways to deal with this, it is a very
> narrow view to say that GPU memory is so special and different that
> only one way can be the correct/allowed way.

Well I'm not talking about GPU memory in particular here. This is 
mandatory for any memory or saying more general any resource.

E.g. you are not allowed to pin large amount of system memory on a 
default installation for exactly those reasons as well.

That you can have a knob to disable this behavior for your HPC system is 
perfectly fine, but I thing what Dave notes here as well that this is 
most likely not the default behavior we want.

Christian.

>
> Jason

