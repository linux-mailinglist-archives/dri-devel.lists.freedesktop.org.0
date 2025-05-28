Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31AAC6A2C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A7010E074;
	Wed, 28 May 2025 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B445010E074
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:18:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 54SDIObK1832691; Wed, 28 May 2025 18:48:24 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 54SDIOXo1832690;
 Wed, 28 May 2025 18:48:24 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2] drm/file: add client id to drm_file_error
Date: Wed, 28 May 2025 18:48:22 +0530
Message-Id: <20250528131822.1832665-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add client id to the drm_file_error api, client id
is a unique id for each drm fd and is quite useful
for debugging.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index dd351f601acd..06ba6dcbf5ae 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -1011,8 +1011,10 @@ void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
 	pid = rcu_dereference(file_priv->pid);
 	task = pid_task(pid, PIDTYPE_TGID);
 
-	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
-		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
+	drm_err(dev, "comm: %s pid: %d client-id:%llu client: %s ... %pV",
+		task ? task->comm : "Unset",
+		task ? task->pid : 0, file_priv->client_id,
+		file_priv->client_name ?: "Unset", &vaf);
 
 	va_end(args);
 	rcu_read_unlock();
-- 
2.34.1

