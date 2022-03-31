Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25D4EDB62
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F4C10E34F;
	Thu, 31 Mar 2022 14:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78B510E331;
 Thu, 31 Mar 2022 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735770; x=1680271770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dSsL6RVIjNFIM0OlRGOZHhauoL2ifp40M0lAQuTJ53g=;
 b=ZI1OL/eO3FcFk8R8ZLEN79QqOdfcpzpq//5uRImiF+Rtx8aI9B4NYmDq
 k6J+hc4xDwYaPlUgqf1rl6emSSPTo/W6QacT57rCYDwKZXQJZSBgoEwT9
 XK/N/DVSHh9ZZzjRqckjs5igfgNmSJp1uOqcG7yDC406E7hlHu8syiPuZ
 scG4q3P8qdrSUKvbwmevA1aZ4W+KXeSRE4KNMRc/gLW1M3Y8sKDiY+KuW
 1YhPkjE85GnhH9lycUzVr1p8oxpLPeIBkkbBQT7p0b9wGR4cYwT9rGBdy
 mlGRCXDgjsZjA+ReooA24V4OTy7zPRpCr6YEozyin66jnHYxLSSwX7lsj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825416"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825416"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114176"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915: Make GEM contexts track DRM clients
Date: Thu, 31 Mar 2022 15:09:14 +0100
Message-Id: <20220331140920.2986689-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Make GEM contexts keep a reference to i915_drm_client for the whole of
of their lifetime which will come handy in following patches.

v2: Don't bother supporting selftests contexts from debugfs. (Chris)
v3 (Lucas): Finish constructing ctx before adding it to the list
v4 (Ram): Rebase.
v5: Trivial rebase for proto ctx changes.
v6: Rebase after clients no longer track name and pid.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> # v5
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v5
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 5 +++++
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5394fbed8bf0..6781ee34646c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1257,6 +1257,9 @@ static void i915_gem_context_release_work(struct work_struct *work)
 	if (ctx->pxp_wakeref)
 		intel_runtime_pm_put(&ctx->i915->runtime_pm, ctx->pxp_wakeref);
 
+	if (ctx->client)
+		i915_drm_client_put(ctx->client);
+
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
@@ -1663,6 +1666,8 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	ctx->file_priv = fpriv;
 
 	ctx->pid = get_task_pid(current, PIDTYPE_PID);
+	ctx->client = i915_drm_client_get(fpriv->client);
+
 	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
 		 current->comm, pid_nr(ctx->pid));
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 282cdb8a5c5a..93d24f189ba9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -293,6 +293,9 @@ struct i915_gem_context {
 	/** @link: place with &drm_i915_private.context_list */
 	struct list_head link;
 
+	/** @client: struct i915_drm_client */
+	struct i915_drm_client *client;
+
 	/**
 	 * @ref: reference count
 	 *
-- 
2.32.0

