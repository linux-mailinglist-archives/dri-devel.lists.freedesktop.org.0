Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA372144A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B17F10E1C9;
	Sun,  4 Jun 2023 03:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179710E0E8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:48 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f6067a9029so4379745e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847706; x=1688439706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwdXG6TznS6YsdZeNc+jVXR47t5rcv+aXMQckTFPgWg=;
 b=hUItQ2HUrJfQHD/w1Vh+fWuxshHXW3x8Em4GmH5Hj/N8KfT63vPtQjI8tf9O6P9UcE
 /6UpGrnL4fwsv1NPwcwcuXObDAsdQLktfqm8MIrw0RKDaO3nzKUvjP2HCdk6zUn3ImU9
 oRzqhmL0fTjlpJViDr2L+yRsvw9J54t3OAsc/+8F0auPwjB9uyM0VtZ6osBhN3iwTg8+
 EK9a7pHNVT2B4bbgJBakF5T+0KQsMI1weiKD9y+Ti8gzmub4CnWviO134DpgycJWlR4t
 z8xC++6Af1HU1FgeAgwZHfDmqKAmg69OlbvdeD0d9gR6WIvx/19TWYKaBOgkivbEQJQe
 P6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847706; x=1688439706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwdXG6TznS6YsdZeNc+jVXR47t5rcv+aXMQckTFPgWg=;
 b=QUhVK1Pxiz0F6LN7DGGL5ItqNYvvaYFb2Wm3YZTAh0Ulz6eMYQjfhQEDIWd+8Wi3Br
 s+XS6KcFFtBEj/AFJvYr16QxYJxAB7zr6rZSqIMCIKaMUkus6j+EVIOVia7xYVG+Yek3
 Q9BlhX4qlXJc2w3jRP5GSFhnPd4gkF6JnCSx4ik3mZDpRxo0ug0YSp4P5K+uijsFzfCM
 GgKh+WwcWTfZH837u3M+uAur4Zxm1RR58bpAwxNX6g/v1SRRnsddqNyJKkDPbj60VbKX
 +ImAd3uwWo0ZJ6F8gFqoaioSK0sQsTM39TLTBjTrTFzmQ+JF9iIY6tob3t75yMHCS0C6
 pcNA==
X-Gm-Message-State: AC+VfDyqDXkhuPm1hSNDOwjFohsY83ht8nFG7Y+XRD5mLP+xoeu42zin
 Cn0K343xhB6lNkTjO0rm0JsK+A==
X-Google-Smtp-Source: ACHHUZ4eJeV67ZtXqpRqs9jL9lgSaKyZUHm7qTxGW709QMtSD6UlDTJblh8Y+ZXxAsDs0+MaxbcAIw==
X-Received: by 2002:a19:ee13:0:b0:4ed:b329:5d85 with SMTP id
 g19-20020a19ee13000000b004edb3295d85mr3405592lfb.15.1685847706163; 
 Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date: Sun,  4 Jun 2023 06:01:34 +0300
Message-Id: <168584750425.890410.17653839132037298856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 01 Jun 2023 12:09:46 +0200, Neil Armstrong wrote:
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure.
> 
> DT changes tying the DP controller to the USB-C port on the QRD
> board will be sent later.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: dp-controller: document SM8550 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/76015b9e573e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
