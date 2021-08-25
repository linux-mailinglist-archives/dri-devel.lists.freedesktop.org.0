Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699333F7530
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 14:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B4E6E20C;
	Wed, 25 Aug 2021 12:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 172339 seconds by postgrey-1.36 at gabe;
 Wed, 25 Aug 2021 12:38:06 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1381E6E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVKSjxoyAilNmnDXrwahENGZoVSuPrVJgJbU8z1LQyWGfi+EfGQpx4Y1FpQjgX0N7cEZrPgyj3fM98WX+od8U+eE4w2FOW8Mr5Plhq0BTUC2lfiF5ToSMaC4Z6LKK3Nud7Ax++imYMBZybopW4Ynr9gE5Tv9HIxeg/CXt4ZXjVOgTUQ+KpkNAUzUwKkJelAEqlvqVYX6ikTqS42tQR0+6S3H78F7QmcaoaB7O2o29ryLxUxzuOgLcabBecqJAq5TQ6whRwoz+FCyCCCl1LHijLOoDTMyra2Kmel5rQw6K+Ta7+GovPm65oEQodr4gDKYMhSsBEXpu23nExpMOPaxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wA/QykVxwmbJScSmGXv9PeBBKbGZF31oOssGPfINyc=;
 b=iONJ3kDoIdVJjXap/7c7wxZN0NMdDhZl5aForahYmihBjtwaHn/l+zRw9I5lJcbh1Qi78yTYjKF+6thKDl7//yyQL88pnrrAv453Zo52xqd/soUjt6Rat9tpzLAUxGhhaVJcufBKpXVNeZtpILO1oMJp8KznKtoFoAA0nt+Ov6jSHZKFPSmvtkJjKVSzDfrSp1uS+3ievmCbFlKzJM7KjF+rAVRv9wzockUpH5WDdkuRxZdZe6TSv+wYeNovwpOl9gVRzHQGspbuP4zl5TU4V+MRCORKPE5eual3MEDpGliFYxwwA3RoL0LJjxkWU8yK6f1iu8MbFoay5zA2MvhdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wA/QykVxwmbJScSmGXv9PeBBKbGZF31oOssGPfINyc=;
 b=BFOWB4WCpBH1SgG1l9xXIsXpFtijRgikeIS5d/R7D2jikqzYq3fPHN+v0BKa/udqjCqWzpYNH5NczXbnLJ7YiEUePZ1LKvYdMCSWMGnHxsvgeZura+HQLn9XjsLZIheHR5TPxyWbmAmYGmrVxppPFGLKxDfJOKVs4iYRSmJYt9/Ua8pT60VUFUyciI9RKPUR0ZxlGzFNVPCUYMs+pOJoLXis3ISOmXk3ZXUNR6JAAeiHn64VX0Ad60d+CuanIyG1B9aLqeOSOWTkWHou46hSUEBVlzEUVIWOS8AIl2YLZO5TaBkUpA9TI0P/+7NvvLQiP8yF1HJXNl/4KT2iIDT59g==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 12:38:04 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 12:38:04 +0000
Date: Wed, 25 Aug 2021 09:38:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210825123802.GD1721383@nvidia.com>
References: <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
X-ClientProxiedBy: BL0PR0102CA0023.prod.exchangelabs.com
 (2603:10b6:207:18::36) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0023.prod.exchangelabs.com (2603:10b6:207:18::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 12:38:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIsAM-004spl-J5; Wed, 25 Aug 2021 09:38:02 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0fe0ee7-128f-408b-8d27-08d967c52e83
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55554895F7D15E8534E15014C2C69@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRKLJ4QwYs0MJ6Ji1MKFUtGPiZ1xUmmiFTMQGQYF9tTNQNlgaLHwXRWu74FQvHDCmLjdceAf71g8IIsBFGhpjkod83KFLxZYMJcDcDYdVHYtb/fKjT2MQ2l1OrtXSCqO2C9cpv4mZtuuwqo5gpCyLMc7hI/HrzT3KITizuQSJrKmnGS5VVl8KOnX0APIdOMH9p56UiQa2UoHKEkggdeWj1Oi4rmiDUzwzYtP25Az//u03+6X1SqbnEhU270JGD7zGIlJCsImsKNaLBaNuUyurinowfyc94NkMpp70nSuFdxiGksC83UNuRsnQbRPgux55v68/OoXCQ4IQ9iX3ABw0NLQvVt74TOEKB2u+RMnaGM9gD76kQXvYOVxD6NNJ2dPRxlFQTqAFDXGEzs8tA3IsyoHjaSBqdTJ4J8LFOQ9j75O3xNT54pIVTYh2asSNLCz0mJNiNXTZ4CtH4u0zRTdwedXE0B9cGlBjRJiEv1BWWBMt64/aW1WbpangJVxIKP+75KBZWPmbEWJqLqleEmpjkmPU9WbRufRwYnGRdTWdn8zayEvBuWnOE0SjlJdpvKXJjkGdMZOc/nmi5u7QYp8BW9AIJyvBrI4MYU1VrkI0H6760butoOB2EcRgu8k3EWdNOl0MAkGKORVD+x0tOFbGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(38100700002)(66476007)(66556008)(8936002)(8676002)(86362001)(426003)(26005)(316002)(66574015)(66946007)(9786002)(9746002)(2906002)(186003)(5660300002)(478600001)(2616005)(4326008)(83380400001)(36756003)(54906003)(1076003)(6916009)(7416002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHZPdlB6NjVRZE54SldHbkJjY2xZd0c4dFZwVUNyK3ZEOVRVWTRJa3dCdnpG?=
 =?utf-8?B?U2NjeC9MN1lWWS9LbEM3MW4zVEhnR2lyWVZ2U2doTmdEMVQrNlNMU1Z3dzBx?=
 =?utf-8?B?RndOQWpIckl1MkpxdzlqU0RSYmVMdVdYZWtWZzlINUZxV2MzdXRkdnh6UEUz?=
 =?utf-8?B?NDEwUGtCRHZFQW9PZUxKdTBseVpQMWhEcEsyRWhPZGFkRXlkcVFHNWNsbzVI?=
 =?utf-8?B?U3hORzJQZ3FuZXJkdlJ5alMyci9tNEg0dk03aEJqc0ZETlJEM01RYU0zNmxW?=
 =?utf-8?B?eld2a2JSSkdOekhjbzZhWlM4a29ncjNleHJ6bHlJaEJ0MVhNTjJZb1NENFZ1?=
 =?utf-8?B?QUFXRVc1NFVrU2p0dDNaZjNPbjNhdVBCWFh0cVBFb1IySjZLRGVwcW9mME9j?=
 =?utf-8?B?clNaeFVEOVAxbzk3VVRyMUp1dXVUUC92Wlk2VnlmcW03aCszcmlVTHM1QUpF?=
 =?utf-8?B?T1hsd3R1VS9rUjE0QWJWT2VaUmU2a2psVEJPcUk4Zzc4TjIwRkRYZUtJOGZo?=
 =?utf-8?B?MEErRStwdUVyU2s3WFJFcHZScE5UQ3V0SmswN3FhUW9CbkNHQUNFV2owVkxm?=
 =?utf-8?B?L1RlcDhGak5QdHRxRmxTQzl5TGE2ZUVDN0RMbkpWdFJOeUswcWhSR2YrVVJu?=
 =?utf-8?B?bUQ4amRRdU5ESGNjSUs1bFUrY0xielBnTXE2MFlzalZoRmJjR1UvdTJZc1dK?=
 =?utf-8?B?aFBiT3grbjM0NnpoVFZxaW9EenN3MkRMbnNRY3RSK1BmNXYza0xibjBPV0NC?=
 =?utf-8?B?QXlJRVc2ZDlQczZQd2lrOHdXVXoxY2d3bGdtcllzOXlKT212Ym9UUXptakN2?=
 =?utf-8?B?TFRkVVIza1M1TW1reDUrSzhRbXlHUGpoM2htN1I4RFdGTFZiNHV0UjdnaUlk?=
 =?utf-8?B?ZFF6dlB6d3NqY0crZ1NiUldRR0Q0TkNtaUhyNjRBWGVkakZuWVZodXZKdVNH?=
 =?utf-8?B?Z1B1cW1OYy9xTDZ2b0xTbGRYUndHRkMySDliQWtMQnh2dXY4OHhrWENiMm5y?=
 =?utf-8?B?U0t2N0xqc0d2dHROcnRad2oveU9jTkN1R29iU08zUzhDRTlFdFp5Ujc2d2hw?=
 =?utf-8?B?VGR4L0hKZzVOTGtlb2NvSGtHNmVnN1QrVDJUQzdTdGhCcUtObUtBYVlZZEpO?=
 =?utf-8?B?dmoxZENGcjVmNVEyQURmNHp0T05pZVB3RERuUFhaUkloMGhSeWcxZU9oRnYr?=
 =?utf-8?B?ckpPc2lWQ0ZLRHd6cFV3QUsyRVdkQ0tPOWh1emRxWGZDajBTUmZhUkR2T3hV?=
 =?utf-8?B?Q1k1QXlZV1hadXJVTkU5MlQ1V3ZXQ0xrQU9XRHVjLzFUUTYvNXNaNE9zeERl?=
 =?utf-8?B?bVMxclZqejBzT1lwOVhoY1RvTWpMZkpFM1BqYXNiUWlzWGlvNTFlNFhMWDBn?=
 =?utf-8?B?dkd1ZVJUVk5ERmV1TGVzMDZiWk9nYk5BcWF3NVAzY2JjRDJXMXIrNGVHUUJ3?=
 =?utf-8?B?RndiUU13bnBEb09pM3BzU3lhbHdVa0RrT1F5TTNvb0F6WlZEbU1zbHg1MGVw?=
 =?utf-8?B?MElSVysxTUhwd3QwZVlPTmp2N2RkUm03WWxaWkFaeHNaVGx0aXFBS0tPNGM0?=
 =?utf-8?B?NnhXc2JWYW5jc3dlazE2NkFMUmRDWkV3UjFJTkxjdndJUHdTazJ5M2tJSm5D?=
 =?utf-8?B?UHR4SSs0OU9SWkNpV1lpZmw1NzNGWnlueVA3WFdEYTFUNzVXdUN5ZmtuOE9Y?=
 =?utf-8?B?Q2NVN2ZQVW5kbHJ2eG9SOE1xNTRKR0g0WXNzbmkwQ3NXQlJHSkNDS29NRVBQ?=
 =?utf-8?Q?09U10APO8JZDab0TJ+JwX3yQ3Us0tPz5FQlGQBb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fe0ee7-128f-408b-8d27-08d967c52e83
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:38:03.9453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGPH/hBu4bRlgNE3C3znOAVEbv78sAbMEAJ3xJfEeJuE2STlMCrESM0UdFKLFRaZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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

On Wed, Aug 25, 2021 at 02:27:08PM +0200, Christian König wrote:
> Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
> > On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:
> > 
> > > The only real option where you could do P2P with buffer pinning are those
> > > compute boards where we know that everything is always accessible to
> > > everybody and we will never need to migrate anything. But even then you want
> > > some mechanism like cgroups to take care of limiting this. Otherwise any
> > > runaway process can bring down your whole system.
> > Why? It is not the pin that is the problem, it was allocating GPU
> > dedicated memory in the first place. pinning it just changes the
> > sequence to free it. No different than CPU memory.
> 
> Pinning makes the memory un-evictable.
> 
> In other words as long as we don't pin anything we can support as many
> processes as we want until we run out of swap space. Swapping sucks badly
> because your applications become pretty much unuseable, but you can easily
> recover from it by killing some process.
> 
> With pinning on the other hand somebody sooner or later receives an -ENOMEM
> or -ENOSPC and there is no guarantee that this goes to the right process.

It is not really different - you have the same failure mode once the
system runs out of swap.

This is really the kernel side trying to push a policy to the user
side that the user side doesn't want..

Dedicated systems are a significant use case here and should be
supported, even if the same solution wouldn't be applicable to someone
running a desktop.

Jason
