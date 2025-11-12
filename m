Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB7C50E45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20310E19A;
	Wed, 12 Nov 2025 07:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrH8a+LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D52A10E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762931974; x=1794467974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZoSneIx3CL+DD4GV9qk1gWxDKeyeAb1IXRMrB9uVmeQ=;
 b=MrH8a+LNgplz+EknIgCe84fF4Ls5dOjhxmIR/JoZkgKYzZUi39ZmGdbc
 x8Wp+QPUyBr8Ba7Cqne8wkdP9w0rMdj2oa9jSF6CeUp7A3tSyvbE/BBrT
 eb27MDSUuv0S8Ef+B5/QEPN2xg13K3zB3apAmePp+unZI4ADDJ+9Bpd0X
 R2nh7FZWs5NdSBAOp+vE12wGd5LBWL1rU6/vYwffOuHUvgHtAHDqQy206
 6WwKxbPbRr7W3kHW9KqVoIHVAboocnY/pUIRwmM37iQTdk4262QyrhPvC
 +TDKOQSuD9JpE/W44U/8ul+qTMuaANmHl5omnm3kpXwXlhEENnwcGk5JH g==;
X-CSE-ConnectionGUID: ps/sePGoR4SKC30rPSejIg==
X-CSE-MsgGUID: AjosLu3cROWsIyfxmwqieg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76448744"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="76448744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 23:19:32 -0800
X-CSE-ConnectionGUID: Ncdoi9GyRziWwbA146RDYw==
X-CSE-MsgGUID: aD3Ok7UKSXedFItfJMPa7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="189406414"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 23:19:16 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS
Date: Wed, 12 Nov 2025 08:19:11 +0100
Message-ID: <20251112071911.1136934-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Change #if to #ifdef CONFIG_PROC_FS to fix warning reported by test robot:
drivers/accel/ivpu/ivpu_drv.c:458:5: warning: "CONFIG_PROC_FS" is not defined, evaluates to 0 [-Wundef]

Fixes: 63cc028484ab ("accel/ivpu: Add fdinfo support for memory statistics")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ce7dbd473059..3d6fccdefdd6 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -455,7 +455,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 static const struct file_operations ivpu_fops = {
 	.owner		= THIS_MODULE,
 	DRM_ACCEL_FOPS,
-#if CONFIG_PROC_FS
+#ifdef CONFIG_PROC_FS
 	.show_fdinfo = drm_show_fdinfo,
 #endif
 };
@@ -472,7 +472,7 @@ static const struct drm_driver driver = {
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
 	.fops = &ivpu_fops,
-#if CONFIG_PROC_FS
+#ifdef CONFIG_PROC_FS
 	.show_fdinfo = drm_show_memory_stats,
 #endif
 
-- 
2.43.0

