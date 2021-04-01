Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205D35149D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C276E41A;
	Thu,  1 Apr 2021 11:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA86E0C5;
 Thu,  1 Apr 2021 11:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGzWC5xQkrPoKeGNrjfeqZ5ROQtlX6ZKUaXI7U3HMQ5SI1P+eI/TO4f9IN/BRuv21UvZbSTBsZls7kMAVtYLgn04+JWLpd3AezGZ/syuSVIDnaMvDx15RS3OjYBhtHwUhUWQM9PuFYaHsTr/zUrUi8HqJ7NKowhhAh2N88qt4yccbklZtphWpkY7IMRlG4a8b1n3+EPbcJz7rLOB5RTb/pLzWKYg7StiYMMpcDJB4rHepRqn8JJSPspUmFeLN5f92jXyoeQ7MtE0JrP/RhUZtg5/41dXRw8J9MeiEd1PY3v+IRlNClXwVrNd5yUV/2WCGoJPuvcSnHaVF8jWbTsqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/anNxsoy5vzfvhIHE3TZV7QT/7MV5nFOcgmLayLRY48=;
 b=IP5+RoM6LGxDFn7Nw3iIO8m8jgKppP/29VlYgKRFcgANASdnn0lbAzUorzlm83t4byl5R4dsmpPQ7KVkAjByu79nDpBwa0zIOhry4/u42c59iEGq7YOkoYGrXjH/sUsHPZkNJYPlzE7EmnyFf2aC6OjAs+XmIfA/OmKaNKevR4P1+NlPkesVLGSFvS1LDcpW+xwA/a1BJru2QqsddUOY9CBcz/X2a+UzM8BIdZjst2TNeTDeIhaIRwxVH+kueSZbBW/SSFrUkQr4nvrxA3kW3X3dLjFqSGdoJBWpELkd3/VJZAG0tmzDnh1tbwWuk9t8vcz+nYPKvzuNPLLxSgItuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/anNxsoy5vzfvhIHE3TZV7QT/7MV5nFOcgmLayLRY48=;
 b=LUfjBEmC2Cc9lxEVmd5cM7ADR/xsayJ0vjavNaAvCS5kxR02KpPtyFJh5QM1sDY7kZPwUlOmfFKYK3k0QVe10tgxsaoP690aCSwDTQ4v0yms84qhRUpdSldK4yOeKOH3f4AM78GDk/pABPZYvKg1J9hB857boJ9CbSekV5xT/DQUhAeHm+Iq8/IYH/YLToruk7vyRopWTcrDnl0YeokUH3Da7JmAwgBtDBjPD8Ald/vWz9sUcpBd7gMLMLGxxWwydhgcEbA0SzWvstxr0AMXYa83uKs66rDgZDtC9g+iFVQ9wN8hHPsm+3lxOpWGTR4TgnRx4PbI+QqXb5z1YvZXgA==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4619.namprd12.prod.outlook.com (2603:10b6:5:7c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 1 Apr
 2021 11:55:25 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 11:55:25 +0000
Date: Thu, 1 Apr 2021 08:55:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Message-ID: <20210401115523.GZ1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <35941260.J9UuDlmC3F@nvdebian>
 <20210401004813.GT1463678@nvidia.com> <9244031.kThbcIvB84@nvdebian>
Content-Disposition: inline
In-Reply-To: <9244031.kThbcIvB84@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:208:e8::32) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR20CA0019.namprd20.prod.outlook.com (2603:10b6:208:e8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 11:55:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRvv1-006jEO-G9; Thu, 01 Apr 2021 08:55:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91971180-879c-40af-4e05-08d8f505092a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4619B5F96C108221BFCB491BC27B9@DM6PR12MB4619.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNVOEFDIyINxpvvyudo3HUcTq03h3ntJy+THrHyDNw2lLFvSVYoIREpmdCvn3Rl5V5P6/yBDU2bbK6eVIszZuOGTVgiCyq+TT5JljueOvS0UfDCogpWQBQkQbv1TfkpEK2/fQJLtlWnCGLBcZctZLXBb/YCqEca65emIhxdLKhlQU4d5qACMEV/N9YxTr493x4+jGLNGuyxpSqg1LjxQQHuKtIObMaJ9hnzueTMap+RcuGDEihP/7I329wE2krwjghs1O8srtLvb0IgBHPLWyI0OczkPvNgcujR1aQIV0TdG9ZHJfSQ0s8JZ8Y48YLUkTCeUZ+/O1AvHLVVrwVffN0+WMUoVbLhUswT59xRKS1mVaANfBsaiAs6Bh/B6+F5/h02NUY1tGvpG6mWuwGaT9jRDfmA0B8kYNzPx9u9c2BNNTKY63Jo5yBVGAJqGdYL2Za9tUC8sxfS4bPDYT5hh4pAk4d+xWrnIx7YlXTGYAO6EQZknQddW52aDAiZwd78Bq2V0hRLamKy86gfJAn/ttTiiN9r9w5xnafWuj3TR/BeSQzZgUSGoUns6hTC9ctvApy/0sF6lfDjaBtYI1WtKzhxV2MPVpO+LYNHukeBci9jQ8oZZPSQqzGzIwybc5+QWuwmfNJynlv1DsE3fONY8hiJKvW4lI+ARHdmOZ2nNyoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(1076003)(316002)(33656002)(4326008)(186003)(66946007)(9746002)(5660300002)(86362001)(37006003)(2616005)(26005)(83380400001)(38100700001)(36756003)(6862004)(478600001)(66476007)(426003)(2906002)(66556008)(6636002)(9786002)(8936002)(7416002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FrSGC0T4QimKulGn7nJDJu2YCqkkVTf21itqOLon+0rGZ5PSfNshf1/sCZuF?=
 =?us-ascii?Q?Gr0mmiTIg1zBVkxsIQMrsSx/S1ts46y+6TVveH9fnO0V1Gegt77H0dN3b9+U?=
 =?us-ascii?Q?Gf5lf3B1tfL9PemcO0bSb4WaOdp7kSCsJ8CQFwWaiWu8+PzS6SwnUGy3+aoq?=
 =?us-ascii?Q?r3UhA2qui/LlukRU0l/Dahm1yLemu11zS+XvCgtHPhw1GeTMRmcAG8XdJ5KX?=
 =?us-ascii?Q?J/U/Rnr7Crme8T0FdCUwwwjwv73fQZszD8HEFLt6kNATaLAYDS1AxfkzBgMb?=
 =?us-ascii?Q?CSm+/LWivnh/cp2ESfOu1CctSj3jjxVBBkZBjcWRrOeq1OZ/8uQ4wjf+af/C?=
 =?us-ascii?Q?ia3v62n0WkkyVWDrOQpC2bTTwQpYHgX1BK3IbVM89HPcW2Qin/hEbZi+Q8I+?=
 =?us-ascii?Q?nHzqmLQsQyVMMy+NNuW/mEVN/4jtMyb6PgLGcQCRu4ZCQTlOEZI9nwiAmlvj?=
 =?us-ascii?Q?kqla4aQoUQ71WyO0og5jbLQqOKuqvdRjo0m5mnv8+i3nUs0ngksbTMVlOdSX?=
 =?us-ascii?Q?oKuzOhgJi68nQFt+IjDSmpe5pvl2j8CTTX6ztIqDU7OhdrzfThj1JaQtl0QE?=
 =?us-ascii?Q?KxTHm/qnzww9uHZ9xLUi5ZejcvU3JlpADTQyJ2UgNoXoSbdb7B+X/58g9pjr?=
 =?us-ascii?Q?9n+AEnkZoa2Bn3xsw09lxpAj3aMDFp6AANLJMxv76QZiq3ME9ur9NUtF4+bk?=
 =?us-ascii?Q?rymwl7KZgqEi/+9CmMQ8oSv+ys7U5XgZQCYpb35OGqqxtZrc4B9ianpB5yK8?=
 =?us-ascii?Q?qbW1TGNqbsHepst/X4pTSgubJ9QQKhEbypS7cXtBLMPooChWIhGDcehwGZqq?=
 =?us-ascii?Q?NgD8o/c0h52C12aHCKoXp1ofi/zeIzvWW5kDxOso7qSfCR6f/umITYmfz2RV?=
 =?us-ascii?Q?t7/HWj07H1RzamsnO7DscWOu5Z/hHgLKS7+UeLq9XEg+yBcxYyz8tOd2YGC0?=
 =?us-ascii?Q?ULy8Ib/+Ukdl5SHjSzTKk69IpZsAaAAZD6HbYL0SJJ6PaGvzsk4at/4JveEt?=
 =?us-ascii?Q?GbsQ3utDRCE0i0xzz9Oli0oVTuLWlYBCJiNalHRQWocjNl3hIU0l+yXXVzuw?=
 =?us-ascii?Q?Jk6ngZGpsHxfvCwjj6oykAlOWRAnYBF1O4MWGtX2TkI8i5IXNfuV1W6R7BT1?=
 =?us-ascii?Q?PwqBe9jAT/EJ2ARBZjz4fuaUdEGyjzJd1F4+FXKHFzunDyLLAeLkgYgnomm0?=
 =?us-ascii?Q?y7qfiFN1Y2D1u4E+RZm0Lv2KAOFT/Yb3SqEcck3hNHZ0dxyCP4jnumlOpzWW?=
 =?us-ascii?Q?53tque2LaVp7RKtMx2S7g0PrtI/NrNq76+6T6Kfar0hGRzAcsge9UN8IY6Q7?=
 =?us-ascii?Q?repubB0L+EFogLDSvJNsPdGhC196JeiQ0tXdW5SFfUhVgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91971180-879c-40af-4e05-08d8f505092a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:55:25.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LWivyd5MErq9MyDKtkkmYd8RuuHLRHSgxJk6pGjCfgGuq5bjCrIKRYKK8CIMSLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4619
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
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 01:20:05PM +1100, Alistair Popple wrote:
> On Thursday, 1 April 2021 11:48:13 AM AEDT Jason Gunthorpe wrote:
> > On Thu, Apr 01, 2021 at 11:45:57AM +1100, Alistair Popple wrote:
> > > On Thursday, 1 April 2021 12:46:04 AM AEDT Jason Gunthorpe wrote:
> > > > On Thu, Apr 01, 2021 at 12:27:52AM +1100, Alistair Popple wrote:
> > > > > On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> > > > > > On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> > > > > > 
> > > > > > > I guess that makes sense as the split could go either way at the
> > > > > > > moment but I should add a check to make sure this isn't used with
> > > > > > > pinned pages anyway.
> > > > > > 
> > > > > > Is it possible to have a pinned page under one of these things? If I
> > > > > > pin it before you migrate it then it remains pinned but hidden under
> > > > > > the swap entry?
> > > > > 
> > > > > At the moment yes. But I had planned (and this reminded me) to add a 
> check 
> > > to 
> > > > > prevent marking pinned pages for exclusive access. 
> > > > 
> > > > How do you even do that without races with GUP fast?
> > > 
> > > Unless I've missed something I think I've convinced myself it should be 
> safe 
> > > to do the pin check after make_device_exclusive() has replaced all the 
> PTEs 
> > > with exclusive entries.
> > > 
> > > GUP fast sequence:
> > > 1. Read PTE
> > > 2. Pin page
> > > 3. Check PTE
> > > 4. if PTE changed -> unpin and fallback
> > > 
> > > If make_device_exclusive() runs after (1) it will either succeed or see 
> the 
> > > pin from (2) and fail (as desired). GUP should always see the PTE change 
> and 
> > > fallback which will revoke the exclusive access.
> > 
> > AFAICT the user can trigger fork at that instant and fork will try to
> > copy the desposited migration entry before it has been checked
> 
> In that case the child will get a read-only exclusive entry and eventually a 
> page copy via do_wp_page() 

Having do_wp_page() do a copy is a security bug. We closed it with the
at-fork checks.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
