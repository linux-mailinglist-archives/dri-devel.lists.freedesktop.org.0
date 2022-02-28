Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B445E4C743C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662E310E87F;
	Mon, 28 Feb 2022 17:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D271310E84E;
 Mon, 28 Feb 2022 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070186; x=1677606186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UIxHbzEkt97jVdFgapQApA2qrInRxTiqzaspfnSuts=;
 b=WlSCOU/YrJtCbWUHynjPbZm32+KkLhrtOxWlFmG3ClQs4Y7iMOpjRvTI
 osl3XNhifrPhuXj82Er6kldQk2RkTqn9mgH25TwRb1ONJqDpk5+9hvnQh
 i5Mdc6vIUqc/oFcUJo+O4/H7d6LU5v1jY7EDnHFPT/cRu5lwOKCuuHdtM
 5OeZTFU+H3SEA+sF9eeUDWi4exvIPBqtwvBi88N7c9Hg4pyTiKnEijdy8
 +J4gAraDrxLQnycJxSwByXq5SIAd8kyPXH0DzvnjymLJ2OgYeZhGqQMVM
 XaFrfovVz4CDsKUAczsZD4ndp/PhGnC12SEkQAZA0SA2rnbKcDykA8aHX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233561985"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="233561985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392850"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/13] drm/i915/xehp: Don't support parallel submission on
 compute / render
Date: Mon, 28 Feb 2022 09:42:42 -0800
Message-Id: <20220228174245.1569581-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

A different emit breadcrumbs ring programming is required for compute /
render and we don't have UMD user so just reject parallel submission for
these engine classes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c         | 10 ++++++++++
 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index bc6d59df064d..9ae294eb7fb4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -670,6 +670,16 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 				goto out_err;
 			}
 
+			/*
+			 * We don't support breadcrumb handshake on these
+			 * classes
+			 */
+			if (siblings[n]->class == RENDER_CLASS ||
+			    siblings[n]->class == COMPUTE_CLASS) {
+				err = -EINVAL;
+				goto out_err;
+			}
+
 			if (n) {
 				if (prev_engine.engine_class !=
 				    ci.engine_class) {
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index 1297ddbf7f88..f9218a37d170 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -154,6 +154,10 @@ static int intel_guc_multi_lrc_basic(void *arg)
 	int ret;
 
 	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
+		/* We don't support breadcrumb handshake on these classes */
+		if (class == COMPUTE_CLASS || class == RENDER_CLASS)
+		       continue;
+
 		ret = __intel_guc_multi_lrc_basic(gt, class);
 		if (ret)
 			return ret;
-- 
2.34.1

