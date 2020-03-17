Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC4188728
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211F56E513;
	Tue, 17 Mar 2020 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E089FBC;
 Tue, 17 Mar 2020 12:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA9+9FWPG5BBbVYfqO0eHMStq0+XwW+bgy1nqvVKDT5efP/hnUYooKtVMr5+wu9EJd9hzbAanBas/7vg1a0755a7tNIxuhI1G88sbgzZJld07HwKHma4wtH9atxDi/Al0aqrypmejdYG0U4hGZZ7J/3PsteV+KU6E9BFgyqJAWKno64xRFWYrdabWhw9qD1C3r056NILi71KvvVSn0w7DC7HhkqXdUG4ul8VC4FX0vcFfjE3hKOW6MYbsyypVJlfMtQZRzt594oY4HuCvIr6s4BCu0QKB5ydaCUR/zjylkusPnghMyrbvjL/0ym5U6jwO1WLtDjrkjwhsNCnJR0qnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhFOJwhVS4C4zGqhbseb2cyIncf/5Y0rJpV3SyOAtMg=;
 b=L+HZuKjf3kK8jgZyl5zJ7WARLlZ5OBTF1hfhfzRfmQy7EL9sg2Vmq9He2ujRnMRSlhXStEAauQdbZppDrZMUmAlWaHLSDCsfPUUN2BfNv0Fs4cu+OtCdid1Hu1UpnCaODk6g0+gbI6lDgfSMyL7JNz5SPXUHFhn56HHVAUIqetnnIqRcSlrXzOn3bYV3xeHTOoiRSyKJMw60ChjncYkwRR6lx/vGYkHwBrKXwNq7GkLW4yDAMrSXaUg7aYiU8o4/yh2/T+ExICOEtWgvnCdI4NMXTZa48MykZwHleUeOckFC0HVYt1tcf+1alfxcQAqrqmKkxjPyLAZ+F3TxAIdb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhFOJwhVS4C4zGqhbseb2cyIncf/5Y0rJpV3SyOAtMg=;
 b=M8BhtuWnocJChgCAfCWZbqvb1SIj7yEfds7ruQqVZIPd8gCjCV3Y+l3JC7GrZkqMJdQpXfo8X2gg5mbSS2Ly9+YYpilcUNZj4cpdJsBw9e0TQUUFNWpX6UwgNchVokuEojVdytZ2Os7K4UqtiWz8uM/uvrkSsISqxoH8OMJBA/E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5919.eurprd05.prod.outlook.com (20.178.204.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Tue, 17 Mar 2020 12:53:24 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 12:53:24 +0000
Date: Tue, 17 Mar 2020 09:53:17 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault
 in HMM_PFN_SPECIAL handling
Message-ID: <20200317125317.GT13183@mellanox.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca>
 <20200316091347.GH12439@lst.de>
 <20200316121053.GP13183@mellanox.com>
 <20200316124953.GC17386@lst.de>
 <20200316130458.GQ13183@mellanox.com>
 <20200316131201.GA17955@lst.de> <20200317123210.GA12058@lst.de>
Content-Disposition: inline
In-Reply-To: <20200317123210.GA12058@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:208:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend
 Transport; Tue, 17 Mar 2020 12:53:23 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jEBif-0001ab-Lr; Tue, 17 Mar 2020 09:53:17 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 763f1206-35fe-4611-2e9e-08d7ca722da9
X-MS-TrafficTypeDiagnostic: VI1PR05MB5919:
X-Microsoft-Antispam-PRVS: <VI1PR05MB591930173C92C619CF5C0B2BCFF60@VI1PR05MB5919.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(1076003)(33656002)(66556008)(54906003)(86362001)(5660300002)(66476007)(186003)(6916009)(52116002)(4326008)(66946007)(81166006)(81156014)(8676002)(316002)(8936002)(2906002)(26005)(9786002)(9746002)(478600001)(36756003)(2616005)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5919;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXUuHIcn87HLm7nCqxikf2g4W/WLHR8Q2fzJnl9xCbrYnaWi69BUuq90LAJRyxXTm/Oq5sM+9weAVPj//9Y1N1xWP3UnplrAngDmIEYcWPIdtSeeC1gAusBmcP5FEjaiZ1LxUPrP7FLcmm7PErZcW8u64POlpUN8dbXnZ3/RpQZM3GH9bErMEXGdd8wdlepniwlNblG1FjnppHWEraAYm9sCkrcRu/QGFvcf6eyp7WVfsiG7ts+OVg50lsvAHYjqqzHJNn8Ik9wBQFUz3F4UQwXB4hHkT7bc+KjcuUu7ZsszzKNtC9Pv3+sPJxIQRa/xMqGmxhWri9k6C0u4OFdmFIHSvyxIt2iXB6sIkM9LR4t3cFL7U6Her6VX6E3B+R+HNPpevFH0evjZZvt+YTvVvDMOeXp2n17RThZjxWxRJ7yNbtcAFPukPX5Uo2lfCAMorFH7wu6agtImmlT7pFYKpR/bnI2077kkgfTGnV1+ySgIT4ETorXJb8GYidJeMEwy
X-MS-Exchange-AntiSpam-MessageData: IrUpqfPISOJy8sHkkm+NhLYq+J00jcLo8lIFy6C+52drrfd1xtI4Bkr0IAY/yxyg1dJ9Q33A9qjC2gPowVVbHpqIE0tGaNgXhasmMNMiHeqVmwxZLOh3XVzaPE88W7e0A88UvyyaVroAafTjXY5VGg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763f1206-35fe-4611-2e9e-08d7ca722da9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 12:53:23.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx+C+43WiGQxZVwUuj1vSrktUhhJEOO/xXEkTz5Ij9xnCMZiqweokgowa5wHlcK6SEqD6dIud7n3p50exA7l9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5919
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 01:32:10PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 02:12:01PM +0100, Christoph Hellwig wrote:
> > On Mon, Mar 16, 2020 at 10:04:58AM -0300, Jason Gunthorpe wrote:
> > > > Ok.  I had some cleanups like this based of older trees, but if you are
> > > > active in this area I think I'll let you handle it.
> > > 
> > > You once said you wanted to loose the weird pfn flags scheme, so
> > > before putting hmm_range_fault in ODP I planned to do that.
> > > 
> > > If you have your series someplace send me a URL and I'll look on it
> > 
> > I have a local branch I just started hacking on, but it is rather broken
> > based on various discussions we had.  But for a basic one I'd suggest
> > something like:
> > 
> >  - kill HMM_PFN_SPECIAL as it serves no purpose
> >  - split the ->pfns array into an input flags (optional) and an output
> >    pfn (mandtory) one, using new flags for the input side
> >  - replace the output flags/values indirection with a bunch of values
> >    encoded in the high bits of a u64, with the rest used for the pfn
> 
> Thinking out loud a bit more:
> 
>  - do we really need HMM_PFN_ERROR, or is just a return value from
>    hmm_range_fault enough?

I'm not totally clear on this. The only use for ERROR is to signal to a
non-faulting hmm_range_fault (ie shapshot) that the page should generate a 
device fault (ie device SIGSEGV).

We can also handle ERROR by having the device take the fault to CPU,
then fail during a faulting hmm_range_fault and then dropping the
ERROR indication toward the device.

If we already know the page cannot be faulted when we read it it feels
natural to return that too.

I have a patch, that now needs rebasing, which removes the PFN_ERROR
from the faulting cases. So only non-faulting hmm_range_fault users
will see it. faulting users will always see an errno return.

>  - because if it is we don't need output flags at all, and the output
>    array could be struct pages, which would make for a much easier
>    to use API

valid and write is required for the non-faulting case, I don't
think flags can go away.

Being able to do a non-faulting hmm_range_fault is going to be a big
performance win for ODP, this is my interest here.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
