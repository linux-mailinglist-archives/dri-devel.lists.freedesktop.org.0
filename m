Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E078C2E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5110E208;
	Tue, 29 Aug 2023 11:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698910E208
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:01:21 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so64689961fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693306879; x=1693911679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zB8II6OIU0PeXoXNV+it2gU0mMIgzfk5ZSPUFJ1PZ78=;
 b=rVw7EMnFpEHIT5+yK4o7IzjStqA13ysUCTj6gwCwh4Hws/EX4wdm2prMV6xdh87KLi
 pU1nm4nz4NN1cpOqQOGRdPx030+PMWiwidWRKe+N+HsZxeKZ8VSeRELcywu7bvopflbf
 xnuXETGuAUjOagJlxILHmkyT2QlykoG+xculgilKCqkh6L2vgMQza9+G6WSl2aClvmnP
 4R2qUYEKLydvReeWYFsDnvwm0WXCJIQqa835bu0aOFnzVJ8Yy4rrO4wVlApy8QishhNR
 iRSWoQ0pluD4gtm2PHlB1BZ3Z9CCrHTuC46P3r9eSeFkpJf5UDhf108p3VTn4cOqESFg
 /H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306879; x=1693911679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zB8II6OIU0PeXoXNV+it2gU0mMIgzfk5ZSPUFJ1PZ78=;
 b=kyZ2aGjaH1IBU5E4RfQUnX0XKPumFC6ohryFaxIvQYQ1RlerCooBLjzkFXcQtNzlB1
 4lEYXRxzM6AiqSrfXJ52NKx0kW6cOawqJJzb+jTnhoI8bUwNRNY558+ZIqirLYCQkAxE
 qF7+lS5dsua6khC7lZ2e/SfbNbClCOZ0WSJwYSs5HNCazLRJ1jEnUIoZkGQAmtJ/Zdb4
 KSy7Q3UKC8Ba95sl1ubZAUts2wcnPC8JRHn9QdoGyTl8YVIwf+7ztq4FiQqtaomyoPiD
 PNVQLuCxWDM1MWGl6XQGO9ZJgfewhfUPxrWhaW1yiUoRtlblWA92WNF0B238PFUkcONb
 oJ7g==
X-Gm-Message-State: AOJu0YzZx4GYjJGh29GJZtFyOEH4Jvs9JLLEU5QSpFkKfHI9ip+zCjta
 QtPSM4qaE9kuJcMDthaE+P8=
X-Google-Smtp-Source: AGHT+IHGWaXQVxGvQ0eK8y5FopNekOLCjSmaOSgLJRB9cYcD/3tYw4pI36oCUTK/bTcCectsPo23Ug==
X-Received: by 2002:a2e:8210:0:b0:2bc:c21d:311f with SMTP id
 w16-20020a2e8210000000b002bcc21d311fmr16406280ljg.52.1693306878972; 
 Tue, 29 Aug 2023 04:01:18 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:d500:cd84:8e32:621d:b36b])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1709063c5b00b009928b4e3b9fsm5805885ejg.114.2023.08.29.04.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 04:01:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	ttayar@habana.ai,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/debugfs: disallow debugfs access when device isn't
 registered
Date: Tue, 29 Aug 2023 13:01:12 +0200
Message-Id: <20230829110115.3442-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829110115.3442-1-christian.koenig@amd.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
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
index d90d0827bfad..8a4c90fd9f02 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -150,6 +150,9 @@ static int drm_debugfs_open(struct inode *inode, struct file *file)
 {
 	struct drm_info_node *node = inode->i_private;
 
+	if (!device_is_registered(node->minor->kdev))
+		return -ENODEV;
+
 	return single_open(file, node->info_ent->show, node);
 }
 
@@ -157,6 +160,10 @@ static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
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

