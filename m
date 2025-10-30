Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED5C21CD3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6364C10E9FE;
	Thu, 30 Oct 2025 18:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Gj+QYS5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A5E10E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:10:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso13974865e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761840625; x=1762445425; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUyLe55hA4hNh5avFZjcyEPUTCpSS8nAfdCLlggpt5s=;
 b=Gj+QYS5dlNT9wcdFOenJk61DqPU+Ba9IlUSATdqhocWLaZMU2W0T2AfjnC2sVun8n8
 oITwhbK8xtqvrdRnJkJ5tlxbcXNwB6jEeUO63llckIsSt0xJuGYKKeo0RWhz6cQwmlTI
 FzPQjTAVejasVhq+pRIAb4XAYCFj3IOia3BzTibMzVEcU4bbGCzIUC2nLeYFP8VCN0Hy
 Jz6K5/xTGP+b2LwjxIDQ7TYpVJfuE/qxdqT7PgCoupe2dewTZ2RmEALBDv4qsH91Wnz7
 79Ce/6s8BsZmn8btwYOZgOnFmierRdzwpuZiInnOczWaNsItAUkDj5V7w8nWmrzLE8Dt
 5jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761840625; x=1762445425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUyLe55hA4hNh5avFZjcyEPUTCpSS8nAfdCLlggpt5s=;
 b=Cq9URsLrghkyBbO5550EH/uHgiVGhKw8zBVqCNw1s4BFo2B93KCIRbkX1kOWWerOku
 9aywIVuX8TpzAyQ3s+0g3zaV3nydCffQ5h0XoofuS5IGIr7VpFkX67k1NDB/veC+rCki
 ahqQxdSkYr2cn0q/mPTeqve+lBv+l5QOhRq6ZD9jSH8xUY249a6K6MTXq4uPzbc9+LXp
 lGhNe7VeTNdPxoiPZcd2GrbmZrf9ym1whYpjP1M8LDwvbUxHs4hCv8RRA2yAbh31tiEf
 xc442agyDxv+Wd7HfPqIJHAC7VzZ7WBimkJOuHcrkPO/hGD8HCRGwZFot/N97jsHgOVE
 nNuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxkv/S+pLnJy9L50vnjKGTbX5ZphK+lpN7/GUFjKS7DT/QfIrZA+NbXj/gRR+ucPLiHEF2ERtZkLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQXdLFTxGRAX5czPE9XfAkZbIO/U1e1E5UNCfKBhmpxeQUzjDj
 /f2JTBiP2rVSEKVTGJMBkn+o7RZu3B+bWK6LbnJVbPJE5bB9Kg/uZXbFx3+NX6KOrMY=
X-Gm-Gg: ASbGnctNynhlqPFW1XhboRA+J7lc/KpthrV5M1CYBWIeKuAzMaM9jNDSo7Z3FyfZy5e
 mNuR6kwur3UOWr5+UeqF7BrTX3zSRD5gUMS/2TZu7N+WcbW22PW2dctMqhmaCCx1zdN6KYGZyAF
 ZRzg7a4tPvbP2Okpv/0WzRRn0vFm3MuzyvRZy42PSpAQ/9YggA7xkgu0UES/+jdcs9PPr+pE/t3
 mXazehmwFJ/YUfkcf3ZmYukX35c4RR+jlV0jb1VovOXlDI3xsqTDUugLU8s3B4GVRVnHiKICGnN
 5LpyBLBMVKdLaQ3SkGRNU2u44WlQxnw3NdUs/ul3Di2LHfp1DT6+mP9cRdlm3VbqN9rKaPykgQM
 M6cSYd4Gioz7J9RbZYEbmmwRl06iCFpGWHYIjWBTkZ2xRcKrp5NdpGMOlKiYicDdWOm+tTa6e5Z
 1C2Quh09iAybacCuM=
X-Google-Smtp-Source: AGHT+IFyE5J11xUKBnyXYND4mxJaazGINsyI2NsqELziu7PEPOdM/yL8Wk6KNj6+t9t3bygj4S8Ayw==
X-Received: by 2002:a05:600c:6986:b0:46e:7247:cbc0 with SMTP id
 5b1f17b1804b1-47730859cefmr2359355e9.18.1761840625061; 
 Thu, 30 Oct 2025 09:10:25 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm33124857f8f.8.2025.10.30.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:10:24 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/radeon: WQ_PERCPU added to alloc_workqueue users
Date: Thu, 30 Oct 2025 17:10:11 +0100
Message-ID: <20251030161011.282924-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030161011.282924-1-marco.crivellari@suse.com>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 drivers/gpu/drm/radeon/radeon_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 351b9dfcdad8..3c8aa5274c51 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -687,7 +687,8 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 	if (radeon_crtc == NULL)
 		return;
 
-	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI, 0);
+	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc",
+						  WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!radeon_crtc->flip_queue) {
 		kfree(radeon_crtc);
 		return;
-- 
2.51.0

