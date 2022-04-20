Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C795090F4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071EA10F2AD;
	Wed, 20 Apr 2022 20:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773F10F2AA;
 Wed, 20 Apr 2022 20:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNY3Oxd5mI0KxzW3mnx0VTpYsbl9tnZ7nN2hh9NmzH1nlfP/NMf08O8PoyYdjD/27+h4WbMYiTbSJpwmfKQfESuYoGmCGIDuwtvFkYVBu9/IQLTH3vpzOig/HYjA0yF/U6TQCyO23b6osPShXqCu+PLNTXcNR8E0fgFh64RY9wj3d4soS+0KIz2hhHfNSAbzWzXPcNxkqP3XW6FI/CnltYBdNr74F1Sv7TLEHvFdWm5kFkTgr4p9dX5oyPwr6nuIMp1iXPeqKapyq+f4ihKlc4s+M8tj/qi7DwkzticxUSwG11ooa2LKedD7yzEVaXUQWhPQ+fNZKmjHLfXzFX0Ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvryBg/FfFMLekrZoVLGwCZ+CfqhBxQZNghJ/0jZlYg=;
 b=H7m5D1+kzdv64c1jUJfzpTvo8aYv/Y11Tx3TDLk2ci8j+9VNGdGqPyrzNWQlRSnnvGh339dfQ4jhxedQ8MF4vQmLnxN6imweJA/sdqzfTbYIaq0UYIx8zkRPizAcguKKdNsRPTvdnNDYrPz62ADSRogWPjf6s9SZEw1SH5zbKDL3dbtujFx4EkQ/Xx4rpAbIL9N9Hj/NnkgNYEWL4BfrPHjPbhE0cgSn2WCMGy746nNRoT7jNM1nD2YVT+OjAMlemCdYsJ3yJkcPTWaAqKzkm5CGKtICMPNWhSRR0NhL3qP+3b61txVIUOZfi+u7hMyqZ1hVZFXA2XnznBKpq9d4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvryBg/FfFMLekrZoVLGwCZ+CfqhBxQZNghJ/0jZlYg=;
 b=Rr6eh9FRQ8sJmxW4huAWAvN7bCRSKbL84Wjto2LG/xHrIqlN/9RpBvnYUQUh3CxpDAgeHAlo7SwXOhgFMX03xsalpUMQpbw8HT2VFgn0VURYhwtKmgK7uu/5fH9LsfEmrb7C0BkarFqnB1Y5AeR0Ie0bZdeAwx3Zr0wU9EfdYyNu0A/pe43DIdjLXJs9thrdqBlzhLjEb37PJMoFU6raUR8Ke6HDIoI0lNS+BKWDOWifoOB6mFRv0FNjbzU4SZUAXXgguuTwSxUuG5h1QssVJGmRcTcXcSjCroW/0vDGwgwlAPLHYEviumfu6X0EAexHbD6hMlYVZIW0BxRZpWRCdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1598.namprd12.prod.outlook.com (2603:10b6:301:4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 20:00:36 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 20:00:35 +0000
Date: Wed, 20 Apr 2022 17:00:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PULL v2] gvt-next
Message-ID: <20220420200034.GE2120790@nvidia.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
 <20220420114033.7f8b57c7.alex.williamson@redhat.com>
 <20220420174600.GD2120790@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420174600.GD2120790@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:208:32d::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bae995d-bfb1-43db-4950-08da23086f25
X-MS-TrafficTypeDiagnostic: MWHPR12MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB15980AD4C88D5EED238E8E01C2F59@MWHPR12MB1598.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEQ5ewM2rsgGSGSlUKgrIX4+u/DM9K+3F+iehG8GFpLdojLXhWWzAVTEKStp6LPFgykf/2LyUQ4Grwq56pFP98Rv2z7lr25A7PNtByXqqQD+J006/rjTCibTVWdRz4AkOqIxiHwYMnI9Jbwp7o8yLPhdAOsCH/P/dnFIgSDN2dWdpf9zzFQJkjAptwSeiodE7yh575r4I0epvfqnMVcbwmeW6XLAcPdYLDK85Rv8wv5EN7L2J7yPlK9naTx0Kt9IOxC8bqQ3E6imPkIf9myfkcwLvklqXRFsl1MMJ9aZxq9K3e3YKL1xmjTJFZtRiT0toQn90UrmTCixwzkeEDfDcrsYKttesIZMDtmyV1TvQlOP04ORToBJajEVhL0RWCtT+c0R8oM9T8M9mqYXqerI0w2Y/s4yZy02usPzeNyoWORVjbUylZ7eyyFDQLT+QpU1I131cx/RjoGOsLNPmeCGSapN2gl824BVbazVsXxMx+souEZvFs6oCAPgPS+XphG414lP30QHBBk/kyH7pq6jYs6cVE47whJL04LImueCUWZyEfaYS8QWjtK+GCmb/lvskCmvzX6wicsxDAHPyBA9veL+HGTvzgArZPX5Fvd7Xd8dVEW/JfqLksJZRhQ+Amh7CVrHCA77xSmOHvXLGadeW0pHh/5ESUUYq8WbztMYHGj9PyPqODIfdN2BcTzn5sH8iiFsXBLbFGz5yQ6wjJBUkhPyvAsFy+HUDOItm3A5HdI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(316002)(38100700002)(5660300002)(54906003)(66556008)(66476007)(33656002)(66946007)(36756003)(6486002)(83380400001)(966005)(7416002)(8676002)(8936002)(86362001)(6512007)(2906002)(6506007)(26005)(4326008)(186003)(508600001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPZcYJDMnvLxnAyaGk82vJugv98rPH6zq3MK+Rg6zsbunRzd1qL8NH6179OJ?=
 =?us-ascii?Q?DyvW7RdF89MPJhdJueVDczZNIYCSZC6ScETJvIqivPySfJ+521ejwFfe9WZ1?=
 =?us-ascii?Q?supIY2rTSEdUjYOvMfYPZ6Ucnk5rcjKq0oLTwikpUclSZ3MffHaB0rNqbvvp?=
 =?us-ascii?Q?JY9rJh4NbrVIe2vU1HaH4316jcSlt5Q23f+D6ZsiPAeKIYUjvRY4/DBNvbr9?=
 =?us-ascii?Q?hiwC2uCB3+wRKpDPKH/JLA/lHW/4wELtioIozuP+8OkNEdsvKuqARjDyvBD0?=
 =?us-ascii?Q?PTWmZ61QWYiMxmX5l8OznhNT9/NHsk4PbIcJ9v1hYqHDmNKesGWyE3OKyX4y?=
 =?us-ascii?Q?Lv15A4Vp5pbzO2Y/9ACrdJP5nK73N8tc3t7usF2vJ7x9awjbJplE82HhlXdO?=
 =?us-ascii?Q?25huML67EwagUpyTPkmLkFZMvFzmi7zq4J0/PiPQBE9DAuNdNcapyaajBTpR?=
 =?us-ascii?Q?NAg6ZDS5t5kqr7eTvBtQcXiKoIydoOisEX2YsA7PLFrYb8+UZ4Fu3uf1c5Qk?=
 =?us-ascii?Q?NhWVjCYm2r9FsTHYW96hrAYQbitA6sDLkFUJrNjJ47Nv5Z2XSiFhr7/+vCqI?=
 =?us-ascii?Q?aLkWS8c68eXF/3QoU4k3FuAL4HLlRyTN8y3OTIq4c0Ioeu72n5usz6qipH7W?=
 =?us-ascii?Q?G3Wf2wpu8DLJ38K0D7bpehXmHTu3kYoIIBuPIBUq3TCm4BQAXHWpVpsXCWfc?=
 =?us-ascii?Q?R2GYO3g08ppNlCtT89CIxqiC3uqQMcrk7FklMNjCRft/gOxun5DTkxfOPw9Q?=
 =?us-ascii?Q?Q8P2MnNb2E/gBsCs+B3S7JW0cbqnNvRIkxMiSgqYpacMW5UqPir15K+S1SSa?=
 =?us-ascii?Q?YHn1bW4TY93D+LYyJYlDKq3YzHQpqX9V5c2xv75Oq1BkZG2Xc6Vonc9Otse3?=
 =?us-ascii?Q?wrmuPF4EPhPPIrKyYDWuzdpQXdKcRT+194p0KHLNCGWgZjIMrbQeVSG1Zupn?=
 =?us-ascii?Q?oqBgn/OU9bPYCVzpiCNmOtWzKGyTfcm9FHaDruKUvTD4oPaltQcLZ3uQxrRS?=
 =?us-ascii?Q?A7UTzkJjwjf7mGcyyPIQ2EgHkfpfWp3Qz7X7aLL119JUgFNxkRqb76ODJO8K?=
 =?us-ascii?Q?96IbWsPHzK5lk1OqCXgdTY6iLKQKJOHNTpzlwQA/gsGRxp/QPzbKWTDRIfY1?=
 =?us-ascii?Q?pp5mguzLi9XMjruExO1mq39e6kBgEx3nRPH0V6039aw5VoNAobw4fsfpDLJi?=
 =?us-ascii?Q?flww6Mnl3KaXW5B6WZA6B9tsWHHJHGinzWaYCTPXBed+By4M3ufdywJF7rTR?=
 =?us-ascii?Q?oVWQEo6Ighn4a4Iz5ZkwytgkgzFkQJ4zDYg6W7UVs5/ocLQg0CVDnlhme1Y4?=
 =?us-ascii?Q?3vo2s2/Fk+KjMWk2vIdQsIjmgmVxX92Eq3VKut47ncwcvb5v6F1mZleP2Tl8?=
 =?us-ascii?Q?TTwyDtrUm56UhDMSC4GZeW+QePvPmWNPn8L1P4ENfeyChDJzc1cbvL+R/F0F?=
 =?us-ascii?Q?93baGnzLme7NQKMIjThhru6HHjCVFvtfcWc8vIDJPT3RuLzoWs8wtmNfOi+D?=
 =?us-ascii?Q?evANeW47d8PCG5dTyYI5ij5nwCpA0eTWPUdRxPMCnPG625GmcEnt6NrJ1Mdg?=
 =?us-ascii?Q?vy95kFt0uFXVtR/t86krABwkNvsXN8v0h3oY0NaROdxN6k2wZdHf3foxfw7o?=
 =?us-ascii?Q?wjjXmCchziW885UNJGsiQbyEMHPHP6s3ZcebWyxaiK7mQpeIzMA+I4/scBDA?=
 =?us-ascii?Q?RL+H3gH+/8QEN0kDs4US/yu+LfzjYUcGRP+u1HRICCyHxG/z/ghelYbNzKI7?=
 =?us-ascii?Q?OAz73e1fBA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bae995d-bfb1-43db-4950-08da23086f25
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:00:35.9333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZUyaf+3QHVGmdXFOVfCgqjd9EG7Bv5F84DyR9+YX+AFuPMbSDXWhXXD0mX7keu1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1598
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

On Wed, Apr 20, 2022 at 02:46:00PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 20, 2022 at 11:40:33AM -0600, Alex Williamson wrote:
> > On Wed, 20 Apr 2022 13:43:51 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> > 
> > > On Wed, Apr 20, 2022 at 04:34:47PM +0000, Wang, Zhi A wrote:
> > > > Hi folks:
> > > > 
> > > > Here is the PR of gvt-next. Thanks so much for the patience.
> > > > 
> > > > Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> > > > new MDEV interfaces:
> > > > 
> > > > - Separating the MMIO table from GVT-g. (Zhi)
> > > > - GVT-g re-factor. (Christoph)
> > > > - GVT-g mdev API cleanup. (Jason)
> > > > - GVT-g trace/makefile cleanup. (Jani)
> > > > 
> > > > Thanks so much for making this happen.
> > > > 
> > > > This PR has been tested as following and no problem shows up:
> > > > 
> > > > $dim update-branches
> > > > $dim apply-pull drm-intel-next < this_email.eml
> > > > 
> > > > The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> > > > 
> > > >   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-christoph
> > > > 
> > > > for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c504032e:
> > > > 
> > > >   vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400)  
> > > 
> > > This looks well constructed now! thanks
> > > 
> > > Alex you can pull this for VFIO after Jani&co grab it
> > > 
> > > I'll respin my vfio_group series on top of this branch
> > 
> > Sure, so just to confirm tags/gvt-next-2022-04-20-for-christoph is
> > pruned down to exactly the commits we're looking for now?  Thanks,
> 
> Yes, the above is correct and the tag points to commit
> ae7875879b7c838bffb42ed6db4658e5c504032e
> 
> It is the bare minimum series

Actually this topic branch doesn't compile:

../drivers/gpu/drm/i915/intel_gvt_mmio_table.c:7:10: fatal error: 'display/intel_dmc_regs.h' file not found
#include "display/intel_dmc_regs.h"
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

:( :(

This is the merge conflict that was mentioned. This topic branch needs
to delete the above intel_dmc_regs.h include file

When drm-intel-next merges this PR then need to add it back as part of
the merge resolution - so explain this in the PR text above and
include a diff that does it when you send it again. (or do the merge
yourself as I showed before, it depends on what drm-intel-next wants)

Jason
