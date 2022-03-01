Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B324C9918
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B7F10E89E;
	Tue,  1 Mar 2022 23:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B59110E834;
 Tue,  1 Mar 2022 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176590; x=1677712590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CnLDkCOJ4t1hv6jmhbelTolfAf64gvXjYIttrjKdaNk=;
 b=C07z/YW21N1oOs/lFY05B4YxiFh+fJfe/ztwnmV+5QCdjgFROtGBSk7u
 QfLewc8/fhodXNRS44nWDwadbVoWd2LTtmvxcFiK5dmiOj0BsNHbI9dFF
 nwN1TsSO+9L2wQfbvSmB/IXm8fuGCdwFeuIdisIdTlh27P3fg7nmHng1h
 8qaklTNWTt1kyTN1IF5ndR9lGiZdPI9ml8STG1Gv49lmMQtAVM8XBo7tm
 FIJ0T666zbvU3xdKe5AcjpUgvLBqD3mfvFw+C7luT71aBNZzzBaCTL6JI
 vcXOWpUf5l4wPRmW2jtt2qpUwpQDQBHN1oqxEYTOtNUDeWYBPZC26WpaC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479067"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479067"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253490"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/i915/xehp: Don't support parallel submission on
 compute / render
Date: Tue,  1 Mar 2022 15:15:46 -0800
Message-Id: <20220301231549.1817978-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

A different emit breadcrumbs ring programming is required for compute /
render and we don't have UMD user so just reject parallel submission for
these engine classes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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
index 1297ddbf7f88..812220a43df8 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -154,6 +154,10 @@ static int intel_guc_multi_lrc_basic(void *arg)
 	int ret;
 
 	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
+		/* We don't support breadcrumb handshake on these classes */
+		if (class == COMPUTE_CLASS || class == RENDER_CLASS)
+			continue;
+
 		ret = __intel_guc_multi_lrc_basic(gt, class);
 		if (ret)
 			return ret;
-- 
2.34.1

