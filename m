Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83328AC49E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 09:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F547112823;
	Mon, 22 Apr 2024 07:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLktXhwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DC2112824
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713769230; x=1745305230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QW1bLUiDxhnwM5EPUxf7J82zqdGu2UdJY9OdWB1xHmI=;
 b=ZLktXhwOHSpEmqllHL4wl4sUL+LbvSn4lrANbUFvLHfp/1VZKXOijKyO
 oJhqOpRU0rpiC+pLOt6+9H/ZmqC3ZyHw7cmRnWV3XdpwM7XTRKP0aAAX9
 kgecECkqBulAAQbae0FI4JNNkmuiiVp5wgaAu9T2NxzvPd1jHoGBTblgc
 +dV+fw2Mlc1bBxHvGBLtfUfPdFSLlfPw4O6DAOAHY8Y+T+LMj4p3FZBnH
 RKxv+PUGagTeEJ3gQlAZ/CUzs5yxm6ikA2yiAC1ysiI8jtjeswYDjHXP6
 evqiol7XjhIQ0RLHyQ+OrU162o9uObKahGeOlJfWeeDu4BS0kijMfCibq Q==;
X-CSE-ConnectionGUID: l/YjbO3TSqi+/CLuSvIvAg==
X-CSE-MsgGUID: kH9FjiTwQoCeJGRQTj1TLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13080592"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13080592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 00:00:29 -0700
X-CSE-ConnectionGUID: YBv7kN4xSkCwc4A71P7JmQ==
X-CSE-MsgGUID: +NAByN0NQSa6Wmjkz/k1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="61362275"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 00:00:30 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 1/2] vfio: Export vfio device get and put registration
 helpers
Date: Sun, 21 Apr 2024 23:30:32 -0700
Message-ID: <20240422063602.3690124-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
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
index e97d796a54fb..7434461fc1b3 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -165,11 +165,13 @@ void vfio_device_put_registration(struct vfio_device *device)
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
index 8b1a29820409..a6302fca8acd 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -278,6 +278,8 @@ static inline void vfio_put_device(struct vfio_device *device)
 int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
+bool vfio_device_try_get_registration(struct vfio_device *device);
+void vfio_device_put_registration(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
-- 
2.43.0

