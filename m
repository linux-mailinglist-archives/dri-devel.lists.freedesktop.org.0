Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87648622104
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 01:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AFC10E54A;
	Wed,  9 Nov 2022 00:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6210E549;
 Wed,  9 Nov 2022 00:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA2fjrfqMHfsC7hOlnU6ZN8iR00yWkU1d8hZ4kuznCys6IS5Om2GO7Ffopd3lZlSCRBA1JDf7l8P9nO/E/YLLB3m5hFDJelgEwjQO15JU4YCwg9accX09CnkiTIh+3uEizZCytycZ39jsJ7w6U5AowVmDp3DA3CSckkAlaJqAT9uVZ3vGTEJcDxejumHJc8MRisWkuK4+1YrrK7U1urZC8Zgjq5RjhsiEkKYM7MV89t2GvCZ1Xf26OrIu8Igo1kDxYp60hcZM6pj/75FoBa5eEj4Xszuao+BSxrl9AStazzHvlezmp/xMZKwxIG867M3q8SiM01FIYFq0626IklJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXsD0jHWLYYu8D9wwbQFyp/okv3kQrGJdPAl/4NsSX0=;
 b=QcmRsBcE5/PGk+9iZePF1IueDf4ly3h8efeGEp9tx1Gw9MwnaF2el/FHnthOInmSFaKBYJHPOuxiZCfFtucvjxD67URanVGkZdMwr+oDay1uRRT4IqzaVL6qA6AhjqwrYSFuTj9V5tpVFAHt/IBJPQ3hZZ/C8fYibjML+/uGubQeZ8XhMaKnZhG/WwKKoLZZpEFs4fqTNLjZfP0yb1I2xoJaYcn7E5rjbczO4ZHdp6Ut79H0W/NnRu9UgNMhUH86KLRGwhlLiJVKPUkRpkcETNbFTh5rS9F2oVyT6HsjovacDLjXrfJ86JW+EgLDs3t+nirITLtx8clelPxZ7nT2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXsD0jHWLYYu8D9wwbQFyp/okv3kQrGJdPAl/4NsSX0=;
 b=NCmQBdzb4LFx3KYqbxLSYWRFDRHgkWDghDSyb882TF3qf1M9eDuA9JKwVg8GYVtVtuT227LsGjytaK74bgqqwpXpKF72yJFtzinicvkPKMtmo7fXiTRWuLbrNnXcn9DGsFBv7F0CI76+lSuW1a/XWAbq4vSoAV0+DeV1MXvShwaHOkcu98eGmjO+5vAkM4WQHiKIYDvUBp+qT68LRQRsQO1FTG0jNJNWey5uufGPg71acWmSIdlKEruvhC5hmGg6g+IsfsJDdscufwqDANLYCjuB9a1a478oh8Jn/1bED9dJuMixPbeNsEc5fiqVfCgZoviHJwGtwHfw0ANhxmyj3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.25; Wed, 9 Nov 2022 00:54:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Wed, 9 Nov 2022
 00:54:59 +0000
Date: Tue, 8 Nov 2022 20:54:58 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <Y2r6YnhuR3SxslL6@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108152831.1a2ed3df.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d274bb-b70d-492b-5321-08dac1ed0697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjtXM6iw/wEAtkXwU8YSlmJnMZ89KqBOLf62y/xYzAc8+omnGeezMaY7N4Ur+YwgXfZWdBazvY8c6R1e0i7sVCslgwFmQXlg6X2k8R9iVJq1m9qmmSe+vFZma9IMj723dEhH0ThK2JLMRpAmTPAswk7EfjowFxO0MPeQkrpH7/sK65t14spQMdqHzKMrtIb00Nw18uznvKifgq1YuoypcfxKjjQHDA254y7RzQfohH2ss3QKUC5FyHmvV6MvCTeiaYb1m9BjaqzdO048qBVhQNOQV6axaO+qMeHKb5E/cfxFoyo8cz/9WLSuOU7XtJBc1ifyrBEoZ79Y0scTCcGZ9WeSVrNopt7RXqMpYB2lCSQWGCbCE1tTcRenq1uHzSBzfx8x5lpdfLHjh5NE+TOCsA9RcETwcuJjFxgo40bqIGQU8BNlr8tFBECCc0sPDW88uYS5PCbC4DKv3zBiU7Ti/+teM+QtCtbHYdyGKdgbw8JHeyUrRGZXm0oXMWmZCZ2KrKGwJtzjjiqJWdiQSfaWGdIZsDX/fDJVUs2Oiyc9jctoi4wpAGRpOQ/CzXaOc8x98C4VCtUNMXs+yMT3oA/g5wB6EiQmHHOtF9IZtYKAHuyh8MdqXx/K24ru5lpq6kyQgsWp8gZns2qNzm5co1m8NXJpZ8TQk8roaPjNHZcreplAh2p0IjdemrPePJ352qBB25xzHl/9FTrT6Iyp9TvCLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(36756003)(38100700002)(6486002)(478600001)(8936002)(86362001)(7406005)(7416002)(41300700001)(6512007)(2616005)(186003)(316002)(66556008)(26005)(6506007)(4326008)(2906002)(6916009)(54906003)(66476007)(5660300002)(66946007)(8676002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6CU1DDYQ+All0plxOwsQW0QL28WYA3ikA3QIri5O8hGhQJhPDYQon7lb10YH?=
 =?us-ascii?Q?aRhEzkxv5Qj++RkDWk3mFNGCbPcTcjUF0pjs4r5xfpfT0WUqjDVbCJnvrtjZ?=
 =?us-ascii?Q?8Za9UYYVZfo4bRaJLlG9DLo+i97cNNL1fPt8XZf8vjASB1UE4p7IPWuue6Mv?=
 =?us-ascii?Q?xS7lrxlEKs9BghTtF8B8fml8D3qYEELT0+VVPRxHBxtUUegvvRDoc87uFfC3?=
 =?us-ascii?Q?VnZYIT+qu3Y3De9FCUR4SirclY47voFT3QRQPMsUXozUS9tyHwT1wemp8HYj?=
 =?us-ascii?Q?LkS0gM6bvIFY+hC0DUsTUMVdTN+WqXPwpLZYdJPSsWZ1JJbSciRLaUz0/l8W?=
 =?us-ascii?Q?43IC1drxh6G+p6u5JF1lVymW9mfvbjaraOxbrAhAuRiJfKaaIjWSxIuswgjc?=
 =?us-ascii?Q?EFxBtFedHMXhmA733/tx3w7ap6M7Eejc23qCq+Yo0mHEdVNMSajQuZb+ZNGs?=
 =?us-ascii?Q?6q9AZC8LQQsH7xk3GFgFwnEyP4t31I03i211a3I6bAm7xf8t7TGTuzBNA8aX?=
 =?us-ascii?Q?GGT7Pt/hVAb60c4hD6moteAxy1PX3pEKzmm1JrAxPJERHVC3uKxa4qh2qi3F?=
 =?us-ascii?Q?74c/Ydp12AvADESw/ungHrmcgN53C+tMN0GsI0HSz3QQ0rXj9Yc/5vEVZPFx?=
 =?us-ascii?Q?BEOj6Cm9g8K50ikJXiNd5fsVlwza8H2mZ+n/PeF7vOlnDvpCdRrhq/bmM2i4?=
 =?us-ascii?Q?8wWVpiyL4VAgYjqCxxhZjJsacDncWwb9Gm+kbZGAuG2N4MoN2xUgrwDHtOZT?=
 =?us-ascii?Q?fMRQ1ZpSS1h5RYV/UX68c1GeRntvIqaCS2eXFYi4gJTt8eoBwCs0wUuRCSTs?=
 =?us-ascii?Q?OYMxqbX0YhFHcOlyObHhpdAjE3Ex2BKeOeGF8ATKng/MW9NPiDD5Vk5dxhjm?=
 =?us-ascii?Q?sCkMgY/iMyz2qhumWlQLA7XKDwRyODYopyYHje5r2FnMfwqoDFZsEn/F5mCY?=
 =?us-ascii?Q?h4soo/LrAiYwL066iRTdBkZDlofumE4CK+FqoWWGyx0jfh6NQJq1ofLnFrgs?=
 =?us-ascii?Q?jSBannAYBk4lpqBFKXUYxIdAgsC3Z7zT14EPQoq3d397KTBAxbz8HgqK2N9w?=
 =?us-ascii?Q?fmNVj37W02TcopUHyayWnMIw9SmYYo/we7LHDfptE7+MZxdHhMeiQN52Fjn/?=
 =?us-ascii?Q?mzH+tV/Yz2s7NuDzrGGStExPkDz0KIpzH07BHYGZIomejmmwpSK2HYIAg6LK?=
 =?us-ascii?Q?2a7KVzMoMioKMTO/u0o8SbH5a27Mof5Y/fBjNSuGwaHDpo7JU6kHkjO7JNMP?=
 =?us-ascii?Q?D/x0HJiSw5GR1CLhcnD8/Nq4xdvzPAwHo94vWeDVDn2XXfSzivPyAsIM8nZ4?=
 =?us-ascii?Q?aX2onnyZgnS74yMl5IfWiMmI1W8cUnoAZLjue8nQiVKQ4ax5rsjbRTwzqfSw?=
 =?us-ascii?Q?Y2q50X6z4CCGyQhxEDRg06+s6A22NMj/HZC0oFU+olFAwjeUl8Y+/CFD6EUL?=
 =?us-ascii?Q?z3OmMLI2M0pzvMaYwgw71/h+WwlmyXthbPKAJHsVfXn0ytbzryVz9R3APCEF?=
 =?us-ascii?Q?OINMrw6rThD0IJ64EPhpFNArn5UUbnod4v5PnfUz1zxa3ykR+o1VHGeBRW9f?=
 =?us-ascii?Q?Upct+v4FEG5L17CUQrQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d274bb-b70d-492b-5321-08dac1ed0697
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 00:54:59.1305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtxgORji82o1KT0cHLeOc0ByMRFKQ/t2AWMGGavR7eMvbe/jBG72VDLTsyIT0DvM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
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

On Tue, Nov 08, 2022 at 03:28:31PM -0700, Alex Williamson wrote:

> Perhaps this should have been obvious, but I'm realizing that
> vfio-noiommu mode is completely missing without VFIO_CONTAINER, which
> seems a barrier to deprecating VFIO_CONTAINER and perhaps makes it a

Yes, it is the same as the allow_unsafe_interrupts - it is something
that currently goes missing if you turn off VFIO_CONTAINER.

This seems straightforward enough to resolve in a followup, we mostly
just need someone with an existing no-iommu application to test
compatability against. Keeping it working with the device cdev will
also be a bit interesting. If you have or know about some application
I can try to make a patch.

> question whether IOMMUFD should really be taking over /dev/vfio/vfio.
> No-iommu mode has users.  

I view VFIO_CONTAINER=n as a process. An aspiration we can work
toward.

At this point there are few places that might want to use it. Android
perhaps, for example. It is also useful for testing. One of the main
values is you can switch the options and feed the kernel into an
existing test environment and see what happens. This is how we are
able to quickly get s390 mdev testing, for instance.

We are not going to get to a widely useful VFIO_CONTAINER=n if we
don't have a target that people can test against and evaluate what
compatability gaps may exist.

So, everytime we find something like this - let's think about how can
we make iommufd compatibility handle it and not jump straight to
giving up :)

I'm kind of thinking v6.4 might be a reasonable kernel target when we
might have closed off enough things.

Jason
