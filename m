Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFE7506C9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4775D10E504;
	Wed, 12 Jul 2023 11:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB2710E501;
 Wed, 12 Jul 2023 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689162484; x=1720698484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3UFb8OqF06fv2F6gJ/iTXwHgvZZy1ZJFg6pTLkEphg=;
 b=FROj5r341+hKSuZGUBt0JFNfzzfrCzqVRfjwtm1JaAEY2HeIqhHuL3jG
 D1phZ98Ri5ycKQVIc2URvaG/ZOPq6G6QZKwM9kdZNEfATSKXiumGQdsXv
 9FzvaHPm93O5DBQ6+IDckW0y1X7xBXQhCxCsjsYc8epWXUEtVowcqT2ye
 OyeSlsA7bIcCauYMFOTw0qDrDCXgIP+x749TrHhFzspvTbdK+eKnX7bNx
 /5Lfai01aETJMeVJ+JEp+TURrTcWrDBRLgIe+VQJdD1MUg/qa3xaqxSSz
 mIqMMDzG8pDev57B0qw9dDPi3uKAMELjFenr3BE6OB02iuWETEeTpuzBP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344469403"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="344469403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866094175"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="866094175"
Received: from eamonnob-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.237.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:47:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/17] cgroup/drm: Expose GPU utilisation
Date: Wed, 12 Jul 2023 12:46:03 +0100
Message-Id: <20230712114605.519432-16-tvrtko.ursulin@linux.intel.com>
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
 Documentation/admin-guide/cgroup-v2.rst |  3 +++
 kernel/cgroup/drm.c                     | 26 ++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index da350858c59f..bbe986366f4a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2445,6 +2445,9 @@ will be respected.
 DRM scheduling soft limits interface files
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+  drm.active_us
+	GPU time used by the group recursively including all child groups.
+
   drm.weight
 	Standard cgroup weight based control [1, 10000] used to configure the
 	relative distributing of GPU time between the sibling groups.
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index b244e3d828cc..7c20d4ebc634 100644
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
@@ -117,6 +119,20 @@ drmcs_write_weight(struct cgroup_subsys_state *css, struct cftype *cftype,
 	return 0;
 }
 
+static u64
+drmcs_read_total_us(struct cgroup_subsys_state *css, struct cftype *cft)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+	u64 val;
+
+	/* Mutex being overkill unless arch cannot atomically read u64.. */
+	mutex_lock(&drmcg_mutex);
+	val = drmcs->total_us;
+	mutex_unlock(&drmcg_mutex);
+
+	return val;
+}
+
 static bool __start_scanning(unsigned int period_us)
 {
 	struct drm_cgroup_state *root = &root_drmcs.drmcs;
@@ -169,11 +185,14 @@ static bool __start_scanning(unsigned int period_us)
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
@@ -551,6 +570,11 @@ struct cftype files[] = {
 		.read_u64 = drmcs_read_weight,
 		.write_u64 = drmcs_write_weight,
 	},
+	{
+		.name = "active_us",
+		.flags = CFTYPE_NOT_ON_ROOT,
+		.read_u64 = drmcs_read_total_us,
+	},
 	{ } /* Zero entry terminates. */
 };
 
-- 
2.39.2

