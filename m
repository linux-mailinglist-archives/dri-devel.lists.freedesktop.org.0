Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF3C4132F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CAE10EB5A;
	Fri,  7 Nov 2025 18:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qPPKYtnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A472B10EB49;
 Fri,  7 Nov 2025 18:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLUlb0FXutKWirY/dWwkiMXLsKgvYkGsZqXJXTybZRrXZyaG74RevK0gzudm8CtQiW7t2zcGEvdnjLa5Uvq0GF6bwJczTVandJMQqI0YaX+raAN03eSPpk8M0+jSaOVSPXnvzaLi89T+lXodbTLKUTOG5coK88ISboL1lHN3tnrXuec1Ql4Lhf93cFnJ99WEyMQp06yee/Zj90WARhbH1MNOOZpt3DcHhuKdbIFd7tkCWBqzf1m3IfYE9EXJ5u3RQgEPViLnLiwUTRXcEVnMIuEMAvdGHGNAXf0hERli7I6BM4uwFPuCS2lJgUkbncv4rbzDfVvdH2NKpHtNciUBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ufNh5SjBSgGoix+29aF7DbT6WhTRSzhn7s+oWC5xM0=;
 b=fqZHt1AzLCVopXueMkU84Ihm6NbwhvzhIhWNQ3tfp0NaET23I3MaoywJBVoxODf/AORFPfgfovWJtmwUiLXtayUsvELOYbUgjclY6SSjdZS+Ys8nIx6bHwsrAbYcncyUv7KyowK07RRUV4PntWKgr+VtC5cg5ALY9gUK492PQqjz7ZvImHKpsxBgms7w6XkO+LckUywUnOFzD2YXVVmsd3bbIZYNMFFwH/DmFt6TvdFF/XJG827swHl1eRS4DNLP9bQ1ZTMqzPOJYYK2sKWcroQjIA3GluiYiALAQAtyZWVsgemP++MzWE+zWsttHzrkSPlbds8/io88AJqT2exjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ufNh5SjBSgGoix+29aF7DbT6WhTRSzhn7s+oWC5xM0=;
 b=qPPKYtnf9fHlp6dXgIJVhSAesKRzR8OUfObJj6tLFKVMLW4BIn/Qbsm2fN19vvybmF2psmFawUuAfiKXjwPb/CfUOlS3HHm1g3NwU0u1WtLy1QPgJNBTp7QBsiXmHS7x4BAelPH6c7lsxyvLJ2MugkslG0EyKNE5561lUqWgkZArp+3HZQo1NjZd+i8qjIZwotncYw8I+MiJ71JCUkljwaTeyUB29Zc0UakYXfUeAdxnegkU4ViMV7UB6npmiGW6vReQ+rWW8+5jrJwbEJrLKgVIOsEu2ScSxCkt9AvITFToo1fzg2Z5LqsDYlC51WyhX9LFfJlkVNHBH96MHvk5Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:32 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:32 +0000
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
Subject: [PATCH v2 08/22] vfio/mbochs: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:24 -0400
Message-ID: <8-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:335::27) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d16971-a1c4-48ca-cb2c-08de1e27f61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QXQbkRPK/9nK2m8wzpmDc8Fr8/kLlLB98NCB+ewUFVm04vz8gF0tWJerpFsV?=
 =?us-ascii?Q?23zEL2CJYoiwrk0ajDfzXc8cYpGZGJ4wFhiumDu3JrFkA+Ls3NEKrtO6R8/H?=
 =?us-ascii?Q?/hhOCNa7bXAUoYjZQI8o8QH9YgH3AyNz7lKj/o4Poq3L0ZAgT/rLeilKAXZy?=
 =?us-ascii?Q?eVI0EXVjDgzs+ySguLFS/0DilELpW65hbth2oyLCZmpJ3w1O4X0NDecHbHGU?=
 =?us-ascii?Q?yflZj2+qALa+PfRs8S+M6rdxaqRGDVxPfKDAcVvL54cd9cc3vSBXdEU0Rd5Y?=
 =?us-ascii?Q?DuUq8xSsTsLAZFSIXyFhwrHpUpjyy2qQvU3CVJ+ZYhnBgk49JuEon1iPRpLD?=
 =?us-ascii?Q?7bS50nzrv6OEsCAsChJKJhMX5ZagdSzAeuGp3ZiQ9wnZnzoyqWYRgitmxRkM?=
 =?us-ascii?Q?ifdZKQYw1AdTDKW2u5Bz5EavW7V17tWNsTXKHocthVH/Go6F7UZQ5wR9vjlJ?=
 =?us-ascii?Q?dFe7xMo0A9DNxmlT2zgMmAwue9qLEeXFPcXvQD9+WS3U9XPBvDIyQGoiJwyd?=
 =?us-ascii?Q?tADyGST0mI7UUyBy+E57f1lPCXHXPPWHH5HfIYNDzp5fXrEixQqDEVsao9Dh?=
 =?us-ascii?Q?JvZN/lenuqHfjIhk0e5dJ2WH7bpEU07k5LRjxtAa6N/uBz9t6fhDv/DOQfCI?=
 =?us-ascii?Q?J8AWR1DdSbGpiYqXPfSHwcWkuryBh3imPvpgR4CaN+758i9xfE88zhFDnY4O?=
 =?us-ascii?Q?Y0d/7t6MzEBqw/PjkT6/hSF/35mAb/I4fIuMwPboZ9UUKu3EL38duFH/EyS+?=
 =?us-ascii?Q?HByThwdV4x3WS45ohYpqvo7voB0knjS+Pa/4R5/1Q1coUaLUO6bXcAh0Y8xx?=
 =?us-ascii?Q?lqshCwQEDhwvk202Xpfq8G+KjQAj277IZZ0CpJ8/1W3IFmadrG4wl5363LU5?=
 =?us-ascii?Q?n3MOp0k0mjX614T4sZPtEk0CxNlleACV+x/xJKUQ4OiODVhdXPs5aZPDnjRj?=
 =?us-ascii?Q?V+3cqBlWStMxmLjmVCJ6u2/qEO6uVzS8ZyqfDAwo3Eb3yc4ldNzjcxHUCGDx?=
 =?us-ascii?Q?aYXPGnQ5U7xv/imTtN/qD1zkAC0Cvl0yOLCdP5zdYLNHKYRNq+beTZjSRsfM?=
 =?us-ascii?Q?eXAdoGxr7hdHSq3xKR2VxUdk8LK3lsyI9HT4P2xnaAvJsks2iFprKzklnq1h?=
 =?us-ascii?Q?ZIP0j6Ht0+5dsUXxgD2RM+48yonyJGCcOn+WsSvdIjBB36EQ0tjUtdL/XEVf?=
 =?us-ascii?Q?z8nRc2c/1xt3iqgDNMfgejmP6xZKVY3nimuLS3Oa+1jWgUhFNG8ICVdVL8oo?=
 =?us-ascii?Q?OdVyg92K2zdTaXkLQr7i4u2NnHjztMfJVsJUfvp/nY/SEtSbvSu+4pC01shf?=
 =?us-ascii?Q?PHapZxGY4H+lEBSTw5L+3RkL0WCWAKDyE/+8yKL73S9poYxZQMyEs5BnbQ38?=
 =?us-ascii?Q?EZ1gvEok0ZW+lyTPXBdX/btju9qKR3PYLysNcDe4xoHt/s6BoaCE1y2uLQ1p?=
 =?us-ascii?Q?S/2UsFM6vfelfMdEcrHYIGmCX+H+wrOXopRvI60bJgYdZOOvZS9Tx0y8OmeR?=
 =?us-ascii?Q?zl0MGlImdTuJ/nI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TBA+fOfrer4NwX6wJhp1JtJTkoZx0xk17BxYQ+pYzed7/wfXX0ggVcbD8lwv?=
 =?us-ascii?Q?sg5V4fYGHrQniO2VQpr+hOFaqlq4a8L+AX1hU7rD+fgXoruPh84SsJ3IgckV?=
 =?us-ascii?Q?GOYnAQkOLt3C61mUjy4eWiBjJ+NTzmRb1wIs27u0reiLQazJCou9FcThFMmX?=
 =?us-ascii?Q?6u/pbMF2kJe3sF2s7o4TaB3v01LMak2MmH/inol2x9wHoquFtgbn3pzVYZkL?=
 =?us-ascii?Q?gKOb8F7mP+SsGPYAl7HctHcB8a6tCMbrKHr1VgHu7AMWbZ1eP1C033fmHFuE?=
 =?us-ascii?Q?OXkNfBfpbbXNfvlW3wR4xRfpz1An+wkLggJTiEQMcBFQPP6dfH3sEJQ9091M?=
 =?us-ascii?Q?jqRYl7WyfW250rqHPMdKL2EylQg+70KubgRCOqccZ6TPRJMPP/qz7+YtBJWZ?=
 =?us-ascii?Q?KuM25j5x0M5x/n/sEEUh0k5PvAfouWk7Bhxb0+8jzqVCvyQSmrxxXg14hDL+?=
 =?us-ascii?Q?kAIGCB9gRQhgSiMksURl+mfcTNL56bChDom6eyUpTFbQoYkFPKi+wnSPuttz?=
 =?us-ascii?Q?Pc3RjP0pGWnMbd/0hRdKmTKuG34XLTVo7MB+tqUbSuyNFEv9MSrAu4sFj4ii?=
 =?us-ascii?Q?dGufOXhafUmcs9vNwsIWJJn/QbGGcj/WsMnM8XuCYBEopbFAgqTBo22vRn98?=
 =?us-ascii?Q?rNxZk/uIECuB0Y88tn8P/MUJNTld8E+Nkd5BdQRvzKR/Hz/IMgdXtdf9R92s?=
 =?us-ascii?Q?3nsfmtHEuJE2TLeVeWEkn8oPr3sRD9F43NHTvrAD6RBP4n4Nsa/olNUjrSIH?=
 =?us-ascii?Q?W+vRqChRawimGNqbZTzbRJy0oqycSf4eHr1PnVfkBBgmTV/wAXmXAGp7OIVC?=
 =?us-ascii?Q?lDTXzVN55Xgu88738eW5GFBHUCP8W7y0Ei0oFh8zbeLTVpuJMPi2D4jAoN9r?=
 =?us-ascii?Q?S03lgK/1Q6PKwDWbftCJ97v1AbsjxkjDQ9KYHT6QU8XBA8sw0ZR5u+wbh+aR?=
 =?us-ascii?Q?LLc/kYYIaSC1OOFxBPjrhT+QCfF3tsGcMIuojkeKlggKLTDitW+YevWS28xx?=
 =?us-ascii?Q?FCSg8CtCqSH1DGnhajzFtcqbFiLu8lHD5pYGA65QonWxbnkR8HwAD8HT7zRe?=
 =?us-ascii?Q?aqqR16cMAF46w3oV6z4kDpAIQ+KiwIhQ7aMGsOiv75esa2gMm+yQoicAScex?=
 =?us-ascii?Q?86YFaPijIxGsxgM5/02NxiGX7BRv7KdF9XFGFDjx2dAZnHwZAOKszJFQ+y4u?=
 =?us-ascii?Q?/f7L+DZpwKmvqXFfAFGarE3g3sW68rLFYLu/ck/O7f9qK1s/k7qdCFG8HfEW?=
 =?us-ascii?Q?Lx8YYSqJdPOFNGvDY7kiFHiktnoQjV6ihxrYx5YssMEvEfZSQIWh49wUtV1u?=
 =?us-ascii?Q?JLyTBpj2qt1jQKCrzDj6ePwe+bEFrhw/IRlRc2HPdqgY7pgur5KCzaWQUS9p?=
 =?us-ascii?Q?lwySfq/1iiROc2NA47Y+Tt1kx1VtDgZNluYEJkXVIunUIe5csBhcrRxEr32t?=
 =?us-ascii?Q?OQZdijHjbrV673lMIZzHN4TRXdzmEkXhzZXey9nRGmoJ9MddGnCNUUG6Uoq9?=
 =?us-ascii?Q?z6NwMoltLS5JLk1+6/KwezjT3ikrQKHuNks5r8HfY45UfP4/mvInRyYA7o0a?=
 =?us-ascii?Q?H1A9jBi3rF448NnzgW0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d16971-a1c4-48ca-cb2c-08de1e27f61d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:31.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPyf5krtsKYZi8+EthB7d0YP11HQlxBMcg68Dq+RLZcZ1O3OITLMrmW4fWeHIkCI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

Move it out of mbochs_ioctl() and re-indent it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 56 +++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 18623ba666e33f..7f889b31fa2ce2 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1185,13 +1185,42 @@ static int mbochs_get_gfx_dmabuf(struct mdev_state *mdev_state, u32 id)
 	return dma_buf_fd(dmabuf->buf, 0);
 }
 
+static int mbochs_ioctl_get_region_info(struct vfio_device *vdev,
+					struct vfio_region_info __user *arg)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct vfio_region_info_ext info;
+	unsigned long minsz, outsz;
+	int ret;
+
+	minsz = offsetofend(typeof(info), base.offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	outsz = info.base.argsz;
+	if (outsz < minsz)
+		return -EINVAL;
+	if (outsz > sizeof(info))
+		return -EINVAL;
+
+	ret = mbochs_get_region_info(mdev_state, &info);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arg, &info, outsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
 	int ret = 0;
-	unsigned long minsz, outsz;
+	unsigned long minsz;
 
 	switch (cmd) {
 	case VFIO_DEVICE_GET_INFO:
@@ -1215,30 +1244,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 		return 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info_ext info;
-
-		minsz = offsetofend(typeof(info), base.offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		outsz = info.base.argsz;
-		if (outsz < minsz)
-			return -EINVAL;
-		if (outsz > sizeof(info))
-			return -EINVAL;
-
-		ret = mbochs_get_region_info(mdev_state, &info);
-		if (ret)
-			return ret;
-
-		if (copy_to_user((void __user *)arg, &info, outsz))
-			return -EFAULT;
-
-		return 0;
-	}
 
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
@@ -1376,6 +1381,7 @@ static const struct vfio_device_ops mbochs_dev_ops = {
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
+	.get_region_info = mbochs_ioctl_get_region_info,
 	.mmap = mbochs_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
-- 
2.43.0

