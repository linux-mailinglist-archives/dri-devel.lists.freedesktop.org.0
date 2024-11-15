Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C179CE120
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FDB10E860;
	Fri, 15 Nov 2024 14:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qn3zAUgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F09610E860
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:20:24 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539f84907caso2012275e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 06:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731680422; x=1732285222; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
 b=qn3zAUgkNaxQVDXvMG13T98VDBWQhEGZGtmYLSarRSX3eJTVwa2ngwPsabohKdP1AY
 YSEYpMSSpJGXvzjWaHqHWWBvhEcQoqvcZeYGyZTJJRDP62+IVlLRJVKzr3FmEWQOUiSY
 xDo4/iSgaEKNxv8uB1AD8Jl4Dan1Otcb1OrcACUPvxCC47XOgCwyxtOC2ZMJ7rQJCut/
 V8qsVcTM9kaUOZZh3i+nYM+fSSsBwSZWNyF98ZO2VUeYH+FLCdzeInzVkSQABdO7LRHU
 cix9DDr7RxlK3byqZdRWuFt3W2cVY/m/iOIcyafzNIjwD3KWcITVcJGFqPuvHS2YDZ5G
 Q0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731680422; x=1732285222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
 b=tOdUi5KegQRU9uWSkBRXecDmaZ79bVY3z+9wsJeZFxOy5p/VkouBfR1ubw7zbNReEt
 S92QvFdpsEJgLFnwDvCgDA3Kyfje/6tp+E9kUIPjCB/CPHfqFQ40Gw0uzlwpVbFXBi8M
 BUWFPDdbJ7Ep67H7dYTxCKQlC9hrJMpeTe2Gq283qlXTYZh+Mf2OsdTC7jt3UEp3m1tk
 9bozQUZJqL/7A+asxCauIaCPJWjM22ZQH0HaaiLd284+Pmy+KzkyX5SMutuF/W9LQ23a
 ZpWKHNwNSjci/ZcN5H6xe7Cy6PYx9l3dOKKzbvNEshSNyk15KdH7BZHU/oGjalftTQLn
 h1qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbOvRiQTk5iDqbtAQbrNdop0XvccwvtoMz0H97IUT7AdT0XQz6St9/pEbTkoTpKexe9jqnac5nAKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwumeyg6BJONp5ORSUDFHwJbjUBkF6t87MstAY196Xs0waybul
 5uKPJZx/MIxb9nFj+gvjmJPhfE8t/kp+zvfF3eqjR79WRRTD0oT8mQejybeBKCI=
X-Google-Smtp-Source: AGHT+IEBU8A15vScg0ia4WplSofYKJIuXC0KSALSXA7EzvPsyMeCtNrpJisnibjIPA6EZmUQQ6oJwQ==
X-Received: by 2002:a05:6512:3a88:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-53dab2ab63fmr1545621e87.32.1731680422383; 
 Fri, 15 Nov 2024 06:20:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da6549034sm584101e87.272.2024.11.15.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:20:21 -0800 (PST)
Date: Fri, 15 Nov 2024 16:20:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
Message-ID: <7qx65y6o4fvnnnspof2exzk7xru4bgpda43655deeu7hw6wowt@zcnpzyw2xutm>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
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

On Fri, Nov 15, 2024 at 01:55:13PM +0100, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>   [dpu error]enc37 frame done timeout
>   *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>   *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

This matches other DPU hardware, so

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
