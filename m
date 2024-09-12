Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233249763B2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD710E965;
	Thu, 12 Sep 2024 07:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xme/e0+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6CA10E965
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:57:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so671702e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127877; x=1726732677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
 b=Xme/e0+V+8aGB/Rx99T1dGZ9VPxGiaU1XfQAPvLs/0k0VfB2QJS92X6Ajncxf10/Jx
 tUCcT+S4+WPOlRTRS0X/WvC46MfWeDShy6w/Omr0yQKORZbW6yn1P5EDZsFvKPl97Syp
 KAAWgHdl1odCwaUwj4YDomfWd2Y882LsvBKTjCFO6DdbnPBNzuvjDhqDQSjLRfnIbPPY
 tp5KnZq/gw/RgfIL3ES4AA6PEP4baPRszF9m/Qingn14USq6wzLp5eqiXoSgq3biSidT
 T7E/HVPRUGHp3z1aYHTrZbGAEVJO+ye9qoMmcQ1nDGgwez/SqV32jZGtJ9o3u9VdQFAA
 FkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127877; x=1726732677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
 b=QztOHaFRR65guwB4wivF8KfHzZDgRLeBm/PsM3vAIrTB9M18natyRurBiMxUNpMW5M
 NMIeEQ7AHJAn5lKXHGX1y56YoxSJtQOdVbcHX1lQXmWadgeujGvcTRfmOdaEyZAbzxxO
 uF9tZojdB+saZvH4B7N9Cg+xmp1fG8y261QZ1c5nWKsTA7Y3fQ/vsXO1+9qhNUVZwfUa
 jp4TzlI+qko85H0Q6VpIU8DlsN0DnxuStkBH2f739xw8IJEBM37fMo7sgomOKsV1aPWB
 XOLGlDB5WBKxC7aWAdJuHjhKWplJtTw699X6yJdRY9wMu0liksJOOtgGzLXuCDPmxNTM
 jGxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQsHfWKgrRpfxTxWFu8fKQ8TlesvcGzyPCv3GtXxbUeVq9EpAkycKDdRXHhu4SQbZv2l8bRY2GGRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbJ329MJ11b1ZQVrzOBF+reTpiTFxBYQwXpDIQaCqn5Ow1cUZQ
 0gm8CtqoMz88WIKle6MPwIda7pJdiaKEQivkfrbkw371ps0p7qADBiw5Rpn9CdM=
X-Google-Smtp-Source: AGHT+IEMx5McwfR5w48GvyKDso1IkapKp/bxkvo0CGrrFUuAGOcvr7DDSK6O5G6wN5uQdo3VlohPbw==
X-Received: by 2002:a05:6512:39c7:b0:536:545c:bbf6 with SMTP id
 2adb3069b0e04-53678fb1dc9mr956157e87.1.1726127876818; 
 Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903ca4sm1825185e87.192.2024.09.12.00.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:57:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <5uttdpchtd7wjzppve3e3hby2s4adft2tv7ceshyuarir3ppiq@u2fcdqs4uqr2>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-4-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-4-quic_mahap@quicinc.com>
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

On Thu, Sep 12, 2024 at 12:44:35PM GMT, Mahadevan wrote:
> Add support for MDSS on SA8775P.

Patch subject doesn't follow existing practice.

> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index faa88fd6eb4d..272207573dbb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -684,6 +684,15 @@ static const struct msm_mdss_data sm8350_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sa8775p_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 4,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,

Missing .reg_bus_bw

> +};
> +
>  static const struct msm_mdss_data sm8550_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> @@ -725,6 +734,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>  	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
>  	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> +	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>  	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>  	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
