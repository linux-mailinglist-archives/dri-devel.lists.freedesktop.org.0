Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267F4FE551
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C4710E6F1;
	Tue, 12 Apr 2022 15:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E40110E37F;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbIOCtf3pyQiN/qRL7Pc1BWtc1RbVDIs0hfVBiTExHcK9G4f/YjAK/Jkt7L/2MGdK7B1FsWempiEbFoeoBnW6GIOZjD/JMHb11ojzw0Nr0CBX6gn50Le532L4gunLFMjdC04iGH1NiNnFbWnC4r4Bbsbvqonl1xLNiHUyK1DZg2NSlktLQGOjq8d5NRqR5+iN+Rn5/0+tZmlq7vMIeWlyeoHAcRos/lDzaB2WClLlF+U/FfaTMEzK7e8aCid3TW+K4nPZ27Y8ZT8/4O0HT3O33BfhyRnQdbK1Zc6NDiL93DohIqMn1EMslA9qnBbvHWUrF1KfIoibuFkeV65w6+Nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipBz6zUEzjNlBfn0keRHBKDv3oVAdL4US7ij5der/Fs=;
 b=Cq5hvQMKJBk9hTeb9QvumXRR1jzqVO3uXhUr4A6pwoXJIg3yysoNOPhWRSrzJnUBwwhJugOfPcxSFWJ8X1yK6GKDjJ3qLkp4tL/Q4FSmVbir9hiBi8raNDgPjQwWMjBamE2SyZNLMHy2dRGCLD2kGgsJyvuApPC8kp/S6WvuMGtHvAk+gFFSQ1mwuvm15NRpL2CQQZzDChkAZAfK72K1uUaE5Ud0+otXbUeqQkR8eIIO5QhRQd+kIsO7Zx1hGVe3K+l6SXIMqgOhQ+hJGh9AEziqG/w8FFSP4lUmDu/ug3sgfz/3duKrmIuo2DIj99/85QkyxZ68HrXa/YrqQAaSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipBz6zUEzjNlBfn0keRHBKDv3oVAdL4US7ij5der/Fs=;
 b=nXpouJ5dJisZdHWVn3g8Ih2bT0DOm9BN15MJ2NZ4wE13hV0SWmcBFatzl9JbfHl2GQvihLLwywNzFEfIFT2MDVpSrKleAfX8fgGaM7Dmd8vYQv5Hm25AnTNL7csLe4rah2fA5mo1W5lj6E214EgHQOqcDMnoygU/M+KZoRVDS9tUj+weXAaW+GPxinOI9NiQvsLoV8XAjIRZ/NDYrmZEkzUD3tntpuvprbvp1BRb8Q/V3d1VarD/CJEZrW1teqd6QD7vUTPr337FtGeRkY60l0UBmVfCXP2Hze4CRX4Wr53ZlD7nR4FqlHJoY1/ard4gpr4DMoxubiPQL7dMAc8Qow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:38 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:37 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 5/9] vfio: Pass in a struct vfio_device * to vfio_dma_rw()
Date: Tue, 12 Apr 2022 12:53:32 -0300
Message-Id: <5-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::8) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c50d941-b512-4790-917f-08da1c9c9b6d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4045:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB40458793C494A404AEA0450EC2ED9@MN2PR12MB4045.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/2eaJ+Y58hXP9ec6JHG6xGLZ7jdiAjbAyp2b6RsQfOQCizWkmMt8ONxRE4zs8uDyO6TNVzD95T4UHQSdssX7faXVzbL1qQkZLJ4z52eLg2U70zarWkd5SDHpsK1vYD61IPKpQuRXINfpkYKFsod0aiqTyqIMY+6E+o4LWow9BI/3nf2TsbXS4wdoKme4tpNQca2TUJchhWqax56xEUffoCaTTQA789CJUHt9xFrqfOGWjWvkAK87I167J5TqjSE2KWJ8SDtL18ppy1fVaW1GVhkqdxTiEV35HoZZh6VCUWxpotuVM0Y5N30EKbiRa1JaxsmwuLHvdwSZDX1MgSuoiKqF5OSnk+VlxWo0nsF8FiRW31y+p7BdfDiLKvdEQUKTtV1vWP2KpbeFa1FotJXB0Ei9aUuaOy6MktSm8+TvBZfZaExk58AFFb/Coz2EjrKXFW+7h820PjP50lcULA+3TxBc4bz9++ERUIs8dTMcYjCNbpruvi5/DtIgsRxL7KoOWinTD0mhyjPYEjJKu6pDyfl4y+TYs2LtuIfkEooTh1cgB05sKIfFp86b34D2hzhmIvQY88Q/T7vyINVBx/NjNYi1aH1VUGR2eEisgNApbLptZCdysI2Iw+1R+CmaxFnqmpSbOG4muGG7XVl2cBrGRf68j7h/e2oohYxnz/yXz75lHR/m3BbFck7fPpcpicCx8MPJrpo4sMfbtz4iOfMBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(4326008)(8676002)(66946007)(7416002)(2906002)(5660300002)(38100700002)(7406005)(921005)(83380400001)(316002)(2616005)(508600001)(186003)(8936002)(26005)(6512007)(86362001)(6666004)(6506007)(66476007)(6486002)(54906003)(110136005)(66556008)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1tZ4TL1/AEwusqC9PDUcR2zgaAr68+UprHnq9kNcUko72YKFymWTRQMgvjUT?=
 =?us-ascii?Q?StV9dPfSXeM+M+XB8I3vFY0Np6jzLRd5lzV8W+suv2mpaeN+HAfkqNvTebM7?=
 =?us-ascii?Q?zLdjHaCfG5WhjDF20gS/s39P68Y0PNWh/8DhvYCOgeEw/T67Nb7KLLNqO+iD?=
 =?us-ascii?Q?AnyMmjbEZVrxGbGXXdBSbDspVZfsShHE1noDJGEiDD1eS7WQJbYgZ7+tQWHN?=
 =?us-ascii?Q?rpviYcLQAHJgKKLsiONmvyzd+kYmIgy1qBoe8p42Ggm2HkSvb4sDUNqwSo2p?=
 =?us-ascii?Q?InH8HBUUcaYZn7rfDhrUTH52t4lYGR6Fe6joXdcBvF+Kr+Vot95TB4UQb0r3?=
 =?us-ascii?Q?wsX/qIBe2b5+Q1ETSmJiWBkDeH4UdjBlYBeBhnzZDoOL4bVyttHwmGSm8sUS?=
 =?us-ascii?Q?Psr98sZ3/kSJ7B39CoJC3oBYaCoxidmd3JQhwmQTkZkDPNndSH7uWQO+XCf4?=
 =?us-ascii?Q?ARqJkie3qdG3vrnKFMPO54QLfm5tFq7dblA6ilVxyiDQhhD93AlMs5nzDWFq?=
 =?us-ascii?Q?DHDiW1H9mefloJcKndufo7uaFjqqDa9CiXHvyAXw6IMhAM0FPX80n01bpY2P?=
 =?us-ascii?Q?0M+6IL2UiFo4rM2v6KagqgMahPIeO8u8nUY8LYj2XH3wnbZ1nHFaP3+FFbYj?=
 =?us-ascii?Q?VdJN6mU/D40Ivc+LG9gOucrFEIlB29Uv3+z5ykJVhJ94wPIposIsUrLKLDHV?=
 =?us-ascii?Q?tNxeSIROv6Jo556TPJpcx3w3uM/tthAQJUstXsoFeJP5zNb+5upwhIoR4uDl?=
 =?us-ascii?Q?hMLIsPk5nJoW+KmNPuGe8anhS5jqNRP2vjcXgsZXJ/rvjjBhZrfz9RB193rv?=
 =?us-ascii?Q?jTNeFS8EepPkg1VgSVh1iKVoW5szNvVJQb34iXVBhjs7GB2OlkbCWzVToUCp?=
 =?us-ascii?Q?Z9FfHnz+TgAz5rUp7kYTTuD66/jAzI1c80zmgelTGBWNi4SG+MxrKh2tXwTc?=
 =?us-ascii?Q?R/Dr3p/YWHxNYEQ21R7lWiX6qlVYctylvNe8W4uJoRhJdHme0gtuzyMsGsT1?=
 =?us-ascii?Q?k7StOdbtgULJcwMdYf1XE+xdTYlKfiZGFwK9yQWXhf3LU1Y+bcet9oVNT5TN?=
 =?us-ascii?Q?uKcIeiSNgVwF+eB8lYH1XyjWW63HaGIoPObxloxGwBmEToPCsceUPMm2c/in?=
 =?us-ascii?Q?/2EDTOZmbtDKVuAhcToUHkd+m6FPGR4YwOnujMTdchAfird6EOCN50Gw7bQb?=
 =?us-ascii?Q?eK+b3nZDO4UoWZYZoVHF156t0LGR2qUb5x++oURV3HpDBvhPKqOcVTgpy0G1?=
 =?us-ascii?Q?r9y5vuiPnGEU4s0qY6lnAW+SAYo57LrjS8nQwUn1Pm0VIf+n8rD+ZK6x2nXP?=
 =?us-ascii?Q?bf3EYC4+s7RPV/OUaLcX8I6h3TQWg3tOFKxynaEwVw24nKYSdc33cJKrx4tx?=
 =?us-ascii?Q?EfGPrfGo249bL9tLtvvWLE38UeYvw6J6K+8bui3Zdvs8wuBMO/AvQd/uj0zh?=
 =?us-ascii?Q?pfCfpWhghkdlhpBoY3eH7l9+yPwga0yGex7MbEzlmgE64jdyKW93ADbFg1un?=
 =?us-ascii?Q?F7Pam07Y+z+hi6gK13S9tKrcZKesHJc1gP0VMumjSzd8qNGa2v/5GObqkTdg?=
 =?us-ascii?Q?IXWt66HjkNWLvyHB5F+uKqv16h4bmotS3IoGmCF4tIO18SEQt95ncueN4VoW?=
 =?us-ascii?Q?ChyPYwsPpxeQSAPs0LZnppidMhPCz0H+ZWxmhqTRdB8x+/pYM9qFMzRgWU2x?=
 =?us-ascii?Q?pMy92i7rtB19nk4jLZRX1Ib9m4Is7dYuv1mNXQuMzzqweoRSkRBISWhWFlr8?=
 =?us-ascii?Q?Ol1BjuoR/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50d941-b512-4790-917f-08da1c9c9b6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:37.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2+AFwymYMaDbcHTsvWxuCnq5dPH3Hv9zNFKKQiIS3aGqzdgcRFdQcbDqCoaBEGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. The struct vfio_device already
contains the group we need so this avoids complexity, extra refcountings,
and a confusing lifecycle model.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c |  5 +++--
 drivers/vfio/vfio.c              | 22 ++++++++++------------
 include/linux/vfio.h             |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index df7d87409e3a9c..3302d5d4d92146 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -2184,8 +2184,9 @@ static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
 
 	info = (struct kvmgt_guest_info *)handle;
 
-	return vfio_dma_rw(kvmgt_vdev(info->vgpu)->vfio_group,
-			   gpa, buf, len, write);
+	return vfio_dma_rw(
+		mdev_legacy_get_vfio_device(kvmgt_vdev(info->vgpu)->mdev),
+		gpa, buf, len, write);
 }
 
 static int kvmgt_read_gpa(unsigned long handle, unsigned long gpa,
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 24b92a45cfc8f1..e6e102e017623b 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2323,32 +2323,28 @@ EXPORT_SYMBOL(vfio_group_unpin_pages);
  * As the read/write of user space memory is conducted via the CPUs and is
  * not a real device DMA, it is not necessary to pin the user space memory.
  *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: VFIO group
+ * @vdev [in]		: VFIO device
  * @user_iova [in]	: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 		void *data, size_t len, bool write)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!group || !data || len <= 0)
+	if (!data || len <= 0)
 		return -EINVAL;
 
-	container = group->container;
+	ret = vfio_group_add_container_user(vdev->group);
+	if (ret)
+		return ret;
+
+	container = vdev->group->container;
 	driver = container->iommu_driver;
 
 	if (likely(driver && driver->ops->dma_rw))
@@ -2357,6 +2353,8 @@ int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
 	else
 		ret = -ENOTTY;
 
+	vfio_group_try_dissolve_container(vdev->group);
+
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 8f2a09801a660b..91d46e532ca104 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -161,7 +161,7 @@ extern int vfio_group_pin_pages(struct vfio_group *group,
 extern int vfio_group_unpin_pages(struct vfio_group *group,
 				  unsigned long *user_iova_pfn, int npage);
 
-extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
 extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-- 
2.35.1

