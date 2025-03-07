Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF24A55FEA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8CA10EABE;
	Fri,  7 Mar 2025 05:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgQ/kHeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB17F10EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741325110; x=1772861110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P19fBHxU+0W0QVHozv/yGWTtaEmgDTBHwtw9lxyqAsM=;
 b=GgQ/kHeDbNmuLzYZ7Rlr/+CuMhqDUbodG8F/byebZVJGipGm7HPmFhU2
 MQ9jSzOakLS8yFnLOAgaDHCFgyiY+hkJ/tk0FJmsKHWmirZLv3RgDYs5y
 bDSZPQJCAWEdpSqlICiHMkSDb/2GudC9g2KKy7SnimF8fNtqLUiIZnhkY
 oitvZ8Dz48pvrkrgXQbNp/6Elw0YSIn4ppfuJmnAk0i5Wq+fQ2GkSgXpH
 3+hWe/QuEhcXv+vjUbZ0AQen5XFhjyu/fBcxyzAXUcUwdx4eHRkDzJbO7
 9zK9Mq3IyvWHAQpAUzfCtziKw7fPyEEtOVxPtqtsSW/c5CQtJw/UCO4Fd g==;
X-CSE-ConnectionGUID: DhHE60ryQXKvRIOdl6MycQ==
X-CSE-MsgGUID: 6/9ZfHGZRrK7n46CuyMx2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46293082"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="46293082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:25:09 -0800
X-CSE-ConnectionGUID: hA42JP9RRQy2qrNzAJp9BA==
X-CSE-MsgGUID: PLFcfjnuSiGDKCGMfiTgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="119232483"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:25:09 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 1/3] vfio: Export vfio device get and put registration
 helpers
Date: Thu,  6 Mar 2025 21:16:42 -0800
Message-ID: <20250307052248.405803-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307052248.405803-1-vivek.kasireddy@intel.com>
References: <20250307052248.405803-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These helpers are useful for managing additional references taken
on the device from other associated VFIO modules.

Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/vfio_main.c | 2 ++
 include/linux/vfio.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1fd261efc582..620a3ee5d04d 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -171,11 +171,13 @@ void vfio_device_put_registration(struct vfio_device *device)
 	if (refcount_dec_and_test(&device->refcount))
 		complete(&device->comp);
 }
+EXPORT_SYMBOL_GPL(vfio_device_put_registration);
 
 bool vfio_device_try_get_registration(struct vfio_device *device)
 {
 	return refcount_inc_not_zero(&device->refcount);
 }
+EXPORT_SYMBOL_GPL(vfio_device_try_get_registration);
 
 /*
  * VFIO driver API
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 000a6cab2d31..2258b0585330 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -279,6 +279,8 @@ static inline void vfio_put_device(struct vfio_device *device)
 int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
+bool vfio_device_try_get_registration(struct vfio_device *device);
+void vfio_device_put_registration(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
-- 
2.48.1

