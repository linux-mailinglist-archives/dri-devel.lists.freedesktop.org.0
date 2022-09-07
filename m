Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3C5B03F8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E48010E704;
	Wed,  7 Sep 2022 12:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD210E704
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjHB3m4m0HuDO+AbpU5JM7BeOr9CyemzQBouunUFlLCYoXL0YE+mF/EUs/dfIctXFhb2/gZaJVvbvbyBZjsM+ms4Y9XB9MrhvkrWC0G8v6MoG/fnRK6qWmE8m+z3nWlz8dL8GM0v9NSDP3GkI84LeEeMBcqvGrRGAJCLPEowTpb2IL5V8Fs7qFw2nrHfJrOitfN8x2dFLCwZrQv82lvE84GsOkqtm/MHu2JLmt747i7NvlhAAgl3dixERMM4Daq5JP0ZsZZxODT1aNgMbOc4z+UtH33UixpEZQPKPe3BmWT5gMLqukhAvgILjhu5X4pHEG1L2jEH+C7sjG/HthOu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG/AwbAyhpVmmimR5vw3AmxTLnsINoVPBUNcOLCuOtQ=;
 b=PDAZt6UOb9Qt8ar+qFLhyiHM5CsyhHlf+TJkSPHDgNQJ74M9XVX7Kn3xKvwNfX3nmDOJauOzuXHX8zujhVEnjwGTFuA25l2I/4UdT8TvASinLpTyQyfYc7dGFK6mPDxlQywUj9XWeeu+lLUuvL2SDiKmGSi3h1de/L+z4zMb0T7V1z6kpf/U5RBoSGE4rWc1ylMHHwNS5mDz/naS4QmMVgYy2LQpsbTckc1wN0ZELF91cu2fv1owQyLrzdfwFTQNo6O6kYxvDtktwxDuimhGbqyn5ZfO02CyWTkRU9muLW7q2OVh9Fvwz+yDf4Q1X6YOzm5LjHnXQP3kx7FsZCj53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG/AwbAyhpVmmimR5vw3AmxTLnsINoVPBUNcOLCuOtQ=;
 b=NNJjC2ecbQPjH21OwDAjj9ESNmxJsShjBCn1hVjdvaPsyWApnrOfPZ7lWL0/7PtDCdVHYBfH96ceojIRyCVP5+QnkaFYvJsY1jkJrakWSDDtQZ+rDRJ/gkFv56R65nGgyz+nQGPeYaXzlU/W8IxNXIAfB98yoJV41uZmsoWFRnjd3Vkv077BpRxGKHnaXPvDJZMCLBtGc1iq0wTtGzyODVrj4H27PT2z4oyxs+96Au5+bAlry5p0NNcwFP/EkwbjnEDAoVeaXwxacYx2axosB7da92z3qQkXbwP28aKM0sgdY64RKyQ7phN0jxw9mjTaunNKwjAsSa4Bx0yjeOoEsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY5PR12MB6034.namprd12.prod.outlook.com (2603:10b6:930:2e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 12:33:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 12:33:12 +0000
Date: Wed, 7 Sep 2022 09:33:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxiPh4u/92chN02C@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com> <YxiJJYtWgh1l0wxg@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxiJJYtWgh1l0wxg@infradead.org>
X-ClientProxiedBy: BLAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:208:335::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cf01ec0-6b77-451d-570d-08da90cd20ec
X-MS-TrafficTypeDiagnostic: CY5PR12MB6034:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eO+Mqd+eiBAHMLRpx5MznnRyUephqZomkMmGZcUlPOY/v1SVqa8mCWR99iL4eQQaYUpRAxUArvlRNBkhgiC1m+2qhuOea0MXPIdFE/vi0SpKP4yaU9rVLR0PHFklOEqnhruVRajG6+ctoMm7uxd7cpxREbzpw/je20UZdi27QcuL1/PGkY/qfaoLZAvVmFqw0UlPq1VAvYYHBHYZ0ExM9d6tt/Skv7aCw0wU2gpmalpw6Seox+9vOho3ypSAqpuh0JQLN4ucDqD/ao19ha+/92RL/fzdYDUfNthR1I/0HXZheLOuBGA9EoTcShlvs7kuDWrtyxADTSKc06nqE3+Xie9T003mqN3llytGdySd4zDrwVfsJHQZ7V9oom9fnG199ygAJTkhaWv3TbEXZUVHCm0mvI3Q5LXDRDLxDqAgWeqjdB0nIGplVCxQssbW8F/XM6SlXItzTyyABd9CsUvKwKATs9WxDM/n5JLgQfF+GkGcFiMtDY8mNB61ynUvEz0KcjeeAPEcqzFfVN7ca0f87xbcl0qJ/05rizC6y9ubTKYFI0S9KO4Qe5/B2Hyr4lAlXsdPDAhSgVoi9M+1RZiA/OT83psL8g6HgJRWhhFYfSnopea1+hnsoBehP0yMpAX6wkW72FNLC5/7WRrDrhQASn9HJgx8J0+sZ98tiNiVNX9e3MYFw1aqT7Irbxw9GYXL+/UndgtlBsY+VSlrMYp3+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(6916009)(2616005)(41300700001)(5660300002)(8936002)(54906003)(316002)(186003)(83380400001)(86362001)(6506007)(6512007)(26005)(66946007)(2906002)(4326008)(478600001)(6486002)(8676002)(66556008)(7416002)(38100700002)(36756003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHS0XDKpskv5SYtewcMklJJVx8ZSws+mJhhD655Tvsvmo7KNUNr2cN170bB4?=
 =?us-ascii?Q?GbJIb4hqQg1wTL29dx498Jqw88iN2EtuqSjZBpWXMlOg6I6tLU9pw2lQg/Oj?=
 =?us-ascii?Q?8kWGjxIZT0mYNJ2IAf5Sbw9zCnGwqOTfv8t09DBGw4Q0Yqfbkj4xaJGQge0z?=
 =?us-ascii?Q?W+Rdw6hY29+XvimwVVuyhV7O8a4MgwB1KAdch4BvN57ohzuLh8vDwMJBKYw9?=
 =?us-ascii?Q?kDEb2+aJSZG1+WEk7LoHc22DKqnzdS5BeFJYjbwL49H8baHa9ZHVFoRjK75S?=
 =?us-ascii?Q?poYXECsFG5xYSJ5vW/tGd8H/uhnYTlYIY+pds9KPVpADfxbBC73flzDzk78z?=
 =?us-ascii?Q?FtX/OoblQzuOUSxhT507VWXL3npmU0XIMpZhDdh5AGps7iGkI9lpJBCXM80N?=
 =?us-ascii?Q?1pSDZDb0kTPShPHHu4xqw6G5exXoOutbVFN9RsyDaY0r4uz8jGYgjwmkLVr3?=
 =?us-ascii?Q?4iSi18BieocyMh+ip6JZGWXtKits1Czpv5hg1YU9k91M8E1CuggF9BSWV5WR?=
 =?us-ascii?Q?E+jFmD9zOHvsjXUi5MgsQZbJ8bBTpWftSYcz3v9fXt8j1RDZqdOCpNdvSB2G?=
 =?us-ascii?Q?IzwdpudSmCryvzp05af7w7PbWM5rm/ErU0/hhFrI5QeG+wn4yZol511NwzYY?=
 =?us-ascii?Q?TIgpbxOztRu3q/Rz55hBWKgKD7GgfDegTJ+eCDT9DI4CZOIAxEiLlvVFASA0?=
 =?us-ascii?Q?p82FEUi+kyQirQ0QIcWbxEZQOZ1kfvjvsrH23eAtq0pbUs0A1Q8J3Fkyb4tJ?=
 =?us-ascii?Q?TTbbHbfa+/OXosUk4n3pIBzFWI2AksvjzxxeMLCg/fT6hG0OmiFB0Pxueou2?=
 =?us-ascii?Q?SyVDw1QJvs3tCSC0ODdt0MK8b9zW/PMUUhtuG/GD63pxBX38r7k5t0hZ117B?=
 =?us-ascii?Q?0UuQ7BYo5SbJ9iiiCkZ4jZ/Y02jlpZ/QOeoYeWTqsGosvSN221SFFVwNiVfP?=
 =?us-ascii?Q?ezfJdq3pBClSl4+uaozzCu3gpSH4r4Tqt16HCgNcAZF50sQ5NexS1gDoMG++?=
 =?us-ascii?Q?X+EfMK5CemF1YWTI/z/ZUbMCaZv18E2Qny75KdWMUBuE+UsUWT5L1riDHsAY?=
 =?us-ascii?Q?FShyh8wNC2MJBR/HL0AIY5zFggJrI2QKVfiSxzznRG6xgIN2hK868QLiyMTX?=
 =?us-ascii?Q?gcNpV1qaq0zD4SoRwxgbiafNHym2ab8xS7e3URsG22f5Tos9yyeDoBRFeOSL?=
 =?us-ascii?Q?ZIsXCXRJOAAzLncKttP473jtxoXQVNPYy4AFVg4bUKAO21FmCm2wPRibWw3g?=
 =?us-ascii?Q?6K84e9CXd4QQr+pYq1i2lY/oY2KP7NWv/W8cwIfegD/YcWErm1/MouyRjMS6?=
 =?us-ascii?Q?sqw9yMuwt/vw799Ymo46SoGwmBJJInOVvPVwzVsjuYSFRVjXpWGOoK4yRF5e?=
 =?us-ascii?Q?bJS5sdn+0oG61n1z792j1yd+oL2meB2iQOzprlZmlcBeyDnO0pE6zoVsAPkC?=
 =?us-ascii?Q?LJpHYj/eftbpH44vx9EvMLjtiqFKPC7BuyatKxU02DlVSmJOmjur+HLYJoDz?=
 =?us-ascii?Q?35qYig8TWAP9xkILemBCX3AXdTJtloGByUOD9yOvm43mLLLm3e5iqhsy3ECa?=
 =?us-ascii?Q?7OuhJc0sWPEL6mt+T7leLlHs9TxHEsZpNoDVQOBO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf01ec0-6b77-451d-570d-08da90cd20ec
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:33:12.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHTudeP3QczpsbOaKHt2QTU0EwVl+2RQf/FuJ3N++QVyOEY31zPIBJA2x5wYH6tK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6034
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Williamson <alex.williamson@redhat.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 05:05:57AM -0700, Christoph Hellwig wrote:
> On Tue, Sep 06, 2022 at 08:48:28AM -0300, Jason Gunthorpe wrote:
> > Right, this whole thing is the "standard" that dmabuf has adopted
> > instead of the struct pages. Once the AMD GPU driver started doing
> > this some time ago other drivers followed.
> 
> But it is simple wrong.  The scatterlist requires struct page backing.
> In theory a physical address would be enough, but when Dan Williams
> sent patches for that Linus shot them down.

Yes, you said that, and I said that when the AMD driver first merged
it - but it went in anyhow and now people are using it in a bunch of
places.

I'm happy that Christian wants to start trying to fix it, and will
help him, but it doesn't really impact this. Whatever fix is cooked up
will apply equally to vfio and habana.

> That being said the scatterlist is the wrong interface here (and
> probably for most of it's uses).  We really want a lot-level struct
> with just the dma_address and length for the DMA side, and leave it
> separate from that what is used to generate it (in most cases that
> would be a bio_vec).

Oh definitely

> > Now we have struct pages, almost, but I'm not sure if their limits are
> > compatible with VFIO? This has to work for small bars as well.
> 
> Why would small BARs be problematic for the pages?  The pages are more
> a problem for gigantic BARs do the memory overhead.

How do I get a struct page * for a 4k BAR in vfio?

The docs say:

 ..hotplug api on memory block boundaries. The implementation relies on
 this lack of user-api constraint to allow sub-section sized memory
 ranges to be specified to :c:func:`arch_add_memory`, the top-half of
 memory hotplug. Sub-section support allows for 2MB as the cross-arch
 common alignment granularity for :c:func:`devm_memremap_pages`.

Jason
