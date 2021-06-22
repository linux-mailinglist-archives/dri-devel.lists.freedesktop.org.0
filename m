Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53C3B090D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27F06E5A3;
	Tue, 22 Jun 2021 15:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C916E1E8;
 Tue, 22 Jun 2021 15:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElPPwxi0R5Q+6c2XAjso2Y1dllFwiTXaRqcVr8zwJ+0OxDVtuHnRKJDkVdO3SDdf31RyUvwM7xOlfTbbXlMdR1AzuzWdBEDlQ2NR3OyxQ7fDqA1AEqBS19JV6Dgb+6KUmz5XvBDJ4zeRtDoZL6ShCnQX56LO6niGg2JAD4dx8NXGrQbkewd8qGkUOZy/Tb6OIXiF9vt/Ii8glsT1iv3C+1r8mOpbei5mBVnyWM8n1XXVaQNHdx4TTQnuJfOCrDvXpPMO6CO5Ja82rSLQdooRNz0Cs/unwCC9SXyREQB0ZLbToFoJOJBWu9drrEhqGZhDciVb4WDUdrGy4ZMfBQoS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knjqMiy9X5NYSpNKZ3d+soIwHzNGU/oF0zuTMPQMTmo=;
 b=gpZUHURkkbvvWKihwxt0To61Fl21FMSHR6MOZgI/0BD9EcIE+lXP9bxq39HGr3H27xZNY+8FVkX9l5CAOGlb3fHZUWZAU24c6tjt1uqJWmmBAUqhdqxy2xvQgTiOCyMf9yzCV1/p9/pWReGTZex6l2OwX7Jro3cHKdxPlipekpEPH2xx1LF01ATAmz2/rY57+xfd30c+5WElOPXa4wznoe4+OKJTFIQxHjfuXPt2Y9U8iIvxWifEkDfGsQSenkn6RgD4JY67cTu5Lm7Y9iG2t8EYBQEM3Zr2WY3SuUuDUVtvU74wpHSEThYp5flgj1LLzuRGZL5BUEc6CjIgkwXczQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knjqMiy9X5NYSpNKZ3d+soIwHzNGU/oF0zuTMPQMTmo=;
 b=Jc+TOv0C5BjyJ+7tvwLSrFy0rn3sjqtZBIV0UT+fVJC7o68XEr2J7z3pHor0pk1aD7nsFZ2ItD0Z1KTjhlrQpNiuHQSqt3E5UANiFebPdv9mSDcUW1YbJ7WNBKEK+Kj04mwXuGbIcgAPPc8qODAYMB3H13BZrBIHvuer3j6mGF4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 15:29:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 15:29:07 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
Date: Tue, 22 Jun 2021 17:29:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622152343.GO1096940@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
X-ClientProxiedBy: AM0PR06CA0104.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
 (2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4) by
 AM0PR06CA0104.eurprd06.prod.outlook.com (2603:10a6:208:fa::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 457a4ebd-ca5a-46e4-6e2e-08d93592797e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4237B65BACC81CA72B04FAA683099@MN2PR12MB4237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hxBR8zSqFRP15CeAapWHmg4ugt3PSfU1WBl5rClu1bgoUtndC/9QNMJ5X+HwSw234Ubw8nnUr59u8aHcFC9VK7wVBvdqH7CNM8gPHDgvHckDOCtpLaJ8o7M6vUvctaYbAqLuo52GlDayPrBYW3M5Hhhd4YTFMvo8W1RnH9UN9w7PcAtJJ6JvQ7JyJSQcr51+ElSJYHhnNJNdITnl7ChtA0fy4flm1IXV7SZsW4X//JJCyPJPenVtssAxhnm1shHp9amVv43F6bTNtUfhGCOai1f8/6OXFe5W6FFZ9TD4uxqzsAlhxNfHHzOkO8DJPcwMerqb70fYAIDa1xQ3DjRmtwAhy04A1hWYdG3IpEyeOMSVnnFhfkOQ9b8NWMmEHUNIPJ3lxiDFVgy/i1VJvR/6gT0uMoC1CxoXxp5kJBryFNNzeLQr/5HVJn8wQIbNuaI4kRv5A2t2+dqxjV08B+y1Prm+n8/qxK6yeJH5UEVKO35KHJRnKUv1PkDJe5pYVSfOsfUISFAuynC/BqBoj/gGnggBfW3WRBVO9luAgiNIszav/pHhFpt2KT9rKd2pzVbkPqTMrhZIXJR/Sild2J/vcbuvha4Wmz4JQ7rDeY7/R4pEDbwqh//qycHcsWrM/+UP6D209Hbqwso8YKnjRh/7sGotLpTRaj09dc6BTQvsZv0BpT0ipkWvqMNT9vJSXqd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(66946007)(53546011)(16526019)(7416002)(66476007)(66556008)(186003)(83380400001)(8676002)(31686004)(86362001)(316002)(54906003)(6666004)(8936002)(478600001)(36756003)(6486002)(6916009)(2616005)(2906002)(31696002)(66574015)(38100700002)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUxMbFhYMUNaRE1CTllXdG9WdVhBdnVLNXVkRWR4dUNGWHI5aUY1bE1taUV0?=
 =?utf-8?B?eWJHZUtkYXJGMGd0ejB0NCtiL0NCT1NoZnpZeHdaWER4TUl1SjZSZlpWMUV2?=
 =?utf-8?B?QkhYRk9VU0N2NzJGQ3c4WUJOV2ljMXlJMm1JejR6TXl6bThYT2tORFdpYWZW?=
 =?utf-8?B?RlBoa3lwbStvK3dGMGRaaW5uM2pYTUhHVHVnaWdheUlxbzV5Q2lxRW5rZUF3?=
 =?utf-8?B?ODlLeUNaeldxdlpjU3UvamRTblZtK1ZHU0tWTTJlRWlOQm9mWm5vN1ZyTkY4?=
 =?utf-8?B?OXRkTTZzLzJ3OURpNnZGUUpVdTJNeFJtOGhGOGVLZW9LNEJNNGlKMWcxN3pn?=
 =?utf-8?B?V2xGWGVkNEVSYzZTY0o0REpjUUN5ZlAyTUQrdWJ5V2xaUGcvK0tiV0U2UjQz?=
 =?utf-8?B?K3Y2blVyN0trY0NURTdFMGw1Z2RXV0N3NTNEdEYwdTBrMXB2SHpRT2k0VGFU?=
 =?utf-8?B?Umc5eFBNWlFTZW1ST1V2L2k1RnRvMnlzeGdkUTRvc0xaZXgrQUZOSkt1OTFs?=
 =?utf-8?B?UGZpdS9wM01lTVgvcGlqNUJZL2RPbkFDYzlQWENNZVZmOGVGOENlQ2RKLzk4?=
 =?utf-8?B?UXFwbjBIQVBvUlJJNjkvZXNEZHlTNldVeU9VS0JGMnhoeGZ0QWhFWng1NElu?=
 =?utf-8?B?VkRDUGsvd1pUblMrRnhFUVR2MDY1SEFacjFILzZFVnV0eE01OGNzSFBka096?=
 =?utf-8?B?ZjI0bWdnSWRUVzBnUWZCMDNsa2tzMnRScXFWLzZVYWs2eTdwVldjOEFkakVZ?=
 =?utf-8?B?RXNkUkZydVh3QmZxcjUzaEQ2UlpTVm1GQWhWVkIyTUcxY3VzQWp0RG0xcEpW?=
 =?utf-8?B?MUl5aHNLSWlrano3UjBLaHlTYUdnYVNmSVd5djgvMHJlYWd5Zm56VDY3NkMz?=
 =?utf-8?B?Nkg0WDByR25pS1NnMlpmcmFMYllFcnNNZFVtRVZwSjBwWmY5d0VWL3BxR3hi?=
 =?utf-8?B?QzNBN3pUNDJxZFBPQWFSbWE1N1JwUHNzaVRPTGovY2gzSG5KU3BIbVp6cXQv?=
 =?utf-8?B?RHloUmlnS2pRSFk2NUdrcjBoKzM1NnFyZm8vZkhOMmp0SkFqQ0tKakRLRUhp?=
 =?utf-8?B?c1JrV3o1bEszZmFLdk5pTmxtL2lHYWFqWXZ6ODBvUXdnS3F4bmZIbjJESThS?=
 =?utf-8?B?dXl2VzJDRjBaTTEzVHd1R2NjMmxtMlIrdGQ1S1pTckYybjhYdmdmNGNCbUhk?=
 =?utf-8?B?RSsraWkvejl0d09lTWU0eGNhS1Fud0pGREtHeUZKQkVVeTErTTcxTkhCV0Fo?=
 =?utf-8?B?anJMbzNUTnhrNWtuVjkxbFUrOVpSejFhZ0FKaHNOb2t5WnQvTnc4dzFUdGdB?=
 =?utf-8?B?Lzd1bDVxVFE3YVMzWWFjN3JUcXJtdk1lWDRPc0hjUGNnZytmVVI5UnVNWnpn?=
 =?utf-8?B?Ukt6UGFRWjJ0UnFjak01bHhFQ3FyYWdKckx6SzFxaHpXRmQzbjV4NjZmdVYz?=
 =?utf-8?B?K3N0UjRwcUt0Ym55YzRaVkVSY3E0amYrOVFGV1Uydy9zZGl5cUk4MU10Ukx6?=
 =?utf-8?B?cVRSU0hodnFDNVFKM3Q3eXZGdmVscE1ITDFWOWdObnZZZnlGUHB1QW9RK3pY?=
 =?utf-8?B?eTNSMzRiU2U4aXQ3dVFkbU5vdHVYU3NnVmtOZ205MnIxcnc5enJOaWVrdGdH?=
 =?utf-8?B?N2xWdjZwWmFiLy9JUkd5eGU0NXpBeTdBUXVhTGI3K1BBdE94MThyT1c3cEdt?=
 =?utf-8?B?NkxJOWhNN2VTWUoxcFQwd2dVZVBlc1JrNGVMT1MxZml6SVZUN3MxUGFPNzg4?=
 =?utf-8?B?VmR5TDhQVzVTOU1yUUw1amlJSFR1b0lCbTNlRzU3bWdrZXJ3NzVBbC85cDVD?=
 =?utf-8?B?Y0RQdlMzMk5ObWQrK0NKalNWWlFjZ3JqM1hvZ2cybjdTcEo2Y2hwaWJMOWFY?=
 =?utf-8?Q?/9QjJDBsCmygP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457a4ebd-ca5a-46e4-6e2e-08d93592797e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:29:07.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gydCSsQr8MUAcX4Y9s8pY9s3oZXDEl5phA3m7Cpx3mLZKPUe4oLpICM3QR0zDd5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 17:23 schrieb Jason Gunthorpe:
> On Tue, Jun 22, 2021 at 02:23:03PM +0200, Christian König wrote:
>> Am 22.06.21 um 14:01 schrieb Jason Gunthorpe:
>>> On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
>>>> On Tue, Jun 22, 2021 at 9:37 AM Christian König
>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>> Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
>>>>>> On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
>>>>>>
>>>>>>> Another thing I want to emphasize is that we are doing p2p only
>>>>>>> through the export/import of the FD. We do *not* allow the user to
>>>>>>> mmap the dma-buf as we do not support direct IO. So there is no access
>>>>>>> to these pages through the userspace.
>>>>>> Arguably mmaping the memory is a better choice, and is the direction
>>>>>> that Logan's series goes in. Here the use of DMABUF was specifically
>>>>>> designed to allow hitless revokation of the memory, which this isn't
>>>>>> even using.
>>>>> The major problem with this approach is that DMA-buf is also used for
>>>>> memory which isn't CPU accessible.
>>> That isn't an issue here because the memory is only intended to be
>>> used with P2P transfers so it must be CPU accessible.
>> No, especially P2P is often done on memory resources which are not even
>> remotely CPU accessible.
> That is a special AMD thing, P2P here is PCI P2P and all PCI memory is
> CPU accessible.

No absolutely not. NVidia GPUs work exactly the same way.

And you have tons of similar cases in embedded and SoC systems where 
intermediate memory between devices isn't directly addressable with the CPU.

>>>>>> So you are taking the hit of very limited hardware support and reduced
>>>>>> performance just to squeeze into DMABUF..
>>> You still have the issue that this patch is doing all of this P2P
>>> stuff wrong - following the already NAK'd AMD approach.
>> Well that stuff was NAKed because we still use sg_tables, not because we
>> don't want to allocate struct pages.
> sg lists in general.
>   
>> The plan is to push this forward since DEVICE_PRIVATE clearly can't handle
>> all of our use cases and is not really a good fit to be honest.
>>
>> IOMMU is now working as well, so as far as I can see we are all good here.
> How? Is that more AMD special stuff?

No, just using the dma_map_resource() interface.

We have that working on tons of IOMMU enabled systems.

> This patch series never calls to the iommu driver, AFAICT.
>
>>>> I'll go and read Logan's patch-set to see if that will work for us in
>>>> the future. Please remember, as Daniel said, we don't have struct page
>>>> backing our device memory, so if that is a requirement to connect to
>>>> Logan's work, then I don't think we will want to do it at this point.
>>> It is trivial to get the struct page for a PCI BAR.
>> Yeah, but it doesn't make much sense. Why should we create a struct page for
>> something that isn't even memory in a lot of cases?
> Because the iommu and other places need this handle to setup their
> stuff. Nobody has yet been brave enough to try to change those flows
> to be able to use a physical CPU address.

Well that is certainly not true. I'm just not sure if that works with 
all IOMMU drivers thought.

Would need to ping Felix when the support for this was merged.

Regards,
Christian.

>
> This is why we have a special struct page type just for PCI BAR
> memory.
>
> Jason

