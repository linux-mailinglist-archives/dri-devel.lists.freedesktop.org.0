Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19897B180B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 12:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B829A10E602;
	Thu, 28 Sep 2023 10:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8B10E602;
 Thu, 28 Sep 2023 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695895572; x=1727431572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vmtwCfinNhAjDHLijq51HRZXO8ZaqJNWZhGx4mbypgw=;
 b=Y6gYNuzT6jCGUKF230LTdg14402YzYjISxgoq5o2S3rjcFGrBD6k51QR
 mXTGqM5eonJxRLao1IG40eYB2dDxRLIpKyRhc8D/mQnEpaRPTqm6M6srN
 8Pyaz9t0MGglukx+0owdBvUBp10/VVZ2LOB6PyXUbZTlNig//Bl+jicxb
 KAsixFLOQsWgabzconwAvPpXh4cySN7tK4dZMcuO6HdgiuZhYMw1HtmEw
 4ykHPsr0RcfZuhsoDiDW0QR9oGN3t0R6oL6FzxmSGPQUKxs8hBK9IhwLa
 NIqxMkjXbPdO8Y51E5hW6oz0NnM8HzEzYjGFYLHMUjfNmTyNriX3Q4CbX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380901729"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="380901729"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819782302"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="819782302"
Received: from nlachman-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.130])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:06:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC] drm/i915/perf: Simplify perf query implementation
Date: Thu, 28 Sep 2023 11:06:04 +0100
Message-Id: <20230928100604.285923-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Simplify the implementation of perf/OA queries by re-ogranizing the way
querying of the OA config list is done, how temporary storage is used,
and also replace the multi-step manual retrieving of user data with the
existing copy_query_item helper.

Note that this could be further simplified by not having a temporary
array in query_perf_config_list() but directly doing put_user() as we walk
the list of configs.

Compile tested only!

If it works it does almost halve the number of lines needed to do these
queries. But let me know first please if there is interest to simplify or
just leave as is.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 120 +++++++++++-------------------
 1 file changed, 44 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index ec658fc52834..23e2fe318c4d 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -227,17 +227,14 @@ static int query_perf_config_data(struct drm_i915_private *i915,
 				  struct drm_i915_query_item *query_item,
 				  bool use_uuid)
 {
-	struct drm_i915_query_perf_config __user *user_query_config_ptr =
-		u64_to_user_ptr(query_item->data_ptr);
 	struct drm_i915_perf_oa_config __user *user_config_ptr =
 		u64_to_user_ptr(query_item->data_ptr +
 				sizeof(struct drm_i915_query_perf_config));
+	struct drm_i915_query_perf_config query_config;
 	struct drm_i915_perf_oa_config user_config;
 	struct i915_perf *perf = &i915->perf;
 	struct i915_oa_config *oa_config;
-	char uuid[UUID_STRING_LEN + 1];
-	u64 config_id;
-	u32 flags, total_size;
+	u32 total_size;
 	int ret;
 
 	if (!perf->i915)
@@ -247,47 +244,29 @@ static int query_perf_config_data(struct drm_i915_private *i915,
 		sizeof(struct drm_i915_query_perf_config) +
 		sizeof(struct drm_i915_perf_oa_config);
 
-	if (query_item->length == 0)
-		return total_size;
+	ret = copy_query_item(&query_config, sizeof(query_config), total_size,
+			      query_item);
+	if (ret != 0)
+		return ret;
 
-	if (query_item->length < total_size) {
-		drm_dbg(&i915->drm,
-			"Invalid query config data item size=%u expected=%u\n",
-			query_item->length, total_size);
-		return -EINVAL;
-	}
-
-	if (get_user(flags, &user_query_config_ptr->flags))
-		return -EFAULT;
-
-	if (flags != 0)
+	if (query_config.flags != 0)
 		return -EINVAL;
 
 	if (use_uuid) {
 		struct i915_oa_config *tmp;
 		int id;
 
-		BUILD_BUG_ON(sizeof(user_query_config_ptr->uuid) >= sizeof(uuid));
-
-		memset(&uuid, 0, sizeof(uuid));
-		if (copy_from_user(uuid, user_query_config_ptr->uuid,
-				     sizeof(user_query_config_ptr->uuid)))
-			return -EFAULT;
-
 		oa_config = NULL;
 		rcu_read_lock();
 		idr_for_each_entry(&perf->metrics_idr, tmp, id) {
-			if (!strcmp(tmp->uuid, uuid)) {
+			if (!strcmp(tmp->uuid, query_config.uuid)) {
 				oa_config = i915_oa_config_get(tmp);
 				break;
 			}
 		}
 		rcu_read_unlock();
 	} else {
-		if (get_user(config_id, &user_query_config_ptr->config))
-			return -EFAULT;
-
-		oa_config = i915_perf_get_oa_config(perf, config_id);
+		oa_config = i915_perf_get_oa_config(perf, query_config.config);
 	}
 	if (!oa_config)
 		return -ENOENT;
@@ -355,7 +334,7 @@ static size_t sizeof_perf_config_list(size_t count)
 	return sizeof(struct drm_i915_query_perf_config) + sizeof(u64) * count;
 }
 
-static size_t sizeof_perf_metrics(struct i915_perf *perf)
+static size_t sizeof_perf_metrics(struct i915_perf *perf, u64 *n_configs)
 {
 	struct i915_oa_config *tmp;
 	size_t i;
@@ -367,6 +346,8 @@ static size_t sizeof_perf_metrics(struct i915_perf *perf)
 		i++;
 	rcu_read_unlock();
 
+	*n_configs = i;
+
 	return sizeof_perf_config_list(i);
 }
 
@@ -375,72 +356,59 @@ static int query_perf_config_list(struct drm_i915_private *i915,
 {
 	struct drm_i915_query_perf_config __user *user_query_config_ptr =
 		u64_to_user_ptr(query_item->data_ptr);
+	struct drm_i915_query_perf_config query_config;
 	struct i915_perf *perf = &i915->perf;
-	u64 *oa_config_ids = NULL;
-	int alloc, n_configs;
-	u32 flags;
-	int ret;
+	u64 *oa_config_ids, *ids, n_configs;
+	struct i915_oa_config *tmp;
+	u32 total_size;
+	int ret, id;
 
 	if (!perf->i915)
 		return -ENODEV;
 
-	if (query_item->length == 0)
-		return sizeof_perf_metrics(perf);
+	total_size = sizeof_perf_metrics(perf, &n_configs);
 
-	if (get_user(flags, &user_query_config_ptr->flags))
-		return -EFAULT;
+	ret = copy_query_item(&query_config, sizeof(query_config), total_size,
+			      query_item);
+	if (ret != 0)
+		return ret;
 
-	if (flags != 0)
+	if (query_config.flags != 0)
 		return -EINVAL;
 
-	n_configs = 1;
-	do {
-		struct i915_oa_config *tmp;
-		u64 *ids;
-		int id;
+	oa_config_ids = kcalloc(n_configs, sizeof(*oa_config_ids), GFP_KERNEL);
+	if (!oa_config_ids)
+		return -ENOMEM;
 
-		ids = krealloc(oa_config_ids,
-			       n_configs * sizeof(*oa_config_ids),
-			       GFP_KERNEL);
-		if (!ids)
-			return -ENOMEM;
-
-		alloc = fetch_and_zero(&n_configs);
-
-		ids[n_configs++] = 1ull; /* reserved for test_config */
-		rcu_read_lock();
-		idr_for_each_entry(&perf->metrics_idr, tmp, id) {
-			if (n_configs < alloc)
-				ids[n_configs] = id;
-			n_configs++;
+	ids = oa_config_ids;
+	*ids++ = 1ull; /* reserved for test_config */
+	ret = 1;
+	rcu_read_lock();
+	idr_for_each_entry(&perf->metrics_idr, tmp, id) {
+		if (ret++ >= n_configs) {
+			ret = -EINVAL; /* Try again, array grew since sizeof_perf_metrics() */
+			rcu_read_unlock();
+			goto out;
 		}
-		rcu_read_unlock();
-
-		oa_config_ids = ids;
-	} while (n_configs > alloc);
-
-	if (query_item->length < sizeof_perf_config_list(n_configs)) {
-		drm_dbg(&i915->drm,
-			"Invalid query config list item size=%u expected=%zu\n",
-			query_item->length,
-			sizeof_perf_config_list(n_configs));
-		kfree(oa_config_ids);
-		return -EINVAL;
+		*ids++ = id;
 	}
+	rcu_read_unlock();
 
 	if (put_user(n_configs, &user_query_config_ptr->config)) {
-		kfree(oa_config_ids);
-		return -EFAULT;
+		ret = -EFAULT;
+		goto out;
 	}
 
 	ret = copy_to_user(user_query_config_ptr + 1,
 			   oa_config_ids,
 			   n_configs * sizeof(*oa_config_ids));
+	if (ret)
+		ret = -EFAULT;
+
+out:
 	kfree(oa_config_ids);
-	if (ret)
-		return -EFAULT;
 
-	return sizeof_perf_config_list(n_configs);
+	return ret ?: total_size;
 }
 
 static int query_perf_config(struct drm_i915_private *i915,
-- 
2.39.2

