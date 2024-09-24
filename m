Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8272984030
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2653410E663;
	Tue, 24 Sep 2024 08:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbRN+5MK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4210E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165914; x=1758701914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TnvsmJcPiXuRyZW1h74XjR37Iz6G6vVbwTQESFZ0rHI=;
 b=QbRN+5MKjcbu5hVqIs9EDJ97Col/xFvzhBr96VsIAdGz/Yd/wEwc/TJH
 lRZ+Srse5B5F28XRlH0fCugKH4sawL/d26ygdbbgb6H0l+asCIkTDvxN6
 L1h00LaGqp21F7z6XYfTFqNTnIIZ+kVsNV2Y4VWEOdlzB1YdFqgpnDENw
 kobGbIN/WppjviAAG/MaNQRJ8Kx3tD3XlgfN6MmFPnZ1RJGidYNPKAZpE
 m7hfbBlCQY3jFGchJDR7vxoldd+zEVGZt8SRfirpPliRR5QFztRF+Bidg
 si0ow/CanbiXd2h1V7ZjDl587TnFZjDRW6WG4aVLcHJ9PJZhnrXk8nPjd g==;
X-CSE-ConnectionGUID: TvMumvJxRKKUpFI4IXtFfw==
X-CSE-MsgGUID: iO84EGrrRz2vvy9dHSoGzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506954"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:33 -0700
X-CSE-ConnectionGUID: OtcZmgXaSv+nEFL6Wq5uXg==
X-CSE-MsgGUID: DXfQajAORgCZVTj8sMDcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170704"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:32 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 13/29] accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
Date: Tue, 24 Sep 2024 10:17:38 +0200
Message-ID: <20240924081754.209728-14-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Add one jiffy to ensure wait function never times out before
intended timeout value, which could happen if absolute timeout value
is less than (1s / CONFIG_HZ) in the future.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 1b409dbd332d8..d8e97a760fbc0 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -384,6 +384,9 @@ int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 
 	timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
 
+	/* Add 1 jiffy to ensure the wait function never times out before intended timeout_ns */
+	timeout += 1;
+
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj)
 		return -EINVAL;
-- 
2.45.1

