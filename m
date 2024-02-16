Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02A857AE9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3010EB04;
	Fri, 16 Feb 2024 11:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u3yIeUPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66310EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:03:56 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso14746695e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081434; x=1708686234; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M3p79qEtfp2ZjIJ+XTjXE+1hnr3OUwv786b7yeYiOaw=;
 b=u3yIeUPYAFEuTlSQmaOZ7fdih03mLZPz5WN3pcuWmcmaj1HkS2fhBXhsvFCeYe7ofu
 Hy6ubhvTm819eM3W+I5k+cQpEYmlCUOWtpV6gqe6w5nFDzOibO/eCGrTKrySJ6QuInOW
 6a5V3cPzhGikt3OZ+hSBgW6DfEeVPlRL1eUd0AWqoufKZ/wvPAFBzPfO8Nzg0RwvKzYh
 8aBPDfPOz/d2P5vJCqLS4ZeAfTd6zmxfcocb5t/uu+CbxznLoaxaNokGE9LUvPoygkCE
 3JmOnDJFhGbQ/qfDWDyLpq3CRbB7xdnZWA8VtEY6EHYaKcjucozGLdOUreoBF0lyHy1c
 FrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081434; x=1708686234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3p79qEtfp2ZjIJ+XTjXE+1hnr3OUwv786b7yeYiOaw=;
 b=Rb5UNi4rH/6NkilT6TD52fM+nwZFlJn38wT7M0EfwUqrtJsVGPrvHXh2LWhiRoll2M
 1NlkHUDm8qkgiaObj87xADggtAZYSqJbaUM1aUbzAPVcUDdCi3HrEl8Tnzw2ENJjrvGZ
 TbM9oAWRUitJspfuYEJtzrfYKCDSpep44RebyIJtN8ChkQUnWToixQmCUFhp3WKZUe/+
 GCL15VsGEjxG34f3eebNmAGgCAQbQZC/iWysd7kzpXVpj8eh31L8hNIi+8bzbmRkWk2/
 oCEEqoAGxUqAnj5mj8mCX8vV1YioUOeORIn/tkfqwLl6AR/ga1nKAiMAhBzG6hmIHNnY
 EZHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkrqIVOgpEwJvQ5d6DSa5ym5SZ5gB+c2gFenTfVSwCN5TLU+7Cy0UZPV0H/da2RrspvMU17mM5j9FjexQS0d1BJSXGko/4ifeWNJKziIxi
X-Gm-Message-State: AOJu0YxWibzSjD4P96MGmuTDVacafRzA2m3Ylq2LDMFE7u5AEx0fC/Iy
 q+o+6YuvDMD9N0LePliQZ3AgxMHUA50UB1m9as2nr3d3N9ReRCPqazmJ4+/8msA=
X-Google-Smtp-Source: AGHT+IGBdNL8KeMG/RG+D3xrVj+pgMbj754F04oy4yi1RpZ6V0RRLQa/LsZkNh4S2dCingJr9VMEQQ==
X-Received: by 2002:a05:600c:198f:b0:40f:ddc8:f804 with SMTP id
 t15-20020a05600c198f00b0040fddc8f804mr3001191wmq.17.1708081434548; 
 Fri, 16 Feb 2024 03:03:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:48 +0100
Subject: [PATCH v3 1/7] dt-bindings: display/msm/gmu: Document Adreno 750 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-1-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7rJgqOrASH1+9XrvkT4uAGIQBP7+drYr4P1tenEnLrU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EVKmuMnelD+jPOCbPUzTsHxLthOrLTOHgLjSTa
 xPs9FyKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFQAKCRB33NvayMhJ0UhfD/
 oDuWdTNYoa15dCO3oA5HvDkWIEClqPqQZHvjaUyI02QCzOQZbQS7T7thHZbOFed88h2oi6jIbXWzgV
 KxWH7h8S+J7gQL4u5XD9bhu5Vcgt4wqA+DABnmw2rxLW3UrwVUkiPnnG95WLAheF81uTwWkWjFfgLX
 y1XQ7DMFEmSUgEubL7Q3WAyicXwmHy26yaqP/Et0eGr7vrRSPwLJuPkXp4JNSZ5itASbwbEItH8PVu
 SncEDTCd8qFewiyGcpenZiCcy/1KNythe/3892+ASMfBHrU3bfAxkHGusUoG75tHoxkfnA+XpjIx4j
 YbIjYFCotP4yelFiFH0ll2Jy4japCWmcRYNg9bjZK7cRqXUjuIT1CPtZYllK4RC8JWY5Kg4PxPNFZP
 kTHo3d3pIPQs1EfRodWBPD3BOM0Vir6ynTmSchUKvskzoG4RUtPx2iu44CEvZ1LWVoe4tj44QQnNtA
 bs+omtQ3D3SkHCQ/04RN+kLEZtBIXrSzdNOV4eLdvPN6yzDvXq0GpNVUIVAJeTrueIS1tDhmghfzLi
 F9PuzzDWB+BSPKDkfkYCK6dWICYAjdb02YJuuC1zuN5gBd8r+dBhyuBMRgOBFd2YjERvpVuX9GU5Fd
 SD5S4DilqNQ8hWaCpNhf6b3skPzzzmSq5FTK+/cGKy8Tn2KWa4l+597zsTdQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the Adreno 750 GMU found on the SM8650 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4e1c25b42908..b3837368a260 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -224,6 +224,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
+              - qcom,adreno-gmu-750.1
     then:
       properties:
         reg:

-- 
2.34.1

