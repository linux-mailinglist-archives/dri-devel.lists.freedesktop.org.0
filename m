Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB5508EC4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81CB10EF7D;
	Wed, 20 Apr 2022 17:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4442010E1D7;
 Wed, 20 Apr 2022 17:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6w+lSJxQJMoaPWWhCP/G4BsdRxroBUDP+qPZcygHjWpGHVTxKuoPgDTRlLfekyUpt4CsmkycBgYUdBF4Z8UIZXXf3o8JXX2GpCQsALn6P99XFfI/J2YbuybDWK57giRGhRkBUhYPUrvvv8loAyWftQvDqOJSlZpMxzZZOw8B46MIIvO1stXaFnj35J0y+VdKWEOZj5m9+ujbVsfvWK+/CQItL8OU1GTyPW62lYMrapWzhZ2H3GfD+ycfaE2JH1YgOiuIpHhOTJx853hYHn1Hovs1rN+wtl9jFlrmFCaE2WT9RFx8dq3NcUEMHEZ010gsYOpvx/5TE3ruHaLkDIU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip0VFHwyOvPu/3yyT7DgACY9/+QlOFfJ3d/RXKniolo=;
 b=Xae66jsOVgosR8bF8FL34ixJqORfe8PCNsAJGQrU3bZ0KAJyZ2fEIcL6BT9cZ6Orq59DqzoAp/X/zdeuc8wpuL6ar5pohncpXDdMiPoYDMR5eIYaF1jm7MwVwaQhizwsK+JYznRums6K7WOLDV1BPC/cGCAEjJPQnvPuAS4nSr8q+sPDwcrne4ikzLMq+De9S6dOk/54Z6iCFo3DB0B1jiLskQl3CJdV8zLHKgLa6FMTGbixh4wexX5oymJqDUUTXVHBs66IDE3X5cmd4iRocD6w6bIztbvY43eEp648wZCuGqeXfR/I7zL1oAIhEj5SwG60ipzB4XJvpo/irjAsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip0VFHwyOvPu/3yyT7DgACY9/+QlOFfJ3d/RXKniolo=;
 b=CDjGaXGyVv41SKmTZNotDVuP3OT39yG/mJcpWwjFJgVXPCMEANnB/b0EpTVJYpGSM7fS2fIaRSLIszZY/07e9HMdRghFspLPVvyBXD0OQu1A46doBsJ6k8bJzTIyNbMNpK9c1bvsrAMOo72xEiu4cN6PAdc148bbCQL1KOq/Dw3Cs00++S5UqyplGaVnVXZReKzmIzc1m5+/dv+sQeFr1ooCEZPF/ayXpKBcNt6BwSsk89i4BfGh1y4IJbvqpT8fzlXvJK4nCX64vzaNCOMnyPIgBuzry6fSu6Y7SzP9spfJPQrqdNT11fmdnLbs1N5MCG4K+tqL7eBss7Dl5DdQNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN1PR12MB2525.namprd12.prod.outlook.com (2603:10b6:802:29::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 17:46:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 17:46:01 +0000
Date: Wed, 20 Apr 2022 14:46:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PULL v2] gvt-next
Message-ID: <20220420174600.GD2120790@nvidia.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
 <20220420114033.7f8b57c7.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420114033.7f8b57c7.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7860aaa8-89cf-405d-e6fd-08da22f5a28c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2525:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2525EC075E41E20A44DBBD93C2F59@SN1PR12MB2525.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tjYM7DY24uymuQLYnneDQ9t1KFk1GWrVDiMnYsfI/Kgp7BQErIZzFlyjF0whGiX1+7zW7MjCH3akeMuM/bSOvktwoHg780Q6I+njKJCZKLgC0thQYmo+w7a8dglPFdzwIvlBfWbsQH78T14NHFYduIVTdsF1E+Baul3Kj/5BP0oMJMuJNX21kQOb8n/pTU93I4PPOnxtjRy2kZiUCRoU9sog/dXQwrz0CodPVNkQc79YqHoSKTu0SXlluBbLHvT0mOZ9CzUzHxmbv4141pQJ0UQ8zjgfLwivONd5cw1QQuyzT9LeATuInH5uvtZX2K74HC+bw0+9uNBkccBEZmiJNVXYj6/mV/5GmYwDkh/StWBNodds0ymG1xXA14VfH34hL8OgBX7LnvemUdGAvQVSoWHuwzbv1pMqbFebbEMuR1KIGpL2uoltQPisIESeyLWYDVKNNRBrynkLunThc2s37p+tDgZ1gC+WnO214SDWA6B2F1yAPo770Cgj9rUHRE0OdXOwNIz2d8X7eMwE7QRMBiP1KnBD3GIYbKCYoLfuPrJdJEX1k5mhZyFuv0UPW1FDHc/5QMMIVzzA6HIxiUQA97IY1kAzfUV5dXu7ENKnIiyLbigGkGEg1Y+wj0RHn1tn5dIcWm3LnkM+0KnYDJTuXp8sNR2eDZ4WAbWDxlrqAB4FXwi3B4wowqSbUgv5+MHQC/TiC4jDzjYLxhb28aviRFt4HKRZ7QFzmOQ4ZLPwZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8676002)(6512007)(6916009)(26005)(8936002)(38100700002)(33656002)(54906003)(508600001)(66556008)(86362001)(1076003)(4326008)(316002)(966005)(6506007)(66946007)(2616005)(5660300002)(66476007)(83380400001)(6486002)(2906002)(36756003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lPiQ07UKjRslpSpOmJ5k/ZaKCTF2KOkHzAUqvWuw8PG8nIzQsFwlEg3LLCvs?=
 =?us-ascii?Q?jQztxu3Je/jcBcgcZj11h37He8Z4fwNn/zOG/Pm8tuuEdxL+Io0h5LZrk24R?=
 =?us-ascii?Q?iVP11M8IIlSo0HLPWoL6IWKc8P3FeasYFOTGr6qyDYvzPslDktcCtAriKSVF?=
 =?us-ascii?Q?E+DDGY5crEJtkrMmvIL2ItqPnyLlH/dg8lY9c/MsofER5j5QWcz4AzHm/Ns6?=
 =?us-ascii?Q?qF/Ly2aLNkdnTV3jRosVBMiBKiwhEn9KfzREGmGw3sb9mu8Xfe3JO2kBI/4C?=
 =?us-ascii?Q?74nR/cwefVsIOZ+P6h45b5X3v3uWcrJOnZmeVrppo9jORvox/xBjZRNeIW3D?=
 =?us-ascii?Q?kH2yK1IQeItCAR4r5KIT37BmI91Y/tF4FiG5RqQXMd+2QK5gi0HzfTCWEXYP?=
 =?us-ascii?Q?oAaS599+hzdEiO3DbxYg0OPkgVvRMnuPJDKezMcnXitl5T+MZnObsKK//uTN?=
 =?us-ascii?Q?bIhWy//nWjR/aWzsCD3LdDObtsN+GqdWaTLq3mmSamPqyRFyNqHSwhw9Amul?=
 =?us-ascii?Q?YgA7Lc/G1RHsUrnITNIBr0I6EQx/kzqSNxH/L1rC3OTpn0Jh0dzAgz7/p8lU?=
 =?us-ascii?Q?Rj6gCQsSfj1osJUCWDbpeve9C6HtzTHI3+hQ0TtDpUIDZNkJT/SPAkfRm4Tb?=
 =?us-ascii?Q?hPnvdpSjEWNJgFojaP5FpT7rKbUwH2OQPOxfYpc+t3aC79sJvidGVaihqQOk?=
 =?us-ascii?Q?ojtbLsDdSln9xnavkw125PrIqo97sZfSHbE3uW2IeY91SMhCg2Ho1OvKuJ4+?=
 =?us-ascii?Q?CNdo/cwcKuScSIlp8C6t6vJIF96B4njpQGS00+YdKYZxUHuckDPW58DewIO5?=
 =?us-ascii?Q?oAcHsD1ReG+YvJ+i6m7Qpf6dauS+V0JlNrPJ1ymjC4Eb/WkPGHGLa1jGDr0D?=
 =?us-ascii?Q?wsrLpVtGl2N/v+WqFsyCoHBxsej+CstC2rxnow7U/H37N5oe6ofQhQFTZfvC?=
 =?us-ascii?Q?liKiR8ooFxrGDO4N5MC5J9R0L01yrQYLYas2xhDl5LB4ItYEuP6XzPnNY8SD?=
 =?us-ascii?Q?txJAFE/Ib5kSkwAQzDguciVFuRuwlaHyfOAus4BJF/va56TLNBvbHFP9iP7o?=
 =?us-ascii?Q?H2nQ/EV0xLGvmEj0gjTwBLFx54lQT60xC/+xEGuKXp/Y86O5RPJju7FIBLDP?=
 =?us-ascii?Q?6Z54BFa207oHrySJHWMiK6/b03eUTXUDIVZICI49+O1QC5G69a//Qpjg2RZW?=
 =?us-ascii?Q?RuKptKua8ImdcjKCOahZejQ1X0z7E6RHL85PrdHCVXpECFn/h4Hc7bdsbr4R?=
 =?us-ascii?Q?XeU0WNupF47n+En1EpSr+n9n/TO2PYBa/Vwyd1O563XVZZr67pCtX5TDQrkV?=
 =?us-ascii?Q?ocPy9g6actZ/DKsA23jQTy0I3BhOSScu2GUi8kozZDBfHXvPgEe2BnrqpRqy?=
 =?us-ascii?Q?tR27GVTw8+5pda2CjCnkZYNnyCXeePwcxzhSzIFvmJjIZoGgcZwEwvXK2yzB?=
 =?us-ascii?Q?g9EylkFd7VOcEAIPTmKWkJCdXTlm9vYMJe+IlaM/lL1Ug0SpnFBAhUxulOvU?=
 =?us-ascii?Q?gcp6+5qJfgiCSFpWUccmOpkgDOKqgz5CFsZC4s0UwwjHNooS4vYfPWUd+GFf?=
 =?us-ascii?Q?7Yz8/Wh0/D8wIKvEomsgzyfdNjZCHM858vPk0G6KBHLQ/tk06rx5EDENscUz?=
 =?us-ascii?Q?XpOHiO8WvMNQEtTSl4TnUEw8EqCWHTieGYucXWTeUX0lhE3T2meVTaKh35PA?=
 =?us-ascii?Q?e69yAwBREf4DQ/1C/7co9ts7A8nGhEAZ0/b7mlsWFNO2NvQYzH38P8K3g8ls?=
 =?us-ascii?Q?0IoN+Ln29A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7860aaa8-89cf-405d-e6fd-08da22f5a28c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 17:46:01.6758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jv+dlW099O9JE+0OsUKYqDJWzul8GfNalLh/CeBnvxEVpkth9wo+0PmYmIQl3xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2525
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 11:40:33AM -0600, Alex Williamson wrote:
> On Wed, 20 Apr 2022 13:43:51 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Apr 20, 2022 at 04:34:47PM +0000, Wang, Zhi A wrote:
> > > Hi folks:
> > > 
> > > Here is the PR of gvt-next. Thanks so much for the patience.
> > > 
> > > Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> > > new MDEV interfaces:
> > > 
> > > - Separating the MMIO table from GVT-g. (Zhi)
> > > - GVT-g re-factor. (Christoph)
> > > - GVT-g mdev API cleanup. (Jason)
> > > - GVT-g trace/makefile cleanup. (Jani)
> > > 
> > > Thanks so much for making this happen.
> > > 
> > > This PR has been tested as following and no problem shows up:
> > > 
> > > $dim update-branches
> > > $dim apply-pull drm-intel-next < this_email.eml
> > > 
> > > The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> > > 
> > >   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-christoph
> > > 
> > > for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c504032e:
> > > 
> > >   vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400)  
> > 
> > This looks well constructed now! thanks
> > 
> > Alex you can pull this for VFIO after Jani&co grab it
> > 
> > I'll respin my vfio_group series on top of this branch
> 
> Sure, so just to confirm tags/gvt-next-2022-04-20-for-christoph is
> pruned down to exactly the commits we're looking for now?  Thanks,

Yes, the above is correct and the tag points to commit
ae7875879b7c838bffb42ed6db4658e5c504032e

It is the bare minimum series

Thanks,
Jason
