Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C12781D41
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 11:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D548F10E12C;
	Sun, 20 Aug 2023 09:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4A10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 09:51:46 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id Xf5hqwKJwP8tnXf60q04iy; Sun, 20 Aug 2023 11:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1692525104;
 bh=GmGlyOuKr3DOh7EliZTmHtbJNAFzwthK3MIWxCPwYFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GD0ZWR9hTLrOkiw94GYsIjasnjD3BFeoabsOm43fC8opZyEe5XF4ueJ64eUe3WzKo
 StJOy8WhsIw+uKrXvawJFt7p+KUyIQl8y89LSSfDivbSrT/raG6jf2djzQWxXTyPQv
 ic8Euz+eVSIWbUvBgBpG7hZfhuX8QALQzCzAJDhN1wNT89gWOC8vVGjTIHgtH5DmFN
 tUl7HwTqt1FmN0/neMNbp0D92faBqP+cMY2oW8v2YD7+rz72/EhhBWf+1llrVHe5p9
 xu0aFjJQuNuj3OCDDcWFmznxi42Sx8lszkNEQzT2f+tcSwC0VEfZ1Doo0ATNM7HcmZ
 stovTdiCg1ftw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:44 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 Arunpravin.PaneerSelvam@amd.com
Subject: [PATCH 4/4] drm/amdgpu: Use kvzalloc() to simplify code
Date: Sun, 20 Aug 2023 11:51:16 +0200
Message-Id: <349dde45fa2596bb218b29166931c6a38e4b9bde.1692524665.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kvzalloc() can be used instead of kvmalloc() + memset() + explicit NULL
assignments.

It is less verbose and more future proof.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 6ea9ff22c281..6f5b641b631e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -78,17 +78,13 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	unsigned i;
 	int r;
 
-	list = kvmalloc(struct_size(list, entries, num_entries), GFP_KERNEL);
+	list = kvzalloc(struct_size(list, entries, num_entries), GFP_KERNEL);
 	if (!list)
 		return -ENOMEM;
 
 	kref_init(&list->refcount);
-	list->gds_obj = NULL;
-	list->gws_obj = NULL;
-	list->oa_obj = NULL;
 
 	array = list->entries;
-	memset(array, 0, num_entries * sizeof(struct amdgpu_bo_list_entry));
 
 	for (i = 0; i < num_entries; ++i) {
 		struct amdgpu_bo_list_entry *entry;
-- 
2.34.1

