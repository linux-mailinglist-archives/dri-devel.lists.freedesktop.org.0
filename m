Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6393C950E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44E76E516;
	Thu, 15 Jul 2021 00:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9B76E50D;
 Thu, 15 Jul 2021 00:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl1d8e8p6xRJSnnNpYXwAzZHt8Zbyh7yiGRWB8jQhsfmRWnZF5i79XkqmrS9/laHNdQjKJOnSiXNVM2LtJmbGWB0FnuOKY4tF4VCKONkoX1sw+lxAMRIlTBcPF0w1re4R/NKNNDMxDnHfinvygwo3t1MnWPotNggGdB1z9++mneLlObpJFoDS0wfmI5G6xRpBjZLtbRKMWkL6/mDWQNLrUtyMRjIiiq34F7Z3tgThgavyJ+diFCjsMMldpMAnZVwY7D0MK0GCL584LJu8FNW4/dXAQiADz9phai76XXgTrlH+EnWW9hyfMGZd4bYkTicl+tQ/a3L8vEtKPfqCh2E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIc2oCm8m6pW9fubLZi0TSzG4l2OL+6bcDFd5Way0kU=;
 b=NidO0Jc28HqYdwY668rfOw79YKrbtWuBkUU9UJoC2USMb9JPkxuPVrNqDXvVh+ELkEWj3ldJKBAxM1/S8iikZCOPoVh2EC29c07pjxj286VG3kn+s8waoWYBhVTC6YQNhc+1PvQiv5zLQ1rrqEVczfG1s+0npr+DPcb2SvsYhnNWgIFRPpMvcGUd0IeGQa/5Bb2P+4bDKdDw/uodPC2fwgClSVskkDXtEjNb2N+hsgOT6YVToxgX+oYtHCpTqAZv1j2YrPwWVq292e0qVDeSXdb+DWXDF6CvJ0+PLyA4ZP8m4m8dscwrpMnCQASwf1zqEZWGd1ABKDT79zgAdj9dpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIc2oCm8m6pW9fubLZi0TSzG4l2OL+6bcDFd5Way0kU=;
 b=WLZFIQLyjzlgc5GRUnUa1vfRBC3jH7RV0AssVuV1RZh25CVM8wlqOCNJXwoIhrXTxuEsBf2Gi6cNHEHAlmbdQxaqY1Fp2tKGOyLBmyYjuUo6PYx+5NerJSUNudb2BYbWMZQSbPpPJ01XIfzMi7LeOsiD+8BHtNCPJpYyPnIoBsZGatFksil2JahYUUiC2AwQ1dXF4IiIZU84ZCUyjxlr7MegwGcFUcfGHGtEGc/ffWR4bSxFVs56SD9jkJN75KovHKkDbKiJz3cqB46syTVELDowtb1IZ7uhi6KXhFJ5/iwGI4uwfyzUsFhTuxXMfLf06tcothMlsPVPYsP74Z2Usw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:48 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:48 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 04/13] vfio/samples: Delete useless open/close
Date: Wed, 14 Jul 2021 21:20:33 -0300
Message-Id: <4-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:610:b0::9) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:b0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxJ-Go; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b169f0c-bb3a-4045-bb8f-08d947266355
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55558965FFFBBA2878660AF1C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8V7q5539RgvyV8M5pD+2f/CSMwHTrdtwlyfXxAJ7dSuyw+UqJGYa3KYxfk3Pjn4jOgEf7Rf3ILfLLkdTGlWpkGQupZmughh7IcDJVpaU3iw8KHqcdmykzLpvukAbE8MbCaMwgxNqXykJwFlYgqjNHIENODw0f3HPAUFLt4xrkqcTXpV1z9Uwbhgnj18paxQrdTHfMf5WBQ/GNsxWnUvIfbnt+Ti0j73D5zkf2h3USkgHtGLKl1Cu9KtuvHwgWPYVLizSy24O0VBpmZLIk1+1ex/ugrcQsXKMqq5A4GPJVyf1fvR5R5XOphkPP5hHgV4YNseAhETNzznii1FpWs8jYMNeer3hXiBhytJqz5KikV1/bfZ9D7g638pVbWHoit1v4x33enYG+Sk1fSjx4lJ2cBkObnzSMYz4cyy1kK5Fk7UcveP57z5nP2JFwqKJtJpgb+8LanhA0HR3/SOcMq6QhpkPug9lydtvRpBmebluc0FgxfblvlhYzYY++CJEnLZ+wHwSCzPCyr3HO3oii4NeoHEddQaP8kjOTLv3UmrtZJ0Hl/zcqZExTwu/IukRDPT5ipqW1d6vSBvx0AMMgHC4Y1ISh28xRJjk+ARq6XarlkBvwqKbf1hizvYWTkjxsWkeZezEBfJqvwjCJpxIRgEtYDNSDXbx+/3lHRnIISL9Qg9oEJJultgBAloqkji1wKUOse+yK5Clqc2uh0lojnAEaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HY+cnBGqfVdIL9Y2dxWgnnRwJQ571yok669wjONRNkrdohvu61KZ3O1jvGVp?=
 =?us-ascii?Q?djfwZhPQk8ZrF0YfBj5pjaNUDH5On6kWKr/fR6xk7He9FQRmGZHLW7Emo11G?=
 =?us-ascii?Q?ppYDWDAmrZMrGEcoILQf3G4hxShc/Fyy8hWXOxy+AD9AJOVtX3iv48z/1PxJ?=
 =?us-ascii?Q?EqUBzS5syngMgunrHrW/dtfAciApIWhMZ2ws48Vm3eSjMjzgtwp+tyADfNw0?=
 =?us-ascii?Q?dpjGoPMk5ZoEoJgWyKh5Tt1yeU6upV2Irs38HCLi6KbSikEd05VU0FEz0wuS?=
 =?us-ascii?Q?Yba8wFWJAFEjH0kXynXbKLtNtlQMiqwHmDoDLiGtKGBR9UIOJzKKtlgjU4Lt?=
 =?us-ascii?Q?GPQeWApzYzDjxTvJ9enQfytcDm6Sc8ShwjvMk0OWpOOlFkhjGXApx2mnOzPh?=
 =?us-ascii?Q?IZ3hnD8Myu/Nek/TcM9FiwpajuzNZG5hO5JUdx182QYBZ+M5WauerY3bf4e7?=
 =?us-ascii?Q?lH5kXSFOA1fBlGRlxg0SQUP0Xi7X7JkK/BELxyY8UmSfsNAbfjOoQY7MLSt4?=
 =?us-ascii?Q?MzyYXWQQHF3JbPTYuUzuPDea3YiydHF3U2WdvwjL4it7MbmKtzl6VLuF9ao1?=
 =?us-ascii?Q?eGR7dvYRFy9CHcVitrS5XBdg0JEDnJFF3FasQEUUedh9ZLtqGDixBVifGMzS?=
 =?us-ascii?Q?HDTsrzapRwbuDIInvr+9jyUuHUG061OexRzuUWIkCL8f5bNczcDeXhuZT7+n?=
 =?us-ascii?Q?bEqttGEdSpL5Xb8TN4h1M8ed2rvrbTfC9wH31wchByvVbuz3fiY0JcslZSkD?=
 =?us-ascii?Q?neMSv+43wl18QWHhDSq+Nk5UvxfAxcmbGngR/gG9M9rFmbggdfvYd6WjuoPr?=
 =?us-ascii?Q?g2hzya9wwthSa8LrwmZvVzNTKJF/wpbrNZnsgH0SZ5eJzeH6zbxhqFvmWcFQ?=
 =?us-ascii?Q?TV619EPOHq+vyMQ5BmHq47d9F5InBZSp/l9kPV/HRpJC7DRC0g1f0fIcimrL?=
 =?us-ascii?Q?omu1yju2r9fXy1/28t+PuHKDHr1nJOJM4DzUgNUu7MHhj+kb3ct5lqWE+dDw?=
 =?us-ascii?Q?asxxHoneDzPlH3qdtPeAgyvLGsDczVVsSmCLNEX1EgBv9wPA7dcIes7TlV4r?=
 =?us-ascii?Q?uJ8f71V4ZZHr9kXm0zzMoKBUL0dJtQoHaau5mIni+s/oA0eVLHtb4px6nJzv?=
 =?us-ascii?Q?DAw9Dd3rgPwQh1x441wV2lUvTrNduQUkzVYlDUJ7NXQvU8UQQQRVs+lFQ4S3?=
 =?us-ascii?Q?wbPZ3OYKMbkPfA3leTM/Zp1hsZzPDGjGhn8B9ryq+2PKVCzDLpfJCFromOq7?=
 =?us-ascii?Q?+6CD07Z/lsdEwaG/HKX2xaCueVF1onoP4nspJ52BIBaT048JxpGnqy3PAchg?=
 =?us-ascii?Q?6cLaUrtzdmfOYoYVL44QCzfD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b169f0c-bb3a-4045-bb8f-08d947266355
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:45.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9hFacJR5P+I1CYOcgGHvk3Qv0URWvZv9izThXG2q/UWmBssXLIodQpELbnKjMgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The core code no longer requires these ops to be defined, so delete these
empty functions and leave the op as NULL. mtty's functions only log a
pointless message, delete that entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c |  6 ------
 samples/vfio-mdev/mdpy.c   | 11 -----------
 samples/vfio-mdev/mtty.c   | 13 -------------
 3 files changed, 30 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index cf264d0bf11053..199273bebcc0e2 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,11 +1274,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mbochs_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
 static void mbochs_close(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
@@ -1397,7 +1392,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.open = mbochs_open,
 	.release = mbochs_close,
 	.read = mbochs_read,
 	.write = mbochs_write,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 57334034cde6dd..8d1a80a0722aa9 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -614,15 +614,6 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mdpy_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
-static void mdpy_close(struct vfio_device *vdev)
-{
-}
-
 static ssize_t
 resolution_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -717,8 +708,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mdpy_dev_ops = {
-	.open = mdpy_open,
-	.release = mdpy_close,
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 37cc9067e1601d..5983cdb16e3d1d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1207,17 +1207,6 @@ static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mtty_open(struct vfio_device *vdev)
-{
-	pr_info("%s\n", __func__);
-	return 0;
-}
-
-static void mtty_close(struct vfio_device *mdev)
-{
-	pr_info("%s\n", __func__);
-}
-
 static ssize_t
 sample_mtty_dev_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
@@ -1325,8 +1314,6 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static const struct vfio_device_ops mtty_dev_ops = {
 	.name = "vfio-mtty",
-	.open = mtty_open,
-	.release = mtty_close,
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-- 
2.32.0

