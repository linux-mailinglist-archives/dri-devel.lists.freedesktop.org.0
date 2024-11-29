Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD49DE81C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A106B10E33F;
	Fri, 29 Nov 2024 13:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NYcvBpp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A31710E340
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:54:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so2113050a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888451; x=1733493251; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
 b=NYcvBpp/RLuAA+VmzoCNj92QGrk69NTzc20G83p7vKzho/ohM6ijqN5evijktPM5A7
 e79AxpJcHajTH2Ze7N7+joZQprLAQDSpFOQqm0MOjliKANTNV6BgkVF2qhwqoQu/qeYJ
 p9C6PTsGe7xvXN0NNLKYYob2BnfX9+f9Lo1pRsG+cBw1aRBZqDaN9JDxRNi/Vzn73tnw
 lblRiDJszBKTa4l70A3E3B3btlPnVWwCytbY1Mxz4u+lACqCM4YFzNR/Q/s7Y3jhJXyO
 2xNNTZeAXy29rgI2Cw8EndQZC0BGlwoajiAqPCAvqS7GEi7IurdKCx9Ukwk4fJCaF1bQ
 LzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888451; x=1733493251;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
 b=B7LJWmAZo+zHYSmops/ohuB+lxsH7cfninAnmms/xSvcnK1eO9/sVtbmdAZKgHDSTs
 KPI/UPqwWWHmP5mvbQPFSGtj4QB5SaLzqFp4s4O5Ec7nbwS6dp4goUlOjcRZD5dQnStv
 30t+ruXTQJdamicODQXJgNHIdhbZnWpZtYRbgl/yjibif0tWTPhj3HYxtMU+b3zV6e+P
 OxAP6AhhyS1uHPQnCaHDOzkTgAnDzQiVB4j8F6kZRLX1pd3sjfoYtaL+qJjFuMSUgE+X
 tkuySBuxQQ7A81f91PlnPKmUWo49ABrOCtMqLz2c5jSVmY5Kf3Kceo0j0Jp8KtdLGs/A
 qSmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjpqHwBGAJU3MHK5wMwQy5M1pOGrWTR4vlwIw/H8lORW7yQ5XmZy05tQQuy+rRvMSlewy1ktVHPhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8THSYCIpB3FQ2Oid4nCs2XRsiR09z0nosf4C7giYcX88vYd40
 IrNObiKursPiAfLKiP7Yqu+O0Kion6fAxjoJVtGuD36H437nM/sJiUrfyFQEK+TH4orT54W/B39
 BUjQuoR9RrEop4f8y6hV7Gpamw5a5+4GP0J87Fw==
X-Gm-Gg: ASbGncs6AcRssWE/crckow697rJHhZfe/4NGX3Lv3un3of70sDOqSsd+Xkm28OBKm9k
 co0LW2XDmTDHE3l3wVjN9C4r4od3kppg=
X-Google-Smtp-Source: AGHT+IGaA6t4/2a/mNA1h9b1zR06PmCO6tMyJ5TuOWa0jZCc/O10Qzu+rMnQb6Tj6pv0TWbP4VGQEBjG3I0WDrceI+I=
X-Received: by 2002:aa7:d68d:0:b0:5d0:8676:3ed9 with SMTP id
 4fb4d7f45d1cf-5d08676410cmr7819763a12.8.1732888451493; Fri, 29 Nov 2024
 05:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:54:04 +0200
Message-ID: <CAA8EJpqDJm6xh2oCkED4FF+1j8qt=u7B=7XADtR9JOkZZxsDkg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/msm/dp: Add DisplayPort support for QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
> same base offset as sc7180. add support for this in DP driver.
>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
