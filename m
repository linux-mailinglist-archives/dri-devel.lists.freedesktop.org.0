Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDE7506B9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE210E4FB;
	Wed, 12 Jul 2023 11:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4610E4EF;
 Wed, 12 Jul 2023 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689162478; x=1720698478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKoMcXbN2L6Bp1UujVMkXfxYLgXbZyOn20AweTGZa3U=;
 b=J2lW3GZ2eBj4d1ZUVeSN7cjIZOzhm9e/HEuRqSHS6zJcBs1jWFdVEgfG
 UoATDbV64mImvYLei6QB4HgNPaDWfFzG6p3Q7opFC1UYLEMqlnDlxqv0/
 GIDoeZETUZXmNle4l9AxZl7NX1gbEJ0gFZndNfWOsH9I/kP+dX5MIy8w+
 P69liZ5TCMZWpVuZrFP8rzXTjXLldmNJSLMHTSc3VKn+ddB3R3v1Dy6N+
 2/JEi3I27q9/V/TYsJ2KIgzc5Gro7Lv3OlaBgIigvEdby1i34MdIhkE9o
 QTXnnL/aoNJwcw5sctBxLKF2gP/vgcg0HxtQEHtQ25kbIKvJ+fcLti0qC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344469308"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="344469308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866094136"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="866094136"
Received: from eamonnob-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.237.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/17] drm/cgroup: Only track clients which are providing
 drm_cgroup_ops
Date: Wed, 12 Jul 2023 12:45:59 +0100
Message-Id: <20230712114605.519432-12-tvrtko.ursulin@linux.intel.com>
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

To reduce the number of tracking going on, especially with drivers which
will not support any sort of control from the drm cgroup controller side,
lets express the funcionality as opt-in and use the presence of
drm_cgroup_ops as activation criteria.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 kernel/cgroup/drm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 68f31797c4f0..60e1f3861576 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -97,6 +97,9 @@ void drmcgroup_client_open(struct drm_file *file_priv)
 {
 	struct drm_cgroup_state *drmcs;
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	drmcs = css_to_drmcs(task_get_css(current, drm_cgrp_id));
 
 	mutex_lock(&drmcg_mutex);
@@ -112,6 +115,9 @@ void drmcgroup_client_close(struct drm_file *file_priv)
 
 	drmcs = css_to_drmcs(file_priv->__css);
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	mutex_lock(&drmcg_mutex);
 	list_del(&file_priv->clink);
 	file_priv->__css = NULL;
@@ -126,6 +132,9 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
 	struct drm_cgroup_state *src, *dst;
 	struct cgroup_subsys_state *old;
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	mutex_lock(&drmcg_mutex);
 
 	old = file_priv->__css;
-- 
2.39.2

