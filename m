Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF96149EA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BED10E39A;
	Tue,  1 Nov 2022 11:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADEC10E392;
 Tue,  1 Nov 2022 11:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD/YWUTdEml5GjXRvQBQhvv0dp+dBEapmT78ocnYJOC6EnT6BSw+S8WKeMKEuWz+dncmeixVjP72yAacBJy7z3AR8LP/IwRv7fjTElKkt/4mh3HQq6PsBCHC2XUf8/cH+xr2eUysVIvfGcpLD/XOZraPaALLSA5u7rBELkAmqcsjqHpDmEX0F3G68QMSIoXFPoTSU0xIZfdWli9tmTuTjNIfxSMfBQTvSxKJm+AxdEr69cwnoOUqS7gaqqtJMkJSGkyPJ6THXwkhvKM8Ex2S6KzLqtmBWPiSm0XGXH5Az04d0IqhMnL2+/prekUTGyjTPz9gxmVqHPPOdd6j5RYiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNZ3fEvjuPQzwjtII3yn7ITE+EBm4d9WMKeaoZZhz3E=;
 b=YfEEwNk5YJonwuFxUoZ9FPY6BvnkhH7dbZuzNSaVw8djEX9COojSEQfoOspzG410yWpaxlNwOw1tHmu0riy7EQtO5w+3JXT0b5RK+fS6ow4dxoxMavI87el1u48jnh5jkVSJU7/Q/8M3RZb7Qve8EXjGPSBD9E49tHDhf/IYu1Mkj/rWUtPb1DNfTV6vgpqh6hE6RMe2Gx0XuOtvNQ4WSq8tF587Ka09E7l8LqB+L/ZBQQeVGB6i4ktJLNLFx2dK/gxhmYDDQy6tu7vKew/7Md9rIkg68j4fTxmKirYY7GPaagtW1Nao6HCTfwV+necMPQ3g0rxWYTrx7ZlpQrT9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNZ3fEvjuPQzwjtII3yn7ITE+EBm4d9WMKeaoZZhz3E=;
 b=NRIqK7FW8K8HzBReGju8RgbsA7shZF5gnj+sI0tKn0Xcg1sb3yZwYf41Fd7lPZCLokPIK2r1Uxxa8sj3PabuKCvgz7cOpZ03PMBWjDZeTqUz5jbSTqAJGaJObSqJwA19WNpgR3v8q4WN+asgxJUXfczPUEUYwh2OtlJ2lGTd/g/sqJ4psitAwK9t7bZ75ckIJofqF7zP5ulyaWpRGca/9Gc/9zB/WSZDMvUL0nglTG1mk4Z/Bdn+Z6DzJK4MWwff/zYcF8ZUYudLQrQbdme43LDeSQU/l2Pn7nSYDtdxV6FaJuY83Z3w8MMaG+00m0gGaiHLUD4K7TkR/GDFwsMnWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 11:51:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 11:51:03 +0000
Date: Tue, 1 Nov 2022 08:51:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Message-ID: <Y2EIJRtlpZ4Bq/8o@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB527655AB662598A9D5F9F1778C369@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2DkiM/o2wTf9Mjz@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2DkiM/o2wTf9Mjz@Asurada-Nvidia>
X-ClientProxiedBy: YT3PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acd481c-5a89-4387-f462-08dabbff5a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLYI4Oc1gaxKKnmBX7pXHI7ZcixAc+cG6U5+o7MkDQPWnD6BNquM4Fem6CD7AjgWOdT4kIuIMPgWTlJyIeyZdRk8B1Scc+1o4Nvf7z5EPR3M6TSnfXnYJmD3PQGd35cGPKDg/vkcnOOFNE+MyJKfXg0tGUSEVHcAeoaHgqboJfluD0TLqhuDbkzwhjvAkUp7nn+1OKZKl/MkY8tSBqRWrMz2PdmwDL31ZS3cMhYIjhq0lJK+pWdy2vbKBsKvpMNPdNnHykLF083GayN8ohG6rZ8lhU5F/FyoJZSihziTc1NdSnCijkTPSMGuquhbU7/qwtI1RBRwZ2cDMztRHQlzu7l6rkZGCzk5AhoijgALPD3KJmgDPT8sNlNyUHEFW1OHoSnJ8BKVrTJPOuGIJDB9YQvceyPUuGdQxqRwA9KIg3ky5UMbiGM5mAvRgXGIKqxRU8SYz7o0HLe0zeaPYWj8BMLQDoXrLRbi9c8thiZ5ek4ApBueLAsUl+kFBg2veqmEKxs0b+7V5m6/d3h7oMowqqe1hgb011ljXiNoZ7qcvZjqWi8IEF36vDDjCV5dFwxBEo+OZ+JYmzG9YZOyLKkE45ziYhKfnKes0d1pAAkWsexJ55kpPWm69X6KeWZ2QWZYVoFa3RuhBL7L7wfQDR8dMeCCgd0IrBBvAbjRQdLmrb349c0Mk5V+PFPw6wn7jGZZt+um3DnxtzGHdWxytsgSdrGeEhyxcT37e2GKD9bh3XUPJ6sq8Ac9D1WoUW7HMssI7RY4/Y6zxGjosm0w95hZZHbXGlpuYlQqNSoPZQvTj3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(8676002)(37006003)(54906003)(316002)(6636002)(4326008)(66946007)(36756003)(66556008)(66476007)(2906002)(6506007)(6862004)(966005)(41300700001)(8936002)(6486002)(478600001)(4744005)(7416002)(86362001)(7406005)(38100700002)(186003)(5660300002)(6512007)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7LFesXr4KfLdAc2wt1cuUKUSLBDhc9tDHIEo0Y5/FCX9Hgs7e6SluHCS2ze?=
 =?us-ascii?Q?0l7Iuty57MFJsQX8BUWVHi9DGtZZICzLWI8XkKh3VW1axOhmm0XixD1kv2nk?=
 =?us-ascii?Q?+C3UzMUhfBDYFZg0fbt7P9Q6gSNiUiDOqTOwB9jn/dc0bRkzcDLgai8aKfbG?=
 =?us-ascii?Q?NdZUmiqvdBuL0usuRQUd7F8q9Ib3x5xIyNh8gXqPt84ymJ741IAFpOXqcGXs?=
 =?us-ascii?Q?pRV0QG2zvGXhXV/R3ZeLoDfk3tJwdGThCSrz9myK514+itExbwohsaKmJ8xJ?=
 =?us-ascii?Q?YGtvynyIQd2Nkinnb5mGK5Un+1yrPu0btHAQBMiilz9cHzlv7tfxf9w6J4Vl?=
 =?us-ascii?Q?4qcTDl7JIYoTFdo8sc5ZY3tb6igVd2hnn7n77cLhOwrDyuECz0xfiPTgZ40v?=
 =?us-ascii?Q?bBXHCWAGDXKkkfJv4cU6qvIUcd06DreaDGsXmpQUYlgQ4P16JtmVVR7BNv3i?=
 =?us-ascii?Q?c5GhvCDjLe78wJ8V418a/SgvZ6NMf0Awq2L+XI1gXSR9+ye9/d/5WDhlbjK3?=
 =?us-ascii?Q?+ZwRVJAyt4be0VlUDKqt88/jGw0znlLeFIPbNWNxuc8EQrut9U6F7HgFl9RJ?=
 =?us-ascii?Q?GHLANGJldYv+gH8jrbSEAp9Lpw5QFokld3mnKTSWQguCJzfOjjkV4GX/cyOX?=
 =?us-ascii?Q?DcNGYVU21BV6RnGn3ZdIbP4GlsYUVTkL98qmixlkCv6oKM+k1OCmi5DQaXwv?=
 =?us-ascii?Q?Q13ldGgTZF2iG6lIoh0A5+1baCzTJCFzw4ZfhBktp1qL8w112EA/DeMy/6QH?=
 =?us-ascii?Q?16HcLfycG/Y5GXNO7RMyw8fQ9hOsPlgeVojVGB1nIVGFhbBPZWdJuMMvOA5Z?=
 =?us-ascii?Q?RhGcsYmPtxMbpFSENc9TOi6I4JTM9SjtVxQPWGd9zXKsEh1BZLEyyUreVrWc?=
 =?us-ascii?Q?BFyL1R2gHmB6qz0lw9UzeCJ6QZZXdoDAcxh0M0z2OfsiHsLYfiln0ioMT/xe?=
 =?us-ascii?Q?buQzaodOnEjcw6hVSzyWq2M8qwjQwHStxd5Gp/IxtTkEbC9rpY5+/7DJNrmO?=
 =?us-ascii?Q?NnmkaXYIf7Zw7mYJCrgvYie3i+lZ5il+Mvg1na1lD5imw/y4qf4oVsiAH2jf?=
 =?us-ascii?Q?GODubE8+AIeHqJMbiEk9jB2Qe0oNMy9QoxMJwjZu8DYmkDLGBiRphUZluh4z?=
 =?us-ascii?Q?VYmI3QeT8oZvx+F4GoJ6a83UmSLKBT/FvjRVcRw7UCRqiA+Y/YpFkVFe5Vek?=
 =?us-ascii?Q?76K97YPx1OJLtlp3QHXvtwUNglU6tm2lWV9+X9LgR0wt+KkPpjuS77wta9MC?=
 =?us-ascii?Q?Xsr9rA2MNqAmeR3uIRF1RTj62XHCZX/A+28Ysa5smw0Puum+KQax44VJehKM?=
 =?us-ascii?Q?auHDcf5xM6bgNU2D4lN0IQ57w0hCkebGpPeYwKVCYQPTmkbmAAnHKe+fjnzD?=
 =?us-ascii?Q?8D7TpEDs2NwKMV15tNsdM4sQzaiCfnKeai0OJnBXmkJv88dlQShNGu6foZ4+?=
 =?us-ascii?Q?Cuu2kN+Sdvpy/UgBcTSqsOFGQFsfZv52DfscM06Kn1y7c8MWGiXu4dbBzE8A?=
 =?us-ascii?Q?5QUMz+dveWeXKz3YXhCvBnfNFu0+IVgPOvDMSe3LgmYo1VB+5wmWwT2JtydD?=
 =?us-ascii?Q?wqBgw02U4Bcunrlw5QxbFSorJw/tziIraC2ECpGZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acd481c-5a89-4387-f462-08dabbff5a2d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 11:51:03.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUg7jUdaB+40i3oHsBbtUSas3kn753OlA5HPVHYwVdbIn7oRxMc4vuRIBVEYF/Oa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Eric Farman <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 02:19:04AM -0700, Nicolin Chen wrote:
> On Tue, Nov 01, 2022 at 08:09:52AM +0000, Tian, Kevin wrote:
> 
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Wednesday, October 26, 2022 2:51 AM
> > >
> > >  menuconfig VFIO
> > >       tristate "VFIO Non-Privileged userspace driver framework"
> > >       select IOMMU_API
> > > +     depends on IOMMUFD || !IOMMUFD
> > 
> > Out of curiosity. What is the meaning of this dependency claim?
> 
> "is it a module or not" -- from https://lwn.net/Articles/683476/

Yes, it is the kconfig pattern for "This symbol optionally uses the
other symbol, and if the other symbol is turned on then it has to be
the right y/m value"

ie rejects vfio being built-in but iommufd being a module

Jason
