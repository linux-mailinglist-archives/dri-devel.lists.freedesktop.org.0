Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70BEC47D94
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A8110E431;
	Mon, 10 Nov 2025 16:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sgax9jiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3401510E42F;
 Mon, 10 Nov 2025 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791474; x=1794327474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7tRzDjly9ayEiizg1rHgxaxzRNj3SFectyVgo3EZjHE=;
 b=Sgax9jiOG9tkV1Lgc7w+XLZtlDJg8/yj4bu1RU2DFfDawr6UlbWNNQRe
 Ex6FWOjudnbTx4W0IIIKHmdKgud7VnKhrlvV5y1kxdXC9HEvQAvmzntbR
 qUTNRI3yZ00K+rxZPYSkg/QnuNyUUc7gS0oQ5z+UopteBaRvl6LQGZLkh
 QC05u4fmH1KvOoErTJYu2oMkw38PSoCp1aY3G20qZ/fRcM+MvmWcMJSb+
 qQwKu531Q8qlFt4BFvrCpv/dqFrX5PyAP/m9miS3ZA1zNyRe2rm77avwN
 MUbyzt8TDuATlD2OoNLFmiHisxUq1kjCas/ZWdlnLI+LqZVxcca3knJzV A==;
X-CSE-ConnectionGUID: eO80VqRRTFu6rcKygCll4A==
X-CSE-MsgGUID: 0MtEEafqQ2KMJVbsFjYhZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76294722"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76294722"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:54 -0800
X-CSE-ConnectionGUID: HA8omBAKQ86atHjoac2zPA==
X-CSE-MsgGUID: XhbzwDsDTdGYDD8s8I+arw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193897363"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/24] drm/vblank: Unexport drm_wait_one_vblank()
Date: Mon, 10 Nov 2025 18:17:19 +0200
Message-ID: <006a8dcc17c710a889a0a0e2ede5ebc2c13698e1.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Thomas Zimmermann <tzimmermann@suse.de>

Make drm_wait_on_vblank() static. The function is an internal interface
and not invoked directly by drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 14 +-------------
 include/drm/drm_vblank.h     |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 32d013c5c8fc..c15d6d9d0082 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1286,18 +1286,7 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
-/**
- * drm_wait_one_vblank - wait for one vblank
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This waits for one vblank to pass on @pipe, using the irq driver interfaces.
- * It is a failure to call this when the vblank irq for @pipe is disabled, e.g.
- * due to lack of driver support or because the crtc is off.
- *
- * This is the legacy version of drm_crtc_wait_one_vblank().
- */
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
+static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
@@ -1321,7 +1310,6 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 
 	drm_vblank_put(dev, pipe);
 }
-EXPORT_SYMBOL(drm_wait_one_vblank);
 
 /**
  * drm_crtc_wait_one_vblank - wait for one vblank
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index ffa564d79638..94ee09b48895 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -302,7 +302,6 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
-- 
2.47.3

