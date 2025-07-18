Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3DB09B88
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394AB10E8CE;
	Fri, 18 Jul 2025 06:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U0YWP/1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7510E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:38:26 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so15461625ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752820706; x=1753425506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5HoPAphUAO2EbnrVJOWchFSmkzTMAMEzinf+ttewuTA=;
 b=U0YWP/1YSsS+BBlPyu2tTO8eoRyoqLbYkVGXDpX+gVAqxOVuVemQi5SYXMIkJ+EryC
 g7jS9WKHo24iMEMyyr5K0od0GmXItFVE0AGpGoGJ/zHhsy1UpFMSZ7IvDZN6UmewA4Eo
 jSrEpLiyal+PqMO7d2mKRBviC/6F5T4kvLcj0sAgMv5iiPNAKwtO+jC+ELyymBQL7kkY
 Vc0hmqk2SAl5AjRzD2goYBGgr5EcpuIatwVBd0ji7pwDeD4Jg11LQ/ZHoR+rz4UNUbO+
 PTlA3DnYvyd7RhM+YwqqHXbgMHed+qpIeadn+xtJTU1qvhWkXGVGss8EQv4gt8LbfQxx
 knvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752820706; x=1753425506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HoPAphUAO2EbnrVJOWchFSmkzTMAMEzinf+ttewuTA=;
 b=nDk4FQFR8LAlK7jWSzACCLEfcuxkyK6896LyXkDdBCUD+hjGKtgbwsUWfVhg10tPt1
 4oW7QAXFjeo4YuM6xQxnfYJ2FyevcgymkwSjHn0iN931kulcpcG3ePy58CQKOl+k2IgC
 EpQWMtUUyGBWsq9k0Da84kv9DwxONv9ASmBpeFTWe4Vfk4V55wbmme34lI9O07irb3J1
 bka7oXx8msxVrnFflLPmJHq1DUhd9do+PTLArReSxnDQZgHMy3BmLn2hQTfLMx5IGQ9c
 NM7/i7RT9lVV2yVhiahM7x7JGAvWe1h/S/CSG/kOJCqd1+M3LkgspKfB4aAsR0agQSwf
 TiGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVed0Ua+IUne17u3NRy9A3ZdBOstnfnTOJKkPQv76CGM0DdvShDzF9SxQvEG4cxWitTu0qT04TwFUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbbCouZFxIqDwgyhTJK/mhKta1e1kdJf7Q6hYoG7HrmeuHX1Ws
 cyeWLk2dH2AsqFCWE/4RxACLc3IKcHvrXt51oy91+mHtl34Ic1E6P4We
X-Gm-Gg: ASbGncs5qN4PuDrmT4KX+RQViLO4+k+dhdFDNjDLqhaduxwPp+0fyl9r6Yxa1MsLdmX
 wzoWW0CNAluygWlt/3dHm9ggcra7fPPt1SJPo5rb4vkvDXVtwK4x7xQiwEyEX8pJTzrtbz+Xbgk
 Sk5F8Bs4lYy52AnMNp5D0ljJV8/C1BxS4yTujhvuYbvv8INPwuYeO7oDvaerZBsbi8GVOqSUG0A
 IFnKGnKQdU+14EzYBkrZp7THVnEpgvrMqQLTyD59nHJ+jTJxoTXQehawhKTNVr4DgY+0kCHbveU
 4lE9UdzZAUSsNb/Ic2GzjohTJkRTqKYy0TGoBSSqW/v93KAy+hYPz5qjV3YhcURX+j8sQIJJpzo
 vscNbfmAYqUSfrvFUYiJ7L2iFrNvGDU1RntMX1xAbdQm0dT3c/O0gALg+hZU20+aTJik=
X-Google-Smtp-Source: AGHT+IFp8AtRv5Y7qXdM+APL+mOXgsmxrfKFtB3gAqBR/xbtDUOhFIRPdWEM7pbZErustHR8TXsb5w==
X-Received: by 2002:a17:902:cccc:b0:232:1daf:6f06 with SMTP id
 d9443c01a7336-23e24f94735mr120545195ad.47.1752820706354; 
 Thu, 17 Jul 2025 23:38:26 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b6ef68dsm6638495ad.205.2025.07.17.23.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 23:38:25 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] panthor: save task pid and comm in panthor_group
Date: Thu, 17 Jul 2025 23:38:15 -0700
Message-ID: <20250718063816.1452123-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250718063816.1452123-1-olvaffe@gmail.com>
References: <20250718063816.1452123-1-olvaffe@gmail.com>
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

We would like to report them on gpu errors.

We choose to save the info on panthor_group_create rather than on
panthor_open because, when the two differ, we are more interested in the
task that created the group.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>

---
v3: fix new kerneldoc warnings
v2: save to panthor_group on panthor_group_create rather than to
    panthor_file on panthor_open
---
 drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..9987aeb4608bc 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -641,6 +641,15 @@ struct panthor_group {
 		size_t kbo_sizes;
 	} fdinfo;
 
+	/** @task_info: Info of current->group_leader that created the group. */
+	struct {
+		/** @task_info.pid: pid of current->group_leader */
+		pid_t pid;
+
+		/** @task_info.comm: comm of current->group_leader */
+		char comm[TASK_COMM_LEN];
+	} task_info;
+
 	/** @state: Group state. */
 	enum panthor_group_state state;
 
@@ -3389,6 +3398,14 @@ group_create_queue(struct panthor_group *group,
 	return ERR_PTR(ret);
 }
 
+static void group_init_task_info(struct panthor_group *group)
+{
+	struct task_struct *task = current->group_leader;
+
+	group->task_info.pid = task->pid;
+	get_task_comm(group->task_info.comm, task);
+}
+
 static void add_group_kbo_sizes(struct panthor_device *ptdev,
 				struct panthor_group *group)
 {
@@ -3540,6 +3557,8 @@ int panthor_group_create(struct panthor_file *pfile,
 	add_group_kbo_sizes(group->ptdev, group);
 	spin_lock_init(&group->fdinfo.lock);
 
+	group_init_task_info(group);
+
 	return gid;
 
 err_put_group:
-- 
2.50.0.727.gbf7dc18ff4-goog

