Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0722C0EB7D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450710E4D7;
	Mon, 27 Oct 2025 14:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YuwzoHfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2C510E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso22078645e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577180; x=1762181980; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=YuwzoHfjuwnZwCf+L1wQpuEru3NTkBeEHlZu9W0B0kL6YB7Cth54zXAHqY3KBefSBV
 uvEfTMu9Y1tf6xH5ftOciLc7K2FXR9L+F79HkJUcbuGmLtdLH3FeLgpOQNZjdTaTLwkY
 mEj8b+XCKIwbdI4C22JcQdV0rWDHJxmTq2PE5BeCa+3cIYTQju5WnkLDoKJBEbG9ZXZc
 UONNklHdxqCBhp6pDar4x69BqBZvV5wsudQ7xaPFSftNw0M5beOd+xcnIbzf4JYmT35a
 EGXKnXlSmGy3LxcBFprM+z8bnoC18hkjHRfSjEcr7snoI/mHmsExP6npLsDq1L2nKUio
 6+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577180; x=1762181980;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=CzRG91lUbs+ZFIyGLfE9PMp8nVrZ+QYdiKUAKMPWwH7SyCXEr5yaRaaLn2iz44G/N1
 iWgsoH6T/z5JHOBC0T3bNTiW80cr49RzKapeGLK3qCqDvXQIkSSXqNlHE4iOWi/pT9Mg
 BOFoX40pvoFatglX9flthWaO8t0XhDWNofgywW7GIBiB+OmS9q+bzijKfUG+bGujZxeA
 zUmAnu/euKuATUwNFZQuOA1vLVwas2gtCS05HfEsvFDYWsmOFPwCh5VX8gWuJPX4+Tie
 AyEY2AfZgQ8nHfs3pOX10wNj4390L4Ds4PUDzqC/VmKyWjEIsENw7OMrbVgQ30gh0CkR
 bSOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvKZrqIOjK3o7MuJcJyMDw2ojsa0lW1b6q1y6P219+X/rM3hPYlYLCQ9ItcVvBehmb3YyI78U66TI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz35OcofnSeYB6w2C7N0GjrLIqlN7535xi7gAiogiQeILtwTPh5
 9m9wD09pOt1SDVyCB3DhnFmS8ieIrhnUuKh5NSUU0SJEILyPe3JeyiQ/efdQetHY64w=
X-Gm-Gg: ASbGncuvDw/M+srniILTDp6goi1+QFVt2wwFrBNRpeXfKCH44W9FXNN5TEkmvJ4R0FV
 aeu85suSWIs8woAc2OiPNMt4sQvFKddf/TFVapHmPYb5WqT2aAf/gmQndrro3bg7MSgEkw5oQAS
 ZLrMIP0IsQ58OW3LG4YRPNV39Qj7F8YgtGCzc2v8kyO8qtkZqglPyZo/DwWELcif1C8aVXbXKgg
 3mnBG9rq9AuK3VxDizULvvhTaT5zKrkEE5kC8p4j1KmVkp14tJVZOEUhLoXsO6bEGNukRbYaDSg
 3wi3Kht48drFXPyVCfnHDBikeHjHu/7+/SgpgkxVrsAJvLA9OwAYCTxOBw5RWHKWK6lffEFFKWV
 +ge3UBnK6WIZZ/DgHNx0f5pPFvOaft/Y6ZMUU/l6/i9LbBZ4QjwRSSGXcp1ZTVfUjXdnfGszp22
 DdCVhj1dzg
X-Google-Smtp-Source: AGHT+IFedbhdyUTVG6vMtF39Ky0OpPGo23tseJIEvDxXucmYOYN7UQO9O/xKimjpmGHuwhnOnJxyRQ==
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-471179174dcmr315798875e9.33.1761577179786; 
 Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:19 +0200
Subject: [PATCH v3 2/7] dt-bindings: display: msm: Document the Glymur
 Display Processing Unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-2-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Kp1VLU4+XFZTkZgR+tSxksnxkxtMD6rynYbzEXze+LI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jOWirPkps4aQ+Xz13QQMZYJ6dFosCe6dKiI
 grwBUPQlhmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IzgAKCRAbX0TJAJUV
 ViIvD/9MmR5ciJpbq5Sta9VhSZOQ/JTpJJkhuCwZhAv7xV2t7prQsN9T9XGyxAS3e8aRKNNYWKQ
 BAwW0ajg65MGIruV0mVneWa3xW7qK7WQanH0RBztXtfzvzeqVwcknqUWbnGx4iMaIywBEVw7p9I
 8m/MUnglybcwN0Nt7YKLiI6OwfuAB3JuLvRaQ/jtme8mJ5rHjrnhIWltKw94gzB/lrUsquNrUpg
 5Tym4DKp58u2JFEhHDDrWDx0qO2RKEg5dtJf6rsez1RDKhwPkDvNM+yALYmqbQP69SPz79wTCbk
 U27/Duo0F3XTHrdCMA/A0tPa981my2zGKo97dYSm6h83rtQ4P34zySrqjtPqewrw+QrmtKBIRd3
 TM5I+Vw9vVS3pVfdGytAkSQM/LlKy5sw6PQtU+pJXIpsJ0lONR8odQ5JvNkU2WCH4Kq9qYvnwHb
 5ex/60jEss7TLhxJ0D/pw2P5wKhIUs4thRsy5B+WXvod6RfLz8iKRI7PIx013ge8W5sDJOfv9gO
 K/rUjhHUztxgr4sFwSLHz5MbjAvk8QbiWV91E1CRQY7AC81WPly4dH3O31DjKAII2rAJ4OX3gqr
 VLdMHL5my+jdNY6gA7FrUAHzS2UPuXnkisyuEM9xVwxuWEullc8GA2ypBolnk4KRGaFL4RUqLR9
 CF5mDamtdCyD6lw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.48.1

