Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6FA4BB24
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D328510E3AC;
	Mon,  3 Mar 2025 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1AbTbTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D4210E265;
 Mon,  3 Mar 2025 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740995292; x=1772531292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tdQaaENsWJdVr6hH4KbkruhOlxCer1viA1qztXaHCRg=;
 b=W1AbTbTr1Qicb1QWYJt4lGR2ubduKq/jt0C+Gb3UGjhss4yR+Tz0IplP
 qAbLXNTQJXIAB/b9hpvrRBBaHchhuavYJREXm4jd5G2j4DCBol7nxc2Do
 CIt1pAa/2RSLMQZdHmWomBHLepIZCy9TXyZxSoQSS929VIqGK7pdW9Klg
 FogdfPhPPnNYJOcyrOfjpR6uyVw5KV44q9eId7VN53ULrl7xBcZD/klZ8
 PWj+2sodj8VvTGU75JsKOFpUUcNOMo5gfW2BZx9ehh0pEftweQzq9KP6p
 q1MoX3tPS6ExNAlKcjT+xzWWUQe5XRxFT51djp3xTocyZk7EnIUMKqPGy Q==;
X-CSE-ConnectionGUID: Aod96dy8QlG6I+Ih23/BdA==
X-CSE-MsgGUID: TZtfE0CLR5KeD3PITmP2rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59407286"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="59407286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:48:12 -0800
X-CSE-ConnectionGUID: y6BZH9aAQzCpQWMTCVKgqA==
X-CSE-MsgGUID: rc5+/UDBS6e5Gh/cJrCbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123172792"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 03 Mar 2025 01:48:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Mar 2025 11:48:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Date: Mon,  3 Mar 2025 11:48:08 +0200
Message-ID: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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

Use IS_ENABLED() to check for CONFIG_DRM_KUNIT_TEST so
that it picks up the modular case as well.

Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index aca442c25209..27471a4eef21 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1268,6 +1268,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
 
-#ifdef CONFIG_DRM_KUNIT_TEST
+#if IS_ENABLED(CONFIG_DRM_KUNIT_TEST)
 #include "tests/drm_client_modeset_test.c"
 #endif
-- 
2.45.3

