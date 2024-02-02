Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73236847474
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FFF10E046;
	Fri,  2 Feb 2024 16:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NPvrSY41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CE410E046
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlIoS635lXTOrC1pwXZEVotyTXrM+Wj8PT5MCIWk4sLBLUoWn6Nr8PZKha79gDQYIfBD322muLtOG07Om8PqIw6LUowKKLjdGbeQpKNhDmVtbQeItHvixFdx0DFMioDDrB6GttXlnCyfYJtrMkPju27oIn+sUBRN8D09sTaybOfD2Lg2uvas5GPGsmke3m4hOsYftkq0q2mIgY9TAAsATw2o7UJLNQoZbuwz4xx7wSVfWO7et98vEFuJzrWl8VP/3Qh9G9wcA/zMS6wbl5RlK+fprvX95HYR96USVnIQGeHGD5uiTLi27YnF4RvsW0PcxQJnL27sYu05s7oP+Hqm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSNGtXGj97Pz13Fr07uNcAHu0LhWWo7eWS+hu7DzZ1o=;
 b=QNgp8j4LK3GT/ole7uLrHtlCWsdNjGkuY55xjrcW4qpBriuso0i78FwrZrvOs6hosAfwzMMQjzni1gktCFXU6RibA4gFmVoTA1nQQGenMlzOL/NmR4BBwswV8lLdfvm36aRhZvlrs4gkMHwlgjpTYudjzSfRZ1tFnFGbi7Z2DTEpTg5C0z3U6TZdyWoDpXL2W01QiaNQRxw8u+cCPbyqj5RzyOSM2JsP9phWP6CX7XsWWJ+p3n2X/RP+cCYZlEEXTq8ewYegMwTM6k7NxPnhczx+IJIRWx8ln2mx5L5+c2XGGIdJdJRD2Jujm9yKX/162ZauFulUSQ4wOR0AShkxEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSNGtXGj97Pz13Fr07uNcAHu0LhWWo7eWS+hu7DzZ1o=;
 b=NPvrSY41ZRk6pCp/ai0Cy3obez8yjVjvVhQxYxMUkx4O1gHQBa6C3Rf0+PxthBQb6f64Jg54w1t9VXGNk0gnGBoFtjJn4VTxThWyz20PRJg2XXtfZv/DAGEj6vpULjX4hDa9Tz5jGS2bWpGwD1vQ/g6Yr1ehgseiNAgwXHizMYE+SpeiKJ81H4mZkeqS1pGsPFG+2exyFXiqZDKEGVV4RlRqqHD1NUoloztyWsWbdUERIH4OgvFVlyPg9/j1OiRGbcxXovNcLj6FkG/ZSWD2Yd7RxWHXhLTJWmrsz1NjCn3aRhzEZ6XEKhzxBF7J37i0dHdoZkMBdfnvkCwtPR3aJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5057.namprd12.prod.outlook.com (2603:10b6:610:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 16:15:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Fri, 2 Feb 2024
 16:15:41 +0000
Date: Fri, 2 Feb 2024 12:15:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Message-ID: <20240202161540.GU1455070@nvidia.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
 <20240201200212.GQ1455070@nvidia.com>
 <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
 <20240202143518.GS1455070@nvidia.com>
 <361dcaf5-352e-4162-a952-c690783a2251@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <361dcaf5-352e-4162-a952-c690783a2251@nvidia.com>
X-ClientProxiedBy: BL6PEPF00016410.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2f2fcc-efca-4838-5329-08dc240a3371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXJIR4CkXVFVBwDcPiTOHoBDUcxbbHamsjp7mg1fkZJ+UvGMDHM2bjdgGBNJO09lXidSo8RQqcTBCRY4jALtDIqvspOek+XAbZbqxzkAw9fulu2ZRQYqtqqgQSeRMiPX5KtXq9ofc957V0oUm2jpAXqicP2C8EJU/2YikToqF9i35/9k+Fle8WEyCGymX8I3/BFKTodcwkrGyTzXWN3tSCc2oEUTIiTe1HRkOc9r5VHSGIk/vS6iTkoEDAfGebqSbGU4EAy9nYGeHCLORHhoqrW2nVcIxj6N2SHdzysS9/L5fcQV0OHAn1kb4jwwJwaok4F9VDcrO/1b1zcq6DroI7shiTRgQBY+iL5VTujx3G0Ocm8z7jVaqDJNn85Ohj1KBrIATeNrZO55k//4kbE2JggXq3mE+6nX5NZjUM551lYldgFFt5MFBvIE+29Tc94rOGKR6vIwGYrPw8CV9U1zhG3jIQ8WuXeIlV7c3tH4DJHSt3CE8o/Yfq1tP5CLwg3Ru6Tq/lbjb1127Qqw8TvIMxabLyFEG/1XJDraeU0v6QoeLn4MK8q6hw3Ha1MiX5OP04ILWH33Y2PrP3Fy4J8M5UGP+KBLh+J/S5shuG6zwOllauIQgbOmYSi7KWjbhDOA9kqYVvi7n+qFvT09IXibDEdSzlKUm85pu7+CROEkECY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(1076003)(26005)(6512007)(38100700002)(2616005)(8936002)(5660300002)(66946007)(66476007)(4326008)(8676002)(54906003)(37006003)(6862004)(6486002)(2906002)(478600001)(6506007)(53546011)(66556008)(6636002)(316002)(86362001)(41300700001)(36756003)(33656002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqQFL5Ji2GVsId5EF8e5My1NDPs+vpCPNnjpgMixZVeajCT7IFqKqxSjmbaN?=
 =?us-ascii?Q?oXC3gQBbj5fDkiuhpRPrwIb76FF8msgMNJ1MUHNsMqDV1eF9PY6n4bzrlfMH?=
 =?us-ascii?Q?gVSQFD9bbm5cewVeuvraIr6DgLNlmwMk5X9rELBUjO3++YiTTgEIzzHjMe0o?=
 =?us-ascii?Q?/IVIO2WUVlUfPOsK9sdFWEYK9iXerDqYAZ64V3bgZzvezuoEek0/ZzwpAudu?=
 =?us-ascii?Q?FAO8osFV/nEy8cxz4QT/9nmIx/6yy7mBSoXpztNQo5y4e6yZ5OUi5tkisNEC?=
 =?us-ascii?Q?/ZDYNvh4smeYzTNaDSYtgBbEYKM9oDQttz7LCLOw6jsvQxY8mJ53KpemyxjZ?=
 =?us-ascii?Q?ioyhK4m6IwUdBFnlg8uNQggQLm3Oje4/0xltBSKvboW6k6Fltt/3yJ2HZ5T4?=
 =?us-ascii?Q?EmbM2v7tQ0i/d5TK/+9JAaiEZtpNim6qvRwdKF7qlY2ZxEQWl6oQugZE5NZT?=
 =?us-ascii?Q?3nuQp0XXk05aai2zqRP/bg6eC2dc++Qetf2eIF2v7TrB8JmWr+wsL6527Iq9?=
 =?us-ascii?Q?5RTUF0jhpbwaEeh7+PmslvTMUR/Mmyqw2TgEn7uYmDbk6uq2nVm447mPPrvw?=
 =?us-ascii?Q?pbkCrJSI4nZLp3utCa9PZk5uADoQxzuc9O4U1oSYJHBzwcL6v/SonZCI1/5s?=
 =?us-ascii?Q?UHrq+Dc13c/p/8TFEKhREtyBCa4vD/QTJ8g9MRBoUqWMDZf/li20WAGBXsll?=
 =?us-ascii?Q?iR+UsGqQOA/Vp33CSaRPlZWoNBMsC7zhYAXqTQlJwNtD25K5jUyN3jR3vvXi?=
 =?us-ascii?Q?BVrty2BzFoHlYXc7D16JEDxS1d1ZpICSwddzMQFT9edhO9vyFIWyKZW0g1K5?=
 =?us-ascii?Q?f86IDCdROKOLDVA9QJ1U5Ve36d3WYM3Sb8nTE0gsUDT4paHjNoTSUMxcPlpy?=
 =?us-ascii?Q?l+A7kPSTOJqRYhZkzwTQD12RGbzzkndgP1W5h2Tg1VjBHF4OiBdE/1LAcPVP?=
 =?us-ascii?Q?9GwJmvjBs/SuxSs50ARMLla+oqU3m//TL3XQqFrhaYJ9gJfC9a3dUQhk5r9x?=
 =?us-ascii?Q?4D6yyFnGmpux3KoLKStnkzNS2bgA4gK3KT56ea+Ho0ecS5CCi0ZoIihQ+7QC?=
 =?us-ascii?Q?tzlax0DRxBOgwBW7FZ36lZmVYGnX1gnGV9fS/EPkTcu05SiqGwjj46IX83Nm?=
 =?us-ascii?Q?cCIF4toz0EmLyKW2gyy8AIPgYJ5G3vZnOkCgJa8SWX+r5pwzhcoRYP+fMQsT?=
 =?us-ascii?Q?9inFaAc7Tc07hrxXSSISkuwK7KOylCixmrBGVPJ3yVx6jgzO1F5rzemeTKoV?=
 =?us-ascii?Q?9gddNdTsP0fZO66lvUHqLx+Xuy24qI5SyIBIGLzBZKXQ1KKZeCyQ2rYZQicL?=
 =?us-ascii?Q?vf/E8QgMbg8koCFVIocux6UqXQ6waRRCwIDX7H9sGKh4eczNVpx4f6258e65?=
 =?us-ascii?Q?Q1eHk1riAFUcKOdK7mvPVco4OGZRV+WNlyZTbNsk6ladUnCsDIppK1j4cPpK?=
 =?us-ascii?Q?I+rWUKqrK0SM79jvlmkNk2aBbwqr4dhPKJv3Ofa/OzAs13vwzCQfDc24cpHT?=
 =?us-ascii?Q?IeKBjOm/9W+Pa90zglQkjs1w9bEMWnRZTANRBCk8wbbwy/3liXDfjPH3nfrB?=
 =?us-ascii?Q?5hz4KH/Vdb0jl50rKjXPUVhAyuQIPBDw67CrQ4c8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2f2fcc-efca-4838-5329-08dc240a3371
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:15:41.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvkBjNbSnqRowTQ5fScIVGqqobmv2h9gxCeDiWEZuMWWVYmDV1gqbJzYlrqfb60P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5057
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

On Fri, Feb 02, 2024 at 03:56:52PM +0000, Jon Hunter wrote:
> 
> On 02/02/2024 14:35, Jason Gunthorpe wrote:
> > On Fri, Feb 02, 2024 at 10:40:36AM +0000, Jon Hunter wrote:
> > 
> > > > But, what is the actual log output you see, is it -EEXIST?
> > > 
> > > I see ...
> > > 
> > >   ERR KERN host1x drm: iommu configuration for device failed with -ENOENT
> > 
> > So that shouldn't happen in you case as far as I can tell, the device
> > is properly added, link->kobj should be fine and ENOENT shouldn't
> > happen.
> > 
> > > > If it is coming and going is it a race of some kind?
> > > 
> > > It is consistent without the above. However, I did not think that the
> > > above change would change the returning on -ENOENT? I will add more
> > > debug.
> > 
> > I do not think it can either
> > 
> > Still wonder if there is some odd race..
> > 
> > Let me know when you figure out what is happening - I think there is
> > some bug here it is not just a harmless warning.
> 
> 
> Yes looks like a race of some sort. Adding a bit of debug also makes the
> issue go away so difficult to see what is happening.

I'm wondering if it is racing with iommu driver probing? I looked but
didn't notice anything obviously wrong there that would cause this
though.

Though, it shouldn't be racing with self-removal of the device it just
added, that would be crazy???

Jason
