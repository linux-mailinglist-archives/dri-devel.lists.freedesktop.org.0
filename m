Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7658CADC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0EF8B73A;
	Mon,  8 Aug 2022 14:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FA018A117;
 Mon,  8 Aug 2022 14:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZmVBOAPMBVfjsI4aTy8N5233BBUZbjjXuGMFcftyIZ/p0Kn0qzCJfdPOrvOdlgVgva2hBFKA6bxI/s5X+BvKynvBI5XYEckSawennxwV7a7+TyRq1hBHGtss261vpaRR50703eohO8qAWjsLD6YyZykB1Edu2zOzsMfBANc0oknEAV8vWhSEnK0RwIIBiBadJXhvPasMG1nDKsa//IcnBtye/wdHWuQrv2gcECkFiRpoVPIe8w/mUrUTYKt5IuuW+5k/47Xrx7G3xjxs6r+pNjKY8EkpxYkTIsZOX/2TG2Ttp0k+ne7fJdSCt1m2iHZvC30bkqJlNLUCpM2a9wEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FImUiauRan1/vCCS0N6zadguU15a4w13gzxd0Vo4vBw=;
 b=bZpC1zPYHHoG+4wJ5I/hovUspzD0wzxUShC0N1BmtGPMUfqX9hRUyxUiG5/Q212HNO8jkZ4kkFjzj0nS3Ui/C3McKjxSuk1SqIZnwMg1VSbIxIcKTpr05IqoTpP7mSqP46psInlyFLUJvkVJTXemaresRO7GT/e+gr4VlVxSFY6UHqDeGr+i1mR4hECbhPceE82jmMbzPOUaoUoF+cG+XoYJtxEKXhENZqJMr2u2+p/FiuSA3YrChYTywqxiIApOo3lSxcBYUetpCRFLo+4ya+JIgTkN92RZVWN9YlN1aph7R54z/tJXbXZnEPwmP0VMkF9Y+uvKRVA5c9fqsMaVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FImUiauRan1/vCCS0N6zadguU15a4w13gzxd0Vo4vBw=;
 b=weecJoUIJTlC5NsviJI3Auuk6pfesu95NRh3JWJ2PTo3ZZBs4Juw/eeJB5L5Jh2T575Rf1EItyGOt9cOLweugrYHZib2GhLFMawTL5+woaFObPFM/HAuZnv7f9stcnAuO0KrkRqVHrR5hagr70+n/TZyC+udfKXCfAXIw7ht7Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3648.namprd12.prod.outlook.com (2603:10b6:208:c1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 14:56:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:56:33 +0000
Message-ID: <4e7448d2-7b26-e260-3d6c-7aa263a75250@amd.com>
Date: Mon, 8 Aug 2022 16:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
 <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
 <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
 <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
 <e90caaaa-cae9-c6d1-bfb6-dc56aa559681@amd.com>
 <CAF6AEGtWjtF7_uCYAH4uARVXgnOnX3DZ3KQahxTdAi_9Myvw0w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGtWjtF7_uCYAH4uARVXgnOnX3DZ3KQahxTdAi_9Myvw0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22ca7a8b-6b55-4f3f-4b20-08da794e2f5d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3648:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddnswpTD2CapEE9N7JLFNEO9R4EWtMPjkT6sviCpFaD8c0tj4E1OUYwOJMN/bBdL0Z7tgUgrCUceV53bYFPJpVWyL6uof9PjOb1xtxPGW4Omhk3+uL6/HWQVHiN65jyyksaZl2wE6f/m7WDb8iskMQvsDtJ6F9x6w6QctOrQYLRLswi092ke7Kq7s7/+BBxhOYQvXbCZfgde/cWs7LFSwZ6x4Er+hKRCmIcYa/+SHScljefXNc3VLpJ/mMNkno+o1ZsbA/XPeVHMmPeQicZ0mB8TG2EU9efHuiJt3BSDYEjoZujS8p3rYcoiok7dqVBzw7DXT9Hgz/9j7iGzG2ZjTq1Xb66ZPqZuUq3INyGiTxV0zs5VXRpb0dKwJcX5SbSC0lhXA9DedH7ro0qSQyBCw8CQpkVgAAFyJlIQ5qKJTbHsS68GYRKBN1R36fNcYHNrdORkryuPt5eo1fQO0j7iTLwFZuZufPNw9AeMTarQLkWeyi3RraJ31EKkHdLrcH7F1rVJvsZld46HnsUkdmEVCBCvd9rs8cCLCysP81SNcxM7KzJVzYEX+HMG/kIqp4iSTeM5MzsZDbANl5dR3O1ZgcYsBqS/+7kXrtztNqrBrPd+uKuqOcQ8lUoZVmq8gR54GaNfn+cpvCLjAT3NflzRg7GN8H711bxlOzJ3zG2RkAXEToH0jRjJmIp6h91NOZR/m4abJDHDshIMibVR4A4BTvpDJgNpkrG2A5/tnmPxYjDBZG2Ye4CVRix0tFST57xod0awXAVoCvI8CHMGzHi+V6wNM08EN4to9jTZD5yDHdj+PFpbffK+BdKlG47uT2DIpd2c59Ir83PG7UuapwINDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(66946007)(66476007)(66556008)(8936002)(36756003)(7416002)(8676002)(4326008)(38100700002)(5660300002)(66574015)(478600001)(2616005)(186003)(6666004)(6506007)(41300700001)(6512007)(53546011)(2906002)(316002)(6916009)(54906003)(6486002)(83380400001)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FWU1pma2RhOXlwbnphMlY3L3cwK20zWmZwTDVMdHBKaEdXNlYwSFdJTzFS?=
 =?utf-8?B?dlBxbDd4b2F3RmFnbWl6QUQ3U1dDN1RneHVNSlRlRC81WEZ2aWl4ZG94YmJv?=
 =?utf-8?B?SWxDb1g3SnlLSjZvNE5vWUZFbmlzcEZuVHczTFdaQld4Slgrb2VwZUZZazB5?=
 =?utf-8?B?eVhlajRiM01maS91Tmtnb05jVDNqb283UHg5R3k0ei9LRFJJZ1hhbVZHRzdw?=
 =?utf-8?B?NzFiYlAyaW9QYkdKMU9BWXBvSU9HSUdFeVVPWE9pUUx4elU1OVJjWWI0T2Za?=
 =?utf-8?B?Mzh2em44L3F0MWtzNlc0YVc1TkdqQ2pKQWU1elQ1RW5DUGRDcThOajZKNndi?=
 =?utf-8?B?MnJOUWtKd1pPVXF3cGEza0hDUVg5R1l2TnJrdmRtS1BIM3pjOTFWNDZYRWZk?=
 =?utf-8?B?RFc5WnY0WnozakMvand3a2hzbUp3QkdIdHhkS3hEbTBaZm1mWkkvNy9YZFcv?=
 =?utf-8?B?N1phVS9wdktQZ0RmWElBVTE3VFBtRXNlSHczTklNWWZiWTczM0g4b0JrTm1I?=
 =?utf-8?B?WUNUSXl6MDRxQkt1ZkdFQzdVOTRLRXVTUUdJL3ZMVGE5djJtMUp0ckhMNHQ0?=
 =?utf-8?B?c09keG9GSHR5ZTZkTXhvYVZiUFNudjFVSGhxOHlXV2FkRmhaYkp1S2lQSVdu?=
 =?utf-8?B?NmpZeXBQcEFuTGRkZ00ycHRNTkxEL3J6S1VrNlZybXZwNXJBRGhVM2lMYlAw?=
 =?utf-8?B?dnZSQm80WmM3aG13UGZiVy95bjM1T3RsYkp0SHZ4RHBkd1BYQ1pMUWUxOSti?=
 =?utf-8?B?czlkZFlJMlBiSm1rcHZuaFRTY08rR2dKWUFNMm8vTGdPeENIR3JsL2dub2cy?=
 =?utf-8?B?STNpSW9IeG9pb200MUZ0ZFRua3dFWlpUbW12UW5NY3o0am1sK0R4SnJWazlI?=
 =?utf-8?B?b0pqbDJqUnVYTTNIL3ZJeUNXQlF6SG9sRVJ6d3BJU1FiMmJyM0JGendlQXJa?=
 =?utf-8?B?bUJicGlGblpaQUNORzgrKy8vbm5TaHM4aGZzSHdjb0hrWDg2YXl2MXAxOUtr?=
 =?utf-8?B?clArcG5BK2N1R3dNMUswTVBTTUc5SHphYnYrLytUNC9HVTNhZXJMSnh3L05M?=
 =?utf-8?B?cUczWjJaY0JXZVdzVG1EUVZrc2ViL0k4eTJRNjBjaWQwNmcwdWdGbHBTODNZ?=
 =?utf-8?B?Umdack9GM0FvUVlqV0l5Wm1GZ3A5OXdiYW1QUkRCQWNGdk9MV3p2SnRSWHB1?=
 =?utf-8?B?NER6YTNuVGJUSDU1SEdhWEhhWUVuZ2tLaE5hV2xQL3FWMlNrak9jcmlLZnpL?=
 =?utf-8?B?eHNFNmZrUWpFREZUdzlhVm5jWVBhMXBicGVPVkVRRFRmdjlXVndiYjFMZ3E2?=
 =?utf-8?B?bC9zcmV1aFcrR0VEbm5ZU3NackxMRWdWcm9HbEVTM2U1UXZUZTRUeVp2dkVZ?=
 =?utf-8?B?Zy9SWGtSUzg2WUVXOVVMUnBOM3piTFNQeDlCZnAxZ3pwNG9KbjJYYzBUVkpK?=
 =?utf-8?B?a0JyS0tnQzVmdUZOSFVJVkNPNUhrYUJQZGdLR0phZWhFUnRrWWNhbTExRVJZ?=
 =?utf-8?B?aVhYdWpIZCtYZ1FJYVZWL2RvOENnZHpEVjFWL0lzY09TNC8xY1ZWNWF2T3Z6?=
 =?utf-8?B?bVpTK1ZqZStGczF3NWZGN0M3T3pYY1dVR1llMFp2UGJQQy9rSXFXUDYrTWVY?=
 =?utf-8?B?Q3RUeEZkQmhQUVlQQzJUNHZ6TkdsYWxGdStxUzZaQXFBV3c1N1ZESmY2bEJp?=
 =?utf-8?B?NnNlekxCeTc0K1dML2Mydkg1YUN4cnVPYkI1VlJxK0xNdzQyMzdzRUpXQzlC?=
 =?utf-8?B?UnpZb1VpVGluUEN5amY1RWNJNkVwRVpyTVI5MkVnUUJEZWdXdUFJM1pVdUY3?=
 =?utf-8?B?SjVjZDZhNGVvUUF1VTU2NEg5dm52WmMwSENFaDk3cC9wenhqS21wV3Jqd3pO?=
 =?utf-8?B?dnNRbUpMVklpWFU0K0gwbHAyTzNJdVZjcGFsVVVmeUZnMjBLMklZV0hLZ1NL?=
 =?utf-8?B?NnhuQURFd0hjTG5CTmYzNDBxZlNzdVVoR0MxM3pNeXcxa3lGenZ1Nzd4VURy?=
 =?utf-8?B?Z2c4RVQvSWtLSWdaOUttZ0p4dDM2WlRvSjhPeHhTQlZTK1YxL1QxOHQ0MkR6?=
 =?utf-8?B?NmhiaVdjM3NCQTRoQ0RnRklBa0dIMW9MT290MG1XaWcrOG84TVJIQ0F1d2l2?=
 =?utf-8?B?SW1iUnpnWDBFN0ZhYksxWDhGNG9KU0lHaGladDZDYldNSDdaeW1ueThzalMx?=
 =?utf-8?Q?3JAlHjlDU8CZypYNd/Rf4DS5Y0E9CkS50OLUmzNo+evE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ca7a8b-6b55-4f3f-4b20-08da794e2f5d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:56:33.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEIgX52vsM+Xoa1RbgTKMUHwF9ecqUmzkF5GuuEmcJr8GkDcO5e+IbPVPwWCDunE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3648
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.08.22 um 15:26 schrieb Rob Clark:
> On Mon, Aug 8, 2022 at 4:22 AM Christian König <christian.koenig@amd.com> wrote:
>
> [SNIP]
>>>> If the virtio/virtgpu UAPI was build around the idea that this is
>>>> possible then it is most likely fundamental broken.
>>> How else can you envision mmap'ing to guest userspace working?
>> Well long story short: You can't.
>>
>> See userspace mappings are not persistent, but rather faulted in on
>> demand. The exporter is responsible for setting those up to be able to
>> add reverse tracking and so can invalidate those mappings when the
>> backing store changes.
> I think that is not actually a problem.  At least for how it works on
> arm64 but I'm almost positive x86 is similar.. I'm not sure how else
> you could virtualize mmu/iommu/etc in a way that didn't have horrible
> performance.
>
> There are two levels of pagetable translation, the first controlled by
> the host kernel, the second by the guest.  From the PoV of host
> kernel, it is just memory mapped to userspace, getting faulted in on
> demand, just as normal.  First the guest controlled translation
> triggers a fault in the guest which sets up guest mapping.  And then
> the second level of translation to translate from what guest sees as
> PA (but host sees as VA) to actual PA triggers a fault in the host.

Ok, that's calming.

At least that's not the approach talked about the last time this came up 
and it doesn't rip a massive security hole somewhere.

The question is why is the guest then not using the caching attributes 
setup by the host page tables when the translation is forwarded anyway?

> [SNIP]
> This is basically what happens, although via the two levels of pgtable
> translation.  This patch provides the missing piece, the caching
> attributes.

Yeah, but that won't work like this. See the backing store migrates all 
the time and when it is backed by PCIe/VRAM/local memory you need to use 
write combine while system memory is usually cached.

>>       Because otherwise you can't accommodate that the exporter is
>> changing those caching attributes.
> Changing the attributes dynamically isn't going to work.. or at least
> not easily.  If you had some sort of synchronous notification to host
> userspace, it could trigger an irq to the guest, I suppose.  But it
> would mean host kernel has to block waiting for host userspace to
> interrupt the guest, then wait for guest vgpu process to be scheduled
> and handle the irq.

We basically change that on every page flip on APUs and that doesn't 
sound like something fast.

Thanks for the explanation how this works,
Christian.

>
> At least in the case of msm, the cache attributes are static for the
> life of the buffer, so this scenario isn't a problem.  AFAICT this
> should work fine for at least all UMA hw.. I'm a bit less sure when it
> comes to TTM, but shouldn't you at least be able to use worst-cache
> cache attributes for buffers that are allowed to be mapped to guest?
>
> BR,
> -R
>
>>> But more seriously, let's take a step back here.. what scenarios are
>>> you seeing this being problematic for?  Then we can see how to come up
>>> with solutions.  The current situation of host userspace VMM just
>>> guessing isn't great.
>> Well "isn't great" is a complete understatement. When KVM/virtio/virtgpu
>> is doing what I guess they are doing here then that is a really major
>> security hole.
>>
>>>     And sticking our heads in the sand and
>>> pretending VMs don't exist isn't great.  So what can we do?  I can
>>> instead add a msm ioctl to return this info and solve the problem even
>>> more narrowly for a single platform.  But then the problem still
>>> remains on other platforms.
>> Well once more: This is *not* MSM specific, you just absolutely *can't
>> do that* for any driver!
>>
>> I'm just really wondering what the heck is going on here, because all of
>> this was discussed in lengthy before on the mailing list and very
>> bluntly rejected.
>>
>> Either I'm missing something (that's certainly possible) or we have a
>> strong case of somebody implementing something without thinking about
>> all the consequences.
>>
>> Regards,
>> Christian.
>>
>>
>>> Slightly implicit in this is that mapping dma-bufs to the guest won't
>>> work for anything that requires DMA_BUF_IOCTL_SYNC for coherency.. we
>>> could add a possible return value for DMA_BUF_INFO_VM_PROT indicating
>>> that the buffer does not support mapping to guest or CPU access
>>> without DMA_BUF_IOCTL_SYNC.  Then at least the VMM can fail gracefully
>>> instead of subtly.
>>>
>>> BR,
>>> -R

