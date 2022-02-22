Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5D4BF9FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF210E60F;
	Tue, 22 Feb 2022 13:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805EB10E7AE;
 Tue, 22 Feb 2022 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538184; x=1677074184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrPPcF8Z/g19JKyVRgayx1eXG/HFkPd8TCdk6t/qE70=;
 b=V4izKQOQ927l70L8bIyCC8aeTC8fjMDhhHlFjRpS4cdkiRXPzYnU2sDN
 5eEB4+WlHIhjiQo50rTTedGNvOIsq6wEe+AKlFC97PMbwRNHGr28edyYi
 AulyCmkRz1sr7Zb+1aoqUDTMHxSjwFPBwVbtG5Q4pWcUrirMF64rXZMA9
 msegpwVKIddAwTWPydbN6tDw4AtZit3qWT1bznhvAeOYKTYHvFoi8o0VT
 7C4V08VZrW4Vue33ne6QYx589b1w5xxSyQ9bDhVsIHd8OzwarxGVCSrSk
 v6IVMcVgVvR3FQuzM4aUR1zDzs5pIS8fXPgV/3fXiHxL9pGyo12CHqcAt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326495"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534090"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:22 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/11] libdrmclients: Record client drm minor
Date: Tue, 22 Feb 2022 13:56:00 +0000
Message-Id: <20220222135605.1120767-7-tvrtko.ursulin@linux.intel.com>
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

Prepare for supporting clients belonging to multiple DRM cards by storing
the DRM minor in the client record.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 33 ++++++++++++++++++++-------------
 lib/igt_drm_clients.h |  6 ++++--
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 591602f4c9f5..116479a9f363 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -117,12 +117,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 }
 
 void
-igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
-		   unsigned int pid, char *name, uint64_t busy[16])
+igt_drm_client_add(struct igt_drm_clients *clients,
+		   struct drm_client_fdinfo *info,
+		   unsigned int pid, char *name, unsigned int drm_minor)
 {
 	struct igt_drm_client *c;
 
-	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, id));
+	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, info->id));
 
 	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
 	if (!c) {
@@ -137,13 +138,14 @@ igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
 		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
 	}
 
-	c->id = id;
+	c->id = info->id;
+	c->drm_minor = drm_minor;
 	c->clients = clients;
 	c->val = calloc(clients->num_classes, sizeof(c->val));
 	c->last = calloc(clients->num_classes, sizeof(c->last));
 	assert(c->val && c->last);
 
-	igt_drm_client_update(c, pid, name, busy);
+	igt_drm_client_update(c, pid, name, info->busy);
 }
 
 void igt_drm_client_free(struct igt_drm_client *c)
@@ -254,16 +256,21 @@ static bool get_task_name(const char *buffer, char *out, unsigned long sz)
 	return true;
 }
 
-static bool is_drm_fd(int fd_dir, const char *name)
+static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
 {
 	struct stat stat;
 	int ret;
 
 	ret = fstatat(fd_dir, name, &stat, 0);
 
-	return ret == 0 &&
-	       (stat.st_mode & S_IFMT) == S_IFCHR &&
-	       major(stat.st_rdev) == 226;
+	if (ret == 0 &&
+	    (stat.st_mode & S_IFMT) == S_IFCHR &&
+	    major(stat.st_rdev) == 226) {
+		*minor = minor(stat.st_rdev);
+		return true;
+	}
+
+	return false;
 }
 
 struct igt_drm_clients *
@@ -293,10 +300,10 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 		return clients;
 
 	while ((proc_dent = readdir(proc_dir)) != NULL) {
+		unsigned int client_pid, minor = 0;
 		int pid_dir = -1, fd_dir = -1;
 		struct dirent *fdinfo_dent;
 		char client_name[64] = { };
-		unsigned int client_pid;
 		DIR *fdinfo_dir = NULL;
 		char buf[4096];
 		size_t count;
@@ -338,7 +345,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			if (!isdigit(fdinfo_dent->d_name[0]))
 				continue;
 
-			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name, &minor))
 				continue;
 
 			memset(&info, 0, sizeof(info));
@@ -358,8 +365,8 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
 						info.id);
 			if (!c)
-				igt_drm_client_add(clients, info.id, client_pid,
-						   client_name, info.busy);
+				igt_drm_client_add(clients, &info, client_pid,
+						   client_name, minor);
 			else
 				igt_drm_client_update(c, client_pid,
 						      client_name, info.busy);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 91e9da4c0733..7a6318c6af5f 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -48,6 +48,7 @@ struct igt_drm_client {
 
 	enum igt_drm_client_status status;
 	unsigned int id;
+	unsigned int drm_minor;
 	unsigned int pid;
 	char name[24];
 	char print_name[24];
@@ -95,8 +96,9 @@ igt_drm_clients_sort(struct igt_drm_clients *clients,
 void igt_drm_client_update(struct igt_drm_client *c,
 			   unsigned int pid, char *name, uint64_t val[16]);
 
-void igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
-			unsigned int pid, char *name, uint64_t busy[16]);
+void igt_drm_client_add(struct igt_drm_clients *clients,
+			struct drm_client_fdinfo *,
+			unsigned int pid, char *name, unsigned int drm_minor);
 
 void igt_drm_client_free(struct igt_drm_client *c);
 
-- 
2.32.0

