Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F47506B0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F9910E4F8;
	Wed, 12 Jul 2023 11:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2E10E4F8;
 Wed, 12 Jul 2023 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689162472; x=1720698472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQ4I98L+peLkvtgsNHxAtBxt8A95MI6az8TimZ/zwAk=;
 b=j4Jy49Py60TLsEIrEX1Wr9APdlXBDGFQuasMPrh4ZfcDSlYZIucGOlKw
 gKLfIiM2G2kSfjmR/cPYWWwlXiLuf/e1yjdage4tte8VDC/LGJhrXyqDt
 BVzrSlsbY4C+HmLGrw6sFJf/eK0ZbCqDx4Dfe+koKDrXUqMjudHjhfFXD
 ul8lAM46SbQMRfywHXo7ex/Q3g5qvzLCV9N9zY07BaL2+pCXwAGLBAl6Y
 IU7ZI5MqXswSLTaLiDrWuATEDg876w0NGO3kYPIBm29dLypZT6om0wPnn
 qp11CySp05/rRTckfxHXVIY5pCSljKOU1tQ46pIG4mOm/HS18MzaWMP3p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344469252"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="344469252"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866094117"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="866094117"
Received: from eamonnob-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.237.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:47 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/17] drm/cgroup: Add ability to query drm cgroup GPU time
Date: Wed, 12 Jul 2023 12:45:57 +0100
Message-Id: <20230712114605.519432-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add a driver callback and core helper which allow querying the time spent
on GPUs for processes belonging to a group.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 include/drm/drm_drv.h | 28 ++++++++++++++++++++++++++++
 kernel/cgroup/drm.c   | 20 ++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b77f2c7275b7..3116fa4dbc48 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -151,6 +151,24 @@ enum drm_driver_feature {
 	DRIVER_HAVE_IRQ			= BIT(30),
 };
 
+/**
+ * struct drm_cgroup_ops
+ *
+ * This structure contains a number of callbacks that drivers can provide if
+ * they are able to support one or more of the functionalities implemented by
+ * the DRM cgroup controller.
+ */
+struct drm_cgroup_ops {
+	/**
+	 * @active_time_us:
+	 *
+	 * Optional callback for reporting the GPU time consumed by this client.
+	 *
+	 * Used by the DRM core when queried by the DRM cgroup controller.
+	 */
+	u64 (*active_time_us) (struct drm_file *);
+};
+
 /**
  * struct drm_driver - DRM driver structure
  *
@@ -428,6 +446,16 @@ struct drm_driver {
 	 */
 	const struct file_operations *fops;
 
+#ifdef CONFIG_CGROUP_DRM
+	/**
+	 * @cg_ops:
+	 *
+	 * Optional pointer to driver callbacks facilitating integration with
+	 * the DRM cgroup controller.
+	 */
+	const struct drm_cgroup_ops *cg_ops;
+#endif
+
 #ifdef CONFIG_DRM_LEGACY
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index d702be1b441f..acdb76635b60 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -9,6 +9,8 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
+#include <drm/drm_drv.h>
+
 struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
 
@@ -31,6 +33,24 @@ css_to_drmcs(struct cgroup_subsys_state *css)
 	return container_of(css, struct drm_cgroup_state, css);
 }
 
+static u64 drmcs_get_active_time_us(struct drm_cgroup_state *drmcs)
+{
+	struct drm_file *fpriv;
+	u64 total = 0;
+
+	lockdep_assert_held(&drmcg_mutex);
+
+	list_for_each_entry(fpriv, &drmcs->clients, clink) {
+		const struct drm_cgroup_ops *cg_ops =
+			fpriv->minor->dev->driver->cg_ops;
+
+		if (cg_ops && cg_ops->active_time_us)
+			total += cg_ops->active_time_us(fpriv);
+	}
+
+	return total;
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
 	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
-- 
2.39.2

