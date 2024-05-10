Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65528C29BA
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 20:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018010E483;
	Fri, 10 May 2024 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma/9SMYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53110E483;
 Fri, 10 May 2024 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364747; x=1746900747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOdMGkt1pE4JZ4dTIickAcM6vbLA2B7HtpO6Zb9evtE=;
 b=ma/9SMYnhvWhxK527c+lj3RFP7mc/iRiuboVje5No0M6QxqchE+hEkfQ
 Ohl1QREYDBKjvWK04kYp8w1BW500hjYMzszUIQvMrbDL1eo1fvunHCAYl
 80BmfMdMgJNyhBH3kxYI04ygetnAugKK31YF9l1peLeYa9xn2n60tz4+1
 yYSo5EGvs7I2s4hgAdzvD5pcz6ELJYO0epoi/TJMXtHrB/zGba6vmCAHB
 FMwf0NcHNcuZDU3bvxkNCZGaOlwi6CxHBEVyN1jbApzu1Fd89v0w8gsfH
 TBlY9hqH7lwQWVghXKR5bdBFWyJV5sdpISmSRI+QABDS4k/eqrhayYjvA A==;
X-CSE-ConnectionGUID: 7cy9AU04SFid94fU7bXUeA==
X-CSE-MsgGUID: Q++5GWqjQ8qE76R0+vO3ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844558"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:27 -0700
X-CSE-ConnectionGUID: zPOKtM6NQhSvvTWFn2zv0g==
X-CSE-MsgGUID: toKbm9J+RpOvvga7oP+kqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544049"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/20] drm/drm_managed: try to improve the drmm DOC
Date: Fri, 10 May 2024 19:12:14 +0100
Message-ID: <20240510181212.264622-23-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Hopefully make it clearer when to use devm vs drmm.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_managed.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 7646f67bda4e..20d705bbc0a3 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -34,6 +34,48 @@
  * during the lifetime of the driver, all the functions are fully concurrent
  * safe. But it is recommended to use managed resources only for resources that
  * change rarely, if ever, during the lifetime of the &drm_device instance.
+ *
+ * Note that the distinction between devm and drmm is important to get right.
+ * Consider some hotunplug scenarios, where it is valid for there to be multiple
+ * unplugged struct &drm_device instances each being kept alive by an open
+ * driver fd. The driver needs a clean separation between what needs to happen
+ * when the struct &device is removed and what needs to happen when a given
+ * struct &drm_device instance is released, as well as in some cases a more
+ * finer grained marking of critical sections that require hardware interaction.
+ * See below.
+ *
+ * devm
+ * ~~~~
+ * In general use devm for cleaning up anything hardware related. So removing
+ * pci mmaps, releasing interrupt handlers, basically anything hw related.  The
+ * devm release actions are called when the struct &device is removed, shortly
+ * after calling into the drivers struct &pci_driver.remove() callback, if this
+ * is a pci device.
+ *
+ * devm can be thought of as an alternative to putting all the hw related
+ * cleanup directly in the struct &pci_driver.remove() callback, where the
+ * correct ordering of the unwind steps needs to be manually done in the error
+ * path of the struct &pci_driver.probe() and again on the remove side.  With
+ * devm this is all done automatically.
+ *
+ * drmm
+ * ~~~~
+ * In general use this for cleaning up anything software related. So data
+ * structures and the like which are tied to the lifetime of a particular struct
+ * &drm_device instance.
+ *
+ * drmm can be thought of as an alternative to putting all the software related
+ * cleanup directly in the struct &drm_driver.release() callback, where again
+ * the correct ordering of the unwind steps needs to be done manually. As with
+ * devm this is instead done automatically.
+ *
+ * Sometimes there is no clean separation between software and hardware, which
+ * is where drm_dev_enter() comes in. For example, a driver might have some
+ * state tied to a struct &drm_device instance, for which the same cleanup path
+ * is called for both a plugged and unplugged device, and the cleanup itself
+ * might require talking to the device if it's still attached to this particular
+ * struct &drm_device. For that we instead mark the device sections.  See
+ * drm_dev_enter(), drm_dev_exit() and drm_dev_unplug().
  */
 
 struct drmres_node {
-- 
2.45.0

