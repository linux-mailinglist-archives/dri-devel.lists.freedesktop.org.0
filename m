Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBC52241C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1469F10E1BA;
	Tue, 10 May 2022 18:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9610E04C;
 Tue, 10 May 2022 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652207613; x=1683743613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SupVKfeAI9Ku9MN/lddJrVkPyfH+dTXOv8pFD6CAfis=;
 b=TvdGvJt3c8yxsWSb4gsXzTnGJ5M49rA9xGmZvHS+ckJxFEaoPMFz0ryz
 nR9UcQmUynaUeKUeCmJ4WV53WvsS5aATjPaTWbyozUTiWXoaBNBNDoIzU
 fkAT9sdUwiyvdN93fjEvsFQoYVGVQ+QFsEMfe0oDw+ZmRbEM0TUDFgrfn
 OkbmzFdGza1WKHyhVYchtcchMTtPMczx4TdGW14c4wrFXAs3wL4p007BR
 wFlDaa0zgAtgxtjNP0tLPej0c65licD5E6Hum0b7k6005ESN/oCb9MPtd
 sBui2elze9UruoQjC7oPnbRYVv7N/UcFwMdwiJqHf2agUPEfmjVZzjFHB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267058473"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="267058473"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593673573"
Received: from lengdahl-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.220.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/print: Add drm_debug_once* macros
Date: Tue, 10 May 2022 21:33:11 +0300
Message-Id: <20220510183313.1046628-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510183313.1046628-1-jouni.hogander@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mark Pearson <markpearson@lenovo.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_debug_once* macros to allow printing out one time debug
messages which can be still controlled via drm.debug parameter.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/drm_print.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..e339f47eeb6d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -476,6 +476,35 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dev_dbg_once(dev, cat, fmt, ...)			\
+({								\
+	static bool __print_once __read_mostly;			\
+	if (!__print_once) {					\
+		__print_once = true;				\
+		drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__);	\
+	}							\
+})
+
+#define drm_dbg_once_core(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+#define drm_dbg_once(drm, fmt, ...)						\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_kms(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_prime(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_atomic(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_vbl(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_state(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_lease(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_dp(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+#define drm_dbg_once_drmres(drm, fmt, ...)					\
+	drm_dev_dbg_once((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.25.1

