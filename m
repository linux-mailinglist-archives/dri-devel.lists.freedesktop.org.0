Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A71620559
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5210E39E;
	Tue,  8 Nov 2022 00:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555A410E1FB;
 Tue,  8 Nov 2022 00:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhAxjXwYTQNXT/cC6/udU1fdlNzq6x8OocOnNiteaQXG7W70F9Zzi2jqT5RLD4FIHrep19fBh63H4Rb2QXk6Cxhxe66XD//tEZQtgNW/ajSSko0XdK6oui30BXHdGB9CX1w8viaEWcpHuBY/wDLoIiDbhSxZL91u3y3Pj19Wb/CK7GXGr7eoilWGiXc+ZPgBnosQ4c4eziI+EX0VZL0smzY2yHqz6EjH7B2sVFJNV0gHR/+EOIeZwM/WVxcPYWhnd+SnRaiegN9unhU2Lx5KJG8wT4p97EtYQvEBuVu7OU8J5+zn1yUh+CBgSGwQdt5q6o9IrMGRXkHaH8qR99DKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q877m5vi1BYjwA4DvxyXzNErjR7TrSELqr/xtym7skM=;
 b=LgX3USISEcmZMZH1L0xHLLZpGFA9hbEqtNXJGVd64QSHzFA7gUb3dU+k2YxP7U5dpqV4m388zSzmYkn6jWHhbaR5sykivGLpMTVTXdfJqg4GvnexASAdDQKbcH+xYUGceVrwEwLqIJ6B+f1J7TtlTZw/29EcZCh2+GMq/bUewFL8q+NPGchXsQXxxh00wWWa9kg0fAWViXq8fGf2s0DB3xycJp8OeJAhnQiPTV7eydGJRgCqqDV9GesF6EbwMqVX2Uc8yd4u3mERQnkejifiEwO/Ukx2++0Xj5DYrGXLr0IVjdHderHbPAeIy+s448rTSWsnBtFoNnFkURQMiuvL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q877m5vi1BYjwA4DvxyXzNErjR7TrSELqr/xtym7skM=;
 b=Uf4i3NcTaEFjD/a6ShjuSo7dcJme5RSRGM3RH5zJMPpMpITj9TorpBsojcdswp80JxhbTKyZm5jCtoKO0uTI/KUb0G6JritkrQ3r1PViLmYPWNP3VFcnZDUgF0Id93xq/ugSAvMgYB642sxXK/qq5pmlq8Cnhhuw9gg3Z2oyPeedde3OizvGJ0X24ty+jwXCSpdAqtnQeg7CMm80Xt6nsphAqTOOJTx+KNhqlUNys8TLZbj6drOicEhsYIYcTu8XnNnYJcZHwBwZqL2ugyrP67i+flOE+LflLSdjSaOidZUrvlXVY0B6akhr9G97I9kmB50iG4LTZZj8OTCEtIPaHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:53:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:00 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 09/11] vfio: Move container related MODULE_ALIAS statements
 into container.c
Date: Mon,  7 Nov 2022 20:52:53 -0400
Message-Id: <9-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0034.namprd15.prod.outlook.com
 (2603:10b6:207:17::47) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: e144e141-14ca-4716-c5e5-08dac1239373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpUzZIpdaAMwSicmYZoPlwvG9okx8QyZKTGoKPNbLN1OzUFp/91yQhXoWCfcpuIYUaykYl0Kj9aa8UvvRHu9T9zka2b2Ozr9MOUxsv8/KtJMVjh8VAI2XYCtqzDoJnKhD+YcfjlFjtopGYSZ+nHa01LwkjVuxJT4KcMw8LFMTMGMe1W3T32vqBTESrZSr/oaYLNb5U8bL3NTlqKV9ldDUj6ro+NFbALvq2tyLKaoo2WNJimYzG3owGInswXRhj7EvPyMqZTymaq5rwNzM5o3zuCCHjP14F8Gv5Qo7dv9FOSHn3PVgM5oSKzDr89gIPQsfvGffONiyaUDq8DNA/Nv5tYVspNXZUgVJyTKeFOP963BQ6cjAQdbPM0TVyH/dvx5mlnDwIk+7mK2TkwLO526jNsgF2+xgMIPXRynRMrcVU7STV0CtWDFoWY5XpugF42IhyckCY8OZzC46RsFDoNCQ28HDaYHD/v51t9ej7FdG4+gixoYUHvayxLzo9qqA0UwyKbsKy3sUUi1fQyPLrGtNyVcu3JTmF+HGK/k6jDqQyXMY9LLp/oy+3ePsFRMB9RXTpLtS7QJSZpbJeJgv1DZmGjmhViO1Frw/RZSaCp5N6HSBitlzgIRZSA3CpQm0k2tJLIBfRxtKzdzSZjIQBnzFIXJAKWvtQ3//f36LAuxOrrlBKUiScClIZlRy7u3/Mk6qLV+IKsQOKVvCmIEG6saLAI9RD8o2ycD86POhoziYgUwoDBpmMhiGfz1eWTrQ7nLteUCaSuu4Jml/7I9NbMRYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pl17a2kGZ00HnwsxFCoAHovyjah1AViFUG8YIE7ksPfXnDvryfUT60ozmdms?=
 =?us-ascii?Q?ViS5Rkz5i1IM2phkGKe6dBbwDQDCxuFYRwwKT6C2NRE4yehlQVZhJAVE2eTZ?=
 =?us-ascii?Q?ku1KLLrQ6I0OmS5ARzZRVyMV08HIydfnFLCGVDdcxfighnuSzI134BaZcQgG?=
 =?us-ascii?Q?GklG2pwHqNJdjREDNGfLOZk4Fw6/BF/Tl37q7P2lmRZGLJy5deRJKX0LSn/X?=
 =?us-ascii?Q?Y8+EKw1+/ZCBEEZixKHBM4qIimIhjnl+HWd7GW0dT7suyg/ZkEFA+prCp0hg?=
 =?us-ascii?Q?C5/spoUW+KkCGy7/z4gdyZ5SUEnqsxwKoJbdhxSVNUgbvH7z9aZwYSj2vTtl?=
 =?us-ascii?Q?KOd/GA7zLEGbkgv5E6/70MLiqA7x1oQFy6JVNPxJarV11xRBZzsl25z4dFFo?=
 =?us-ascii?Q?lqcGinLgD3LBM/7mG0cESMbs7qI758CvTCtVmh3Maexv1iQIS5Nvbq1rjLEq?=
 =?us-ascii?Q?cxV996nP2CLPiDuZZ+0jNumUV1yZ0nGQ9iy08mOX1tykuf1Y1CA6cBDMRkjp?=
 =?us-ascii?Q?WyW43RC8wH63XysvvPmPwpfzcPzNCiRe2XTnw4d5h2BzaoBYVR49/Idsy6Yo?=
 =?us-ascii?Q?R8xx8pscYYTnnISZ+yz64oM935QpYn907N4GdfGiQ0WbdJkZppga3XD+hs1D?=
 =?us-ascii?Q?I9ZtLP1VEexLJTHZStmYIhkfKhwSV59G/SI/kVQg0FmFXH5DeJqgIEDlx7Bh?=
 =?us-ascii?Q?0YZAZQulfWXBoLbcFccN2AD5yEUGVtXJG/7fDyHsldR8eDJ3gDqMj6gAOFbS?=
 =?us-ascii?Q?LR88nBgGx8wNQ4SmFedjzfXqt47HR2PCDdcu8rV1ievDOjSwDmfn8vCLeUTP?=
 =?us-ascii?Q?qeAIFBn/6JQnjkpvoyX1Sy+OuxFRJtsB4WRVPZ4AlMrwaJCVACKmzZLqN0rI?=
 =?us-ascii?Q?o/RZ12b+/c1T32Q2fsP7tqqdhdR/QUDGOClpvxf+42JKg/RL4pOdYdvkHBiO?=
 =?us-ascii?Q?x+nim3Qdl/ld6yoQvkXoEqmKpriCB7e8S8AeJ465izKDUAhKEN5CFgzQXMdk?=
 =?us-ascii?Q?BU69Ln87hN7tI9jhLewwbwKvHq7EZjdRcoTMn2cejA7sg7jjAmVXVxMUdmIL?=
 =?us-ascii?Q?t/LGFOeQ8fRIoOQBCpTURSbNzV5UWs8qzhN6OQ/9/oY85UnUIMmIiEpww52X?=
 =?us-ascii?Q?vR8X8JuyHkd0jNSctlYvq/jNNsYaa0jO/Rk35CmQpfF4HsVvXhtuAqHXR/te?=
 =?us-ascii?Q?yCJ0tQKMYZYpnhzr13B0+rTljUuu2Tm09IktV0byGJvIvb7I+ESW0GZY6pTL?=
 =?us-ascii?Q?k8fmpimbgA/QMDKHuLXSpUYYDAE6XfwZEG5SRAkdCYCAe3pMvqHH9EuyPb3H?=
 =?us-ascii?Q?ppzRl/MsxX0nSaLydq1EKmGCjbAQKqGZTzhgWSeQ1YzpyN5AOnwl60DeYVwe?=
 =?us-ascii?Q?PMtt3paY9X5LBsWc/xpN3Tc17dQgcBQgh3Bcmo2K9uV1KrqZFFEMAvSuf3ZA?=
 =?us-ascii?Q?U7QtOc6l0wgkuR5sJfoA4ZC20rLQp31smQ3L0MBaEdQj/Qg4ziAnB1odnsue?=
 =?us-ascii?Q?EqE+VzsH+nOpFRVtN7jBgN0AwiWkDAkFGpNW/WOJcH/sLiSpUTAgk60YYVSf?=
 =?us-ascii?Q?DPRXxZmr2XFCJgCXXuw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e144e141-14ca-4716-c5e5-08dac1239373
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtOjjVHNipMhBaPQ5GGV/CZpcrkt8x97rAk/RiLhbNrBNbCG0R+OxbdtTY2QJCsF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The miscdev is in container.c, so should these related MODULE_ALIAS
statements. This is necessary for the next patch to be able to fully
disable /dev/vfio/vfio.

Fixes: cdc71fe4ecbf ("vfio: Move container code into drivers/vfio/container.c")
Reported-by: "Liu, Yi L" <yi.l.liu@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c | 3 +++
 drivers/vfio/vfio_main.c | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index 7f3961fd4b5aac..6b362d97d68220 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -608,3 +608,6 @@ void vfio_container_cleanup(void)
 	misc_deregister(&vfio_dev);
 	mutex_destroy(&vfio.iommu_drivers_lock);
 }
+
+MODULE_ALIAS_MISCDEV(VFIO_MINOR);
+MODULE_ALIAS("devname:vfio/vfio");
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index cf49c5200a4c05..ee09ccf4a608e1 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -2064,6 +2064,4 @@ MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_ALIAS_MISCDEV(VFIO_MINOR);
-MODULE_ALIAS("devname:vfio/vfio");
 MODULE_SOFTDEP("post: vfio_iommu_type1 vfio_iommu_spapr_tce");
-- 
2.38.1

