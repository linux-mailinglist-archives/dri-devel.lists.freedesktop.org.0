Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B26ECC06
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 14:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46D10E4E4;
	Mon, 24 Apr 2023 12:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAB810E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 12:30:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso610387566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682339431; x=1684931431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9Uuouz6BCzdOfJmpXCASsGruHU4kdCFVbUUrlmsthg=;
 b=Ry9iK7sbT0TECKzVjDSCpDSl3yTofrBBVKHs/8TVP9JstWw9y9UpWq9wvdI0hOn7Zj
 ztDUM/FAeMcJqyxK9VOvJ6yrh2ZFFZqnwSGWxLHsN3U5OSPPA9qBjctRo98KGe/7hifH
 rk9EUSv7jz+PJyfziclwj6IHZlviWOKJJBdSrdbqVzApj7aA39ZNWCkZwJvaoDhL8+UP
 rfBEJv3rCHDnbHkieiUqr5o8bD6lpwrPwpHO5mwUvjme5RDRBngXRI/3E3hs9v3E+v22
 Mkdoztv7bWiZSk02LxhuKNjsbLevVKxobx4+V9VbsnsZ9PhcugAtg4sGgpGGkYDZZv93
 8cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682339431; x=1684931431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9Uuouz6BCzdOfJmpXCASsGruHU4kdCFVbUUrlmsthg=;
 b=DdGNyqkpItWL6Hx1oz6o4+a3gz9veFi8zLnHuJYSzkPIdPb9dHw+Zx4UGz/yhoXprH
 8bM/LP0e9QnaJsDOCsJCFGNxSLgT5yr/GqJD7EkFAnE5l7BTh00cg03+6xYIPjIsgHNG
 abQzk9odK1VlhDfxx5uoyPwS1DCV1Ul1cZVPRnWKf93Tz8WxN4HtxZfzcrFqmHj9scJ6
 gj88W8x3AhmpMR2YtgM54rpp2Zsc9LqwfhNx/OfUO7VNSgiuQR+zrNVvkl7SD5IaOwN7
 gDDDy8lCnKM0J+F9tmYtyR8UXP1GIjeodPrgjpedaUnlAIbqu4bEReb/ATUnqn5BL1kR
 1zBg==
X-Gm-Message-State: AAQBX9dkqJO1OZFP/Nn6LEcFM/lapIHOBkenSRXUMbSpoGQLUhyrqzgJ
 nRKcbCwvOizM9pvgkB7fKFD6jwKk8cr0mg==
X-Google-Smtp-Source: AKy350bho1B1w700yDHgPFECkLGUJWHjR88gdV4FxIBSGpOvCxld8CNBmLAHYuU78eZYCRSidfC9rQ==
X-Received: by 2002:a17:906:ecb7:b0:933:3a22:8513 with SMTP id
 qh23-20020a170906ecb700b009333a228513mr10168645ejb.53.1682339431155; 
 Mon, 24 Apr 2023 05:30:31 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 wv14-20020a170907080e00b009598cbe55c2sm1608146ejb.28.2023.04.24.05.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 05:30:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/debugfs: disallow debugfs access when device isn't
 registered
Date: Mon, 24 Apr 2023 14:30:25 +0200
Message-Id: <20230424123028.25986-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424123028.25986-1-christian.koenig@amd.com>
References: <20230424123028.25986-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During device bringup it might be that we can't access the debugfs files.
Return -ENODEV until the registration is completed on access.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 54376e2400bb..796cda62ad12 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -148,6 +148,9 @@ static int drm_debugfs_open(struct inode *inode, struct file *file)
 {
 	struct drm_info_node *node = inode->i_private;
 
+	if (!device_is_registered(node->minor->kdev))
+		return -ENODEV;
+
 	return single_open(file, node->info_ent->show, node);
 }
 
@@ -155,6 +158,10 @@ static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
 {
 	struct drm_debugfs_entry *entry = inode->i_private;
 	struct drm_debugfs_info *node = &entry->file;
+	struct drm_minor *minor = entry->dev->primary ?: entry->dev->accel;
+
+	if (!device_is_registered(minor->kdev))
+		return -ENODEV;
 
 	return single_open(file, node->show, entry);
 }
-- 
2.34.1

