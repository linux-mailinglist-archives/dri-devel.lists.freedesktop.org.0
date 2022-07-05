Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F838566935
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE710E319;
	Tue,  5 Jul 2022 11:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0810E72D;
 Tue,  5 Jul 2022 06:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsjmWIcVkY11FGkc1nwVtyplCRNHYsk85s8ySIG2HpUxMkrG0N8Kr2m2jBcwLzPslbV5xN5aC+fVjFVy6qhP/Jz3oLyKLanhuqhmxoj1R0SP0F7mscAySYLWEwmVIcYu/9zRhRd5sSYD2GXwp8GwExQd2cqMrkIYgxLVhiEL1lqHOLKNshrLF2cK3DJg21WGrlS3chgelW4R2rG8DiViio1s2XJT+o3DIWr1msKwGLPc4/Qi3nC2yQUZdxUz6BEnb3h9yBgKyg7BtAnt4uTakYF2sfeSUYvdiN7KGS4x3Hdm2BNRWIk6YmVrjjnQU8LUK2biHQwrcevtdLAHsnWY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZSpUPQm8/GoXB5LJvqeHEQaIgiA1ivPkAy6fjBcoNc=;
 b=ka6W091KEAVP/ssiIWYJ/osv8n8IYjfgC0+cgN2cUO/14WnOJJ4Mg01Ck91g+33OTz04ahJrKB0q06ULkGFKtuhBLpaeEtuq+HIF77tNtPZEuY937w/XHH8qzDQtu/FrcFOOfdMz6YloxQ+RU6ITMghNdBTYCOsFWnHUasfx6xVyidEdLSyu/73/L7rOdQ5LqWy2jORKGMjirPuQpXy5bhu8G+1A7fGVxNGetfP63dCMRDiCJ8OE1jzRayRdXaM5902R/djp4JUuj63zscBDTfkDJ422/QcrrqMdnlyDHfrK9YIb2Per7RAHz2qaAEL9HSuIiMLQSVKM9vBcY+7y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZSpUPQm8/GoXB5LJvqeHEQaIgiA1ivPkAy6fjBcoNc=;
 b=H8duMx7x2z5lqXthEjelMpd3DCQnexzGB+hxhOCTaa7ch3v94TqhZ7C5gdty7TVGALGnS0jLKeUbfO05lsGRBdoNidIe90M+KCcDzTm7AMJCXkDqDWhit7H3wgF+Iobn3kLowCfg6SFdUsql8nT+Bp/Cc8UYTbb5L7AqnuW8ev07CB0FxjzShknImucGX2CpNN/iKmum6hOQJWwGYltPzvwmZA8vwYkycRaBcR37nQjZPIQetXcyMRrNYfvgPjZmUcy1ulA2g2kOEpkVuwybLX+6DIkxkiCJjKCzhjA1VI5DO6OHU7tHR25QOrUcjUjXPMRywo+2PCYgos1WUUUtIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1173.namprd12.prod.outlook.com (2603:10b6:903:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 00:59:05 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 00:59:05 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Date: Mon,  4 Jul 2022 21:59:03 -0300
Message-Id: <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e74e7931-5cd5-488b-385a-08da5e218ec7
X-MS-TrafficTypeDiagnostic: CY4PR12MB1173:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Arms9Sju9y7GIJPY1mfn1u2hqebwYTg3UYyqOHsCcWGOmNaAHDrF74tBfxlla+ZbxFqQvYffzbnw+VkfWuvb9B+94vci+X6h4Drc5TSSYqzQezggXMpJkKOBjnA+VFzfwQeCbHpvuySU1N97w1uHVD93RkwZqYAQD/74F5U8ahJh2av40bfrnKfw1X97Ejll5l33YwB5cLExFuKKUk3LIhVIOiJy/SE4unGryTEoIRgGVzL0dD4qAjWRJlSrfWeVDuaRFyUmlbgRymigsuXEN7nHw/ksmlpkgoyA+iYXiwH2EGAv2/F1lXuwyC3TobOt/YVn9ULRV3gwAjSHOMhZ98ax8z4t6jxjvJNGO2gVQ2H/OSa7YKWJTNwn1d3kFRoAxk1W5eKWzFf+pzKlT86oQBoI5JB87bxlzTaM5Y+7HkshhOnPLXRTQDQ5zBZAmi1SYcQaYnzwGtDs3xhhP2L+pfin5aFUBDX0zf0b/zeEz5k3KqFis/BCVCg1NR+a+OOfxLGYdHZeZhDYDVAMBy/RxwKbvu55siP/YQz8EVkI7GfmatuHkwahW3OFJHG1/pkvMFeQoje2uZGFJHco+DxsGO2YX00xvPWo8mb2NnT2mNMAIuisN5qvW1iERiY9Q095skqTSIsgl1m0J27ZQS/FntR96dqkxig9PvFyuddyPIaUNw3YXexScD00wNb2PTZwrFTkdI2zWAODwbLDWg39Z2JcxEYpSn2B8QfLj0BWUK9M8fGsm30oWq3wWivLIybdWaTTXDrE78bOksoiFzgRM2IRFDctY5mnEXxvBDUSYZG9/31PJ0y8JaVSWFs5apW3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(110136005)(6486002)(26005)(54906003)(6512007)(186003)(36756003)(316002)(83380400001)(66946007)(86362001)(2616005)(5660300002)(2906002)(7416002)(7406005)(478600001)(6506007)(8936002)(30864003)(4326008)(66476007)(66556008)(38100700002)(8676002)(41300700001)(921005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iw7QJH7K5wIeh+2gqR8Z940dqfSgGYNzmHIsd8aHbI2L/DeZWHnxjeZ502a5?=
 =?us-ascii?Q?ZiCMzI/VGG6YXqXCYX5MIAfaEWq2/b6XPyp8jSqP8u6IXdZf0T1NM5HT7u+W?=
 =?us-ascii?Q?rKHe0skLTpNTlyEQVRS9I6l/qbSMgql3Y6U94I7s7lpIVVNSmJoyvri6Xpee?=
 =?us-ascii?Q?unqVECbxcUTEXKeGenLK53sIwhxsWYQwjB9SSD3Yo8qtFKiYJdQyFxIH2jDd?=
 =?us-ascii?Q?zFFA3o5qjDMnysr7JZ+xvUsLWUcePCNnh2xInvK1N00xUMno1wmYCyFm0g5i?=
 =?us-ascii?Q?BWOjosMYGOCRwKz/e9O/R+XBecshDj7NKA4vzB0uk7Si/XKnBuwY84o7+V5u?=
 =?us-ascii?Q?VniSTK08ZkZ8NlnXtdBjCUDzM0NsD7RtssIv9BJM09jkf0UvBFVbDCaSLqY4?=
 =?us-ascii?Q?5qldgM3f5Gu5yqDa7K6SnZ9gG1oODOr88fcm30liRcgnNzYM9vpOtEmcuAnG?=
 =?us-ascii?Q?+aa1T+t0C0G/OEfCSPmgbYWmtODweUkl4bGGIZgFoegjc+FUOjTaZQjHWC1V?=
 =?us-ascii?Q?lfhEI4t9cql3il7QDKwi/0RQ0XG9tJzRden9TU597u+dO+QCUgpX8H4AJE43?=
 =?us-ascii?Q?K6IcwY77kNey/y62Z1zb0aCiGX8rkCBV8PCV2lhBlB8B74GAMbqJnX9TJOFj?=
 =?us-ascii?Q?pxiClduCKe6kPse19hVTPbF9pSPueWAkh++wsAxuulVS4bsG/kvu/9Aa4/y6?=
 =?us-ascii?Q?gEK+D99hu4rMxYOkS5V/r/0zNfsWJDXwBDMTyKkFkmU15GGMZaXnONfmKxmu?=
 =?us-ascii?Q?U/CtuvBYctLAT30A8tOTvE+0W/Y8LIx99wvOLBfN1eyc0BsDgkF+tufMnKmI?=
 =?us-ascii?Q?K9lk0bfpMLfnYoMmRfddSYiLHeVwtGKPhWCVqW4cKvvX6RxJKkDlSvUsVlNU?=
 =?us-ascii?Q?0fJ8lkleoBhokvbGBKyUl/rjefzw6Z7Ia3nRyKamyxhI2P4xmMCFRzwGe8jc?=
 =?us-ascii?Q?vsrlwXMg+YuI5I/C9AlUOaA0OTSmvBvVMaVQFPX5sXRNu2x5Z3br6yq7mD3b?=
 =?us-ascii?Q?Jf6025zlHhgCFPYvYKFKeeXYszAAQB3dUSBKNVDYrUlk+ZMbxj3Ths1Sa4Ch?=
 =?us-ascii?Q?t6uVP5Q0Setaf43LvHZC9dc1LOivxnHI6QCEP8FzPKIBUC8EVqU57mLLbtp2?=
 =?us-ascii?Q?rUYZX9OKeSoYKsqLYZqbw1q4GSgEa6kSTCmIT/HDlNi6VD7KH3HpUNCv6WXz?=
 =?us-ascii?Q?4SQLH5UnGalc4LcRHhXqa/+BuaZWyElDxF5m7Xo5M0xV3i8j4mVM/b8WSh5P?=
 =?us-ascii?Q?snEtkSQfPYm7emSOXT2QsNP2GRpgdl5Whtczn+6XfUHp59+P/LbRlee0UG2E?=
 =?us-ascii?Q?0FOxdpSjTPsfEnI7fhE44AD9TKhNpZAZxxDylka+6uWm9aP2qFIb2Ri1l7bz?=
 =?us-ascii?Q?kjNzLpeCJ8lcndgngYVWGTuwv2cnbMebybIRYwirFreKRNbbJNLoihgK9j+c?=
 =?us-ascii?Q?DfNn6FpWIjHhqcUjoIFGmgvXed/2CH+H9FHQRG/E3QNkHQo1zzVxKqA54g6V?=
 =?us-ascii?Q?vPRh9txj58gxMEV+M95tUcy+AfgSIQ+EKOOEFFxGh4p1o7UKjNfJYR1EZhKg?=
 =?us-ascii?Q?IedYASO3B5LobAsttZxSqIAiT7FsgxqIRXLuVaXv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e7931-5cd5-488b-385a-08da5e218ec7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 00:59:05.1042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xql1vZbIUfTDIgPesx0+VqQgqW6/661OoQY/JckSayS/2ZHU5ZLISqrzUzJzabWx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
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
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
 drivers/s390/cio/vfio_ccw_ops.c       |  41 ++------
 drivers/s390/cio/vfio_ccw_private.h   |   2 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 129 +++++++++-----------------
 drivers/vfio/vfio.h                   |   3 +
 include/linux/vfio.h                  |  21 +----
 9 files changed, 88 insertions(+), 240 deletions(-)

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
index b7163bac8cc75d..61418109238976 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -74,7 +74,6 @@ struct vfio_ccw_crw {
  * @completion: synchronization helper of the I/O completion
  * @avail: available for creating a mediated device
  * @mdev: pointer to the mediated device
- * @nb: notifier for vfio events
  * @io_region: MMIO region to input/output I/O arguments/results
  * @io_mutex: protect against concurrent update of I/O regions
  * @region: additional regions for other subchannel operations
@@ -98,7 +97,6 @@ struct vfio_ccw_private {
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
index 61e71c1154be67..610bb884d9197b 100644
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
@@ -1077,8 +1080,20 @@ static void vfio_device_unassign_container(struct vfio_device *device)
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
 
@@ -1109,6 +1124,18 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1143,8 +1170,16 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
 	device->open_count--;
 	if (device->open_count == 0 && device->kvm)
@@ -1339,12 +1374,20 @@ static const struct file_operations vfio_group_fops = {
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
@@ -2027,90 +2070,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
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
index 49580fa2073a8d..8c5c389d42d918 100644
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
@@ -154,23 +158,6 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
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
2.37.0

