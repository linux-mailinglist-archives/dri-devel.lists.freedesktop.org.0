Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822EE3C9515
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7BF6E525;
	Thu, 15 Jul 2021 00:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A77E6E4EC;
 Thu, 15 Jul 2021 00:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXbQap2NCDvolvcGLZynkAOKh5Np55oArsqu4xXdsfe2hy9PPs0C3ApgDZgJ4ixEPIEwBU4+KRBgglgaj66icMNt6CJQJYsRVb1tKYVOq06FQOpmffeMEZ/PgSNFkZCUPPuNaiaI737oGciyLEHGQZzvHEMDJ7sycYgQcRGrLCV+aO50jmzUFYWiTUR9A14CPI8jugLoa0oH30FIThfooKfr1IJGhix/YmScz6cPr+SwE2Uqcuxu5+lpEEkruqHCocs7/3/WtHX385aq46aCvB6HODLvg0ZJ7timhwitKf+cPjBQM8mtXYX7Xqdd3BpxG+ciyP46P8quO18HeJUH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAymuJm+QAd3Drot5Ks5S5cKvfiu78o9bP2liwNXxHQ=;
 b=dZhXfK90C7oO716+kchJ95zxG7Or6y22Kw++e597N8Lv6WTlSM95TQNRsS/HT9KUJvdy8+8wC0jw/hwnB7RJNrhH1ct40ChppEm7TKhXF1aEEiWSGixtuI54Fed3hzhkfvAr1IFPs3gSfjm8m8zoNBIC4XF86XXPcqyK4Iy/DCT+fShT2oD2S3Gb61fxuWESQ76Z5zs0Ktd8dgJrFkzG2DZpyxWqFUhgxwoD9XVtL2ybCCq3IVYrhI17q5Ck4/AmZ1/FJg8VdQhii8rRrVe2lg4GN3s0sMWjfdy4bCHMCNLMzq5C3yhw2PELUUsIow0eqGbUQrZo0G//upk+9q7ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAymuJm+QAd3Drot5Ks5S5cKvfiu78o9bP2liwNXxHQ=;
 b=CtZcCbTGllqWnGFyWm6NSs3npGW94lE+Aq5UqxQqW1+MJpshGfdRoVGuPxW4RdmAdSEHMg/7zvk7q6jSdeBr2a1PE5SoU4sAvfgwdvd79umAep0qAhUBM8y4H2IK5vgoRtFcP1v9w9MjitTTEl8OumnUFmCgUP0Yksv2g4o73cl8jcv57/8kaDsnZSP/f2IOcZOdz75hOaPJrd11PyJxi3nfmtEBYhCMRz/QvYEiLVWW4W1ATNmZxr/dyqsrUop8G/BtfokVO6Nk2ytOTBQBAmD+LdjwCSR84dOR/Y6icObXQR+ohQvubZI2sjrvDxwPNf5MD0BpiuzTox2vN+WijQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 00:20:45 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:44 +0000
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
Subject: [PATCH 01/13] vfio/samples: Remove module get/put
Date: Wed, 14 Jul 2021 21:20:30 -0300
Message-Id: <1-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:610:5a::36) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:5a::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Ux7-Bv; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bb048a2-d0e7-4cb1-85a6-08d94726627f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB533497FC4F57B8A90ABE0B58C2129@BL1PR12MB5334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WcKwzDdvpL8v+yjXSepjfAwgEQFZfH+Ngd33SL0S2ZF2d909hXc7FT93LVDx+9mmdnGNTTxMzpu9q+RHshxuy7fpiyO5ia3Las6ikAxyNKDHYjPKARCrQiq6ImYVyvoczSPVTV8kW1c7Mjh5TS+RYfgrsrHpWAkJRqSYapWRRu46Ske7ylHPW5onCm0spvbd/MEzYp9rKJcLWeKW04LI1W/zRQVi84tiAg3wcrpC4oCgXjLTu8bYQKi0o8ld33sqVh1fVmqLeawULTNoqvAqeKWKflDjrQ9eI2QPQgOxbeNO85JxWxzaWno+saoPmi+B67izw1RewT6QM0OHnM3itk42kUEL0qduhJDg4F6+ijWeEV6rsN09d15Up0q/Xlr7KTOheiUZqCa2o7sosm5MMv1JVLqTQREclJK4q6xMgknINGISdySc6bpc8ivkXouadKujgae9RfL5+oWW0LpdyjOdhHm9yF/Lf+6Rxb+NaZspuTqNif63WXXlFyuU2q3ienbF4ovYj5zkvWaSmYle/YTWqNPStMwm+T0DY/a8gv36amzdYIZgqZgjUY7+urCrTpnARZtmlgBlbccG7iLH6O7elnY/djllQjpfskGvqOn8fxAhLHqC6nsVYNE4DFBPAYaJ6HgUNdMRtVNvG+HJFDvMw38Ea/8l4M+6ULhOi4xCJvcuQiOZRxxzEUKUCtJXBsO6F/Q6TVCnhIqagdYpFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(107886003)(86362001)(66556008)(66476007)(54906003)(5660300002)(36756003)(2906002)(26005)(6666004)(4326008)(7416002)(9746002)(426003)(9786002)(186003)(66946007)(110136005)(2616005)(316002)(7406005)(83380400001)(8936002)(38100700002)(921005)(8676002)(478600001)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xAdi3WD9B+DoG/HTFQ+MihmFAOVKAP3XZe5zBhgj+/QgwZOq6QOVTB25OrBr?=
 =?us-ascii?Q?3GmJ1Z2LFHloKkTQTL6n/mwyOKfVxBz08pPyIMgYTOOE/UfBoFhr55zePSb2?=
 =?us-ascii?Q?CSdoVUvp9N4oLk8GyvW1PpNQMwRuP2dzfahiXe47/b0ib+wFme5GHfqRzPvc?=
 =?us-ascii?Q?JDJFeQ7yGsEHKxc0gslZh883aaI8ewL+Y1Rr6IfWtM7kZ9W5sEU0oQGLgjWz?=
 =?us-ascii?Q?A/NLiOCIL5gO1MAvltJqzKergXVfz4CPYEGiVTkH1sZnNwgF75PU8YRSH3qW?=
 =?us-ascii?Q?6CG8ZTDPvFvXHmg9cDFsE/HAuC/YChH02KvY16zz7PdUy+cZKCU3QSU0+ZAS?=
 =?us-ascii?Q?8HPLkxgdEcbB6R+8+ouNSPdg1vIELzIMvCXXUABTclVIWP5OS47t3/US7jdS?=
 =?us-ascii?Q?SChHi84/akZIsqGZGv4kZh3OPFANkQr2jC/cNvdisgaXyGjzPDAE03QZavDk?=
 =?us-ascii?Q?DdTYU3nuzFg4/VdSTzQzJCrMr4+HIvoTnMlt/6ohEYML9Suh/mdQZ/UrLj5n?=
 =?us-ascii?Q?DCLlDeu+XG2DR9pYEX6NPIjMbUvXgPhUkjNxoAqBgAVnn/sgJAZGEPeyptMx?=
 =?us-ascii?Q?srqiyVeAqK98/bHMIhR9Vy3ex/NCZRprATvNlCpqXxEr28s8AgTud1hiUZEH?=
 =?us-ascii?Q?La6Ah1QA4O0rYPbSMOtFOYv4C0E7x8L1SG31MHHGQM386c6ZwuwQ3Eyc1aLc?=
 =?us-ascii?Q?ekuw/HKILj+d4PCvUiW4XoHIUgNDWt0RnmYx21mxzP6nVRkztqZt7SieUav2?=
 =?us-ascii?Q?FH3LHD+Rp/ktIVO9BGors11Z9ebwkuPa6EPnrR93E3BrrnbBn0+Y7pk23FPS?=
 =?us-ascii?Q?AsBdIC7s/lkdoFWZW053eedqxXfNmT/MJyl6VYZUzfFqKf92eecm9eDcJl2J?=
 =?us-ascii?Q?Z5RvtHReH45yG8ESwUXkLOojjq5ci4XaX/Nu/FPybmmiFB6nGcYuii5bYpCu?=
 =?us-ascii?Q?IPu10HLE4pagPSzsdnoQSrOmg6ilAnDW+oJ07EDRxorGyg/MmiLYYZP0iLK6?=
 =?us-ascii?Q?9b8QjR5nN1ymgI2sh7slZI5b+iylBC7bY3dVfTYhwT/cRAjuFi/sg6FQhoic?=
 =?us-ascii?Q?hT/KMyNX4vyO5D+wnTONOSnzdBWaSeLINmm9MeuS1HNHnSDZufL6k+1di6y/?=
 =?us-ascii?Q?90VGUfw8P54Kcai9xNm0zrS3keCL0OBpHX0W7aKXzhK1oSNie7xtsPfjL79Z?=
 =?us-ascii?Q?cfgPA23e4E0wD68DRr7gmRbb8ncBC31TIf0oysjawN1mHOYIhaAi8yanFiEA?=
 =?us-ascii?Q?fq41f5Ip1U38S/hzo8kEBZTANmQWaxe4i/cCwXsvCX5K+xNew1B5AXqMFbdw?=
 =?us-ascii?Q?6cO2FNTa6dBfswScKBcAxmRJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb048a2-d0e7-4cb1-85a6-08d94726627f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:43.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58+IiegTQZXKp3Ar1SrFzsyUmelvPnHBXCDqQ7lj15IyhqW/qb5vXs95g/YcEOak
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
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

The patch to move the get/put to core and the patch to convert the samples
to use vfio_device crossed in a way that this was missed. When both
patches are together the samples do not need their own get/put.

Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ----
 samples/vfio-mdev/mdpy.c   | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 6c0f229db36a1a..e81b875b4d87b4 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,9 +1274,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mbochs_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -1300,7 +1297,6 @@ static void mbochs_close(struct vfio_device *vdev)
 	mbochs_put_pages(mdev_state);
 
 	mutex_unlock(&mdev_state->ops_lock);
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 393c9df6f6a010..a7d4ed28d66411 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -611,15 +611,11 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mdpy_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
 static void mdpy_close(struct vfio_device *vdev)
 {
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
-- 
2.32.0

