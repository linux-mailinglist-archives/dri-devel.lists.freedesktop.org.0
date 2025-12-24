Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FDCDC905
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3BD10F920;
	Wed, 24 Dec 2025 14:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="DniB2l6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0542910F914
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:47:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42e2ba54a6fso2630860f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587636; x=1767192436; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6w04AZ/GEQWzqj88Pa+mb0oh1dp7KzimF/pV3oqQCH4=;
 b=DniB2l6iY6bo1ProbUVjQWU6ztOs83mk+/fygckOlwmkvEup4ZEsaZgber0t/jjYT2
 c8Fx5n6THHyH8JxVa2l3pfda4eZbS/XYrFb//wxjSZQNi+Zvxk51O3NUL1Q+Rjy4e5L2
 44gQfY/eucLmWpKvSOCslD+abhuPqp4A10DjgTsFYDxUBI7yBtKqXGjSgH7QAF6UKYwt
 9h0AqYjSnlIAA83XGnzc2hVVQBzsSXonB8N8KU9y7Vm3ri4sclM1FP8u6AwwmBCl4qqp
 QwyqkqlW/D8y+U0rnW7qwQyXVU7K+QPdpo32B/toFUuJC8I1Tmde/eJ1T3YQcCV759F1
 RngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587636; x=1767192436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6w04AZ/GEQWzqj88Pa+mb0oh1dp7KzimF/pV3oqQCH4=;
 b=LfrLnFqV7nUeQu/MxFiHRyy/LXt7LaBPR9WgWStWWvmEj++nCo+kc35d2QHbVlJAB6
 LL7wdlzaXQm6hEaAHIfY+tbdc7xR9lDnSbiIkUS2s1uTDXwy3JRstEbSEk4Li6Uq7iVB
 mxOisHDbsCobOA3hAo7VDE/tv8r1gC3jQIAe8TrTjZTWKNl/AxNGQksHqiuYF9pwkXyU
 dl0Y9DVplBTCY0I5h9GThAxY1TyCVlmtDY4DWlXjisPWhupx3hnYBudxN+KM2gTSFbed
 EutXBKbzXDYf2O2MWhSNnckTneEOvA3exbnbRd2QGriqi+XK2wL972Mh0fdNNufo6yo2
 LG6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMDF+dbzgLJyrS95PDNiX9OzKaRTIgZrnJ32TObRpcT6olT3qlWSLtY0q/8stfI//h57iOtAfrbkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2M93/GoYKMaQ5otpBVUwv9cAZNt37cDQU6FZqaDSklKgjDSEq
 Nn4lQa6pUvscanTeOEqCraD+LExaVmX1c6tXGaQRqTzX+P5mluHwvjUAvb84N3U6/hE=
X-Gm-Gg: AY/fxX7JXXTI+gyeg4LjHLvMfr9CAY0rG2ESJRt/tKvovn+I5PkA/JWzZv0VNAoZzwG
 vBvUT8BrLeF6g/RGIbp0Em/HN7TkFe5ZisAQvJQliXl2EvsqQ/3TW3T8Ekvr3YTXotSNiecPYsa
 wCv2JT6i91/XoVbl8CUThWzvVP9/rFBNndWUqxm1HRyxz+U8a475UrK93WrmEGr4kLt3GMSRZTq
 39RNvisBasUdMnEPfQWzRiq7gFlwYnEyOFu43LRRM9dk4IKUOtA3HnPm5O1AiqCNn/DvTGjeLwg
 gK65CkS/zYOHFHYpuKriY0ILPnWzoqEGmO+8sMwOtZVZI2AExEirN6QXPkK3/FsnVy4oQfVgALA
 iJ2T/CAmzvzZCap7pHaNQCs/cKmtP0NUMME4cjplLp7N2Ana1FJWFm0HTCEl/q8a/loDCLQJ+yh
 z4u+6M3PTDXS+2Auiya7qCU6ann8WtK+aB5D0=
X-Google-Smtp-Source: AGHT+IGKZi6YAgPE4JJhdvYtojB16190r8/FC+SNzbAvU1yoHdGoqLUIdHV5gz4Ie0QCP7z4X1I3Vg==
X-Received: by 2002:a05:6000:1acc:b0:431:327:5dc2 with SMTP id
 ffacd0b85a97d-4324e50a6acmr21001602f8f.51.1766587636479; 
 Wed, 24 Dec 2025 06:47:16 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm1041109f8f.6.2025.12.24.06.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 06:47:16 -0800 (PST)
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
Subject: [PATCH v3 2/4] drm/amdgpu: replace use of system_wq with system_dfl_wq
Date: Wed, 24 Dec 2025 15:47:06 +0100
Message-ID: <20251224144708.61167-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
References: <20251224144708.61167-1-marco.crivellari@suse.com>
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

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2ee416c36ca3..39170c04a519 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4922,7 +4922,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		}
 		/* must succeed. */
 		amdgpu_ras_resume(adev);
-		queue_delayed_work(system_wq, &adev->delayed_init_work,
+		queue_delayed_work(system_dfl_wq, &adev->delayed_init_work,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
@@ -5469,7 +5469,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto exit;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	queue_delayed_work(system_dfl_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 exit:
 	if (amdgpu_sriov_vf(adev)) {
-- 
2.52.0

