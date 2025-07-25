Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E3B117A8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2784210E440;
	Fri, 25 Jul 2025 05:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYKe1Xts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F2C10E442;
 Fri, 25 Jul 2025 05:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419886; x=1784955886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKCR2fX7egl7H6r3aUFK3LWqkzPF7novZPHH1HctEB4=;
 b=nYKe1Xtso1wMtpHvJCnIh9b61dXde+SKR/VsQxmmfKJWvCKEb/De54Bn
 Bt697T0ob1wSMtjo3PDFx66pjEJUtxblLRD3QjfC5s8rwdyqcMRlcSYd7
 Rh0hU8ErYRc+cVEb+4FYVnLUD15o7F5OSVuaOK1t4h9yt8IWo/8Nc30hQ
 654NbTkIQ9ELkqBTVx3ZhbAUQlRbwRzLk54tWeELlAweUBcRMuP7xNtvi
 PdbUbfWI9gSFY0I+KXuCROM71t2I2Z4zb/VHcTWzcU8jc9ppOP2f6rRcj
 9OJFss+b2y+lfpEhrK9KERgVoPvWMSl0llGP7K6B2Wq4WdHPZdAD+ncGK Q==;
X-CSE-ConnectionGUID: +uGV1ywqT8W+BnZphD6wUA==
X-CSE-MsgGUID: hQnT6eqtToySeBMz/1uCwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299544"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:46 -0700
X-CSE-ConnectionGUID: nG1WgdZGS2mh9fs+hddr4w==
X-CSE-MsgGUID: W6zINykRR9OA8DwvAXbUUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956624"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:44 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 13/28] drm/i915/writeback: Add private structure for writeback
 job
Date: Fri, 25 Jul 2025 10:33:54 +0530
Message-Id: <20250725050409.2687242-14-suraj.kandpal@intel.com>
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

Create intel_writeback_job to track drm_writback_job and other structure
we might need to complete the writeback job.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 674cc4ecf1b9..8d24b1ee0a2a 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -25,10 +25,17 @@ struct intel_writeback_connector {
 	struct drm_writeback_connector base;
 	struct intel_encoder encoder;
 	struct intel_connector connector;
+	struct intel_writeback_job *job;
 	enum transcoder trans;
 	int frame_num;
 };
 
+struct intel_writeback_job {
+	struct drm_framebuffer *fb;
+	struct drm_writeback_connector *wb_connector;
+	struct i915_vma *vma;
+};
+
 static const u32 writeback_formats[] = {
 	DRM_FORMAT_XYUV8888,
 	DRM_FORMAT_YUYV,
-- 
2.34.1

