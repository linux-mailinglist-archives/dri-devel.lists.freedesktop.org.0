Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513794EDB3A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4789194;
	Thu, 31 Mar 2022 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4310F21D;
 Thu, 31 Mar 2022 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735459; x=1680271459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3T8I3j+Efc5imHVVXY8ChABE/kooCa0kMx4cvT/1BI=;
 b=Cf7b1eA92hFlUNArCVIwGYCzuNaXJZUeXPs+hhmDQSoaXnS5qBCF8+iC
 Rk7yMCpD+mcS+jyUKmUhwhYiz6NJYaZ6iN5IUICz8JveuJqTD4WYxk0gC
 aI2I5o/lGHPVlF91xXX/p0T5II9ZF8tSv84LVRESixjaafXNYdpFe3ck+
 3QUf3qusq2lHXwEW4GnQlGnrQfFjcuqO5EazvOY0p5XIGBxtaDqLcE6iz
 W1ni0Gj/04mkXKa0+VUscrXrr0e5UIHr8z07w44hYgH9w+Kdgk2S1IojX
 bFyGO3wCWxXXZpV9Vliwu/dFnW6uexHPu4ueG2qobD92zW4aScT6d9H0F Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027258"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347307"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:08 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/12] libdrmclient: Support multiple DRM cards
Date: Thu, 31 Mar 2022 15:03:43 +0100
Message-Id: <20220331140348.2985832-8-tvrtko.ursulin@linux.intel.com>
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

