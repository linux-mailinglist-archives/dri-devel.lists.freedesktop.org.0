Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B038950CC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B8F10FC4E;
	Tue,  2 Apr 2024 10:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azvptlde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338610FC51
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055019; x=1743591019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=63oC4L6ipoRBRt+/3CeJ2uY/xkqUp+6LHT6UbPigB/A=;
 b=azvptldez4MItLj/6Os/TspAXgNqPQHz4+AE9/Sbw/PxPWRoSzJVv+bF
 qpHSrP0Se0pX7Ds2BwAkQxGPNszw7J3IPW1EaQENm005d4YGQfPucxV1+
 0kJfcRqlLSHK7fxDGABMm7XMYcOcJ+kNj+GsT/td57xbqhPPALIA3+ChA
 9WsZwa3KdSN+Zd44YWqzQ2QOynEfUuwHMwb1Olu4ve7LGsK+XeJ/W/64u
 35tYA/m8tB48zV6EGJSfHAD1qnVeP77uWahadY+ZZrDNoFy3huihGXb4j
 0vMPPES9OST47X0goKSHK9aMn5/IpiKB5cbOxzXeh0xIAPDb4IHRnx83x Q==;
X-CSE-ConnectionGUID: COVQMpvNRTWNEOnRdu6I2w==
X-CSE-MsgGUID: CkJkKAMTRmCdyWPkpsOXBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944470"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002551"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:18 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 8/8] accel/ivpu: Fix deadlock in context_xa
Date: Tue,  2 Apr 2024 12:49:29 +0200
Message-ID: <20240402104929.941186-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

ivpu_device->context_xa is locked both in kernel thread and IRQ context.
It requires XA_FLAGS_LOCK_IRQ flag to be passed during initialization
otherwise the lock could be acquired from a thread and interrupted by
an IRQ that locks it for the second time causing the deadlock.

This deadlock was reported by lockdep and observed in internal tests.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Cc: <stable@vger.kernel.org> # v6.3+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 77283daaedd1..51d3f1a55d02 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -517,7 +517,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
 	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
 	atomic64_set(&vdev->unique_id_counter, 0);
-	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
+	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
 	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
 	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
-- 
2.43.2

