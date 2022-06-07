Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAA541F49
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DFA112042;
	Tue,  7 Jun 2022 23:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A111203A;
 Tue,  7 Jun 2022 23:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auvU/ZdhF33GmmSg84VY03Yt46Hkj86Orvy5bA7y8MG22T2eZpbyv1OdEcHWCRG2Na2nkwzaZ4FQsm0PbICUqFy0ujB8xQt0fUxqIam4uaTWhPsIUiAenTGX66c+XUSL7wzvLKt9356QJr0DLQ6bKfMY4e3rAmktZ4ilCN+LvdgTnAIRydU7b4Flf9CvdwJoCXGJSYuUr279AfWseBsFWSM+w4RN/3IESbQak8SZ3F8M587Q916aPkqaN+9fSePVbRUMx5ZRYE62ujN8BLs/abGhXPXbZipMGypmtlRsIZDw+J6994mxEHGdFM0RVmg1ZPSiNJIZ3LQ5tSCrRE99uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNbcGpcsEgm6mYMIS0bnwPhrjqaxUTSKxGyqAUibrQ4=;
 b=eS10MQO17JtOSlLrr6yNiT6fuzrbX0s5yF2wGh2cZPRtshzkmCCpIHUYrxTKAN1BiLHUZqZXq7EWzI8tDbY3CGRtsY3cPelM4clUmGCUvsOe97Mo82twv1GrccNbk2YdAMC6ebEgF8iM27QFLxq8cGg8Pqr2K8ztHRAamD4/255gXDqa1nMnODTUdtvYFy2DAowrteaVMQ/r9i5Vgw8jg3ekEMArd6WcDzP412Rz4XP4gq9gpLaIGqtmpNgWEbQdRxqf6ZOkEKlHgzLvK4uug2rf/tu6TGHJ9B00ZMm8rWOYdMx1VYPvBEgRZ/989Csq0qvw6spKIUwaK3wjJvKbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNbcGpcsEgm6mYMIS0bnwPhrjqaxUTSKxGyqAUibrQ4=;
 b=XRRDFq5lUEWwQuAv+NyPsmgy1Fgw50FKowfdvNfwRpzQqmOUTH9V5NXUb41xSqo82Fi0Sq0ojMpTddRNcRsOtJU1AW01XxGV/4SNCWbOmQX43OVuoIr3nvUk1tq1uNWtGI+eAo6LIcaJP1oHaf9xOXP+bEQc4IiLeWhyQuLkh0lB9qT8Vi/EbZq28JXCyD4Zeg7iRbr82d8N4apJi7addc0z9TQh4rpYeWK4ri6m/L/PGgqwVaEgIIF/XdIX5G8rCjjFg9Ujnt6QoFywLIAvgS/2/sgX6oUkVXW8IK9uJZ/o2mABRS6jmKUMwrSEMG+jNc6XeB/KeCpsLRjRoJi6+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3593.namprd12.prod.outlook.com (2603:10b6:5:11c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 23:02:14 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:02:14 +0000
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
Subject: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Date: Tue,  7 Jun 2022 20:02:11 -0300
Message-Id: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:208:239::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b22b581e-367f-4c9d-a986-08da48d9c288
X-MS-TrafficTypeDiagnostic: DM6PR12MB3593:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3593E88CAAD5FFB6C94DF69CC2A59@DM6PR12MB3593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTi9bNFDE4gn0ApMbVBd2MNNYeMojfMzSxTdbOa7r8fUG+MIzirdT7OUgTmwrsMtQwedsb2Rn7k+GihOCfJm6zCSe8CahoinizsjDbLIle4brFbzeFwY2YJc0s42w63Bh9IRHs4G1PxYHv1kMtGFL8dO+FepCDcJDX5IoizMqc7QKcHEjYcpbXs3bnxJiu4mNUDHaQQlLHWBy+uYqbeIwFSHvxjMsIdWkSKNqcH/ZV1ka2Q54FCBVWsOGLz5UdrvdBjlDL17FlTRmeiKje04zc33lDRK4srVXFkpfYvBRp9tgcgXTpK859fBQG8cA3jztbzNfK07ogrp5pA5CIbgOHSxdexZasKbgZWy+xVMraeKEWQOigVx3bFQwXnhYYl1l32beZxvCohvP9cw4xLkYog4zwPTdPuOpNQ8s7OZyxKx2M5L6/x8OCcIUN2xu1bpd9RI+dmEAgG1c1q45wefZGN4UGk+vKMk6mHW2C3N2Cdi1tqAmV0dyYBkMorCFE51SpeGMCMeGpq79qalxK37ttD/rg0Z5d5W9CUFf036lAm6bByXHldm/QP1o0G1oxZzoeQKuEoMptnitONuEbz2h7PSDSqjqqQFNHF8lEjKElIt17Mur8/Hfg0M6+ARZbv4qlWWDI/ihTiUsXVD5gi0N4YvFlqxSXFjmMvimz7+OSuQh5W6Zpde8oSVuyPhd1+1EppBEuP4aKywvPs1rmiEwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(86362001)(316002)(110136005)(921005)(2906002)(66476007)(66556008)(8676002)(4326008)(5660300002)(8936002)(30864003)(186003)(2616005)(83380400001)(6666004)(6486002)(508600001)(6512007)(26005)(6506007)(36756003)(7416002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YHXWXqgmWzN52WgUARssE5pFeLRMPCuxEb7L/f6h9y1Z7cOuc2hATeh670P?=
 =?us-ascii?Q?uU5RaRl7HVUR+Ysj5CLAsgP65Vn+rOrlKmwBE/mBpQLfKEjX8N7wZNedc7QF?=
 =?us-ascii?Q?YrXd+qrEAw+sgMSgsudrBHpEpWlc6/KYZN/iYvPUoLiBxK3v/+ODx9cLHpnL?=
 =?us-ascii?Q?rcPCaAE54ntIWxj+8TxGWboe9lhO3XlvLRPicoTJDKqPdSy/XNNdYYtKSwK/?=
 =?us-ascii?Q?hA5fPWp61Muo02w4itHagOKwolsaWcgrlj++/uknEg4ZOBHXwcItrz6lLGwr?=
 =?us-ascii?Q?ekZmDhQMLi0eCK+q3x3YTCSR4sngeEvWEpIgaxDb99yiDFJ2Nyur7xitqBSW?=
 =?us-ascii?Q?XdQ3vpZcEuyOimBhGzas7emZewVvgCn5edyhoZpcPlvZrIJka3G6o27LHx7G?=
 =?us-ascii?Q?iUSny0P0oa7DXr7T3j7XFZlRP8ntrByTMtd1YkC9NK4O5REesvAhIdumXmmh?=
 =?us-ascii?Q?VLl2K0hXoHgoMWYH7n9drjr0Up8nYDiOQooKgOMRzlikKLEP7REkiJcZQG4b?=
 =?us-ascii?Q?RU+Ty6pj95wDvW42Fz/gMGT8HtFlBfeZ6O58lkgNmkiKGqLHhCBMpbND6ppZ?=
 =?us-ascii?Q?VrclEfqkee+ueynhEOD636vePzvo6qQda2LWp/QtuRsnacFrSCMpU4f/m2+6?=
 =?us-ascii?Q?Z2f4qj9aWqWBbot8Qbu9Os5kix39f5SuGOCPLhWhAEjq3//veHKrDH8s2U8U?=
 =?us-ascii?Q?lhD2dor86ua+B49xPGZuunZhS4vM7HCuFpPEAhtf82MYOnhqusXyHeOEPbWY?=
 =?us-ascii?Q?R4fGvv3bnL+Gm+VU92ZowzdAoVxg2RiaTaYdNh9eUNyUIfHQ8M3px/6Bntex?=
 =?us-ascii?Q?E766gAe4nTaLo7pmYbuNLbl0IIWaxAL9yzUOrW9HQvQGzJg6zQWBsuejBxwP?=
 =?us-ascii?Q?uFykok6xFlKWC7X5zlLdJJdBxB2rkPgIh6MEiE5fy/L74c9/K7x0PnUqGuhT?=
 =?us-ascii?Q?t9ZhSSY1z9N5V8ljhBF6RFTuOmXm/21lcmefo5X7sGddXZSq28cuuW1NNOIw?=
 =?us-ascii?Q?ytx6D+ulJV4P6rWkcHp6lVbE07vdVsKj1AGePc++Z2FnJV+Kx59Ui+QzMxpv?=
 =?us-ascii?Q?EDYOJ8WZ1D711rwsjpmyqfB8F348b1sGTzN1jz7Or53POkYJXGj6tDzxk9nt?=
 =?us-ascii?Q?lL+YH732IrTkk95JRn351YX9pJvXP4rliIoyG6NgR2snMeEHPwhn+ps/PC0P?=
 =?us-ascii?Q?usKbGKst0NBw/6bw4ngwwIN0Tv9YzkuTDxpgT4nmgLExwQhJo+vB4NcNMu3X?=
 =?us-ascii?Q?YG03TsDqk2XvcpwFPpu+ohqNbz9DWWtHuagaFtbGVlhxEjagGBefgeBQ0FM+?=
 =?us-ascii?Q?IowJyVahmxM49Fh7jfC4++o+BF2Q/r+V+DDpzmaNk2V1PF1/lStcwQW1FudG?=
 =?us-ascii?Q?Y4Rj+2/ORwEjE/3rf/AeJ8QC32DnGGrampJFlXI4EV/8b3Sq8Lb1KriGOdDU?=
 =?us-ascii?Q?Jx84VZaqOUS8idtIt1A2G/EkYacEor7/hNYDWaomQHfO5x8791JH7RigCjnu?=
 =?us-ascii?Q?Uw2HGUtWVj5abzqgXV4z4eBrWa3bqcALc1BW8jqJyiltDy6hfnbldWJRjQnF?=
 =?us-ascii?Q?l8MlXfSIu34tjf5vjYEVu+OhA4F3wSuQfKwk/3sexD5rBZB2WbaEG2drgEmD?=
 =?us-ascii?Q?M16pBb4L7KumSb8aTH0bcyiOgTqc6bTvTyrI6okKhYFZB3v2ZCs9gHRihBJm?=
 =?us-ascii?Q?+iJTRKPfdPFqLC8sxISARZddMmbzA5LWyZyORBrwyKxhbWGkNl43W5kEc1Am?=
 =?us-ascii?Q?/8l03F4iWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22b581e-367f-4c9d-a986-08da48d9c288
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:02:13.8297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO3OpsYDw28i/aR96OErEVLVJ4S+B9nbW6g8wDlWo85DBN1nOFg/w5tkkU3zpia9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3593
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
 drivers/s390/cio/vfio_ccw_ops.c       |  41 ++-------
 drivers/s390/cio/vfio_ccw_private.h   |   1 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 126 +++++++++-----------------
 drivers/vfio/vfio.h                   |   5 +
 include/linux/vfio.h                  |  21 +----
 9 files changed, 87 insertions(+), 239 deletions(-)

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
index e2f6c56ab3420c..ecd5bb37b63a2a 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -729,34 +729,25 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
 	return ret;
 }
 
-static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
-				     unsigned long action, void *data)
+static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
+				 u64 length)
 {
-	struct intel_vgpu *vgpu =
-		container_of(nb, struct intel_vgpu, iommu_notifier);
-
-	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
-		struct vfio_iommu_type1_dma_unmap *unmap = data;
-		struct gvt_dma *entry;
-		unsigned long iov_pfn, end_iov_pfn;
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
+	struct gvt_dma *entry;
+	u64 iov_pfn = iova >> PAGE_SHIFT;
+	u64 end_iov_pfn = iov_pfn + length / PAGE_SIZE;
 
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
@@ -783,36 +774,20 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
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
 
@@ -831,12 +806,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
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
@@ -853,8 +822,6 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 {
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
-	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-	int ret;
 
 	if (!vgpu->attached)
 		return;
@@ -864,11 +831,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
-				       &vgpu->iommu_notifier);
-	drm_WARN(&i915->drm, ret,
-		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
-
 	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
@@ -1610,6 +1572,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 	.write		= intel_vgpu_write,
 	.mmap		= intel_vgpu_mmap,
 	.ioctl		= intel_vgpu_ioctl,
+	.dma_unmap	= intel_vgpu_dma_unmap,
 };
 
 static int intel_vgpu_probe(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index b49e2e9db2dc6f..09e0ce7b72324c 100644
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
+	/* Drivers MUST unpin pages in response to an invalidation. */
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
index a7d2a95796d360..bb1a1677c5c230 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1226,34 +1226,14 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
 	return 0;
 }
 
-/**
- * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
- *
- * @nb: The notifier block
- * @action: Action to be taken
- * @data: data associated with the request
- *
- * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
- * pinned before). Other requests are ignored.
- *
- * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
- */
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
@@ -1380,27 +1360,11 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
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
@@ -1408,8 +1372,6 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
-				 &matrix_mdev->iommu_notifier);
 	vfio_ap_mdev_unset_kvm(matrix_mdev);
 }
 
@@ -1461,6 +1423,7 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
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

