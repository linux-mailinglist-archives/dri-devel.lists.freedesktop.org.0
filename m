Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3892E611A61
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1310E8BF;
	Fri, 28 Oct 2022 18:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F9510E8B1;
 Fri, 28 Oct 2022 18:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L20ZWBYiGw07Z6tQbmRs1VHjXv8Pv4oXBTuq6/qrXNY6yrG/aEKrN0gGJrUpXvTldPHlGao8pwWK2mLmWIPOMiLkbo6T1j2WKUEE8BcSFewriintxnjv6J6ZWd/a8q0UgQaNLYNq4uefhMTwharEkxN6uiuaxmguV4APsNR2jmAr2RROaL44joxCxk6VswZp0lChVK9fyJ/TR4jKBjZriG6m9nC5rCIiT5rDNKQ5evW3v6eiFjfCChH5PBcMjtPsnqs0VYPx5qkKpVoAVzliu2Icix+h8cejpS4Bf8VWWmeLJLUt2Qd+zveUy9KSCDadb68luGKyoSFpD1xRUmQJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSdzbLnBB36sSy3f47cu2i0mAOh1oRMaWZCl4w2bx1Y=;
 b=SfqMEgyeVLJfe8/+RK3eSXw02IgWtS4iS5a68F4P55v4HI5MvkRAetYEpTBQ0zklyWH1s/rsUXKeh1tcP5LC0rXR8GwQ3I/cuAnnnu86HwnA6Pya1HyroWGs385u7GfBo8VkT7OzEssMwcHArDAGvrsSBIl5ajKsZJpC6hBpmEGGz8JlRR/28lWjOgzleLrvGZRgTu1QomHlJc3Vv9fQ8/3LL7nFF7mJJUBOHSXCx6P0i0XXGeUM57sTZLBPjkJD7F4iBO0czVe2TYEW7zpvVKoDQKc3OfAJbiocA39dsU1fh4vZSoOvaZ3tn8r1VVkfDd555ob8YE6j4JRT5esGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSdzbLnBB36sSy3f47cu2i0mAOh1oRMaWZCl4w2bx1Y=;
 b=TUvl0kB2+e9+aVkP54jRIBKQg18qdhdeU50TTak3r+7Zuxhv7L6CBhI+UoCj3GSU00mGwyGw9IzHnAj587Wt2wlm/8YcnLcN+Z5+UhFIvFP7qct5LG5Skfey921A3458OLbmKyZKWITnUOoWXriwGEIAKqAa6K6sqX8HqbdeZmglWYtmJfofRageVwXVCezsMW6wmWYJeE/eYWkuEkRBN88eFyRgFdRQwRRzezlBnsekb1+4K2ueypsryzY3cWMZKznSeUkFMfEgSJf96CExHWyWZim0Y1jGrAW0/Wla7Jk8StS2PstzxnlbuZe6qUWpNA+ONeIeKUEnsemMx1iG3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 18:44:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:44:37 +0000
Date: Fri, 28 Oct 2022 15:44:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 10/10] iommufd: Allow iommufd to supply /dev/vfio/vfio
Message-ID: <Y1wjFNxwPRm7S6yZ@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <10-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026153133.44dc05c8.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026153133.44dc05c8.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:91::36) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 55379891-771c-46b9-f993-08dab91476ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWnlC/PT9r9mceINA9Tmv7Zllaxw88boFgoU7nrjIHgc9vXn5dlUHRhN1fnGeJI2xvKRzIc+GUOK1hY3FTpjjtARXDAE+V8bC9N9YaMWaPCNU3QsGuYVYmj08fHpqUw2LlhhOewUIT1bcCJOOnynkUfyGXi4wAWQjMncagiqHFPC/L4FA7NoTpHaZ6xV/T/iO5anAfMWupUgnLVvGgmt/erBT3l2VV2MofSLhZu9VnobVnEiGODMBcxPI1i7p7jIckxSEGAGiZF8Wn4yZPvDQZTkaij+uCZk4RMQcSKMlHCNqK9mKxW3powsKBOjJQBGSuerXT8QuAa2ywa38znrwR1E8ERmbE3p/m1HAwL+qqF1UBcTHQkFP6rQSyUaZZxgC0sjvQDHfDzqvpMZPrVPfYzDcO0o56cfpTJuWMqeOeRotVZTKoSPFxVY9dkDHo/Hj8AhqezeG+iKl6mR5zLSkV7kiSJ9dt/IgYHGHJggApTFPZwrzMp0A5uMxIWLUMRcc0CcUT78ucLNvbybGNgZDQueIXYd69+6EUWLCL2qYT9pMT9HOESBXBRCZ2Ben6ALWaDcE0jLmvsdIy91YT0Lle5dMCdqQF/94AeJWG25bgLAvgLoFsze1jzqP/UsYc+iJ9fs7JEo2qpqR72AA20Le7gS5hGf+wF6ACtwKrZ+b9KyLYwSbMHGj27pCBJ0UjmFRLCwNEw4IAALd/KEQsaQBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(38100700002)(6512007)(478600001)(6486002)(36756003)(86362001)(6916009)(54906003)(8936002)(41300700001)(4326008)(8676002)(186003)(316002)(26005)(83380400001)(7406005)(6506007)(7416002)(2616005)(5660300002)(66476007)(66946007)(66556008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgaQ98LKJYMouRxjNmGTzVIzBFQ5EBnccVIFFDOBT0oLLEdad6HWHu3gmP62?=
 =?us-ascii?Q?41psuFX181yFAkRMlgNdrFt6DHNLGNFbI57kHQx7Yu2BjCLZXDUfhiCRhN94?=
 =?us-ascii?Q?GU7MpW+GuD4aoLK92sGixOXLECuYjP28zqo8HqxAAuLs10MHVRRZgkr1iMIL?=
 =?us-ascii?Q?5CfOALqKSQ7613vkGK2EBQyFik2k+6ny7VE21jD0H8AqHTj6hPf5mZXP8Fzm?=
 =?us-ascii?Q?CQ798lZpJOhrNT4ID3k3HfLa70VBmD/6eTtQicT97uf9Fj3ox1yXleuuFvHL?=
 =?us-ascii?Q?LtPcB+tY1xAGR6Z/olmQb7hsSfryQXkTMNTCPaYeLzo9sfOyyVjgmMe6kDl1?=
 =?us-ascii?Q?13ppVbE6WHhT3eqYXnH6YBCgilHKez/QXnLRt6WdDe9yJTSaK+d/EOcKHYnF?=
 =?us-ascii?Q?F9VjHiB3u0Aunsc0CoRY2ygmeDVaVknijcJQNl/SwCvoK6Te71Ntqz6mi2+n?=
 =?us-ascii?Q?QFRJagcX95GZ4oTsFlKUVDY4na0ReGhsGp98vDhWftsEtXOsB2Zm4+6hc7Av?=
 =?us-ascii?Q?t8L6K888GVPTwif1MWjQe13Hv/A9qh+kbaxPjXcl0vxWGgefxKuyvaXCTNin?=
 =?us-ascii?Q?6vamiSwyhuGFRI90rxOlIh1kx8k5Zg+1zJJdDYvsVceJzSt7waZDihoPMcg0?=
 =?us-ascii?Q?xQ9blOuDer+9qKhF3Hr7RFj7f0+FkVA9SDtszaKs5Tj03FLa2ttO3HdhJ1wz?=
 =?us-ascii?Q?shfKgoS5+mjebjwla9lAVXLOhcHpzFN63MSKBO8h6uX52kWIvP/PZYPBwG1z?=
 =?us-ascii?Q?r8AfecgUpFDswsu/ljeZFtHgaG3UZCG2Qm26cB48QKuUY3ybaKek0QMv2azV?=
 =?us-ascii?Q?mlIiQUogCGr2FHXnnfttkZm5DYEo4KoaHZsdLQ4x2X4XZ14eoQaRwOCwhEWm?=
 =?us-ascii?Q?T66GFMEec+/kpie3Pgj0DLawjGkAfp++ETNvHaD21X0kPy1XfBAiV2QpgWXt?=
 =?us-ascii?Q?2jOL8Ft/KRJlEV85tn7Zdht6OV9tUdHSP9EZyqkiCQfCahO4ypNiMQaO3FOJ?=
 =?us-ascii?Q?5terUWBTogwzgRj1GO70+xlvvxq751ZwewtT+xkm4nre6PBNubHv2Jjf93ER?=
 =?us-ascii?Q?lSAcfGx7TgkxTcpGxQS3zAivG8X0YMo6/WuoKuRi3v1wzIz9D4EGj4jCdFgj?=
 =?us-ascii?Q?gClrmcPfFM3M51tDjAhEQex4EIZMZvrI5QNOCE2fRMtmJdYJKgMmD0PaPrjr?=
 =?us-ascii?Q?xLe//uQjurJqkXk06l0wGZkaTalTRrsdPRnnftqAqaZrH9J5mtRzqVUTOxof?=
 =?us-ascii?Q?vt7X9gXD3yk95oEFHEAzqlaHZ/bdqXyEzGvgCfM13BpIu50PSLvUg2RePWe6?=
 =?us-ascii?Q?kVZMunD44sYJL4v+ycj86uiKWvxqrPjGAKZPRiW20hq9zkPNbpNRRkUe1Bq2?=
 =?us-ascii?Q?TS3WZx2biTtgBcPA0Am6N07U3N009BBi1JTJP8jqVT/ByTDuB7w3dNfqUPca?=
 =?us-ascii?Q?BRZrpUVutpuI5ywq5P45E9CQCAHvyaxMozkEu3Bi+5AsKKXgxROU158ecbzo?=
 =?us-ascii?Q?LaeVuhxEMCWh9r1G518NjRK1CFEpzx32Cpx9Ob4UMOKLcIuiUeIkT7xRPit1?=
 =?us-ascii?Q?EXN7t/Co2dPazLsf4Ew=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55379891-771c-46b9-f993-08dab91476ef
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:44:37.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBXNdDpuslO1OPVGlczhm/SJ/XgasoYUJ/hDs6D5wmsTRLyu84OLur0ypoqqskAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 03:31:33PM -0600, Alex Williamson wrote:
> On Tue, 25 Oct 2022 15:50:45 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > If the VFIO container is compiled out, give a kconfig option for iommufd
> > to provide the miscdev node with the same name and permissions as vfio
> > uses.
> > 
> > The compatibility node supports the same ioctls as VFIO and automatically
> > enables the VFIO compatible pinned page accounting mode.
> 
> I think I'd like to see some sort of breadcrumb when /dev/vfio/vfio is
> provided by something other than the vfio container code.  If we intend
> to include this before P2P is resolved, that breadcrumb 

I don't belive I can get P2P done soon enough. I plan to do it after
this is merged. Right now these two series are taking all my time.

> (dmesg I'm guessing) might also list any known limitations of the
> compatibility to save time with debugging.  Thanks,

Yes, that makes sense.

Do you want a dmesg at module load time, on every open, or a sysfs
something? What seems like it would make it into a bug report?

Thanks,
Jason
