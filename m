Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164BC0A08A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 00:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6310E106;
	Sat, 25 Oct 2025 22:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="exaRtjRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF97210EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:52:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-428564f8d16so989299f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761299536; x=1761904336; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m5wnGoXKsRaTCFgkIGT0AkusbbG3tenE5x2rrfbGT6o=;
 b=exaRtjRzZAF8dAcZaQK1tPAVeEz+gGP76l9ltIVrVBfKApqCYqVGxIQXP5zmNQ4O5a
 ZZLSB3KqFqNin5xZT/5EjAP+esYJpkV0nysutV3TYkZaAlcl0ZCo/iQTzwVAsqrPMjEZ
 frWlmLfkHEViwjtVGuUuquq+KL2f3V8Nmpd3P81DxcDERAOBEY7MqYot/x9jP853d00n
 Vsel160SdFuvHL0OuS0weyTx2uOiyugpRpXZ/fFBNdGTC+lQURVdCzIxIZbFfH5mTqR+
 1txszNnixVM4hpAYhFhiZFaSs41jABftUpej0BYKNXSaQFd7TK3QJjqEl25T2Ejz3oCq
 ricg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299536; x=1761904336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m5wnGoXKsRaTCFgkIGT0AkusbbG3tenE5x2rrfbGT6o=;
 b=Me0vNy7ZH0Fq1hNhN8ckhvTJq+LZK4XIHHbFxWBH93BQcGnUrG8LXgBGs5g1HbuOAo
 4N+gjOg2KM9PdU18XnixMsBWhjVSZOd/MmvRW1nU1uDE5UVeLD2xkG9Z+b+0VDpbEVHj
 /ftGfTaqpyZnCpQrtvESbGyH4c7/FJlft20mtBHCr4xKxTxohc+E/PiRwdJmd+yX6nav
 1F+Sf6a0NGbjsvhN17rTs89WBGbU7ZayWXBnuER3JutvgXs47Fv9+iqd6nQ9zjpoSMyM
 6/yQoBxC2haIyxFCduXwcbYpyA8ETiIDaQ5LfMHv+f2aWGaah8R7iGs8wZp5iOzzp+PX
 ceww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrcg6rZZThXoznT5PJYnYOq/8Z8xS2d3TS/f6pVou8fhOc13RMjvGVITQTzjxjAowsot4NOW+FDJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGyEVtbg+BvONu6Bi9RqtGVnGKOv33huIiw60mVSdSpdnHszJP
 Wc1Q4bung8i3IeHX3Sgq4d8QHbxV7TTSwBIzwpk1EFBj0OtWu0eZRPo+lleVWV/iuaJcrGpkxST
 kkHUz
X-Gm-Gg: ASbGncshfywlIBlP54t+NrYul4tClFuPHasK0gP1XD2YXQgEUJ4yOqf3WOuuSnKpIVg
 Wmz1cgcRsV5rEQ7E1V54iwLN9o9glFn/j/H4+OcPfmob2lnVpKBTlQbzjuUALUoeT6zYOOzNggA
 S5bf8yVAFLLYKPL/rVuhXrNPGzUtNpHCGkPQQZYsm72H34M5vzfa9MR/uPzZIa/lx2QmbfqAebI
 aDVJceiZK1fUurQuc0pbyHqf9tRRZtUwADXk0crIUTFt7q6d/3u8mO9B/r9qZ9UIA1DdofWJ2r2
 kJivuaI9nUSUqZJtgT6J5TdRlixtVQfFMYmnZEj9na/rMkg+x3toKFw/LBvIO569Y09V1Kk/zmo
 xrxpGZ5z2SvIng1qXf4I15o0Vd+iZpzighxlPbHx0wuisBlEVi+G+7sUAPg8dAv2FmMn1GiNlPF
 4QRU3zhZxdKZgAJGBX/Luk8AKP
X-Google-Smtp-Source: AGHT+IGaWla0S3oP4FeiPYt4qNYawi3uGEvlwY3UsXLw1UfNDuPKA3jrU35DvurAR5mlQUu3V8qnoQ==
X-Received: by 2002:a05:6000:1ac9:b0:426:f9d3:2feb with SMTP id
 ffacd0b85a97d-4298f5768b9mr1681277f8f.23.1761299536428; 
 Fri, 24 Oct 2025 02:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57b7sm8402376f8f.16.2025.10.24.02.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:52:16 -0700 (PDT)
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
Subject: [PATCH 0/2] replace system_unbound_wq and system_wq with the new wqs
Date: Fri, 24 Oct 2025 11:52:03 +0200
Message-ID: <20251024095205.123123-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Oct 2025 22:07:05 +0000
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

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
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

This lack of consistentcy cannot be addressed without refactoring the API.

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


Marco Crivellari (2):
  accel/ivpu: replace use of system_unbound_wq with system_dfl_wq
  accel/ivpu: replace use of system_wq with system_percpu_wq

 drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
 drivers/accel/ivpu/ivpu_ipc.c     | 2 +-
 drivers/accel/ivpu/ivpu_job.c     | 2 +-
 drivers/accel/ivpu/ivpu_mmu.c     | 2 +-
 drivers/accel/ivpu/ivpu_pm.c      | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.51.0

