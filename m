Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958DB02E8B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A3410E0FE;
	Sun, 13 Jul 2025 03:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RR8tUIsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798A710E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:08:47 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b34a8f69862so2692646a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376127; x=1752980927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jbn60TvpqcjemJ/r4zyupMTU5+LuSYLNJ8MkoKMnnh8=;
 b=RR8tUIsJPdQ/K3w/WcIqB2bjE5+ifRtggxB8ZwTKY9+KrIuq1+zNXQnoMKsm7J8YKc
 AYB2KmxFErh+CtQhMlsKtvg/YvOmUPphikhFyOuwYOq/daWaJp9dD8lBEdESBY1gys7x
 Xp3Da9MbUK3yG2WvQeC2jVZPnsIaFpaQu++ERMpRlxOIWUUiTuEwtw9aHJMWryjbEvRq
 eaMeZhP5W/+L993GTixjTo7uUXUkNG1o+8DqZByPFW2Pcz04+e/DWp1i8RwzB+kl1VFk
 pWcaIgwfvn5WgDgQY8ZHkbbreYB4J+4n8jAzOFpXTiHxXDMhz0ezwfT1nwoWiZKHpz8L
 VS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376127; x=1752980927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jbn60TvpqcjemJ/r4zyupMTU5+LuSYLNJ8MkoKMnnh8=;
 b=Uz65EY8/i7Z5Q2Jn5IpF+UicChF41r791DxrdwfF3qGK4M7UucmV9qJCJxSho2lfc6
 Y2n26wDpjuFy3/lst6sw3Rz+Hq3OSPltYWrSmOLojChK/DwGl+CCQWzOWso7tPs7ybuR
 VT1OAYw5bQ+mZs2ojeGqXTcGwQ0jRkjI1MpupSZbZZuczA9OvTjSobbj5g5msRuA2MrD
 cQxTsViKaxuBSfRFrhxY798iES/dtobEK8YTcznve4GrW1I2NCeOSZpszfqJJzVtKz1I
 GAnCNNRdeWPy7t5SiBSqgGinNARFWXUhcRZg7WvJQCTzpp2NTZHfANQ9rxyrRDwjobPW
 8A3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpBrDZ4MgrxVqpktz3HExmeKX7pLwhOe8p0cVX/6r9qPyHYbqZUnVLXN9smT1KGvGPbGmCP8zzwuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh9XMF9A8pVu/jldD326umSPvhVxjWLOSTbQOB0bzVj98VZIcg
 njgkd+pStvUaayRO4CklClj883C9U9fCZHvd3er+/EPn+1dGGRQBQMBp
X-Gm-Gg: ASbGncupGR5HU/2ucaSWB4Q9diKK5jNP+DsiTHZHyayDxnudIgDx/+ROzbKELEzTjll
 KJTFxCwRF3Uz2f0KgCp85ApVB/P1SLyIz8BhHJvlZMBG8yX74supxqg2/23X2/Gor1nAKUOV1qs
 SG32CKFLa8kHgmFo3u6hI0sywXwngiHGkpKroFzVBdwlxNdYCnF1u8TrQUp3G5dHeLsQV2/ZOxS
 H/Om/MWe7aQLf9RFmTPQ8uoUtxoOzLojkJbjT9+Yb0BG1rG2BCI7EfggN2k7ZyzyS6jEOJfvb40
 5hCl9IitHHIv8oIRPGaP4KJuBfPZyAgfoAAs1CFILQdIyG5LSK8izQhRSNfSCvRwZphYA9tcIpL
 1pUDXoZmEuTdN7cQAeTD9bpJY49eK3u0SrJcKp93GG5kGlW/s8Gv5bMSsRt3xUzXeTiY=
X-Google-Smtp-Source: AGHT+IGRurgG0gcgcuy8jSsUVy6ISTkI7Jpskf7HLDGGtwflEJua4uLny1RkZFF7c7d6ug6kAXwPcA==
X-Received: by 2002:a17:902:db08:b0:234:8e78:ce8a with SMTP id
 d9443c01a7336-23dee3a62f4mr114608565ad.48.1752376126802; 
 Sat, 12 Jul 2025 20:08:46 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23de43226d9sm71023865ad.116.2025.07.12.20.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 20:08:45 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] panthor: save task pid and comm in panthor_group
Date: Sat, 12 Jul 2025 20:08:30 -0700
Message-ID: <20250713030831.3227607-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250713030831.3227607-1-olvaffe@gmail.com>
References: <20250713030831.3227607-1-olvaffe@gmail.com>
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

---
v2: save to panthor_group on panthor_group_create rather than to
    panthor_file on panthor_open
---
 drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..823b0fe678ba6 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -641,6 +641,15 @@ struct panthor_group {
 		size_t kbo_sizes;
 	} fdinfo;
 
+	/** @task_info: Info of current->group_leader that created the group. */
+	struct {
+		/** @pid: pid of current->group_leader */
+		pid_t pid;
+
+		/** @comm: comm of current->group_leader */
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

