Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2FC4BF9FF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D6510E7F3;
	Tue, 22 Feb 2022 13:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97310E7F6;
 Tue, 22 Feb 2022 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538185; x=1677074185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3T8I3j+Efc5imHVVXY8ChABE/kooCa0kMx4cvT/1BI=;
 b=Vjw0cENHdd4CJ7Epihn3E+StYAZWAfkltVlqw+X0Z0koTUxFauP27zh9
 GjndIrmwrNxffLYEP+eKejUxqldFGVWS5bw6CSyu/Z0y3wiYy2Toi7cj/
 JVgQ8LW4FBcSRapXSNaB4VEDo/N7CPVLvrhM60bPOSGovb1wrFde5Pt24
 VqAEq+al4zNZ7lkYeGWpAebYa5bPQl3k6RKrQ27LGDXDyhKd2M6lgR8hh
 HKGTHKQy9bKtgCrUomO7JttWsd4mSAid0M+C1m7ROsMf9JpMH9tzvK1lE
 t7cXkBXF413u2xYxZBJcKgRk3ikjyOY0VQXDrESBWMfttOuf5jktGHXTM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326505"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534097"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:24 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/11] libdrmclient: Support multiple DRM cards
Date: Tue, 22 Feb 2022 13:56:01 +0000
Message-Id: <20220222135605.1120767-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
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

Require DRM minor match during client lookup.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 14 ++++++++------
 lib/igt_drm_clients.h |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 116479a9f363..cf044597d537 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -57,7 +57,7 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
 struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int id)
+		     unsigned int drm_minor, unsigned int id)
 {
 	unsigned int start, num;
 	struct igt_drm_client *c;
@@ -69,7 +69,8 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 		if (status != c->status)
 			continue;
 
-		if (status == IGT_DRM_CLIENT_FREE || c->id == id)
+		if (status == IGT_DRM_CLIENT_FREE ||
+		    (drm_minor == c->drm_minor && c->id == id))
 			return c;
 	}
 
@@ -123,9 +124,10 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 {
 	struct igt_drm_client *c;
 
-	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, info->id));
+	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
+				     drm_minor, info->id));
 
-	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
+	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0, 0);
 	if (!c) {
 		unsigned int idx = clients->num_clients;
 
@@ -359,11 +361,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 				continue;
 
 			if (igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
-						info.id))
+						 minor, info.id))
 				continue; /* Skip duplicate fds. */
 
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
-						info.id);
+						 minor, info.id);
 			if (!c)
 				igt_drm_client_add(clients, &info, client_pid,
 						   client_name, minor);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 7a6318c6af5f..6da445eab34a 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -87,7 +87,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int id);
+		     unsigned int drm_minor, unsigned int id);
 
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-- 
2.32.0

