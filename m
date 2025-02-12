Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D996A323E4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8096C10E84C;
	Wed, 12 Feb 2025 10:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZVKY3Abz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A438710E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:51:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54505c79649so3624204e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739357473; x=1739962273; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
 b=ZVKY3Abz0R9AdXnoQQTwU1lB/JuB+X7GeFH8FmTYT84qu89yaxspO87LWBM8edkrk/
 q1GVklLG8gwSpjum2YTQmDvcCbAsvVmLOD2a26kqpdh6zf0HInxBHwbUbpT0VNZ0Mi0H
 Wizr0cwcwNuu4RpQvfiWoSNBhOmQQxOiRc9Wg3ZLC5/SuldPYNdFjHQn4lDkXu+ieq4h
 4xpPmZVWipkG9KGDL0UHv6BX33i54gWxEmFnNfgAl7jaU7XiTZeVxLiNGx9Y0k55oapH
 6V2tf8d+yW7qrUdJzwOYfoyoc+TP55N6g9/+qLmGUHwwGZAjhcON/Ovu9VHWbiY8cyG8
 Ss+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357473; x=1739962273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
 b=ZJLcy8X++qnqcBNLN3EDCHKWVoI3hukCp/UIRq7JA0abb7p2C8SsSUIvM17UNYUfn2
 mBZorbKH1THzBgS8DDqMzHNASCmmLc1ls9386K8MFaCVD1w0IsC9bp95mM2wtyTxIPeH
 XtD4unhSj0N/uRWUtxFnNHD7UyqoIg+UXR+SAqOUiWnK/bMArZJONBChljOPbpuTGy5B
 wSClWH3Lg1uiif18+YvGHdsuWSqdY7K6iPUWBmwdvxlE8EPspScMoeQpFgsIPQW7mTF9
 0MPLv0gcm89K8cCfW4BO93t92MbZPNYHoQGKFFUAHB2iH3TMIKR44Cdw4t+QOheaRzaz
 2QKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCsij/0WADq6XTvyicRqxzpeIMrd3eoAteyHCcvK8JkIC0Zw1QIN6HvMZhDE072gQgxoSwxH97Qo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1CagN/TwE5zSLFyN6FhjhLB/yDvvkTyDs+EX92JLWxUCWlliL
 71QUIY6RcwvrjyWw0gMaFILZ1TXDiQbbGNYVasBreK2xFnbM/5ZP3FjyXGSZu3s=
X-Gm-Gg: ASbGncvaRhzYUpZ64OJFq99PqRx6cGt1ZYxqlKsIHmkdUDVkz0tcS0bix1FZPHH+HNf
 ZdsmvZvh22jAo+E/2z6hdqivT+Z6AXodjtBNIDZ4nTzD+KRZ4pRNOf8pdp4PjOqihi8YD3ZN0C3
 1MSXJvmw8B5IQYHmDAUssZoObXqpTSDQ6Flpf23EnTrSK5qV3lNaOadbr+4RuHS/fqLEoL6WF1H
 hO5XDfV3QIhSZjsCE72og9xiqtUFfsxahItnHQRuv2Yr/GEYp9rvZgUHY+MmGRcdVgIrdxOvWT4
 gMM9fv0vyvHQI4gseJufkbqh2EKHkvt8lrfFZjryf9ajQaVmlk5xlEdsPr8qrX+boehZZjk=
X-Google-Smtp-Source: AGHT+IEDzcPRrcce5UnawSDEarFr9+DzePDbU8ly6wk16sOl8kdhRUbYe8aGObQlOg8I3bS4B63NyQ==
X-Received: by 2002:a05:6512:3155:b0:545:10e1:b1c9 with SMTP id
 2adb3069b0e04-545180ef774mr625448e87.20.1739357472850; 
 Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545166da063sm353803e87.77.2025.02.12.02.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Date: Wed, 12 Feb 2025 12:51:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <iwr7hcavp43u2yoif5fefd7y3q3rlfx73gxdyfotfuz5s2jalo@kzyt4kotpawh>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
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

On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
> This series of patches introduces how to enable MST functionality on
> the qcs8300 platform.

> The qcs8300 platform uses dpu_8_4 hardware, which
> is the same as the sa8775p, but it only has one DPU. So it only has one
> DP0 controller, supporting 4-stream MST.

This is irrelevant, unless you want to point out something else.

> This patch only enables 
> 2-stream MST, using intf0 and intf3. The first and second patches are
> modifications to the correspond dt-bindings, third patch is the dp 
> controller driver after not reuse sm8650, fourth patch is the qcs8300
> dts modification which add the clk support for stream 1.

This is obvious. Really. Instead you must explain why QCS8300 isn't
compatible with SM8650. How many streams are supported by the SM8650?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> 

Please don't patches against series which were requested to be changed
singificantly. Don't spam mailing lists just to be able to 'FROMLIST'
them. Instead work with Abhinav to get this patchset integrated into his
next iteration of the series.

> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>       dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>       drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>       arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
> 
>  .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>  4 files changed, 25 insertions(+), 14 deletions(-)
> ---
> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
> change-id: 20250211-mst_qcs8300-4c18a5179165
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
