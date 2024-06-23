Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80A913DD9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E6E10E02F;
	Sun, 23 Jun 2024 20:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nE+5eBdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD010E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3632a6437d7so2088648f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173004; x=1719777804; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
 b=nE+5eBdDh2X4vLyp4ujfU59wFd5KSP6ZhT2d3Swm2TFprB0vgrY8ysgn/hFybE4KNB
 weUc0nWDxXXuF+Ia8k3AHpqKQzk/hYNBe0TArr6j2nMSy5s+/kY1d8bhFFR68AYmtl0M
 qppaLI77uwfqc03FCysEDjea2aL1ZoefCiZ60N+e7I1lesQvdWlLd2WTSRnH1uqf7i05
 ZtFHE5A66k1aKHyHT8JIaG29JBH0M3/vrc+CYZbZstb253TCuJO4QhQOlDbSTxWhBfmr
 aDn3JEfRcBLb5Aa958gvoTjA/fnFt5g0zQK4Q/hgSYTv3rw7DTg0OMjKZbHZGclkBcg5
 oPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173004; x=1719777804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
 b=eWr8RkM3frOiM6gDIYj/P7R33SXn45G7Q0RLjF7chnoOZGFNsVTjPMUYBScjUiRAUZ
 n6ezgKGe13bHaU6DJodf2NaMGkV4gK/qq+e7zbkHnsSQe6ezWVNslMkBrvobMhU1wWwF
 o6hzLjYnlif7/CsnfW6GuArsDTuxuGeFzODRrLteBPXAxnbFgZN2NIwPgPshC9bbwDLv
 m5Oa+4qQSz0oS7oDKBnvABbfICTM7jH+sEDr21LV09KEGNrZTC2VJ8DOv7AMHkYxSpC5
 pCft2QG6Ob4utvc40gbGkJkunz0rd+ewwh/SHIKvf21XCgFZ5z7mzdVKhPgeTm7sB55u
 Yr3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6WCxCiE7WxNWePXOnMOiyVRZYrjz7nOBLwRT3T1dEtvYTC+4FG/FyMuLGb1v6FdvHR54tEj7pBPPH5OC3TdfM3ec3ErbR/vKTBGrDyNUC
X-Gm-Message-State: AOJu0YxW038auCpkxo+EUIvdgPAWz/53yOCpAfcGpC1ulFti+mmhVrsU
 gRRG33CTZJIjVoDnWxbW4pbQpHQIgQDhpf/eYKubgty0UHnjYPm6tSl5jy4Sg7Y=
X-Google-Smtp-Source: AGHT+IHXjo1p3nWZ01xAvTOugxwyrcUPPqOiFkhLmLWVxzBSO3f+jItCrHh/KiotvIrA7c+/2lWp2g==
X-Received: by 2002:a5d:60c9:0:b0:362:ff95:5697 with SMTP id
 ffacd0b85a97d-366e32f6e6emr2824915f8f.28.1719173004401; 
 Sun, 23 Jun 2024 13:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Date: Sun, 23 Jun 2024 22:02:59 +0200
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN/eGYC/x3NQQ6CQAxA0auQrm0yVEDjVYyLkVbswo62hJgQ7
 s6E5dv8v0KIqwTcmhVcFg0tVkGnBsZ3tklQuRooUZcGOuNvLB/M7GIFeQ58qrHaFMiuizheLz2
 1ue16GhLUytflpf/jcH9s2w5h8fIVcQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v/zktkQzkNna4ajsg0uZhPmX4pEiKPEmyNml6ZSOK68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+D3+jXyaPIn5KqI3zy6r1G0G+jezR3cMX+0
 oZDkPvRBICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/gwAKCRDBN2bmhouD
 122ZD/sEsXdK7df5NA90iTRS30BsJKkjD2XSGxBqFV3HAjUX4xUZylwPUJEjO1BOkHTkBILbnpb
 GGTN5/U2DOuvnAedHXkrGlo0D4yMfUawUQez47I1cbSKXT70zLRPfp8TgJsVZuz8uhGEY0fvMhh
 HhVC5EINY6zPuv/t4rGt54TbgbYUC+a1oFZEFKpe/7xwohItzXs0khu9XiVcT9jRLtezkwLOxz0
 hYlV0M0ouCdSZWgm94FSNzmt/4mjRuIsnsb/812N3+K4kMOmwfX4a8l5sCsbjRbtr8GxSRNkFzP
 wF1t5uW7xuiJADIP+NBe/moSncfxKGsfzcilPx8hdXgZ/Kqi+QjNrg8Gl0DHN3GxnaYdqOkBOef
 0r8XiwKPuozMJzPLUT7/X/dEW8SsO0GuYlS8SJGnced3NEHULwhvfcQPbz+L89GP1KOBKNkTbD5
 kbTp72kzf+s0CIRVC+TgTEYHFCrsLpa6RiB64hBWKySFcgTowLoAqvjUuvdAs0VDOQus1rxVUPx
 P75dkngNky4SkQoNUmg5lGybe2OnjfvT6PuXbIgh3zTtHFteF8RzhYxdlAqWIALqsG/IuK9G3zj
 6W6YqhkFA0WCNMn7hpq7uc9eKA/Vg4wB2toQAW1AChepHkzmxcbQGsJYS9MzBYwQpTQ0XrRtY1b
 JNxbWVlOyscMsqw==
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

Changes since v1:
1. Add tags
2. New patches #3 and #4
3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
   reg/reg-names per variant", because I need to investigate more.

v1: dt-bindings: display/msm/gpu: constrain reg/reg-names per variant

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: display/msm/gpu: constrain clocks in top-level
      dt-bindings: display/msm/gpu: define reg-names in top-level
      dt-bindings: display/msm/gpu: simplify compatible regex
      dt-bindings: display/msm/gpu: fix the schema being not applied

 .../devicetree/bindings/display/msm/gpu.yaml       | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)
---
base-commit: d47fa80a484f97ea51991c9547636a799c264652
change-id: 20240623-qcom-adreno-dts-bindings-driver-87521a145260

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

