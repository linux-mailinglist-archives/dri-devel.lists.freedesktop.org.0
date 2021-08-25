Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE93F7566
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 14:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAD96E212;
	Wed, 25 Aug 2021 12:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1746E212
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STl1Vk4FlnptiZzgjxT0GRGzzb8mpwxUjFc2f4XskTOxPosMMPnW69SJRUyqJZK/NUJ6cfA7LHSV5xG4QPN62l6phrItZZ4RMRtqoHgKIVgd8jvVG8UTYuL+Vs/r1kJT11Wk+fzIKGK48q2GiBBrKny8J7mRel/x6+NCTA70A/h8hryujXycyr2vdJI/KEz43zN8qBALG3sL9WfJh0B+s0n5VcfP/WgBca+HurcgAqjXw/qBwatEonYrd/g2XX5AEANTDwXHBQPx6whPELXbNQAJtoL10p8B+1enIuRhLZkQNybNuokd1tXy3erHgLsJ9B5hkoeemLkD/LLKSboDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ml52sVTKQvbTnRZ9M+5hW9T/l85b2oSs8TP//zrJRM=;
 b=BeS1s8WTL6S2rHkJCchLDliA/oi6UCPm6caohLPyzD6Dz29PZ8PDi2//WzddBoj0yxzygbSDN9+/zp1eSbqAR5cy7kvxF9cF7hX7nsGfY7gN0X3Q+2CSbZlDrQrNvPlSkuKjN+suXYIhjpK1lEtFOVgrVYCoWuahaEwUPPWo75yomjkHntKZ9D97WgaOoHAw3Sb0PMkTuOEA2u3QAxCY+t2If5xXrIDkbwKy9kBKT+OR9yHPj+tQdndyAv6fBWrGdkp71mVe5hDrktx9ZmuhmbfCLrl5Q4sMXuoRzRaHvZFD8ZQfeFhZd39ahtQAproFnpCWWuaZFn3w9LKcnuVMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ml52sVTKQvbTnRZ9M+5hW9T/l85b2oSs8TP//zrJRM=;
 b=U3fcnB0ELx5zQ5THggDV+qrXbK3pyixYVUlEMCtXRMbOurXdZQu/uKv9lz3ZBWOmhRRE8DbcCUo8APfM3UoP85ErkTUwzn0uifIGdUmTTQtXN/1mDbDM4/WuUJ/OEZjNCPz5xyjt0OanwY6REYF1zKYoHd4r8TZyGewdfBNVR2eR1uJR4Yed7zO0xTXInUVXE+x6q8maj0faqfi7XZQktvdaZ6S2FUEAzU4tRBBPRgdKJyigRmQYC92hx6tRbLoBuf3yqTwaXPxhWozpZMjeZ+WWGRcxMv5Snk2oSHMn9K1jXHudl4ugweu9gPrBIpvSTFT4ep9a8CkVQJeHJYE/bg==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5159.namprd12.prod.outlook.com (2603:10b6:208:318::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 12:18:34 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 12:18:34 +0000
Date: Wed, 25 Aug 2021 09:18:32 -0300
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
Message-ID: <20210825121832.GA1162709@nvidia.com>
References: <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
X-ClientProxiedBy: BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 12:18:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIrrU-004sY9-Mi; Wed, 25 Aug 2021 09:18:32 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0a6bf21-0972-4e60-c0d6-08d967c27525
X-MS-TrafficTypeDiagnostic: BL1PR12MB5159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB515904A4BFF8876199914058C2C69@BL1PR12MB5159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jafOpewWunYo3aVUJXRi40/2w3WTqVaotCsRR09TJw8Cv7dzrQYLrq+2/Y/1ZhOZoxlGBVYKRHi0FckAtTrmaOR8EI+ZW8YoZGv+THTPVksNTvlYMNmjQUyjZO2nS9U1VxGuqRUV/9NmWE+HT9WqBuW599zqcE1sa2JyH9Lahx0CqACs4Ez4lLdnD5qitMsGy09qiM6ifJA0F0gyIiKwUOAbgYh2oDikfh/O4fEACA8XLNNzRsilcxIg69Ld4pqnO4uvhKo8s7oxr7e0BYzj/pGNSEVWE2yHZGBkxfP7+di7zQXO7uGjQyYs32voxsCj0JfegGgoEGI1lRxjToJ7nUbSju2IeZVFtfYTZ7275cDcCONQaZL/D1d3VLKWe15EjOYASsDOmQQQFR9SLNWqq2v9o2cCF5iB4B8HQ3V5gfcZWo2N3NbwKAU5Z4e0QDydSC8IsApl3mW1wtglydy1xSD3M/26YNdRT6wiJVcwc18z1dtYPNZ/LERbih89cs4VWE0ldfsVjXf27WFnPxVv2KxxaXHDwuKpLstRCSeFZbqts9+pNAn7ffUgTVQDyg44SIrJ6GyUSmou0zitphdtykoy4pt3dNfQZiISZ5bhz7F7igPzvj1Cwd8BI3l3NgYVuEh6pS7DsbQRkgDnro+t5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(1076003)(54906003)(316002)(8936002)(2906002)(9786002)(7416002)(83380400001)(8676002)(36756003)(66476007)(9746002)(26005)(6916009)(2616005)(38100700002)(4326008)(66946007)(426003)(478600001)(186003)(86362001)(5660300002)(66556008)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lHRTZLSnFhNFdvVmU3MWFSRUdLVERrNmlaSEh1bmVMc3l4NFZMTHVYbUlj?=
 =?utf-8?B?bm4zL3pmZS9qdnhjeWpYSTBNUDFLRjJweVlPVmhXVG4rWUJBS0t0VDA4Zith?=
 =?utf-8?B?MHozL1VlM1NVWHBlWUZJa3kxQjk4MGlxWWhUbXlPam0yRjdWMFU1cTM2UG5D?=
 =?utf-8?B?Uk5UU09SOEpuMmtiVlZZSFhvWThIbzlXZGRhcXJWc0lFZnhib0N4eFRIemFM?=
 =?utf-8?B?OCtta3k3S3ZKNDVXMTdBVlVjRnhnSVpTLzRzZk1raWR0T0V5am5KdS9BRGF0?=
 =?utf-8?B?a0FyWmRDYW5aT09sbmp0WEhFZHRoT0s4T0xPL1owMDBiSHljdFdldjJFc1h5?=
 =?utf-8?B?cjdrRmYrY2U0SXJYblExdVNOaUppOFd3djJGN3NjWVlwTGZXbTNtYldXeXJx?=
 =?utf-8?B?QzR4ZmVqT3h6SzFyRitGa1poMyt6bnhFWGFQYldpV2hMSkJRTmVEMzBWUVlD?=
 =?utf-8?B?SFZpRzZVZWxKQ1dRQ0dOOEc0L2ZISXRMaFltcXE0NVUyd24zaWNNeklOaXY1?=
 =?utf-8?B?cmtzdXJJQzJFOE0xcDlxOUdIZGpVWFVNS0F5a09ISkc3c1dmMVdSd0ZVYjdz?=
 =?utf-8?B?UnpuL0tkbG1UeUlyVkxLNDhwSEFvNDZpcWNraXdBRTAyQ3BqOE9EcWs5MnFm?=
 =?utf-8?B?NUl2QzZuR0kzeWdYOVNXZitDbUIrTURybndiU2dXS3drQ296SWdaNE9zZkpV?=
 =?utf-8?B?NGlVVnk1cGdud0owODZRK3loR2pRYWFZZTRiakFla1BuMjQxQU5tOWlmc2ll?=
 =?utf-8?B?Yk4ybGNjL3BPcXkzeHVaUy8vR045UEFVMGRWUUsxZTdsdkx1ZDJINXBTMVlF?=
 =?utf-8?B?TEJoTUZrb0M0Vm83SHJjRllYL1NUeU53dGJXRExZaEFhU0xpbTFUQmlJVy9h?=
 =?utf-8?B?TSt2aHM0TG5mRHRTc2pZbnEvZ2U2cmpVVk51Mlhsck1pZG5YelluVlVmaGh6?=
 =?utf-8?B?QmU5a1JEa2JZNjY2cWVRNGdDQ25HcUxaZkRNLzAvWnNJTHBxT1RJK0k2UXNL?=
 =?utf-8?B?T05zSlF2eDFwZ25YOTBtODQyKzRJb2pjakU0akxkSzh6ME14dE1WRlFMUFN1?=
 =?utf-8?B?SFRtc0VFUE0zWWRZUVE2Y3FPR3RLdGk1aDVFa0FQYzZhZWJKOVNweG04U3Yw?=
 =?utf-8?B?ZWdOMUtZaFAyWnQyTGJKeFdUSE5EdHdhYzliaW85SmV5Y2RrNENzUFQ5bGd2?=
 =?utf-8?B?Y3RTTi90RFB4bzBhN0Jyei9ERW1DM2FDcS9JeHBEZVcva2tDTVQ1WFExUlcz?=
 =?utf-8?B?TktodHd5ZnNIODBEZWE2bmNxL054SzdrSmlVWitweTFoTTRldFQ0VE5jWkRj?=
 =?utf-8?B?eDUxRDZBMTg5V0s2UVByWjN2SHZYbmpGWVdEY2Y2UlpKQWFXWjYyRG1VQ01v?=
 =?utf-8?B?TVdGQ1M2UnYwZDRrTEduck1DM1prM0ViejZHcVRTejBHRkk0MEJtajlBZHBt?=
 =?utf-8?B?bFJIQTJoU25SdnJFcktPbzhobml1ejlyV2lvclpXU041SVhXeWxTaUdmZHo5?=
 =?utf-8?B?ZUg1REtOV0hPbmNYN3FZTW1Nc3YzdFNHZ1cycjVEL1BEcFNmUTl2NEFZdm1w?=
 =?utf-8?B?eGZkZ0hqK0toVk54YmVqNmZhbEdUZW9OOE5uNzlOZUsxMFBrTVNZallyQkNt?=
 =?utf-8?B?dlRGQXFnRWF0Tnl4VzdIMzRYMXVmb0xGdVk2VmZjenNwZ3RkOFFBZ2ZaZ2Fj?=
 =?utf-8?B?WmQ1cExHMml0SHEwNi90b1JLaXQvN1Z4amNwbisxTVZCeExsSUNWWSsyN1cz?=
 =?utf-8?Q?3DIoJs18aTMHZXc+Ymu38IYpGEotM5kro4q1MEf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a6bf21-0972-4e60-c0d6-08d967c27525
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:18:34.1567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMBCd4sE+h1evta+0jXNpG9YmlPFLMildPIZuAozEN4SLXpCr6wdiOdQf7W/tpr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5159
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

On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:

> The only real option where you could do P2P with buffer pinning are those
> compute boards where we know that everything is always accessible to
> everybody and we will never need to migrate anything. But even then you want
> some mechanism like cgroups to take care of limiting this. Otherwise any
> runaway process can bring down your whole system.
 
Why? It is not the pin that is the problem, it was allocating GPU
dedicated memory in the first place. pinning it just changes the
sequence to free it. No different than CPU memory.

> Key question at least for me as GPU maintainer is if we are going to see
> modern compute boards together with old non-ODP setups. 

You should stop thinking about it as 'old non-ODP setups'.  ODP is
very much a special case that allows a narrow set of functionality to
work in a narrow situation. It has a high performance penalty and
narrow HW support.

So yes, compute boards are routinely used in scenarios where ODP is
not available, today and for the foreseeable future.

Jason
