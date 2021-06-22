Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8783B0982
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A347B6E5B9;
	Tue, 22 Jun 2021 15:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30286E12A;
 Tue, 22 Jun 2021 15:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5tBhlBSYjNZbI/zf/7vysRjpy75ZvEaShUYEZREuF5VL7W9B9MtE2g5ZJBvUcoWk7v0r0eSun1nA1yAJ0Rz4et90X1I56Jyv1U+uRf22tsjqxx/6tf8W0WGniFDekffwmuzoeqDos9ZeBpbHt+ywmHKZyjWN9F6a1LbvbGQTFrHgct8AbQ2SkB8OWQhQR8MeAIN0Afi3iwNd61AojEagvnA2ZReQGsFyzM9jWY2qv9u8FG5dYfR6IcZ2RVY/0MBfkqPuxkd9IdUFFdz4YwkITsPEA/ATN89RcrGUgrNpCQp3qWVKT2MhfOLaWLR8x9+durunUjpRMm5YPAqvtb84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqEqg5oG1AmMqysj+dkXr23s4LdPufGwPeYjBwMBtOU=;
 b=O64Gy8cyiErE15KxRfrEpOnlmenCStZFAomyhUWyG+CvBTEQMf+lQvqNzWXjkRFOMprLip5+4Na/DH4kShg3lcYxd2tuNTNGISEozAP6S/4gSbyscFiYSOwUPbMWPm29RK0Pxt++PsUXFPqf5Wiw4woPf7iksGXfs01ll6hQbcrEoUtkocvQZxTOt8LKl9WpMAmZU+zxyMiJ9wsDY9XO9IcmlwB3fB9xY1wNM8ue1qNcN0YsbZuXjx7aUKpEZCYIBy0Aa46cJ+FtuJLCNmqHTTYWxfPAsBD45/Me1qz+og9C6hC4RafD8g3934SofsVuiKyAo/J77Ghz2ZWR+2dMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqEqg5oG1AmMqysj+dkXr23s4LdPufGwPeYjBwMBtOU=;
 b=oSGjxf8gX8L9NgKFgWCZA/OPIQ00ylz7OOU8IC35umSFJTUDY1PG5/TKwz6nat4cv4gCFg40vB5UtexJjOy0RmCiMC9Eggro5j5nht8pmfLaCHpjnHINudJq7T8qEYf3/alU3dpG+LX3AKqRGgffo9ckCk5pLMMecCwpKcWJRUU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 15:49:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 15:49:49 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Oded Gabbay <oded.gabbay@gmail.com>
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
 <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
 <20210622152827.GQ1096940@ziepe.ca>
 <9ff1a7ef-a5a4-dd80-6f19-304b668d82a1@amd.com>
 <CAFCwf13w74qFDchEsdCAtpOvnYkzvcsU0RAdBLNGJq-e5srfHA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f59ca863-a1c0-0793-99c8-60674da0bfb6@amd.com>
Date: Tue, 22 Jun 2021 17:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAFCwf13w74qFDchEsdCAtpOvnYkzvcsU0RAdBLNGJq-e5srfHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
 (2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 15:49:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f995ab9d-c51f-4ab0-5f65-08d935955dd0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43420405B485323D01CF5B6883099@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /n84YUd1P9lZXT26/qQewfFMXoIQAF+ioW/ZwPh63A6W9IdR7UQ2ZEa1mYd1PqRC15unfz+j18FguCSYTe96Lu//k0HDylwiMr/QGXP2UAZyaX3xvvemQ8pkg1CAc50FO0dicn5/hxkMY1HAISbgCQVrGwgJInhgglD+hfYXVrp59w811yUjRRMV9FUFTt0EyQF0+QqhRD/HB5ngXGBa2Y0jl+a7IHwIocLWB/iF2uTpFtzdeuT5433SnVcMcPo+cLPKaIcI+ZajSbtbO7JsRVeXe26mbA+LCcPP9ZhZa1tH6PQWh9bEbzaIQ3eb6sUGHkagTd9TyFT7/gogzY3lsDM/KL+YzpzvpF8Oe0oLBhFavHfBWHaGmXN99TdP3WdSgUtzD49l+9RFq0eJMYMjEimaXJMvp3N3H5lWMgDTtwCJz92YbrK0wlfymfzCkN6g+M5bxJ3mikHYGcQ/l+9iw4N6NG8ZipGH1ulZoKTecitnEyKLeVx78enVjC/VrwFzxJ7E59enk2a0CcCvIiyJwNBZxG1/pqmzFlclkJ9djZzUua5q7BxCJ6P1WG32hhgDJ21pc0QI49x0H5pw2nyk5Rm4ps5On43s2RQp6kMoJxFF3ztc9/U5MOi/XK5uVPN/gJWvGvKXcjcZdk3lBc7bp7M5RMTPz1wLQKLMx6a5f/BPHx0dcK9IgaUnYxD7Ldcc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(53546011)(4326008)(7416002)(31696002)(8676002)(2906002)(6916009)(36756003)(6486002)(8936002)(86362001)(16526019)(6666004)(2616005)(316002)(38100700002)(66574015)(54906003)(31686004)(186003)(66556008)(66476007)(66946007)(478600001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czEwRFpVWDc0cnBZRFYyWk5PdFRZajcvMEd3clNqN2JiajhNRlBLWnJ1dlNI?=
 =?utf-8?B?VldtUjNxWGVLN0g3em5GeDhIRXJRZ0JYM3krMzBkbG1seTNKenBmSFVKQjdy?=
 =?utf-8?B?NFNEUVFTd3l3dEFxYnNDTmk5U0Izc2sya1BaeUh3MnhsWU1YL20rM3dJdU5B?=
 =?utf-8?B?R0xHaFo4MVVBTE5PTDd2TGd4QkdybTkwQ01sOVdmcW04dm10MWtiZEJ1bHh0?=
 =?utf-8?B?UjRIekxRRWg3d2VjK2FVdUFvZG5zaGx2WXlMVkV1ZW8xNkxSQnJhckNrOW8r?=
 =?utf-8?B?SUlIRmNDV0RacWR4cWpKUGw0VkdwNkxPOUdzQTZlWEJSdTE3TTlkNUJqWEdU?=
 =?utf-8?B?VzhMcllUL0F3WnU3QzU5dHpyM1E2WEdKQm9UTUhFMDFXcGt0Q2pqUHdLL2lr?=
 =?utf-8?B?ejdacUQyMTVrbVFBZkZyQXFWdWlCNVUrY2N5c3ArTXhkWmpyQ3NkOEJGbmF6?=
 =?utf-8?B?QjcwTE9ySEk4MGIyejNpazl3d24yMTl1Y2RPWGlWeFV4WUo4am8ya2dSZGxh?=
 =?utf-8?B?RlJsa2dsZi9uN09YbnA3TEUyb09vbEIvcjE2SkxPTmtpa1V5SDBlRjZIWlIx?=
 =?utf-8?B?MzVBZElIZWt0RnluNUhPREpFaVIxMVBPSHJhUDdvU2o5aXRKNGh6QkZ0K3hS?=
 =?utf-8?B?clh2d0wvVCszVDkyYms1eFBaU3lpTE1SUytYMGowbUpUaWRBVUQ2d1hxcFNY?=
 =?utf-8?B?Tm4xNWRFZVRoQ2ttczBRajlPdFVVTlRUclBKUjM0d2xoajhyNWN1aUlOMFdQ?=
 =?utf-8?B?Sk1FMDFrdlJyVjNSNHJOMVZTNlAwTkoyVEc3UW1ZQk5nYVJsaVpoK1VLTGZR?=
 =?utf-8?B?UkhiaFAxak44eHltUG9tNjBMaDQzYkFFa3pCdE5EMURUNHF6RWc1QWowNG5U?=
 =?utf-8?B?YWNROFQ3NVdDS0J6ZHlRNkNOWmUrckE5UUk5cUVncnlZMk14OEVHRmJGdngy?=
 =?utf-8?B?eHZqbzU0QndRcWlSVVV2bzdOTk1EQ3lkYk5MOGY5NGpiVFFWTzdWMVZvbXc1?=
 =?utf-8?B?ZHVRUzRNblpWemNPSzJLaDJWVk5zQTNmMlRBdCtxR1B4U1ZkYkh0QzloSHJN?=
 =?utf-8?B?UEFMTnlIYlNvdEZweVQ0cEd2K2gzS1pEbkhnKzR1WEVTU0VBZ2VpakxaQ0NQ?=
 =?utf-8?B?ajF4K1JUSzNJRi9ZeTN2UWptVEc2V0Nwb2YwQTlvWndSNXZoM3hoamliamJM?=
 =?utf-8?B?MGhFMm9qNVVsLzU2WTFHNUcwdVU0V3hNNGduejUyVjU5U2dKUno2WjdrS29J?=
 =?utf-8?B?Tlgvc2Q4UXl4VXE3UEprNFJhMy9SRm5yMHFnWllET3dKMVlCWUpzSWRtTkZ5?=
 =?utf-8?B?eWMvOHlObDExVnBKR1EyOUx1NUI4VVpES2lCcFVCNnlvWU9DWnc5ZlpSSTJR?=
 =?utf-8?B?L21ST1NCMXB3QzlHV1pLQ3lRQlZrak1zbFRTZmdTdk9wWWVDT2pDNUE0Q3BJ?=
 =?utf-8?B?NzJHc2hKVUdZSHdGWkE0Q0RuRkk0Szl4NXdXWnNpYXpQcTFYVHIxUys0aTkw?=
 =?utf-8?B?a09CeStVWXIrTFI5RVloNUJBU0MvVGRnRjBWdVY1YVVGZXlKVWxQR3ZEZUJl?=
 =?utf-8?B?L2padENxK3NPTk1YVDRUZVNGWXZsMXFaNktoSDdYRHlzS3lSdkRaeFpZdW5z?=
 =?utf-8?B?TW5Nc0dkbG5BL3RnUm9OcXBGd3FCdmloZFgwT3RyaTVKN01vNnJYVERJbXVB?=
 =?utf-8?B?d3AwTzhCN0tsVmZlQ0loVzNlc1FqM1lZOS9Xd085a0hteXB4RTlXN2M3M283?=
 =?utf-8?B?Qm9wWHB0TFhHRHRQWnhPWTA4UDlsbjAxQWNtTVFEeVF0YlVvc2JLM1UzMXNr?=
 =?utf-8?B?OUt3VDA4QjEyQ2xXWEs3a082MXFlMDNwVkxPVncvWVFxRkdXVnFWTWRMcGFO?=
 =?utf-8?Q?Wdh8j0tZ7q8q2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f995ab9d-c51f-4ab0-5f65-08d935955dd0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:49.1651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SLy/i+pdOdEMTo6HjITFkBJsAv8CTurY1ccgqV827HoYHi7eSQci43doa5JJk0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 17:40 schrieb Oded Gabbay:
> On Tue, Jun 22, 2021 at 6:31 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 22.06.21 um 17:28 schrieb Jason Gunthorpe:
>>> On Tue, Jun 22, 2021 at 05:24:08PM +0200, Christian König wrote:
>>>
>>>>>> I will take two GAUDI devices and use one as an exporter and one as an
>>>>>> importer. I want to see that the solution works end-to-end, with real
>>>>>> device DMA from importer to exporter.
>>>>> I can tell you it doesn't. Stuffing physical addresses directly into
>>>>> the sg list doesn't involve any of the IOMMU code so any configuration
>>>>> that requires IOMMU page table setup will not work.
>>>> Sure it does. See amdgpu_vram_mgr_alloc_sgt:
>>>>
>>>>           amdgpu_res_first(res, offset, length, &cursor);
>>>            ^^^^^^^^^^
>>>
>>> I'm not talking about the AMD driver, I'm talking about this patch.
>>>
>>> +             bar_address = hdev->dram_pci_bar_start +
>>> +                             (pages[cur_page] - prop->dram_base_address);
>>> +             sg_dma_address(sg) = bar_address;
>> Yeah, that is indeed not working.
>>
>> Oded you need to use dma_map_resource() for this.
>>
>> Christian.
> Yes, of course.
> But will it be enough ?
> Jason said that supporting IOMMU isn't nice when we don't have struct pages.
> I fail to understand the connection, I need to dig into this.

Question is what you want to do with this?

A struct page is always needed if you want to do stuff like HMM with it, 
if you only want P2P between device I actually recommend to avoid it.

Christian.

>
> Oded
>
>>
>>
>>> Jason

