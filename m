Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776F45CF39
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31656EDDF;
	Wed, 24 Nov 2021 21:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36AD6EDDE;
 Wed, 24 Nov 2021 21:37:20 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id iq11so3551139pjb.3;
 Wed, 24 Nov 2021 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xo64Z06VK9djsBpMwA/kmmq0aY4Br5jzhSEbD50Z0N4=;
 b=kr9xAcTb6KjI4HMyh6lER9oWkUXGMB2DUApAFlvKjQibThaaFYCg3ZXglx46ws3LjW
 ttpdP9QH/yY9ZMTud8QBAc3XqeYCCkE1OkHt/T1yfq92ei58QjClA0ncdererQSRmTbQ
 gvO1Ez4NzKrbIWd9t6ea9SZeVSTHByNSnHROFs1r4I7Xw9pH41TQe2n6m8k7Uus2Vw0m
 9XOC/3GRHHRUm8zQ/eJpQZDeRi4ESbDH1gwglUbj8eDzpr9xZqMwA/pzPCoX9IknqycI
 KNMTG0UHRcoiu8nay7teS7jJiGqowVZwA9XHPvZBQkfOvxZv6h5dlbVDVjiD7Sx1zaDR
 IKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xo64Z06VK9djsBpMwA/kmmq0aY4Br5jzhSEbD50Z0N4=;
 b=zJgytI/Z0mf3TPDpGKbp/6AC3iLSetZ0tGwPPccyV5ZD3TKoepcVX8W0wIZ4esHBK+
 6NdXV/YKodwfgvTTMUB+xMf0mJ7xcYASRI5oYzRPWKAe5rmhJuqY3SabacnoPSdGZrbP
 wAWIZvOL2f6kZ24TQfIenI6gGbrUOvHBUJkSMD+i0+nFIRTfpL1CXp5e8HxZlkPCm/L7
 25VItI+IO+BKHy8GLJkHaxgPVvB1Cwp2MMtgv3/1ZxBJX94xAHm+WeGxEppxGdOyX54G
 124OoD/QpoBxt0pNc1DqCMY2McA2P/hfVH0yka/i2yJY9c4UUEv/XVLNj0ks4Ux7aqGa
 SCnw==
X-Gm-Message-State: AOAM533dcIzc7ZPMWnIkoRF0XYb2A7uzbnbZcF1j8bjy3+Eyx7bHXXEY
 LFUEy/5bf2arXv5JCg0Zu2ciSK8fseY=
X-Google-Smtp-Source: ABdhPJzh44tw9P3I/mqiG6qgvxA4wLye4Bn4K8czdGIHeFf9evQGp4cLkzNfVGdQcaNx+ZjJ+2nrLg==
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr23110997plg.72.1637789839653; 
 Wed, 24 Nov 2021 13:37:19 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q6sm711783pfk.144.2021.11.24.13.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:18 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/msm/gpu: Add some WARN_ON()s
Date: Wed, 24 Nov 2021 13:41:30 -0800
Message-Id: <20211124214151.1427022-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We don't expect either of these conditions to ever be true, so let's get
shouty if they are.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a379f98aca54..6c42cc0ebe84 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -504,6 +504,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i, count = 0;
 
+	WARN_ON(gpu->needs_hw_init);
+	WARN_ON(!mutex_is_locked(&gpu->dev->struct_mutex));
+
 	kref_init(&state->ref);
 
 	ktime_get_real_ts64(&state->time);
-- 
2.33.1

