Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1353D9A6C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB656E950;
	Thu, 29 Jul 2021 00:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C96E05A;
 Thu, 29 Jul 2021 00:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfSjX/KI7dAa2J/UMJXIGB/3HNnhPXImMbUGhkX6NkDyfcTcyr67YzWcNXXCqOQnjvDeud07HQtbZsBCxVgP5ucGzog66v0jx+Y2bxy+SRyTMLdJHJrAHG23NOU8cByrlSSYaGChQ5Kipf91p6YRKzMM7L44qohisXWe4d3oBL9gOkTdIVU6Z7n82AAyFj5yRqZSDAzTN5kuFFVjhEPrFr20FtGDy3Ez11Ej8Sb6fkAkvyGItTCwc13MvYLDkvAjRugVH4tmhhap2QuQapiXtxpPeJO8pKTzOrB3qZmK4Swft7S8g0daFLhPXXkSVmGFcvDK2i6Qp69thOJIBcP8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU3f9OuiUdmchkw+GXAfx5H8S4/WIy0aiIG/duzDst8=;
 b=kb0iOsuJfZksmx81YlMLrUrMgVdUV/JTSSPu/aRSoLxBFVA0mqJLvqj0fjzh3NmsccEie8jdSv9yB2gRBGrOb0+EC+jrJnwzKLZ6ltjF+n0PvLONt6iRAtaqLdBCM5E8kjPLL1Qt73nlBl9nydU15nyl+/7XJvQws6CXjT1m36ujEy2Q4J18IAxoQH2InbyY9+MgQU3zymj9pD73WSOCFj/lvbRoD3XGtMByenfvTSeZ5h1GHBB197ZGff4M3ktMHtAHiu/yvDTpiwgUv6pd1nLtGMou1BSrELGCjsgMsxUPlDeiw4VFvNASzCKCbLM1W9WX9ERAIbtOpj30QirxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU3f9OuiUdmchkw+GXAfx5H8S4/WIy0aiIG/duzDst8=;
 b=W4QqdZicHJqfPJKiIYgq9d7QGVonp4FSPlcPvJDzQbib7d18Wbfl8m2+0dR54bXyMp8GaY1GwkiJ0Nm9+yYJirapx+Br+Y4lm+xc3WKvadh0NiLay5liD+7ynTjf7TETasQzfMlAtfpCYptIpnH/vsFDng3evsr8V1i5QG8uQsvhsadyM4+gp5+M5YjcvYb3PJe+rC5oyD7//ftyCa2LwXhlS/XsAZq/OFxdL0xydVXi+9o0S/6R86b9+3qPi+dMq91U6+kdoR5Dudd6f4NSHfX5ABu2Kq2/3mMqx4YmaXA7NGWLqZjWcpwF9iv5fpkzWR8fL5GXZyVJwXHnY50eyw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:26 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 02/14] vfio/mbochs: Fix missing error unwind of
 mbochs_used_mbytes
Date: Wed, 28 Jul 2021 21:49:11 -0300
Message-Id: <2-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pmj-PB; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6daf7576-f776-4ea4-3842-08d9522ab66f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160FDB4A2A073F45FC7FCC4C2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrqAnGt9HLPaQbUgU6RaZinRdr9SYUGnQeEYv1k+KyXb0z4L+Ov1qZVLMZ48+7/kgmNghGfbzz/joKA/xvUQrpYFev2LN0UxP7PF55WUvlMNVHc3E9b8+Xm7a9YDZRRJvgrov4j+hXyUQsmFVxvTPxKsdd3+2XWxBEItnjThPL6GdGdjEoogpfwWs5f4evfl3ZZnPnUHQJDFVB8gZf32G3CFCkCaEDK9VG89zVflmolZsKkwOMrFhByq70gszqut2dgKRw+UBz0/0zV7T1doweEsyRuSi8KatlBEf4+voTQre4RE/7rNb7mmi6oQE30OoJaT76OCJzfjT54va/iULxgPEjf5QAodtuRKsmiIEkjtYMDPtGRZ/iLGxK6sn/WtRowIqxmdmxPpF2Y7L3STQSsy0lfTI+EWTJEvaYO9QVS1LEjEvUM2LPnqi1FXuZq7GiSXj64zKpvEJ/1LKMTwEhX2FvseXvORUAIxHbZ6zQQhyCWxYTy3syRUuvbtv7ecPDQ38OrfjSD3FuThWDI95yyMIU5nBB+nOTfsrVn1XBpklcxAdKaGF/DZnqjt3JFuzIfSkk1CnQ436zk+QVDEAY3apICA/m/k3iUDVFVM54ZlGrXihHhNR4C7V6RUaKsYPbaD1cxadPKIAWfoU5xPT7Pwh9K4v0U1OZ80ljEdg+RxB0BalSW/rJwy9zncn29UCnNK/Ec7TulFcQQaVcKS5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6xLb1zWkrZZahMpFF+b5tdxUmMXBcrr9LJcP2iltY4O6/3FS3MFAr8CNJXN?=
 =?us-ascii?Q?0s2s8G6K8oU/t8CaBdpbQGs5PiFVI8+K0JfCY5Wo5Ea20m2/LjYgrjseDAQ1?=
 =?us-ascii?Q?qVoyKcUnTMHeioQE545XsY5rglUXPPTY3OShp1ihJqiJcTELaHQ0RRG/7CUv?=
 =?us-ascii?Q?2tTCAVy6Kw+dFdW7hwDuo1x6xmJLyiIZfnQZzoEn4fosEO3VPyqvdqqnzD8a?=
 =?us-ascii?Q?nsRtZMF2glEwd/biHJA6dyCLJlTfyBfnHbhE7ZSuq4HPmtlCUhwbPCBrchSn?=
 =?us-ascii?Q?pK2dJQ42jRK11h+jsSohDPgYJaDO/z/4ZaF9tXdRVF9gOlrTfPKRLEhmireA?=
 =?us-ascii?Q?cIuJtvcRsIThIIF08GX9kldwuc0lF6jw9w55Ypkdm0KCIemjqdCZhGdAlvfK?=
 =?us-ascii?Q?iKLBaOAg1vqIBG5Eg18iALXsRuS2qBq2Z5V/fGGrmfS6y4DeRtHCjJQQWNzL?=
 =?us-ascii?Q?3FGr8OGZPXtxY7Fguo1RS18bF7RxRgmYVSUQpxVhAsEppdQ9Dl20WY0Yln9H?=
 =?us-ascii?Q?NddACwYw5bfyNp1IRiyDcjjcLgC02km0DiOUjzf+8XwLDdgNHtwxHNMPSfnA?=
 =?us-ascii?Q?LTHs/gImZR8XDvdhDef7rff0UwLwsAoYBwvHN6SpmBv4UIhrJm6X+63sToSf?=
 =?us-ascii?Q?29BKvcDUJiypYka/50NuSl0kmqLVO9RUBNP6l+YetpPn6MqpJlceVsOWgBpJ?=
 =?us-ascii?Q?SwH9B6Fw4B/KuwS4t+lKy3OocN+1EhUMbB1trknMhyD2Sio2W78NGkl9OmDu?=
 =?us-ascii?Q?Yb2vcmrcSm+OBd6amN2ewArQqDaann+vjse5MnYI2QmZoYmkvWdVVMFFSTV0?=
 =?us-ascii?Q?BuqbGGpJZrJ5BahxbFZg6zuEhtq0pnry4HaKKNwxqa9dmDGWz5SXKjUXnTjw?=
 =?us-ascii?Q?/m5Np4EqKZGGjw7l0lQjLcVgIStyuvvkHi5cfFMnCxOBRyRINLOe4vpktPUA?=
 =?us-ascii?Q?uUCp2VvuJ+lq/bg1u+9nE7IZgNvR6+0p5Q8x+LjObhJXqGpnIOugDMaZFU8m?=
 =?us-ascii?Q?vbbpXY5bPqquKkgirnKl3fKbhhCByC6QNaePJQa39eBzWRxC9TEjCl4YNKWE?=
 =?us-ascii?Q?To9T7AfxfBKWfkNXvFGishqGyqcyv032G7Md20GeEJDBhRNAqvQltKQMLcUX?=
 =?us-ascii?Q?cPHaX9DOgxLdueJ5XqzcfwjG4z2x1dF83nF7m6khG3D/DudFjPkOYkjNiRhx?=
 =?us-ascii?Q?B80u2R8cwra20uVQwPkdm+sOvC8I0JSsUiI3ZOlRBdScEXPDomCYx/JXjXdY?=
 =?us-ascii?Q?/i2XGEgoXmOo/Xdx6LcavXtECHEZH5lfjuaF9AtL38rBuLZ1MN3X9YYmZnuU?=
 =?us-ascii?Q?vKU566utlhdaZORwB2bmWMOd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daf7576-f776-4ea4-3842-08d9522ab66f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:25.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/NvBt8GiacMZ+bXmcFSetcC7VmO4wOH73xFJTBgNeMV5IhNNQtLfomTamQoI5/k
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mbochs to use an atomic scheme for this like mtty was changed
into. The atomic fixes various race conditions with probing. Add the
missing error unwind. Also add the missing kfree of mdev_state->pages.

Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reported-by: Cornelia Huck <cohuck@redhat.com>
Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e81b875b4d87b4..a12b1fc94ed402 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -129,7 +129,7 @@ static dev_t		mbochs_devt;
 static struct class	*mbochs_class;
 static struct cdev	mbochs_cdev;
 static struct device	mbochs_dev;
-static int		mbochs_used_mbytes;
+static atomic_t mbochs_avail_mbytes;
 static const struct vfio_device_ops mbochs_dev_ops;
 
 struct vfio_region_info_ext {
@@ -507,18 +507,22 @@ static int mbochs_reset(struct mdev_state *mdev_state)
 
 static int mbochs_probe(struct mdev_device *mdev)
 {
+	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
 	const struct mbochs_type *type =
 		&mbochs_types[mdev_get_type_group_id(mdev)];
 	struct device *dev = mdev_dev(mdev);
 	struct mdev_state *mdev_state;
 	int ret = -ENOMEM;
 
-	if (type->mbytes + mbochs_used_mbytes > max_mbytes)
-		return -ENOMEM;
+	do {
+		if (avail_mbytes < type->mbytes)
+			return -ENOSPC;
+	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
+				     avail_mbytes - type->mbytes));
 
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL)
-		return -ENOMEM;
+		goto err_avail;
 	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mbochs_dev_ops);
 
 	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
@@ -549,17 +553,17 @@ static int mbochs_probe(struct mdev_device *mdev)
 	mbochs_create_config_space(mdev_state);
 	mbochs_reset(mdev_state);
 
-	mbochs_used_mbytes += type->mbytes;
-
 	ret = vfio_register_group_dev(&mdev_state->vdev);
 	if (ret)
 		goto err_mem;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
-
 err_mem:
+	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
+err_avail:
+	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	return ret;
 }
 
@@ -567,8 +571,8 @@ static void mbochs_remove(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
-	mbochs_used_mbytes -= mdev_state->type->mbytes;
 	vfio_unregister_group_dev(&mdev_state->vdev);
+	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
@@ -1351,7 +1355,7 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 {
 	const struct mbochs_type *type =
 		&mbochs_types[mtype_get_type_group_id(mtype)];
-	int count = (max_mbytes - mbochs_used_mbytes) / type->mbytes;
+	int count = atomic_read(&mbochs_avail_mbytes) / type->mbytes;
 
 	return sprintf(buf, "%d\n", count);
 }
@@ -1433,6 +1437,8 @@ static int __init mbochs_dev_init(void)
 {
 	int ret = 0;
 
+	atomic_set(&mbochs_avail_mbytes, max_mbytes);
+
 	ret = alloc_chrdev_region(&mbochs_devt, 0, MINORMASK + 1, MBOCHS_NAME);
 	if (ret < 0) {
 		pr_err("Error: failed to register mbochs_dev, err: %d\n", ret);
-- 
2.32.0

