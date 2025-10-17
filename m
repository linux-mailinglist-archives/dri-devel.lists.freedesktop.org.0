Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629AABEB6B1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 22:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974D310E19A;
	Fri, 17 Oct 2025 20:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7OIb2pL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D8E10E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 20:00:11 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-371e4858f74so27128631fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731209; x=1761336009; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
 b=P7OIb2pLqHkcMmeUW7DJEGNHb4XpxaA4orSVFZ5K6UUlUwDH+jDOXa5bImnxWH2l9H
 uyOhMcpHJx1I1YSb0yp6tNsYGBhAgFfqmypa0ikqe30r5BoJZMyCOdb/+B55NCB2zBUV
 YwkCY9CD+qvzt0Rti0UjI2JsEg1EAlk4PwjcEkOQWAgYI6hyYPY93CGJc376OT5HgjAT
 zk7lv2gtvzOvNBvQdpxFOkToGRsPK3NojJZTkUekfDXZhv8a7en6L5xPrZt5JxDUUn7E
 8tCMG/ja/EHihrujwq/7NgpRpfiIzqgP2fxypNjiJQVh2d/tuKoBYV40DI5FhrSYs2mx
 eoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731209; x=1761336009;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
 b=fvmbh4atazlV7QK0xBRvTpTfPGD4JNYiJwDlQ5QQO59DPQbvd6iCHCbkGNgOwZcNYh
 lAqma9rF2a33mR5ASaBso/fl4SPy4UC+bqCjGEXxdP4GIvVxGhfeR8QsXJjkmXEemtJj
 JgrG9e45LS261UgyTliugaOBvbMwC7ijigmevgldyrQPkNY0BjuGufwnT2qKXBs9yXgN
 noGxHjBwl1oFvtnfp0nSQSnWSsCsDKHucQS+ynrzOpCHfdLQTGq9TjWCI937uL8xeGuc
 yunaXLzJhb1kWweFhKiHINi/fYl4yIlawWWLeqRJPCGSECUjpilPxVOS7YeIgbztCYib
 EIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNnurjl/+DCmZ9XddUCyKGloqLfeEuj1zTLSQFpWvLrA7MA0qHJaTDyfHt6OvQxK16SXnPjYFD6lM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzdhW5P3g2cLjQAGXuiUfhfPoBA0b0WUo/ejeSp55SzXBpPdgP
 OSRL2ztK2MB54EiKr/cMC6rpJTY+fiytTCfW2qtacCl3MGVFr5K1P6eF
X-Gm-Gg: ASbGncuJ65Y1ObWjnu1JtzQu1lKV+M3P8I/f2lSvhZMeQOde8RO+JN2/Bj0VdK1GBqj
 cRCYVrgi3/FPD25fqtMT36Pm/26DUoxzEQq9KDn5es3PbXXtoHLTPMil/gKDEFJRK5DnVzdtXTi
 n0eLbNjMZo2m9wiKfEcEnB6X3ZE41dNRRzbWK+IKJCS/8rHGLwjYL19EY7RnWHkL3IDBNG+LP6+
 YIj8Mlrs8cwmzrUR91UKfPL8q8NNHcqtbbqW4AOi7EfeKVFVKvnBT2fcZxVFIhOFp5V4NBngyg6
 fmafvn48E8YtuydH2gaKv5YHYgsj/Byzk8pC4FIoVKdVFq3Cj8AwSATy5QyYPlIdPBiApS2CcPf
 nnLWjfG5DW2LVejgGAcf6AJiUVXmbnfGCwi5/urpm5S1FDgcqeeAB94mGRGwK4L+7oP9OafLLIp
 ruZw2Q2zE74qK7WJiBEWRU2KUZGwlfgOtLrWAP/9gi0f7xBeS0raoLmW9xLnl39Q==
X-Google-Smtp-Source: AGHT+IEQgaJHNjNCzev2AElmYZvm0Ji4cjMgDetLxA+1NUJ+RNTYtKrBYXG44qqxgaS1GwNzvFxAkw==
X-Received: by 2002:a05:651c:4353:20b0:377:991f:c1bc with SMTP id
 38308e7fff4ca-377991fc573mr13307731fa.5.1760731209147; 
 Fri, 17 Oct 2025 13:00:09 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:00:08 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:35 +0000
Subject: [PATCH 1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

Due to condition in dpu_rm_reserve_sspp, RGB SSPPs are only tried when
scaling is requested, which prevents those SSPPs from being reserved if
we don't need scaling at all. Instead we should check if YUV support is
requested, since scaling on RGB SSPPs is optional and is not implemented
in driver yet.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..d9c3b0a1d0914a47f86ac9a854fbcede021e73cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -842,7 +842,7 @@ struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
 
 	if (!reqs->scale && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
-	if (!hw_sspp && reqs->scale)
+	if (!hw_sspp && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
 	if (!hw_sspp)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_VIG);

-- 
2.51.0

