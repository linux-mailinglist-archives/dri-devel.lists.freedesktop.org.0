Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB5AE2691
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 01:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E254C10EBC6;
	Fri, 20 Jun 2025 23:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MCp1cuvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2410D10E254
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:51:13 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b2c4331c50eso1991053a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750463472; x=1751068272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BJggbDFgahoVLzRwsUM10ANDxacsIIZurnN1KGmwE8c=;
 b=MCp1cuvXg6OlqGAZYPhmgdQFfpACmSSrdr0PytssBWW33GsuELlMlPXUTvuNBA2R62
 h5G7A8y47/qTh4/5KpcZvQa7PgpMvkmUfECWpHsoaNK3HZq0/zFVKSkYNQ9GSQ1abA8a
 20qrl83BjYKYCzHim/Ev40bqF13n9qBwo5o3ncrUNgJeVZUUTEpSMVnakeLY+4c/DAwh
 8Qt85mxBzi/aYM/5k2bmTc5vOmXawmIg6CdpqYKRkbM5k5H5wyGvPRGXuvhNKQhHUNLF
 nGfuKQRPTJwq3oC9BnRrYccT2rk6J6h7Dp3Xa6olcjTZ0DUQTPtOtbBL9EcHDabXBDkL
 CrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750463472; x=1751068272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJggbDFgahoVLzRwsUM10ANDxacsIIZurnN1KGmwE8c=;
 b=g7tKcnZsNLdslkjn1CGKc/2J1NysW/dNJSM7CYJKYaM2LXuUL9y52hheGO5QyH5GsC
 lQTrxBHp0qsWN6f3bVxVFOABmGcFOt8B0tbqIL/+GNDNz5DxgM6205i6lrn+pdNTWLUZ
 XkmrCCOFnC78YgkRrWZoushdyDSfN5/msa8tDrsmuCOTyTU+MSI0kqfRZ5aIPniRUc3H
 5YC26hwre3TJrO/iDpzDHzqAtDiFR7nydW9280p5BkI6buqzVoXednNWbsoS7A/f3IyK
 E2mqItndXL+cd1BMf8RQsX9zsWS/YXEGjFgBD/9Z6Cs6ltNM9JV83xAgneLjdbxVW0T9
 PCSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOmf//H3RsnTwNEOuctZcSJrzX9ok0K1H0Ipi2r7QzeqGx0ix6kiww5j8PN2/c3Q4wKSghR0NR6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7iY6mXGiw60jTgH43rvw3943/rvnESe6xHZB2pzFAJ77iUPFn
 OOCgt/4xGtKS5k4RWi0W7OBVh4t6M8+PM6pna0SdCSk13CMswvQP3hTZ
X-Gm-Gg: ASbGncvT1vXnnTDHNZA60+imD5/IWoqeHkrb7LzZ/xDrL8wrXovYv6pJTS8P7wtZ0Ft
 ieJkx6C2A5pdPmPng9ltJSYMsmhc8OPbmELHI6K5qNLUys/7yA0fpwx3xP6zMMnvvor48sbAwWl
 tpdJqxIjuBgLz11RspeVhRazFlf5innbolq9r0LrT0r3q2tmJmPXaNh/Odu64b1WRmAu/nPjYSf
 GGEsTUAmUVCho6OgRuel2NQINdO5aerBJUKc9wHrY/GUOYheT+YVWPF5ny/IuSyKgJrUpVx0cdb
 ANuwzSNMBVrlIIQBms+A8CMV6D1K0YoVWzDMcAdQYGS+F/egzuA0aF6A0ioMM/A6UXOEVuTbOzV
 3w4nmSr6RVB90LGm9vavJ
X-Google-Smtp-Source: AGHT+IE7Gf80YdauKTLlHJx/1691HQ/ZMJ5S0nDnn5dolZyGBOPtHMDrQVVP52dMvXnCzNmlqpoDlQ==
X-Received: by 2002:a17:90b:1f83:b0:310:8d4a:a246 with SMTP id
 98e67ed59e1d1-3159d62bf7amr6819332a91.1.1750463472562; 
 Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-237d8608e24sm27699585ad.127.2025.06.20.16.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] panthor: save task pid and comm in panthor_file
Date: Fri, 20 Jun 2025 16:50:52 -0700
Message-ID: <20250620235053.164614-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
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

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 6 ++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 75ae6fd3a5128..8c31c1d4296b6 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -257,6 +257,12 @@ struct panthor_file {
 	/** @stats: cycle and timestamp measures for job execution. */
 	struct panthor_gpu_usage stats;
 
+	/** @pid: pid of the task created this file */
+	pid_t pid;
+
+	/** @comm: comm of the task created this file */
+	char *comm;
+
 	/** @refcount: ref count of this file */
 	struct kref refcount;
 };
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index aea9609684b77..b9d86b86591db 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,6 +1400,7 @@ void panthor_file_release(struct kref *kref)
 
 	WARN_ON(pfile->vms || pfile->groups);
 
+	kfree(pfile->comm);
 	kfree(pfile);
 }
 
@@ -1408,6 +1409,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct panthor_file *pfile;
+	struct task_struct *task;
 	int ret;
 
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
@@ -1436,6 +1438,13 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_destroy_vm_pool;
 
+	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
+	if (task) {
+		pfile->pid = task->pid;
+		pfile->comm = kstrdup(task->comm, GFP_KERNEL);
+		put_task_struct(task);
+	}
+
 	kref_init(&pfile->refcount);
 
 	file->driver_priv = pfile;
-- 
2.50.0.714.g196bf9f422-goog

