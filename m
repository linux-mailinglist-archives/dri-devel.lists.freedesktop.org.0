Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C786C2498B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D235A10EB94;
	Fri, 31 Oct 2025 10:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="RwnD8clD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A74710EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:48:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso14820075e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761907730; x=1762512530; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NgLCYfpgrKXyb0uNcHRkHZoucWvjEkXvo5QPwaDt/k0=;
 b=RwnD8clDqdVhJHrB4S2aRi50pEGShsF+Ky1uq0w8tdvyZ1yhPLkAb9h6Hdf/7KLnTR
 9rTArw7XFl3B49r1VpvBMdsLH1yLGp5/n9/KOgZm5G4Qj8t97Kg1InKrBNbjcrMEcUgX
 kZrnx0EzWTzcRQm3AQ8/Dw9db7tmuonxrL8k18Skanmo2nttNtpxBZylJ6xB6msFwlAB
 CoHyIu4DhFE2sciWj1/5IYYe8DU/77yN/gGgQeBOdkfpj3u+WBXeU+tNsiRryta7Mdhi
 CPGbbCqV+GXo0aYJgAk6P+Ru4hnyDsVRuFxuNrE6UNdyK5DmC7yrcoNFYSIJkvjXuO2c
 sS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907730; x=1762512530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NgLCYfpgrKXyb0uNcHRkHZoucWvjEkXvo5QPwaDt/k0=;
 b=e0LohHnkwPYCu84GtEZf86DrjtRZ4ej8FsA2DS3v1wJZ3KXMcamlccvl0e6BGiXYEn
 i5PCnfqJylkixlJZeiHxdtlati0v1m7Knbm+ZGOQ+RkjeKo0PUKbxuGNu2UX+6hcP9/C
 o6SRmzFs5h1uShk8W9WkqMlz6iD5K2htip+JgbrVfvMaeOej83lJrumeBGtfSS8z6jyl
 PFs6/Ep7MBbLO051wIt92YqotVl0OCnGSS5DgehW2P5g3NLCA4kAeB42fLtRGAgjj3jW
 vfkoOdZFrPNg/r/pAHmC+2Ztw4wTZakWet6EKccVF1iix8EV1K3QF3BrZfUKi2Tf+oVR
 Rn8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9iWKDe3QtusaNLM7uin+4phPcDlsSIFsdH7np+A7gXvimsId7J4jy0UvIo3K+XNL4G+6m0GjURU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywdv+YQt6ibmK4UP4anIqS06f5ntk6YWeYgwFgsD7WExDQVtrN
 x4DOD705zDuG1dKjZbvneLlA9mtfR94ceEvkObG0z98z5n3tJ4H/8XyIG/zQbci5RVk=
X-Gm-Gg: ASbGncvnjSvhcLO8zPi997trUewVswIp3h3D6IWWsmkFpqlglU0DjK0s2W+Rq8iZS5j
 a7wSGR1CaZUIm/qaut9utxT3H9UD7jzkQuoZDbXInaFAR/ELn8Mm+ji+V+p83tkjuF8RmN+PTiC
 BklW2+qn0Le872ywuQeT9ZI2Zb6nEmTI17bfatnQFN+NxqHGGiJIgFlWd2cXwHOoZlhRKauMbJQ
 CTEf24OdcJJtk0vXoI7K5OwKioSqB8RutOQDBAXMGSvytkd2InCgBzPCqQC7oxjSLUA+2VrAbG+
 j1xmTmJYEptN1gUX0FAsLI+6zpQXcGVf0sBmRTigtLXjhxst5GHjXReQaueQ6L1NzcIxn0sIDtB
 npr7uB31JaemieCwSb/b/2YIWNoq7frwxrdyhSyvW+MJGPEKH8Mwb5RDSeqJ4daiMjDZSA4nFzU
 PrGrarCqbdiKY/OOR0wFSwQGwsGMZRE2GJFn0=
X-Google-Smtp-Source: AGHT+IFP987BsDATwy71oQrVgMqL+tPUdk6zXS4vwh+ZuiP9GnPeneDUsTtppOuOWWpaBC8dvT1MnQ==
X-Received: by 2002:a05:600c:3e06:b0:475:dc58:39e5 with SMTP id
 5b1f17b1804b1-4773089b541mr26933225e9.27.1761907729944; 
 Fri, 31 Oct 2025 03:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:48:49 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] rename system_wq and system_unbound_wq
Date: Fri, 31 Oct 2025 11:48:44 +0100
Message-ID: <20251031104846.119503-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
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

    Because of that, system_wq has been replaced with system_percpu_wq, and
    system_unbound_wq has been replaced with system_dfl_wq.

	The new wq(s) keep the same old behavior.


Thanks!


Marco Crivellari (2):
  drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
  drm/rockchip: replace use of system_wq with system_percpu_wq

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

