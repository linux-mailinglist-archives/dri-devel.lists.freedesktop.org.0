Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C33F4B3F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 15:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E9B89CA1;
	Mon, 23 Aug 2021 13:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692D689CA1;
 Mon, 23 Aug 2021 12:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyK1KsLM6qzF2ITk6gI9sSwzogfLwXDHi66GVxnuU9udMMTuPQX8VrLX6YrqCQAPbZhKCJtgV3mHRYgLp18MxBlxd1CIKN09qvPccxvna+DRfK5Aiyx4va4SCZj8GXlHyw/+iO2a2YyXVQTQNagn6kQaMpOEv11EBN+CTutmJ0fx+k3tQTnsCzFDieG47vhE6GlftBjSfdy8M4D2RXm+WWJBB0Rx38zki1HCgKNxQBKJenpzYSsA7JTEGUon6PcrT9wGEzpXiVFqpnlEVBhGPsxrnu/ftvQe9FXDMJQpfDj+BH8azo4rVKkvSyNn4n9dUGyfXekxuCTQnEL8Ph+4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVwzn8Qcpc0vuGrgA1qW/gP3vhZqdejICKXVwPf2N5I=;
 b=BVyp3J84NEKs3Qk3LZJUS8sIIzHsFpPU+BqBd3s77dePR4UeKD0r1F8Vg7VApKOvuFCGC4lebh3a1ULgOTKy7OQamC5C/6h4KaePilhMXWPegje+kNP7WWumunegxZi5My14vH0QF1wPc2em9QFM26q0//ZNybLi2sUKZtQuGJ7iRU0PkFcovG0uMfh7wy3ZfLPT6XyDMgx0tcm1XkfFW3SkGFYuisQezzgYmVTp0SStZlroyb94pKd97TBsB5ltF9Roak608/pDueMHSvTlBsFYppaQBktSol5j/K1t3kAH9lexGOTZWr1s+g67oLrwWTDmGJz3kSlN4RC0ElABLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVwzn8Qcpc0vuGrgA1qW/gP3vhZqdejICKXVwPf2N5I=;
 b=LMyoJscTZmyIOruvdUC1g3TbYDKpvNVbNSMXf4mWuMI9TFCdFLPRkfR9Vdf17vZwjlMFMRMSmChkMFAqWQkxSnXoz/yij7+vylL9GM0Nr7UnDFZvbqJ1o/uPSP5E503VGrTCCUjmHjIGq5DyFXgU6dcOxPos2VWCqhU0MVMo6rlZ+iRDslh+tww0a/E1dsjrCe34Xe0D77boSfgvfqvsdlO7RWyROu4s+8021eB0PAJ/x37Ehd3FBw+av0o09G9kLIwXY5F2wNkmTqrPAzPCIC1lzgG8K8gUUGSvCF0jwa6JNVi9mJzeZmjzDlz8sz+7fx3BLNQqsDk5dLX+QvcEVg==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 12:45:43 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 12:45:43 +0000
Date: Mon, 23 Aug 2021 09:45:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 Ariel Elior <aelior@marvell.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
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
Message-ID: <20210823124541.GM1721383@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
 <20210820155425.GA530861@nvidia.com>
 <85542c97-c7e0-3db3-baa8-2413c00f75a4@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85542c97-c7e0-3db3-baa8-2413c00f75a4@nvidia.com>
X-ClientProxiedBy: BL0PR1501CA0025.namprd15.prod.outlook.com
 (2603:10b6:207:17::38) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR1501CA0025.namprd15.prod.outlook.com (2603:10b6:207:17::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 12:45:42 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mI9Kf-003Fxc-TX; Mon, 23 Aug 2021 09:45:41 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b510070-c456-418c-316e-08d96633eb78
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51121944CBEF7C29D82C55A1C2C49@BL1PR12MB5112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kWCAL4uJpS/mx/glilhlYookhPPGda3/rlIWHPiMVnLEoKDvqGsIzBY5OWa2hT1top5A3DGeFhPsyoQgYZLrkKTZ68BX2J8Hd9UaeVtLXnGTKHeEZoN34q85ghNsIRw+idggXvO50UTlfYb3gP4LRY05JHz9LFMfVxVzs9Z7w0Medoo/cuR8QoPej8PZjoZ0F50lkBKmTW5iEZGmPZQXM7SDpkE4+Nt1X8CGDaGrjtGA1v1Q51gM01SCAY7fbVMKPe18xl0KlJKPCTOdFCWInYSfhGtL6DzalwHL1xt2eVjVsy0x16RGTR9/VGuRB15Kw7PNi50Y7M98UEnoRTsFTMLb/BHwI3fyNPoK8H56xQtALg5XdH7ZBNOHJwhDZDKthhYGEkvA9yB51XGmKCSkU26aZgYdMZ+cA+K87OTRvEb8OZAlG2zz5h5fsSwTOI8N58NdvBXVHVJ7Arm6pPKyvlgrJsNMtEZLBLXVO4fj/DJz6qhY0NcxaABlRfH7tYX7Rxgnfk+x0nLP//XAlfyNfqSb+UkvB+l2fhYc9VsBxhL30reFVF8jEN9Rnb/4TA33KyO35YCmB7ObwvW0N1nxZVNftRXlXV5A4nrWhC/CDOW94vpmXInv2YzqAwWucWlu/uCWNrDfjsTzDO+9WK3dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(508600001)(36756003)(316002)(66476007)(9746002)(426003)(9786002)(26005)(8676002)(8936002)(53546011)(33656002)(2616005)(86362001)(1076003)(6862004)(6636002)(186003)(5660300002)(66946007)(54906003)(7416002)(2906002)(4326008)(66556008)(37006003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t4mQSwyUKDc7j9WVHekJxghYyR44ujhEHjgh8o1jpyVz2m7xX6Ua3Qi3G8bA?=
 =?us-ascii?Q?pPHQFM35woVUFaCV6kVZjz08JOrrXhsck5bTEmTYs41rW/QD7RCBieLY535k?=
 =?us-ascii?Q?6dIapmrNCQ55Dr6eCNp/v6CAqHtF+eOvJl4qt8ZRtwWpr+bNBDoV/Kgc5vtj?=
 =?us-ascii?Q?NNx8vfOaagUjxVDoF7DQ7g/kl+OyzFpJW9s+Pf1Vu65iWfYG17kGUla8TJn5?=
 =?us-ascii?Q?pUB/n4DBx28t/ku8ZM8SLVGa7QVTx+z3yox4ke9/kFwjTBAG05c8kF0iOAqa?=
 =?us-ascii?Q?+fbEle8le8GpAh/eoJCrIhYGceqKoDovHooHj4rSRLp3juSt+RJHqfs9eoup?=
 =?us-ascii?Q?6prZqHGZE/yHAGnHxdBVZGznhUdYkAk4/rBexL7m53NcrS9juDOIOWQbeUOP?=
 =?us-ascii?Q?Jaq3nOkJS8yoiYQVVKios0Xr7OuKU7xdvnPStFqRvj6AE8fASu0gTAptZUMM?=
 =?us-ascii?Q?hpBp2aYAGR8FIVMBYULkaaXzc9cpLkA14XhbGoYGyJbDkxSvJbkGfoILXO1i?=
 =?us-ascii?Q?6cpmMZJygxOJQMOUTPvKP20ySGChbahRX1yX/iZLU2crx3mxdXXrT746RYnU?=
 =?us-ascii?Q?6K0ciCFWJstbEncDVGSU6M8su2Yo8BQGhL28fed4Y3ZEXKT9l2vBljWiAeBh?=
 =?us-ascii?Q?VwD1nWOwY07MtLZCVTc8tRYXdRPJPfltefDsaXlSi3lptgZ2tzrSgZqSAf9N?=
 =?us-ascii?Q?M1gHKl9MCPf8Wsgz9NBt3d6sdfs6AUc5EyJSe2vuDjDjaFQyw8S5bhQdHfCB?=
 =?us-ascii?Q?NUkTXNPQctGkAqwg9Tv390foaEZOtJHlO0C18XPVXh4b530O7Bv2ox8L13Go?=
 =?us-ascii?Q?vIu26LWdLT+OLotUivrOwM/kRhXQsry2wlinuG6l0nuhAXV6MXSf9DIJttRG?=
 =?us-ascii?Q?QvJGQc8qb8yH/IDMZYpqoZjFx4RBhfsL1/ZSMuX+cenXGkeQ1Krv/ICTdu+T?=
 =?us-ascii?Q?cTBCH3lvrK1qkqmvmRHPN3Td/u3Grf2PNc6dn5FMLs0PvYKar6NG2aGiEWic?=
 =?us-ascii?Q?1m8YQd5ghoKOavbWINSWBMTXfobbmlTwJgiR+jMyYNDIkRWTrPyufaonwga9?=
 =?us-ascii?Q?rg1ruMAZpOYQF4ysTFkvN5cP7kL+bL9nibSArfkj/3FAZK9Mjq3xg23VnLgE?=
 =?us-ascii?Q?nvTPT9Ye1xP/PcuPv8zuOh0dk5IEgFwfM7jCJkYa98vf3TINK9Akjp1xp6F5?=
 =?us-ascii?Q?ouWJOFG6NlPFfyJmgJX/KPFsGwncYKUZoZQ9y4Jd/D4D8cj5S5+C1P7wgAza?=
 =?us-ascii?Q?BCKqFXuD0sPuNuyg59icS2E1YY9g+yhUdKuZlxFJro7QGKmIpx5Q+tVWu0XB?=
 =?us-ascii?Q?/UiePkibXSVjryH4JQzZ5GzH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b510070-c456-418c-316e-08d96633eb78
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 12:45:43.1893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ3rA7XOZwwcI8NrLIYc5aIuHdCKGJb9WB+Hh6eG1B/aeet1MCBN5lZ59zzFcDyg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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

On Mon, Aug 23, 2021 at 02:09:37PM +0300, Maor Gottlieb wrote:
> 
> On 8/20/2021 6:54 PM, Jason Gunthorpe wrote:
> > On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:
> > 
> > > +/**
> > > + * __sg_free_table - Free a previously mapped sg table
> > > + * @table:	The sg table header to use
> > > + * @max_ents:	The maximum number of entries per single scatterlist
> > > + * @total_ents:	The total number of entries in the table
> > > + * @nents_first_chunk: Number of entries int the (preallocated) first
> > > + *                     scatterlist chunk, 0 means no such preallocated
> > > + *                     first chunk
> > > + * @free_fn:	Free function
> > > + *
> > > + *  Description:
> > > + *    Free an sg table previously allocated and setup with
> > > + *    __sg_alloc_table().  The @max_ents value must be identical to
> > > + *    that previously used with __sg_alloc_table().
> > > + *
> > > + **/
> > > +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
> > > +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
> > > +{
> > > +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
> > > +			      table->orig_nents);
> > > +}
> > >   EXPORT_SYMBOL(__sg_free_table);
> > This is getting a bit indirect, there is only one caller of
> > __sg_free_table() in sg_pool.c, so may as well just export
> > sg_free_table_entries have have it use that directly.
> 
> So I can just extend __sg_free_table to get number of entries. What do you
> think?

Isn't the point here that different paths to __sg_free_table require
different entries? What do you mean?

Jason
