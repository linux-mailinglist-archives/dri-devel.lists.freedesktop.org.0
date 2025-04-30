Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74FAA4CEB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8C610E79B;
	Wed, 30 Apr 2025 13:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dbHdC7xU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FC010E011
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:11:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43f106a3591so8109815e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018692; x=1746623492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dCzPkxxbMsEZi4gmxHLeQbawBsdYMbjxEQFely+C8W4=;
 b=dbHdC7xUjkdSTQbd4/x1LDTrQHTw3tqe5wBsQe+Y/E4q4bmx+lH3KVHWcBcUBFmS5D
 bCjyltbexid7VPSueSqCPaHqniUNojVC20huafjcFJ15MNkonQ/AxSu9yEjo93G8w6k9
 MDKbG3s8fMIfcoJIueF7/gU3Gur7UmM5u7dRFSVRPIZFFCfUNKVcrcGLbrBpHN/6itbQ
 KWRAEhOawf9p6DqphEHSlp+Wu005b6+8h+zmQmxkQJr4L87Cc+lNJThCEZlBMso9AgMl
 3e55CoBvUVPnIQ3q/eu4mtLjfOz/lRPhMOOZ52ZHRxd11Drmig1KimKZqsFh0qc74NVa
 0IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018692; x=1746623492;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dCzPkxxbMsEZi4gmxHLeQbawBsdYMbjxEQFely+C8W4=;
 b=qBC6SvnmeK0P1nutEMTPUYzLXKk6Zbmg918a8baJpA+WozQh8VCI2qfi1fuSEHulvK
 sp6TQm/AXW5XaKGBnEU7FC/XMyRbvKfB9mpIz7dGHpkhISzejnVmA37/CU4OrRjwVNbQ
 ktQ+mrqhCBX+9E6LLF3aB2f1r5QUwmfmQHiuKtCZznJsntvzVvugSplR0sxsXjNe8zQK
 9ZVlpH0+c1YxaRvhm1ut04e5ATmseOv+HrSp7Q3kFw5lUQTg5x/SCV5dnG1RFgyJIniX
 WxKKMvAPphytStDai+qGCP0oGXR/3b9Nv92iIUyaGNrrfe87+H5MsdgLnhX4fEaoSHSg
 Bw8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOKdPQEbAHqgurPKem0vGNLIz6g+FzgGlAachVARH9RI8SyYzHB1esO4dmUNmELIgDQxGsBEvFa9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/LJGpdMUfXntvKsKgIPXZDAtDImVkL94rJrAG7FIy8W1lzMKY
 gDksCb/yD1ZM9B7OfX39oxYcMC0sNnsj/rGnId+rWFtV8nUuc35jv2/Ey1XZFSU=
X-Gm-Gg: ASbGncuEhDfG9beaKJxkfcvbwzyOJ7tx7Ea/JpkOZ1xwL26qehu+qu+b7whh7tr96Us
 iQOSpO7pGujCMrDCL3wQflDZfj/URDeGb7OtNFDGiPbeOFvFklcAbmzz2G705EMXK912JkPvnXx
 8nlWlt9evlnx4pwbCi2wvXUeoaGaO3t3/4pUPeS9dSYjME1hU4/BmlKM3tL0bspRn/d2TTINqYI
 jl9BBS04AzvmMejfa+xP2KB1ZxYLGo5wiGsqYrRQr5KU0Fd7lHTEVTSpY35snVFaPkD6MZ0p5d4
 EFX97XrXnSFnSSqh+nw/e/qB607QdeAsr+N1xfckNjGRK0EVj/M7IKz70CE=
X-Google-Smtp-Source: AGHT+IFeJjyPF7UsvMCvY/E4zkImQ+r2GCvPnZaHFrfG4ufXz7hO2J0dOlapl0Ez63IyCYU7IZAfQQ==
X-Received: by 2002:a05:600c:5488:b0:439:9c0e:36e6 with SMTP id
 5b1f17b1804b1-441b2c93eabmr7783915e9.3.1746018692002; 
 Wed, 30 Apr 2025 06:11:32 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2ad7931sm24947395e9.1.2025.04.30.06.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 06:11:31 -0700 (PDT)
Message-ID: <da229728-300c-417f-bb21-426cfa6d2cd0@linaro.org>
Date: Wed, 30 Apr 2025 15:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/24] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 linux-clk@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-16-8cab30c3e4df@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250430-b4-sm8750-display-v5-16-8cab30c3e4df@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 30/04/2025 15:00, Krzysztof Kozlowski wrote:
>  
> @@ -361,21 +373,46 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>  
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
> -	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	unsigned long flags;
> +	u32 data;
> +
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	--pll->pll_enable_cnt;
> +	if (pll->pll_enable_cnt < 0) {

I removed too much from debugging - this should be WARN_ON or dev_err


> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		return;
> +	} else if (pll->pll_enable_cnt > 0) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		return;
> +	} /* else: == 0 */


Best regards,
Krzysztof
