Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF992E40D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E610E9FD;
	Thu, 11 Jul 2024 10:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QUCX1i3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FAC10E9FC;
 Thu, 11 Jul 2024 10:03:02 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so78369266b.2; 
 Thu, 11 Jul 2024 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720692180; x=1721296980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRz9UumvfZkasiMoFMWu3L5o8EAQpD5HwI3FmH2Nej0=;
 b=QUCX1i3fMVqzli+qpi3UMPC5oo2cFC0T7wIYLMmWl505kCx1AGhWUsJdrqet31Wpzr
 Tt9P+ELFTLzoY4fAEwAO9vgn4+9V5qQ2P05uwexY2RsJ9Tc2QV+qCim5VWQ8eNUpQib5
 Zn5MxbIRx8RMrNglKvYV54ORnLTZxk/A2sid0J7XnHHVbspZnnb4kUGXtU8d6Li2S302
 Zc4sYrhAMwF1RGSEsicdj4yz+Wyd42OjkdOVHP2kPVYdw432y6vLrw4Kjr+hSa7YEIDO
 XSABbQ6O4tNWHN4DcF1wZLeEnmD272w4auTfNU5fgz+Xx5yVtaIkvL+9EC5d0sO6EZmY
 053w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720692180; x=1721296980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRz9UumvfZkasiMoFMWu3L5o8EAQpD5HwI3FmH2Nej0=;
 b=fJLymqfWP77twV6kknf8CQuVUVN5dBzN4ayeHcTgGI7l1BhQYvW0nSlT+JF+rf4PkZ
 k4MPQDp/uSZfxbXdjR2rwgwMxJ2UXLoOOICEJ+t3de1dIC9krGSXdwHGea9zD6yzA6HN
 k7IolpCNLu8oZwnjBjZ/HnLxAMFPH1s4KCb+E5qOX0Yd3CPmAFuiU6AMuxhz2j5QpKwk
 NZ2PE/9bbE4Tutt2RPbhLl/8swh16LOW8JZlEw1Ocx+68Ox0Kf3hfUbt3CHmnwK5sZnn
 nUMuHHMzOm2icf2aDlJ0Xua0WX2tx8aEhr33QcBpucCbzjecEy/pT8XHJ97siy9r9eYs
 M3RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2a5yElymcvjNaNcjzHVtR0MI6TJyIOTL2nnWTIUrru1CoeqyqnR6rYi0u1fwnxfLvKNa8vhDDUUez8vXk8syQO3Ahy4xSXKtG09yiLJw+IB3r0FaoyLsDNoxuEKE0qNvyqsO00/MNnJW+cJ8Ii7J+
X-Gm-Message-State: AOJu0YxYu41/heK97b2STGwhs/UMXv8YihpNXtN1AH31cOfUzopc6R96
 C9Ok91Fyzg9U7XAtoFGG5wV2vaOGKXnBXuaC5uiE9PKl171j0sle
X-Google-Smtp-Source: AGHT+IFZwmeKYg5L20iCnIHACgbq3BS89SRr31jpLVF1vhxP0+N3lNM44paKbRcnxvAlCyIiP/JmuA==
X-Received: by 2002:a17:906:129b:b0:a77:e71e:ff8d with SMTP id
 a640c23a62f3a-a780b89ab24mr466598266b.70.1720692180017; 
 Thu, 11 Jul 2024 03:03:00 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 03:02:59 -0700 (PDT)
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
Subject: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on resume
Date: Thu, 11 Jul 2024 10:00:19 +0000
Message-ID: <20240711100038.268803-3-vladimir.lypak@gmail.com>
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

Two fields of preempt_record which are used by CP aren't reset on
resume: "data" and "info". This is the reason behind faults which happen
when we try to switch to the ring that was active last before suspend.
In addition those faults can't be recovered from because we use suspend
and resume to do so (keeping values of those fields again).

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f58dd564d122..67a8ef4adf6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		return;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
+		a5xx_gpu->preempt[i]->data = 0;
+		a5xx_gpu->preempt[i]->info = 0;
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
-- 
2.45.2

