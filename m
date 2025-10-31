Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6DC24A98
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D410EB72;
	Fri, 31 Oct 2025 11:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="O8hbPBhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6188710EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:59:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so1387153f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761908395; x=1762513195; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtaLGTlpD3zXcAXtMJEoSUxTvoU8HRv8A7mRZZemTDs=;
 b=O8hbPBhbU+9KBRxoFuGYT2RRgqsa3pK0I7WVToOWuJuAxeaU2SKJrBfHGMOl26B30+
 IdduQrHBzHLGTSieYe/X5oZBOFkP632MGFP1W2CQ/Yd4jGjgsk20E/212xRt1zC0SQwi
 L0g7DePukMkUlU+SF3FDLDrOc0JwQY/neVieq7J0l+SpfGfMkHzRR6g1tK0o8Xe8ceZ5
 U4ZkGTX91+jQJJ3zVaL7y0vv8shQ5WDQVX5Ji54k8Y+Wc9bia7CLmuC3YdxUxREuZLJE
 eiwJL8or62kWVFtxj0dgNDcD7hGUZOjBLXAiBfT4wlxepl8y8PB7GrvpRKH3n+zmIHEe
 j5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761908395; x=1762513195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtaLGTlpD3zXcAXtMJEoSUxTvoU8HRv8A7mRZZemTDs=;
 b=Cr8iZLX0yUR134bHCUTo1ug5UNzlb9qDM+655o5DeFaiG88x7CK8EBTSgqMecPDgjT
 s2AzYZCqLLfWlG+MrOJTth2uJ83YEeKSWAy4LNXgtTJ0B+E7hSmoaIsTxWXxGlvac5Ct
 XcLASch84/dNWjScAh+6AxJiwc3zoiyxUq98glHgld0QT9WhWtNkvu6saAMUqXVsga+l
 lR2/5qZojy5xQCHM2yDz/nC4ETunuDxZCRblKWCT1spWVzcqRYrOhTaMprOc3YJQlYnu
 UuIou5/K7zAvqXhHqdlQfyqsORsNQ+GTaxuTGyVjMhK8JDGprMHDW5CoeL6nMoxwenVq
 SkfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvj2M4enrWNUK69lyA3aIoy9Ioilf8cs/Y1ioNrW5Uo7PijyLPGhuvQiVlRIig7HlOaWfgeXqSgp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo2neHEJYBaZTHyyakdroOoprcCrA4D0JeGYKGLlWskJ7Km2Kn
 jjUn42n7FdWArFL36BgfYOR7JaBx0zD1GzpGsyBUuGFHBa4i0ygJxKbpaSuO+2jc4rE=
X-Gm-Gg: ASbGncuB7SwJqdu7kKx53DCUV2Jr5LVWeEW9vykESosgYHu9JmwaGdVfJ/2GJfh32Sh
 fUQMRBAkG+Ezhx5W5Pbc6QOE0e4DdsUOE9ifq6pVcs8j0HXk+47kpE1e284nDw4oe7n1PpHXdnm
 PeUAoEot4JAKONiY6DrUClRyycnYTjmz3rsxXgZVyQkyXMs3yhtAvF4MWEF0heJe+Ea4/lfxFvg
 Wr83AgxoWL7WSV5MI3hulZJMl6AwiorW+1JFqKo13zDMIXkYQdeS7rQ+FjoaCXoxqYhDkDsXLqx
 KuvSNSJsbDw2j4Fo6gG1WZMWOxteJM0IgGs8Jibv2POL0TjDY5ifhyCxq/OIQa34OvRI5U7+lk5
 kk/Yz9jgiSCbBx6M6mWToc9luFtogUZeUHK73jxleplK9eQjdJqAfWoxK3dCwlLOC1eOfI0pv4+
 xFYh1J39DWzMDaclXfwOhjH+ACOpAptq88N/M=
X-Google-Smtp-Source: AGHT+IEsdl8gncmk7O5sGQX6oiw6d1c49YNa/Zznn0PBesJNtmDV3CtY5LM2CvoEk/+qA0YvvOvK6Q==
X-Received: by 2002:a05:6000:310f:b0:428:3fa7:77ff with SMTP id
 ffacd0b85a97d-429bd67a046mr2960086f8f.14.1761908394888; 
 Fri, 31 Oct 2025 03:59:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110035esm2965528f8f.6.2025.10.31.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:59:54 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/xe: WQ_PERCPU added to alloc_workqueue users
Date: Fri, 31 Oct 2025 11:59:39 +0100
Message-ID: <20251031105939.129200-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031105939.129200-1-marco.crivellari@suse.com>
References: <20251031105939.129200-1-marco.crivellari@suse.com>
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
index 2883b39c9b37..2ad633abf3b2 100644
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
index 7fdd0a97a628..84466be244ab 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -291,7 +291,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECLAIM);
 	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
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
2.51.0

