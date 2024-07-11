Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AB92E407
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF2B10E9F9;
	Thu, 11 Jul 2024 10:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GoxtIZRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9A210E9F8;
 Thu, 11 Jul 2024 10:02:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-595856e2332so852310a12.1; 
 Thu, 11 Jul 2024 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720692164; x=1721296964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H3zOMJNB2462M9JwLFhtX90y2MUg8+oUIQDY6w49lDI=;
 b=GoxtIZRzYqtcMJ8YtC1nCs/TBwGsoAiXCB5L9vKlRTPbjljaBGi3QBMieOygh/hZpg
 domogqL9d9upRVDLSnd5qTS4gekbOgnVzyJhGJVMdiNC7hf+nUwKkA7DyeR619SgdUtH
 CQ39b5wdJbp8mPgwJTE11xIH1EHRW1F/HH481ma8Jqrrvpy1vFIYU4PaTAZ+BMvt8Vyw
 +07L9CpJvCGfKKiFKXrpvx8hJ1u9gds9Ya4rv8E9se7tlgwjIRTwXAkX6G2fZoKNRCr9
 aFkgiSBcZ85+f3CIVWmnFf4BpwK4GapB+49ThN5H9Lr4CaPROkOxIJm1ZoVe7yh8qT3Q
 /LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720692164; x=1721296964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H3zOMJNB2462M9JwLFhtX90y2MUg8+oUIQDY6w49lDI=;
 b=fOlqTI8VX0/D7WGwa416JAO3ge0kzBmTEhDBC5YfBCP/4+nBmfNMkfzSF9odRSDzyt
 GecY1DMwSsizDuLdzg+S3MfY6Gbfh9DHLCgjDPisI3O0sH8AnwEDTJfTErytT9pq0tn+
 hc3KWNTTDhDxK1BpRHn/MaB/QV1IacBVhWt36YGx69As5B4xQwnwGZR9sqVPeL72qwhz
 +rlpt7wZh6BvCQYdcPOgZ/ZwhRWN9WawcyRIuZAs7ef+WlLCbsxgqtYejGs6se2bnA3s
 OFa+GlvaGw2T8GsF2qear3qTFl02/kQgTB0lWqhVbNzaUa+hfGj+vjbZvvtgPzl8Awz9
 elqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBa8MwWHPGS7ytwowQvuEzk4SFFrKfEI1KsSPhMt1TgVx+lx53KJh5r0EP0zb9sQa3ABSo1blNOuIxOTBmcZ7aW3JCPjP1LXAP0DEEm1XbuMTQ+P2nISJ5fRXgojWWRebPsjDnTmS19kQPY1xz3mPZ
X-Gm-Message-State: AOJu0Yw6N2CbrTKE6DejzP5RgJQlR298vKdcnm16K5pfElYC187Cc2uW
 frCZrFY5boor+Sqtg8XbOpfqs+pRVwOC0F7AYTaZsbP9TrEGT2TI
X-Google-Smtp-Source: AGHT+IEHdoFbH3D6J1HEJpm2T6NckmbaqK1lGl274VU1X6oXcU5CJOiQYUz/agNN9vGf3rQ+KMjNdw==
X-Received: by 2002:a17:906:24db:b0:a72:6055:788d with SMTP id
 a640c23a62f3a-a780b6ffcd2mr586906266b.42.1720692164055; 
 Thu, 11 Jul 2024 03:02:44 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 03:02:43 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/msm/a5xx: disable preemption in submits by default
Date: Thu, 11 Jul 2024 10:00:18 +0000
Message-ID: <20240711100038.268803-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
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

Fine grain preemption (switching from/to points within submits)
requires extra handling in command stream of those submits, especially
when rendering with tiling (using GMEM). However this handling is
missing at this point in mesa (and always was). For this reason we get
random GPU faults and hangs if more than one priority level is used
because local preemption is enabled prior to executing command stream
from submit.
With that said it was ahead of time to enable local preemption by
default considering the fact that even on downstream kernel it is only
enabled if requested via UAPI.

Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7..6c80d3003966 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	/* Enable local preemption for finegrain preemption */
+	/*
+	 * Disable local preemption by default because it requires
+	 * user-space to be aware of it and provide additional handling
+	 * to restore rendering state or do various flushes on switch.
+	 */
 	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
-	OUT_RING(ring, 0x1);
+	OUT_RING(ring, 0x0);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.45.2

