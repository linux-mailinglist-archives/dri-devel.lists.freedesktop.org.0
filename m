Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B1C0AEE0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7110E304;
	Sun, 26 Oct 2025 17:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rlp2Lj6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07AE10E30B;
 Sun, 26 Oct 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761499865; x=1793035865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DRQzP2eeKjXHGttA2dudNw06ccPznayKGZk3JlzEEOA=;
 b=Rlp2Lj6jR+eaQxTACUnhN69pMelBzq8TVk52v04iHZYMEYspvYOJsVdi
 BQPr9/gcQtNgY4q4LtLvSFhYQSxjw02Zt+Ol2/rlUsViZUUhCHSdWDxg/
 Dl7/Z+VZH9RZkrGpG0dt1HIiIVtBp57kybaqU5rsel2SZ//QlmgoF3hXm
 hE9wbSXuzrzBYOmNPuJSIh9hz1/90yXGmHkHFx25tY6fkLFB3Fc78kO/5
 u7doyOH4WP64o+LYOL+Bg8ckWoOMFkkQB3ZS0KJ9KzSOPaKOooWUky63G
 uEsG7khx1fBtQa97TiakAD8tk5FKrZu4Fv5iVi9g7Ne8wbKpYiPZMw1za A==;
X-CSE-ConnectionGUID: 9IjV/VV1RsuGegfCiOweyA==
X-CSE-MsgGUID: LmnvX6nRSVSDw1TbfnzWGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63629682"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="63629682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 10:31:05 -0700
X-CSE-ConnectionGUID: PKinA8HNQT6GU3AL6lc1ew==
X-CSE-MsgGUID: ZsRrKkQQQhaW9ti+bIB/Nw==
X-ExtLoop1: 1
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 10:31:03 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Sun, 26 Oct 2025 22:56:27 +0530
Message-Id: <20251026172628.2705365-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251026172628.2705365-1-nemesa.garg@intel.com>
References: <20251026172628.2705365-1-nemesa.garg@intel.com>
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

Expose the drm crtc sharpness strength property which will enable
or disable the sharpness/casf based on user input. With this user
can set/update the strength of the sharpness or casf filter.

v2: Update subject[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index d300ba1dcd2c..802ae5aaece1 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -395,6 +395,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(display))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.25.1

