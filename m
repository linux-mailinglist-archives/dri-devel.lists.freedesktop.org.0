Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1528543D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8A210E3FC;
	Wed, 14 Feb 2024 08:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmcWj4cm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8AC10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898392; x=1739434392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pw/jgyeQp4EnqOSLDOpKLLh+AEHTjDlBu1RG/K9EjNU=;
 b=EmcWj4cmmWgwkKUypowAmUeB8GfbM0LRG088nUABm/3SyuVpWONWMc1T
 lEZqq0aAqMmCqoDOCKn/lLJGO8TI6H5xm+T5zJ+aK94u6i/6lgy99OnMV
 0V9j0OR5TsvFsLvJo2izzpxdnSKPUb+F4kQHCuQQ3z2luMbdYBcKRupVM
 j4TdWSKV6tUHjAT7MJJZrYFKUNNs3egzaeFLE2TOIsOxn09qvR/kALG5e
 yupTTWQN9tGPUnM38GXVIHHSSshcSb2LyHxIPdr2zvz3RDBBaRz3VneSp
 vn7qGJKlVvpLTtDsTbNHNq7CI9w6+pJMLsKoVq5xoJ2fY8IHFFCZp1yuC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651650"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651650"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407372"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:10 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 2/8] accel/ivpu: Remove legacy firmware name
Date: Wed, 14 Feb 2024 09:12:59 +0100
Message-ID: <20240214081305.290108-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

We are now using NPU IP generation based FW names instead of platform
code names, so mtl_vpu.bin can be removed.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 6576232f3e67..186d0857410c 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -48,13 +48,11 @@ static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
 MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
 
-/* TODO: Remove mtl_vpu.bin from names after transition to generation based FW names */
 static struct {
 	int gen;
 	const char *name;
 } fw_names[] = {
 	{ IVPU_HW_37XX, "vpu_37xx.bin" },
-	{ IVPU_HW_37XX, "mtl_vpu.bin" },
 	{ IVPU_HW_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
 	{ IVPU_HW_40XX, "vpu_40xx.bin" },
 	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
-- 
2.43.0

