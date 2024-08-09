Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C6C94C783
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 02:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34AA10E835;
	Fri,  9 Aug 2024 00:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzDFCsel";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182C210E82E;
 Fri,  9 Aug 2024 00:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723162008; x=1754698008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sgWT0C1e6mNVgtU6hTXyIuwBguenbIfIqlvhnDxPODU=;
 b=YzDFCseliMmj77rypobv2GFgZCKdlDWD0yGzf61IPITa8AqCCcJX0Bin
 lHavnidoXeJPfOkpBIHkbq/+uyZ1/u5ywUqXcss+ejPqq/h8BkUCvkkhl
 ZgyGTaYBT/hw9K25L66UyZdEKp3ENTuJTgptVAHpG2I384fG41NMz37cL
 xqokDJv1+OB0vxvrIrdL8DjqFhdzXx95+70OXPPxf5eJM9fY+eUaBBhjK
 xPxpCeTIoC0hrIfeXwNEZ2ZMQzgUGjQV4Xg7iOvUf1oyPh+0UE6TLmtNw
 YKNsrzR9DPnoG6anMFd8w7q/kjL1dXmGBsT5CHXI2lxju7OagVvxiOKda g==;
X-CSE-ConnectionGUID: /S1cB+e0SN6j1voR2HoBDQ==
X-CSE-MsgGUID: NVjhk1N+Rt2ekdK9JZ/Rfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43835806"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="43835806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 17:06:47 -0700
X-CSE-ConnectionGUID: goIRT5viSOm7yW+dfRsxzg==
X-CSE-MsgGUID: i7l/YfPDSPKGrGW06rebTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57348475"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa008.fm.intel.com with ESMTP; 08 Aug 2024 17:06:47 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/i915/guc: Fix missing enable of Wa_14019159160 on ARL
Date: Thu,  8 Aug 2024 17:06:46 -0700
Message-ID: <20240809000646.1747507-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The previous update to enable the workaround on ARL only changed two
out of three places where the w/a needs to be enabled. That meant the
GuC side was operational but not the KMD side. And as the KMD side is
the trigger, it meant the w/a was not actually active. So fix that.

Fixes: 104bcfae57d8 ("drm/i915/arl: Enable Wa_14019159160 for ARL")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9400d0eb682b2..3e1c3bc56daf2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4506,7 +4506,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
 	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
-	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
+	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 74)))
 		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 
 	/*
-- 
2.46.0

