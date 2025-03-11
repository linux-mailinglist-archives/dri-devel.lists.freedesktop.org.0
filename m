Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B84A5CE87
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CA10E673;
	Tue, 11 Mar 2025 19:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xk3Am/lX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089D10E679
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so337425f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719758; x=1742324558; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z1ZjEkkc+uS8mzR19kQqDcUN2sKHwaFdIpV4ZSZeJMg=;
 b=Xk3Am/lXhGG9XJa5aXpWoS+k53IOPnw0EpWWdX4/DCd5Jx6Z4Ct64ywVI/RYVLPMzP
 KTkjywWsNszdHln/cnaYh1nOh1dZQ8K97jrAhQQAc/TjCx6G27DMuEuzHlzC/B8FiY4X
 +5YlL06IyuMA+nX0WBd2i7mo0a9UJHe8KJlMWSoQR8xD+4l3V+S0FP166HT3aRblQALQ
 zyxox0/GMOJtHrZed/LQdVl27XGwK6cI2BSK57Prhz/S10rcq8S5YBTVFF+Zv0vYHLfc
 mdn/DrlrL798fA7c5Xahx7NArAEijYfjqG+eABM9m/Ff2RW+Bnzp7Iluiwmftf2ZptwA
 kpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719758; x=1742324558;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1ZjEkkc+uS8mzR19kQqDcUN2sKHwaFdIpV4ZSZeJMg=;
 b=Exwdo9agJ8ghOFqECxcxkSf8uIugaKgnPcslrLMqV70gmU4y5QK+OVLn7SbxqOfJjX
 qbiruYLNruSgt9e//Mce+aGMZ0sGs9bTkd6uEgy8x6x3+6fM4DMSBTvWNNB626ECybaV
 3T5JzxkyOwgsMn95vQnMYHXkNr3Jruz9DgIf+cDfBJoaKoN1E0xlyyFfwvzECDfjgd+u
 1s4Hp2oaDnjjUxIbOWySiZlitNQOr+PSO4g92BKmtAiUhcpnW/AtAYZr2IiaYNMhE2Z1
 XxsWFo1nanhYtUtFr5VhfL+Zd61OcgXd52voPMfknEMyhUGD4ROsv9J635p8T8B+oSSG
 sLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUhgHQECFRVJTEBwyyqNPEU1/10aQUAmOITOFXqvYo2JGlYYCJAVWSfmidid7BKmxtrUkIbqf4vFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdkVwaxvqxSKg9TjlV7/RPGb0euon87BB7R7y56Kqs6QHev99o
 zAl9hHBC2Whc0/p1QslkZfAl4pK3S60/Iivx2/MXCNVGLfiLY+eUDJvAH07E9yA=
X-Gm-Gg: ASbGnctHdeQpQHybzNOT0uTZgGx/HojJkr16yv7tpPmWbtgt/pZTKdFN3kN0rgia0y2
 6LPYWIXImRll1Gd4+zKT/7xfttvz0ZMd2Ep1CsTW+8Se/B625mBAh4NnruYfbMIsXqSm8VBcpYq
 MWnvpErw8aZ67om5uzZU50sniFap3s9YucJ6eZBhYmICMIbpLoCBUsZNBaMrrIIwbGE33JAtlaR
 RriaZBOCYvKTuTUgDAJf4+KyZjai+4C8yj1aMEVK4nfpyR0/HyKrOGYVB2eqQiDji+37u8LU2Ik
 aierttHZh1ChE1VR2KvoEB25yIu8791VqhL46q7M5MdvGgkeuHXnhLN+9HA=
X-Google-Smtp-Source: AGHT+IGrs/y6SCxMBLedpcGIeqDpbssorlICFBjprBhZtsMWzI0TH3/r/UA8VCHc12GtCrUTJogXDw==
X-Received: by 2002:a05:600c:3b8a:b0:43b:c962:ad29 with SMTP id
 5b1f17b1804b1-43d01bd1a8amr24880145e9.1.1741719758167; 
 Tue, 11 Mar 2025 12:02:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:59 +0100
Subject: [PATCH v4 09/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-9-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CNDg+XuaDwD/Q1ciROvRqy2g2qzG+QFV1Mr5Bw+PI9c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiseiF5z/dH2K2cPaPmQG3OrPiBMW0tQ14La
 jZAw5WsrAOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIrAAKCRDBN2bmhouD
 1zfAD/wL6ZWVCBCSes4cUvEz+y6x08TWWYu6pFAwj1IHSlcr8xmh9/sNe1+MmFrfH41XmUXZFAj
 Ulo1yGChFQy0DpILLlHT1jwwj36H8bCeTPuCG3HFMY9TL7NT54LEBUwwVIYkoXCsz3ei312o4vS
 mixSNGTgM0gJZhj41t9prQxbjfh9dDWKqXQHkj//eN/XHN10eRnBqka0DiOmxL+MEahtzDO0p6w
 LPhyDT/WrfbT84ZkglL65Oqq/moKE8nLlZqWdZgxO/+I9z+93RRtwtplAcF0LLoa3wNNkg2pDe3
 AA8bed72dGYp8hVsrTlIBTga0IJdbG4A+Rs4YI0eyN5y49pCwFtNlR1yb7C23zGlv9rfovDEyh8
 YU+XoWIKVYw8mO7Qf4C7jsT2n6VXMWWd3Ge3kyTSuFVRez243wWArrXoKi5u8n2sq2mB1aHA7cK
 cLiu9hlcU3zn8ACaRX2iVwWpbUP3B5YXU1MQ8Mxy58KErzjkC6piogyv6vsIU9t0x6kJqBTFY3S
 GX+Rwb2+HUKj7OODP/NJ0HvG+C/YdXeb7k/y3XA9bb7ou02b4GzWfdY4Tn6FGanzRozL+O0UPNe
 3ASKZ6CN0pDGjzGCo0LLmRIU4hV9MnWP62I1jn/UoIv1EwRD4EipZ3gJV2vnjK7vIkUB/KOMcBA
 23Tz74v1Aixrahg==
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
2.43.0

