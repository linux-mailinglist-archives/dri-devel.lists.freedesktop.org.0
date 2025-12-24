Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26486CDC8F9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6610F915;
	Wed, 24 Dec 2025 14:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="NcKKz6vi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556C310F90F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:47:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso3097105f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587635; x=1767192435; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4t1E/MiUGXvLFw/kkXL4Czha6KPayCy2brE6GCYi5/M=;
 b=NcKKz6viv0EchhEPQbSbwmDNJlzdcruKgd27+0vUs3s8D30BfBnxTs4f4s30syYa+M
 lvhshqfB+J75kokOL+3IGbeHtCBoCCDNSXhEw5H9aXPFWXGY6svjFM9gvDik4khpbhY9
 g/5q119AypwU5zk23iwQcNYDj6xcBOVqhmGnw67qNXG6PL4b5w3O7j2mrJ+SJ3BvDT1r
 2IcelqenoK8/DWD0lXrGivIUIW25DOXfEVa6q/9O7HvZeT8ZBev1nZEnk75XUWjSjnAF
 IlxKZZccj+qWbci5cFsLz5MOPKoM5XhaLmHwJLGwpWUutaljpJRsUCvN1SLvrHk1mdr2
 b+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587635; x=1767192435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4t1E/MiUGXvLFw/kkXL4Czha6KPayCy2brE6GCYi5/M=;
 b=fXZaV6bqu76lAv0PAvGWdkV0RYyPZ0UXu8huHHrKtiUhEblw6fZ8wSCvtuDzm2TmYC
 9lDdRKfhYj6dk05JhSrNbUfsnZUZCjwh2g4tnV9GAW5R8d3DYnTpLhorDMU8iYBi/mRM
 e2CX1y5CYnuDhIf8S6dsG0ruItBOVvC66a6LP7IrqlCKlQEPgb/NgjiPa08Q5dMxnb38
 BCRgDsEjsyq/cVrS3FpcDDDKG7WsLUSFiLYLCELFW1VEcsbGWoppJWQx7vSdBG4DEYQ9
 5BnUiXfJeBE8eaPG7APTmrMiAe1CH4ClePn/916pbz8zTnp6apPxvmlg3JgKGPag99sW
 Uovw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNr7rBbJs10Yd462n7fzPpIicFJmG6XNpxcOGIgbKh7nflQU9coQYsx18qczEzuormumc2tU4G2kk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsHnM5KpjL0L/EL44uawE/vmAN4W5R7/+v5NyxQAmnawnYF/1v
 sFusC7/Lduc6oOYgNOC2+2JoI/G9vC6hGqwnvlpg5r8ygQSEbWB21nmstCGzQ6/veXA=
X-Gm-Gg: AY/fxX7BKZvsM3z5Fdov6/3ZCSKeVCeU92mqdQFbDkCL61dsEopfYt9og6YI+0pWoEQ
 /lpUr13LT/mAaW+Q2WWvU2bnzESZGxg4u0OGwyXhdOmqgrX2ikt18toYJBvjE1/qeaQ7KOT69eH
 aAovLg7dj1siKe9bLZ9upPYXA6802kDjoQPjWyhrQDjrcQB9vGtnOr/9ViOG4Ir+u7zjTptxjbo
 g2TWkyDGI7Ttz8xPSWBuz7A/zBW44naa63E2Mt1THRvRu1dWHCAeMz9dYUe8/W7r0kLxZpvX0wc
 YgrLbu+fD0cDcf+eV8yFvEpVys3RXDTtXY3XxbKpqNjlJI+NiFXtGRccWg9BkSYF4r01QNl3/pT
 xMQxQoLuLKVANgujoxAa1h73BNPse4wZFzgv7jOqJr/hKbXzjOSfJ/xNO1ZRztSn1a9vZ2yZF92
 v5xlBrzZIV9y4Eld5qAYW5qGkbxbDLPT5v5S4=
X-Google-Smtp-Source: AGHT+IEKJeulhrpJLgbK9dpob+8IyJ1NCy1xxCMBiGm/xAEDmeBwBfPB175oOr0phJbTC6PTpIqLpw==
X-Received: by 2002:adf:fd4d:0:b0:432:586f:2a9d with SMTP id
 ffacd0b85a97d-432586f2bbdmr11861326f8f.32.1766587634756; 
 Wed, 24 Dec 2025 06:47:14 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm1041109f8f.6.2025.12.24.06.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 06:47:14 -0800 (PST)
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
Subject: [PATCH v3 0/4] Replace old wq name and add WQ_PERCPU and WQ_UNBOUND
 to alloc_workqueue users
Date: Wed, 24 Dec 2025 15:47:04 +0100
Message-ID: <20251224144708.61167-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1-2]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because these specific workloads have no benefits from a per-cpu wq,
    both have been replaced with system_dfl_wq.

2) [P 3] WQ_UNBOUND added to alloc_workqueue (amdfk)
    This change make sure alloc_workqueue in amd/amdfkd is unbound,
    explicitly adding WQ_UNBOUND to the alloc_workqueue() user.

3) [P 4] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!

---
Changes in v3:
- improved message commits
- rebased on v6.19-rc2

Changes in v2:
- system_wq replaced with system_dfl_wq instead of system_percpu_wq, because
  a per-cpu workload is not strictly needed.

- use WQ_UNBOUND instead of WQ_PERCPU, because this workload will benefit
  from unbound work.

- commits log integrated with commits about recent Workqueue API changes.

- work rebased on v6.18-rc4


Marco Crivellari (4):
  drm/amdgpu: replace use of system_unbound_wq with system_dfl_wq
  drm/amdgpu: replace use of system_wq with system_dfl_wq
  amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
  drm/radeon: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 3 ++-
 drivers/gpu/drm/radeon/radeon_display.c    | 3 ++-
 5 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.52.0

