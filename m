Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993FC3A1C7
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBDA10E87A;
	Thu,  6 Nov 2025 10:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRzpA71u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612A10E879
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423870; x=1793959870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHRgJUV7fw11PCL9ZjuhSLK792/6NscEF0NKWyyp2ek=;
 b=YRzpA71uQQ/W/1eablEdjI/tQ6/q1/l/wDYNr7G2DyucJS2yzI9UmhKY
 Pc9+6yQ6LGQ2zhME1JQ0by7vPROdlk5nW5bEnlN9+0hU4QEsIyRaxkkTU
 OHmcVWRl5zVH4Z+ubRcscbR/06RyMrSfAllyVW/bHeANWVnWFx7TKznNd
 GCwpUZtA/t+2UEUgr7+sC7t1qSpgDuUiibo/vUtDeYm8QfWVgFTohqzvo
 qTtnm9feHW0inQ1ecFX+OL/Rb5C/JSyWNx2jnKwozX73p+acDah1MIVX0
 iVfE3D6XYeubZHlc2dfDGLBWfHlR7lnQ4/wkSY66/oEDzYEcP7wA5A9Q4 A==;
X-CSE-ConnectionGUID: MWTR7u5TQDW84rL7yFdcMQ==
X-CSE-MsgGUID: RfJCPE4cSh+jr1jek9xdMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81959765"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81959765"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:09 -0800
X-CSE-ConnectionGUID: Em48tqKYRGqmVqDoZuAT9g==
X-CSE-MsgGUID: sxn4ftVfR/OSILirmtSOxg==
X-ExtLoop1: 1
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:07 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH 2/2] accel/ivpu: Count only resident buffers in memory
 utilization
Date: Thu,  6 Nov 2025 11:10:52 +0100
Message-ID: <20251106101052.1050348-3-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
References: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
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

Do not count buffer objects that have no backing pages, including imported
buffers where pages are set by VM faults triggered by userspace or pinned
by other drivers. Instead, return information about actual memory used by
the NPU.

Counting imported buffers results in incorrect calculations when
the same pages are counted multiple times, giving overly high
results.

Fixes: 7bfc9fa99580 ("accel/ivpu: Expose NPU memory utilization info in sysfs")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
index 268ab7744a8b..d250a10caca9 100644
--- a/drivers/accel/ivpu/ivpu_sysfs.c
+++ b/drivers/accel/ivpu/ivpu_sysfs.c
@@ -63,7 +63,8 @@ npu_memory_utilization_show(struct device *dev, struct device_attribute *attr, c
 
 	mutex_lock(&vdev->bo_list_lock);
 	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
-		total_npu_memory += bo->base.base.size;
+		if (ivpu_bo_is_resident(bo))
+			total_npu_memory += ivpu_bo_size(bo);
 	mutex_unlock(&vdev->bo_list_lock);
 
 	return sysfs_emit(buf, "%lld\n", total_npu_memory);
-- 
2.43.0

