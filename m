Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7EA3F87A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A9910EAB1;
	Fri, 21 Feb 2025 15:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g82/uVsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0423C10EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:18 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5ded7cb613eso385873a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151517; x=1740756317; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MScxPmftbdaB9C7JfNjmumigE9RQy6JfuyND1GmcrGQ=;
 b=g82/uVsPr7ISuauqI0Wl1wBGyp/vl5bP4DWdC9FIlbVkbyEussuQCW/PT0EApQIlhS
 Tkpc2aP0IzO3Qx60kTEfuUMAQINiDPxpTIsNPad9Um57xwtmUqCMjsIdTeIRfkOPKngC
 50WMbsY1CfKQdAJrrUGPWFb7pmlxWGc/aLz9fjqMFTCg8CSCLScjenQbgR5+r0JPWYT2
 KlNeubmXhJLIgNDzdVqX4j0PVsMOVQoHnSMXOrJ9qahkXWTvMkdCtfDRuVi52fWGPuUz
 DZS0Hh+b2LYWNHwsKmlyiu53MeYDgj2JXKjKBZfLMxbfXjhV9IPRv8acT25pi4EqGr5T
 cALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151517; x=1740756317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MScxPmftbdaB9C7JfNjmumigE9RQy6JfuyND1GmcrGQ=;
 b=fYDlJChHSae7d9SUBVKkVYzyUPgSKk6VTiqYT2XOejg2PMo2fyGQzhLRo4GlceG4gx
 S9EqxS+dDtv3tPxJ2XXrIvHaudJRI1nsmY+AMjXOxm2vt3/s03idlRDozbjFwx9Q4A8H
 4JiGZ2p9KAo8cBeYkeQixmBQgAaBwzQJ717ro//C7BnV0Art7lP6xMFKRcERimXzwAAy
 hvQd659ftSh7CTYMW9bvNknz5YZAEuRjD0lMCfzeDcU8ytWxSAgTeXpqVZ2sAi1kUdT8
 afYIcu3H+rbt2PqRAU/VDJLb9Wh3o21CPDQ3vLUAq5+VJW5sSW0NFDYd+PsNEWbN3XIP
 vT7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR3uSp1XGHVUn6Tg/9ip5C+BTw9Dgx9GVT1epPWQopzBKqG7uxtz13tiEE6cFFlbiChS9DKh7UIV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx17HFIOSoO3VUolMlPsgr4Tvy0w9+wnch5gSKYCORpeR5hM9/v
 MBVR8H09vffaH4SHJWr8ZlOKg+XCWbIpQ/+8YyKWzWpcaoCFXOSQ0L4BiDU6FyY=
X-Gm-Gg: ASbGncunMImNshZpONpQkHfHl7r4QdlZ8ko0w1P0zc8lGubNm57jet9ie05ge6UCzEN
 g/50cqrUePz1b0IOKm+9WXFB8SNAc2VW38f0/dGXoyGR+VIFrxdsfsZ+c36pMDTz8jIagY6AkAm
 D0m6tLWWsKkKD3Vy8HSKZCAwWovwFT0y+YNJBDr+I4AisSIu0IwfM64qBekJ3eChhGlu7HUY1aW
 KqXry4Hs/YY9ovemT4agnFyDF4j22O/lEj8qFzNcLCuBIyb1z1Ag0XNyGABpcAap/OJSRAxrG6d
 Y85CzIX1aGY2LoDe6suEIy8HmD1ZUk8bPFc+Z8LZtxQhbePL9vi9adW6bxOKnUIRQTBp6FHUDcq
 D
X-Google-Smtp-Source: AGHT+IEZnVvREUQe8xdsdj+GBrgqQ7C/qFngFux4HQwA1pzTqFUf21THE/JmZxJqitoZlusB8jqZIA==
X-Received: by 2002:a17:907:7f17:b0:ab7:63fa:e35a with SMTP id
 a640c23a62f3a-abc099e1dafmr140825966b.2.1740151517355; 
 Fri, 21 Feb 2025 07:25:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:24 +0100
Subject: [PATCH v3 14/21] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-14-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JRqovq+Rdk4ORXpGPmhXUXGU0PwNM6eotWnKyHhO04g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq4bVJFnsyb6JXH0wvrNs+g4JuM+dv4z0uK/
 SXpuDXh5ZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iauAAKCRDBN2bmhouD
 10+bEACS/6knRONeGRMXYcJCR0RdF1lHQo2wynIQXKhVTCF0F2KMsTDrqFOiGs1+EXBtyp+tM+Y
 xe/+bWynGqwKEbRNdt4haJT50d6v9mHfR09hzbVuxRzX7gC2dZvG3xyUbGSDTrn5kO9szHGLOgO
 9rRxycM+wrNkV7Lslr5FvhgjYdePrmrTBi4lV393VJZzH7hoFmQKBqXTyQCw/MD3kX6DGF9X7n6
 XvCe2nXpjelkmztT3j/HGLqpmSQ+fctZexywB1ZSQaTQmf686BIRnWLmvcwAIxWH8Ei07pQEeVt
 q5U0PgQw8KLGkR4YE8BNUJzS7qXpA/SAxq5wbwbClFKC2mMBtY4611wdvGD8oSy7Ueqby8+qeTc
 8wgarJfbYY6LmmB065D9QNPFNFqYh27BoHRsWlO18FBcubQHO5Na18sUbm6QSkUC+TcIyXmsD5i
 rXHpZltfdZg8DTREYZQdwfSIg27i93Xm3/pWicS8Zdk+koiRbiJAZVjfBLMw83ePDbaM6tGmSrP
 enOYXotVh6DXbn+cXfKpHuCnIiibUz/M3YlQXUIVwhYRAD3HLzXJKHFDR3hJc+w1yedmB3yDxRD
 b3Tzo0zzHml7BZtjxeYwGv9jRO3QI3XE51h23/N5R2OMnmc+hrTg+N4t9MI6hc68pAZpJkz+84+
 Yuv0917jW4WdbvQ==
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

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 1c14770865b4b5f83a95feb35d8ca6b0c87fdb53..43a254cf57da571e2ec8aad38028477652f9283c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -254,6 +254,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.43.0

