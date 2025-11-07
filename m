Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EADC41124
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BD10E1C7;
	Fri,  7 Nov 2025 17:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ozrKk6RG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD4B10E1C8;
 Fri,  7 Nov 2025 17:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njh2l4rSfqqJ6FgKRTnZLTTgLUQGO+6HAPSYqXtS4h+tqm9tpyqb1ptqiClR+j1fn7WHZqmunhtKJYhTxg33xgd9OcfCPR69GyZvMpNRq2vZh/PJ9/Vhe9WNWXkGw1s66ct0QXXREa9Tz/kxvRRRC7wUcR5qfBt/bUUbrehI7kK5INzxI3rRaHxuTQi0CBwen7YJTbl8Z5nWGWG8vDbEkZI7ig9Zt/pFG0AAZ+vWYnmtTIMZvXwf6dxWxT/hZB3NCJKk9xqxcaCkkdfXulMtpCj1VEMkv6rj4eHDjBqn+qE9mHgTsAwesbkUe861nN8cC7LWHkXp+GZ3HIlclKJIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1XOcmM54GZ8tkN+UW06PftIp/kjGraJLv+WUk1RB2Q=;
 b=eJYn8WS07XLQFQhdxeWRg9NTnrejpfN/Y4JYz4gU490hoWH1Y2eVxg0mXmXXq2+klUYrRu8FCX+2V7QDbkKO9ip+vrku1yl4/ozC4ggR8B36qfnK2W4xcvu8QmK/NsicBwX8tuSuQ5smmXWmE76f9VDEBNhSkOo0Ve6ZfL52yFoKeCA5bpVy4YCCkwY5DGjFyS2EEPWVtxoYPNSCN203FbZVxSWkvglsW8Si2KMdKPciSHufENhSKB6p/+7Rce+HmYGgjIjB4X6iA2rD82QGrfq6QYEsGIMwq6jqX9SVgRwX9tmNldeygdUteJjoGoZwvn6exJVacEbvDS23oqSnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1XOcmM54GZ8tkN+UW06PftIp/kjGraJLv+WUk1RB2Q=;
 b=ozrKk6RGUkHnGx7AzFYBoeNrhYWLArHcvzjflm7QgfQEWxxKYgtduSQzrX7NCQj8e1Z20afz5hq/+xiirwM3TMpjnFteKj5E0wn33NODRZkH+PWmEyzV7BnFyKapN8GmBV5wgS6LiVFvDQtCBMbbU+3IVWi7FK2GFHpVllmAB1muTvSqmqq6418Jl5LQtPk6auR3V4XqFQHKdAIiiJxhEYKdePtroFSJKd0OR9l8OPGw31eb7eAZkjNfHsUmPOlLPjLjZeF1Ov/JJOEWJRU+7MIrbKzu054OAv8TKkmMxlKtrtUZ9E1PJO1gW5Fx7XeNWsKkid0MBnbcFmxncpkRrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:40 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 09/22] vfio/platform: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:25 -0400
Message-ID: <9-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0332.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::7) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: d84e38d6-af83-47e9-1ce8-08de1e24e82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ESW/VC7Ta8I4Bah2pVKKw6CbBeYGZ+osojocDhVFSkwWn5qvBA1L103AhPN?=
 =?us-ascii?Q?7lGySTT+e9gF+WrklPaq0je2nMY8KfN8UMrzh5m5h+LQvJgzqTgnyCewIaxP?=
 =?us-ascii?Q?ZRM69HUfiMtfVMJLBre7WpvfEhSE5PvAwZTLBuMfVpoC4sA12sD2mC1pVbEW?=
 =?us-ascii?Q?h3ooc6F2mLYTfK58ByDt1Yi9PGQDAN6DDMAhCOzJZSOxWhfpivrShMP3/8Uz?=
 =?us-ascii?Q?pejs/9Pe5q4SBNKBwdlDuYmEGL/3T1OQMO0UiHA7vq+TrIxoPr2EeUmmdVtG?=
 =?us-ascii?Q?EJxsYpF95N5XsEmFBWkWGjToe9VPMhgeCurHkXbwKEv9WYAi9ahKWpIVxe4F?=
 =?us-ascii?Q?S+btu27PjMkiyniOXyHAwBBWnF9ZdTSqMLer3DFSwXYA9b/LwQk9vuhAGFeT?=
 =?us-ascii?Q?t73lKni3i5XlY0LkXHL0kb3VONhjhbQ/a74lgc1SlaQKCAq4uzA6V6gO8JI8?=
 =?us-ascii?Q?Gy68dCjdDYISI+ukZn1khduHrZmfkc4dDGa8T+zHLXAxc2F6AOhOPL2G5ndB?=
 =?us-ascii?Q?E7lQqbJsSg5VuORhwVKrdp0eupKHDxZHRTKeIEbVccn1E/jMbufVqt8an8q7?=
 =?us-ascii?Q?hH4SRgpfKry46wZKhIhQ61drnv+PoLThT09q497Wk53zlvEJF9hyg0Xx+kEf?=
 =?us-ascii?Q?EKlJKL5ZMEzgBYmsZuOfPHx743oVvafC6a77yoFf9yd/7YZ+hx0PS+Cm58c1?=
 =?us-ascii?Q?JCZOuDdTPmM9vw6Dy1M/gslg7O8EOqTERS3h0QmEkdT574KUU/TiD3pMyFnG?=
 =?us-ascii?Q?vM+yEdHFDXsmumGY3hSIg/bptf7WFjUq4O9mfniIk8Q+Tx+ik+CzW/CZTSlj?=
 =?us-ascii?Q?19Md9bIhristXNLnSC5/2FxlQa1sL8IfPEqaXofH5QWtOw1sL7VxhUQRPP/6?=
 =?us-ascii?Q?EWOM/IVy7myvlzMy4yPyLXniXWwIZxJeJOvo+KBAqLm+i6C6q4zP9VSTvgZE?=
 =?us-ascii?Q?WjAGc4jTOCz3A0cOgXcK8+qglLRGDr0o9YSJBPTDG3HAUq25hKimaqCUEXwI?=
 =?us-ascii?Q?cxmp7cDejHJGE63kZbAjPDMbk8+SDuZ9eLxzS9aRdv/EpgLbELetWXKdngm/?=
 =?us-ascii?Q?LB/Bq7sgTUSvZHE1XmyIBx9oYXUT4o+KU0MeSPxx0r8q9m+icrydXsiNYj7Z?=
 =?us-ascii?Q?NXPmPsiLIogKqGvArsUmca89OSK2yKJsSbQK+6uXkeoCC6P44bwCgWXyFul0?=
 =?us-ascii?Q?RVtIXrql/pJtPDBCd0oHXIn4CVh+Qs9GLOT6jGO34FP3RTLoghaj60tCK/06?=
 =?us-ascii?Q?+AQR7zgygA8Hm0FECaQ9UcT+HEp43Mbufu2tafFBgZTO/VNUIQd4IZIoQqIg?=
 =?us-ascii?Q?J2eI/oc6UB3Wi1B9k0LP9Fb7oi8oRpi0UQ3dpf5RFH3IXodc1yUtj7nmtLt5?=
 =?us-ascii?Q?kXFKurzKku4tsRSxzRcE0v0UhQepH0TsdspacShHU2yCxi20/Uu8zCN4jnKS?=
 =?us-ascii?Q?e3LwA+zaz7ZB+yvb6Ef48suvmWmCmsgjrzkNTep/VkQq3tsi9PWsGFwBLuWR?=
 =?us-ascii?Q?Lgzqxln68RpAXL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33UVG7QOoEC3ICAdvl4Ipwj70anUaCXgh/TBqY4uVYhqwv18/+tWcLA7bf/t?=
 =?us-ascii?Q?cMUd8AIovuLPwPFJXmL2oHwogWaRDmKIb1DDMCZIHuvyFFPvd75O8bGefGD7?=
 =?us-ascii?Q?8BGFRWfgVGIsUDhjzN4wLk58GtGybQvpn3DELKDqprVBIwPzk6VOgJlHUzpH?=
 =?us-ascii?Q?uOxggMBt7Nb/N/8KDVKglrHNNYvZirnXC0pawzu3Tl00VQRE2sH7adpVtVXY?=
 =?us-ascii?Q?GAMS5HkvKBCGpYfDcZ9tChgSsU8JLziRCH2NBo9w3P7KQvcxPRgQqAUIpDhQ?=
 =?us-ascii?Q?cJLzCK325alkrVmKFqZS/Hs2C2WMEbcTlm6jNZKVVieu31+XEtLjHzLpG0lZ?=
 =?us-ascii?Q?ea9qC9OkqnCQOrc9egG+dndttkLtW5spWyA/xsqFSRUR4enFzdVSsOGAcPsQ?=
 =?us-ascii?Q?iT67ANChIb0xFIGgRfLfojukT4CtwDtGM/dxremMg7x8vBcrwWXrFVc7v3GO?=
 =?us-ascii?Q?7N9v1mG64VU/t0FVotI6yxMOlnn3smTppCFCMNDET+/deYrVNXlKBPXX58XL?=
 =?us-ascii?Q?wDO8lLqw6YvmQyka02+/v7krXwFG//yvP8G03dIlFkD6+zOsBTwzYlpaWt5w?=
 =?us-ascii?Q?+KTZMopvvwWrDjDy8WEx7mUcFNum1PuzpfNpNGMx3B83O/SBL5pHUiE52c5b?=
 =?us-ascii?Q?KySiTW48IbEgLQslMMvEy0pMbW7dK5VzMRcpxGrl+99eTV4mXAZllppsbDBJ?=
 =?us-ascii?Q?MePkXPq9W0bjywlEr8Q0bUHaB1QFZ+x4GVNxbPzO09pWrgA5ocmMLMXS8WgL?=
 =?us-ascii?Q?X6zObVhDw/nM1tVDCH3eZDHLlSWcVzX0wzT2Hd9DyQ4MYt1y+iBLqSvZtmKT?=
 =?us-ascii?Q?tsUyoyDv0uqPrImP3fukXpjMrXN8xoCPxx+z8qx2tEFQ7PsN2pgdDpsR6qLp?=
 =?us-ascii?Q?fT8iv5M0yTgKCYZJuPrbna40lXlgwAwTudH35kKn6os4GxbD2dIzH7gpdCDs?=
 =?us-ascii?Q?DjyRsKQFx9y4D4Ks4cH9ps44t/4jjNvSrIyFo7u3HsfB/Ywg/jYvvGLaEYy3?=
 =?us-ascii?Q?uK7f7o92JypVDZy2he7CV+xBF2dpqqPJIpcXzsX84T88TAgGEhtam9RvX2dY?=
 =?us-ascii?Q?rTyT/htptojQUydt/OikptPWCm85QbPL3qlL+IDOWJ04ExbOKsOc34JIBLEq?=
 =?us-ascii?Q?psxUF6mSmOIGm2yo6h9wAgOqhEH5WzBOHkahulozi7u+I4ahadcVCp3KdBIj?=
 =?us-ascii?Q?qIvkXpByQ/Rrf9PaViIPT/idVVFrpzN0cyPOBT+co1ZqxcUdABMej6Ri1oGe?=
 =?us-ascii?Q?JWLkGEI24qUlQ9ZnNoiNHc1LAF7OAEazVU/xvjbgVtznvi09e2JiXY+9rEdB?=
 =?us-ascii?Q?HIgeAxBuRPdlhIoB+N03hsqlS7NA19jkvlKckElV1/aZ5VJVsth0sXdhyKnp?=
 =?us-ascii?Q?OhrYXFr3kgBdMrnuV3rUyli7pJqRIIJlGyz8SDPkXBJq/Wg/CetBURklM0H4?=
 =?us-ascii?Q?PvkZuQ4DRHAxHyR4iTWldbEemkXfyV1K6j8e/FfLKTu6q6g3k3f1apTCKBL/?=
 =?us-ascii?Q?pczdGySl77v7Q3vFRx3XtwmHUvnoEEwjN72dlF1MEX/NJ38Hv9+FIM/As2/G?=
 =?us-ascii?Q?v54GTEFawpzsLsKqVSc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84e38d6-af83-47e9-1ce8-08de1e24e82e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:40.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVFGGyuz5BJ2hmGz5wQ+SZJwRPdIJccW3d3VQ85HD4oXDqHymcNn1J/Eyt7Kyo3h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Move it out of vfio_platform_ioctl() and re-indent it. Add it to all
platform drivers.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/platform/vfio_amba.c             |  1 +
 drivers/vfio/platform/vfio_platform.c         |  1 +
 drivers/vfio/platform/vfio_platform_common.c  | 50 +++++++++++--------
 drivers/vfio/platform/vfio_platform_private.h |  2 +
 4 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index 9f5c527baa8a36..d600deaf23b6d7 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -115,6 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
+	.get_region_info = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 512533501eb7f3..0e85c914b65105 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -101,6 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
+	.get_region_info = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 3bf1043cd7957c..3ebd50fb78fbb7 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -272,6 +272,34 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
 }
 EXPORT_SYMBOL_GPL(vfio_platform_open_device);
 
+int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
+					struct vfio_region_info __user *arg)
+{
+	struct vfio_platform_device *vdev =
+		container_of(core_vdev, struct vfio_platform_device, vdev);
+	struct vfio_region_info info;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (info.index >= vdev->num_regions)
+		return -EINVAL;
+
+	/* map offset to the physical address  */
+	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
+	info.size = vdev->regions[info.index].size;
+	info.flags = vdev->regions[info.index].flags;
+
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+}
+EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
+
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg)
 {
@@ -300,28 +328,6 @@ long vfio_platform_ioctl(struct vfio_device *core_vdev,
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 
-	} else if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
-		struct vfio_region_info info;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		if (info.index >= vdev->num_regions)
-			return -EINVAL;
-
-		/* map offset to the physical address  */
-		info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
-		info.size = vdev->regions[info.index].size;
-		info.flags = vdev->regions[info.index].flags;
-
-		return copy_to_user((void __user *)arg, &info, minsz) ?
-			-EFAULT : 0;
-
 	} else if (cmd == VFIO_DEVICE_GET_IRQ_INFO) {
 		struct vfio_irq_info info;
 
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index 8d8fab51684909..a6008320e77bae 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -85,6 +85,8 @@ int vfio_platform_open_device(struct vfio_device *core_vdev);
 void vfio_platform_close_device(struct vfio_device *core_vdev);
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg);
+int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
+					struct vfio_region_info __user *arg);
 ssize_t vfio_platform_read(struct vfio_device *core_vdev,
 			   char __user *buf, size_t count,
 			   loff_t *ppos);
-- 
2.43.0

