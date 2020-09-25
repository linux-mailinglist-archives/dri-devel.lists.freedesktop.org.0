Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8727A82F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E56E3EB;
	Mon, 28 Sep 2020 07:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFDF6E215;
 Fri, 25 Sep 2020 12:34:18 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6de3690000>; Fri, 25 Sep 2020 05:32:41 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 12:34:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 25 Sep 2020 12:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0jjRPsHfE8U/qTYft2FmHo2rf4Vd29LQSgcPY0FshMo7XRktr1mjxZ9OG/bGImnft12h9/SIgA1xr68NNFm6W2rn8UPaQkDPBmh2m0SaKnj5C6Mlo7RYGqauvOjGp1VKyi5gyF93WwnTsGyPHAky7P7itQXXGX0KYv8+NdtyYb1uWDhKKjubMKT0cFpSz3qE/Gykys+oJM9WNig/De1BGiR1iQHE0aq1ZjnJ/zK7fNc4x8fQvKs4uLOQU9+koIqK5UD9+bQZEB0nFLhuFm01V1zSRQKM2F68zAUgsNLE8vf6oBTmy0BSeT2lqLZ6rqkrPtX037G3j1GPwhoSxwhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVv89qw5CwXSZ8qOghWfBQYpAqxXhazOniUnTnG3Zwo=;
 b=h5KMdkKty25JEShVuk6+GM7tAV8p+hUYx9N2+otOkSivjmOVuIJjvoAp44eLqfsDt8dzZdtfNFPqlEFWGcJv7t9llP0LRjS0pwAidD6OdWYTAtqjP/HngbYC17nPVaZxiQ4tk02iRPpsRfK24y2gbLqlRUMuk43QPyzuvyhrW1N0y5byQgNM9jLwp+opE8p/mp4R//NvgZOp9BKInkgQtAKlL6jGI/q/khq3q5tM822MElqLSHkrn4hiXeYIV9U92xFutRSipbnKClYbZQgiU1CZwNkRHG6evc6S0S21Zy35nNeU6NokRU8BstIYzER1YIuK/3bFaJPx6m0HJ74Wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0105.namprd12.prod.outlook.com (2603:10b6:4:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 12:34:12 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 12:34:12 +0000
Date: Fri, 25 Sep 2020 09:34:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add
 support in dynamic allocation of SG table from pages
Message-ID: <20200925123410.GB9475@nvidia.com>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
 <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
 <20200925115833.GZ9475@nvidia.com>
 <c5956163-1769-ee40-e4ed-45532d8c4e19@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <c5956163-1769-ee40-e4ed-45532d8c4e19@linux.intel.com>
X-Originating-IP: [156.34.48.30]
X-ClientProxiedBy: MN2PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:208:178::25) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR19CA0012.namprd19.prod.outlook.com (2603:10b6:208:178::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Fri, 25 Sep 2020 12:34:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kLmvS-000o9Y-AT; Fri, 25 Sep 2020 09:34:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e5d078-c12a-4d0c-af73-08d8614f4e87
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB010518B90B279F540DA2C5C4C2360@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2k+WvxUCKhe+yOdboPSeK5gg6Gbhn2U0SxTPr7Xad5/XLlusJzZoavTaa/ksznhkZHmaADduc/rRrpJFuz/FB9zOQP37C3G00rZwpTqDRLMF03zb8YEFzBPX2cQuvexSOShyJwvHrs9lJUfndHCToryQBSFJeT5v+a8mLnyfa+gNSmoePwDD2a2ZtRlMy/GZT6cPJXCyFf9BZCirhaN1/88II+XSrX8kDd0frQVRQ7J8UsaApepOEbyhwnAn8UJ+DRNJSJzP3Y3vz+SaQX2H2hFUihBFYWVMbAZJklwJ8Pp1dGynsAZdeMk0l/KV2IdH6ZVF68nO1mfi2MDjya6lMlpHQAIvSzQMHXADmvyEZHkOol0DPVFwst2p3P0fHH4I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(66476007)(66556008)(66946007)(2906002)(5660300002)(9786002)(9746002)(2616005)(107886003)(316002)(36756003)(426003)(53546011)(4326008)(33656002)(26005)(1076003)(6916009)(8676002)(186003)(478600001)(8936002)(86362001)(7416002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Bp/f4Y41Y9mqOHKmYD4lNTYmN82OmU5BOT2OQtXKevBQ/DkeWx441XhHAMRx9DxZ99odNGhSEDv+0HH0JyS2CVXCam9s99dDWLAEWHEmspqBZ26yaw9S1lpK7ATB1svz64p1hDze+A+weP3WdmPbN9zjDqC4sF410eVEyKxpzRR0vxIV0PV5vpNtN2eXYTdGRhOmu/txsnYZi4NRdoanq2lKB5k4WWOSuIL0Ae2DIrqFH5cgWdX+1DqFn8Wx+mzef6tgObIplfHUX0M07R3cFJwsSzpHzagsd15GQ6amaItTXhcRNMT3eGPdg3fv7nbm0p8eHakQzTMY2BXMehlDsEzDV9VYUAOtTQZD9IQ44wKoJMN3uKGI5wJqipR6mI53t2Ek3JPLLdOr+71Zp/Yq7BwdX5gYyRE7YoHQk4cQJ2jjkgBiVT+0D6lDP8OQcC8bThf0uWdBvKEnMX/9RipP5vEHpX6/JnpQwPxSeGzjLYRDecp/B+X+1N9wF7dORVZdBWxiKEL0jcrD+e7IELhFpe/QOoNeDcfz4IIRm6psZ7M1DQAT8Vu1Xs7NtTBZNglRy2O0yEvHXLp9oi1Qtc3QusrdcbBOnhl3zmb7LD+PrI0rlg+g0wiwUTkSBNKA8XOqIl/M9rvgWIh0k2R08Ed5pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e5d078-c12a-4d0c-af73-08d8614f4e87
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 12:34:12.2619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nP3LDA9tHbYl8K08gGqjzk3RelVIT+dwNgKclpMs2WT0YS0cPTGZ5BTIjAKzwMVp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601037161; bh=LVv89qw5CwXSZ8qOghWfBQYpAqxXhazOniUnTnG3Zwo=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:
 Authentication-Results:Date:From:To:CC:Subject:Message-ID:
 References:Content-Type:Content-Disposition:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-TrafficTypeDiagnostic:
 X-MS-Exchange-Transport-Forked:X-Microsoft-Antispam-PRVS:
 X-MS-Oob-TLC-OOBClassifiers:X-MS-Exchange-SenderADCheck:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=RLL2U2m82i7etYr0XorLpUXVwoTsFJ8R+dWV532yZwld6XZagjbtidK4yOaro15Vw
 c5oSdd/CKlDmj9rManJjOcGBz5l+PtvD+BU9TecVMcFQ5XFtNwsJDpxwoMIiId8jmD
 hJFcMSwHmwxWQY3c4TirKc76FiyNG9XpKGiB9Q1GofrUymPY9HuX6VqI4BYrsilueG
 Uam/bCJL+ifjY6In1OrmG2wx3JBr05tnuf6LYBruYcqKarZJkCz9+ToSO1w2LRC8ja
 oscP+MSshZ4Hq9/vCaHueD7+l1ndc0+TR5voHJuaqTYj3FHjjldH1SxCBvCGcy9Z7R
 QN13Gd+pfmELg==
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, Maor Gottlieb <maorg@mellanox.com>,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>,
 Maor Gottlieb <maorg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 01:29:49PM +0100, Tvrtko Ursulin wrote:
> 
> On 25/09/2020 12:58, Jason Gunthorpe wrote:
> > On Fri, Sep 25, 2020 at 12:41:29PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 25/09/2020 08:13, Leon Romanovsky wrote:
> > > > On Thu, Sep 24, 2020 at 09:21:20AM +0100, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 22/09/2020 09:39, Leon Romanovsky wrote:
> > > > > > From: Maor Gottlieb <maorg@mellanox.com>
> > > > > > 
> > > > > > Extend __sg_alloc_table_from_pages to support dynamic allocation of
> > > > > > SG table from pages. It should be used by drivers that can't supply
> > > > > > all the pages at one time.
> > > > > > 
> > > > > > This function returns the last populated SGE in the table. Users should
> > > > > > pass it as an argument to the function from the second call and forward.
> > > > > > As before, nents will be equal to the number of populated SGEs (chunks).
> > > > > 
> > > > > So it's appending and growing the "list", did I get that right? Sounds handy
> > > > > indeed. Some comments/questions below.
> > > > 
> > > > Yes, we (RDMA) use this function to chain contiguous pages.
> > > 
> > > I will eveluate if i915 could start using it. We have some loops which build
> > > page by page and coalesce.
> > 
> > Christoph H doesn't like it, but if there are enough cases we should
> > really have a pin_user_pages_to_sg() rather than open code this all
> > over the place.
> > 
> > With THP the chance of getting a coalescing SG is much higher, and
> > everything is more efficient with larger SGEs.
> 
> Right, I was actually referring to i915 sites where we build sg tables out
> of shmem and plain kernel pages. In those areas we have some open coded
> coalescing loops (see for instance our shmem_get_pages). Plus a local "trim"
> to discard the unused entries, since we allocate pessimistically not knowing
> how coalescing will pan out. This kind of core function which appends pages
> could replace some of that. Maybe it would be slightly less efficient but I
> will pencil in to at least evaluate it.
> 
> Otherwise I do agree that coalescing is a win and in the past I have
> measured savings in a few MiB range just for struct scatterlist storage.

I think the eventual dream is to have a pin_user_pages_bvec or similar
that is integrated into the GUP logic so avoids all the extra work,
just allocates pages of bvecs on the fly. No extra step through a
linear array of page *'s

Starting to structuring things to take advantage of that makes some
sense

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
