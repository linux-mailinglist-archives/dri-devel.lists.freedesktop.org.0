Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B54B45CD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB4A10EBF6;
	Fri,  5 Sep 2025 15:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ba3h1ekH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F77110EBF6;
 Fri,  5 Sep 2025 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757087120; x=1788623120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgk1lqclsOlLszFoOqnW3JFUcsS7Usoj1a9piG+7EIQ=;
 b=ba3h1ekHb+HmJcdpqNNdRS5dHiEDLfE4SrFyff+z6sIy0EPD75COj3jA
 mj2yFbjZnACCyyzJ+jBGJ242trSX/LMidnsgztW4ATIbFS4NhnKXm0z7N
 KnNr7GvHUPLc4a6QbrdXcEPl+tdbe1uw2TP+2aUc48A+quOPhufxeY3ND
 r7uSOdXq3K0rLJ14XNQR91nwakEAfaiMDUYQgZGWSzkvf8N+yFlM/VX18
 GBnZEh7I1sPr+wGU28amdU7YTmnzARVrsGorGZl2R8gP55frnxtN70zrJ
 BgolqewGQ7Z/KRSnSqrH6ioXua/8RzExIFc6d1SS4xgG1lRy9l2ZEeAIk g==;
X-CSE-ConnectionGUID: eKT+8gbWQKCUrS1lOetaOg==
X-CSE-MsgGUID: p/kc8TF5Re6PKd1aGjtRrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70144628"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70144628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:20 -0700
X-CSE-ConnectionGUID: odg4evxLQj6xyoAPm5P5wA==
X-CSE-MsgGUID: cEmgysSeTEGVR9bETP0cGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172071715"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:17 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, mika.westerberg@linux.intel.com,
 lucas.demarchi@intel.com, karthik.poosa@intel.com
Subject: [PATCH v9 1/9] mei: bus: add mei_cldev_mtu interface
Date: Fri,  5 Sep 2025 21:19:45 +0530
Message-Id: <20250905154953.3974335-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905154953.3974335-1-badal.nilawar@intel.com>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add a new helper function that allows MEI client drivers
to query the maximum transmission unit (MTU) for a connected
MEI client.

This is useful for clients that need to transmit large payloads,
such as firmware blobs, allowing them to determine the maximum
message size that can be safely sent before starting transmission and
size of the buffer to allocate when receiving data.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/misc/mei/bus.c     | 13 +++++++++++++
 include/linux/mei_cl_bus.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 5cc3ad07d5be..09aae8f9d225 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_ver);
 
+/**
+ * mei_cldev_mtu - max message that client can send and receive
+ *
+ * @cldev: mei client device
+ *
+ * Return: mtu or 0 if client is not connected
+ */
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
+{
+	return mei_cl_mtu(cldev->cl);
+}
+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
+
 /**
  * mei_cldev_enabled - check whether the device is enabled
  *
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index 725fd7727422..a82755e1fc40 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
 void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
-- 
2.34.1

