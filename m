Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C963FB6F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30D489993;
	Mon, 30 Aug 2021 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5938994D;
 Mon, 30 Aug 2021 13:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5e/Tw7F9LU3DqSMdqpza4jicjKzkH5FtHJz/zzO3UbdhXZpKeHYSFy1uAecVORjckMpg6mP04W0vrPTJ5qsUAht0LGb3R2hdlFbyodQ7av74ZH1blOpuxT9kbbkRe8dYqvJlVJFKIWqipDWu6QTpgjwYc4V1Aa8iULKy1LdGSTGdnVbitt2i1flx31UsmauFCLUdetdn2rmTdvl1R2pEzBuNLJShqtunEMF68t7uO36U2pyaCfmHLnk67Q7v8wOpybFZzZRiZkY5RLk1+ki1lomflR25tpf1sN65V2f16nQlBAn+1E93AqiE7WyCTe3kJb8pKP/kcDoMGhwwohDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztOKym7ZQADMWE/PmEQ6wu8SLljLchUNhBlYQJ8cjic=;
 b=JbIbhwbMgn9eh+s8tiiBAccjCbLnisvchOvk1k8jgptQse86VV/ARV4jfnosM0h+meXY1mG2PRg4ZUvk7Nm+dSeJhqT3aXi+xWwUNcBVVaQsEwQmW5kPuLUHvmCYz1DM2KBalMws4gAodnqCYDdYWPoBWc0TqfHLr/DvJMM0yJ9KvZMfV9pAuIb7Rx8WBFN7CHK5jQD9GFNIf56cGwYlMNQA/cB2DpMBjBLYNMAeEp4xqLWgIZ1i9u/SV8x8/3HWdhoWB1TeFvlWKk4U2YSMoLnluIrHFMPSmTG8gWPUEWUxs3kmhia8aOUZniBbKyYyA/u1i6BP0snOZgUo31Kekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztOKym7ZQADMWE/PmEQ6wu8SLljLchUNhBlYQJ8cjic=;
 b=J9QGNkifro8nzmR85AYjsag3e9ipEKV+HQSLWlceI4lG1VJJx4pUxYFTDRsDoXLj9rVL4i1b6M3T3ZUwzS9D9iUCzi1Jsrf+mgfWtFR4MuzqkkgU4LiSj5iY/g/JH5ihT73VCiTlwQ4e/G9O06aiJb4U4ct+pQTVEnsk2dCc6DDP8oTOpgk7d3qTyDGX+36cI2+2hc0xwBhOEvxwA98Yw5i6Y5sjEDLuUxfsWFCi1uTyCs/j/3WSsM5T0QqPQDHF1nMUNATliOn4iSSCPqndMJs3fm0nBCU4tFYOka6hcdiZGvnbEeUp3lnaBDoQozvM9NemNCSIxmupuU2xf3c0Yw==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:31:30 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:31:29 +0000
Date: Mon, 30 Aug 2021 10:31:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: Maor Gottlieb <maorg@nvidia.com>, dledford@redhat.com,
 hch@infradead.org, aelior@marvell.com, daniel@ffwll.ch,
 airlied@linux.ie, dennis.dalessandro@cornelisnetworks.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 mkalderon@marvell.com, mike.marciniszyn@cornelisnetworks.com,
 mustafa.ismail@intel.com, rodrigo.vivi@intel.com,
 sroland@vmware.com, shiraz.saleem@intel.com, tzimmermann@suse.de,
 linux-graphics-maintainer@vmware.com, liweihang@huawei.com,
 liangwenpeng@huawei.com, yishaih@nvidia.com, zackr@vmware.com,
 zyjzyj2000@gmail.com
Subject: Re: [PATCH rdma-next v4 0/3] SG fix together with update to RDMA umem
Message-ID: <20210830133128.GY1721383@nvidia.com>
References: <20210824142531.3877007-1-maorg@nvidia.com>
 <YSyU7JLIlonJzRhe@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSyU7JLIlonJzRhe@unreal>
X-ClientProxiedBy: BL1P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 13:31:29 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mKhNo-007Ccs-8U; Mon, 30 Aug 2021 10:31:28 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd16bc3a-e1a8-4044-43bd-08d96bba7941
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51608BA545878C4B2127FCEFC2CB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cpdmgebb58O2zkpRMQcIhyANxsANGNRqn/elAFA9ic78HBG9Te2EpJiFNM9GD42/iQY6voN/wUXDU81tsul+M3Mxh6c1USjtQqfnU4/efmCcq5Bz5j40s+c4w/N4B/gUjhHVmZZudjmWiJg0jRcXXjbRiDXk1Jb/LEc3O+kp/mCeNzRnrnxfoRh1C3Xi7umj0K2mN/UKDsEIDOsm9AlY+TK5kx6gh9jPxfwafvxLShi+O88TY6eZ8bGXHAb47CF31irdc0LbRmUVloeZsWDOLLC47UFpew/u9R/W0nntuN1rpWreyI9PbWx6XS8FIcdKu+MwjslCpkhI47MU0qf1+AmBV9s92ASZfAbU3qVSEhVSZwtEKmroVxzSy5s+BbL09EProCeoUGSyqK8naiFb76uEw3YzHV2OFDRUOCExENwUz2MF62vaPIa5rh+/8PQcv5lrJZTTWIs6Tsk12SOzM5r/Qw5pFLTkUWar7F/MzcI/wn9MQnTKRb3e2urjb9E3HxLQbkQJVEKE9o8zwW9l/WrdWqwIuuRlt8TSdceqqurSIt81YdzvleeWZnVFvGJD4XLzVWxY4EK/kKSXhwZn9LzVcDvYWBpORhr1mQhhzz37hEao3AFMBKgPqE5Z494nwao27cs872xy9NhxkoTw6oGctE6fxNKp0fGANezeXf4fDCvHnDRsP3lFmFRSKy3cz2pyTztGERXVTDXpqHl909tw4tQkhenpp79AjeRm4EcnVv/cciHhYh02zhtI/6v3RTkFqyeSl6shIvGMbwO6Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(33656002)(36756003)(26005)(5660300002)(6636002)(83380400001)(38100700002)(1076003)(316002)(15650500001)(4326008)(186003)(66556008)(66476007)(426003)(66946007)(8676002)(7416002)(9746002)(9786002)(2906002)(86362001)(966005)(2616005)(478600001)(8936002)(6862004)(37006003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQCfr4nQ7TVKMr6Sc8pQWiNLT2xI7gp1NSJpl4F5UMDMdC+nxALw5sxHbcIe?=
 =?us-ascii?Q?BTJ1uM8K4LghWh+PL7B9v4L6e7Kt+4uItjDLo+5/SQ+7CvenZJUn0JMzxsce?=
 =?us-ascii?Q?7m/nm5NKsxA0+xXwudiXIrkz4xaoaR9835t7IE5u2kfuMWJFtj++V013qgqk?=
 =?us-ascii?Q?KQnCaiRpCrz15f7oLq2H4Ggcvm1C84A5rOgLM9Zngv3bdVFFn7sTXlJzreZC?=
 =?us-ascii?Q?g72puspwMjXGECKdnf2J5bPxnDtH8nUFPiJ/MYzmQZhn/F4jeT7UL3+JWuAt?=
 =?us-ascii?Q?+AK6+zBi6Z2KSZNOv7FsqnpKUQftPlpXhmrR0LkCR4I5H6DLPVKb7fWCr+H6?=
 =?us-ascii?Q?B0PrpCV2PUe0IMEF/lxKLsSCoDX2RgOaNALHDH8a9BScqpcCE9iLYZrTXdNY?=
 =?us-ascii?Q?i4ldUEY3Gk0mx13Vjr28aX74lZWf/fTmVZbiPqyOEetBz04xYfNa9fj7JV97?=
 =?us-ascii?Q?eE7RWdHh6MMHTJqxB273GTtDmNw/cmwmEZEG/BzIBexKiy+OTAfvjajeww8T?=
 =?us-ascii?Q?xtQaSwmILMbcnu+QJBZ5CCCKf69WggD+OPIS1rs3TokE52XVfEb04Ld4l4mY?=
 =?us-ascii?Q?vK9UEwTQaC+QakwUeuviwF9PAIHHdAnC7+r7oK02ZxoO24PxqmkkNC9fogE1?=
 =?us-ascii?Q?QBAimm1aTno00erShjHZU/sx7pMqEJ1QRBw+ugLLE3trCVHNUW+aE2eSLWT7?=
 =?us-ascii?Q?TmGEa9KZmyhno7+eCRtpQRSD7XHoaR1d5FNz4R0EoVSBvInG0O+nP27/+eJj?=
 =?us-ascii?Q?tfVVcF0UZH+3cDuSAk8Mm0BUHwc0vW0x2UeULFsuGHUVTzuxkI2h+tOdUpNM?=
 =?us-ascii?Q?6CARwDeT5S1ul8/D3LK52MeTHOYjplwiTIspzDqNJJljmnCQ5EUYZTHEBGem?=
 =?us-ascii?Q?zMMXSaoOBhPD71vnSxjFLYQh43R4vDT2XRyQr9iyXZdcSmTU2q6hSTPpSqLM?=
 =?us-ascii?Q?GGMWHL3ZofYQnRZAMyKktApJVhBRaunMzY4oAlTSMv0ugE3y3ikigf0RR6C0?=
 =?us-ascii?Q?cNMPQdVd5MglufJbpke3q01tu9JxQIxcHWF3AEIQpMVr9EFidw5ry7BRZCpN?=
 =?us-ascii?Q?NeO5SKJydAIwwCH3xhBKPaAxhksVZX9N0zVsRBVYSqgVHgGBoG4sVOmD7qaa?=
 =?us-ascii?Q?O2nFimpGJkpAsXOYATK/NfSEOuIsVH+eEfxIo7q1c8SwajmUtWwO0eKJE3mM?=
 =?us-ascii?Q?E7e/Gp8JhodjJIkvCpoBPfk9f1Ak7rlZuBW7WQFORwXCnsLApcfAXkIgteRS?=
 =?us-ascii?Q?G3tzI9J/1GtFesMNMJcNpoRqmmzBiIJvmit4rPejXbrjiTjzKl9qIyf9eqlV?=
 =?us-ascii?Q?3TEUwftqVwuL6P2DEqk/2eZV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd16bc3a-e1a8-4044-43bd-08d96bba7941
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:31:29.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veL8n+XKavj0iNvpBfvmusPcigW8d3UEi++qRRCoZTXV6LtT+ISJ1LcDsYkkkG+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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

On Mon, Aug 30, 2021 at 11:21:00AM +0300, Leon Romanovsky wrote:
> On Tue, Aug 24, 2021 at 05:25:28PM +0300, Maor Gottlieb wrote:
> > From: Maor Gottlieb <maorg@nvidia.com>
> > 
> > Changelog:
> > v4:
> >  * Unify sg_free_table_entries with __sg_free_table
> > v3: https://lore.kernel.org/lkml/cover.1627551226.git.leonro@nvidia.com/
> >  * Rewrote to new API suggestion
> >  * Split for more patches
> > v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
> >  * Changed implementation of first patch, based on our discussion with
> >  * Christoph.
> >    https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
> > v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
> >  * Fixed sg_page with a _dma_ API in the umem.c
> > v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com
> > 
> > Maor Gottlieb (3):
> >   lib/scatterlist: Provide a dedicated function to support table append
> >   lib/scatterlist: Fix wrong update of orig_nents
> >   RDMA: Use the sg_table directly and remove the opencoded version from
> >     umem
> > 
> >  drivers/gpu/drm/drm_prime.c                 |  13 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  11 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  14 +-
> >  drivers/infiniband/core/umem.c              |  56 ++++---
> >  drivers/infiniband/core/umem_dmabuf.c       |   5 +-
> >  drivers/infiniband/hw/hns/hns_roce_db.c     |   4 +-
> >  drivers/infiniband/hw/irdma/verbs.c         |   2 +-
> >  drivers/infiniband/hw/mlx4/doorbell.c       |   3 +-
> >  drivers/infiniband/hw/mlx4/mr.c             |   4 +-
> >  drivers/infiniband/hw/mlx5/doorbell.c       |   3 +-
> >  drivers/infiniband/hw/mlx5/mr.c             |   3 +-
> >  drivers/infiniband/hw/qedr/verbs.c          |   2 +-
> >  drivers/infiniband/sw/rdmavt/mr.c           |   2 +-
> >  drivers/infiniband/sw/rxe/rxe_mr.c          |   2 +-
> >  include/linux/scatterlist.h                 |  56 +++++--
> >  include/rdma/ib_umem.h                      |  11 +-
> >  include/rdma/ib_verbs.h                     |  28 ++++
> >  lib/scatterlist.c                           | 155 ++++++++++++--------
> >  lib/sg_pool.c                               |   3 +-
> >  tools/testing/scatterlist/main.c            |  38 +++--
> >  20 files changed, 258 insertions(+), 157 deletions(-)
> 
> Jason,
> 
> Did you add these patches to the -next? I can't find them.

They sat in linux-next for awhile outside the rdma-next tree

All synced up now

Jason
