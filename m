Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739AF53F300
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 02:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C908112995;
	Tue,  7 Jun 2022 00:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1ED10F732;
 Tue,  7 Jun 2022 00:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OevnFWTW02QcuOHWnZscN2e/XqaHSlO7L0yzYiU6lD2ijyv4LZb+K5KzCGIXDrEfEc4kyPB00NnjMefxB93+t3VzqMVWOvTixSF2Cx7HRRysZER+r41oOp526BZ3wa/PPDq3Qnr3JcwWDAgz6X3RjlvAJOVWumoyI8JYVhFkXyvkt9jImB0nM2xJpVv76RIQJpXHg3LxNxlhLyTwk3YxcA3Wa2qg51J3m9EBoBmwo2mUVnxi7hvHocbjbAESa5w/Z6GVUqW4OpOgK7OWnBIeTp+HeH4EoC1XuFvery4TiHYdLesvX3kpQKKRbmteVjAkQYcCZB5dgXBw/vzaJCy57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r4xM82hdLW9M2ATdSnmvYTdGCtAu13ASBqBNav46GE=;
 b=LPfa1u1JoP+JjQqw7PQGl6fXS8IRv1G/sTqU7paWXThRg4YFpq//OyvUe31vPnD43N7hAKqg8cjAaISpbMgOBC4rCfD9sf0ZUw5HrpfyPvDRG9LCWD9smq1XfGHEbTXxrFZNCnophdAeN0hr9Mi37GkizKaLsmkSKIxoAQLev36c/8/kT3zRRT9M3yLpd3yeJKv8oNYFKP/ryvciclOZCIvnLwM77Q/4nfZ/KwdfrixDGKUwk6xeMsbu7IC0YttuCJbSVmO3+7FruRw4WIEq4nN738FBahjXZ0uoZPogFD5De77xpLmHqGpkad4u0yj7MJCa2NNRhnAyreGmEiK91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r4xM82hdLW9M2ATdSnmvYTdGCtAu13ASBqBNav46GE=;
 b=W48VrIa0x2p71toVgSkF7NBAHGwIF8zzWAvEa5SebMmoWx+lTtflGcEkLCtzXIwjfSYRHrMcqTe+hVwDro1yP1JVzU5bCqPs+MAoFVAejRjsq7xeJDgNQ2kH96sf1QKHJoNFnvCOtojqI5u1e0rOwQQKAyie4TuM4PzO8RA685Ji69jy3qL+f/n5V6h5s92CciaypKBN+rKh9aPYEElUZSajLD9N8P9MItGKn3/Llf+UbILwLIOP7sAbumA1L7+SqDdAhHO6CZt+1IR294PAfGS+O+hfDnUaqs9xifb1WL9NIW04JQRJYKm6ewcqFQRUmZQxhLmSK3RfQuUWN5x/1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3758.namprd12.prod.outlook.com (2603:10b6:208:169::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 00:34:39 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 00:34:39 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 1/2] vfio: Replace the DMA unmapping notifier with a callback
Date: Mon,  6 Jun 2022 21:34:35 -0300
Message-Id: <1-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0354.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7689a46e-976f-4972-0149-08da481d80ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3758:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3758AA8345B4784AD932394FC2A59@MN2PR12MB3758.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKwj/kg5okkl8RsGyn0rbAUncpFtzSH/k9cRAVkCHqmN7tFBzvj/kHcWx7hB0bJBRGKwCP6LmF+1Ug6obfK+y2/eYOnpmGgdzqRP13WT5vBPzzB/q860OB6/Da8lvck5yc6A78A47Kbd08SMkj+ji+XAk7OnhfYB2w86dqJKID/wOAFYruaEOOLV8l8CIS+frh+LBy63UHpRjvrvmGWAdkH875oK9eTyOq4ZmK3Zfr3HxN3Mmr3HFaIAlva4dzQO9HcJoNG2HlVI+6D+jv7FLY4XHZHFzrOR8ETkzPo16lCknpcLlLjE8sDkcYlBwjrddaAKmQLmx7IlMyQRSExpkddXbtuM4z6n3SgRCr14s+Z3c4oYoci2B7nrV4w5xaUvTKA5+WX7/2B0hOQ+ZOzrAh6i7jot5whLy6NafapmbsXAOQ0KNLPiFG5VBy1QulVHQUW2RvV9HAcbKdUhmho1j3jEOF6OcVJhATIIY4YZOY/HS56aj3iwWxSqy2B5sv4qCVWxy1CWsrqfvav8Lt/cLaEGcX5myztuSOezfdT18odF4P65G5xrJhKZ8y5bTs3Hdpkemztx1POkA/F80KHu/IwHe7zW1F5v7LWYUZmMjQWaJUtRQzkBhQYYcePKNjnUDVgyAfs7llJlGQGN95fFOGUJLDqc7gKzGz38vBu+Swna8KSYKAiqGDnEshhUZRo6rnyA59BYFxdgYFmU/8cN2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66476007)(38100700002)(66946007)(86362001)(6666004)(6486002)(4326008)(8676002)(7416002)(2616005)(186003)(8936002)(36756003)(2906002)(5660300002)(66556008)(508600001)(83380400001)(6512007)(110136005)(316002)(26005)(921005)(30864003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQ84fUnVAJwWevtOfs6cdlqYGNVBYzhqGLrQbpHD04c0X6FaERpiX1BX5CXa?=
 =?us-ascii?Q?aDI7Ous3Hk8fvMhKtXdgkX7cvqnmTkf4SnHnNRMJjtaBLx8J84qGHxccU5AX?=
 =?us-ascii?Q?s09V+IxX+NV2QqBZbZBrIsyiMqEoscwU6dq/MUyu4Zu9Hkc7WxHTZCiyFEnV?=
 =?us-ascii?Q?BuGZhDssC+iu8UpPu/oRJ8o5EDzPkngBSA6oLe5rw/hNQzgJQZ5WfQF65x6S?=
 =?us-ascii?Q?GAwycl/wn22ZQh0YkgxByMZiVk9+t2A6InhnyGiC0ykBSC9Vi6W120BQS6SY?=
 =?us-ascii?Q?Gjm0QBA+uvGHGcdg0Ap4YHwQ517ia0DFwb73G/RQ5OHHikgZ6qYSLJQR/auB?=
 =?us-ascii?Q?3N5T2Y7eSMeseJPgXsclbyB15TqdXWfYTQR/M366l6CInwFibP2cqvJWLOTe?=
 =?us-ascii?Q?+xXNBQLK7Se3yWYEtzAwBmyG3AJvjJCrO+oIL6g16h4xt+HM8IbBtzS6kwmw?=
 =?us-ascii?Q?2y4f4AnVU9ucNQO6l2LgA/lAZQmipYMbtzJd14jbezK0tbRyeQx5PbiyC8j/?=
 =?us-ascii?Q?sQgVjVX3d/QrVMYwhNjJAyQW1NbMojy+bZqaft+ZXUtQtP3d8NHXimm/b84s?=
 =?us-ascii?Q?KLIMZnFPeoOSrzKDingNG4BhSOCREavHqyJXvc0Ru7fiuoDZ/LyTFlBzlNs6?=
 =?us-ascii?Q?ZC8AJWzPYoGAAKVtJQMTPgqrz3Oird49BPhG/T6pBbjejpEeY3ktzRn1F6aq?=
 =?us-ascii?Q?Y6cFQG5obHT/1z0Nm4ZM9kFVhdOZ00XMYwTYQq0ScLHsaBSVf5hsIsUmijYb?=
 =?us-ascii?Q?LRsd/hZs3bgaQt9WEtD9w9dJB6ye+oS5uxuZEcomwb/kPb9xy6A6WZorQZLE?=
 =?us-ascii?Q?cOX2Mj5svpHDTSWeJ48CzF3e4gdZGfq3wBObKDnwnDw9NZgJXOA1tsugN7jN?=
 =?us-ascii?Q?zxvZoQdjSWb6YF+yqbnhppTUNCDhGL806nS/JiWE3kJ6PrJhNtedBkpBgjri?=
 =?us-ascii?Q?rU/ZZhROkIYxdfrO+p4I8cZvZl7YWkYBNDLJTyAsnXC4+Ft6hQWyxwtwS8F4?=
 =?us-ascii?Q?wL6SrXKmbj98FBoY7og7EP9pKafM6aehaG/OYXjiuCLqoONwa1brTE3m+zJG?=
 =?us-ascii?Q?kpS/b35C9cYegj2fUFABHTj5tu9KK7C2mJRXoqfWUw9SrSwaMeNzmOcXMDs8?=
 =?us-ascii?Q?BB0hYA3ap6lgXmIqW3mRiaXVUL7mH8C1Dvzn1W9ysHQt2eh36k1E1qFkysxk?=
 =?us-ascii?Q?Ob8BsejGXDvXs4pbmbzJKoQyW39q0Uqcd1+7FncrUk5QSCTEuzbl58WoiZQO?=
 =?us-ascii?Q?3kMfNoLUfsPSbEFQOfOhyDd0NeRi8B6RRMz/SU9DzhI5mALzrraYLa7ld9z9?=
 =?us-ascii?Q?EPgTh4d4rbU6EcGCgDY05zLGtaGYn+O0vYopIZVQKD/tyzTCW31tNIjBELRA?=
 =?us-ascii?Q?GXPCVG5pLsU+PpWXRCKgwrUm8L3D6DcB9576zFFnsyNND3fDdai/W7b5j45/?=
 =?us-ascii?Q?gJkXNowtlbcteB0k6WuhpspUReJTDGi4v9kiof2SGoV6fF/wqNFj7jgEoWVd?=
 =?us-ascii?Q?E8fIH2ZTjegGwRgHRIA11YN8N1oZJDuEMcBplRdIN6DOe+rR6RFOXZCMMp+I?=
 =?us-ascii?Q?e2BzB+OK7TysA2NmS37JS9vywNGQueG4G0KcZ90oDGa1CSck0mpL7TSD7IcD?=
 =?us-ascii?Q?YrA5YCDSvz+mtg/nnD6azbOHxECf35MNBSjVNBvA3xmQRYTahn75oCZENQUX?=
 =?us-ascii?Q?1aPQHmZxKQca8XnHZjKDK+ZKlH2WUM4+YIb8XI0qdV8/Km8yOm86MvlhzaI+?=
 =?us-ascii?Q?CYfqY12HSQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7689a46e-976f-4972-0149-08da481d80ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 00:34:38.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BVduo3BygVpWUKzvSb3xi2+BR/oRuDjncWvc7a0IpP1VLlUD8Fyjl/N1+XrrnjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3758
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having drivers register the notifier with explicit code just
have them provide a dma_unmap callback op in their driver ops and rely on
the core code to wire it up.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
 drivers/s390/cio/vfio_ccw_ops.c       |  41 ++-------
 drivers/s390/cio/vfio_ccw_private.h   |   1 -
 drivers/s390/crypto/vfio_ap_ops.c     |  54 +++--------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 126 +++++++++-----------------
 drivers/vfio/vfio.h                   |   5 +
 include/linux/vfio.h                  |  21 +----
 9 files changed, 92 insertions(+), 235 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index aee1a45da74bcb..705689e6401197 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -226,7 +226,6 @@ struct intel_vgpu {
 	unsigned long nr_cache_entries;
 	struct mutex cache_lock;
 
-	struct notifier_block iommu_notifier;
 	atomic_t released;
 
 	struct kvm_page_track_notifier_node track_node;
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e2f6c56ab3420c..4000659ad715d4 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -729,34 +729,27 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
 	return ret;
 }
 
-static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
-				     unsigned long action, void *data)
+static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
+				 u64 length)
 {
-	struct intel_vgpu *vgpu =
-		container_of(nb, struct intel_vgpu, iommu_notifier);
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
+	struct gvt_dma *entry;
+	u64 iov_pfn, end_iov_pfn;
 
-	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
-		struct vfio_iommu_type1_dma_unmap *unmap = data;
-		struct gvt_dma *entry;
-		unsigned long iov_pfn, end_iov_pfn;
+	iov_pfn = iova >> PAGE_SHIFT;
+	end_iov_pfn = iov_pfn + length / PAGE_SIZE;
 
-		iov_pfn = unmap->iova >> PAGE_SHIFT;
-		end_iov_pfn = iov_pfn + unmap->size / PAGE_SIZE;
+	mutex_lock(&vgpu->cache_lock);
+	for (; iov_pfn < end_iov_pfn; iov_pfn++) {
+		entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
+		if (!entry)
+			continue;
 
-		mutex_lock(&vgpu->cache_lock);
-		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
-			entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
-			if (!entry)
-				continue;
-
-			gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
-					   entry->size);
-			__gvt_cache_remove_entry(vgpu, entry);
-		}
-		mutex_unlock(&vgpu->cache_lock);
+		gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
+				   entry->size);
+		__gvt_cache_remove_entry(vgpu, entry);
 	}
-
-	return NOTIFY_OK;
+	mutex_unlock(&vgpu->cache_lock);
 }
 
 static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
@@ -783,36 +776,20 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
 static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
-	unsigned long events;
-	int ret;
-
-	vgpu->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 
-	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
-				     &vgpu->iommu_notifier);
-	if (ret != 0) {
-		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
-			ret);
-		goto out;
-	}
-
-	ret = -EEXIST;
 	if (vgpu->attached)
-		goto undo_iommu;
+		return -EEXIST;
 
-	ret = -ESRCH;
 	if (!vgpu->vfio_device.kvm ||
 	    vgpu->vfio_device.kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
-		goto undo_iommu;
+		return -ESRCH;
 	}
 
 	kvm_get_kvm(vgpu->vfio_device.kvm);
 
-	ret = -EEXIST;
 	if (__kvmgt_vgpu_exist(vgpu))
-		goto undo_iommu;
+		return -EEXIST;
 
 	vgpu->attached = true;
 
@@ -831,12 +808,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
 	atomic_set(&vgpu->released, 0);
 	return 0;
-
-undo_iommu:
-	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
-				 &vgpu->iommu_notifier);
-out:
-	return ret;
 }
 
 static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
@@ -853,8 +824,6 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
-	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-	int ret;
 
 	if (!vgpu->attached)
 		return;
@@ -864,11 +833,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
-				       &vgpu->iommu_notifier);
-	drm_WARN(&i915->drm, ret,
-		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
-
 	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
@@ -1610,6 +1574,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 	.write		= intel_vgpu_write,
 	.mmap		= intel_vgpu_mmap,
 	.ioctl		= intel_vgpu_ioctl,
+	.dma_unmap	= intel_vgpu_dma_unmap,
 };
 
 static int intel_vgpu_probe(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index b49e2e9db2dc6f..d7e3c3ea98518f 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 	return ret;
 }
 
-static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
-				  unsigned long action,
-				  void *data)
+static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
 {
 	struct vfio_ccw_private *private =
-		container_of(nb, struct vfio_ccw_private, nb);
-
-	/*
-	 * Vendor drivers MUST unpin pages in response to an
-	 * invalidation.
-	 */
-	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
-		struct vfio_iommu_type1_dma_unmap *unmap = data;
-
-		if (!cp_iova_pinned(&private->cp, unmap->iova))
-			return NOTIFY_OK;
+		container_of(vdev, struct vfio_ccw_private, vdev);
 
-		if (vfio_ccw_mdev_reset(private))
-			return NOTIFY_BAD;
+	/* Vendor drivers MUST unpin pages in response to an invalidation. */
+	if (!cp_iova_pinned(&private->cp, iova))
+		return;
 
-		cp_free(&private->cp);
-		return NOTIFY_OK;
-	}
+	if (vfio_ccw_mdev_reset(private))
+		return;
 
-	return NOTIFY_DONE;
+	cp_free(&private->cp);
 }
 
 static ssize_t name_show(struct mdev_type *mtype,
@@ -178,19 +166,11 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
-	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	int ret;
 
-	private->nb.notifier_call = vfio_ccw_mdev_notifier;
-
-	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
-				     &events, &private->nb);
-	if (ret)
-		return ret;
-
 	ret = vfio_ccw_register_async_dev_regions(private);
 	if (ret)
-		goto out_unregister;
+		return ret;
 
 	ret = vfio_ccw_register_schib_dev_regions(private);
 	if (ret)
@@ -204,7 +184,6 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 out_unregister:
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 	return ret;
 }
 
@@ -222,7 +201,6 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 
 	cp_free(&private->cp);
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
 
 static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
@@ -645,6 +623,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.write = vfio_ccw_mdev_write,
 	.ioctl = vfio_ccw_mdev_ioctl,
 	.request = vfio_ccw_mdev_request,
+	.dma_unmap = vfio_ccw_dma_unmap,
 };
 
 struct mdev_driver vfio_ccw_mdev_driver = {
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 7272eb78861244..2627791c9006d4 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -98,7 +98,6 @@ struct vfio_ccw_private {
 	struct completion	*completion;
 	atomic_t		avail;
 	struct mdev_device	*mdev;
-	struct notifier_block	nb;
 	struct ccw_io_region	*io_region;
 	struct mutex		io_mutex;
 	struct vfio_ccw_region *region;
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index a7d2a95796d360..65b2bd44dd35b8 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1227,33 +1227,20 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
 }
 
 /**
- * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
+ * vfio_ap_mdev_dma_unmap - Notifier that IOVA has been unmapped
+ * @vdev: The VFIO device
+ * @unmap: IOVA range unmapped
  *
- * @nb: The notifier block
- * @action: Action to be taken
- * @data: data associated with the request
- *
- * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
- * pinned before). Other requests are ignored.
- *
- * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
+ * Unpin the guest IOVA (the NIB guest address we pinned before).
  */
-static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
-				       unsigned long action, void *data)
+static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
+				   u64 length)
 {
-	struct ap_matrix_mdev *matrix_mdev;
-
-	matrix_mdev = container_of(nb, struct ap_matrix_mdev, iommu_notifier);
-
-	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
-		struct vfio_iommu_type1_dma_unmap *unmap = data;
-		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
-
-		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
-		return NOTIFY_OK;
-	}
+	struct ap_matrix_mdev *matrix_mdev =
+		container_of(vdev, struct ap_matrix_mdev, vdev);
+	unsigned long g_pfn = iova >> PAGE_SHIFT;
 
-	return NOTIFY_DONE;
+	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
 }
 
 /**
@@ -1380,27 +1367,11 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
 {
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
-	unsigned long events;
-	int ret;
 
 	if (!vdev->kvm)
 		return -EINVAL;
 
-	ret = vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
-	if (ret)
-		return ret;
-
-	matrix_mdev->iommu_notifier.notifier_call = vfio_ap_mdev_iommu_notifier;
-	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
-				     &matrix_mdev->iommu_notifier);
-	if (ret)
-		goto err_kvm;
-	return 0;
-
-err_kvm:
-	vfio_ap_mdev_unset_kvm(matrix_mdev);
-	return ret;
+	return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
 }
 
 static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
@@ -1408,8 +1379,6 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
-				 &matrix_mdev->iommu_notifier);
 	vfio_ap_mdev_unset_kvm(matrix_mdev);
 }
 
@@ -1461,6 +1430,7 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
 	.open_device = vfio_ap_mdev_open_device,
 	.close_device = vfio_ap_mdev_close_device,
 	.ioctl = vfio_ap_mdev_ioctl,
+	.dma_unmap = vfio_ap_mdev_dma_unmap,
 };
 
 static struct mdev_driver vfio_ap_matrix_driver = {
diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
index a26efd804d0df3..abb59d59f81b20 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -81,8 +81,6 @@ struct ap_matrix {
  * @node:	allows the ap_matrix_mdev struct to be added to a list
  * @matrix:	the adapters, usage domains and control domains assigned to the
  *		mediated matrix device.
- * @iommu_notifier: notifier block used for specifying callback function for
- *		    handling the VFIO_IOMMU_NOTIFY_DMA_UNMAP even
  * @kvm:	the struct holding guest's state
  * @pqap_hook:	the function pointer to the interception handler for the
  *		PQAP(AQIC) instruction.
@@ -92,7 +90,6 @@ struct ap_matrix_mdev {
 	struct vfio_device vdev;
 	struct list_head node;
 	struct ap_matrix matrix;
-	struct notifier_block iommu_notifier;
 	struct kvm *kvm;
 	crypto_hook pqap_hook;
 	struct mdev_device *mdev;
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 61e71c1154be67..f005b644ab9e69 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1077,8 +1077,20 @@ static void vfio_device_unassign_container(struct vfio_device *device)
 	up_write(&device->group->group_rwsem);
 }
 
+static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long action,
+			       void *data)
+{
+	struct vfio_device *vfio_device =
+		container_of(nb, struct vfio_device, iommu_nb);
+	struct vfio_iommu_type1_dma_unmap *unmap = data;
+
+	vfio_device->ops->dma_unmap(vfio_device, unmap->iova, unmap->size);
+	return NOTIFY_OK;
+}
+
 static struct file *vfio_device_open(struct vfio_device *device)
 {
+	struct vfio_iommu_driver *iommu_driver;
 	struct file *filep;
 	int ret;
 
@@ -1109,6 +1121,18 @@ static struct file *vfio_device_open(struct vfio_device *device)
 			if (ret)
 				goto err_undo_count;
 		}
+
+		iommu_driver = device->group->container->iommu_driver;
+		if (device->ops->dma_unmap && iommu_driver &&
+		    iommu_driver->ops->register_notifier) {
+			unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
+
+			device->iommu_nb.notifier_call = vfio_iommu_notifier;
+			iommu_driver->ops->register_notifier(
+				device->group->container->iommu_data, &events,
+				&device->iommu_nb);
+		}
+
 		up_read(&device->group->group_rwsem);
 	}
 	mutex_unlock(&device->dev_set->lock);
@@ -1143,8 +1167,16 @@ static struct file *vfio_device_open(struct vfio_device *device)
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
 	down_read(&device->group->group_rwsem);
-	if (device->open_count == 1 && device->ops->close_device)
+	if (device->open_count == 1 && device->ops->close_device) {
 		device->ops->close_device(device);
+
+		iommu_driver = device->group->container->iommu_driver;
+		if (device->ops->dma_unmap && iommu_driver &&
+		    iommu_driver->ops->register_notifier)
+			iommu_driver->ops->unregister_notifier(
+				device->group->container->iommu_data,
+				&device->iommu_nb);
+	}
 err_undo_count:
 	device->open_count--;
 	if (device->open_count == 0 && device->kvm)
@@ -1339,12 +1371,20 @@ static const struct file_operations vfio_group_fops = {
 static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 {
 	struct vfio_device *device = filep->private_data;
+	struct vfio_iommu_driver *iommu_driver;
 
 	mutex_lock(&device->dev_set->lock);
 	vfio_assert_device_open(device);
 	down_read(&device->group->group_rwsem);
 	if (device->open_count == 1 && device->ops->close_device)
 		device->ops->close_device(device);
+
+	iommu_driver = device->group->container->iommu_driver;
+	if (device->ops->dma_unmap && iommu_driver &&
+	    iommu_driver->ops->register_notifier)
+		iommu_driver->ops->unregister_notifier(
+			device->group->container->iommu_data,
+			&device->iommu_nb);
 	up_read(&device->group->group_rwsem);
 	device->open_count--;
 	if (device->open_count == 0)
@@ -2027,90 +2067,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
 }
 EXPORT_SYMBOL(vfio_dma_rw);
 
-static int vfio_register_iommu_notifier(struct vfio_group *group,
-					unsigned long *events,
-					struct notifier_block *nb)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	lockdep_assert_held_read(&group->group_rwsem);
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->register_notifier))
-		ret = driver->ops->register_notifier(container->iommu_data,
-						     events, nb);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-
-static int vfio_unregister_iommu_notifier(struct vfio_group *group,
-					  struct notifier_block *nb)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	lockdep_assert_held_read(&group->group_rwsem);
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->unregister_notifier))
-		ret = driver->ops->unregister_notifier(container->iommu_data,
-						       nb);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-
-int vfio_register_notifier(struct vfio_device *device,
-			   enum vfio_notify_type type, unsigned long *events,
-			   struct notifier_block *nb)
-{
-	struct vfio_group *group = device->group;
-	int ret;
-
-	if (!nb || !events || (*events == 0) ||
-	    !vfio_assert_device_open(device))
-		return -EINVAL;
-
-	switch (type) {
-	case VFIO_IOMMU_NOTIFY:
-		ret = vfio_register_iommu_notifier(group, events, nb);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-	return ret;
-}
-EXPORT_SYMBOL(vfio_register_notifier);
-
-int vfio_unregister_notifier(struct vfio_device *device,
-			     enum vfio_notify_type type,
-			     struct notifier_block *nb)
-{
-	struct vfio_group *group = device->group;
-	int ret;
-
-	if (!nb || !vfio_assert_device_open(device))
-		return -EINVAL;
-
-	switch (type) {
-	case VFIO_IOMMU_NOTIFY:
-		ret = vfio_unregister_iommu_notifier(group, nb);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-	return ret;
-}
-EXPORT_SYMBOL(vfio_unregister_notifier);
-
 /*
  * Module/class support
  */
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a6713022115155..cb2e4e9baa8fe8 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -33,6 +33,11 @@ enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
 };
 
+/* events for register_notifier() */
+enum {
+	VFIO_IOMMU_NOTIFY_DMA_UNMAP = 1,
+};
+
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index aa888cc517578e..b76623e3b92fca 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -44,6 +44,7 @@ struct vfio_device {
 	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
+	struct notifier_block iommu_nb;
 };
 
 /**
@@ -60,6 +61,8 @@ struct vfio_device {
  * @match: Optional device name match callback (return: 0 for no-match, >0 for
  *         match, -errno for abort (ex. match with insufficient or incorrect
  *         additional args)
+ * @dma_unmap: Called when userspace unmaps IOVA from the container
+ *             this device is attached to.
  * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
  * @migration_set_state: Optional callback to change the migration state for
  *         devices that support migration. It's mandatory for
@@ -85,6 +88,7 @@ struct vfio_device_ops {
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
+	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
 	int	(*device_feature)(struct vfio_device *device, u32 flags,
 				  void __user *arg, size_t argsz);
 	struct file *(*migration_set_state)(
@@ -154,23 +158,6 @@ extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
-/* each type has independent events */
-enum vfio_notify_type {
-	VFIO_IOMMU_NOTIFY = 0,
-};
-
-/* events for VFIO_IOMMU_NOTIFY */
-#define VFIO_IOMMU_NOTIFY_DMA_UNMAP	BIT(0)
-
-extern int vfio_register_notifier(struct vfio_device *device,
-				  enum vfio_notify_type type,
-				  unsigned long *required_events,
-				  struct notifier_block *nb);
-extern int vfio_unregister_notifier(struct vfio_device *device,
-				    enum vfio_notify_type type,
-				    struct notifier_block *nb);
-
-
 /*
  * Sub-module helpers
  */
-- 
2.36.1

