Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354EE3B0AA8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831E06E7DC;
	Tue, 22 Jun 2021 16:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA60F6E7D7;
 Tue, 22 Jun 2021 16:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXlrDpSHypmBlreLa0WeXFhcI6bVU+aHZrQI0aRhF5Cj1k5xkB4vWjNYI0L53IfVjgLmpcZ8pUCeke+hJ0O6xQwgvDnsUPE8DsHNJGoJfPEac47n5jd8eo9RJA4mxSo6R+KWrliisuh8SiNhc3BzVvyZOEtTeeneLBEL4VkJRsoRvYpfRaArQEbkvmrnvP9I65CX2j7qXruZRX8z9K/iR9VqZbUw2jFyLFdA+TpnTz/xPCZPDxKOi5a5hBnTylApfu9mTxpHDUPcC66r8rIOPsKduvHQ+vgptbhSB4rWArRYMA9oF/vtTP8j/lL6QH33mC0uUR0kYtyhwd1Z8PZurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QJk1RwjbJysXjmEtyuCw9B4HF0nTNPwhsXJgXcUKe4=;
 b=iSViKFhHsvMH8t+msvg6QZ04M1Z1L88bjBEQIzK58jeTBeKxvhL+9oLflgaCGOaiyk8HGx+hogL1FVZ0UHhdsVGS4kjSiW4hcWv0f8aTe7eoALzLYwJ6xbsLxTcq98vDIqdECOACCW0KGmIM5s24Xnhavn7pqHNyQ/jULxnya9rg4W82uvzYRjojbtcCHn2pC92T19e5vM4BJauPazhRoMI+93Tgij6W70hdmSCdW41s04RttqTyB/Ej0kFB4xr9srbUi0Ypktrwp1Vuo6CP3vMHmt24+meq10kczSiVTEq1viUpG3iW9MqS3/2gVXUBa688HeQFPUukCu9hLtDWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QJk1RwjbJysXjmEtyuCw9B4HF0nTNPwhsXJgXcUKe4=;
 b=1S2XLXyV3rDWOLDGutvQMK96gSyNBqp1ST2exTOM3xBUFl+1YowU7Pxk6qse6vnrjDLfUE+ZBn/IL7vVfW96vwyDkFYEzLxTvvrECrQbSv255pYz1PeuEcslBbmoaO1kmXgU/kwtZYoAgmcMHCmgjWGuWqpZ1Z9YwhNHmr739X8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Tue, 22 Jun
 2021 16:50:13 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:50:12 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
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
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <79470314-efab-4e93-b65f-881d5a26222d@amd.com>
Date: Tue, 22 Jun 2021 12:50:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.84.51]
X-ClientProxiedBy: YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::11) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 16:50:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98a839a2-3390-4438-3487-08d9359dcdbd
X-MS-TrafficTypeDiagnostic: BN9PR12MB5209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52097F315BC3A507C10D1D0292099@BN9PR12MB5209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgbReVCYVUXmFtnI8AuuEzODlnCSBvWk0PKJ7YKpS6r+Op3cDCD7uEyuffR8mdiJI9U+yb9yLiHZAXQqbOmkgDVQjMZN3atoMbRIrmQsFDc7ZEGCBgz+cdJPzmglPQ5IuiDnBh4s/kHMMCaPxxFKUBl3wOIpzM3zWR2W816AYC4NfoSwlZNw2QrPef5bZv5VOg9XFza3Hv7ZBPqaVI4d+KJdmBBOf+LN3xzR5P7aQuwNMBEygI6PFRfEv6+j1Sjn0vkM4CQVBtk2ZpHc1IP4kfFJbZIxgO8EVSFAVF7A/btUyO9yYErFbWoMKf3KaoAHoEqU9qbcgjjkjriuNGz29wxY/dvmHScEvqkUsNdNmFzCMRTWYyJ6OKZvE+6rNkiS3hPnWQQLnd+MBsxbb6EZIJXAFIeY0iLa6opC/xviePKrFFXTxrkw1oojfyWV/02SLENHKXiyLlIaWpXOBhxjCr8vov0mGksh/YyE3pGJJ6b2ApW6FHw+ddWFlBdZ5DFdkd6IxjnR+CBXSY0l9e1rZwMe4dVMFEnXX4qlpD7XyIMc8oFt0Yp0uJctnqFCkGC9iD296Y/3Czfx3RtxMCiOzhqCGikxnPXRF04l80vX0AlPpTva6mlS9F2lqa7iLHyRSiB7AS7BRZVc45g2OtA3n8uSk2MW7F/i+06MQidst5PPc42fbFIHHjrEtuchNKu/XDTrhC3NfQi8CRsieW5Lj9DHLWO/4h22hSF/ZxE/R/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(86362001)(31686004)(38100700002)(5660300002)(66574015)(26005)(66476007)(186003)(66556008)(66946007)(83380400001)(53546011)(16526019)(966005)(316002)(31696002)(2906002)(6486002)(54906003)(110136005)(2616005)(956004)(4326008)(36756003)(44832011)(8676002)(7416002)(478600001)(16576012)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdBaTJUMDYra1JtMVZZWlRMMkhNUER1dElURTZXaHphNDFQRkhEWk5xRVl0?=
 =?utf-8?B?TCsyVmN6TmFNcGhKdUpPd0lZOHNkdmVpck5nKzFEcTlwSGh5UUlNV25vd3FK?=
 =?utf-8?B?RjA1Q0JZRWFiQ3kxdmcyZjBIeDZ3a3Rza0hVMi9ITkF0MGRTVkhWbExOUHlD?=
 =?utf-8?B?bXh3Zk4rVEZVcUc1M3ozcDdXdFVPdzFBc0RkQjRTZkg2dHpvbXlydGUwZnF3?=
 =?utf-8?B?ZzUxb0dpL0ZySHlZSFAxR2Z3d2dNa01uazkvM3hRaVJvOE5YY3ZacitMSGZF?=
 =?utf-8?B?N3BlZkdJNzdXTGJJN3JwSE9WcXJoSzluaG1SN0xxTG1sT0hQVXhTRkJmdXJu?=
 =?utf-8?B?M1c2S1hWK2lpdVA4Qmplb2krV0xRck1hN2pBSFVNUW5tZk1qN2kyUzNNSVRr?=
 =?utf-8?B?QXN5Sm5VeWw1Skk0cHZDeDJ1ZXNocDVrSjQ3bEJZV3dneFExbmdERnB5WWhF?=
 =?utf-8?B?TWVadTEzbWNxenF1TERZSTNSTGQ3Z0p6MEQxWWVOYUxSUHA1Wi9PZ3Azc2FB?=
 =?utf-8?B?WVYxSTNsUE93YUMzZjVLTjdyV2FaSlV2aEhYZ0lJUkZnQ2RDWUt3dmdkYk1h?=
 =?utf-8?B?ZHJxMHl5dHVXQXpUTmV0UHUvdCtEMEFOSlZlallBVDgxSGE4bGRmeEVMWXIx?=
 =?utf-8?B?UWhwRDkzTzdmYVpLaXZGYkduaGZ3YkJtWTJBSEVRV253U3ZHNnlTdzlVdWdh?=
 =?utf-8?B?TzRRYlRkWDF1b0pLRUs2SCswbWVPMTNjbE9LWm13RVBKaDZad2pPQnZUNmVS?=
 =?utf-8?B?SURnQ2grcmdhWlA4OS92QzllOUtsWkhxMnMrZDhSaU9iRGI4NGhkMW1Iakpl?=
 =?utf-8?B?U0MrM1FiaEpQcVZHM2xKTDNiZU1JWXpnZThlWFgzM3RZVEwvckR0ZmNtdWZR?=
 =?utf-8?B?WGRic0pJUVNWbzFZak1yOXJDbGRpUFpWQzNaOFkwdElnLzIxbzgxY3ZLNlF2?=
 =?utf-8?B?MllseW43cGZiaW9HWHNQU0ZTbDMrb3FuR3h3c01rdlBvZmtCK0l3OXZzcytW?=
 =?utf-8?B?QVY2ckZOMDhvMmkvbHR0c3ZoZVhIZm5Tc2xXTGpLWWE5b0gyTHBFRnhFMi9X?=
 =?utf-8?B?d2tRN1UzUGl5SzVFK0xCeWl2b1BLaEZITE96QURTYTllU0wwMGNBLzNSczlJ?=
 =?utf-8?B?NUtCVXBNaEpNRHA2ZUZrREFidkNiY3JwL3pKT3BBVWJTVlRYRnE1c0Nwbmcw?=
 =?utf-8?B?WU9rT1RybUNKYXNFZ2MwbWF5TExOSjkzUUc1aDVYQWtlS2RibGFtWG9raUUy?=
 =?utf-8?B?MzZqamQrNGdQWU5hcE9KQlN1cjVPcW9oL2Iydk1yQmNlREtPTUxUeUsyUXMy?=
 =?utf-8?B?SHMreXFxS1M2d1ZxNWRlaHBSZXUxbGZlcFAwZ1pTc1VUZFlJeXN5RG9aRjFG?=
 =?utf-8?B?RW1pYncwdEx6d0IzTkpGWVM3Sis2U1lGMWJwc1pjcDllYVExRkthTmJLRE9L?=
 =?utf-8?B?Vk04Q0FFdzNPd2dyaVhUalFOaGxIY3ordk1veDNjVTlWNlV5MzNkN0hrRHVI?=
 =?utf-8?B?NXJBb0JEZWZuNmI2TGlrb2lXWjdPQkI1ZlRScVd0T05iSHdUODJEV25nQk41?=
 =?utf-8?B?c2Y0c0ZaR0R2SUgzMjR4NEM4bGtrREEyRDQ4MmdwOGp1eHlEOFBJR2VwWnNl?=
 =?utf-8?B?RGxBY2NZeGp5UEVsYkkvejNFdnBaNjBYWmE1SFd3ajhZa1dEUFRWYThMVnhN?=
 =?utf-8?B?dlIxandqVUxudlVIYTE2SmtzOVFndnp0S3pNajJmekVDRVJRU2U2TDhRcStp?=
 =?utf-8?Q?6HypWNisYqaKRbIbmFRvnhZPW5UUpnX6JPBFaCm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a839a2-3390-4438-3487-08d9359dcdbd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:50:12.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CrZOaypcLzqq5pxXAqaagXPuZ3PJDVIJ4amdYnQ2JJgLRLVIwOYysNqVv0I8SteE9sTZinsalu67GoO3KtmCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Oded Gabbay <ogabbay@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-22 um 11:29 a.m. schrieb Christian König:
> Am 22.06.21 um 17:23 schrieb Jason Gunthorpe:
>> On Tue, Jun 22, 2021 at 02:23:03PM +0200, Christian König wrote:
>>> Am 22.06.21 um 14:01 schrieb Jason Gunthorpe:
>>>> On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
>>>>> On Tue, Jun 22, 2021 at 9:37 AM Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>> Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
>>>>>>> On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
>>>>>>>
>>>>>>>> Another thing I want to emphasize is that we are doing p2p only
>>>>>>>> through the export/import of the FD. We do *not* allow the user to
>>>>>>>> mmap the dma-buf as we do not support direct IO. So there is no
>>>>>>>> access
>>>>>>>> to these pages through the userspace.
>>>>>>> Arguably mmaping the memory is a better choice, and is the
>>>>>>> direction
>>>>>>> that Logan's series goes in. Here the use of DMABUF was
>>>>>>> specifically
>>>>>>> designed to allow hitless revokation of the memory, which this
>>>>>>> isn't
>>>>>>> even using.
>>>>>> The major problem with this approach is that DMA-buf is also used
>>>>>> for
>>>>>> memory which isn't CPU accessible.
>>>> That isn't an issue here because the memory is only intended to be
>>>> used with P2P transfers so it must be CPU accessible.
>>> No, especially P2P is often done on memory resources which are not even
>>> remotely CPU accessible.
>> That is a special AMD thing, P2P here is PCI P2P and all PCI memory is
>> CPU accessible.
>
> No absolutely not. NVidia GPUs work exactly the same way.
>
> And you have tons of similar cases in embedded and SoC systems where
> intermediate memory between devices isn't directly addressable with
> the CPU.
>
>>>>>>> So you are taking the hit of very limited hardware support and
>>>>>>> reduced
>>>>>>> performance just to squeeze into DMABUF..
>>>> You still have the issue that this patch is doing all of this P2P
>>>> stuff wrong - following the already NAK'd AMD approach.
>>> Well that stuff was NAKed because we still use sg_tables, not
>>> because we
>>> don't want to allocate struct pages.
>> sg lists in general.
>>  
>>> The plan is to push this forward since DEVICE_PRIVATE clearly can't
>>> handle
>>> all of our use cases and is not really a good fit to be honest.
>>>
>>> IOMMU is now working as well, so as far as I can see we are all good
>>> here.
>> How? Is that more AMD special stuff?
>
> No, just using the dma_map_resource() interface.
>
> We have that working on tons of IOMMU enabled systems.
>
>> This patch series never calls to the iommu driver, AFAICT.
>>
>>>>> I'll go and read Logan's patch-set to see if that will work for us in
>>>>> the future. Please remember, as Daniel said, we don't have struct
>>>>> page
>>>>> backing our device memory, so if that is a requirement to connect to
>>>>> Logan's work, then I don't think we will want to do it at this point.
>>>> It is trivial to get the struct page for a PCI BAR.
>>> Yeah, but it doesn't make much sense. Why should we create a struct
>>> page for
>>> something that isn't even memory in a lot of cases?
>> Because the iommu and other places need this handle to setup their
>> stuff. Nobody has yet been brave enough to try to change those flows
>> to be able to use a physical CPU address.
>
> Well that is certainly not true. I'm just not sure if that works with
> all IOMMU drivers thought.
>
> Would need to ping Felix when the support for this was merged.

We have been working on IOMMU support for all our multi-GPU memory
mappings in KFD. The PCIe P2P side of this is currently only merged on
our internal branch. Before we can actually use this, we need
CONFIG_DMABUF_MOVE_NOTIFY enabled (which is still documented as
experimental and disabled by default). Otherwise we'll end up pinning
all our VRAM.

I think we'll try to put together an upstream patch series of all our
PCIe P2P support in a few weeks or so. This will include IOMMU mappings,
checking that PCIe P2P is actually possible between two devices, and KFD
topology updates to correctly report those capabilities to user mode.

It will not use struct pages for exported VRAM buffers.

Regards,
  Felix


>
> Regards,
> Christian.
>
>>
>> This is why we have a special struct page type just for PCI BAR
>> memory.
>>
>> Jason
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
