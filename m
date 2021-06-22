Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A03B097B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4F46E5C5;
	Tue, 22 Jun 2021 15:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA616E12A;
 Tue, 22 Jun 2021 15:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxe/cj7pvun9rmAF61DhgiaH/FvtYVkMhZUaaq5AQYbiWo90xeb3rmd8hPkeqNFUtVUAQDJK36gVnVNfBfMfy9s3HHoKDA55xv0z/P3FN+CBDlNiF/78mhm1O1hMde3nSNjMZE2aM2dftu2zaRThr7kawQh8Xn1gwQauQN5HGipfVdMAD+8xUr2bPaaoHDmvCUiKZaD+rVJbTRLiW9KW8QT8LkUcFCnj/bzXqVMpl2TmC9d8mWcW10PA6fNhi4dZvdViXUyomhysyxRc9xvuqCR5zalt2Mnd1z+cVCpyDhNt/FctXLnh2x8XTfiW+vlShXb2OV3A3R3AoaPmq+DMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPTJpISQnqD3gZcSXTJlLX8Jccr3Fpi0Z/IreYE4IH0=;
 b=NPsnxRtx7GtvMJjou3e3DKtjMwYdE2s2fM0q9btttdFt1/ZsEtYieTQgtseXMHl0oe7o1r+WtWQ6ISG9nCOewMkWvxANX2vELLphO9BC0getFLw36rlLb+fsp1xqgSeeeICaFI0l2Vb8xtFiUyN0GdKlH8hMeavAYTjIX0gFp9o7M9v+k3ETlh9Fc+8hnESQztTlIr0gENoicM4cjSyWJIcaNH2Y11TXAqpN29U3Zob5f5t5n+XF08U67jXj8j3VF2NwE5Nr/r45RVoF45lqUUinaiU2SIWsqxgqFN5hBZn9qbqYc1m0QbhTfb4nyAbY64lNwfb0n81biEyVNAuN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPTJpISQnqD3gZcSXTJlLX8Jccr3Fpi0Z/IreYE4IH0=;
 b=DCszl1WIo7xsWilkm6zGM4wzk4eHtxozWxa9YZ1nW+c6yNB2Iq4L8JJ4HvpoEHXMDf1LUIfEPGBv30JiZL5Ox2KKVISkuQRlvFK0xaZgWEHNMVseGf74ITZHyJ9KmsvhQSm8d5BCUt0ZRB/yQUCVpojOlZmVtWa212RX/jYTS48=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 15:48:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 15:48:17 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
Date: Tue, 22 Jun 2021 17:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622154027.GS1096940@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
X-ClientProxiedBy: AM9P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
 (2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4) by
 AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 15:48:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3395fa63-e6cb-4d26-4dcd-08d9359526f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44081F8386742C6168FC35D783099@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cV8GeCGKC/kF5WK+IBhOySUZLGAM+WL9fnXTa7OLQ1PJlOayLpUqSf6om9hRT51Aqufd4M/fWJWAw5IdO1sdTMDtrULQMEuFI3qoFOe+k7d1Q3UrSLZL2cooOd5A/Fruv94eVMEESTJtPS8cmPQeBM04gtZr+dsjE4Tn8k6nBVdljDHlZFxGQzBu7SMJyZRChNB4zlnA9+blpIoJtFsmNv3/Iq5T2GEe+hbGEc83xuWwAFTfjh6z6NBtKlj3YlgloK9fZ1c82TZ7y2QpAkPRZJ1dUJCzSxHSOn3HsZSxgG52Elcd+QtzfqJFm75QoF+IDhTJ+uNe0Ws3/79oQVrEWf9XH0fWuQgkptkQ64pCB36ETgDF4NOj0cOxThDD4xm3uotneMjImjFq2+gm3OLsYRVyTZ4bVMsjtGVdpMaSKGY9rRMVvn+82iNLj1YZIcTOU8mAUwkGy5M2SeocY7IckYSz9jUl+VT/9uqP6a7/Cwq9yxvdWYnVoZCK7UxhmeJ2prbZHKwKjTRRGhwGru/QOUavWi+jnuXs4Jrry5aNq7auOtHYyE9FquJYLT+PWsjy3WVFqDV4NzRUbwH8Zk8IFjdL16nnCJKv/CS6QZ7XAGJR4cscU2bkxi4uX5WhY9aRkqfZBxve5Qiz+3eR0SD6cit0wpsPzXThqrInt7ENIpqfv6bB872h1CbXU6kyug5b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66476007)(66556008)(83380400001)(66574015)(66946007)(186003)(16526019)(6486002)(478600001)(7416002)(38100700002)(36756003)(4326008)(2616005)(31696002)(86362001)(316002)(8676002)(6916009)(6666004)(8936002)(54906003)(31686004)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lZK21WQ2xOR2ZaMmViN3d2ZEdJWmFOMzBXb05nQkNLYWFjdTcxY0dVR3FJ?=
 =?utf-8?B?UWZlL3cralRXaUFEZzgzOEdIMll2NWNMZ01LUGpqZGhveWRSQTJQWDNxWWNF?=
 =?utf-8?B?Q0s2QVlrclNXbStoZGFzZWlzdnNyNHF6bWY1aEhSYVpLNW40b0ZhK2tCRXFI?=
 =?utf-8?B?RXAzQzRBU0xoTENQNTB4MzJPL0tlVjhoQmQrcmpPTHJ0SmVSMVV4Y1k2MkQw?=
 =?utf-8?B?Mml4SnM1YlNmKzdRWWJuNXZyOW5oQUFhVHNmY3ErSDVHYkVEejFqenFVNS9V?=
 =?utf-8?B?ZG03ekVFRHNpdkZGRGN3NnB0MG5DMUdTUm5jSktlSzFjU1c0cFZxM0FJY0Va?=
 =?utf-8?B?RUlZeFZlaTIrRVFTNThhVjI2ZGRGNWtUTFRYQTNQb2hlQ0FkTmJvcU1ZWU1p?=
 =?utf-8?B?QXNQakROemY1K0xDWXBPd0JIR0RMN3FKMml3YldnQ001bUFobkdJTEJ2elcz?=
 =?utf-8?B?d3BXSG83YjBONi93d2Z6ODc0c0w3UHFVNTRCc045SHZFUk5HS0JxaHQ4Smdz?=
 =?utf-8?B?cVJsWnc5Um9uVmN2K1hjTGx0V2krem80ekFhUm4zTGpheUpPY0d3V1NWMVRp?=
 =?utf-8?B?azlRaDdBM0NsVUt3bXBpcWhDY0w4ZndXL1lERmY2T0JoVXR0QmZTK21tMnRO?=
 =?utf-8?B?cldlTkpZbTlGaDY2WWl1ckZhTWlTbmQzQTJvT2lXTkxwQjhCcXpoRUk1WVRt?=
 =?utf-8?B?ZjNKWUFESXBCTUtKNDVrQU12bUwzNjhFelNFZmlqQm9ZcnJJUXhVZ0xxaVhX?=
 =?utf-8?B?bjBWdTZDelB6b3RpZzZKQ2lhaEozRDFiWUdpUFBHRUtmYjJxdnZ2cGpuSXdh?=
 =?utf-8?B?YkdqWUlaRTM0cklpS0hLZm1QYXFPdGtyUWNRM25GTHl6aStOTXZDZW95eUdx?=
 =?utf-8?B?SWRaK2tXZWpSZ29XZ3F3aXkxcDZkc2JaNUptWitzWXVGWTVVbHdKQmQ3MnA4?=
 =?utf-8?B?Uzg0bU9iUnRPMVYzSFhLSXZRazAreVd0Ri8vTXJ1amp2SlNOZjYybkdNTG9E?=
 =?utf-8?B?TGhyWHczV1J5ek02UUpueGNQNVpoWUpqa1RxU0RKdW1wNm05SGJGV05tUURI?=
 =?utf-8?B?NmQwRDFwQlJBSnZvU1ZiV3J4SzFsS3Y1YVkwVXZvSURsV1F3R3R3aHpZSDds?=
 =?utf-8?B?SHJncytGQ2kvN3gzOEZWVmp6RW9aNGFSWHlkdnIxcEZCQ1duZWt3UkQ5WmRo?=
 =?utf-8?B?UjRMS2hQbSs1WVdmVnVIN3AzdlR3TFhrdGg1WEhZVjJKVkpndEpEeVNKTXpF?=
 =?utf-8?B?eFlGbVdIUkM2MjExdHlOb2RMVW5rNjlPSnFWNFIybHUxYlp1MGM0RGk1djlL?=
 =?utf-8?B?WXR6UW85Z3FhT3B3dVU0VE9RWW9MOGxDV0ZKQ2JLWlp2U0tvV2dWMndyMVdl?=
 =?utf-8?B?KzZnY3RxeDdicDlSRGE3QXJDeW1XSFdMUENTdWFnYWR4bGlvUStLZFNEZUdT?=
 =?utf-8?B?R2lsM2dOcVRjOHFiVi8yRGVPNFVLZThZbEVmWE9RYUdySDhldituU2Q5SXh6?=
 =?utf-8?B?SEZGeGRRMnF2bTFZd0U4S04wY2swMGdKRURjcXRDU1BXOUJxdWxNZmpSWGpi?=
 =?utf-8?B?VDcveVFEQzZUb3E2SVJoYVdUUlNCc3VveVVHODQ2cm9aL3BjM0d3T0lXbEtU?=
 =?utf-8?B?RTZKTmdBSFFSU0pQd0J5UW5sM2w0b0dTL0xsdjFwaitaN1kvZERwdWJaOFU0?=
 =?utf-8?B?aDhhOUhQZWNKTGpxWTRURWc3WXVsWFYzeGU2U2tVMHRhSkNuU1JpOUtTS3lT?=
 =?utf-8?B?dHF0ZFJTbWdDc0ZBVWJjWGtXM2ptblYwWUdVVXQzeHkxYTdwVXQvY0liTDRW?=
 =?utf-8?B?clZHUzJ3T2JLclZlejdUMWExR2w4by96aE03OE9wL0N2MmNua0ZhZEY1Rkp5?=
 =?utf-8?Q?bHUDbm942OQSY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3395fa63-e6cb-4d26-4dcd-08d9359526f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:48:17.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfpL3pZakjzj44UxsEvJYgAa4+zIS9tmhy6c9gYQ45QfHmb659QSvOodsGg8dV1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

Am 22.06.21 um 17:40 schrieb Jason Gunthorpe:
> On Tue, Jun 22, 2021 at 05:29:01PM +0200, Christian König wrote:
>> [SNIP]
>> No absolutely not. NVidia GPUs work exactly the same way.
>>
>> And you have tons of similar cases in embedded and SoC systems where
>> intermediate memory between devices isn't directly addressable with the CPU.
> None of that is PCI P2P.
>
> It is all some specialty direct transfer.
>
> You can't reasonably call dma_map_resource() on non CPU mapped memory
> for instance, what address would you pass?
>
> Do not confuse "I am doing transfers between two HW blocks" with PCI
> Peer to Peer DMA transfers - the latter is a very narrow subcase.
>
>> No, just using the dma_map_resource() interface.
> Ik, but yes that does "work". Logan's series is better.

No it isn't. It makes devices depend on allocating struct pages for 
their BARs which is not necessary nor desired.

How do you prevent direct I/O on those pages for example?

Allocating a struct pages has their use case, for example for exposing 
VRAM as memory for HMM. But that is something very specific and should 
not limit PCIe P2P DMA in general.

>> [SNIP]
>> Well that is certainly not true. I'm just not sure if that works with all
>> IOMMU drivers thought.
> Huh? All the iommu interfaces except for the dma_map_resource() are
> struct page based. dma_map_resource() is slow ad limited in what it
> can do.

Yeah, but that is exactly the functionality we need. And as far as I can 
see that is also what Oded wants here.

Mapping stuff into userspace and then doing direct DMA to it is only a 
very limited use case and we need to be more flexible here.

Christian.

>
> Jason

