Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E97D57A6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A57010E412;
	Tue, 24 Oct 2023 16:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145AB10E420;
 Tue, 24 Oct 2023 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163924; x=1729699924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cx4m6Re1t0koStp5FqrNlsfdb8zARqyFqR2+8EFxmrM=;
 b=Bpn7LqE5OAMG0zJnhs/VDCRxkCuXgcC/bvCush47c4Q3l+bU+Bqb9bo7
 Czeo24Mema3Z1DzZk+C3AS7bU0gMaELXP0a7EqLfwjRSCmKFXyiilqa7c
 knycnn0mkSMcKjIW0t5k72Q+utu5weYqIXJ2CYnogPEwAqqY7Q3GlNUbi
 VjfMjt7z5vRkgPuGU6I5CuTG/MUELtcueWiiyvhHRQnCRxt0Sf1S09dCO
 DErioRU03k2PoUZLEzZbymQ4XAwPG2xydeYHWWvOeC5uVPj58Ds6yN5o6
 z/cFXCvbUdmdWSBf3wsUTE46eP1JVd/mPqQHPHJD4kw5CW7+kapz745xe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451328211"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="451328211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902237358"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="902237358"
Received: from aidenbar-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.219.125])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:05:41 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 8/8] cgroup/drm: Expose GPU utilisation
Date: Tue, 24 Oct 2023 17:07:27 +0100
Message-Id: <20231024160727.282960-9-tvrtko.ursulin@linux.intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

To support container use cases where external orchestrators want to make
deployment and migration decisions based on GPU load and capacity, we can
expose the GPU load as seen by the controller in a new drm.active_us
field. This field contains a monotonic cumulative time cgroup has spent
executing GPU loads, as reported by the DRM drivers being used by group
members.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  8 +++++++
 kernel/cgroup/drm.c                     | 29 ++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 841533527b7b..9ac8ab65161c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2445,6 +2445,14 @@ respected.
 DRM weight based time control interface files
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+  drm.stat
+	A read-only flat-keyed file.
+
+	Contains these fields:
+
+	- usage_usec - GPU time used by the group, recursively including all
+		       child groups.
+
   drm.weight
 	Standard cgroup weight based control [1, 10000] used to configure the
 	relative distributing of GPU time between the sibling groups.
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 1d1570bf3e90..127730990301 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -25,6 +25,8 @@ struct drm_cgroup_state {
 	bool over;
 	bool over_budget;
 
+	u64 total_us;
+
 	u64 per_s_budget_us;
 	u64 prev_active_us;
 	u64 active_us;
@@ -117,6 +119,24 @@ drmcs_write_weight(struct cgroup_subsys_state *css, struct cftype *cftype,
 	return 0;
 }
 
+static int drmcs_show_stat(struct seq_file *sf, void *v)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(seq_css(sf));
+	u64 val;
+
+#ifndef CONFIG_64BIT
+	mutex_lock(&drmcg_mutex);
+#endif
+	val = drmcs->total_us;
+#ifndef CONFIG_64BIT
+	mutex_unlock(&drmcg_mutex);
+#endif
+
+	seq_printf(sf, "usage_usec %llu\n", val);
+
+	return 0;
+}
+
 static bool __start_scanning(unsigned int period_us)
 {
 	struct drm_cgroup_state *root = &root_drmcs.drmcs;
@@ -169,11 +189,14 @@ static bool __start_scanning(unsigned int period_us)
 		parent = css_to_drmcs(node->parent);
 
 		active = drmcs_get_active_time_us(drmcs);
-		if (period_us && active > drmcs->prev_active_us)
+		if (period_us && active > drmcs->prev_active_us) {
 			drmcs->active_us += active - drmcs->prev_active_us;
+			drmcs->total_us += drmcs->active_us;
+		}
 		drmcs->prev_active_us = active;
 
 		parent->active_us += drmcs->active_us;
+		parent->total_us += drmcs->active_us;
 		parent->sum_children_weights += drmcs->weight;
 
 		css_put(node);
@@ -564,6 +587,10 @@ struct cftype files[] = {
 		.read_u64 = drmcs_read_weight,
 		.write_u64 = drmcs_write_weight,
 	},
+	{
+		.name = "stat",
+		.seq_show = drmcs_show_stat,
+	},
 	{ } /* Zero entry terminates. */
 };
 
-- 
2.39.2

