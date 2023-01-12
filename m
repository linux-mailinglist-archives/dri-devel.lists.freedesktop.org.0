Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DA667C1C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3F410E311;
	Thu, 12 Jan 2023 16:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885B10E308;
 Thu, 12 Jan 2023 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673542673; x=1705078673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wO4vq8DTSbSrK6Q8SSiu3RWC+/DM/VhnYEUQ6NLXXx0=;
 b=TC796vYsJ8JOXMGv1HNywJG9U8Z/Tghl6V/HVSbKB1rrVkFQFg6J3jFH
 BigP0ie4fCTNFwjVOvSCsipl/A/dR1bJ6Qc6gGpMVntsUC7d2fOsqWhQR
 6t8ARVD2fZTUgGBJBzrkrbxBBHXx+zKQvGQRQsGeilLlpX6iwIA95QZIf
 LPJJncYEtd7qjn03y5UiOC4Y1yhLKQT4eNj7k/nJSMulLuvPrrUml6o4u
 dy/5yCwsAgvlUQWhscdWZgF99AQ5GtwZGZ7T9fH/C43MR/93O3YT7j1UJ
 BmYYswX4sTG3f7C6mxJUqZGQ6DPf/h12KAOcghzbbQcuKclJmnlYiSYJM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325016550"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325016550"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:57:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651232910"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="651232910"
Received: from jacton-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.195.171])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:59 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 09/12] cgroup/drm: Client exit hook
Date: Thu, 12 Jan 2023 16:56:06 +0000
Message-Id: <20230112165609.1083270-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
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

We need the ability for DRM core to inform the cgroup controller when a
client has closed a DRM file descriptor. This will allow us not needing
to keep state relating to GPU time usage by tasks sets in the cgroup
controller itself.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_cgroup.c |  9 +++++++++
 include/linux/cgroup_drm.h   |  4 ++++
 kernel/cgroup/drm.c          | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_cgroup.c b/drivers/gpu/drm/drm_cgroup.c
index 09249f795af3..ea1479d05355 100644
--- a/drivers/gpu/drm/drm_cgroup.c
+++ b/drivers/gpu/drm/drm_cgroup.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/cgroup_drm.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_clients.h>
 #include <drm/drm_print.h>
@@ -32,6 +34,7 @@ void drm_clients_close(struct drm_file *file_priv)
 {
 	struct drm_device *dev = file_priv->minor->dev;
 	struct drm_pid_clients *clients;
+	struct task_struct *task;
 	struct pid *pid;
 
 	lockdep_assert_held(&dev->filelist_mutex);
@@ -44,6 +47,12 @@ void drm_clients_close(struct drm_file *file_priv)
 	if (drm_WARN_ON_ONCE(dev, !clients))
 		return;
 
+	task = get_pid_task(pid, PIDTYPE_PID);
+	if (task) {
+		drmcgroup_client_exited(task);
+		put_task_struct(task);
+	}
+
 	__del_clients(clients, file_priv, (unsigned long)pid);
 }
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index bf8abc6b8ebf..2f755b896136 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -6,4 +6,8 @@
 #ifndef _CGROUP_DRM_H
 #define _CGROUP_DRM_H
 
+struct task_struct;
+
+void drmcgroup_client_exited(struct task_struct *task);
+
 #endif	/* _CGROUP_DRM_H */
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 48a8d646a094..3e7f165806de 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -22,6 +22,11 @@ css_to_drmcs(struct cgroup_subsys_state *css)
 	return container_of(css, struct drm_cgroup_state, css);
 }
 
+static inline struct drm_cgroup_state *get_task_drmcs(struct task_struct *task)
+{
+	return css_to_drmcs(task_get_css(task, drm_cgrp_id));
+}
+
 static struct drm_root_cgroup_state root_drmcs;
 
 static void drmcs_free(struct cgroup_subsys_state *css)
@@ -46,6 +51,14 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 	return &drmcs->css;
 }
 
+void drmcgroup_client_exited(struct task_struct *task)
+{
+	struct drm_cgroup_state *drmcs = get_task_drmcs(task);
+
+	css_put(&drmcs->css);
+}
+EXPORT_SYMBOL_GPL(drmcgroup_client_exited);
+
 struct cftype files[] = {
 	{ } /* Zero entry terminates. */
 };
-- 
2.34.1

