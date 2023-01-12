Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7E667C19
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280510E308;
	Thu, 12 Jan 2023 16:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B785C10E306;
 Thu, 12 Jan 2023 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673542666; x=1705078666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAsuGvW+cjJ47gR3odvUtOpS3YhJhQdU2PbgaMP59V0=;
 b=ZBSLhEOps0U2CaztAl9+bR4m/0JD4EL7UJ79fOaHW2Hv5crFZH7j4BF/
 YOJeKEo8lrnGzwiuDiPPuzMqzeo60xdHpszE1RHU0GBVeGfYtcb8ZOJbH
 RDZLvsbO0NLxlJDNuaj3JFo6Yx5MOMS/bRvc273gUc9xLjf6S7Xfet8AW
 YYC+nxJDXmrG2lBUJoEFS0epVCMV952cTtc/wuu+pHb9P0EcDWxYPj0Ja
 mxj02VQSZ0ibqssoG73GKFkZyur86vRvb0CGHhV3O8UNrykdFd4dPWX3N
 gDe02ih0ulWE3oKvi7Jdxv1OQRpP4opMVwqRbT5XIBS+N5c0v3rRVQrfh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325016471"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325016471"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651232782"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="651232782"
Received: from jacton-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.195.171])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:46 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 06/12] drm/cgroup: Add ability to query drm cgroup GPU time
Date: Thu, 12 Jan 2023 16:56:03 +0000
Message-Id: <20230112165609.1083270-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
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
 drivers/gpu/drm/drm_cgroup.c | 24 ++++++++++++++++++++++++
 include/drm/drm_clients.h    |  2 ++
 include/drm/drm_drv.h        | 28 ++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_cgroup.c b/drivers/gpu/drm/drm_cgroup.c
index 46b012d2be42..bc1e34f1a552 100644
--- a/drivers/gpu/drm/drm_cgroup.c
+++ b/drivers/gpu/drm/drm_cgroup.c
@@ -138,3 +138,27 @@ drm_clients_migrate(struct drm_file *file_priv,
 		 pid_nr(old), pid_nr(new));
 	rcu_read_unlock();
 }
+
+u64 drm_pid_get_active_time_us(struct pid *pid)
+{
+	struct drm_pid_clients *clients;
+	u64 total = 0;
+
+	rcu_read_lock();
+	clients = xa_load(&drm_pid_clients, (unsigned long)pid);
+	if (clients) {
+		struct drm_file *fpriv;
+
+		list_for_each_entry_rcu(fpriv, &clients->file_list, clink) {
+			const struct drm_cgroup_ops *cg_ops =
+				fpriv->minor->dev->driver->cg_ops;
+
+			if (cg_ops && cg_ops->active_time_us)
+				total += cg_ops->active_time_us(fpriv);
+		}
+	}
+	rcu_read_unlock();
+
+	return total;
+}
+EXPORT_SYMBOL_GPL(drm_pid_get_active_time_us);
diff --git a/include/drm/drm_clients.h b/include/drm/drm_clients.h
index 2732fffab3f0..7e0c0cf14f25 100644
--- a/include/drm/drm_clients.h
+++ b/include/drm/drm_clients.h
@@ -41,4 +41,6 @@ drm_clients_migrate(struct drm_file *file_priv,
 }
 #endif
 
+u64 drm_pid_get_active_time_us(struct pid *pid);
+
 #endif
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index d7c521e8860f..f5f0e088e1fe 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -158,6 +158,24 @@ enum drm_driver_feature {
 	DRIVER_KMS_LEGACY_CONTEXT	= BIT(31),
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
@@ -469,6 +487,16 @@ struct drm_driver {
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
-- 
2.34.1

