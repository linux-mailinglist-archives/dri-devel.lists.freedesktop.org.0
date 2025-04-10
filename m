Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39695A8471C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2392710E9E1;
	Thu, 10 Apr 2025 14:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtFqsOry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B590C10E9E0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297151; x=1775833151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z6GgVa7+teHw13e28uu78eYJ8vhUs3VWBL9/7/SRxzQ=;
 b=YtFqsOryMskMp/UalqhkSd2fRgMw0wAYC/7MMX9Jhbv664XpZHB9xwDp
 JmhqulXXQ3FwJElfYjIpckh5zmnEbSRl4rBJHW6NwOwh7RmzBrm9XdFId
 eHNEBSVBLXwqVffzfeeFix/S5K8lB6Qj2tci0N5e/IIHsWhS3Jj6I1XT5
 7D1SZ3EE2qdZA8AbuFAa42eriDCkxUcov+2WBYhZO6jorVBZdCIrMOIg7
 KhzLHPtfjoTiWzLwe+vfdhtgvyG79C7df46hs4V+LiH5nTFIZJI1uXM2A
 9fEHAAkvjytsB5AfiDUB/7Lz0YvFVxcM1svCp+vOmLC8NPWnrZGAm/bI9 w==;
X-CSE-ConnectionGUID: 64BNAogSTSuWlEWo7pQJ+Q==
X-CSE-MsgGUID: RlHxHgksTFaXfybseBzBgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208118"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:11 -0700
X-CSE-ConnectionGUID: c4J4jVkKQSqUD1+W9E4Fig==
X-CSE-MsgGUID: LLYTJHAVSa+D153i5mmY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134101979"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH v3 1/6] drm/tilcdc: Allow build without __iowmb()
Date: Thu, 10 Apr 2025 17:58:59 +0300
Message-ID: <20250410145904.25550-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
References: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

__iowmb() isn't available on most architectures. Make
its use optional so that the driver can be built on
other architectures with COMPILE_TEST=y.

v2: Add a comment stating this is for COMPILE_TEST (Tomi)

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457c..332b24327386 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -125,7 +125,10 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
 	iowrite64(data, addr);
 #else
+	/* allow compilation without __iowmb() for COMPILE_TEST */
+#ifdef __iowmb
 	__iowmb();
+#endif
 	/* This compiles to strd (=64-bit write) on ARM7 */
 	*(volatile u64 __force *)addr = __cpu_to_le64(data);
 #endif
-- 
2.49.0

