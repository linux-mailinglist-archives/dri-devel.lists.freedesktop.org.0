Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFCC1F11A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CC710E924;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Q2+swA91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0D510E201
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:56:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4770c34ca8eso480605e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761757015; x=1762361815; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yIJ3dMVPQRqYkVtVVJ+BHYPuM04KT3nCIS1A9DH47jI=;
 b=Q2+swA91zktHmjqcZjycv1ED8Oe6fFff6rmrE9uZHCMNCrSsWPjmApBNMWZBhQnGP0
 8wIc+M4JebhaJorrMTRA6Ejb+78PN9At8IaIJFR6XeDZoRXK8fV93L41vhIQEqu9Fhar
 2TY8JBU3PN0ZXuHwkt3NgydemmHJUJZBjmbNZQTmwnLS9xxn16aLUvpfxFHiIFNyjiAu
 3kzKtS8Df2VtJc21N33Yk9XS51G6gV+1m+6Ou0+UyNZekmFBhmPmErr0Lv3BaA/lnHDA
 g+sHgGsZ33idBprs6xq/g3aIf4ShSMQ+zMZ5QyZb+pB4QC5hyAUjiMpWGJGyM0GIANh6
 ErvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761757015; x=1762361815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yIJ3dMVPQRqYkVtVVJ+BHYPuM04KT3nCIS1A9DH47jI=;
 b=doRvBQOVKFrvOsoEkd7TaIG6tZO+nV2NnHZrCbC4lY5pmh827hoD9VhTAoYwd5X0CR
 Aym18CryLU8EeJqL4V6ewEG9h8T41609oWyCFHW3DQNaLDMlPjupd+Qb5aX5spBoXcGT
 T9mQ3UIB0L+YPXsCgodQ8VUEMCVVlwu8NvmmJ0iuaOgdFO5UiXLWRyKUtDRqYK0tneWW
 RcAUJbn+oTJRXIj+h1tCyP/wAAo6RXL3m9mtVVJF1F2/VLG+GjiEwDLuDr5ufUGRHriK
 /v7KYglZpH1qu0pN93uRq2o+S5zrKw6r3y1zAMDlNT+rbXD6TG5X+0ddrJkSJMQmVxzq
 ZSqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC23/CqjmkeVcs/olLwWJI80ztO9KME+Y0XXh0T20RH5Zbvq6G7FGerhNrGkdo2nCwjVi1+9FLTfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8UIdOZlQCqy8z/KNxlKwQtz6dz38mRyJEIFkbvDmUrt5Bzq1P
 Y31HOwtKV/1GAh9AwnLHqdz/jHJfCovrSfXgLOre6PhV2NDWS2dJnzHNoH1J3OJri5M=
X-Gm-Gg: ASbGncuoZSVB/+rrEx8so8+kttCQuBD8w1sW3dl/BTK8xWrP3PMV9jAA6cUSbA/mCqp
 ssQHDf6eyUlBsL7bxOxqMA8kWawlDXrqSdZNuBc8iW/Me0aEdWQoApHCcZ5W25FTsXs0jzwl61G
 4PksRKJ1HDxdsFMF/AaxatUUT62zz7OQYbD7l+2ewLX7zVYGsqLDNKdhRhuEpf7U4OFIkam/gc5
 7Ag/zVV5a6i5ez4hZeeuYA9nO6ONTE4NVyal7k81SrtXjWPUwGoENyshN0nfflUFA6wQw9yNFYj
 M3pkHTZvz9TSfMGqGQp3YfDhHEHDtrFh+YKm3BXGJgykjBHX4u7xADaVEijz0bejEXNP+yfmrnN
 dGocBQqEbhtsZFASvug9DrxqrYLfu0MtMICQYQXz5FzC8jMaXbx2HFKnGs51jrpcUEjo5mVNvQ4
 bKR8jQnI9S3pWMcIkjOmKZjH/Q9w==
X-Google-Smtp-Source: AGHT+IFYqJFZsAhoFPyNU3nEUwUIKl624El6R6Na+elRr4qSnpCFvVFBM9qNlTlmde2qxGHGbegNmg==
X-Received: by 2002:a05:600c:34cd:b0:46e:5b74:4858 with SMTP id
 5b1f17b1804b1-4771e34a909mr37714225e9.13.1761757014626; 
 Wed, 29 Oct 2025 09:56:54 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fc0335sm48393845e9.2.2025.10.29.09.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 09:56:54 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v2 0/2] replace system_unbound_wq and system_wq with the new
 wqs
Date: Wed, 29 Oct 2025 17:56:40 +0100
Message-ID: <20251029165642.364488-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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

1) [P 1-2] Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because of that, system_wq has been replaced with system_percpu_wq, and
    system_unbound_wq has been replaced with system_dfl_wq.


Thanks!

---
Changes in v2:
- Fixed warning about length of lines

- Fixed typo in the cover letter

Marco Crivellari (2):
  accel/ivpu: replace use of system_unbound_wq with system_dfl_wq
  accel/ivpu: replace use of system_wq with system_percpu_wq

 drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
 drivers/accel/ivpu/ivpu_ipc.c     | 2 +-
 drivers/accel/ivpu/ivpu_job.c     | 2 +-
 drivers/accel/ivpu/ivpu_mmu.c     | 2 +-
 drivers/accel/ivpu/ivpu_pm.c      | 5 +++--
 5 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.51.0

