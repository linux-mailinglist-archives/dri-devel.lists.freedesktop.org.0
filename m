Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F06C2D593
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C63210E450;
	Mon,  3 Nov 2025 17:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Ta4X/m5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524D10E450
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:06:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso27774495e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762189578; x=1762794378; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/E+yekLZHoYnEpR/iQ6pLhaCNwhnBlrdLlxkEXpohE=;
 b=Ta4X/m5exPkiXH9QdU9aAi18kNKTUk4MdhnFrB8Rh0xD19cDIGNaNCo/Om/3QqKZYh
 2lACY96ivUJcYz85OPCG9QHcE2u+sRtM+AAY5OqfpuzjCX/VPFdMZHQUpffrKQpdpKAO
 TrtHLqI0ZPzhnxdsHXh1zf24ioRUGp8MnGZW8WercIKCrDdKmQ9Yyi8aBNjfzs/RwAEr
 ffcyLJAM3QihRnHVPelS5/bflNuXzbHW3AVNOeUh0vxROj1Ii9eewCkZ64kxZ7suZJfd
 bZCf7za21GwLkgHOfvx2P4SiOQlplYVIywqkDyC7Otgq7XsLEerGZvDoCUjfwi6D7Fh4
 NcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189578; x=1762794378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/E+yekLZHoYnEpR/iQ6pLhaCNwhnBlrdLlxkEXpohE=;
 b=QxCJTVGU6sQDm/zkY3pF46h4f2ZJwyzxSXmOYKl+UokhC1eSJw2WyfG9LUcZ1LzOCa
 NMlV4UiURwtOTc8c55M12Z8Xw3UDzlrwsozkUrEUfM7FVGh+2tuKIIoNI15eQQ92tpaf
 N04YU1KJ+xrPpaZ1cQVKTv1Xp0nGdL7uze1VJ2U9EcvcMPJWVYOmwP1OkUMKnxJHAvje
 wCOJPlQYCNOluAac5luJe8L21DUuO3H7hQxMHmzE1XdER/IFISHclpo0mbrt+ceunexe
 Ssm1RwwRtmOT7NpYzhkPog8M9nye7l+oN/y6SGbfZ9aAv9BheNcnZXuJElg7AJf9JMPD
 vaHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4aS3xDDg2qNptLZXcQsscWNYqLSh4F6fkiR5DVSToAqHBEF8dTzvUEcZzMEJOmuwNyV8hOGviDoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv3mFt6KUyEQjYvyWT0x0llmB4mbxrJJgtMpLa716breZmatx2
 yuIKSTPH9dY6mBUn/hA5PAi2cwdx4qtuEE5UxvCOMlOSiAM5wfamfuNGp6qNtkCY/SI=
X-Gm-Gg: ASbGnctPga2DYhfCR+HM2RZQmHD/oAlWMEgzq5CIfUMn0kxHTML97hS+ROtUzNC2eCY
 pmjca+wg5WoxQwtOVzX8EKnVIBaS4WNvK7iq4ueyMVHfUxgUdG0kc5L4Fjfey02zVU0bja4/L4a
 ILudPYL0Nc2TaASV7XnmTesHIYiFAeihkWD7oT/aoYQBODeVZawcBFfnX/mopkT7Wujqi/56hMu
 djJA3ZepQYDW0bvlb/elejwSCpbH3yqlWixAB0kkAR620uwruw2vXoSm65xBWjZLfhu4MqY0ISv
 iIBtuANOG4jGgZyPVvji392wAYx8XQJ0s08+V4Ayhl1A6TPOStDZjdvDOB91BxpMtiQ+mdqYOef
 jEMGW6K03BqMqfpsgFnVZkaF+mru446Lt2sG35bdAgJTNq0B2/u5vyv55G4eszH1Pb5wQnuAWqX
 Lngl4ajTYQZgOoX5u4wku22l9y
X-Google-Smtp-Source: AGHT+IHro/MP9UonungEHxvhQ8/oFTI0hKO0Ea28MQuK8I5sRHzjmtcpIky3vjVN1zF4UT9So2PeAQ==
X-Received: by 2002:a05:600d:6352:b0:46e:38f7:625f with SMTP id
 5b1f17b1804b1-477316381f2mr63094595e9.10.1762189578380; 
 Mon, 03 Nov 2025 09:06:18 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fc524ddsm89799895e9.7.2025.11.03.09.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:06:17 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
Date: Mon,  3 Nov 2025 18:06:04 +0100
Message-ID: <20251103170604.310895-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

The above change to the Workqueue API has been introduced by:

commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 34d33965eac2..38b42d4f930f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -486,8 +486,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
-	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
+	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5edc0cad47e2..566163ab96ae 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -291,7 +291,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECLAIM);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fa4db5f23342..8526addcdf42 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -48,7 +48,8 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
-	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", WQ_PERCPU,
+					   0);
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 7d2d6de2aabf..5c36da17f745 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -120,7 +120,7 @@ int xe_sriov_init(struct xe_device *xe)
 		xe_sriov_vf_init_early(xe);
 
 	xe_assert(xe, !xe->sriov.wq);
-	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
+	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", WQ_PERCPU, 0);
 	if (!xe->sriov.wq)
 		return -ENOMEM;
 
-- 
2.51.1

