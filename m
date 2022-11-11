Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5162589D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EFB10E7F0;
	Fri, 11 Nov 2022 10:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641DC10E7EB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668163515; x=1699699515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QhCzUoXOe6qmLG6Pf4Ep1QDjdcywTWaTd4/r+6EDODU=;
 b=CC/j6dAZCsKa0Pn9LrN1za2mZY3UWywbmjV3VbTsmGJf4DH9eBC5Smys
 lc9zaptdu8Vqw1ODjB91JekmOYCeiyBWzKO/ajXj+8A8Y0BJCBl9oanqW
 fTy6hOcPgl0zBGnaL8ry9iEy8smeJgxB0njcDzGN6k3mDoweVQn6YNHYF
 +ck8zaGouVCUqpjKYHngaV1Ysdi2V7x8ZQP7q5o0ToGwSKTtIjoEzY1A/
 PwMRa2HW7seF3wysNPIZRouAsog6O7R7m9hKveFiOtlUvP3RpOhHj3CHL
 zhA2lhCI5oURXYebt7sYnMWncGaKYNLqHqn6A+GcMk8qU0GZyC+3QiZsh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299087625"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="299087625"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670708549"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="670708549"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:14 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 09/13] drm/cgroup: Only track clients which are providing
 drm_cgroup_ops
Date: Fri, 11 Nov 2022 10:44:31 +0000
Message-Id: <20221111104435.3152347-10-tvrtko.ursulin@linux.intel.com>
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

To reduce the number of tracking going on, especially with drivers which
will not support any sort of control from the drm cgroup controller side,
lets express the funcionality as opt-in and use the presence of
drm_cgroup_ops as activation criteria.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_cgroup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_cgroup.c b/drivers/gpu/drm/drm_cgroup.c
index e3854741c584..d3050c744e3e 100644
--- a/drivers/gpu/drm/drm_cgroup.c
+++ b/drivers/gpu/drm/drm_cgroup.c
@@ -35,6 +35,9 @@ void drm_clients_close(struct drm_file *file_priv)
 
 	lockdep_assert_held(&dev->filelist_mutex);
 
+	if (!dev->driver->cg_ops)
+		return;
+
 	pid = rcu_access_pointer(file_priv->pid);
 	clients = xa_load(&drm_pid_clients, (unsigned long)pid);
 	if (WARN_ON_ONCE(!clients))
@@ -66,6 +69,9 @@ int drm_clients_open(struct drm_file *file_priv)
 
 	lockdep_assert_held(&dev->filelist_mutex);
 
+	if (!dev->driver->cg_ops)
+		return 0;
+
 	pid = (unsigned long)rcu_access_pointer(file_priv->pid);
 	clients = xa_load(&drm_pid_clients, pid);
 	if (!clients) {
@@ -101,6 +107,9 @@ drm_clients_migrate(struct drm_file *file_priv,
 
 	lockdep_assert_held(&dev->filelist_mutex);
 
+	if (!dev->driver->cg_ops)
+		return;
+
 	existing_clients = xa_load(&drm_pid_clients, new);
 	clients = xa_load(&drm_pid_clients, old);
 
-- 
2.34.1

