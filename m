Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C726913DBA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 21:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6410E0D5;
	Sun, 23 Jun 2024 19:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C1fVLDFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3A10E0BB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 19:34:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso2144620e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719171267; x=1719776067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDaFCIv9yP8iEYUX+Yf8rcMTPFjNoAdph08aEYT9HUg=;
 b=C1fVLDFsheA/4FBO5FXRUuSq4+Mpo/NAEBjAL3jQZoAchzsDl7sORwt6tSVOpx0n75
 LdnznBd6t7bQ7+HhruNjNDjQG2QSEwAgUw6WlKG/OfuE293hip6BVuDUo7W1ohX5EDhH
 pTuBf2yOyh318sdHBNUVlmZDTRc4yZftVlKyW455XBI1XJDasE+Eg0CRSnzowe4MUhR4
 XmRdltpPTpOIT9KJNyotSYRIPBrIM3Els/T7KriagyFy/8zF89Qt5oUWjNuDRXSWL3eT
 l79wI06WMhc0ygm9J+hMJJsZy8/Czk0knkvQROL4LcaV3VSN+rd2gnZ1k6nPbytxBdJ+
 ylzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719171267; x=1719776067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDaFCIv9yP8iEYUX+Yf8rcMTPFjNoAdph08aEYT9HUg=;
 b=SIq1dE3Zwy7HrhXlZp9gWroiOKz2PGgWn961b3Ajl3ssulNfQD1BbIpRpp36PBcVro
 Rzz2vrMLWmvXZdh6D2Yui5S5kez5hO6MGT6FP4d0AVtZbSr30yNpILzZt0kQNP5xdWqn
 zcoQx9D42WX5Z1VjTuJssNMhxY9rrRwAO9FJuYjbN25ML/O5I1cTcbHUXlD0AnJ8Qxja
 +BRh3pCRKUOx/nI/TniVcd0wXW9pcDgiN8g5gDzQL/ij46DBwU5ufXLmD5wDwcDBN1vn
 VnE+ljm821Fm+NCmQN1Vfb9xTwzAPDFdUEwr2dIBXDnsbYAM16ZhGxU+i96/cAf8UkFi
 V6Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXALd2GqPrcX2D/Me3nYBMtqU/e9meHQGLfQiKt6yf7GZwZ/KzJJgjFTbbbVzg5H7i5PGaHFLzSihBYvdOi3MMZvPkv64tNTuJ4GH5q76Q/
X-Gm-Message-State: AOJu0YwPw6g9Y6qWiaMjNbSKEj60dpRTuw12a3fWKwi9VzlQirQbiSR6
 iydXiqaplSYlnRNcZ11vh7Nrkkr7EkM23sOOfeZFh2kXLXSho4RKVUgkGpK1iF8=
X-Google-Smtp-Source: AGHT+IFiF4v5vQQ8+INAB3JrDali3WgslfxwWLouELwfpZN6txtwJoppt3sxXUoF77ksqCi2N31WFw==
X-Received: by 2002:a05:6512:1151:b0:52c:e6e8:7a91 with SMTP id
 2adb3069b0e04-52ce6e87b8fmr457502e87.4.1719171266809; 
 Sun, 23 Jun 2024 12:34:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d1fdsm114756015e9.7.2024.06.23.12.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 12:34:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150-mtp: drop incorrect amd,imageon
Date: Sun, 23 Jun 2024 21:34:20 +0200
Message-ID: <20240623193420.333735-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
References: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
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

The SM8150 MTP board does not have magically different GPU than the
SM8150, so it cannot use amd,imageon compatible, also pointed by
dtbs_check:

  sm8150-mtp.dtb: gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
    ['qcom,adreno-640.1', 'qcom,adreno', 'amd,imageon'] is too long
    'qcom,adreno-640.1' does not match '^qcom,adreno-[0-9a-f]{8}$'
    'qcom,adreno-640.1' does not match '^amd,imageon-200\\.[0-1]$'
    'amd,imageon' was expected

The incorrect amd,imageon compatible was added in commit f30ac26def18
("arm64: dts: qcom: add sm8150 GPU nodes") to the SM8150 and later moved
to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts: qcom:
sm8150: Don't start Adreno in headless mode") with an intention to allow
headless mode.  This should be solved via proper driver quirks, not fake
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This change depends on previous driver support, unless we do not care
because MTP is a development platform, not a product.
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 286350ac7751..256a1ba94945 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -355,11 +355,6 @@ &gmu {
 };
 
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
 	status = "okay";
 };
 
-- 
2.43.0

