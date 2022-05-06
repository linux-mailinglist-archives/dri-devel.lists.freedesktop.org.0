Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1251CD7D
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC4C10FE48;
	Fri,  6 May 2022 00:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2201F10FE09;
 Fri,  6 May 2022 00:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsb5poXawrXlOPYibLl5vJvawZWMpifqXTCoTkUW9FiUEmRv4UjFU0q0FblAJkBb2heyufS943e6jT3DAbzhQAPkUmgDb3C4qn0sj1AYAVxlvx+EbM63rpQQdptL59X1upIwG3tSgjCt5pqQWnsaALGawRZ78bR+sGaxbiR/R/w0IN0Qb01La074BrJQLmFCmMTfcss0W3P4M7iXv9j/TIP548Fl3Mj8mNhNv40OTp3kbXzBQbVmQY/SwhTzUJbLf1JaRLWYWTIAWnckuv0zFHkGAAuH81zZnsvSRA6WOrOPFW6PbPRgTuwVC4k0VPI2fJZQLnAnh7LibemKlRKYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMPVTVXzR088Hrf3D1a0rC9YtKaLbMYSxuJPfXntvlo=;
 b=eqwlGKXPlw2FaYgDVWs5TGNot/hfhNoV00YdJMDcQcU8CSxtKMab+mwX2r5MZemHJrbAhrXssGliu1gPqcTNwZvRbmKYnmP78nMB96lr2l3eJaC6fB0moO54yVPitGG7KSca+kIob0Fzqfk0OEchBNQbGkqn6Y1j0FlY6ya1kX8dnTJmqcN2gq3cFetg9xZYyjKjGOjliAJn5cTzAjyT0XDTfzRkJZZsCr+wust7Espbim8LzJJdK5h7b9TgslHbpL4ED0oNOCCziaoYbx4d9NoLc9f6dMqbS5pSEgkitJHCaoq0/0pik8igBmBkl7KoNm6Jdc/9WnJ+TwLmTvnMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMPVTVXzR088Hrf3D1a0rC9YtKaLbMYSxuJPfXntvlo=;
 b=NxgrLzwkDm5XkQ0p8KjI0yhXXhtqW91X93K5QAqNcmHOYksD+GRe2vO065wq34hnqxh0twzObjAMux8J7NMyId45Qbo7Kxl76RBfQpRwzoarxliS2HUsgKV7+BjZHp8/0hcQNMKVflJtVEsUhsbknaolhM3TO39n5ci9tcb3HixXpg1v9Tk8ZFVzv+thE/Kh2Ctq7WWJzWGbrffqiITBCiHpoQAZEYIWtuxS+1DVNp9tf2taw0hhVMyGPW/wBzWWRT7mGF/IQeccxBNgiECEPYp+2NfoS1KIELHKsLBNKSQNEw9JGPOCxJp7niumHyYB5S6maxM9DGhR02VuFIzRdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:48 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:48 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
Subject: [PATCH v4 1/7] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Date: Thu,  5 May 2022 21:08:39 -0300
Message-Id: <1-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:208:91::39) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b28a964d-5178-496e-9491-08da2ef496f2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29349E2B94C42175B8B0BB7CC2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aRt0nHF2e8NgMtoKuWIkxI2KMfS9QXpV75ofJzPxVd+OoQp3tWxb9f7ANvn2sR9DE94cFS5YcXTllcc/y3V3eLh2M6kjXunSmkmcFsnfGVRNnOMsL4ji0HFmDMc0xgXI+vjfaSWhfORIlGma6cSucwAMvpmgv5HgMulyQe1zsnqUBU5AJn8/Yk3pwIi8LHZwX7nUefDx+gGURbLM1hTrN6tGbL3f111vSOnRnw8yN3Xqmg1ebFrsopjUL9CIIm75W01ahnqb/8U1GK7CNuoPejDKCVar3ZNx6f9Miyn++71dAo3H/n3O/QQRIuZN3wl/UNaguvkdgB5i36ahGwrMph8Cjjt+Cz2x6qPHZI2hCJPGJrLHTxzsdZ+uBG7e2504SdG3l68dTt4CeIkaq3od15+ozjb4KNgtxe08INnMMxxbAa3Kg+WlliU+JFypDm+9z1xVVGRMXq4aV7Kc8ZPqBK96gCj1yvWNngmZqpmYQHU6aUO/524pDH82lE5K6vFz5Y773wG4Cp+IaiSqnQlKsCn5cio5hpjfGgiXMrabf7ax+qEnb+2ZH+kscpWOm51aQkBYjz+a7dNvjWA+LbBpZ5gXJXHtwrxyu0zV1qQGbUXBu0hOkSOu1qn3fWx7nkXxS7bFfHUAgHAz63Ur/0sWPMBOJV3efwixpQ2ncEbmZ+Qk/xgSXMsEZgVRWDTWxzo8+OHKBR6S5HhY1672Yn6fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFY2fURJhqqQRNrNC3amN8aOh9iD5v0SKLb1fMAHwwZqeDjQwheyJ8oTC/H9?=
 =?us-ascii?Q?hVe4q2C71iQo60oXWdmcA40xoiE/8yG1N2EwgB8eTV+QlZcxIQvnMNDsS8WB?=
 =?us-ascii?Q?Df+99wEmXyDEQaIkRjwJYjK5HWP/N3TfmDYv1043P/W/0/n3b2otzOfFG0SG?=
 =?us-ascii?Q?EKJV+auVQOiXf72HO230HByBQZpvw6+FYVuhGBAUyt+yue08fCdqI2WIic3B?=
 =?us-ascii?Q?FWGxRMGJXbvhlBJHNsnlmSpvpsrgNk5pSYnrDUsR8E9xeQe+uxJOGH5f/8gL?=
 =?us-ascii?Q?QZAzz34OVrr5+Gx6PIVcIjuBDkQVyWpia9i/8oh0Q3yL8ES9nVdbbuXg9PSb?=
 =?us-ascii?Q?lc7KznDIWiix9+uzc6gOoSZfI9D7Gco1Mwbm1D1fhlhO730v493yOH6pWYVr?=
 =?us-ascii?Q?gmQWm8+RNWHKthww9qxTMhfouYANmX4hEOFwUeaybZEYgSXwRh3RCkuGkbrJ?=
 =?us-ascii?Q?fICUgPTpFpF8jYq9fwmYXZ3waVbQOootAXcuVkanipj3Hr9wineLPd4zZSRI?=
 =?us-ascii?Q?GmJXNwNn1xWYZZsP44OBq+VvZahTH2gHlZbtQOx2S9dn10BE/Gat7ftA/gIP?=
 =?us-ascii?Q?LR66VBBaRf/q3hy+35SmnIWOwaAWdajeBoz8zbJ6Ld5n96XAyLD9Cel7ht4j?=
 =?us-ascii?Q?z9kFfqHw+d/136Hi84rqI88Zck/CwawJTVEhZayavzeTyCD0vSMRyqC+Bt+d?=
 =?us-ascii?Q?iRCOPK9eO9tyV902LCjiUizEX6+aGOyVMjXI4Szj3UXLBWDhYfEvjsUMOSsS?=
 =?us-ascii?Q?v2AxEo9gKGORTwXn34PSCG2/5dBy/fcvtLbikfq89jOFHaMWqszCnoBgOkOm?=
 =?us-ascii?Q?Lfx7bcfk2z8r04SBJfd+On+CzBBRUd1Ps9E3jL4H9skR5fx9ZQFYhW+AEWht?=
 =?us-ascii?Q?TRZRNtAP5pNm6trs5y18Eqvwb32lDBRmZcdeuUhFR1NUI+aqWZWWW+PqIEll?=
 =?us-ascii?Q?TOxTUArBYasaEqHxmu3To3wEN+SN4NTy8Q9E8ONjvz/RnfS2i4fTC8pMohGx?=
 =?us-ascii?Q?sXnhLPsjamuP/Hq2Jd2oG2ZhWykUFXLP+mCk9OiCCrgASKn+3Mt6Lps6cIf+?=
 =?us-ascii?Q?+7d3VhjrqKZP41ZrkyaVBgZsNa9qvvG10qv1q3LjbdDo94NX9YSylLms7hUq?=
 =?us-ascii?Q?ovwL/7Ypxzy5kaiXAqqIUD8Y+BdgL+hOR59gJJ8srb8Vmxp0egOx+Tg4BdvK?=
 =?us-ascii?Q?KeZIF5Zfd1hiYevyAjIvuuLw7Leu/cAgS/V5tHXKVSlivYuh0+n7seoLEZvw?=
 =?us-ascii?Q?G25w9Ic7yOaj2u+Y6sV98UCxODuvRGgCDVuKuGcnWmH/iWVZe030cQ3B7Ulc?=
 =?us-ascii?Q?V/r1gXyXQsbiIee1JrY3IxuVrB8RjE6JhUjHp8esrZkkmdgYTh2xNmIdzodE?=
 =?us-ascii?Q?mDcH6JGOI6peSne3E9Lb76fadLoxZO8XD2iNOSQeh8ehvE3cr7pD3OsCHGxS?=
 =?us-ascii?Q?OoyJx5dYzOBAt6aKLwAk4S/DHCkwvKbtb4GH/S9sb+s+YZ+oxG/2bpVcBw/D?=
 =?us-ascii?Q?8HngWwFHLyB6YonSQvJaxTZu23pUpEBEJP5ggcM3vX1hEZEKmUYn75/sOha7?=
 =?us-ascii?Q?/cEvDtD+qdOMcwt2lhdDZWc68LBgTa0lcSuzgUubi/iJZIvg82gKgknm33uN?=
 =?us-ascii?Q?oeBD6QR5Z77sbbaHx1vFtPyWaLVgzgPM6e4vYpmsL6/euSWO8qlSjOI1Zh/s?=
 =?us-ascii?Q?/MnB2TFDevIUOmkkqy7cCc3B1VR6Ye4EnnXYUGVivcwJD62L7EyjEpw7ii8l?=
 =?us-ascii?Q?yGR9El9I6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28a964d-5178-496e-9491-08da2ef496f2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:46.9186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snug5YQW140BLekvpue18kfz14cL8tdi7uvZPDFkQdOvolh56J7h6HRmhL0LUXN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All callers have a struct vfio_device trivially available, pass it in
directly and avoid calling the expensive vfio_group_get_from_dev().

Acked-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  | 24 ++++++++++++------------
 drivers/s390/cio/vfio_ccw_ops.c   |  7 +++----
 drivers/s390/crypto/vfio_ap_ops.c | 14 +++++++-------
 drivers/vfio/vfio.c               | 28 +++++++++-------------------
 include/linux/vfio.h              |  4 ++--
 5 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 0787ba5c301f5e..1cec4f1fdfaced 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -810,8 +810,8 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY, &events,
-				&vgpu->iommu_notifier);
+	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
+				     &vgpu->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
 			ret);
@@ -819,8 +819,8 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	}
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
-	ret = vfio_register_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY, &events,
-				&vgpu->group_notifier);
+	ret = vfio_register_notifier(vfio_dev, VFIO_GROUP_NOTIFY, &events,
+				     &vgpu->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
 			ret);
@@ -873,12 +873,12 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	vgpu->vfio_group = NULL;
 
 undo_register:
-	vfio_unregister_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
-					&vgpu->group_notifier);
+	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
+				 &vgpu->group_notifier);
 
 undo_iommu:
-	vfio_unregister_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
-					&vgpu->iommu_notifier);
+	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
+				 &vgpu->iommu_notifier);
 out:
 	return ret;
 }
@@ -907,13 +907,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_IOMMU_NOTIFY,
-					&vgpu->iommu_notifier);
+	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
+				       &vgpu->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_GROUP_NOTIFY,
-					&vgpu->group_notifier);
+	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_GROUP_NOTIFY,
+				       &vgpu->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index c4d60cdbf247bf..b49e2e9db2dc6f 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -183,7 +183,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 	private->nb.notifier_call = vfio_ccw_mdev_notifier;
 
-	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
+	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
 				     &events, &private->nb);
 	if (ret)
 		return ret;
@@ -204,8 +204,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 out_unregister:
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
-				 &private->nb);
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 	return ret;
 }
 
@@ -223,7 +222,7 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 
 	cp_free(&private->cp);
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private->nb);
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
 
 static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index ee0a3bf8f476ca..bfa7ee6ef532d9 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1406,21 +1406,21 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
 	matrix_mdev->group_notifier.notifier_call = vfio_ap_mdev_group_notifier;
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
 
-	ret = vfio_register_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
-				     &events, &matrix_mdev->group_notifier);
+	ret = vfio_register_notifier(vdev, VFIO_GROUP_NOTIFY, &events,
+				     &matrix_mdev->group_notifier);
 	if (ret)
 		return ret;
 
 	matrix_mdev->iommu_notifier.notifier_call = vfio_ap_mdev_iommu_notifier;
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
-				     &events, &matrix_mdev->iommu_notifier);
+	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
+				     &matrix_mdev->iommu_notifier);
 	if (ret)
 		goto out_unregister_group;
 	return 0;
 
 out_unregister_group:
-	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
 				 &matrix_mdev->group_notifier);
 	return ret;
 }
@@ -1430,9 +1430,9 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
 				 &matrix_mdev->iommu_notifier);
-	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
 				 &matrix_mdev->group_notifier);
 	vfio_ap_mdev_unset_kvm(matrix_mdev);
 }
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 0c766384cee0f8..d70890ab9cea92 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2269,19 +2269,16 @@ static int vfio_unregister_group_notifier(struct vfio_group *group,
 	return ret;
 }
 
-int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
-			   unsigned long *events, struct notifier_block *nb)
+int vfio_register_notifier(struct vfio_device *device,
+			   enum vfio_notify_type type, unsigned long *events,
+			   struct notifier_block *nb)
 {
-	struct vfio_group *group;
+	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!dev || !nb || !events || (*events == 0))
+	if (!nb || !events || (*events == 0))
 		return -EINVAL;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_register_iommu_notifier(group, events, nb);
@@ -2292,25 +2289,20 @@ int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
 	default:
 		ret = -EINVAL;
 	}
-
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_register_notifier);
 
-int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
+int vfio_unregister_notifier(struct vfio_device *device,
+			     enum vfio_notify_type type,
 			     struct notifier_block *nb)
 {
-	struct vfio_group *group;
+	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!dev || !nb)
+	if (!nb)
 		return -EINVAL;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_unregister_iommu_notifier(group, nb);
@@ -2321,8 +2313,6 @@ int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
 	default:
 		ret = -EINVAL;
 	}
-
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unregister_notifier);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 66dda06ec42d1b..a00fd722f044b0 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -178,11 +178,11 @@ enum vfio_notify_type {
 /* events for VFIO_GROUP_NOTIFY */
 #define VFIO_GROUP_NOTIFY_SET_KVM	BIT(0)
 
-extern int vfio_register_notifier(struct device *dev,
+extern int vfio_register_notifier(struct vfio_device *device,
 				  enum vfio_notify_type type,
 				  unsigned long *required_events,
 				  struct notifier_block *nb);
-extern int vfio_unregister_notifier(struct device *dev,
+extern int vfio_unregister_notifier(struct vfio_device *device,
 				    enum vfio_notify_type type,
 				    struct notifier_block *nb);
 
-- 
2.36.0

