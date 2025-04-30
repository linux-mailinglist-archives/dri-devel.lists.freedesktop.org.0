Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B711AA4C51
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6074F10E7BD;
	Wed, 30 Apr 2025 13:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hXHkzJT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEBA10E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43eeb4e09b5so8688595e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018089; x=1746622889; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BNTFOxnRPcZ6WhYGseWxY5vst5HAgaN+nMOkTX4NrTc=;
 b=hXHkzJT2ndXLSvVuz4lZZOhClhMzpN+kezto19waM0PPzNZNvhcP1qKSCbYJVtUfAT
 4qsUSLMonor+9+CMYqyR+7SZwL1MCwbGRQevI7Nc+vs/b5kCAdgW1kH/H8KKlSmvrVdb
 jcvnHph1vMYTWHZhbLxwvyr4+jYwDfiPe/bnktYyetFA9hjLWtVbaBLKhT63TB/pIAWV
 Lo5ap2GAFC3fXptheVYh0IMnQxr+qPzcnpnYUmHCYGoKk/W6k3BgxAg0n81M1aXha/1I
 ugAaYYVCQjIdWjf1CahtPvtrpdpsWdsaSihCsb5kJYRAeQUtOapnAVSNcSxz6YuYfCKX
 otZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018089; x=1746622889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNTFOxnRPcZ6WhYGseWxY5vst5HAgaN+nMOkTX4NrTc=;
 b=bhX5N0jOBKfuEOO35OetEDYsYvUCLZGF7ekw1s5RNCQStMRr2JKnIHGno5R7+JnkDq
 YRqZxumsI+iSNtdUl75Nz6bnHMDpc6mxMzTlS5s6HU1zUUgSO/pkcNU6gLgXExfWpfEC
 ojytjQEPWyoaqZ9NIP+CRFz3lZgceCmaM+5E8cgINwjzl3uB+H/t+t9QdIOuS+B4NPun
 gGp9RkW6f/r4phHSL51RDZFHrP2bnav9Oe8s5Rxhyv58nqz4Rku5PUTLK4XHfeTrX2tJ
 0SV+1Cftuj0iz2m95vvx+pbCExN0/gnZW/6hqbtfs/H/5YGoNGF4xxw6Wsj185jbzsKH
 b7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5DA2hif5qfbxk/h0/FldPXYADVr7lYsDQYovd1WRUHIwojCDPIQNaHcV7ZRyNVlKgfEludYzaVXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXfGZPP+ffvCJRAeL96xZgpiiXdWE5/4QtQuzGmtMw2xp8xLwl
 JzSVxQKdjTGROj0wdugelkfXTfy0nk/Zd4chgyxDpaEXREQB+cow10k4/k3xfYA=
X-Gm-Gg: ASbGncsHgNEesqOzEXlVVIYDNV+rJPQ0IXhHZnIlRXLeGvqjd0pNeffYVcfPaVR9LZR
 H05/5gSY9xbcRLkkr/gkWWmQqrdPMvqCPRSTzhcuDT+dGjtRmlSb92ACudAaPiVdpF+EiCpJ6B0
 CuFCf+e3FE8hR6XVjZRBy63rxZ5W/WkhG9FHTYf2zKQMxA5pCGu1S3RQxzQAZUJ5J1PcyOMUb73
 qhB5ZMqtHyUBfpmuuuX+G14oT4JM7prldAhtMBVHGuExxH3aej4dcUOzH0ccnmHHjyAvZBEwRIW
 w8rxv37akeg/H3UqmD1fgtnn0swxhne2G2Zir8NJWzj5fyQzpEkybRknX3A=
X-Google-Smtp-Source: AGHT+IHlMZoelGJ6rtfEW34I9gDhC5o7c3KzV3fOro3gqzM9q65jvlNnMYM38ebtswKyn1TlcHWz7A==
X-Received: by 2002:a05:6000:2909:b0:3a0:7e53:b52d with SMTP id
 ffacd0b85a97d-3a09009a227mr815193f8f.15.1746018089253; 
 Wed, 30 Apr 2025 06:01:29 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:40 +0200
Subject: [PATCH v5 10/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-10-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rNPVbhB/QSRIjSYo9UdGRQ8CHtMBy7PxOxlH2MpHIDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7+xOav7RjOIgw1tKTvRgYi5MGUr3Nvn6ffF
 DktegQym0WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/gAKCRDBN2bmhouD
 14V2D/0cEjo50TqGVwh5U1oCpUGPuNxeiJf20wytN6G/FP5xGLDBYyQ7oqUAkRA70Q2VAFET4QC
 s+r0nB/xg5qYov+QiLpFla1T6ofO8FHse7oWNZNqjjb1wy+CtOgndE+1SnuR0vbIdL9EkO0gNaR
 x3CFilBosicr9qeDWRFq0JNLO+KIm+IpbpgTbAw2sM+YU/cJ3/Xfy1ZfiZMiF8JcRaqJPQYLSXb
 OGSN1epVnBW7lbk8gNl2ffS93CjKEYZiPrWnQOIRBIiIoL/q9Y9t0uv66Xtsm9UCcBDKNAFr6kK
 Mi03YIqJ25MVTZnx/cWPvQIw8ky1JVM1JsMIgvch462i99sla9M+6EFR0Rig9HjiKeWg2aAysP3
 /29IfyYKxr72bFbrrtk74jLQE3v16+44KYgZTeY8+VCCxNCqaI85xtbPxAnU+3QX9CiWZ1AC1St
 pa4woR/a7oHvGT27M+8LUP2IkwKWYuGgnYMtM8azy0TSbh7Z1nuJzIEt63BuqGCcDVO0MzLXzDb
 0fv7p8O5peB3moQFv4xfb0ow6N/wIbjCBjmYaehuRINZqpfCAKvTQlL4rXTT5Y8mAeZ2yCrKfxR
 3+FMPLLN/NuWI8c8yghMzsRyKiOHdE0vTetXcVskI/eTULK2ZRn08umdqtc11PdfsmGTIzUnyHl
 QKTkmrEPpaQNMmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Before blend setup, all existing blend stages are cleared, so shall be
active fetch pipes.

Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d7af6fff2708c12520a78cc6c979b9930dffc95..a4b0fe0d9899b32141928f0b6a16503a49b3c27a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -519,6 +519,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
+		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
+			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */

-- 
2.45.2

