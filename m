Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839D13B857
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 04:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277CE6E83F;
	Wed, 15 Jan 2020 03:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA436E83F;
 Wed, 15 Jan 2020 03:49:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="242719826"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 19:49:28 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>
Subject: [[Intel-gfx] [PATCH v2 01/10] drm/print: introduce new struct
 drm_device based WARN* macros
Date: Wed, 15 Jan 2020 09:14:45 +0530
Message-Id: <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new struct drm_device based WARN* macros. These are modeled after
the core kernel device based WARN* macros. These would be preferred
over the regular WARN* macros, where possible.

These macros include device information in the backtrace, so we know
what device the warnings originate from.

Knowing the device specific information in the backtrace would be
helpful in development all around.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 include/drm/drm_print.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 8f99d389792d..894a0b9437e2 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -553,4 +553,33 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
 	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
+/*
+ * struct drm_device based WARNs
+ *
+ * drm_WARN*() acts like WARN*(), but with the key difference of
+ * using device specific information so that we know from which device
+ * warning is originating from.
+ *
+ * Prefer drm_device based drm_WARN* over regular WARN*
+ */
+
+/* Helper for struct drm_device based WARNs */
+#define drm_WARN(drm, condition, format, arg...)			\
+	WARN(condition, "%s %s: " format,				\
+			dev_driver_string((drm)->dev),			\
+			dev_name((drm)->dev), ## arg)
+
+#define drm_WARN_ONCE(drm, condition, format, arg...)			\
+	WARN_ONCE(condition, "%s %s: " format,				\
+			dev_driver_string((drm)->dev),			\
+			dev_name((drm)->dev), ## arg)
+
+#define drm_WARN_ON(drm, x)						\
+	drm_WARN((drm), (x), "%s",					\
+		 "drm_WARN_ON(" __stringify(x) ")")
+
+#define drm_WARN_ON_ONCE(drm, x)					\
+	drm_WARN_ONCE((drm), (x), "%s",					\
+		      "drm_WARN_ON_ONCE(" __stringify(x) ")")
+
 #endif /* DRM_PRINT_H_ */
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
