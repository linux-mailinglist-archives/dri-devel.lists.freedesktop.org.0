Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859197D5792
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FEA10E41C;
	Tue, 24 Oct 2023 16:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7348210E40D;
 Tue, 24 Oct 2023 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163920; x=1729699920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grMzeSHRyi5Hbnx2+6Q3kkMweOiaep23+j//w7Ao1+s=;
 b=g6zBbTMiaV27U4S6kWIC5HC+6VIreX6P4E/OM3KE9RSJ6wbGa3BnqzgJ
 2VA4X+QvTlHTzkMvx7f8SUi7pBR7SZKGXxLYu0TzC3cXGMb4m0s90cR1Q
 oEoCvlffOFReQFQyvr/I5CF4QrpJzQVFFyD431O0SS3c7l2LvVhnHzBkc
 eBMbosRJ37IWq8ufAFJmVDT8AllXIYDuG8LQtaP53HNcxetvPacOtoX6J
 hgx+SBxF0uxKBby5Dbufl4qgkVQWACnC9FpPMK7FULXmxyMbaeNHGYFdk
 JseAICbvw2kQj63CFAj3FdUjXkTQ6Se7/vaCny1wgYK4nZdrpFgHMzWwM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451328139"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="451328139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902237205"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="902237205"
Received: from aidenbar-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.219.125])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:05:23 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/8] drm/cgroup: Add ability to query drm cgroup GPU time
Date: Tue, 24 Oct 2023 17:07:22 +0100
Message-Id: <20231024160727.282960-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
References: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
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
index e2640dc64e08..d1cee5899cde 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -157,6 +157,24 @@ enum drm_driver_feature {
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
@@ -434,6 +452,16 @@ struct drm_driver {
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

