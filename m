Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC5E57AAC4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 02:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9D02AD23;
	Wed, 20 Jul 2022 00:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030F82AC49;
 Wed, 20 Jul 2022 00:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J99Sji+OvSaeC7RgZoT6XtphkQcc/IhQxpU3LOPB3icnasu6Rd8blt5eIuE5ZDf+mufB4vlRI0PN/8otNKQwGZrN2P/i5cpAnK3MT00DemvHh2C6ZLgfMV3JEKujBZKRJ6CQMKdIHIhNKrQxJNmemCFl4JM4JWsFze6KvZhy2x7MNvU2I66zYUY+YVUAQse8Z6lhK41fbKX/AluuWmTY9u35p4j4G1l7eso+UNizxYZEJLA/F/t0GnHuEEG+w52fJvmLTNO6I1hJ5+jU59g3/I9lKEkal970DGCyvFX809wsA8V5wOXxaxlFut2+LZg52janjvV4n+EwcWbrN49Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zG6Y/77hUlR2HrMgVrQ33Ql0omoLJmxkMS7/D2drusc=;
 b=KFIqk5JZtoOJ1bOLNFMu5X5j5eKusF7kiUZ/qCMjlyvaRWYQK/zdOzGZro40W6BRue3MDKRM2p7s/4ZEX53nV7zJ3FxBW3wYtXX2paM5GS2JN8k8Un7/jDs1tV9qGMSgw5DSCCSiAchG5hU6DfVyXMDEO/H6NKjM1LKgl/8YqPK/752nxBEdeUl8IuOSNLq+h/kYL5wCjLOI1HGdp46DBYk3l/TF4ZPa4pvbdRWMz9NHJ75PiKWipJeThpWJZuF27vGsZyMaT8jizYgpxA41nCn/qsklXEd9GN08tf1B0aVPuAuRv9rTV2m5gy4Mgk3PVx7FE79qKj+kFQ8aTLOFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zG6Y/77hUlR2HrMgVrQ33Ql0omoLJmxkMS7/D2drusc=;
 b=FTj/m3WcLJ7TnHYwgj85wC6Dn+HHRw4GoPUIZ7QfSGL0At9t+x+8b+TStoRZpZyXfSGuBRVCCsf7Z1rQ6PnOIFbn0aa9jHWz76iLEOt3oa5xvoDH69FQdhTeKZan4WcuD72lqZobLDMfmGVTZmfE/VTfQ+EUOWIXVtPicaf81TnukYT4+38G5X70CNTk+bThkEQv4/5c+hcC6lTOn23o+xALp1XAGrettHMZvPqQ/cOcJnxLO9laCORXIHqifP7FVCvBKPNbxbt5+G8E0E7YyfAqLh0HaGEoJXnIXnziQHiZSHYeODteGWi3hGKdn/PDBmKFD76HpVHLJ2MRFJefJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3134.namprd12.prod.outlook.com (2603:10b6:208:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 00:02:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 00:02:50 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Date: Tue, 19 Jul 2022 21:02:48 -0300
Message-Id: <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0012.prod.exchangelabs.com (2603:10b6:208:10c::25)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba042cd-dc23-43cf-ff5a-08da69e32fc9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TxVz7PNt0NrAp3WYC+6LouR9BjirkLBZ/TMdQXjKW0vIiXSX9e33KWV+3w9+273Z5KRtSomNfnDSwXiqIhybHbo1KxUh83TiOpRYoKWmPm7HwUJPPj6Px4Fj4rOkeP/TogWONqtp3n0oiwRRYQEcIo/amwrwT8lIUNqfdHp9+FdyUVVuY8AWiakPvzQS2jAnICUhKtRe39aQzzOJ87wN3K7Ro1Oe2oIg4hUD183Xyvgp3J48cNgDfmjmiNb6pS2K53EkTlZlqkcFnNKI/eQNJy2uWna8P8oMUM30Ay4ema3IW8Q/DWY71RAEWlvoZ5srH5wBqxyeBbIpcglVDXI5EnFi6KiCI5SXz2HONtibboDN2H1JpgYSxFp2WjbnJMozV+NcGwGWdRPlmTHGVHL2LgeMZFCup5y4FKlU3Kebve/X3fYRqRzZ7c+jn1h6eNRdDGJRLgYQpGts/W8uDfZip+38lTRqhVLkMCdeai5YmxVxeGU8iQuv+J4RAJIjIH0+cPevMFCJFzcyv5SPyVxW4KsMp83piemLFdoAYZ2TjOUlZwHDd94MpNEFL1aUbV1Z+GuMVpcusMVbRxYdmgcROKMi/siD9iX3/uIZ+ez6z49txAMWlvUXUooguIWSnyxV6IuXzWoiwSzri+SnCCn75HeZkKLx9wGQJGPiSTACcB1c45GYX/PgASray4b1ToQtYXWjit+UklQqGM9cTFBin1FRmpi18wmm/+8htpm5PKBBP7lX+VejNkeXR8W7Vd5NSqNpL+NYgpSV8E/5MM884CIW0DYvnyHkPwIUFi9GGFYUVAIDQ4bzWgjj8B4oiC4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(36756003)(83380400001)(86362001)(186003)(921005)(38100700002)(8936002)(6486002)(41300700001)(2616005)(26005)(30864003)(54906003)(2906002)(7406005)(4326008)(6506007)(110136005)(478600001)(5660300002)(7416002)(66476007)(8676002)(316002)(6512007)(66556008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGb1RlhNIH7cOHa4cPgIZbrtdgs5HT/AkqSM2Bf2tBTNyuvfmE1m/VdKkk58?=
 =?us-ascii?Q?J1lQB45PszXhXnSlm/zImMaWBsTCSkZjm4yJJE4mO+4JkneICZ0bVosixx1T?=
 =?us-ascii?Q?30O2TrJxfc8XQvdC304U+16tRE+NMSITgC6UQ4eazszAK2A+bbWRCXipIAVx?=
 =?us-ascii?Q?Y7Ou3r/RKmDn3T6sX0QbVYYjuD2CrkTlkHzh/2dXDhS7VpheK5MB+kmFCQTL?=
 =?us-ascii?Q?xzJxJbNkvV7ZkJmANCAlXrATkuY88RAZvwhjXhVgFdefVWIXio1Nv+YlgYQK?=
 =?us-ascii?Q?JsOwghCJBporFoYfpWJ2JcmYxvCQZ4W6mffvb7CaGqxfnoOyDndDXNeWBbUZ?=
 =?us-ascii?Q?f0RyD3SyhyTN9BG3vrk4MCmlh8s7ZczXUg76JP0PkgI8d7tjiGKMvhY6hAhB?=
 =?us-ascii?Q?i8iWPIj4THxgn7gcWcF/GWvN0PY3tn4fSf8neDUSIon/LBaHG7eBfQ5WntmZ?=
 =?us-ascii?Q?lHtiYALDg9DVYLYQoiDyo2UdAKHcISVW5t/Ch1J2CqGjQA5qkZnAmjESnkM4?=
 =?us-ascii?Q?yQBwTAS/eX2NErhcfNvQpPF616R2/SSDZxsVtUhxJqv6kJyaHsj/KI8bAjtZ?=
 =?us-ascii?Q?HInHxH55z4mhuJUR8d0hBUWRK53KvXLpF9+3DnnRL9uJoMmEgSsChLnv9lAR?=
 =?us-ascii?Q?OwzKIkeGrHMw89NmKHh/D5W7SoMdPcKHRA9sYYqFdwBTjc05NuvBG5zISmvs?=
 =?us-ascii?Q?3xNRkN0DPQ1DoJvAoBMhsMFAXnmusPM9OsHhdmNBTxL8APtmEmdIo5KxbdEx?=
 =?us-ascii?Q?MJhPYhr07EBm68uuDQyC3+l2e0YOZWJ9oTG+HzIfhaC1MwGkEiDvYj5t8+KT?=
 =?us-ascii?Q?N5tQdibcOmnPAOmddk7Z2QwbMcJFJNuSVxE820wocMIacAZOLJLFFdst5zZL?=
 =?us-ascii?Q?uQEGLyGEPVboK3b0eWV/Tiz0VERrnsbW9yiwsTQOrcZBfGpdHeV+3z7Qey29?=
 =?us-ascii?Q?uSq2If4vUEq3lvTeRyfa4k4kIIxKhYWAkFxE3EJa96l2uq7XmxIScxUm5isU?=
 =?us-ascii?Q?hLgcWtqNXZdVwFBDQLs2RcfyCACep8ZETboPsT+xpQBltFyJwYAsEt7zGLvZ?=
 =?us-ascii?Q?GIR7SH8U3YwJck8ukPX/g90/PDjLbC+eBE4AS8elHLKbXuMtivHc6NxswJyN?=
 =?us-ascii?Q?x384gl49NxohFaAEeUi/N+3CfcjkYfG2lJrvy0mCkZo8w+QMclqv6/ap923m?=
 =?us-ascii?Q?kmAWzO4Y8zAbgIq3qkpfRJKbtVJH5JvLkwEWfjDT9qW2/MBOgeQtp3tS78dt?=
 =?us-ascii?Q?YtTsleK3vT8YCaPTQ9XXLa6/P8PMSEvF9MQ1/bJ9AndwfuLCdFcH4lZZXNyC?=
 =?us-ascii?Q?3RdqmeG5Q8YqVclLaJEqXhQd18DtiysKRuFore4vbRDkItRs7AyMd3uKp3Sv?=
 =?us-ascii?Q?U6Y84b3CrwtZn1hGWgV9qpbRhZSAjUmEyIKewu8Xzq7qQRj8S6b3TtYlun8O?=
 =?us-ascii?Q?3MeDNaeFUAxFQGp8kfqQbEt44vU/BjwnsX8+kDJpbUSZB3EBKAkT58peLi4S?=
 =?us-ascii?Q?SLLtBD+PUAASZ8nEsW7wsPZXFK5IQRIvRtCQ11y1UxZP2nlYdLca4bJ4HCvP?=
 =?us-ascii?Q?wYFmq1ZDkGD0fZltId2lC/jawLHAr1tADFwn0bIL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba042cd-dc23-43cf-ff5a-08da69e32fc9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 00:02:50.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDxAKzdrE7AqdyHnUvEGo2XPZZu1kr0t2lCLp+zJFysPq1iHtbBOGFjVlW0qucmS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
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
 Eric Farman <farman@linux.ibm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having drivers register the notifier with explicit code just
have them provide a dma_unmap callback op in their driver ops and rely on
the core code to wire it up.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
 drivers/s390/cio/vfio_ccw_ops.c       |  39 ++------
 drivers/s390/cio/vfio_ccw_private.h   |   2 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 129 +++++++++-----------------
 drivers/vfio/vfio.h                   |   3 +
 include/linux/vfio.h                  |  21 +----
 9 files changed, 86 insertions(+), 240 deletions(-)

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
index bc2176421dc56e..0047fd88f93858 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -33,30 +33,16 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 	return 0;
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
-
-		if (vfio_ccw_mdev_reset(private))
-			return NOTIFY_BAD;
+		container_of(vdev, struct vfio_ccw_private, vdev);
 
-		return NOTIFY_OK;
-	}
+	/* Drivers MUST unpin pages in response to an invalidation. */
+	if (!cp_iova_pinned(&private->cp, iova))
+		return;
 
-	return NOTIFY_DONE;
+	vfio_ccw_mdev_reset(private);
 }
 
 static ssize_t name_show(struct mdev_type *mtype,
@@ -154,23 +140,15 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
-	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	int ret;
 
 	/* Device cannot simply be opened again from this state */
 	if (private->state == VFIO_CCW_STATE_NOT_OPER)
 		return -EINVAL;
 
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
@@ -190,7 +168,6 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 out_unregister:
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 	return ret;
 }
 
@@ -201,7 +178,6 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
 
 static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
@@ -624,6 +600,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.write = vfio_ccw_mdev_write,
 	.ioctl = vfio_ccw_mdev_ioctl,
 	.request = vfio_ccw_mdev_request,
+	.dma_unmap = vfio_ccw_dma_unmap,
 };
 
 struct mdev_driver vfio_ccw_mdev_driver = {
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index abac532bf03eb4..cd24b7fada91ca 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -73,7 +73,6 @@ struct vfio_ccw_crw {
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
  * @avail: available for creating a mediated device
- * @nb: notifier for vfio events
  * @io_region: MMIO region to input/output I/O arguments/results
  * @io_mutex: protect against concurrent update of I/O regions
  * @region: additional regions for other subchannel operations
@@ -96,7 +95,6 @@ struct vfio_ccw_private {
 	int			state;
 	struct completion	*completion;
 	atomic_t		avail;
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
index bd84ca7c5e35c4..83c375fa242121 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -231,6 +231,9 @@ int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops)
 {
 	struct vfio_iommu_driver *driver, *tmp;
 
+	if (WARN_ON(!ops->register_notifier != !ops->unregister_notifier))
+		return -EINVAL;
+
 	driver = kzalloc(sizeof(*driver), GFP_KERNEL);
 	if (!driver)
 		return -ENOMEM;
@@ -1079,8 +1082,20 @@ static void vfio_device_unassign_container(struct vfio_device *device)
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
 
@@ -1111,6 +1126,18 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1145,8 +1172,16 @@ static struct file *vfio_device_open(struct vfio_device *device)
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
 	down_read(&device->group->group_rwsem);
-	if (device->open_count == 1 && device->ops->close_device)
+	if (device->open_count == 1 && device->ops->close_device) {
 		device->ops->close_device(device);
+
+		iommu_driver = device->group->container->iommu_driver;
+		if (device->ops->dma_unmap && iommu_driver &&
+		    iommu_driver->ops->unregister_notifier)
+			iommu_driver->ops->unregister_notifier(
+				device->group->container->iommu_data,
+				&device->iommu_nb);
+	}
 err_undo_count:
 	up_read(&device->group->group_rwsem);
 	device->open_count--;
@@ -1341,12 +1376,20 @@ static const struct file_operations vfio_group_fops = {
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
+	    iommu_driver->ops->unregister_notifier)
+		iommu_driver->ops->unregister_notifier(
+			device->group->container->iommu_data,
+			&device->iommu_nb);
 	up_read(&device->group->group_rwsem);
 	device->open_count--;
 	if (device->open_count == 0)
@@ -2029,90 +2072,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
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
index a6713022115155..25da02ca1568fc 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -33,6 +33,9 @@ enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
 };
 
+/* events for register_notifier() */
+#define VFIO_IOMMU_NOTIFY_DMA_UNMAP BIT(0)
+
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 4d26e149db8182..1f9fc7a9be9efa 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -49,6 +49,7 @@ struct vfio_device {
 	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
+	struct notifier_block iommu_nb;
 };
 
 /**
@@ -65,6 +66,8 @@ struct vfio_device {
  * @match: Optional device name match callback (return: 0 for no-match, >0 for
  *         match, -errno for abort (ex. match with insufficient or incorrect
  *         additional args)
+ * @dma_unmap: Called when userspace unmaps IOVA from the container
+ *             this device is attached to.
  * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
  */
 struct vfio_device_ops {
@@ -80,6 +83,7 @@ struct vfio_device_ops {
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
+	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
 	int	(*device_feature)(struct vfio_device *device, u32 flags,
 				  void __user *arg, size_t argsz);
 };
@@ -164,23 +168,6 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		void *data, size_t len, bool write);
 
-/* each type has independent events */
-enum vfio_notify_type {
-	VFIO_IOMMU_NOTIFY = 0,
-};
-
-/* events for VFIO_IOMMU_NOTIFY */
-#define VFIO_IOMMU_NOTIFY_DMA_UNMAP	BIT(0)
-
-int vfio_register_notifier(struct vfio_device *device,
-			   enum vfio_notify_type type,
-			   unsigned long *required_events,
-			   struct notifier_block *nb);
-int vfio_unregister_notifier(struct vfio_device *device,
-			     enum vfio_notify_type type,
-			     struct notifier_block *nb);
-
-
 /*
  * Sub-module helpers
  */
-- 
2.37.1

