Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73E8C86BA
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4210EEAE;
	Fri, 17 May 2024 12:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bB8SVsoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C4E10EE9D;
 Fri, 17 May 2024 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715950669; x=1747486669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YHV9VNY9DdbukRehmlOU1kmvyVonvcsK0xGXr7QAG9o=;
 b=bB8SVsoiVRZcjGQPqPtDeHQ0U6ILAGu/SFuZ29q3juDIT2e8ODkfRyCx
 qseIg0EzW/+vZ20vgk+mIbNx9Z7e1HmZiluQFJBXrHiyHL7pctZiVfOSt
 ti9tAMtIL1ZQ9okZiFlIl8zTpf2R1pcqslbtKABzyVKwm7L0yT/0GGpJW
 1KhN/lzUjmKXFxzmADCMgVrqvrfPS50Qfi5Svs7IkqNZlHpJhE4kUspCV
 mCYLXb3f1pFDmMxPPpL0JH1VNUiTh+NpLVwfaAR4f74CsT/C1JLf6vvDK
 mY4XTvOW5/OJiHQRJ3V02IKiJVi522Tc0tUt4WjIMrIf3jjuAW1n7e0Ft Q==;
X-CSE-ConnectionGUID: TRxCDjoDSvqkUd6VWLkXtg==
X-CSE-MsgGUID: 3fegpHFZTki0WcYuigzhRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12314180"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12314180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:57:49 -0700
X-CSE-ConnectionGUID: NiymBFYeTH+LWBV6DXnjYA==
X-CSE-MsgGUID: sggb/BkYTEWCGCbSamf8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31604895"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:57:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/3] drm/print: Improve drm_dbg_printer
Date: Fri, 17 May 2024 14:57:29 +0200
Message-Id: <20240517125730.2304-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240517125730.2304-1-michal.wajdeczko@intel.com>
References: <20240517125730.2304-1-michal.wajdeczko@intel.com>
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

With recent introduction of a generic drm dev printk function, we
can now store and use location where drm_dbg_printer was invoked
and output it's symbolic name like we do for all drm debug prints.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 include/drm/drm_print.h     | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a2b60c8245a1..0a205fdee7cf 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -191,8 +191,7 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 	if (!__drm_debug_enabled(category))
 		return;
 
-	/* Note: __builtin_return_address(0) is useless here. */
-	__drm_dev_vprintk(dev, KERN_DEBUG, NULL, p->prefix, vaf);
+	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_dbg);
 
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index bb1801c58544..761ce01761b7 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -175,6 +175,7 @@ struct drm_printer {
 	void (*printfn)(struct drm_printer *p, struct va_format *vaf);
 	void (*puts)(struct drm_printer *p, const char *str);
 	void *arg;
+	const void *origin;
 	const char *prefix;
 	enum drm_debug_category category;
 };
@@ -332,6 +333,7 @@ static inline struct drm_printer drm_dbg_printer(struct drm_device *drm,
 	struct drm_printer p = {
 		.printfn = __drm_printfn_dbg,
 		.arg = drm,
+		.origin = (void *)_THIS_IP_, /* it's fine as we will be inlined */
 		.prefix = prefix,
 		.category = category,
 	};
-- 
2.43.0

