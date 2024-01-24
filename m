Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D934839FCA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547BE10F5C2;
	Wed, 24 Jan 2024 03:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031C610F5D5;
 Wed, 24 Jan 2024 03:01:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso6617257a12.3; 
 Tue, 23 Jan 2024 19:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065215; x=1706670015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUjnB5UXcV+HhJdRxnmUySO0sKgHXE4jTknvXI2h7ds=;
 b=SVw6EwtQXxNO+cAQ6sRlGUlhTzAGbxU0R186afNyMzqO8SLq/fAhUqPAumX2++9NrW
 DmimWh5zqfa88ugq0pmlbbhaR6tpmgNsATQZin+8Ffi9ZEAYV1QkLGH5sCIheDAGMBRG
 rse+JOLmOHaoKzykZuiyDpShMWGO7qivkTi10VycWokgSPyok1oKWeKHyt1soA/aot6o
 UH6BPazMjS7gwSuVil0/eBJ14eU3+CkRgQYDEbxlbjd/klS7qTe4qKwsVh9CcC1V994a
 J6VQYvhPSdHvZrvfCYwN1cHpacBBEM3Kjs8oIBmCPQu88QjMCigEaFNh6S56jGhNLAfZ
 C3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065215; x=1706670015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUjnB5UXcV+HhJdRxnmUySO0sKgHXE4jTknvXI2h7ds=;
 b=JbjbTgHsD7W6Qe7k8HaJiX2t1p4rYnjCNjHqnU/6pRi+a+tG8xqgJqbhY6fI8a4E1k
 zn3KvacYvvRcKaQkpmoMeVc5xEDpPQ0lE3W/WpBA1VW+LITPsAY6X1M494HS6L3K8X4l
 Y5Ha5f+lUjDGOBnvj83cyDAj30mIEmF9PsdYn9hFGgpF9t39J4rdhFS36VrCNL2ffXdv
 u6aBo1ahN0o5LJGwDAa98/xaBsBf1kEh2DPgAes3Vy3sCWMPnbM5xX0dxm4sr6N7KPU5
 TNq+NPA0K0nUUef0zESUl32axd+yLw//mcsOtzn6eqR+tfjFbAa+/LJ9f5m4dqmjDYH+
 JxGg==
X-Gm-Message-State: AOJu0Yxxa+z+SWKLCI4I7PVQjrASjq7AkXGifB54j+6EfelNhijUtR73
 +toJ4z4MZkmbObrXJmZ1566W19vHU9A6vJN4d5qwMfNakQMQKXaO
X-Google-Smtp-Source: AGHT+IHg5LrHSVYVuCNSXsc0+hEAvO6xwpPVT8afKP9CgCtUEsSJwOjoz5XuLPsY9rpygEFUeDJYEw==
X-Received: by 2002:a05:6402:358c:b0:55c:74f2:44de with SMTP id
 y12-20020a056402358c00b0055c74f244demr846902edc.108.1706065215429; 
 Tue, 23 Jan 2024 19:00:15 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:14 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/lima: increase default job timeout to 10s
Date: Wed, 24 Jan 2024 03:59:46 +0100
Message-ID: <20240124025947.2110659-8-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous 500ms default timeout was fairly optimistic and could be
hit by real world applications. Many distributions targeting devices
with a Mali-4xx already bumped this timeout to a higher limit.
We can be generous here with a high value as 10s since this should
mostly catch buggy jobs like infinite loop shaders, and these don't
seem to happen very often in real applications.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index c2e78605e43e..00b19adfc888 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -505,7 +505,7 @@ static void lima_sched_recover_work(struct work_struct *work)
 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 {
 	unsigned int timeout = lima_sched_timeout_ms > 0 ?
-			       lima_sched_timeout_ms : 500;
+			       lima_sched_timeout_ms : 10000;
 
 	pipe->fence_context = dma_fence_context_alloc(1);
 	spin_lock_init(&pipe->fence_lock);
-- 
2.43.0

