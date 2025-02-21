Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A470DA3F878
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF510EAB2;
	Fri, 21 Feb 2025 15:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JB5YGVF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EDD10EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:09 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-abb9c8c4e59so36350666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151508; x=1740756308; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zxNPRrxR3UMx3sFuHZSjQWUIyV+Refeg1tW/AVVJ31Q=;
 b=JB5YGVF+i4yRR2/w2v9mmStnukFAEY9zirh3ZhaCkrRIlx/0VbBn/nZe1eZjb4Cy4m
 xG978Mn4mwR9/+p/P5G6JXv2Mc3icF4axbe4jXZj8oL8lZEf08jvsQcwqtUiHgjpe6d7
 rAF5aHlt7GXvE0fWVuZG6/2f1tVuK6Ij6w/lUGSgZYNgxk6q8pijXPOMTZufl+cAps6B
 udsg5+bNefBIj63L6sY+Jb6hiOvwysJGxCuQgLeGupB5AcXDTM1cB6vRwc2bh7ZDFvZ3
 IEZIyWE5LriITBRBCyo1LDVZsehLJHDyI0dWoOrePML9so+RNCg8/61/b8YpcZ4LUH0a
 c/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151508; x=1740756308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxNPRrxR3UMx3sFuHZSjQWUIyV+Refeg1tW/AVVJ31Q=;
 b=rCxklb2umiFYUPkgTul+hRrlELLeA/OcZ5NZAuIea2N7oY6hsCMIygABtw136LC+Je
 Vtf5ExBwItXdeXixUd0HJm/1zMNiJM6cAaC+E3QBoNAM4u+SeOzyRw/wur5WFq9H2Q5I
 f27DLlw3HVSqGMAPQKyKZrjGpYwWOKEH3YbdMVDDsfQCo+ktYghQJLSPGjqkimjP9qAp
 bPCiOXU6W485SpndVnWiisVGELvhoyBnFaHE2u2Rbs1MF+7B5QeMCIfVvbdgq8/q954d
 Lh7tDiJpHUApHto7OnEUmhrv1ZBX1Po4igwskH+OT+IoT+evZLOm9wkyxW4w9cS1Ey6o
 L57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdlIA1ONbhrKT+psh3BBwb0+SgkbZzxvCBS8qIwTK98iokLxG5grnw2PRTEiU2c9hCoiQBQ1HCfUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuVfRsB4x533Hg+23wcbwyRE2wAaHvaWQx+Yt2vl6Qpl1voz92
 76UpXUQC2rc++qvn4LnL5F7Kd5hLzyF3YmmWW08OdB/Lkdj59K3IbuaGXAU8GxE=
X-Gm-Gg: ASbGncv9KkXpV9pU4EEouMnLzEuwGWSNa/uJ2CzeBNeVVPx+P4iKjeE7MXkhub+tZOl
 fIbPftwowSwZHz3Z7aVJQ043rsrWTI8zwqSC3IdXIkyXg45D2b5QSOh+wHgOJMZi36TcUKHbgUO
 Yon9jBrPv9jtOXi+tKNMpH+/i8IaP4QBXhOs+HLlZ4lGLc4yFrFRXrDmOBqLpsvYWAz4JlX2Tqr
 bQgY2arPaVUj0K1t4MIeG4nLCB4StrBHMdLGcUEDpgfw2NQwstw+2YJIWGkUGISBUs7BfvgPyJw
 yMM2Sjr9CCAerRKhNGXMPBMJ9r5JBxXftP8HVxvIL63JhOwmFI+UvfrblQZqBf3r1RPAj3+NzNr
 V
X-Google-Smtp-Source: AGHT+IHh0fQaTyfAd7x4CiJbEqFqx/Echs59QFfVMAyNt0Xg9z7x/W4mDeJ4QDQAi9ApihkTQ3yXlA==
X-Received: by 2002:a17:907:7f8b:b0:ab7:cb76:1ae3 with SMTP id
 a640c23a62f3a-abc099c279cmr142429766b.2.1740151508098; 
 Fri, 21 Feb 2025 07:25:08 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:19 +0100
Subject: [PATCH v3 09/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>
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
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9VwNmNeCKWvrEI0E43BuyMfe52M7P67PLdAG7OHfpN8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGe4mrSg/e3xXqGoaof807wjPY4hcAiqoJ02A2Y8HGAKoTAAS
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnuJq0AAoJEME3ZuaGi4PXsFQP/Avo
 A/CWck20edK9vihNhad341ZvUbBaUW4Rc3fw7DvnDOXT+MOopRGMO8GyCH5s0e7MVVIWlQYv9ph
 kyzUpzOo70C3ssipW7zJU6oJkMP2j8Ydvo7i6j4F2e1OD2WlcfY40bZ2pPmOtbXNdeR7iCuoAk7
 p80XegXIlzPE0Fc0VRQQCzDP2xIH96/iyRw/7K7rCFxv4AIKZq/7m8d7Tuwv0DnfeZgay+N1qa5
 cy9Uz+sChIr9NjE4dEQPadqXmR5TnQrSrJqhSNl7JRxs5O/TScaDpKRDRGeM1zeRoxp7QIXLH9W
 8vX0NjfRqE+htZJSH1yFlUoLH5+fJQF0A9d7rUQlZjWXrhrLexCUjH/eKp9RXtxX2772utDlKF/
 TwCPhN4MJS09C3XTQX8xdowMHI5siFkrK1FLCn8OGtrYgdihNtIi3YXKolbcWNe9Fi5JoAO1Kpf
 9mkSWz3pK1FtqcTuadbKvwlSh8ADtRkWcc8NkoE6jx4rLi/K3lT+uRCiPg309UmSJcwXloBPRUD
 lpABBINqeAk1K7W5KtNOH5eDxE8SOJJbww7Mro/TYEoHDivtuO5dph/J1P1QU4sk3hjQ8BFDYtX
 QtCIE5m1xHmtz1O2TmzObe/M6yiqIgw1Lcp+zge2SEba5w/2IJ3khamf4glL3S0I0k22chHL90D
 OUtJ8
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

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 48e6e8d74c855b1fcf13c8f42516437039fc27da..090b2aa5a63b4797169b24928908215e2424e6b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2199,6 +2199,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (phys_enc->hw_ctl->ops.setup_blendstage)
 			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.43.0

