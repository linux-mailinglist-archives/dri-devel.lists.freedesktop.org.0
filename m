Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F49A67E3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53B10E4B0;
	Mon, 21 Oct 2024 12:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQSeDfJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F34910E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso41602531fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513072; x=1730117872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
 b=dQSeDfJUIbXA950Yb4Nv3B2Pkm1ooXY2AFzBuXdxoDD84D8+KyYYtHAuBqjsyvK8/q
 GSvtnobEzujSEMpdoyUyLogOfkTlq0ulSGiBWbkQdxXo43Gw4jAAEPYRLZOhitwfcGgu
 Hw++Kg3vWfo2hBcb8PjEFv4HwJ5xXXvOsgszUX6PfAEG3/AZnV8M1dD/mf/XTTBaYFZZ
 ei46rx8XzkX7OqpyQ+mQURrL0CQZcI1ol0pmYQCUU90nrBReKlWBQ6jQsndxMAynd5uc
 oU3h1vtRK9BCm4RIQclI50ki1QmV7aV1wfCgwyRA4uQVdLwzNtSg4S9mmgdnpqXGfa/x
 6AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513072; x=1730117872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
 b=IQAumQ0fdaaFygcP9PND2zc/QP+oZXzAsRfDNG+W4+6ENAjD0geRjDx+YocEbPRkkK
 mwxW/zxYGBiDkgh++I6YamVm4I0tFl2KdIWBKX3/OuGYIU7m2DDVAuglZOnTmx/fBY4n
 K01MDKX1YnlXJrZcN6F/2HRV/FJ6wII1u/bp9qK0pwKSsqn6kpdIdcF54qzQxfcIp4sX
 R/QhWz980Rb7YCyAxzi72F2tNZOcqq9sxrNahXdcDRo+6TbuNU2dBa81vWUyeNE+LF/y
 dWHE4NPXsM6MQ2dPvMIH4LS61T6oay+P2yu2YFu4bb+gaW77DGTalaVmrCjlaszznpQb
 o0PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv51VWl4c6w+bdUGWidknnUtlp9vKxPLac4p2AbyXbvCM1FBoD/2o68Oz++xQFZ1IAsN/UX/1A64U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu6PyKHJel93tG6MYzLUSWMIlHIRjOjfjnUGpBqRhScHzRECi4
 jA4FsNZGTAW7vlvdbENNPZ5LW6/nghYoH3Y026OEDuSdudSHvey2X2s3/6wjW8E=
X-Google-Smtp-Source: AGHT+IGHZwUBrGOlbOuGK6qQAG7Djezp3PB2cObNy0RjKNlSnT2HrV0co8D0CLg5sUkYjuoFUJOwNg==
X-Received: by 2002:a05:6512:3096:b0:539:f7de:df84 with SMTP id
 2adb3069b0e04-53a154412e2mr5181215e87.10.1729513072223; 
 Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Mon, 21 Oct 2024 15:17:41 +0300
Message-Id: <172950935859.2053501.16314780424128815600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
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


On Sat, 19 Oct 2024 21:14:52 +0530, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
> 

Applied, thanks!

[1/5] dt-bindings: display/msm: Document MDSS on SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/409685915f00
[2/5] dt-bindings: display/msm: Document the DPU for SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/546f8d6c3ed1
[3/5] drm/msm: mdss: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d1cd4c3faec
[4/5] drm/msm/dpu: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b139c80d181c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
