Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554198EB28
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAA410E146;
	Thu,  3 Oct 2024 08:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bdoZhyBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8610E7C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:14:31 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37cc5ba03c6so39693f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943270; x=1728548070; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vSEcLxbQ1rrHMFIK/V70J+zruVP09R5iUL/h7LGL//Y=;
 b=bdoZhyBEp0qv/rGFP+y5Dzkx0if7A4uxzZ2B/VQj5T+dKJNeZ/oIGqr31bqeXbAcwX
 +3s8x/5fOa9IhZ56VFCyTy+hUVeV6/7StZuIAHhLxTGVgwmbmQw1ZVIww9kDsu4pcnkY
 cgx14rV1PCIegcjPiT0GZcfOHK1kH/87sW1MvXn6VCrc7qUW2Aq7dxFcpQqmhlAvizTq
 5ad1i0oOB5O6YovBS1UPhxUQqolO3/nJSNKjdyDaiikVRQEaWuDdvXZtVZhC62MzW8dV
 0XIKwAVsNbIIYbVz0JBqT4O+eTtynQ3hkHtjcU5NE0dDogPNdDUYmPJCNTXak5Vjezsq
 kdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943270; x=1728548070;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vSEcLxbQ1rrHMFIK/V70J+zruVP09R5iUL/h7LGL//Y=;
 b=xHJUfZ9hVpk+gkJuK20/xfTy0fgZX23RJPwJSZXVmb29mkfrpJvWJudnT82qJd0LH4
 vHqtjl62KSsbKuB45nDm+tMnTW/ki6JKpweb0QBtLY2KPT1QaVa2w3Rz9ZtTCqF5cxSg
 g3gKWnctDNwGWfIZEtDfPOoaNJJdq/5jaMLqoSPcoRuTG3vqzs6an1HOFkyj/Eup2yT2
 Cp+9j/X4lG/4u5gxORgNpJzsrqjJSeuQwusf0zwIb/DCHAZvv2pLkkfhmG0zWxR3fv7I
 aLnx9rpW1iAWKyrm7dPnmVXjbKMpwhtUfT1M3ov+fNz8ZdtJKSVh+2V5K1CJ5hpQ7u8V
 PV+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc4u0qAN8ssrGK3hNxWgM0Opknlnk/yWO+AF6NPtwDH28FpjLTPXAzGK9g5aWs7/rN3KcaNsVYiYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHrfkkA6q/YukPETDXbDWW/jcbL1AqSUlU02HiNeBOlJsWgKgj
 D4F+deKG8ibZyLjw8bBqMFP2PelVLcIFK0NsP7BeDePlVUmaeiQ3tENzATfrBgg=
X-Google-Smtp-Source: AGHT+IH7t9y7v6imgHnd/sgCeFjFKtQdV6hpExhaAY/b/kJTtO2vgSpQdJmCamy8wnoMaUKMuCuBSQ==
X-Received: by 2002:a05:6000:1567:b0:378:c6f5:9e61 with SMTP id
 ffacd0b85a97d-37cfb8b62ecmr1938691f8f.2.1727943270207; 
 Thu, 03 Oct 2024 01:14:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: display/msm: dpu: merge bindings
Date: Thu, 03 Oct 2024 10:14:17 +0200
Message-Id: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlS/mYC/x3MwQqDMAyA4VeRnA20qezgq8gOusQaWDtpRDaK7
 77i8YOfv4JJUTEYuwpFTjX95Abfd/Da5hwFlZuBHA3euYB84KKZNUdktf09/zBZwiSltbxScEI
 P9gNBW+xFVv3e++l5XX8MLoyvbgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DhsL+XpaZovnfsrfiPwX/hOfQu/Ru2Ru+lnm2TcM++0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJbfSn7GKpNe1OQyR16C3C0pTXS1ma7JYfjU
 mP0Xvg7RliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SWwAKCRDBN2bmhouD
 1w8BD/4m+wJzud/U+Uq714fJwyJ48d/HyKIewSyrvLWZY818t0S4ivQR1u5iUIyq+ZM29xJezqC
 drnIO2JBH5zO2KP+kSE2eAlYpDkSpSnH7dgscrmefiy/A8P3SjuH64/3Ss/ixvpmkTnp7GfU5tB
 sXIcALKxfnpVeKP4L6Zo/5Fpi7CY3+gnxqQvRO9OnXJRyRhzHgZzkJe/gnpHYetI8MI2lAV2PIj
 ulv5dWOUcjmt0nUS8X09S/TZCfcEhVr0rQGJh9kOPfT+5jKUiHFP1cIrY4GqxJdE+klliyW1tYj
 w+VAEyG8ms6eOuxowKaN+jD3fuQM32+QiG16Gmtixoutvp74MTtXM7g8GPqevcNEK/r11Ue9GLV
 R24F+L+KI/rjDo3l8T7/u4zbtjIYimjWViR86f5BCOqmZHB+kwYS3qD0jEgOphNE/ow2eEMiLgX
 y0uzs8WLTzJCykbEEIh0PY7x1GEkZzc/ncrbbnTX4r2GjK+lM0C//tda4Dx87eWPZ48z6kvnS7O
 mDn4aRHyJoF1fiXlZkwxLYCrity1kUO5L39BOHb2QH86hXW2tmWD6Lr4Cz1HoI7V2fqU+xfDYf/
 hsLYNmaF7UAroxqqrxyae6shRRL0lZavzSwQJgAN7P5ImyS1iP6NnTbL2RbIf6aziS7IPXSHs02
 sq9dwezs7wUda2g==
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

In 2022 the bindings were split each device per file, but this makes
not much sense.  Devices are the same in many cases, same clocks, same IO
register space.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      dt-bindings: display/msm: merge SM8250 DPU into SM8150
      dt-bindings: display/msm: merge SM8350 DPU into SC7280
      dt-bindings: display/msm: merge SM8450 DPU into SC7280
      dt-bindings: display/msm: merge SM8550 DPU into SC7280

 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  10 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ------------------
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |  99 ---------------
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 ------------------
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ---------------------
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 --------------------
 7 files changed, 12 insertions(+), 615 deletions(-)
---
base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
change-id: 20241003-dt-binding-display-msm-merge-df230e26d142

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

