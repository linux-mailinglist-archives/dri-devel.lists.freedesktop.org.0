Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C68B117BD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E4810E9BD;
	Fri, 25 Jul 2025 05:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXthocg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DDE10E9BB;
 Fri, 25 Jul 2025 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419909; x=1784955909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2OG1aLWksg79OWf72wBnQqlb9eg99rnOoVoJC3JUfQI=;
 b=YXthocg17dGadjIQuHQi+xeLfGxbh5Dw5XhG3GYumh05DjMgAxZHEZeR
 UyMD7tU/cwvLXX0x4ORLkL/Tws2dyqVfFmUjzI33t8YMyy0ooJ+vP9+sK
 Dj6v0xETbxncaV05VyaR73FphKIMUqaN0wokeRtWZMJE6X3eKuk6p1XX1
 X3PhI3DQDCBgtyIfUqBKibFGnLH0LW2O0SeeF98j+6Rx8yiejF47U4Mpd
 s/w6zxpCCqxPkqYaBom6mSQyeUaQZME7s/Xg63b2rArZvbJ07vemT6+/B
 UNI6RUHclAk4/xs4QgMHxElS3meto1d8EjFldApzTF96S1RLq992VpaKK g==;
X-CSE-ConnectionGUID: f0cmGRxNQSWDLLTPg34uOQ==
X-CSE-MsgGUID: DQG+zet7RYOIh4y9/mJJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299565"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:08 -0700
X-CSE-ConnectionGUID: H73n1rbTSge1tyxv/zKjsw==
X-CSE-MsgGUID: Zq4dn3j2Q0CLUV4cKOo3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956768"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:06 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 23/28] drm/i915/writeback: Configure WD_SURF register
Date: Fri, 25 Jul 2025 10:34:04 +0530
Message-Id: <20250725050409.2687242-24-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Get the ggtt_offset of the drm_framebuffer which needs to be
written to the surface base address bits of WD_SURF register.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c     | 3 +++
 drivers/gpu/drm/i915/display/intel_writeback_reg.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index c6c05bd3d298..0f26134beacd 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -286,6 +286,9 @@ static void intel_writeback_capture(struct intel_atomic_state *state,
 	val = DIV_ROUND_UP((adjusted_mode->hdisplay * bpp), 64);
 	intel_de_write(display, WD_STRIDE(trans), WD_STRIDE_VAL(val));
 
+	val = i915_ggtt_offset(wb_job->vma);
+	intel_de_write(display, WD_SURF(trans), val);
+
 	val = 0;
 	val |= START_TRIGGER_FRAME | WD_FRAME_NUMBER(wb_conn->frame_num);
 	intel_de_rmw(display, WD_TRANS_FUNC_CTL(trans),
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
index f526af0f9aff..403f9b64015b 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -81,6 +81,8 @@
 #define WD_SURF(tc)			_MMIO_WD(tc,\
 					_WD_SURF_0,\
 					_WD_SURF_1)
+#define  WD_SURF_ADDR_MASK		REG_GENMASK(31, 12)
+#define  WD_SURF_ADDR(val)		REG_FIELD_PREP(WD_SURF_ADDR_MASK, val)
 
 #define _WD_IMR_0			0x6e560
 #define _WD_IMR_1			0x6ed60
-- 
2.34.1

