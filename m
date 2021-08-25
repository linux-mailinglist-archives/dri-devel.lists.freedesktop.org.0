Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD53F6F4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 08:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4276E152;
	Wed, 25 Aug 2021 06:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712706E151
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 06:18:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJHez31we/tchEote1/24Z7tGxHN+NWzb4zUgRDwSyVRXir4D5yqBxgIyFo1ws2QNKf8Ysx5NysX0kqD5Ir2ZMBJEPR4VuaJfuLoE1XwlnMgFipEYEqut7dTWfuxMGqpwj3IMpw9ztbFvrAn7GQiHwjpaciypx5IH1UNkVb0fyo7oE5aSkOusKMWg3D55IpeM+/gi8TkktL1lQOZlfyPqqyLR3Y8whIcaQ9yravJ9do4noX6/RDoKYAcjsyILB7OXERwUUC0NVzsOQtVvdOq0vkmAfTy5AGJFcHXCI98UQyUymaPfpY0rICQ7nsg2SXIOqVspuTa547D+AJrUjFkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tdlLkiJPvuG7hCROhqiPxWmMD8LjN+GHK8FrhnCZ6o=;
 b=Y8JsJ7IhwWbWbu00pSK4jmEPCQTUpvtTEThFYo0Ey8faToRqTTMZzTiJAgt5XonQyuZF5MxMlyGcb20Hs/za/acpdwhmuWdA6bHeklIQFxS4f5r0B/4ouMfJUY9sbFZmSoRJ6CS0qrqs3S2724uIvr3JP1pqnnaugkvnBbcxssQgQomQoY++H8cSeUSQBSuAlvSAZ92z1owbtkgMREtZirsTOLJl5iEGwrdRBlSboXPd6sl2IoAOav01LQGTXo+9P81qif+ZF79tjk93mNhdzIaHdpjkc4TulDj5IOtlG8qAH2kar1nTe/SCDOGjOuhTbhgbjfDC02rxnjuQ4FD81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tdlLkiJPvuG7hCROhqiPxWmMD8LjN+GHK8FrhnCZ6o=;
 b=lzyiXyuRU4/GfGRdrqJVo9DvK3oSppRVZhRM2A2BnRVumsN+wPsqdaVUMC9HgiddNeajD03PzIqL4IiyxENbhof9wGMs01M9V7fnPOBTLktpPKqGyiJ5RoMUMyVF2nPlYDLS0GaCzKVrE0EPQQbAvKlYsbbri7gQN1/DY846xvg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 06:17:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 06:17:57 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Cc: Gal Pressman <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
Date: Wed, 25 Aug 2021 08:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210824173228.GE543798@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0215.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0215.eurprd02.prod.outlook.com (2603:10a6:20b:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 06:17:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af15d8ea-b8ca-4aba-bca5-08d9679014f9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39660746DFE5E5A9FE7A4C9983C69@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXDGw5gq4eQRYgTryS/OQggdGAzluXSk/1DZXSQ4jC5R+3Quw4XbU1258nEMQX8pd1X6U1nWBRCDLVDKbaf4NVpmCBH9S1uec9WtwTPilk/XoeaDY62LMB0cd32o2p9J8R/yLEj16lTiLSPgetjb0BCFDSuBKIFd9obtJOTimzTms8w6vEBQZV+kmpCSj19BTV/mSJ4VUyGy7AeD2BFPMtqk2pIduSbkPW6m13wl091GqpQ/l8wri+Dr6yoXOP+4ZeDflHwH8btlRdv46Tmbl1nGF9lm5xhjFEE3qAEUv8tNcHgcYVAaXfEAcmJ3EXdxsnJuNJXU95Ci5aLCJZ8Zp2iWV0Xxo7EvSf4OA1FsxPKVGwxmbbn/s8vMcmOqwXMtsG+FP64gUryb2OWvbEnZBW7lruU8i32zKqaeDLn8CreRe2A+4kHub25284Toe+dsY6MIwE/J+0MvOLY291vlAloMInnmeUketQ7EQrxF4KTYHSPoSqQjfLmhMcctnF4w8EU48xDYHi26MIKUCy7AfXeAobRtOsD3JEN/G1+bIHlboYK1Rw7WO1ZkLszGus4k7VYopdCNZl6mRWhxUeRpXF8VWF95acjxYu0q34JECWg2ASLbfHM2cYCDP41LgEY/K4IuESphb8HjbQIor2UIc6Sf+LiNfxkUswa+vx1LkjuAa/OuFX5kFPDfoCMTGXb5iSosqMd7TyzrH++HcyRdm2zma330c0EAANOVr5VZHVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(5660300002)(4326008)(2906002)(8936002)(6666004)(2616005)(956004)(83380400001)(6486002)(66946007)(66476007)(66556008)(36756003)(8676002)(26005)(186003)(54906003)(31686004)(86362001)(53546011)(38100700002)(16576012)(316002)(7416002)(31696002)(110136005)(66574015)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFnQ0VrR3lXNjFONUZOS01IT2szeDBXcHFVR2lWVjBSNjRCanc1R1cxZkZs?=
 =?utf-8?B?ZjNoOE1zdTVvSW5pUi9LM04ybm9UR253Vi82RWd6SG1kb005dmQrVzdJYjVR?=
 =?utf-8?B?NVJDd29NL3VmMElpL3lTWlpCbUljdDVaV0haZUVNeGZGalhDK2dOOXUzY0tC?=
 =?utf-8?B?ZVcyYm50bDZDaTFWZlY0NjFFc0FrSFp3c2lSRmsvU3hXOTIvVUVsNHYrSmVI?=
 =?utf-8?B?S1FBTFZHQnVNLzVKaW8wWkZ6cFd3YkJwS09CcmVNQ1o3YzVRdHovUDNIRlBV?=
 =?utf-8?B?bGRqanNsSTk5U2lCby9rRkkvZE55MEVWOS8rOUQ0b1N3dm1xRTJUNHNSZXNj?=
 =?utf-8?B?KzBpVEtZZmV2ZnB4aHRocndZR09pQVczSHBGdnZTNUYwUjYzTHFLWlJBWVVC?=
 =?utf-8?B?Nm44Y2I2OUpoV2pQaVMrN2ZRU1Y4MnhUVytWWDVDMEhkWTlwTEY0NkwxTlA3?=
 =?utf-8?B?UWlDSU1IcTFEMit1QmxEZWozcEd6ekhycytoMEtLY0VhOHhRWVJjSFltUWpW?=
 =?utf-8?B?NWJQeHhXaENyVnhpWElWM2xKaVk5MTV6eUU5K0JjYkdzU1dWdkNXdFhHTHdC?=
 =?utf-8?B?RHh6Y05pazJJRURyOXk3OXdTMzQvSkx4SG5Pd0dKRkY2MXpySHpkeTFpSElQ?=
 =?utf-8?B?aWxVbDFyZkpTdyt3RE8xaUNydTl2Um1BSzlwUnhDSFlmRTlVN08yZVNuNjVq?=
 =?utf-8?B?dEVpT05DU1U1bXdRa0ZoZ2hyMHpGVGJBWTZoT0NFcjJVcWhndW5ZaEcwdVVU?=
 =?utf-8?B?YlBxSzVtK1JRdE5KMEJqeGgzTTJ3Vnpzcm1vSmV6Q2F6TTRmZzEzSUNjS0hG?=
 =?utf-8?B?cy96RFJCWGkzRWNGMkNEeFNGOTdXNWFZT0JKSVRzVG1sRTV6cnFIQXdzdnhi?=
 =?utf-8?B?VnRBTFZ0NEpDNGViT054blhtLzFMTDk4T2JuVncwQmRDeDZ0WFJRblFZZVhK?=
 =?utf-8?B?WWErN0tHeW9JY3UraGtkVzZGaytMc09ZMjZXY1NlaVJERHZRQms2aGtnVkh5?=
 =?utf-8?B?QTk3MDR0dVY5b2crMVdXYUdHUlpyaTdPT0ZZdkJneVcwWTNvOTBPM3ZndEN4?=
 =?utf-8?B?WExkQlRJdnZKQjU1WmQ2Zlc4Q1lpTVlDbmRDMGpQRllKR3gyeW5tb0MyNUs0?=
 =?utf-8?B?djVuUXErUHJRS3lYK2hkZVEzRGI3TW4vTUczRVkzbTl3L2cxMDVTN002NWxD?=
 =?utf-8?B?USt4dWYremR1Ri9Ha3YzVEdJT29QU242bHNCMWhQLzZ1UTl5NzdNRERtaVNv?=
 =?utf-8?B?QW8rL3NmMHBQUkNYUnpxYnhJYXpIVi9zRWJlZGhvL29lcGlpZEo0bEhwbjVR?=
 =?utf-8?B?K01JdyswaFd1MFpnYUNSWjVRMlM4SUtsRmZNODBjandoUUFkaElWTFg0TmtI?=
 =?utf-8?B?WFhucmJBU3A5TnV1SXBLUy9wOXZsUEhxUEhaVGVoRjhPVjF0Z1VmMkZlOGg5?=
 =?utf-8?B?bk1PZUdVcytUeWlrQWFkRlNaekw5U3VLQTRKQ0FFR3FSNnlxb2F6RDVENWxE?=
 =?utf-8?B?OXVidHljWVA5MmFvUUFIalF5cDJYQzhpdlBxaDFCVE5WdzJxdHJ2MFp4dmtI?=
 =?utf-8?B?M054VlVnU0NhMmVCQW9md2plOHpoNDNMUGpLZWVKTHVNckRLdkVtWE9UV2pj?=
 =?utf-8?B?dUd6aGorb2NIMkszQStKU1UyMGNNZEZqUUI3ZUpNTEFkRFF6YkxYOG9qNDJq?=
 =?utf-8?B?ZExpVFBQYlZZU1I5OWtjU2tOcTVxV1BCbUVCMDNJUGpua0NWMVFvTERJUzFV?=
 =?utf-8?Q?EZD3kNUGWew/JVLVTVoiWTuOxOu8UbYiKBdCtVa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af15d8ea-b8ca-4aba-bca5-08d9679014f9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 06:17:57.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+6AigPD9L4EpgtyqsI1ds9X9A3nZGvFt1/LPS508ixDGiyH97UKe5kKKK5EqgoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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



Am 24.08.21 um 19:32 schrieb Jason Gunthorpe:
> On Tue, Aug 24, 2021 at 10:27:23AM -0700, John Hubbard wrote:
>> On 8/24/21 2:32 AM, Christian König wrote:
>>> Am 24.08.21 um 11:06 schrieb Gal Pressman:
>>>> On 23/08/2021 13:43, Christian König wrote:
>>>>> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>>>>>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>>>>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>> ...
>>>>>> IIUC, we're talking about three different exporter "types":
>>>>>> - Dynamic with move_notify (requires ODP)
>>>>>> - Dynamic with revoke_notify
>>>>>> - Static
>>>>>>
>>>>>> Which changes do we need to make the third one work?
>>>>> Basically none at all in the framework.
>>>>>
>>>>> You just need to properly use the dma_buf_pin() function when you start using a
>>>>> buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
>>>>> after you are done with the DMA-buf.
>>>> I replied to your previous mail, but I'll ask again.
>>>> Doesn't the pin operation migrate the memory to host memory?
>>> Sorry missed your previous reply.
>>>
>>> And yes at least for the amdgpu driver we migrate the memory to host
>>> memory as soon as it is pinned and I would expect that other GPU drivers
>>> do something similar.
>> Well...for many topologies, migrating to host memory will result in a
>> dramatically slower p2p setup. For that reason, some GPU drivers may
>> want to allow pinning of video memory in some situations.
>>
>> Ideally, you've got modern ODP devices and you don't even need to pin.
>> But if not, and you still hope to do high performance p2p between a GPU
>> and a non-ODP Infiniband device, then you would need to leave the pinned
>> memory in vidmem.
>>
>> So I think we don't want to rule out that behavior, right? Or is the
>> thinking more like, "you're lucky that this old non-ODP setup works at
>> all, and we'll make it work by routing through host/cpu memory, but it
>> will be slow"?
> I think it depends on the user, if the user creates memory which is
> permanently located on the GPU then it should be pinnable in this way
> without force migration. But if the memory is inherently migratable
> then it just cannot be pinned in the GPU at all as we can't
> indefinately block migration from happening eg if the CPU touches it
> later or something.

Yes, exactly that's the point. Especially GPUs have a great variety of 
setups.

For example we have APUs where the local memory is just stolen system 
memory and all buffers must be migrate-able because you might need all 
of this stolen memory for scanout or page tables. In this case P2P only 
makes sense to avoid the migration overhead in the first place.

Then you got dGPUs where only a fraction of the VRAM is accessible from 
the PCIe BUS. Here you also absolutely don't want to pin any buffers 
because that can easily crash when we need to migrate something into the 
visible window for CPU access.

The only real option where you could do P2P with buffer pinning are 
those compute boards where we know that everything is always accessible 
to everybody and we will never need to migrate anything. But even then 
you want some mechanism like cgroups to take care of limiting this. 
Otherwise any runaway process can bring down your whole system.

Key question at least for me as GPU maintainer is if we are going to see 
modern compute boards together with old non-ODP setups. Since those 
compute boards are usually used with new hardware (like PCIe v4 for 
example) the answer I think is most likely "no".

Christian.

>
> Jason

