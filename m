Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070583F3068
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAEF6EAC4;
	Fri, 20 Aug 2021 15:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0126EAC4;
 Fri, 20 Aug 2021 15:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS35s1bfgA2NXZALKi/ZJ5u4nezfjy+XhzCYG0BHlNI6iy64qWMn0RsBID4JaJMHUr4OtV8O1i9tZLvlpuKjlt9ubPjy2v4dp06P9l+3/DTum+zOahzmK9Fm5d98coJA2V3tOlHKrvWHUrAXaaMzEpwf1hQfTNOMGM/eBQk8zbUInUe65BRef2TnoSDAih+ONJcdIGiabA+C/mXBk9ZC73bBZ29Z+jnCqfhKdFBxEnA4ziFhobBui3fQbwQ63n4V5xnVKKwELfW2UlEeIVNntbJsMYhzhHyRpwwgYXgEJnpZsUAChEgtXir0N2oOT7kF2fVFfUZ9wcHL9O2o11POcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s/tvyiXFzbgWFPj8QniTxZQLSk+YCilmatz4XKHtDI=;
 b=noDYxGrCHl+I8IcTmqe1LxWgGTHqeLf7ho5TjQj8tzO1nGoPQg1a6rHkrnQNQ9yN2/ghVvAoHM5mp4+1bPikZNgAGjNbBgmaKbQN4f5O1FR9si5ozjCt397KTLA+rS1nYhHe+GISAM7/gKIkDbYEz6ZQJ9UvLIxC9xr0lKh62ztcrvN5J1Xw7CckBEW4L233daYUbXk01V5XrW5Kbk97+EsBQz91ybOw1Dn2BM+EarQQV0yu7rkCajhNdhVV3F3rgFSkbI9nXA1yCYMfiEUWgi7AE8e6ktYbYitqbtQViF/YakBbp3dW5KIBgAI6uJ1yycD6/6ghX4ddJEtS20+2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s/tvyiXFzbgWFPj8QniTxZQLSk+YCilmatz4XKHtDI=;
 b=bHbjVLp4dH1zLeczXQoS+76qupnStm3BOv0kN7ZLeorem6d55swejuvKK+BIL0U4PEfMYtYWRjIsiyi1yXYAt6+u3rMSaQm/LyVjrnUpmaceSNoqFgP5L4Gb6Ds6pTGgHSiAdf6IVv0v0tzJKrJvz0/klZgmAut/+NNnwuIB4HBAh3yOQanHfsNhbGqroRKKkeCaJUTy6UxZEI2wIojBvUg6ZDUXpbxBO9y7MWeZ34/aNlHYweoT0s9UaTsvBIM6+RVgZjE9zXJQMpt13BpyWI8dfC6Bbvtaid+HwrZWqZBpl7EP2PNBjgOezELOZEiFwLqNdf7ebna3pPbI4V2ApA==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5538.namprd12.prod.outlook.com (2603:10b6:208:1c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 15:57:40 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 15:57:40 +0000
Date: Fri, 20 Aug 2021 12:57:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Maor Gottlieb <maorg@nvidia.com>, Ariel Elior <aelior@marvell.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Kalderon <mkalderon@marvell.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Mustafa Ismail <mustafa.ismail@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Weihang Li <liweihang@huawei.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zack Rusin <zackr@vmware.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210820155739.GA531044@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
 <20210820155425.GA530861@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820155425.GA530861@nvidia.com>
X-ClientProxiedBy: MN2PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:208:23c::24) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0019.namprd18.prod.outlook.com (2603:10b6:208:23c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Fri, 20 Aug 2021 15:57:40 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mH6tn-002EC7-GM; Fri, 20 Aug 2021 12:57:39 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69a09fec-a532-425f-db19-08d963f33d2c
X-MS-TrafficTypeDiagnostic: BL0PR12MB5538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5538F6B9D5850A88ACE0D006C2C19@BL0PR12MB5538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAlvrg2RTbzFbeXm3vEuBgJz4GAE3synw4tYU80nUUGmWEnW062PB4WT5esnxLkh2aVLPCAHoIzZSc77Rr7vapDR9xGVFmLT5G+tUiDtARA+7Mh5H1wYXb+Nz81UVx7qSfiGaC810fIHOUq2Zz2wmCxmcyMwzFvbL5103PsFBnEN0wD+mZlOC35KqQTc32olOUAM07Z68YdZ1m+0r5pXkl/+81qWNDuX8/92+K/JaWKzZciw/YShPBEekKhg0XyE9WFHRm+f85mkOuXeWGoo/sWy7JFrgz2XetsH84jxrNZ5hWhXeSso7hVDLQsQhiIur1MHtO+gHN3miN64xJ265L8y2Dw+QDNYNEmH303EPRZApc7Jz3UF7BC+3+8MxjIrL5Hi/cAZfWbC+JCIXPt6y4OC5+9TgGHMXiPZL8Y9qNMbFzOSXGwoOhUhrt+yeuP8kZM+HrBfHi8Up9pS3d7efYvkgm1L9XvfjcBZF9VHO7XDStyxxPm/39kOvJrx7WkSzirASojW5k1+to0AREybwxp+yNWJjJD1trDkMP1dOw6XBk8tXQzSA8PfmDgFAmotRfii9dFl5p8XLjUWnsqgKoOTBprox4dxCVsTSkAq6jILh7J1pM20xeMDLGLkoPkf6k45WoM3q6Up47QTDBLCP0ZaXN4xLSp+kWx9vnqkzF8BAVgUJyy0ny1WGV4mqmuqX/3AZpuXWwe1nECws63gKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(36756003)(66946007)(9746002)(86362001)(9786002)(8936002)(4326008)(426003)(8676002)(478600001)(2616005)(186003)(66476007)(66556008)(26005)(33656002)(316002)(5660300002)(7416002)(2906002)(54906003)(1076003)(6916009)(38100700002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bFGAEFPt0ujVIi+V692bFa2NQZal6RLy2ztHYTKXzt8Gkl2EcbdBatvxDvF?=
 =?us-ascii?Q?IcrAiscCQL7DF1B4gdruHaSUSV9rMRzUtY5DhPOqhf4VpL5Rn2xlEPkXpgMC?=
 =?us-ascii?Q?3PtGhB8psJcwM/5PgLYGEnehX6feXIVoafNMi/cfa0Qi0GxuDAaWEvwcBK9h?=
 =?us-ascii?Q?MGUwUvMV/NL2FWkrmlrOt3ltf8qyekMuuk7hKI2CdnHeLaZJZsvJ68IjBbTe?=
 =?us-ascii?Q?niAfNUmSzu/vEef0yHDs3fjG4oFBoSSYNGGwquDKGdli2NnGgPkGf39CrL+F?=
 =?us-ascii?Q?nPEUv4HKRr1x+z+HaGeZvb+lvGnoAIZbeUU1NkyPpAtLtOQzl35QHFHK+BBH?=
 =?us-ascii?Q?ZcI1IJow+OGobnWaCqtJF1JpoB/tbnvmcsWQZyLBuXmr9Q0fsnWfwhYb7pk7?=
 =?us-ascii?Q?DwdmkFY6jHjEiFGgYT+baHGm/G0LsKpZlykXpznRba/Vs2MudjCurbr2MNhK?=
 =?us-ascii?Q?Pn6aPo4ZkB6HGs96lNDID/8o7znWvnOk6knAxb2evMmX72+owEaw7IUeMzj9?=
 =?us-ascii?Q?ysmhtQkSY0+2yKv8IczoieRPsH74sQi+g1FTFpVgo4T4t9UyUFzqTNAlRowa?=
 =?us-ascii?Q?K93NOJQnXfNcEMFURX+5X6cqyfKxIoAKqmpWCzU61v1/ipfKRmH/kpiJAcNG?=
 =?us-ascii?Q?6H+97Sxg0tuKXc3LRBY/yfchjS6FYpaCzI62oBEdfT7n3fezRkLy0VVQQUYI?=
 =?us-ascii?Q?pX6xU+PFLId0z97bTrxSAJT/vXUfCTEoAv02gvBkKiSp44WE8evpujiyL3fu?=
 =?us-ascii?Q?pLbs2hj8VZrq5W+/FKr/iBQQBJXZRqDoZe3BqA/p+W4JpxUdVmJ+Btj7uuwJ?=
 =?us-ascii?Q?IoXeq9d0Sr60Yv9ZrAiyXq5LPKY0PXEWGb6OlZT0y//uBZgvxOcij94da2eb?=
 =?us-ascii?Q?BpXpk1PhNHOSGvKxIdSFTTmYbaeCrtXoQyvkKUFlCXCFpYWKuij1j2Ueo2On?=
 =?us-ascii?Q?L97J5GbYSmud8kSjusessnW4s5Rh+SVgqdglaWBzQJcj+LVoIsaEQnbv70Kt?=
 =?us-ascii?Q?jCo8pTHTHwW7ARZxlcj4afWYbV+FdfCnYKRA3gcZsgAHY3HC5XxpbgljlIgu?=
 =?us-ascii?Q?xLEE7TczcBoP2qdk6dCESs3rNVNjcVLAm2+tt3bpkh4qME0+UDMxqOPL0VWo?=
 =?us-ascii?Q?jAncPi1iw5YnzQuRcIQ49QEYmevAxF3JAfaffYKkriIA6JKWWsP4A20N17xb?=
 =?us-ascii?Q?PquLgQMK/YE/rVlze0gv/V3muZCkqEYBTtip/CWgQbqXJ6xXEpvx8zd+gaV5?=
 =?us-ascii?Q?DYO+5F+3JdJPCEdTws8wZ4RjU+Zw3i/3WWzvY3BQh3omYIvdekW0JzgB7Nkd?=
 =?us-ascii?Q?T1wTEyGa5LKgO3Bg4m/FeSwI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a09fec-a532-425f-db19-08d963f33d2c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 15:57:40.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5uH5r3PdiNJsMnBfBi6Gl/CknmHlQnsy01nbVhWbSH2cFia3+9JPERUw+n/zDAZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5538
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

On Fri, Aug 20, 2021 at 12:54:25PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:
> 
> > +/**
> > + * __sg_free_table - Free a previously mapped sg table
> > + * @table:	The sg table header to use
> > + * @max_ents:	The maximum number of entries per single scatterlist
> > + * @total_ents:	The total number of entries in the table
> > + * @nents_first_chunk: Number of entries int the (preallocated) first
> > + *                     scatterlist chunk, 0 means no such preallocated
> > + *                     first chunk
> > + * @free_fn:	Free function
> > + *
> > + *  Description:
> > + *    Free an sg table previously allocated and setup with
> > + *    __sg_alloc_table().  The @max_ents value must be identical to
> > + *    that previously used with __sg_alloc_table().
> > + *
> > + **/
> > +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
> > +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
> > +{
> > +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
> > +			      table->orig_nents);
> > +}
> >  EXPORT_SYMBOL(__sg_free_table);
> 
> This is getting a bit indirect, there is only one caller of
> __sg_free_table() in sg_pool.c, so may as well just export
> sg_free_table_entries have have it use that directly.

And further since sg_free_table_entries() doesn't actually use table->
except for the SGL it should probably be called sg_free_table_sgl()

Jason
