Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B86BCE261
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 19:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CC310E131;
	Fri, 10 Oct 2025 17:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzNevAPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7A810E131
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:49:51 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-61feb87fe26so3433973a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760118590; x=1760723390; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
 b=TzNevAPdSorQB18RE4p5V7rlE1ptgNAz5l+TBCLU5apOmCIQemEdvqMFrIxw1/0SmD
 Ne21ENdkVttFxkicVg0WmkkRESKg+/I3gQR0mrZsM7uiSXymSedYhUIZbjFuKirYQXR/
 hjvWRVD3MJPrpG+yIQLzUguyIKC4QQ+116SKoMcqsvSdzIEQbJfBX5u1KDaR5DaSFXeh
 YThSa3WMNEpp6gPTkx/sUIe4z0LN3s9U8U2uLEuG0reo3R5hy+YLVyIQ7TgXSB8zYwp6
 5l4eyZAn38YWZ6G6VurFlMDJyx/yXb5Gv7DzVFRsbglcL3pIq068dPzeHxq5OB0b7qOn
 FZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760118590; x=1760723390;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
 b=tY8nHUvjtw9rjws2qJ42JeIFL8/y+jd28JwdLqEOrjTaBloJ1yKigd6Rd+W3vA8WP0
 lNh37ynK5YmL/DmGRrBn6iBJradSvaUBR2iXel/eWiK33pj0fwXfLNgmaesaH9m7KbV4
 TtX++TOLkmWFQ2fdmLJdEHI8Bqs92N/Nox98hpUwNAvmIbJqEsN+EEGSe9+pAyvE0/og
 s9KPEnYaWCyo5orAPMC1YUAnZa+pUWQnBJHId/FxVF28u/QqhJIC+gJN2YHYgxU1wq84
 pBAaOc0raLqrkWuDRq46Bfzf7IIjz/KmRjSGKTnOc5qEXBm+cuuOtgE6u9AHpSZ5PH63
 rXHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2oujdlFpLYPaeMVvDXp4FLNcBdYAI6ULW8o80Pe9JtldoSYkrEUOuI2I/nJbGXzYlwa56pqXM/p8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPVP7+4OKSIvw2niw5VRYdi5LS7azcbtE1Ca7VKOVTyiDIFI1f
 uFeNrNyYuuwBvV/4gD2DKB2JQyVW0VEbBupAYP4sgVa8bRydOLHbdxk=
X-Gm-Gg: ASbGncv6NrWorcT9bs/znA86739N4oThRpQTecFEnQ9S18uTdZuMxsDPff0g2QZnP+V
 pGb5mtDHzo1EHWV45o6AZ7peRFjNy5HwqlTJRVmfLnY8/NGe+ReQaTr1cQZvxTMA4PkZsloTltm
 UIkyFNJdtDgGI8lOi4I95z8C9YBuOqyFNv1CEkcZ5gia5P2sc64K2QN5wufkmHZ5/hLAC/h4zmY
 yJMGMb8xY6HILB+VyeVzSWPwrmoX0kyRaztL99vFa1Ow0qXq0z9P4YtxH9G7ucXNB7K5ezHA7X+
 8UKr425Rh1gEzNeoQ83eYXUX5Nk7kDsVDaDD77g5g0cWvInotBQ8V3Sj+flZsLSPX1YdKjQlW7o
 oCx5Gy5ap9svAoZzjibKZvp9WQURsckaQIywy0KwLJtYqzZ+Hg5V9W8NgYzQsl5bB3qbG2RN0Kc
 yE9OFSXVP1qubJe1bLh1DRjWwJZw==
X-Google-Smtp-Source: AGHT+IHDJR17PQFFrv0Ddj5LxOyqWyfj6LF/dr8cN6Gek6nwWLnn8Mv5hRRCyiL9/vubmJXWRweCCg==
X-Received: by 2002:a05:6402:1456:b0:63a:3e7:49e4 with SMTP id
 4fb4d7f45d1cf-63a03e75ebamr6614994a12.16.1760118589666; 
 Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
Received: from [192.168.1.17] (host-79-43-163-15.retail.telecomitalia.it.
 [79.43.163.15]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f860sm2751785a12.15.2025.10.10.10.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 19:49:42 +0200
Subject: [PATCH RFC] drm/msm: Workaround IFPC counters bug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
X-B4-Tracking: v=1; b=H4sIADVH6WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3cy0guT45PzSvJLUouL4tMwKXYukFBMTc4NUM2NTQyWgvoKiVKA
 w2MxopSA3Z6XY2loAOHIok2gAAAA=
X-Change-ID: 20251010-ifpc_counters_fix-8bd4470e6351
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760118588; l=1299;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=9XOq6YPq24CpDOGDOJ8EWJ8bkkDKwD6bJxPjyv75+Lc=;
 b=MjmbVLvbkiAWzCaRMDnhmThnylcuH2TPO3Q03Qe8qxN/k0yrCNsKkFfz9mAh+yTN19jpeQ3TK
 4lQ5OySpqjODehM8UT3s2xR9wOwF/HQKtLp0gxkDepDKw516sdSDi6f
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

When keepalive vote is set to false IFPC will be re-enabled even if the
perfcounter oob vote is set.

Workaround this by not setting keepalive vote when sysprof is active.

---
I have little confidence that this is the proper solution hence why
this is an RFC.

Hopefully something better can be found.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index afc5f4aa3b17334027f3c20072cc3f059a9733b7..975b91e2c439f659b7f716cff87f73d389641d91 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -191,7 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
-	a6xx_preempt_keepalive_vote(gpu, false);
+	if (refcount_read(&a6xx_gpu->base.base.sysprof_active) <= 0)
+		a6xx_preempt_keepalive_vote(gpu, false);
 
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251010-ifpc_counters_fix-8bd4470e6351

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

