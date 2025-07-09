Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71165AFF152
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414010E096;
	Wed,  9 Jul 2025 19:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Mlh2kdJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr
 [80.12.242.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848D410E096
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:02:57 +0000 (UTC)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id Za4EuohZXIU3AZa4EuA5yn; Wed, 09 Jul 2025 21:02:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1752087775;
 bh=DU9gqi8o4hCHl2YklDSYazmq20NfmNbWp6osbg8n6+8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Mlh2kdJxE+2erlXyzB/j9fcd3pgNavt+mSXgVyTlrnsdyBa8hroweuI5b02zmojTn
 EtE2Vo1N3KAOkVUhGsaYTo+pvW8n289lT5osOgU4qNReL2KwJvlPBzh+x3jCJmVvjK
 4n0igQnj4ahsFbXXCeVQUMFKN3jwAlqiPbrBpoLdvvUkspqsp/59NIZfZ7eUSGr8ni
 ZemDE8hf8A5LKzDbJ+8tZfJ8cWjwygSbh3ddibSPEgVmFfHFDIKt6fJEkPgY1Y1axe
 ZGvW0fbydjgZMsRaSahXv8w/1a0N/2HxWS7BeMbh+cmzebsqF77EJ79fpPW7/DpF47
 1PZQl8lLuWWlg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 09 Jul 2025 21:02:55 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix missing unlocking in an error path in
 amdgpu_userq_create()
Date: Wed,  9 Jul 2025 21:02:51 +0200
Message-ID: <366557fa7ca8173fd78c58336986ca56953369b9.1752087753.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
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

If kasprintf() fails, some mutex still need to be released to avoid locking
issue, as already done in all other error handling path.

Fixes: c03ea34cbf88 ("drm/amdgpu: add support of debugfs for mqd information")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 513bbc543f40..bce97318965c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -520,8 +520,10 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	}
 
 	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
-	if (!queue_name)
-		return -ENOMEM;
+	if (!queue_name) {
+		r = -ENOMEM;
+		goto unlock;
+	}
 
 	/* Queue dentry per client to hold MQD information   */
 	queue->debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
-- 
2.50.0

