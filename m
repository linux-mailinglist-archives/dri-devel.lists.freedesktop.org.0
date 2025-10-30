Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04365C21CDA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F258410E9FF;
	Thu, 30 Oct 2025 18:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aTqJkXrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B7710E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:10:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47719ad0c7dso11755825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761840624; x=1762445424; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mzPZhnW69Ma46xdkUZL4rvYZEGa/gCP35bg1gX0aRM=;
 b=aTqJkXrhdmcsXauXM9ygj8M4lKWvNK/XYTtTPaN0Qp7+uu2/gly7M8s1bM8eS81D1/
 EZxjEObRidd5pg0X/3HPwoSC6/nd4wxhGwZzaOn3LIOqjQA4p3/bR8uFSYznbckPXKSi
 FA9LECmEB+M0J0a3WjqlvaZTQ6IwWa4OwcfWvs/BzSesXzPCpFqSAcMxWgNLdXrPExva
 nKhPghFobPlgt8VwV5Yzg+T4781VFc6FxBdNY1q7gNNzr/T5AaCQW6+P7ys5X3nwSoAd
 rjESnLfrB2l8uQzJBoqJNGnyyGIpbO2zfOaAEu+FzJJi0tWcHTzg0x21UK4PHUVfKljc
 K7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761840624; x=1762445424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mzPZhnW69Ma46xdkUZL4rvYZEGa/gCP35bg1gX0aRM=;
 b=ifnKg4R4GHl/c4+sbFYqiq0I8hYqEw+HcDdIAY6dVTp7uwuyfhw0qQY9C2P0IY1hrb
 ftOy3jELu7VK43nb3XDo5eSLaGNNTVP7kBU6zE/GbHcuRbfDlG8GJ+IYPlQ46lzeOA80
 NIM3ktuGWmycC1DDNhaJBERkvv0+tBL+cE1wDzQzHZ+eFm+OYkaUTRjmd3iJQXohpNHS
 H8U/NJ8/6VOeL4PgdGJWHffPul8xsWY5nRWbmBYou2CuksH9sqBenCCpXA4AyPWqnCme
 zlaUViOwFYoV48OBP8R6QAbHwh7hYKBAnfMK+h7E3AqiPfIgr2GxblQh+eJfkyuBVh1f
 F6Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZJGyRBxw8Dwg6O8deMRPL52fsji7ThZsJqUcn1XjwkE6DMwW8VAwOgk22H3/C4vqy+oxt71p1avU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdAF0AVgZs9Cqz4Fx8omv+MXiqdIcacvYMX8L7m1TCRMsbrPJ1
 gZr0ajir5QFoNrOMJmLHVbqRmSE2BqxKykfY/bA8jXFzNKH6FpN03xnNOL8/x5e1INY=
X-Gm-Gg: ASbGnculqJ9vccirBzOcPmxaCnyeKXde2Kw/TK7PXvOLwJidtrpIJr9tmj4CLeeuzxt
 20kJtZQv2Zjd4TlAafVnhM6lqmM6lHpjXjgwElwO5/SiuyEpEG5K4ho3LbgI+ZGfyAsN/tTSgIz
 eCbFS/xfTkz1EDYF1eWtOMMin4BwQpr2iOk171M351RzPgbo9zSIKyVlNrmr9lcX6FKt05ZxdFA
 kGTrCfanPkZJBNyj8XuxyKTeXzji7e3qWvF2My5Rfm4WDTRXZ9MaE6B5bhtYuEHSlRjCfHGPhdE
 ouDA9a/nEScXmatMC3soJkHMpz1or13VCZIbJyQQrvEcnDYhpxKB+xTBQOzV7HTnX1m9VjgeKHy
 o+R1UPvhR07zVC17+A0brGgantVP40GTv3lLgmh5oDdysxzyYK/lGJPpXiDinKg0sVA3ETyJZ9o
 WO+1gOyIK936JgIAs=
X-Google-Smtp-Source: AGHT+IFroBmfAiCGL5XJxbZgL6hgq0wEFDb+ooauLfTFeIekjVl2CAAel/J5c/moOLtcfk84yd6I0g==
X-Received: by 2002:a05:600c:4e43:b0:477:e66:406e with SMTP id
 5b1f17b1804b1-4773088be60mr3082305e9.29.1761840624032; 
 Thu, 30 Oct 2025 09:10:24 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm33124857f8f.8.2025.10.30.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:10:23 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 3/4] amd/amdkfd: WQ_PERCPU added to alloc_workqueue users
Date: Thu, 30 Oct 2025 17:10:10 +0100
Message-ID: <20251030161011.282924-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030161011.282924-1-marco.crivellari@suse.com>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:34 +0000
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
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..ebc9925f4e66 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -690,7 +690,8 @@ void kfd_procfs_del_queue(struct queue *q)
 int kfd_process_create_wq(void)
 {
 	if (!kfd_process_wq)
-		kfd_process_wq = alloc_workqueue("kfd_process_wq", 0, 0);
+		kfd_process_wq = alloc_workqueue("kfd_process_wq", WQ_PERCPU,
+						 0);
 	if (!kfd_restore_wq)
 		kfd_restore_wq = alloc_ordered_workqueue("kfd_restore_wq",
 							 WQ_FREEZABLE);
-- 
2.51.0

