Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F3781D40
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 11:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0C010E12F;
	Sun, 20 Aug 2023 09:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C643410E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 09:51:44 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id Xf5hqwKJwP8tnXf5yq04iR; Sun, 20 Aug 2023 11:51:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1692525103;
 bh=xUAxdVub/AJ+VRGlEQnfzOuYX4A4nb9Zccn+S71HYZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NfzR/IjDZ40zGycbfjDDzkgeDFTXqcbyXeHzNfyH6CTMb3WZEVKRZRuzjC/Ir5Dkh
 gerYCTAE7onbbJENf54GoFGBPotX5ic2qaNE7a9yiUzgKEx8vdeMTD3YcCnhhY9SwW
 q//Tvb0bhxnq8XXbaJze3okmXz+02MTTT0BAXMWXmYbwU6tyUhxid/xNSWa5uMnAp3
 ASMVJcnwB+MEuksol/U9hUZVmOGJ6vbngxL8B1eI21/GDO8/9LmVyIccSQy8GiqAog
 716A6jC3nw9p/czfdaC1TAewtB6cIwAkaP7NCOt8HOt8RrL2n3DKERU1CSNmXl7V/s
 YVjG5VwH7zS9Q==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:43 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 Arunpravin.PaneerSelvam@amd.com
Subject: [PATCH 3/4] drm/amdgpu: Remove amdgpu_bo_list_array_entry()
Date: Sun, 20 Aug 2023 11:51:15 +0200
Message-Id: <978444d1ff97c07c71473152728cc146d9cac419.1692524665.git.christophe.jaillet@wanadoo.fr>
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

Now that there is an explicit flexible array at the end of 'struct
amdgpu_bo_list', it can be used to remove amdgpu_bo_list_array_entry() and
simplify some macro.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 16 ++++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index c8f59a044286..6ea9ff22c281 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -87,7 +87,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	list->gws_obj = NULL;
 	list->oa_obj = NULL;
 
-	array = amdgpu_bo_list_array_entry(list, 0);
+	array = list->entries;
 	memset(array, 0, num_entries * sizeof(struct amdgpu_bo_list_entry));
 
 	for (i = 0; i < num_entries; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 368e50b30160..6a703be45d04 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -71,22 +71,14 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev,
 				 size_t num_entries,
 				 struct amdgpu_bo_list **list);
 
-static inline struct amdgpu_bo_list_entry *
-amdgpu_bo_list_array_entry(struct amdgpu_bo_list *list, unsigned index)
-{
-	struct amdgpu_bo_list_entry *array = (void *)&list[1];
-
-	return &array[index];
-}
-
 #define amdgpu_bo_list_for_each_entry(e, list) \
-	for (e = amdgpu_bo_list_array_entry(list, 0); \
-	     e != amdgpu_bo_list_array_entry(list, (list)->num_entries); \
+	for (e = list->entries; \
+	     e != &list->entries[list->num_entries]; \
 	     ++e)
 
 #define amdgpu_bo_list_for_each_userptr_entry(e, list) \
-	for (e = amdgpu_bo_list_array_entry(list, (list)->first_userptr); \
-	     e != amdgpu_bo_list_array_entry(list, (list)->num_entries); \
+	for (e = &list->entries[list->first_userptr]; \
+	     e != &list->entries[list->num_entries]; \
 	     ++e)
 
 #endif
-- 
2.34.1

