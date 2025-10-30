Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED748C21CE2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAE610EA05;
	Thu, 30 Oct 2025 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MUHBp5Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FCB10E292
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:20:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so835817f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761841252; x=1762446052; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a0WrpRXaIIPq62Cazh2atC//FDY9UEnvwzq9WIxjhlI=;
 b=MUHBp5KabuMrm4kI3D21XCe8METULnkB7VbaO0wCP53+2Ei5nFAqyiFInyeSGm3THQ
 Cor78+pnzf8VnXlPbbOb5Wgl9wPad1sqEwf1j74xMYEBjn1+1HfWp2e/PsvKHUvW4qrx
 tT557QO8DVusHeKTceRqAbLo64TmDO+JJoyC1cYYAUIw0b8qsIXFNc84FBfla8N8gJOk
 RH+SJJ52Xu1wCwtBryO41OZS3Ii9ItoR2/iQmY+kOHZS80fmJJ6oDB72HnyfyUc0/PjB
 Z9d12ocgwZ915nXSWS8CR0RXX5ArGVBqbWY8g1Y5en3zNxZ9ZIOanefULZViYcHJJUFs
 d2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841252; x=1762446052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0WrpRXaIIPq62Cazh2atC//FDY9UEnvwzq9WIxjhlI=;
 b=AnAEA+MijQVm4yCzWGtqRT2oa0Iva1XJapM2PKRJEDPUH9Ef8YoutS4A3D+oWPOIZu
 bXXTsuzY/6+o2RCy4wyfA2rqRf9OM3ozKwo41klyIP0I0dnE3rV3EWtXGT/+h28JlaS4
 SY37Qu/2khCL3mOxLmZLdkbnumVAbfjlbQTA/J7UpqhlDG5whpVO0wvfBBN9D00CkHx/
 N/Wp7ik9NV3sq1OCkzwghqHhLxagjn2LY9f8IMDPQY3R/e4fCGHr+JUHD1HMolGY0OVe
 gL93FJx5vHMDkAyJBRC4xVzh9npwWbgfQg14o4mqsy+dqSD6/Jfsj6LGWGrio/Y4vkj0
 70Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2NAlmF12b0/PNYOLmYcCLGdFL0PhKAcm6doBQuwB1AJP2yB/x8rzWzH1Hu7hroPS78FPJD9He21Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz7AQMtVsIWFVtZW8OBas7JZXT9QYDTZUvMJjdakuhHmVjWrZ7
 3Yq73J7k1kmdUB1gnTZ1UNADzHxMF9lKkqScAG6huaWZR06STPW98EjZjdRDfi/5EdIlSWW3C/9
 1fFCr
X-Gm-Gg: ASbGncuAScbzZ7t1sHu5vjsyTtpGOr8f7vXl/NJ8HzjOCB+xtCowGJPgCLQYpzPhi02
 YXFgnDyuCOTjhgaGKl9iiIEPfFkarbkam7hb3Y8tr0z8oq9FoUB6MAYaPTh8GpsBZeUfswHnkg4
 qS0hogDXkZM5EbAuveJPeIak6IK2sKVUUCoq4zt+GfrixoqXDXdx1Tt7Fw5Z18v/Tadlr7zTphz
 VgG9FkeNZD1Vq5OAbpmXCCFS3k47V9ITPHOX7J9WFM7phNwXYd5LHTDQthtFCxRmAqtZeu6vCxO
 XXD2wjPj+nP1gl2oCzyoE6RfnyAFmM+PQB1+oJwbSBIZawDQdZ+lOhnvhUqpTBzIi9dLQpU9qvO
 nnC5BK9rqgV8RqTask6NMggCSGiE0sYUrEbsnzifvNWvKMEOZ0LBuacYbXqqFF/vSAwpun9ALlI
 1wNQROlEOYHutnneM=
X-Google-Smtp-Source: AGHT+IEs1bZ7Q8jx+0doTn45ULYFTLd7A4k+NN6GgkpG4vMw8AQmTzk7FWtDBBAgeuMCM8BDjE5fcg==
X-Received: by 2002:a05:6000:24c3:b0:427:15:ff3b with SMTP id
 ffacd0b85a97d-429bd676a93mr157901f8f.13.1761841251471; 
 Thu, 30 Oct 2025 09:20:51 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df473sm32758678f8f.42.2025.10.30.09.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:20:51 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] replace system_unbound_wq and system_wq with the new wqs
Date: Thu, 30 Oct 2025 17:20:40 +0100
Message-ID: <20251030162043.292468-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:35 +0000
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

1) [P 1-2-3]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because of that, system_wq has been replaced with system_percpu_wq, and
    system_unbound_wq has been replaced with system_dfl_wq.

Thanks!


Marco Crivellari (3):
  drm/atomic-helper: replace use of system_unbound_wq with system_dfl_wq
  drm/probe-helper: replace use of system_wq with system_percpu_wq
  drm/self_refresh: replace use of system_wq with system_percpu_wq

 drivers/gpu/drm/drm_atomic_helper.c       | 6 +++---
 drivers/gpu/drm/drm_probe_helper.c        | 2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.51.0

