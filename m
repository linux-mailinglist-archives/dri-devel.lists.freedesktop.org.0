Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF6574F113
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB1C10E3AD;
	Tue, 11 Jul 2023 14:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E5C10E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:04:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-992af8b3b1bso745799466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689084262; x=1691676262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N9Uuouz6BCzdOfJmpXCASsGruHU4kdCFVbUUrlmsthg=;
 b=sUCJwZIPqfPEIgbrssAxaDRYd1iBASCwR+WRVu7xg6W3HKbWV4YzdBLyYvFldOTO26
 APVLJIzBYUArZQ8lP6pHtgpRl4AxOGUK+PibMF7WKRBOE9QV8WdVfP6zCf0rNDMdQ8bh
 dXTq2OzhvteZqOGSWgjPvPACZgIWtBZOjfHjuoTm+tpDykEB0C7cAyu4MEbeCg19Wwnr
 yOuyVhvqUekjWYwFt70e4KxaowtS6I57VZyqZ4Cw1f6aAKlz8I/m6r7CiIVYrBDRGUYS
 leVBQ3uJbrGf5aI01pudtOGfim3ocIQ67ooZ/5sYCmq6eP3oB44va7Zf4aRjb8H+ycLE
 FbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084262; x=1691676262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9Uuouz6BCzdOfJmpXCASsGruHU4kdCFVbUUrlmsthg=;
 b=CR/B5berMp2IBVHrzdohENN/hV5UWw0CfiHrDgA/GGO8z3wh4y7sS+9BpX4LZXJ5pC
 7Omytuyvg7dEII6I8dZU4zAhxj7DfHJAFW4EOBUdF2/ekAFhIeDIfGOdlfte2Do0kr4a
 SIhdwINCIub8fMb7co5gBvc4QmCw2fDfv/05VWQ0j9B47ata5R+HR/pfm1jENIh2i+3+
 fRAwN21FZYYkcCfu/WE+SFHRcOA1puaj8f6hyzoaM0ok6FIAriwzzjnOWxVOdABKUXB0
 sknpvnzWXFVc92PPw6sxypQdx5zcFR6MrJlniqvF9BDG5jZnI/yjX9D+BkJ8f68U43Ch
 Anow==
X-Gm-Message-State: ABy/qLaRHj5kGsH6cpdcfvPQzKGVB0VnvZ6kEneXAwjmxf+mR/1mO/qs
 mah+MBnLS/xlqT71uAgKeRo=
X-Google-Smtp-Source: APBJJlFDS1LhDgJBJGZjxZU0rh9MSXIOgHe1xDolv2i04YW9kU7GjIyqpmZEmM8uB2zusnPieGzEvQ==
X-Received: by 2002:a17:906:2205:b0:992:a618:c3c4 with SMTP id
 s5-20020a170906220500b00992a618c3c4mr17488829ejs.66.1689084262532; 
 Tue, 11 Jul 2023 07:04:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:dcae:ab99:6259:7e2b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170906505200b00989257be620sm1199006ejk.200.2023.07.11.07.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:04:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/debugfs: disallow debugfs access when device isn't
 registered
Date: Tue, 11 Jul 2023 16:04:15 +0200
Message-Id: <20230711140418.3059-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711140418.3059-1-christian.koenig@amd.com>
References: <20230711140418.3059-1-christian.koenig@amd.com>
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

