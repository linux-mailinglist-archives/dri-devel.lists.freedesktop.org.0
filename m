Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405273882EC
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A356E6E08E;
	Tue, 18 May 2021 23:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24D76E08E;
 Tue, 18 May 2021 23:03:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyWcuoSmIrOHazYuE/+rOin7h8QzgD8tb//XDrUNh7tdDECdG4eesWoUcU+BSdaLzVm/qP9clbbRYJRL3yTNyq7JaEM2wZ7PbMCi8BQHoeuVB6ALHGXZZtOoQDQfuDlHy8wbYXARw1XYf0iF17twDjOVrguPGdTcKCT+5w0OmvGgUfkcs6OHyhl9TTo9EipL59xz028q9sBXRjE4vux3KkHiLBz3DhT1dLEwwfFaRRaHq6hXgw8igPt376SYOWyoeVmAWjXHBsa7kVwNGvr9eP6wbOWEBXlPcdDk97cCRvuOG4Sjq3VX+sIhBzFTsz+XqE0+FZe4Dr4mykMSUieZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3IdNSFiUnrRT1x/bsOS120s+m2wuDnGHTEFgMv8S+E=;
 b=OIuGjkOdd/Iiynfb04LCLXDirFyu9IvMlpqDElOSWe8+GVA7wNNoHlazJs2XWutsqjPpFC3Eq9Ru7FC23qAHbnpbQepJ14xdSWBVeaScKELkf9/Ppfwwg7MemfOzi3ugGG9xoX0OZtDUPxEG51ZJ/DXsOiK0Y88K3isLrkjEIQXqY93qjL/CKUO8o5yv7D5iK5V0gMYA53+rr+2tEeSH6pNumjZWC2N7Bukq7lWWmZ8yM0ppBXTSfOc6+LQj/O3SXz9Kqk8B7kC2oSxD2bz6N0GfS1UVNaMIFoKhnmIfoD2MJ9Vm78a4Yfc0tRhqUJSqKbk6TIBBG0IDFzpBIclLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3IdNSFiUnrRT1x/bsOS120s+m2wuDnGHTEFgMv8S+E=;
 b=o06ber1whiLSdl+NjxFVil2rC6xYYmRgj6+YI/gxLad8zbtEAUgS+lAPDWHiShdU+3uArF3CZqQFDARyil+mGwp+0tz17upDnF2QHvAsouo2TwhSbA3E6FZjY+6qn/Ou2DXx4ym/6q8E83D9bfcUBeqRQoIh/9mpPaRvlD9M3e3u84eL41uBRk5w/DuCxkoleIsr0V5lsFjNaN5Kf0akJALpu1y6cuZ9Oq4xSkK70+4BDX+M9SQrHnlt66OomVK1U0IssQIGIMTuXTco8BqS8owda3GLj1X8iOd4lskeVobS4hFGc4Flkuo+I/uvUX/W4DDI9Ee67IncxiRb37EIRA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2858.namprd12.prod.outlook.com (2603:10b6:5:182::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 23:03:30 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4129.033; Tue, 18 May 2021
 23:03:29 +0000
Date: Tue, 18 May 2021 20:03:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <20210518230327.GG1002214@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKQjmtMo+YQGx/wZ@t490s>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:256::29) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0024.namprd13.prod.outlook.com (2603:10b6:208:256::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Tue, 18 May 2021 23:03:29 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lj8kJ-00AUDU-VE; Tue, 18 May 2021 20:03:27 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edce9c3d-2ee7-47d2-1ee6-08d91a5126ab
X-MS-TrafficTypeDiagnostic: DM6PR12MB2858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2858E661E3DB8252ECDAF608C22C9@DM6PR12MB2858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVAEG2RA8ZiBycRMAF8K+XAnmDyfsZKqJJMURckFRgzFV+9ihfOL1Il1y0xumgadfy+/ysZbUV3KtPS9xuhR6MVQUtj2iafr3SciywXdjaGf1NetwHd7XRV7DauHxJKmcHwZdUZFTKq5WiyoXx0UVu6CXVGRuY7nCRyNXt6S1DDSc7IszCxmuUHWT45O2QynMV/1wHfwV2Ks/iZt65ivqpb2FM6ajIu1QP7sECYEhVN1XUNlXUMlBtKjScXl7aKxV1etKtVmU6vHVCn5FDBxmESNDBa9XfL4n73KDNCrznIsX5DXrT6XiFuXAmEVBVah2nExUII8/E7C+vqCKGpgO6MLh9dsNaDCtp2xH50Vxmf9UeEfvsFmKdccQyGy/D6QTIo8WknYQPRk1nRVTEuS/u1f8zNhGGoo2myobge2dUNaStICyjigCPlLUe23U0ET7OMXKXYG+0+jEu8df0z/jLZSxR98vyMt1f96A7lnW+WcDR67owfq0X52iyR+mhaRppW5vGOS0AAr7i3k/DvbpxwFYqORcOnCYm9tuFcgR048fvBomJlkeAtgJCihmyLCCIYRkhumH4smVCMWLpDvG70LAWXxqioDkGazbIQYJz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(66946007)(86362001)(66556008)(66476007)(478600001)(33656002)(2906002)(36756003)(83380400001)(5660300002)(9786002)(38100700002)(426003)(26005)(2616005)(9746002)(186003)(54906003)(6916009)(7416002)(8936002)(1076003)(4326008)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M9+lTZt6fQD1XpvJ/adZSiTHZeNJDq7QswWvPVkYfKveuFMXrd8h4NMwilme?=
 =?us-ascii?Q?c5ak0Y7KZ87tCVBZqHA4jhVcKwumCfgFjNm5HBBwCkK5JpKmXazvgnxazdUT?=
 =?us-ascii?Q?4rYVxDaHU654S8q1Eu3P4mtQ9q8ajUwgaRaOoPurAQkZzGFJJQRmbEuxxIbS?=
 =?us-ascii?Q?bHIjOZpltYMRQtVKm7g8r24hlQS1NJ/qiB4T8KhgHw4Ah3H26e7WBt2xjzig?=
 =?us-ascii?Q?ADheUOXro5s6xRpI9/J/BzHMnHLc7DcyiP1Ld04BFkVwInVc9B8ujUivXJ+T?=
 =?us-ascii?Q?wJWblNNVrrd1Sv+36Km8f6gqNuMnQsDTARwmWgMTGj6JB5ysPdYw75UUqflv?=
 =?us-ascii?Q?apLK56RVaTVkgbAz1xol1MrmT2toCCBabehfHFXP09lU2+kMZhz4t81xAB0W?=
 =?us-ascii?Q?9sm1RSlABqeuBq7hzadAcZVk5GkB91nB9CfmdPjf458Fu5MabRPaM126DJVm?=
 =?us-ascii?Q?b+DFWlsdGVQyrqyxseeU1Fro/kU1Y6qGhnICOYeiRGDq7L1v1gpAAaxNirsH?=
 =?us-ascii?Q?9lWxMr6cPFGa3LzkqjxXIkiUhJQjhK9k6xxa433+l/iGh4lae9L//Ubh4lU4?=
 =?us-ascii?Q?byHd2vsFYU0YAlKwN0I+McqtkmMOiwEq0fIp9OCcghtM9TGYuLEhKwMTLdvO?=
 =?us-ascii?Q?kgKB4SDcn//lMbMDBWq28NL8/CV+Qi0IYBflfHDyeecbovl4PWIZ6NSSr1SN?=
 =?us-ascii?Q?495F/+0k17H5TW4VNsUXcRazrWY4Z2/LnVmdklFG1oVKsB8/Z3PxTVE8qC5u?=
 =?us-ascii?Q?DWDo89S8SEYOVmBEbn6zq9jeZk8qhwIFxiK8+J5QF39f6kJKWuaXMR09nBDv?=
 =?us-ascii?Q?BR9EYjUXCY+SBRqfJfDoVtpeEBVagVHqWDaJ/V4rtmnR44OC9TA539KJelBk?=
 =?us-ascii?Q?PnVsOgw2cOIT6F1dm+IUFQYPssr3R6I/8Fou4brXdyMqMfUx0jtiWN6rKjJL?=
 =?us-ascii?Q?y/O3QYFEmXMmsksEK4TEyVrIixvsfUU5meNuFyv21xfCYogz7yFySfBnENlK?=
 =?us-ascii?Q?3DOefKpxXFY/DmARiyD7QWCQIuB44g9/c5iK0BEeHrFrwMI54hr6VmcWoyfP?=
 =?us-ascii?Q?676jp+KPXGJtElM/fQOmrEjHiKty6YjU7qEmzMhbZpPDYkw5xHP/lXlz0yI5?=
 =?us-ascii?Q?mBPJ3IyP4ot6t3TwMf0lWe8TuwUm/7NjRHB2UpuMdwX+OwFvi2/i8hyI52sX?=
 =?us-ascii?Q?+HdNx1ejmBsYnL2quyLVWFpsQNEvwQ3rrT4Bp6q2hzUVUpC5U2EvSKDoL+yt?=
 =?us-ascii?Q?vqw+/525RcgGakKNHUD9LLuro8SVJ/RxbFrOLnnG7G37iQ0fLBdhls+MOLKs?=
 =?us-ascii?Q?sfjb3WYMyg1uHsS1UOMgeXHv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edce9c3d-2ee7-47d2-1ee6-08d91a5126ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 23:03:29.7365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieXBGgViPdUfRu3rI073PIUqb4LkLiKgrQJiVSnfnZfXJvyQWKdmwoGId39ldvLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2858
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 04:29:14PM -0400, Peter Xu wrote:
> On Tue, May 18, 2021 at 04:45:09PM -0300, Jason Gunthorpe wrote:
> > On Tue, May 18, 2021 at 02:01:36PM -0400, Peter Xu wrote:
> > > > > Indeed it'll be odd for a COW page since for COW page then it means after
> > > > > parent/child writting to the page it'll clone into two, then it's a mistery on
> > > > > which one will be the one that "exclusived owned" by the device..
> > > > 
> > > > For COW pages it is like every other fork case.. We can't reliably
> > > > write-protect the device_exclusive page during fork so we must copy it
> > > > at fork time.
> > > > 
> > > > Thus three reasonable choices:
> > > >  - Copy to a new CPU page
> > > >  - Migrate back to a CPU page and write protect it
> > > >  - Copy to a new device exclusive page
> > > 
> > > IMHO the ownership question would really help us to answer this one..
> > 
> > I'm confused about what device ownership you are talking about
> 
> My question was more about the user scenario rather than anything related to
> the kernel code, nor does it related to page struct at all.
> 
> Let me try to be a little bit more verbose...
> 
> Firstly, I think one simple solution to handle fork() of device exclusive ptes
> is to do just like device private ptes: if COW we convert writable ptes into
> readable ptes.  Then when CPU access happens (in either parent/child) page
> restore triggers which will convert those readable ptes into read-only present
> ptes (with the original page backing it).  Then do_wp_page() will take care of
> page copy.

I suspect it doesn't work. This is much more like pinning than
anything, the data in the page is still under active use by a device
and if we cannot globally write write protect it, both from CPU and
device access, then we cannot do COW. IIRC the mm can't trigger a full
global write protect through the pgmap?
 
> Then here comes the ownership question: If we still want to have the parent
> process behave like before it fork()ed, IMHO we must make sure that original
> page (that exclusively owned by the device once) still belongs to the parent
> process not the child.  That's why I think if that's the case we'd do early cow
> in fork(), because it guarantees that.

Logically during fork all these device exclusive pages should be
reverted back to their CPU pages, write protected and the CPU page PTE
copied to the fork.

We should not copy the device exclusive page PTE to the fork. I think
I pointed to this on an earlier rev..

We can optimize this into the various variants above, but logically
device exclusive stop existing during fork.

Jason
