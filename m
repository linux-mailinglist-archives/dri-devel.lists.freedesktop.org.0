Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93443D009F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EF16E4C4;
	Tue, 20 Jul 2021 17:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C826E4B7;
 Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qgk7cu2grfEN61Qg3mDVmBtQwxv+KxvVLdFpO43kcRlGVp7RcRA9vf8D8TvxHYN6tyLnDNLjtXN6iAvfgaC5Yn+J1dGgr8F93v6AtO933t4s9WV9PJ1Qa1PBR7eodr0SFVyHs5HGRkuH6O0gh+uxyIyXORMNOAJPGrrtFEFGLm4gvHDV5RmZ0ramxHDEUOxWlmuSnQiF86ZNBxQp8nvoxJ6fcQvENdAn5O3lnLNzNPiTIsinucUd6ktQvEKllyESlyjhO6cyL2k3fJX2HZEuxPY52PU79KOcqxbTJlzBjQTJKSkdcavZiBX5Lse/7WCq+evg2f5jSwC7yP7Spr3QAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJfLcGqFvnMOejTizEycjE8TKphpeJPX5UeS8fmgFOI=;
 b=F894YODjpMgn1d1HGXTa97uiZUo5JFaHxhOtXTuoPwF3wtnrp8nIXkF95X2BE7ybblQrAFK1AwJwR1NJurNosYz9rtoX9WA3Gz5ZQ1NvlLrG2UVYWWj/9pVCYi3b6kJwgNENgopDr/jB3bUbslS0TY5LYBZYnNmR/XURK8eQvcyc1yn4KGQs3rpEU8efr+JSVEKFhr1QHmI3U7etdtURtmpu1GWyE13QPJuyQdQMmYKdyF8IUIdBlH9/xg3Y7P70IcRgN16RuK0P9xuJVELXFtH1utbfPMxzUw2VPD+5XdUEaeY0JuQAWMytV83vHSUSoGtdrMXiWGRv57XdeJY4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJfLcGqFvnMOejTizEycjE8TKphpeJPX5UeS8fmgFOI=;
 b=K2rHcloLoDXpdh9KjldBw52toffZWGowutLCNrfdGOUd+M1KtcrCbjYHqTEMDsN9NISeLs8WN207L2LfDICvkt9ooZGV4+hHiPZSNK7c8SKRvUCQNo52x/Fw8R7traLdb/amMQop0WFlvOyr0Y7oGUCVLn+aJSuqBnXhz+5Pqe1uRo1gAcnTRFz9Wt+tKA1V6nd9Fw3pNH5XyExzvJeKjpEsD26mIaZ1yK+oz8zuTU05BGS/4464pDlGBm2EF6IsFGfNltm7SBa5wFSMyYsq9cvAWBtadEEjg0f//tPLDE4s7ud8zVyYMX1rWGZNqlcjqqzqO2K4X/8PygjjEXxRiA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:08 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:08 +0000
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
Subject: [PATCH v2 05/14] vfio/samples: Delete useless open/close
Date: Tue, 20 Jul 2021 14:42:51 -0300
Message-Id: <5-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:208:fc::45) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0032.namprd02.prod.outlook.com (2603:10b6:208:fc::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:04 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Eo-Ab; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ba9049-3ce9-4124-4185-08d94ba5d3c5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288C25AD42DEF67DA4B3537C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aSZEMWaDv9G+Uv9SbE4aqAAZSNe3QyOX6ex5OlRuPihzEy4mAKnAeKg8LJpwlSfEFNxBCoDvhYO1qUgteB6BYT9LWbTnWzUqEqDcnWLAfs94Us6qi48HgkxhjMlQG1WxsBgFVHUvXeQYmcjz3Dqn2Yfe9ViG4pCUhOKD1NTxqYRbm+VOBBmaoGiHF/smIQLtFNJPQOA1ihPls6ScbJqcG7vr0PqAMIXsN8vlA0jMbn+XGL88y1cRUJAm/KPVE193M1WuoYiKanm7r53vjLfE2szp7wVjkdAy8H0wGcZ+5pduTq/ubk+h88S7G0egkmqW0UKyQyyahCR76Cz82Jbw8cklwQhS53ik1l6TJLw3vUM5VZTQ7miIMEtmbXcyXMGXvTXcHFYnk6GihVqxXEjbitmbgLujq0I/j5quIzaAlwe9D5WSfzcEgF8884uG1crKssyApXoocjnmYEjbATlsEpOetawGCtPKmhrS/EY0dod09WF7OOFMHnlgPEttrdLSYrlkchM7zrXl9iT5rBHtNrv5AK8UjtYszOUP29F2auHnU9ncH+Jwehxzw7dTZdVSbpM1OFmpM19j7/BEGDqW/MwqsCAHS+Y+BlxU0YRt7p3261q9r+CEaaX69ABuiSR2JU2J9NAZUEceRkAAUpn8oy14SRvKaP9m2zugVdfq7LuOHgrqsBI/DjRh6ZhQgPNZ4cb1vSj84ROfY5+NAnu4ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p+QIxOPQiJHgpTDxWeyeR3bUcWxFWFAhKXI7xD5Gn5zEzCdXGixN+HKs3vKa?=
 =?us-ascii?Q?qEUtisqHQ4yfrtXvN7vaKakN8jxXKLM6av85swgt2TifjocJrbsyrK3oHHXd?=
 =?us-ascii?Q?orhUzoRB9W5ry/v7j6TRK6j0zRf7VcqN7Aji1D1u4Vjx/0T9atxZNT5Qr5Du?=
 =?us-ascii?Q?gz8jLuKLT8NbuYom8XHvcLMyLLSnDvOY8LnpB61lQt9WoYTMcIplxDpyE6u9?=
 =?us-ascii?Q?DjfKq63jF0uDwPMIRZLBpCI5gjrjgm1+8z0RdhFSLIFgNvFN3jckaqHs6H0C?=
 =?us-ascii?Q?rJrTgfSfhQ/OTlktNxbhVMe99IKgRzZNoSy1N3IASN5D8HHWIKUtdwvbDCLF?=
 =?us-ascii?Q?2DGtkk9XXKk5eByoEGJ0rouDHH8Qf4SVdaeblLwRYAt2Na45FSrNHUNhVIEp?=
 =?us-ascii?Q?R2qeUQURrskXNBRgWtupSCjnHmEL8YiSeM3ALjNzO+rWQLZ8oggx+5NG+xIC?=
 =?us-ascii?Q?LFkPMu2fwD4KtOXHgZ8tT7Vc81C8whulkNcXkDIG4od81r1NYJVzHbALEQbq?=
 =?us-ascii?Q?uvBiPteR+VnJN4wpsQcHY8S7G2GCU1MHPb1aQn6cstiGJ+KnvTyXN/hRUDHR?=
 =?us-ascii?Q?CTBH9v7w3LRlY78+UrawfMdOrp73uhg5mWPuu2vdjArfG8HlAyx9nHpeFySk?=
 =?us-ascii?Q?7UMyQDK0/In9YXNInPDWX/Dw0hZXdMdYIRRzS8FM8fDjTiPgyZhSoIuX7g1B?=
 =?us-ascii?Q?5q/Z6tQW7f6frfGuPJkV5sZ1lhK65dPfBGXI52YK+JF9amfXRyo93rPpPoY3?=
 =?us-ascii?Q?2COG3xkfyg2zavrK7rPQR+1cSS8Hhcw2SBmkvJX2qL2VFcMLjcSurN0idXnd?=
 =?us-ascii?Q?hg4uC8OHhT3c9AuXnXeXAXNWmWeqdiLvOH0jAwG9UITFU51v5jzjGs9iZwot?=
 =?us-ascii?Q?LgIhvFManx5mByBLeWeFNSx/R+gPZi6nkoUuT+0OsehMV2N3M0l4ZZURzWX6?=
 =?us-ascii?Q?PPalMcYb3QQjHUMVhFiT224fbPtKk4kal6M7M0V3HqP8S1/mGqUZJZqlgnwJ?=
 =?us-ascii?Q?vIz/nVA3VNUXjDQNBOtGaryDIB+Obq2w3up9KxR6QtJS+Uzttq3D0t9DcKXm?=
 =?us-ascii?Q?2NKjZO3NAwdxUh4GTiZ/JGOKxHBD3AWs85T+sgFvRWckKXfGwZHXf4T+FJCY?=
 =?us-ascii?Q?3b/kuwfzYY675zIe7M+32iJUsSJqmokpub9ybaJf9T+0dLRTY8ANqZIHK7fF?=
 =?us-ascii?Q?S5uGsB2GXacZ5chOx7utGSGtB/lECAIfDKr5e4u8fLwFv07vI423dAosTI6B?=
 =?us-ascii?Q?59qQuclTAXCgf4eDT3SYpZghCZfutWPW3vNF/X5SLDR5evOSpON/3JeJW66I?=
 =?us-ascii?Q?s1EiDbt3Bzg1ePBxbw2CpB2V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ba9049-3ce9-4124-4185-08d94ba5d3c5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:04.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjiUhI8UnjYGro5TBze6Xx1i927ZS8L9YF/ceBXunuUamy+MaOljg9MaJqQeEzQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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

The core code no longer requires these ops to be defined, so delete these
empty functions and leave the op as NULL. mtty's functions only log a
pointless message, delete that entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c |  6 ------
 samples/vfio-mdev/mdpy.c   | 11 -----------
 samples/vfio-mdev/mtty.c   | 13 -------------
 3 files changed, 30 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 4ec4bc649351fc..fb81d11029e8a5 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1277,11 +1277,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
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
@@ -1400,7 +1395,6 @@ static struct attribute_group *mdev_type_groups[] = {
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

