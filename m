Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8FC24685
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7E910E2BC;
	Fri, 31 Oct 2025 10:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aLG738LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAAB10E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:29 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1271907f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906028; x=1762510828; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K3B/i06NPGDlGfPSmm0JeDJD/jaUMsY04sT9K+okWQQ=;
 b=aLG738LNBOEb14M4qfpL1t7uWL8k3GMrIVFjsVyNNxIHgoFQcw4J/fUK7r8xxojK/C
 fP2eE0FND9mXjxEh6e1gNskBVbOGeveOdUwoqokZvHq0uqwbIEaFjTjNwAB2LHzEUh9P
 4j8BsAt9ycBgq0ALUduseiFh1LPI34pJXJAXRibqjdgy01yOqi8Y4a2p6lvxdu4MC9L/
 ILXlEif6b9JLcF07mmIQsnC64s4vN4youHza2iRXcPqQ3kxuQLb1jbhXipa7enC51ina
 XIRs/ukWdmKHe1IV4+SMqYE+5Dz7o3+Tc4T8RLD9hWufVzbysMUWL9bhB4jQyOsfYhH9
 cF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906028; x=1762510828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3B/i06NPGDlGfPSmm0JeDJD/jaUMsY04sT9K+okWQQ=;
 b=oo2LUM7BMvIc16MWfqGt9mdQaISTLZXWGl39n9Qr054nz+35AW5zNakl1l4GbNOnYp
 xvv9pxqchKe/aVGyAS5EyqGidNHy27ZO3oCkxubheSstrZmAcW4IVTtbif0PDZsiXMxq
 yEgIM0sZLPtNvRr/mo4a9Q2E15DIt1VQA6+gydHUhqWADnF2jZSh0OfOBLNaqPqHz2vM
 ZYkZ1PWfc1wCstOUtn7cZMUVQlU9RHW4b5waVif3Oelkh0VG8O5EyhpWPnR+3mZ3d++T
 th08B+58ef2eo1lcHbK8vyAQPuT0eZAbXNqpAQRpuA+7W6zNiRujN5DpobyCHDzLBG/G
 l+Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXWrpomhuRcJv8Y+nrldzYKT1X88Q5vErLNv733qIdCtYOi3QJG43P8YWh0oM27ufX8NKTvplzhNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO8Akt7+hfXJJAI8dre8puXkA/BxvqbXzr/X9eLN81shXlBvrc
 Pbq46LlZspLwrxcxxRQ7aFgn4iNt11+uzy4MIvojJH/uxUVSPfg41dvdBoK8kSoP0IM=
X-Gm-Gg: ASbGnctAOYh9NILG/zdraGKkdziu3Me/9qEe3BW59h9esJWH9mDCrfGTPLBBGUZSh2o
 G3U/0CqLIeP8sG2ZdNqstbkfNxX+4gXV/azS5nOQGyTNuFbDLBl6x4e3GEVf6cHK/Ku0YGPdis8
 2aW8P6+rNLJ8IqX3R13pb/+B+2s8vU9PggrZXK/IbKGq31fm/XrshHzXSsd81clXpQ0Q6ciFBMR
 W6eLrlMsP8neXt57aWyoOFeGMaBBLUGvAMXETHFZqGR9k+S8q2wbqdtllJ6VoFryRNTDu9lAEO/
 ddV1j6N81s94Uv2IJHZs0/lA73SE9k3+ye9a68slyO5sPf90H2McYtstl8WhjCYhQ1VJYL4QpSW
 srAV1CupGQ5L9XtbtMUeHlFsa5iiHS0cMoLlKnBDq1eIkcKj5w5ZtPSO0LIBIJBsI2fKKm6c8RI
 dWN6PLrMpAc29NrxLtjryNmWA8pJ5dks3tPFTXbFP8a3S3JA==
X-Google-Smtp-Source: AGHT+IGfCTVgpG9l9puSWTYiK3G0d8gKcngL5r4WJ3Xi2AmzTOfMv+bHNEWDuIFmlbATDHcuNOQgMg==
X-Received: by 2002:a05:6000:2892:b0:428:55c3:cea8 with SMTP id
 ffacd0b85a97d-429bd6e16bemr2293210f8f.50.1761906027732; 
 Fri, 31 Oct 2025 03:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:27 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] replaced old wq name, added WQ_PERCPU to alloc_workqueue
Date: Fri, 31 Oct 2025 11:20:18 +0100
Message-ID: <20251031102020.95349-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
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

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
	system_dfl_wq, to make it clear it should be used if locality
	is not important.

2) [P 2] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!


Marco Crivellari (2):
  drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
  drm/nouveau: WQ_PERCPU added to alloc_workqueue users

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.51.0

