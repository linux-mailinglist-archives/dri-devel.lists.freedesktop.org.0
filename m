Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E0C3BEE1
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 16:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2A510E008;
	Thu,  6 Nov 2025 15:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Fac3mVAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5B10E008
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 15:01:30 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-429ce7e79f8so811822f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762441289; x=1763046089; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9q33Ehb0aqC9B6A5x4aRuL8tc8kDojsM4ivTH96hSK0=;
 b=Fac3mVAnZO41oFV5wCNYUE3CVOPGawlzVAR6eRPvihoCXV6iTBa4XTjJ03yFNMnHvQ
 504sx+sXDWaAg6VFI5bOyYszC4S8b4SHjcS7kc7It3Ri1tsGoCCazMct7JJmwtBimMBg
 ROeQHrDWc+2bv84YZlqdAUl+f+G8EYYC72zfLuImgNDhVRbkDeuWSbc4qfk1LhwsLYRg
 jFPKcA0UEL6VCmcLrs3R5E0GhcemYrTbyQPqkqPwRO1arfbibfqicOvQ7MmzC5cwTd+S
 +qyP751rDgSTF1JSs32UTzP2sIzRZmfJLdk5EtuDWNNnMlX1H/xI1x2ul/mFhgsYP5Gl
 X5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762441289; x=1763046089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9q33Ehb0aqC9B6A5x4aRuL8tc8kDojsM4ivTH96hSK0=;
 b=Z/Z3LbpPujvFGJ95EBzya7BC/OhyTpXTXiB5yjEVDGOx1bJr3cPIRgmm39qKuFH+ls
 7EPf/cTuX7sHBwn8A1Pk3WNtGGFCKy36xNSfew5nE3YRllUWk7lM3/JnHZwHrq7Wn4eA
 g+k+blzY6JL1lIfRLfA2FlalJsi8FDgT7u0y1I2bk1/ImTGVxVQpZWetycDqs+w8aYPv
 DVJPtv07SuMhjxKMt4WCuD3gmTbIJ4V9lsZHpHyKhSwgpCkQ4gjl8Gkr7/VOtfqcbrSP
 lDPjbqICtFAv3UQ9IceGLf+fEzTeYvWF3i600A/qEsNRrhY2eZQ7FiDE7ItcHUrE5DS/
 +73A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs0ND5LUFSTav2fgQ53HuqDEzfPn/1meqDcAEAJt2ZdEhHCSJaCoj6ZlYytuKrBvG8t/mpnsQSJoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMd+2MJtg1WB1+dbCUTQh787ryDBn6q5aBCtJvLtVtAcUhsQ9B
 750Hh8m6oDqOOiv5gvJMr6BHh7MWXCGGrRGGSBWYtWFo+Xt4QHAkTsJPFJwJIqCXsTU=
X-Gm-Gg: ASbGncujUqqimtdT4ZfS87d5+n8rASYEqESM3aPlcvb9TL+wf67Wz0txF5zwKRakldl
 lvFpmSJwvhiCXsJCAfI6IHAoReE/c/17nHdc0bIIzlZ49A6r8OEvDaG88r1cRo4Rz3Hw+HEIRtI
 ycGAtvr+Y35RFlDPltcUfwV61axCHaOkOsZogK5PcAuEjWvga/18QJiU7opukObg6k2/66UsNcJ
 /mJ6ePaGSqx4hrk3ER6itGZ8GupFTexRKOsLnfi12jqBmW7MywBHe1MxYrbsKnsbCIo344iqcjo
 yYQNyQCXIjhbA4GcgaLmchMajOZqMLGJ8AXcZUSZohPITYiIMD21nBKzQL0ncAfxPKQmuEwA4DQ
 DcxgbkXaoPY/gpK85aFlZ2WPwxOhKjjq8dgbiITACtoOiYPUCBqt31KJIYXTCw3WY6QZvTjUHEQ
 aeIoVhastNXkD/fYlm40Rchps=
X-Google-Smtp-Source: AGHT+IEsFeQ6pFu7U+/BG5InY/YZgal1+DD+B2PUI/gvSc13hYUekISQ1y5DPHswsv/q41vwvjXBTg==
X-Received: by 2002:a05:6000:2410:b0:429:c965:af5 with SMTP id
 ffacd0b85a97d-429e32c9e17mr7078839f8f.10.1762441288471; 
 Thu, 06 Nov 2025 07:01:28 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb49c394sm5784038f8f.41.2025.11.06.07.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 07:01:28 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian Konig <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/sched: Replace use of system_wq with system_percpu_wq
Date: Thu,  6 Nov 2025 16:01:21 +0100
Message-ID: <20251106150121.256367-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

In the general workqueue implementation, if a user enqueues a work item
using schedule_delayed_work() the used wq is "system_wq" (per-cpu wq)
while queue_delayed_work() use WORK_CPU_UNBOUND (used when a cpu is not
specified). The same applies to schedule_work() that is using system_wq
and queue_work(), that makes use again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.
For more details see the Link tag below.

This continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Use the successor of system_wq, system_percpu_wq, for the scheduler's
default timeout_wq. system_wq will be removed in a few release cycles.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..13192e99637a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1315,7 +1315,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
-	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_wq;
+	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_percpu_wq;
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-- 
2.51.1

