Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4A59915C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269FF10E984;
	Thu, 18 Aug 2022 23:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238710E4AD;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866152; x=1692402152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+BC0pGox85s/Y1k2svVzfOOL7sQFLvwgH9Tt+lPVt4=;
 b=dxypI3Ti6NDI9BybsW6jLruMrX0ZrHA09Byl5IsnySlFd6gtIzZaqWjU
 bFMNBe4SE7r+LlOyOrP4mdH1aVdsfDCQCMF3fecvVgiVUwYo/wiUVV3eR
 0iL0P3CkfAIcXcnW2XqoKLF73BrrFMXFW8KUTMxr4lj88zTtYzECJURzf
 FwYo3kUcy8PTcTZjaVB/U3DB4m2zqvC9IFPR77IakrEfgoNjlYMkwpBCm
 zAGRBKQdbbzXrtiV+OoRxtBzMz9oY8/dxkpQau0DXjzbSII8D0qUF8Gpr
 fgGw3xKWuVfLopxFC3SwEvdQUiHb30ocXEolWICKHThrdwUsbK2+EOG3O Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938523"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938523"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953297"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/21] drm/i915/mtl: Fix rawclk for Meteorlake PCH
Date: Thu, 18 Aug 2022 16:41:53 -0700
Message-Id: <20220818234202.451742-13-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Clint Taylor <clinton.a.taylor@intel.com>

MTL has a fixed rawclk of 38400Khz. Register does not need to be
reprogrammed.

Bspec: 49304

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 86a22c3766e5..1ee61abd40bc 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3036,6 +3036,13 @@ u32 intel_read_rawclk(struct drm_i915_private *dev_priv)
 
 	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		freq = dg1_rawclk(dev_priv);
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_MTP)
+		/*
+		 * MTL always uses a 38.4 MHz rawclk.  The bspec tells us
+		 * "RAWCLK_FREQ defaults to the values for 38.4 and does
+		 * not need to be programmed."
+		 */
+		freq = 38400;
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_CNP)
 		freq = cnp_rawclk(dev_priv);
 	else if (HAS_PCH_SPLIT(dev_priv))
-- 
2.25.1

