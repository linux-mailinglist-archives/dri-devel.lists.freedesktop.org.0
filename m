Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8561FDD4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAC610E3B9;
	Mon,  7 Nov 2022 18:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9AC10E38F;
 Mon,  7 Nov 2022 18:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6FMRCLqsk9BGwRDicCIe4d6rgz9HTdbSK3uGp1+qAmBNzjFNNr5gSN8UM/ZGXphpWCk6jF8RaHlwT6wavh1Cg/B+LH2TQzJCgFxUfwS41WgAYoK228OsY+FuL8nnBmy9N+y/l9XDq+CEKOws2zM8iBQsSlwU/jtOwvqS4hS+z6TrJ0m+XF44rRIeHGQHMqHW4Qxw0IoA9w2iBWGv/Za0XfVvT+mjtYJ+cUrQJ790eiRRDOJC4Xc4IhE5KlDA9GN8BkF8kzoBud3xGjDNrUn2bo/Ktf7JFDow+IKTPk7TtCcUjM6RoldUxbZeVnR4uyth9zo/e+5kzAW0Ay/Ng6cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfDSnX4a8rAzHrRVgGZ73tSTfv/MuQE9rCLao9Qhh7c=;
 b=NJDPWL0LbBKs7v5vFpqnGIjsj2WrwL8raMOs4vQoW9DUAiapaipBhAkM+qwGCwjb0hXuLMp5BXS3BlHszNwxwi3t0FPCpbRvc+bDm3lunJNAB49XMcI4TWEOgO4yIy4J7dFjsroGBw5Hj141jRoW7pCz2G99kA73MiPUSLMtgldqVqNKm8Kp9wWJyEnJhQJyerrgwrdStAI8rtVCCmbeqKB7od0Yan7AfdkmO0jR8KYF7eko/iR9ABowxXonRRqIeh2TmYJVimSaCMEPWoak/sY0i3E9kJN3g0waZA/5feuhtKsI+O2d3t9b0MxlIgliWv9SZmnvcDvxsTBC1O8iww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfDSnX4a8rAzHrRVgGZ73tSTfv/MuQE9rCLao9Qhh7c=;
 b=WjZSc9s3T/bOxCd6bZFnkhxFLEA3VAg+pJVEQZwPWEWrQKM9dAhJgNuU38SvxLFxXpJMNwTu2CuLB+tv/UTM35UI7ISh9yqVfbUvCf+WQor95X9fKHreJtbq81mJeesZ8lLmM5FN9h4SB1UtUMxjCAPDG7dcRT/5kBc8DUYcr7DDC23z8hzOs4D3wopYtrTkP8FanhI4gUA1hYeAah+md6xqgfyM/wDDnErRGtVdoutfo2W/t6dDLPUojgJFZJFG09Zy91l0/Yn12at9WL0OYgbLp/bMh07vBpouG1CsFqCwtkZYBBlxF0tlbKfild1PNa9hk/1G7MJtRvMX9ir7zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 18:46:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 18:46:00 +0000
Date: Mon, 7 Nov 2022 14:45:59 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y2lSZwNT8f/RMoZf@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107110508.7f02abf4.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:91::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: eb408cd4-7afc-40f6-28eb-08dac0f0509a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VvXaHvZA01YOedg4vgpMZLh18/qSIAgMnBmQ6JRfZkS65JTJGa0vWAHnUQlSm0hzHOX/cvMs58CINBrwMfCm9Ee2WfS52gChNd4ifX5auzcU1nroFEHDBSppBx6tNR/DQu4QVvpwho5GYS59XOW53QOckSpowx4t8SenB9qdeFlg59txDXFpQXtSC5Z+PKUvNhncsEsMon/m7j/baAk6pI2P30JzkZYXPzmxrpx1p3+z6bsILKDb80fiCUUdBzYb02JHWztyUTB28MGzUgz1oa+2AEw3FNkqxhtk4KER+U31KMJMebwQF/mSFLrDHeC7Ese1cfxuxMRUca1AXpz6dlSXikuxKc9gh17Hmg8XRVIDjWxxLB6aAx+ngFrhiUwXKgVF0TdQTGX2U0W8wuvjf6DMdedPQjAIcfksIINNhOBKQ1bPB6Zi+oENV6MerAeh5h0Oes6I03FkaMT3eJnvqAWItgfFWG1h4WaKvV3cxdUHVDJetQgi4S6BR2ToGGqkEXxXyPZHo1FGY3CmNtlGTJGHNphthtdaXcgxv7bDEi2XrJ0rVqhm0JP0+GN9xlre5FJ202+2b8whUBLU3BijXr6oYItCLI86DHLobtQ3TzdhEy/PAj9eExa3TClzQQeX8RKFaexSWim6HBJos5T9cRhNoF7wAFesGRFWGiDdL5J4jLyMnYL3TifI7QusfZzt0tkrllD6MT6Tf1RHS7Eb6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(5660300002)(8936002)(478600001)(7416002)(6486002)(7406005)(41300700001)(6916009)(66946007)(66556008)(66476007)(4326008)(54906003)(8676002)(83380400001)(2906002)(38100700002)(316002)(6506007)(86362001)(186003)(6512007)(2616005)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DMwNe4kK/SCaQrJQw1cdeScqlzhHvMi2end8aF6n89gX5U9fNm0vF4VYpNnG?=
 =?us-ascii?Q?brCNDQuQpOIkCgXD/V3Y9r2DS4kjfIhXaoScOoFTmw/jtpGJBcNHKB6oLyBR?=
 =?us-ascii?Q?c7/kKW+juCuw19FbjOLphZmiOUNqnRM+YpelC/IZHjXQQeicghtMu4wb3ftI?=
 =?us-ascii?Q?P62250TcKs0n4JexZutPYw06eu2pHbEUMX4Xm1Jsb9TBaJ5uKOh97LqwdD3A?=
 =?us-ascii?Q?AQwJs76QloGW80lj+oFu6gif3iYxDegaEPUMPzyHS2srD0e514V81inKRrkW?=
 =?us-ascii?Q?rdFggs1ljJRd1WkPt6LgFb7VTL4efp/RTIIxlLWYU598vwn7ZgEz/o9lMGva?=
 =?us-ascii?Q?YW1HSPKvjuNHvBo8oVuLttMGP3fyQ029XxO5r2/K7Ie1nz6QYm8eULsGo2E+?=
 =?us-ascii?Q?NKTwZVLxPjuB/9YR9+CCb56X3LekiLXvZPsk7syjpBYVFtk6wTri2MaWbwQ+?=
 =?us-ascii?Q?DjpvZvgd40x35ewR61ohLtC1tpTOWzevHGahBJ85jG02ln6ucPSIZZqYPPwN?=
 =?us-ascii?Q?CR8bzzBIocS3HHQoSOCFIWUPFxwVBthRw5FJvTKIbtW0pPHy0mSGHMm96sqw?=
 =?us-ascii?Q?zRcIfsk8D+GR8oMcgU5HSSj+0SFtAuEyVk6rozra1v/0J57pKsv1TiqiOgCQ?=
 =?us-ascii?Q?zvzgFUYJj9Reo3otqGcUINsyn/frKSeh6p6wW5bgj9OmEoaBZlaZbRMg45Fy?=
 =?us-ascii?Q?FtUiqudjk/tmJvfXs248ukI1ol/FMAvRdhXKBr/MwC3zmTXxHIlB2MTEelJl?=
 =?us-ascii?Q?3Uv6LYsMBPPEIpfruR82+7pFAsYsanqSd3xcMsFqUB4czSHKHSw9Cn6YGwGq?=
 =?us-ascii?Q?/xJVlDByUQcFSy3iGcqd5zzc0FUMPV49OefS2wXthIo86J6HXEG/GshVFqrX?=
 =?us-ascii?Q?Mhhn9GkkKpThxmwvvMmbVe3+jRWwWt43vpCW0NdiuRqPG9dbOfXiwphJSDz0?=
 =?us-ascii?Q?nfGZr2zu7Fy243o91cVio9hbXNRAum1I56ZsW3MV5EcZZ+5Xxy1drmCK1ghU?=
 =?us-ascii?Q?Cvn0H2EM5ot7iI8ygLXtnMqyTdKJsN27QD/AGjhbqzaH36W1nr4i9wPjnXfm?=
 =?us-ascii?Q?hDEwSWgV1Kr6x01f/+EJYuxSzMmEOEERh0uts1Jh0OViAiHM3kpvSX8RxOOa?=
 =?us-ascii?Q?cnvN/efaM4jftIxrRzeqM5i73y4gT3IWyjD3yaXMky+vIb+mRpfTdvvX/As5?=
 =?us-ascii?Q?eUO/6bd94fFLCPIZh8yPGX2QNtEuxC8GHLVPzgtz5d8gb3s1RN9qIzSqkrEI?=
 =?us-ascii?Q?fYDl4ZKTjjhKs/YfdfLk2deB+KLw/K9BrJJAWeY/bXSJhjiNbYtagxKwF/tP?=
 =?us-ascii?Q?7v8JhOJyx1JOvyZYMp8h0tywtEYG0MhWdxQWa547kIXlJlcMGPzaqgdvREj3?=
 =?us-ascii?Q?AgmGF042GsrqMSdpnif2dG63XlwM7xcns/5vkAVoYi/WfpUVPthDxu39Q24y?=
 =?us-ascii?Q?JbXu3EP/FjzAixcpVk5MbYL2L64vzGOHlwS9wyDGVL7lC8gy2D7NjlSUZInb?=
 =?us-ascii?Q?Zqy5omlbwPxkst42QtoqXHXlj2krecBTSJlyQlkAWKRju9x6jD1rVMfu0DA0?=
 =?us-ascii?Q?ZmNStEJ675jZ3AWsheU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb408cd4-7afc-40f6-28eb-08dac0f0509a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 18:46:00.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZjqB6MDwrTmDB2WQEFtRBbGzMq4viKVyY7/Oa7flvd1MLqt1pgmRN4ck4tAIEFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 11:05:08AM -0700, Alex Williamson wrote:

> After further consideration... I don't think the option on vfio-main
> makes sense, basically for the same reason that the original option
> existed on the IOMMU backend rather than vfio-core.  The option
> describes a means to relax a specific aspect of IOMMU isolation, which
> makes more sense to expose via the IOMMU provider, imo.  For example,
> vfio-main cannot generate an equivalent error message as provided in
> type1 today, it's too far removed from the IOMMU feature support.

vfio-main can do it, we just have to be strict that the EPERM code is
always going to be this case.
 
> > > If vdpa doesn't allow full device access such that it can guarantee
> > > that a device cannot generate a DMA that can spoof MSI, then it
> > > sounds like the flag we pass when attaching a device to iommfd
> > > should to reflect this difference in usage.  
> > 
> > VDPA allows arbitary DMA just like VFIO. At most VDPA limits the MMIO
> > touches.
>
> So why exactly isn't this an issue for VDPA?  Are we just burying our
> head in the sand that such platforms exists and can still be useful
> given the appropriate risk vs reward trade-off?

Simply that nobody has asked for it, and might never ask for it. This
is all support for old platforms, and there just doesn't seem to be a
"real" use case for very new (and actually rare) NIC hardware stuck
into ancient platforms with this security problem.

So I'd rather leave this in the past than carry forward a security
exception as some ongoing 1st class thing.

> > and IMHO we don't actually want to enable this more
> > widely. So I don't want to see a global kernel wide flag at this point
> > until we get reason to make more than just VFIO insecure.
> 
> But this brings into question the entire existence of the opt-in.  Do
> we agree that there are valid use cases for such an option?

I think it is something VFIO has historically allowed and I think we
can continue to allow it, but I don't think we should encourage its
use or encourage it to propogate to wider areas given that the
legitimate use cases are focused on fairly old hardware at this point.

So, I'd rather wait for someone to ask for it, and explain why they
need to use a combination of stuff where we need to have a true global
option.

> Unlike things like ACS overrides, lack of interrupt isolation really
> requires a malicious actor.  We're not going to inadvertently overlap
> DMA to interrupt addresses like we might to a non-isolated MMIO ranges.
> Therefore an admin can make a reasonable determination relative to the
> extent to which the userspace is trusted.  This is not unlike opt-outs
> to CPU vulnerability mitigation imo, there are use cases where the
> performance or functionality is more important than the isolation.
> Hand waving this away as a vfio-unique insecurity is a bad precedent
> for iommufd.

I agree with this, which is why I think it should come from the actual
user facing subsystem not be a system wide flag. The "is userspace
trusted" for VFIO may be quite different than from VDPA or whatever
else comes next.

I'd be much more comfortable with this as a system wide iommufd flag
if we also tied it to do some demonstration of privilege - eg a
requirement to open iommufd with CAP_SYS_RAWIO for instance.

That is the usual protocol for these kinds of insecurities..

I think right now we can leave this as-is and we can wait for some
more information to decide how best to proceed.

Thanks,
Jason
