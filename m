Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59049746618
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D6110E24F;
	Mon,  3 Jul 2023 23:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F9610E05D;
 Mon,  3 Jul 2023 15:01:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so6859770e87.3; 
 Mon, 03 Jul 2023 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688396509; x=1690988509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ACAehRo9Teq7otTL7t1DkhIRrNmVdicT9iRzjgjAX4=;
 b=QY3WsCZGQOiafSVgFytHNVwB+PNMpe4yuH/ejzZdUhvt3pV6/5gfBrvHh5Uf+MrXLr
 LGp0o4oh3Y6gcImedl6Bpr+A4WNjPq5z4EgXDOyNtjfiYKZlTQ6JpqlRkqd5QPbErWDq
 fkcot1hoh9WTuaAlTGEMdgycbmc2C1OVtSvDRNFC+55PoMXFpm1Rwe1KCRaw5Fnr154Z
 lYDXQnL5HmIsTcwpDW6zlSWsM6KGy4JucuxUtcwpvYDUg1yCXQ/IncW4qZQsxPs92RL3
 eLN3efPGi8DOaNn8ZtGVR2KuI7OuMIVo9C3rh0vBOHkNcy5mBN0eDEaK6MKYqY3Pfveh
 hzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688396509; x=1690988509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ACAehRo9Teq7otTL7t1DkhIRrNmVdicT9iRzjgjAX4=;
 b=X+iSq1SKTExJdlfY5HHBsfvppvWO/W1sW649V8qopCGzYeVnPx/DHWWhhcS3396v/b
 I6AlhPgzNTo+b1hti9Bu6fxTFoqJQHMXAtOcIbe8dXLlbOK4pyxQ4zumfKicYCfbAP6V
 6YsLj3wRAmqPSH+wLkO0Ff8EMSkFZSCeNC7az6CcHo+JdWUBXvA+sAnttUvO5DhUeV4Y
 KR5LB59b8h93l9RAkVneSvmQTnUTk4n2v5WWo+77tWo9x74MZy43W4EYgK0Isp4iDH++
 NB3IAfaN+PNsEQ2l9kG7V+oF9Mrh2PhYuqNZiFTmaUDR+S+vLeKn09Bx+CHW3NsKIy+7
 gZUg==
X-Gm-Message-State: ABy/qLZSWCtbp0vJQUwBdKqGZbBaRSpfmuvQdhs+sM6RrgYMPf5IFCUv
 +ZYGKSwoeamnWRuMSApg16DnNpWIc/Fi2A==
X-Google-Smtp-Source: APBJJlEy07zEOHrJaTz7psAlLEzG3iQ1RXU/ezZ16Gu7PUkEO1A6MG/Olvbvbk+csfjrYJudmx71uw==
X-Received: by 2002:a05:6512:3da5:b0:4f8:6e6e:3f42 with SMTP id
 k37-20020a0565123da500b004f86e6e3f42mr11621655lfv.14.1688396508639; 
 Mon, 03 Jul 2023 08:01:48 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 q7-20020aa7d447000000b005183ce42da9sm10477109edr.18.2023.07.03.08.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 08:01:48 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Use local64_try_cmpxchg in amdgpu_perf_read
Date: Mon,  3 Jul 2023 17:00:59 +0200
Message-ID: <20230703150135.5784-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Jul 2023 23:16:23 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Uros Bizjak <ubizjak@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use local64_try_cmpxchg instead of local64_cmpxchg (*ptr, old, new) == old
in amdgpu_perf_read.  x86 CMPXCHG instruction returns success in ZF flag,
so this change saves a compare after cmpxchg (and related move instruction
in front of cmpxchg).

Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxchg
fails. There is no need to re-read the value in the loop.

No functional change intended.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 71ee361d0972..6e91ea1de5aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -276,9 +276,8 @@ static void amdgpu_perf_read(struct perf_event *event)
 	    (!pe->adev->df.funcs->pmc_get_count))
 		return;
 
+	prev = local64_read(&hwc->prev_count);
 	do {
-		prev = local64_read(&hwc->prev_count);
-
 		switch (hwc->config_base) {
 		case AMDGPU_PMU_EVENT_CONFIG_TYPE_DF:
 		case AMDGPU_PMU_EVENT_CONFIG_TYPE_XGMI:
@@ -289,7 +288,7 @@ static void amdgpu_perf_read(struct perf_event *event)
 			count = 0;
 			break;
 		}
-	} while (local64_cmpxchg(&hwc->prev_count, prev, count) != prev);
+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, count));
 
 	local64_add(count - prev, &event->count);
 }
-- 
2.41.0

