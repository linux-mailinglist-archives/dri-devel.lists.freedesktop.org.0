Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528A3F60B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9D06E02D;
	Tue, 24 Aug 2021 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E416E03C;
 Tue, 24 Aug 2021 14:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4UZNNTTkE9c45fO/B7qigb8ZDCX7lH2CvJDlp0Ub+SVlu6K9KH4qdD+TvnpQfytFkfYGfqqNAOOe8NIvGZ5v/VK8WWDeEuXwS4K+C448yV51lhCBS80t5nha6qZRj8ff+ZFM8Iik1dvMo5cmWnfXvmGQNuBGmb5FgL6KVHCWqXKJEFC5nAfFI1hi6xt5zFo5FWP77x1kmlPVeSsA6n8ZUNSJUP76ycvo7NU2sSgJpgiODwj614kxBY3NHuhXAngTiaunmYUX0sihjAR6d7tUJGGeKelAvj5n2ToyVs5kIX5FGdAj/4qm/92d0V253Q1H2kmTqkOvY+4FiIfZAVYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tICK7hyLXmBY5ozbXGN9uqiU69CpaP3UI8kSB7j3tnI=;
 b=V9HTvXWNCcNec9uGJAJMgWaGaUd7knBm3dbDVounGLxJEZaTDNOZpBrNfCmBxU13tp2rjR7/6lBOertLHrtHT8DpHHKupqsPPegfkGk6EGdU1oBIqWHsnZHjwXbHH8qEtj0pW5pRQ+Wil5Wst4lJMdmieCEJF7pIJsymhbCfcp9bdM4/JMh2o/aRCz64wUbfXKvg3R+LgrXVEn2utNF7c3qhHgIctKkmt7/Vq2bt+KXKUSmuDjv5AsXxtmJ0pgUzEEfY2ii4PTK6eDGFl+Q4EyPYaRk3PhapGDz5dLX0rij7qmY6kkFjorlraWe/g5wrAxndIP3eXneUkl1wt2y89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tICK7hyLXmBY5ozbXGN9uqiU69CpaP3UI8kSB7j3tnI=;
 b=phZEFHPema1SUYcFW0LS2yLRwklkqpYT4CGmUQl8wtH0yZqWQXegZjJ9EWSOE56lFWbGHz6msJP/UqtHD+Urnp9Ef/O2PhHYFCTM05qYuCXs9w6QUc04Avp3xESLh78v+GpB0LsRSOWBv4huMl/1W0yAvwOqQsS4DGHvk78gWXNMmyuSZnIX4CtsjtnpzM+eR7DbEz1/UXhKt0x3UJI7jDBY6RK/77Q595C1nomECqbZSWuQM5C93MaaWch+hDybk29ZdK6oKoeNDupZtA93VJwXeQFBRexZHSay6lcW41/oUjh/AAFaa1FUkPdeYfGcyvfxiWA47rwvSBnSnRMqLQ==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:26:13 +0000
Received: from DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5]) by DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5%9]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:26:13 +0000
From: Maor Gottlieb <maorg@nvidia.com>
To: dledford@redhat.com, jgg@nvidia.com, hch@infradead.org, leonro@nvidia.com
Cc: aelior@marvell.com, daniel@ffwll.ch, airlied@linux.ie,
 dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mkalderon@marvell.com,
 mike.marciniszyn@cornelisnetworks.com, mustafa.ismail@intel.com,
 rodrigo.vivi@intel.com, sroland@vmware.com, shiraz.saleem@intel.com,
 tzimmermann@suse.de, linux-graphics-maintainer@vmware.com,
 liweihang@huawei.com, liangwenpeng@huawei.com, yishaih@nvidia.com,
 zackr@vmware.com, zyjzyj2000@gmail.com
Subject: [PATCH rdma-next v4 0/3] SG fix together with update to RDMA umem
Date: Tue, 24 Aug 2021 17:25:28 +0300
Message-Id: <20210824142531.3877007-1-maorg@nvidia.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0191.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::28) To DM4PR12MB5296.namprd12.prod.outlook.com
 (2603:10b6:5:39d::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dev-l-vrt-201.mtl.labs.mlnx (94.188.199.18) by
 AM0PR02CA0191.eurprd02.prod.outlook.com (2603:10a6:20b:28e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 14:26:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fa567d-07fd-41eb-59c6-08d9670b1fea
X-MS-TrafficTypeDiagnostic: DM8PR12MB5400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5400D603B293D92BCE2998A0DEC59@DM8PR12MB5400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7/hzfdJCmSM76cQD0858Omy/WXDOe2gRZXGP/S7qUW1UVoFPLAEQ7Ij7dn/T/LpBIDVfOfypVaq34WQIjMOdz2x8WFkJ992Owprq4PvqVC2FKaF0g8IRx3JLrtsVGNNlWC1yRyVVvzcJ6FDuZjwpVgaqvBwsiWU43LMLg/5yn+hUscwAWRKM3pZxrTKw5SghkUKt820QA/AvVm2H0kD/zVbXjlHNnlfocKAaHOiWOoa41WbZTlAoyCzljHaMNbA4Da8VJsDyoH/Su8JaqUwtohUtKh3+4VNUiA6jiIh1JDOwp3eNDn7GDW4tskFwO9BH6O5SWI0O7UF/4EGL6XIQRT20Bs0/XyZ6eHmW1RorWMdiTIGdHuGpImeD08h3XctadelP7jK2vVS7cKw8J/BsirCSx4Ym2C/w4djRnTb7PGb2bMoc5Zg5bdx7Ik+zTFqM5klYDo8z0Gc53O3NZTiUzSuLYIG3kJixmrxXS5qrznwlPQPTmnLHZhVFAeC+90hVk1Ihp0Cjts3mUop/LeCebyUM42jqwKHqq7PXyTcIsi7GkDE0oF1aEYiUCrtN8pdIB6MLptGnero3Spgjww6RdX5CFOdvpm00L1cVEj+2nz21xGrz9p54hFxskMU3f4wcAAkyr2o5DVNS0mNDWicu7iEqw6HQpreFekVGvTUdsVfDzcUIJm7Gq5OzANtXCnjMbX9NU9OAlOr9+LJ3uO2Ju0H5qhqw5TdG1bT6WEJPJNG8t7TJPT47YKj+E5jzCX/aQ+RIw6S2YKAayRD5BIii6p27pKbHpD+1Rz2B6ZdIIoPPlF5B6HZhqZApyrdm4ZwPD8wr3XNtnAlI6CME6wpAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5296.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(7416002)(1076003)(83380400001)(8936002)(316002)(956004)(2906002)(36756003)(6486002)(6666004)(26005)(2616005)(15650500001)(38100700002)(6636002)(4326008)(966005)(66946007)(6506007)(508600001)(186003)(5660300002)(86362001)(52116002)(6512007)(66476007)(38350700002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbxYfXdZJgDxUEvZ2rVcVs+KGJnmk3R9cdGFYR9jwGCmxLAorEtRTA6auQOf?=
 =?us-ascii?Q?2z4vKpnPcWcpo9/pyhtbXlzOrW2Z1hOLiYkgb9J36KcxaLc4jcIuRxrrAI9D?=
 =?us-ascii?Q?TT2pr/AERqgFJQCOSjJudiGTp1uN7FnQCkR9JYBDYRW2lyvVlCyIGzS0JrmV?=
 =?us-ascii?Q?gTJut4C2Liyvo+JzrUq82Ub2jZWLUmvDXzNLDCbEPCLDEepCqheySN+o1QXs?=
 =?us-ascii?Q?aMcp9j2a9IVg37593GdyY/tczVqnDNa9rdeQwLhsvgAkg/Jo6yTPXekyq+NG?=
 =?us-ascii?Q?lVHyi/eNg9ve0gD6ibcpQhx3YwJEk81RpBd808QyouWuHNjD+1jT5DGsfoCM?=
 =?us-ascii?Q?w2DEzvcR3N4OxNJTJVTGL/YayRCxeARQXY+VzpdXowoLG7MdYvFIFt7+6qKK?=
 =?us-ascii?Q?dTnYuTkv6+Yynp8z/UmjKp/1fxQXyxgX6kud+svqsDNMdj+0i3KKR+LfuUeT?=
 =?us-ascii?Q?nqRfHKrW5+7ez8fnZfdvG7R0M50oCDNdwQnoLegPSZNOXXy1FaDOUQkgBhhb?=
 =?us-ascii?Q?24FJMH9KbJoW2G54nBPfpj6VavQHRlnBwX7KHYi70r3z90R1QTRAuxkSE9qT?=
 =?us-ascii?Q?4Lo+ON9ib60vbRzU6Wf2om+8Xd80GLHhbxk/n4L6tsWrvhkIyHbHLgUKhVO2?=
 =?us-ascii?Q?HpqhgZOMSLvEgeUDyT8E1xXZASwfzAPL1pKb9YrNr/S3euBIW3xFFOlwLaZt?=
 =?us-ascii?Q?bMh5ndJ01944MxwC1ilv6whilxlfiVP3p/yVTqsAIbTIATu1ClRrle22HrZp?=
 =?us-ascii?Q?Y8XCgohZadKWwIgE+/myH2liQHV42TPwRCXuddX0pNIbc/TSJy4f47Hc2OQe?=
 =?us-ascii?Q?ljLat4apvAzIrSIZdnPZMv6rnw/X3J47Pi8cB4teJg4svlNSVJvk+KAp7cko?=
 =?us-ascii?Q?cSyovzaeY73FHqNUBuwv3r8hv44J5qAdqzyuMZ4Hu22khQOUFZWfRw3mmGbW?=
 =?us-ascii?Q?FSFsByuUPhKsp4vAV9RYRLWrB3OJPygthFvUKjJgZjikC8idDqkgWCmUFzaT?=
 =?us-ascii?Q?7KFkW20feJYG0Ho8NZloZ/aJiKoX+PEUiDTYoF8sNVj83jnKDNpqhmf3WdAY?=
 =?us-ascii?Q?YBz5QNOLqsF4Pn48nAHhEdG1/Ur1DsOnl/dJPG+B40UTX/ugkpS0AgMr/uKc?=
 =?us-ascii?Q?nBcW8HYxzGIKozE2W3P1jzKDBHPWSUz92tkx3a/i1xTWCahIK30Jxgk0zSRv?=
 =?us-ascii?Q?1fvc3X5hVaXf8bpLzceCVdR9tBkNW6JCmh88FZoC88lOa07RyhIN091kzK2c?=
 =?us-ascii?Q?Y3xXDJ0IsEiTyyVtXSlsNfLNPPeH/l14O6LdrJaxYeVXgzC3jJKaXAUwvLWB?=
 =?us-ascii?Q?0e1FYRR74zREQdKqg66DBDHD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fa567d-07fd-41eb-59c6-08d9670b1fea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5296.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:26:13.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJmcnLDh4g7pAUSX5Onknoy8nFs36OagBltMuB60b3//v5RJFwcV73a4GMOzF9vHqVlv0qq9ct4/A845fknbhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400
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

From: Maor Gottlieb <maorg@nvidia.com>

Changelog:
v4:
 * Unify sg_free_table_entries with __sg_free_table
v3: https://lore.kernel.org/lkml/cover.1627551226.git.leonro@nvidia.com/
 * Rewrote to new API suggestion
 * Split for more patches
v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
 * Changed implementation of first patch, based on our discussion with
 * Christoph.
   https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
 * Fixed sg_page with a _dma_ API in the umem.c
v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com

Maor Gottlieb (3):
  lib/scatterlist: Provide a dedicated function to support table append
  lib/scatterlist: Fix wrong update of orig_nents
  RDMA: Use the sg_table directly and remove the opencoded version from
    umem

 drivers/gpu/drm/drm_prime.c                 |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  14 +-
 drivers/infiniband/core/umem.c              |  56 ++++---
 drivers/infiniband/core/umem_dmabuf.c       |   5 +-
 drivers/infiniband/hw/hns/hns_roce_db.c     |   4 +-
 drivers/infiniband/hw/irdma/verbs.c         |   2 +-
 drivers/infiniband/hw/mlx4/doorbell.c       |   3 +-
 drivers/infiniband/hw/mlx4/mr.c             |   4 +-
 drivers/infiniband/hw/mlx5/doorbell.c       |   3 +-
 drivers/infiniband/hw/mlx5/mr.c             |   3 +-
 drivers/infiniband/hw/qedr/verbs.c          |   2 +-
 drivers/infiniband/sw/rdmavt/mr.c           |   2 +-
 drivers/infiniband/sw/rxe/rxe_mr.c          |   2 +-
 include/linux/scatterlist.h                 |  56 +++++--
 include/rdma/ib_umem.h                      |  11 +-
 include/rdma/ib_verbs.h                     |  28 ++++
 lib/scatterlist.c                           | 155 ++++++++++++--------
 lib/sg_pool.c                               |   3 +-
 tools/testing/scatterlist/main.c            |  38 +++--
 20 files changed, 258 insertions(+), 157 deletions(-)

-- 
2.25.4

