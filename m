Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E158C8A25
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5D10E3BB;
	Fri, 17 May 2024 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVPiOBIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CB410E313;
 Fri, 17 May 2024 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715963675; x=1747499675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pYqRiirUIrprG0rOBJNKhIZxAlmsn0IIJjcB5zYHhLY=;
 b=GVPiOBIjDxuiyUU4SuOWsVzS7JhssREugfh4NmJtOBrP0+gXTCdwdf15
 fSjv2CU/fz6kzP42fJ7iK5MinKXwAkOjvvXkjQ7J0hBrmczebhxcXULI0
 07QsHGSRLWjK5b6NFCKfncsbUZyUE/VemNUbYuIAwcLwq4U03AKhTojhy
 Fc3JTj7c10K7B+OJ7qGqJA97oda6kW+DTceR1y5NWLG3kZeYW4AJNOmqV
 gGt0Pn4XE5czlhiQW2wL2rtqGn8dqXDibV/E2AZovW3Uaam40p2Fht4qw
 3wczLe0FLIvuzPrGR7M6V2X6Cdz/vyCJtCg9YhyP7EXsg/O10rbI50jQ4 w==;
X-CSE-ConnectionGUID: 26Orh6m/RU2awal6rVR5Fg==
X-CSE-MsgGUID: N6kOkkVwRWOtdKjbwORXBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12022127"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12022127"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:24 -0700
X-CSE-ConnectionGUID: cb/2nweUTAqb6j+nucgvsg==
X-CSE-MsgGUID: eevCYixrSGyTONx+5uFPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31986756"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 2/3] drm/print: Improve drm_dbg_printer
Date: Fri, 17 May 2024 18:34:05 +0200
Message-Id: <20240517163406.2348-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240517163406.2348-1-michal.wajdeczko@intel.com>
References: <20240517163406.2348-1-michal.wajdeczko@intel.com>
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

Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: use full cast to match member (Jani)
---
 drivers/gpu/drm/drm_print.c | 3 +--
 include/drm/drm_print.h     | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 41892491a12c..35d00f0c6d64 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -217,8 +217,7 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 	if (!__drm_debug_enabled(category))
 		return;
 
-	/* Note: __builtin_return_address(0) is useless here. */
-	__drm_dev_vprintk(dev, KERN_DEBUG, NULL, p->prefix, vaf);
+	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_dbg);
 
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 089950ad8681..bfc5641c6025 100644
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
+		.origin = (const void *)_THIS_IP_, /* it's fine as we will be inlined */
 		.prefix = prefix,
 		.category = category,
 	};
-- 
2.43.0

