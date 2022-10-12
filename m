Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98B5FBFFA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 06:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74C10E32A;
	Wed, 12 Oct 2022 04:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F32D10E31C;
 Wed, 12 Oct 2022 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665550303; x=1697086303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4v1M05nUOxjGbYQ6sC47/OrUzmGPqCBlVIqhM2NPZU=;
 b=GRL7NQAAmUa1WSYNnC+SpRwdPlM105GU+F1tuH2NXvW60whn7Ss/4K45
 xohmUe/tF5hvYt//zbSyeu1awMy6VZrOQ/JMlFdxpe0ejmRjqQ3S5s5GJ
 nlFDrkS0eDDvfzuohH1+5fgBaD942+4M0P3vF2aqx5XYtpoTTzySfenpk
 zU/CUvUzVdSgF75Jppvl4UAtQtiuXleDYTg2O6fl6Vd8JhRyKvUxVksls
 PNxBBwZOBHsnLy4t4KOnU2quXMIdga1Xs/Kgirw9XvuMDKaQi49/OyzZz
 pngpzUBV0v82igHk10BdnObA5MBiPAOPYYvZcEAJxWodImv9NPK0iUHDD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284423458"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="284423458"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577698655"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="577698655"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/3] drm/i915: Add _PICK_EVEN_RANGES()
Date: Tue, 11 Oct 2022 21:51:08 -0700
Message-Id: <20221011-pick-even-ranges-v1-1-1aaea52752ed@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a constant pattern in the driver to need to use 2 ranges of MMIOs
based on port, phy, pll, etc. When that happens, instead of using
_PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
due to some reasons like:

	1) It increases the code size since the array is declared in each
	   call site
	2) Developers need to be careful not to incur an out-of-bounds array
	   access
	3) Developers need to be careful that the indexes match the
	   table. For that it may be that the table needs to contain
	   holes, making (1) even worse.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit 55a65ca6e5d8f7f46fe4cf29c76a9f1b4ddef5ce)
---
 drivers/gpu/drm/i915/i915_reg.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3edfbe92c6dd..d157dd693e41 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -126,10 +126,24 @@
 #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
 
 /*
- * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
+ * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced addres offsets. The
+ * @__use_first_range argument selects if the first or second range should be
+ * used. It's usually in the form like ``(pll) < n``, in which ``n`` is the
+ * number of registers in the first range. Example::
  *
- * Always prefer _PICK_EVEN() over this if the numbers are evenly spaced.
+ * #define _FOO_A			0xf000
+ * #define _FOO_B			0xf004
+ * #define _FOO_C			0xf008
+ * #define _SUPER_FOO_A			0xa000
+ * #define _SUPER_FOO_B			0xaf00
+ * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, (x) < 3,	\
+ *					      _FOO_A, _FOO_B,			\
+ *					      _SUPER_FOO_A, _SUPER_FOO_B))
  */
+#define _PICK_EVEN_RANGES(__index, __use_first_range, __a, __b, __c, __d)	\
+	 ((__use_first_range) ? _PICK_EVEN(__index, __a, __b) :			\
+	  _PICK_EVEN(__index, __c, __d))
+
 #define _PICK(__index, ...) (((const u32 []){ __VA_ARGS__ })[__index])
 
 /*

-- 
b4 0.10.1
