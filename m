Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92946BEB6A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 21:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007810E156;
	Fri, 17 Oct 2025 19:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kvx++sdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647F10E156
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 19:59:54 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-37777912136so21746461fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731192; x=1761335992; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
 b=Kvx++sdDkFRmApQUtn+grz/wJWkS4pvcFJaQGhTV1ytK74BLyI0SI85VpxHkQUCHg7
 KT4UDMBjeknPhHT9b3hQl4MLo5nYwVq8/1M3Gqc5rp6YYeA6RuyYVPeD40GO8x7Dp6N7
 wCeo2gvnFBJWk7ca37+LXVWcI4GArtXqnhyDpeID1q/LDuoWQjQlE/kY0dHAP8o0UWYM
 C8amIi3fJ5byaOVw+R6vW4JGlXLSDikgV1blW5oml0+0uIP8Lstu5pTvrfm0mmFbMsLD
 UqFvuCTeEv3BNdp+H+0B+2cs6BE2BgtZCfqutDcGA14H8h38qDOkt+2zPoFMWXjcUdtS
 meJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731192; x=1761335992;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
 b=YHdeXnmxj4aEZ/gk8IPcoDGQE9Jc6ZuCzCQcSkReXprXUQ8f+fuAWysKErH5wmio1q
 /rzyF3bOkLovlvcDBG/Gbt3BEN0mqxsKlz0EsUMwdyRlYjWpdmlI8Fo8hMdNAeYuGb9Q
 13Nu2n6ItifdYj8dEzLsJV6a1YENVX5eW8uTnLZTeZzVDEeS1DfkcOtWmXmK6m2jZs/J
 RD4p9sbpKxjpED4OW/prkd9KaQBGtsWqQpKeftxTPfr8ds91TRtGaR/ELlT7yVcYAwj/
 r5ZCcL/IawOixUCIh1ZCar4OdUB5j1F5VjYzPZYLEhUeC4qdju3onTL5jXJGXcV/TyzT
 Wt5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYd4ux1VOKaVweFxBVietMl3/7UKR8ZcDAVL9k1+Yg21IHwpIpUrdVlWCZ4iSUx1HZMUXFKnrR5lQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRSDs5EhbO7nOG2Kurtq8FnS9WxJhC0UaPEUDlHGTGPzu4WlGR
 ELnduypaAdTUEFVWcKFVZIM1oaZwqVxUOdFk46q5FLLKdHeLN1o7nts5
X-Gm-Gg: ASbGncsxlxlwm2QzksdqCn3kCtEdKkvgNrgvB/+PgxTIlCd+pOjigmo8bCOzDkYDx+z
 f21bZArc4VA0ObQ2bMSCleUrTlFmQg4iMUXgRd35JgeOkptESzLM3HQn1L5OUPELZ7chjShYkrq
 K7sRtF3dIaneS0yNYShb9qSpJXcG0K0racGBJuY1b4gFGgVAY7X7xrcA/frUm2xT3XxhG6xus2S
 gAnTumRu4KVCTok1Lkgzr4JeiJJLtcKZxEEtiybueUeP3kkwLUvFrWoAsYUlqvociHC+I/W7Tbn
 SIFu6wpv36eZDvU/rgdIg/dgm3jNlD+t4fOiyfyaYVGokIvmXfZDhVKfsepcbk3c3g3AEAcf7RE
 W/FPq2h07D6SW6J+TTnc6FiddSpkEXJMlcqk+elbqsrA3gLgo6GRHGZk5J/e1k7K+ms/u/4l32P
 h6244E7yrgkwc9ewF5WDr8NxpaeudaWbZDRv534bHlNv2ihy6jlt6mhnNAniHTkQ==
X-Google-Smtp-Source: AGHT+IHzKo3kQw6iuMExqSQ6fFZYvK2nL63bBWgR7byM2mBCBlbduwkLkF6/MliA8xn5+NautTf/5Q==
X-Received: by 2002:a2e:ab89:0:b0:335:40e6:d054 with SMTP id
 38308e7fff4ca-37797a8ec26mr16180021fa.43.1760731191742; 
 Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 0/6] drm/msm/dpu: Fixes for virtual planes and 1.x features
Date: Fri, 17 Oct 2025 19:58:34 +0000
Message-Id: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuf8mgC/x3LQQqAIBBA0avIrBvQ0JKuEi1Kp5qNiVIE4t2Tl
 o/PL5ApMWWYRIFED2e+QoPqBLhzDQch+2boZW+UVANuGn28ceeXMjqrR6ctSTIe2hIT/aEd81L
 rB2Zs+NleAAAA
X-Change-ID: 20251016-b4-dpu-fixes-c847c48e0e5d
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

This patch series fix some issues found during testing on MDSS v1.16.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
 4 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 6f3b6e91f7201e248d83232538db14d30100e9c7
change-id: 20251016-b4-dpu-fixes-c847c48e0e5d

Best regards,
-- 
Vladimir Lypak <vladimir.lypak@gmail.com>

