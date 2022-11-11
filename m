Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE86258A0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C884010E7F4;
	Fri, 11 Nov 2022 10:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A53610E7EB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668163516; x=1699699516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xsH6SUJPl/aECTQLLwvLwzjjo/OdVfq3yYbEuLbpcjc=;
 b=OGLTQMHtQ3Uz5nwS13+ILN/6sR1u2lrHjgw744NIIlFoyLRNWqAcpkyE
 cUmEw+w9Y8rqURdGkutgtKWLUSQgPz9nnWHNRO4SbZdwdVguhCMhjwKuA
 kIrw1RRW7wW1ar8kCHFmvYWGpxNmLDxGqj0PmknQUpGqJfBx7fV/UMeRj
 NltHO7FSoC80F01z/zcyySoca+DrMfWLxsP55/YLLO/D7bcNe4DEQWZEl
 FbRXtomJ4c1gyk/V7UEWiEuBOMEl4hpHpnI57HNjp9Uda3KuNnm6nMvIg
 VWwJO7QTRGipnFx0lXU4bOZ4KSVzwiQFwlx6WxhA/UEyArA+yy3qgLdb9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299087627"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="299087627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670708552"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="670708552"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:15 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 10/13] cgroup/drm: Client exit hook
Date: Fri, 11 Nov 2022 10:44:32 +0000
Message-Id: <20221111104435.3152347-11-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
References: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We need the ability for DRM core to inform the cgroup controller when a
client has closed a DRM file descriptor. This will allow us not needing
to keep state relating to GPU time usage by tasks sets in the cgroup
controller itself.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_cgroup.c |  8 ++++++++
 include/linux/cgroup_drm.h   |  4 ++++
 kernel/cgroup/drm.c          | 13 +++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_cgroup.c b/drivers/gpu/drm/drm_cgroup.c
index d3050c744e3e..31a1bf3c8a43 100644
--- a/drivers/gpu/drm/drm_cgroup.c
+++ b/drivers/gpu/drm/drm_cgroup.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_clients.h>
+#include <linux/cgroup_drm.h>
 
 static DEFINE_XARRAY(drm_pid_clients);
 
@@ -31,6 +32,7 @@ void drm_clients_close(struct drm_file *file_priv)
 {
 	struct drm_device *dev = file_priv->minor->dev;
 	struct drm_pid_clients *clients;
+	struct task_struct *task;
 	struct pid *pid;
 
 	lockdep_assert_held(&dev->filelist_mutex);
@@ -43,6 +45,12 @@ void drm_clients_close(struct drm_file *file_priv)
 	if (WARN_ON_ONCE(!clients))
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
index b88c93661df3..e165d8f542cc 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -18,11 +18,24 @@ css_to_drmcs(struct cgroup_subsys_state *css)
 	return container_of(css, struct drm_cgroup_state, css);
 }
 
+static inline struct drm_cgroup_state *get_task_drmcs(struct task_struct *task)
+{
+	return css_to_drmcs(task_get_css(task, drm_cgrp_id));
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
 	kfree(css_to_drmcs(css));
 }
 
+void drmcgroup_client_exited(struct task_struct *task)
+{
+	struct drm_cgroup_state *drmcs = get_task_drmcs(task);
+
+	css_put(&drmcs->css);
+}
+EXPORT_SYMBOL_GPL(drmcgroup_client_exited);
+
 static struct drm_cgroup_state root_drmcs = {
 };
 
-- 
2.34.1

