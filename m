Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77888A21D68
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B7910E7F6;
	Wed, 29 Jan 2025 13:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja/1nmPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296910E7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155599; x=1769691599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rAkI2qXyEfTaJdhzacuwKSq9PbcuHSbvMHejL27Jnac=;
 b=Ja/1nmPblODFL0SV0cgtnSbZqS/R0KkVjmG75trf9+zEubEgFzCGdwYG
 VzpJAZGThwdlucGPs2aVdCuoTZCS99JtzeyLwrDvSd6UftchNdKj7J/Qq
 pLMM2yBt4YoqZV5MubdoiChAHTu6TMoVG7PPmIIbmBw3Ji2tzwEo0WZEz
 gtkBl1ZIXoQK/gsYI3cFfUmsYodGFREsubw6bGg+6KxsJZbZKuVjUXE6X
 kDmbr7I4wuEj8d1+mM82ViFJaMuVjlOsuxHyhN38c6S+kke94e9V3w5aN
 RG5Be0GN3SdfVHOwZXG8MiWYuADkh/ENT+c+64vPSYA3FFyiWO+rA4NLj g==;
X-CSE-ConnectionGUID: djLr8txQRN6Tn180l5heog==
X-CSE-MsgGUID: aCUhTOyLSfS4JfCfCk9jqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080759"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:58 -0800
X-CSE-ConnectionGUID: /GH9yU2QQ5mjbGooeeqo6g==
X-CSE-MsgGUID: tnRIEZinQMS9J5hc5aEODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109937352"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:46 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 4/6] accel/ivpu: Turn on HWS by default on all platforms
Date: Wed, 29 Jan 2025 13:56:34 +0100
Message-ID: <20250129125636.1047413-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Hardware scheduling (HWS) is supposed to be supported on all existing
platform with recent FW including pre-silicon ones. Turn on HWS by
default.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 6cf1fb826d1ba..cfe8f79ec5a6f 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -148,15 +148,7 @@ ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_he
 	if (IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, JSM, 3, 24))
 		return VPU_SCHEDULING_MODE_OS;
 
-	switch (ivpu_device_id(vdev)) {
-	case PCI_DEVICE_ID_MTL:
-	case PCI_DEVICE_ID_ARL:
-	case PCI_DEVICE_ID_LNL:
-	case PCI_DEVICE_ID_PTL_P:
-		return VPU_SCHEDULING_MODE_HW;
-	default:
-		return VPU_SCHEDULING_MODE_OS;
-	}
+	return VPU_SCHEDULING_MODE_HW;
 }
 
 static int ivpu_fw_parse(struct ivpu_device *vdev)
-- 
2.45.1

