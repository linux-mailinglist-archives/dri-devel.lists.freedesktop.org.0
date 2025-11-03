Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B11C2CEE5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF05D10E433;
	Mon,  3 Nov 2025 15:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="VReoeqA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256C410E430
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:58:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so31506125e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762185479; x=1762790279; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uQ848GCsaR34084rjUbaciLlgRfV9nM886kentzS7Vc=;
 b=VReoeqA7k7bwNBst9ZcQSPXwOdWTwU0pMPwy/dH0pzO7aSWEz7KWOJNHIfQ3p8HUyg
 M+wZkKarIsbh/NraEJhdX9yN5VSwPi0IGa7rFtewDJqHLeaXhx987XGOXpnncaT46YWW
 IJqWfIEQc+CDnAVsQzNipNJi3hCTxoGZ57oD8q+KdT9+kpduqVY+vL40eMYqY79BkJzM
 LtlcK7+ezZBlm+fhF8C10ceNEbF4DXURx8xdd4GN1+YqKEhV1Lmsp9lmyx4Ke70yNeCP
 rTemMQENmOy1QXMlmXkwj/jlkOVF8kTp9hGT6MVRyYJvQXICPVW2xjom/1bZTSnw4JYV
 xJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762185479; x=1762790279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uQ848GCsaR34084rjUbaciLlgRfV9nM886kentzS7Vc=;
 b=j/K1sB2VQyQ35xHD3C63dQ4AaQS2Br57tqxIyUXiSIfJBpTBQBQNq03kTQ49vtpjS4
 8WrpAZwxPWD0VDWONEiOlsfZB/6QZTmkgKQPf6aPqFFFTC1H06JXPPCJxJmm5vip2u+p
 CVOwKm8l839f39dkp2on2MLSeOwefRdW8dn4IK6t7pc98f7SHuGCfOkdi4p4HyG28ITK
 kcmADMGtfhV3E1Q9h9P5VuRcv0K9ooQHn9Q3AZN3gQkYx36dkh6AQ1tjcq8l69i0nDX6
 E0FXzXhTGGQl8RYT6+kKz5eaBG3w8yBGUiafKFDIxUQC9Y9JQ8GMfjDnWnc5JtmTQryR
 VPeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtrkKNy6MfToIkd6eUNTEmR9rploRN5LQUiOeAdA2w9aLBXINNrYYvMJxq7RhWUfcTZIonIK69oUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKbOZ/3PV9+AkG8H63d2MZV7jRS8BDDf7PuN0y7W3l5evGOJi5
 it/q/3WcBm7mU1FBuT8K+kviltwOeJLrM+BVZxqXWvucfImK25YQU1TTwvCD03j4V14=
X-Gm-Gg: ASbGncu/EX/04iMCiinoVzE/QIxE1A9QVqSNWpxL50hVnO5XKSNTa+HBLXDdSHdZncH
 tjz4UZ+ltejH3PHQe/e3v2PAd7cdHkrEnLFa8QOHJ/yON5NaraooJe75035OP108tl+5XZaEpXs
 8O5XWdWbLMzVhiZgYyCwMAznWT0T1Ye4VB4S0+TISIYNz2nXqB48IfnkckVUMqll5wFZ91D3ZY8
 Qhy04kpv+VTeoQAp17T9YqEhhsUj4jS6/BLfPaV4keBmhIylrBVCS7c/oNwqy73peurSP3qSQBC
 DLO+Nkl3S/8OYegKShFnEkIbwGQrROuXdKoMzuHWCruXxlRx1iBVaAkF9CV6m9NaKHNO4ah50Nm
 eY2NsZ9icdxSVHl/pLqEGPcNqDIkQJl9dqeS4bphYsP5/na3mqtfbrAHx5wnWyjyq+kvA/P6DcL
 wy8aWMejrwGzCVHzBdwz4wGpyO
X-Google-Smtp-Source: AGHT+IG0MryL1RJIOETIEmTPEWauV7sZJaCuGO8cgFoGm1FJGjaR8gh53wOAHm8YYcRtBRwlQhnRkQ==
X-Received: by 2002:a05:600c:5252:b0:475:d7fd:5c59 with SMTP id
 5b1f17b1804b1-477262baf00mr153053775e9.16.1762185479365; 
 Mon, 03 Nov 2025 07:57:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47754adcd08sm48245e9.5.2025.11.03.07.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:57:59 -0800 (PST)
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
Subject: [PATCH v2 0/4] replace old wq(s), add WQ_PERCPU to alloc_workqueue
Date: Mon,  3 Nov 2025 16:57:36 +0100
Message-ID: <20251103155740.250398-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

2) [P 3] WQ_PERCPU added to alloc_workqueue (amdfk)
    This change make sure alloc_workqueue in amd/amdfkd is unbound,
    explicitly adding WQ_UNBOUND to the alloc_workqueue() user.

3) [P 4] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!

---
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
2.51.1

