Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B50916E9F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80D10E6E2;
	Tue, 25 Jun 2024 16:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pCAfQrlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4E10E6E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:57:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ce6c8db7bso2956086e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719334671; x=1719939471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyVXj4bWgaYvRknSa5lJyMkjZU/JIisl8Ay4LG2mAhw=;
 b=pCAfQrlozxeI2p+t7KAB7tf3eqmE6fBz1h/TNwcPny3jw8mxlZCEKZSNcnytUz7k84
 fdnhBOAV5wujAbnMmJB40jMWlDXXK+UrztCksz6RmQQZhGb+D1HeRzduuzYPtYB8EFJQ
 BrDMxlKx9wg/8VewuHhCfcPi5LLze8Nkcdz3cjheYRookaoUnLKG2Ab0ffthrUNPUSxE
 9RjcJqUPKNOpB5j/sR00jh+13FprLxEdty7Yem3xRXJG2IKLEaONXWrl+hogZOJAyVdv
 nv6EntnQESxIn35QYMd0bVGtCooqkUuriiuaCoxtJU30jA4PYhdvCxdk95jeOAYYwrkf
 k8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719334671; x=1719939471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JyVXj4bWgaYvRknSa5lJyMkjZU/JIisl8Ay4LG2mAhw=;
 b=XwcpYXGJ1454em3Ni4EXSfGQuxhKBORAAWx+3yPgrg56SsGyeyg1CB/ML5PhrBK2mf
 /7NoG44Rpmt0KhLo8GNF4Wg6aPBqtlaM/jayV4IBmaWt7knBr0QPiYy91HPOvG2uCaYg
 nlCwSwdVlWswudYTv3NH/14ZXkguOuDAyWWIqTJB6UCoxLjAr8XmGmnau/iPXujPdBmG
 /Z2b8dnGESo5qi6h4VaedS3Qk1PQSABY2uoaH7khco+olWXoWkSoreFBQfmWtEVRk+rR
 VDRn9zMk0E8nj8gH4bNfOc21iX36/ZOgyJf5Ein23syCEv1hQ5IdqbuPzIvvoXpIosW5
 cyMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW50HRGoZDORlsQ16P4WAuD0XSbJVjzAOHUoMG7gd1P5A/9BvuApTQ/BKm/7Ru2T7gqgl1gRgbk0Kadn4TJUaVBekRvDxHREiWRhl46yrbU
X-Gm-Message-State: AOJu0YxYijVRW2dgp144b9FBWTbEVOL0MwW7+rEESg/9HRcWiLKxEqTo
 C7S184nzOeBbE1WovZ6K9V5dwznQsp6lSE+CpxOmTvF/GFkiKw+Eu1/WeJq3jFU=
X-Google-Smtp-Source: AGHT+IGTV29hsOIqeDCHH2orasV8fV1XlLYvRt5g7BFjuE7tm9jJmD/m1TAz3dbQze32DSkd4dHSKg==
X-Received: by 2002:a05:6512:158f:b0:52c:d9a3:58af with SMTP id
 2adb3069b0e04-52ce185cf66mr5892393e87.49.1719334671344; 
 Tue, 25 Jun 2024 09:57:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cf1918e14sm215392e87.235.2024.06.25.09.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:57:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Date: Tue, 25 Jun 2024 19:57:50 +0300
Message-Id: <171933466183.1441256.5006913345206572060.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Sun, 23 Jun 2024 22:02:59 +0200, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Add tags
> 2. New patches #3 and #4
> 3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
>    reg/reg-names per variant", because I need to investigate more.
> 
> v1: dt-bindings: display/msm/gpu: constrain reg/reg-names per variant
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm/gpu: constrain clocks in top-level
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d6c7c411be78
[2/4] dt-bindings: display/msm/gpu: define reg-names in top-level
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c808ece19640
[3/4] dt-bindings: display/msm/gpu: simplify compatible regex
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6d69f8d37c85
[4/4] dt-bindings: display/msm/gpu: fix the schema being not applied
      https://gitlab.freedesktop.org/lumag/msm/-/commit/399af57ccca2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
