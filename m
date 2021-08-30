Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C73FB766
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49D589DFA;
	Mon, 30 Aug 2021 13:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2064.outbound.protection.outlook.com [40.107.96.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBC68958E;
 Mon, 30 Aug 2021 08:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWqW8t7bEivWHDmUo7KwqNW36YE2h8AA6mggnh1Pep/2YPZ705aPN91yNVEXRFDigVO4gRUg+5NHjdHkqNOmHbi9abCzohLaE5+aLXKwBhaZtGRomJ98iqggsqWjvwcKYlQzRTwK2tYHaUf22QI8a2/ogHn/0esluT3IwDw6Y2sIQ1qBgtZUTo32094BJyEeFu5jkdkoHVhrE1OlNUOGcC2SRdiMlV3iOlZAHV21UVvqeogWEhR3ewcd0kZOlEg7pQ6QlbVbMknLIF74MgH2Ta4EBQz9ERI64q2hCuzz92VYE0qV9BuD5hdIeZwhcft5LqSsJ2hIb8FhTIFZR/s1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL4PmsLBay9NCrKh7WVq+neviHWKJaMJHSEWXKixCbg=;
 b=IFOVQPqAefSjFeDekWp5CIwOwYr4BvLgzGThGopbp+9P73P9W58tuNK7zfEdRTejOFqJ1ja1AuI7KThk/JpqIvaI1l0ohL/O2d4eJITvVzOaxxTXX98LG2BMtmNtFSdKK/EeH3Bte9W2oS2Xsg20Gt9tGFv0ANEhRrRG5O6372mFjiYi47JCE7j53jndotOwj90kV9PUKtDyfsJB07nOT0lQ29efY8/FGLFflDNYpcU9cxGW46YWg5eFq0KNAHY42IPMU3uNnlSu6T7DlvqK3BLk5TzwzYEOHZvpjOg+4eh2sLo59MPijFVkqVMy9kc6BugoUW4WXg+nLxYArgdcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL4PmsLBay9NCrKh7WVq+neviHWKJaMJHSEWXKixCbg=;
 b=kCNrUvINbK5oxbxj5wthIUrCMqE7gnwjaHznOQlt+iiUbKfRj3qRc6YMZVuVKt3SBMP+EXbP5tcDVlTIWutBCOMS7WOhsSovDESlaiBOrz0KJ39PhirG2u77+w4/9b9G0emmchzxMI7fAgnYRO9DlvACyqy6OcQRqXEWut9d2IGEQz9CRSBlv7Y1Glpu1c6DQZSXxqLQzZexPhksFLMJGe6amcG69y4rOQpGD1CmKa+qF5qAMxHBBeioCl+Sx6IUmlVAFmDMdTfPkFpaDtt0WGHMv+TBIThvQTLyAnS+c6x1Cpa+hwqbcWXlu1g/VXv93bCm9QetAX8tqj/z3czwsA==
Received: from BN9PR03CA0341.namprd03.prod.outlook.com (2603:10b6:408:f6::16)
 by BL0PR12MB4756.namprd12.prod.outlook.com (2603:10b6:208:8d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 08:21:06 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::bd) by BN9PR03CA0341.outlook.office365.com
 (2603:10b6:408:f6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Mon, 30 Aug 2021 08:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 08:21:05 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 30 Aug
 2021 08:21:05 +0000
Received: from localhost (172.20.187.5) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Aug 2021 08:21:04 +0000
Date: Mon, 30 Aug 2021 11:21:00 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
CC: <dledford@redhat.com>, <jgg@nvidia.com>, <hch@infradead.org>,
 <aelior@marvell.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <dennis.dalessandro@cornelisnetworks.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <mkalderon@marvell.com>,
 <mike.marciniszyn@cornelisnetworks.com>, <mustafa.ismail@intel.com>,
 <rodrigo.vivi@intel.com>, <sroland@vmware.com>, <shiraz.saleem@intel.com>,
 <tzimmermann@suse.de>, <linux-graphics-maintainer@vmware.com>,
 <liweihang@huawei.com>, <liangwenpeng@huawei.com>, <yishaih@nvidia.com>,
 <zackr@vmware.com>, <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v4 0/3] SG fix together with update to RDMA umem
Message-ID: <YSyU7JLIlonJzRhe@unreal>
References: <20210824142531.3877007-1-maorg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210824142531.3877007-1-maorg@nvidia.com>
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81bc9ff4-64ea-4b8f-1303-08d96b8f1cef
X-MS-TrafficTypeDiagnostic: BL0PR12MB4756:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47561F5C53DB8CF40EE8A1CDBDCB9@BL0PR12MB4756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lS0Y4o64WO8wemEx5yIBqc0aQuxp67loLcmBDRYKcx1TjFs+74Gim/LsW6FCsfIROTfZuvqHn5bpIhLTIUH5WkzVlFhOFj+gr8DKUvLtc7BAKMQXHMM+yURSWAVLuXP3OrWSG6wRL6qxZpG4IsOHFyCYWV3hD6CNzyvSG3JFSespA6w/tSVrGsOYadrBfe3J2dFOzQPjrvRPvn9Fu4SJgj9v5CWPen2wGc2tPaFIkAXuiQccx42jUfu9lQV0BifnqWA8h5v8hYy1Ec7BTCmWoGVrrmvhkvI6R1cRzXbTDHkZsXH41IboSjbyQDjK3m167kbAdyZ+F5WO/+8VTyVhvqQzEKDXZcvpfQGGIRY67nFBfqNlhi5PWg0I39yRbDWqjuDIj0oXuVbOfTEJ7XxhNHA8o/THWHx+fWF6oagtbN4L///5mJBVpZ1ThSj7s67suXhvCHwgwai/vsH5oArSDxUnFojHid47pEGbyTgBBM+ABE8FgiaUM0v6F2b0QBL+LOTLa+VFdxSPV7uRpswEIs01eG8P8Ogll+5ttGjPkm3G0/KKBaDG/1FcU1WsanC8kxt54SMcggEHRrgCvTaxh11QzRpGamtXPc7biF1xF1UV2az+Wpu+GLWwXxZUU/+i9IukwPTFM6LsQk9DECAQsJ77igSVX+1rLHxtX5MeNJMG5RCL2F2R5OWDdZzeqlj/KixZgLUt91sHqHYP54I43xaIbJ3ulvu9CMcTn1muLn4fo7EDwq9GzQy4WgX248HbiUV4f3xZn4Zzwey5x55XqAZdBO/ommvtQ+VX3CH5zAiuPbME0LmzHhzIhe+dzQyo/hW6LkMjQPaXt2Ix3sfuCA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(33716001)(8936002)(8676002)(6862004)(54906003)(83380400001)(86362001)(316002)(36906005)(6636002)(7416002)(4326008)(2906002)(70586007)(15650500001)(47076005)(5660300002)(26005)(426003)(356005)(36860700001)(9686003)(82310400003)(6666004)(7636003)(478600001)(16526019)(186003)(82740400003)(70206006)(966005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:21:05.8042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bc9ff4-64ea-4b8f-1303-08d96b8f1cef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4756
X-Mailman-Approved-At: Mon, 30 Aug 2021 13:57:05 +0000
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

On Tue, Aug 24, 2021 at 05:25:28PM +0300, Maor Gottlieb wrote:
> From: Maor Gottlieb <maorg@nvidia.com>
> 
> Changelog:
> v4:
>  * Unify sg_free_table_entries with __sg_free_table
> v3: https://lore.kernel.org/lkml/cover.1627551226.git.leonro@nvidia.com/
>  * Rewrote to new API suggestion
>  * Split for more patches
> v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
>  * Changed implementation of first patch, based on our discussion with
>  * Christoph.
>    https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
> v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
>  * Fixed sg_page with a _dma_ API in the umem.c
> v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com
> 
> Maor Gottlieb (3):
>   lib/scatterlist: Provide a dedicated function to support table append
>   lib/scatterlist: Fix wrong update of orig_nents
>   RDMA: Use the sg_table directly and remove the opencoded version from
>     umem
> 
>  drivers/gpu/drm/drm_prime.c                 |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  11 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  14 +-
>  drivers/infiniband/core/umem.c              |  56 ++++---
>  drivers/infiniband/core/umem_dmabuf.c       |   5 +-
>  drivers/infiniband/hw/hns/hns_roce_db.c     |   4 +-
>  drivers/infiniband/hw/irdma/verbs.c         |   2 +-
>  drivers/infiniband/hw/mlx4/doorbell.c       |   3 +-
>  drivers/infiniband/hw/mlx4/mr.c             |   4 +-
>  drivers/infiniband/hw/mlx5/doorbell.c       |   3 +-
>  drivers/infiniband/hw/mlx5/mr.c             |   3 +-
>  drivers/infiniband/hw/qedr/verbs.c          |   2 +-
>  drivers/infiniband/sw/rdmavt/mr.c           |   2 +-
>  drivers/infiniband/sw/rxe/rxe_mr.c          |   2 +-
>  include/linux/scatterlist.h                 |  56 +++++--
>  include/rdma/ib_umem.h                      |  11 +-
>  include/rdma/ib_verbs.h                     |  28 ++++
>  lib/scatterlist.c                           | 155 ++++++++++++--------
>  lib/sg_pool.c                               |   3 +-
>  tools/testing/scatterlist/main.c            |  38 +++--
>  20 files changed, 258 insertions(+), 157 deletions(-)

Jason,

Did you add these patches to the -next? I can't find them.

Thanks

> 
> -- 
> 2.25.4
> 
