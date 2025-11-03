Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C990C2CEF4
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9164610E434;
	Mon,  3 Nov 2025 15:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WsdfIlOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF29910E434
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:58:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-475dc0ed8aeso31260415e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762185482; x=1762790282; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ks3pir6UgwzDtWvI5xfb6btd0LOWX1yOz6qXljAdndA=;
 b=WsdfIlOW1+NP/8fzazvASHwywlD+A20dA4MkP5JRGcWAZibqISiwqvYwVuEkSStX5L
 nDa4HITTXxMwujn+NOU9Aqg/yWUP8R9wclUybFyUSOhpS849Dnqj8VTAlIAgDyIcjN+v
 YRn5NPbHFtKPSumqLF4tzaihpq+/wnlsIVgRS8HC91RyIlbujySgXrA3Fxh9rApxRNMs
 Jb6AxMu9pQ4niVoJd3Sv3HNPXFq+OqOThyCfpR2Mwb2sALgnVFJYCvbxXmcskGKXpUsv
 l7PBv8DutbdqadN0ztjArXINJ6+Et/uMr75AhgJAcr82zOjRk5Lj9cFr8oYXm5kGMsb+
 8vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762185482; x=1762790282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ks3pir6UgwzDtWvI5xfb6btd0LOWX1yOz6qXljAdndA=;
 b=OJcOiKgXltx1RmkZVU4P/0SHBSIxd6ioNSEtk76jOojQzL2Tw6aKXxoxqJrbGTzLAm
 N5CZmV0NsNVW0+umE3sB/CbAesMTrURPk287rUh7T3/ZoieJ8NJUStcFAgJGT7LUjZiD
 r+HsSJTDFiPRZQIOvefbZ/JTAS7krv3rbZ5gk2hQrE0VAjGc2J9Ery8Woby61M516YxU
 a7llDagMqu7SqOhpBj/AdBEVYsPqkxNgH1ksFW2MKOvEmgb41m7syt//28GyP/T2aTMg
 Lh8sbBU6qSJNx9okrMxcwLt+e/RzVfZ1mO30+7VVcJk/jZRjy3Wu3/BiECP31c0e3GGe
 Q76g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkcFnafKogUKqjfLzDtBwK67DsAuA0FKoO9nclu5qYGmohIzUEwKK8hTzXiiOlmdlegyKfN+Ga2zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxofjnpNqfU6pML06o8Y7BuEGZZvxH/IkMlc4CeW/ulIjCuk/WY
 48SoLIwNqdIufOBvSESimNfb4PGfbINYOLGXIJ1CyS9aOHlaVmOGcp8DNNKj254b/EY=
X-Gm-Gg: ASbGncvenJrqA3r0V3jqKgmgbZ3jSkrWizlgL/7aRudVM0pcYLPHI9d3MdIbDLu0vnf
 ah6wpx+lLDbKIuuUpXw7YWLvXKh/ptqEaDkaAr9TTdVfIa24phoOWaPhuZwurPJebmRZEdbERxR
 i0Oh8vwCLM0DeSmJO7zGql8SaaQz1i3LXLHZjQkF2Zu0SWqAlS6KHkNWeXvf+DdM7mYB6y+DOd7
 z/6ilhrDsQy/KKsyWw8DvymHnF6LmZtyd9UXlwKYzvlfdS5xkGbDw/QuA/YWuTF+9yRjvJqa4fC
 MRmy0yVqFNRodBfzhNB3lIIpM8VsR94+/0vQoXtYerc7u73x+Oy/aRL4q53Whl3W0h6v805zQQ5
 ezr+Qcc+69LT7cDQd+iA2k9ZHBIP0gKEg59F3C6gaA4LH4LJtgMc0RryVrCkzi+WA/xjQ1f7LRo
 QbttXFvVDHsU/px6oOZ/Eow9gX+7CGSE87XDU=
X-Google-Smtp-Source: AGHT+IH2AwkZW9XycQosIy4+zjrxvNZTD/pU4xDf9vZ24FbI7K8D4vqtE4qlKSR3Kfp8+HSpcK7r0w==
X-Received: by 2002:a05:600c:3548:b0:471:16b1:b824 with SMTP id
 5b1f17b1804b1-4773088be8bmr151144365e9.28.1762185482402; 
 Mon, 03 Nov 2025 07:58:02 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47754adcd08sm48245e9.5.2025.11.03.07.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:58:02 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v2 3/4] amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
Date: Mon,  3 Nov 2025 16:57:39 +0100
Message-ID: <20251103155740.250398-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103155740.250398-1-marco.crivellari@suse.com>
References: <20251103155740.250398-1-marco.crivellari@suse.com>
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

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Because of that, add WQ_UNBOUND to alloc_workqueue users to make sure
they are unbound.

The above change introduced in the Workqueue API has been introduced by:

commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..a41ebf257756 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -690,7 +690,8 @@ void kfd_procfs_del_queue(struct queue *q)
 int kfd_process_create_wq(void)
 {
 	if (!kfd_process_wq)
-		kfd_process_wq = alloc_workqueue("kfd_process_wq", 0, 0);
+		kfd_process_wq = alloc_workqueue("kfd_process_wq", WQ_UNBOUND,
+						 0);
 	if (!kfd_restore_wq)
 		kfd_restore_wq = alloc_ordered_workqueue("kfd_restore_wq",
 							 WQ_FREEZABLE);
-- 
2.51.1

