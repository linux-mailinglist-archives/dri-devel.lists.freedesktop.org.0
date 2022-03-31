Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4814EDB3B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BB89191;
	Thu, 31 Mar 2022 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAD910F3F5;
 Thu, 31 Mar 2022 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735461; x=1680271461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swj5SXsn4gJVTmUEenT3MRID7PSQknmpIH/17D6TzQw=;
 b=barCBQY1l/almNNA0coLYTNNMXboiNhory2AnAZvHRJmPmARiipvATQ1
 ireWI7he36QIWwaX/0O1OhkcqyoxfsG/yjXpIQbMaVrt/ekKgDsxY2Cs4
 NJIwQZyTmDzZGf5i5A5vZsCm7KgiK804TQn5u8jzitB1HoMqxziAC6Ass
 KDiCr2Z61N4snTGOpXGg3Sg7nBCto242MxwYtmto14W6hKeyhPUB5uZTi
 REdbwYzQEHoko12nE2Q+2xyZXkWrg2+1d68AzB20R+o7HkC+wwQFb2VaU
 aiEjiagi+gsGTf0yvzHzCl/UCGFODSF/7om/29T6EFC29ISGs31c7a6Mb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027293"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027293"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347368"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:14 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/12] libdrmclient: Unexport igt_drm_client_update
Date: Thu, 31 Mar 2022 15:03:47 +0100
Message-Id: <20220331140348.2985832-12-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is currently unused so no need to export it as API for now.

Also change the signature to take struct drm_client_fdinfo in order to
avoid needing to pass in a sized array.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 16 ++++++++--------
 lib/igt_drm_clients.h |  3 ---
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index e8e86969f984..32e1d7a0f20e 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -77,9 +77,9 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 	return NULL;
 }
 
-void
+static void
 igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
-		      uint64_t val[16])
+		      const struct drm_client_fdinfo *info)
 {
 	unsigned int i;
 
@@ -104,13 +104,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	c->total_runtime = 0;
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
-		if (val[i] < c->last[i])
+		if (info->busy[i] < c->last[i])
 			continue; /* It will catch up soon. */
 
-		c->total_runtime += val[i];
-		c->val[i] = val[i] - c->last[i];
+		c->total_runtime += info->busy[i];
+		c->val[i] = info->busy[i] - c->last[i];
 		c->last_runtime += c->val[i];
-		c->last[i] = val[i];
+		c->last[i] = info->busy[i];
 	}
 
 	c->samples++;
@@ -168,7 +168,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
 	assert(c->val && c->last);
 
-	igt_drm_client_update(c, pid, name, info->busy);
+	igt_drm_client_update(c, pid, name, info);
 }
 
 void igt_drm_client_free(struct igt_drm_client *c)
@@ -418,7 +418,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 						   client_name, minor);
 			else
 				igt_drm_client_update(c, client_pid,
-						      client_name, info.busy);
+						      client_name, &info);
 		}
 
 next:
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 47547aa8b75f..6817acc34e81 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -92,9 +92,6 @@ struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
 		     int (*cmp)(const void *, const void *, void *));
 
-void igt_drm_client_update(struct igt_drm_client *c,
-			   unsigned int pid, char *name, uint64_t val[16]);
-
 void igt_drm_client_add(struct igt_drm_clients *clients,
 			struct drm_client_fdinfo *,
 			unsigned int pid, char *name, unsigned int drm_minor);
-- 
2.32.0

