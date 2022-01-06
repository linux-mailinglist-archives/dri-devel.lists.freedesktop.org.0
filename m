Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6604867F8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 17:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6A10F755;
	Thu,  6 Jan 2022 16:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E293710F67F;
 Thu,  6 Jan 2022 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641488151; x=1673024151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SH02zku0iiFc6pYIPcrQLLXCet3XasusKrWyciHaVW0=;
 b=IWH2j1tyVUxU0RyHrvZ15pI5mhWr33MoaFp6fFyUgKR0tK1FnwMVpGw2
 czQhAM0rvoIUb0IOmObGjnBzzQ2tdxpk4uEamvPGkGOWGd9Blg+AaHFia
 BnJWK1cxEblKVFZyql28UMKmRB16mH/FQHo+wungE3tBdu0O4UXm86B60
 hCvUToCWO4KnijczOp9lFFSaHFvT7uNCmIfiPpKSxRTz/w6jY5exDdV2q
 QdMFfmK36u0W/uiSnBY8Gspm5BegGnVnIJgCnNkf8f3z1fOI7cJTuUY0F
 w8B1mhh6e/cBZDQtSRstAMQAIkACvlk9H5Sp1HnzQoV5jF+dxhge/+ase w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266981026"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="266981026"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:55:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="470997954"
Received: from leitchrx-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.202.197])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:55:49 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915: Make GEM contexts track DRM clients
Date: Thu,  6 Jan 2022 16:55:31 +0000
Message-Id: <20220106165536.57208-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 5 +++++
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ebbac2ea0833..b093d3e3a78c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1230,6 +1230,9 @@ static void i915_gem_context_release_work(struct work_struct *work)
 	if (ctx->pxp_wakeref)
 		intel_runtime_pm_put(&ctx->i915->runtime_pm, ctx->pxp_wakeref);
 
+	if (ctx->client)
+		i915_drm_client_put(ctx->client);
+
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
@@ -1653,6 +1656,8 @@ static void gem_context_register(struct i915_gem_context *ctx,
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

