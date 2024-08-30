Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0987966724
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 18:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBCF10E7A5;
	Fri, 30 Aug 2024 16:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QU1pwEMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58CA10E786
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 16:42:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so2171648e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725036176; x=1725640976; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Ti26gzK1EQz5HySKD6b54SohAjKM16M+gJtA+MrRBY=;
 b=QU1pwEMid9xL2x5+dpY6rSIZpqkczUb4WKsCrbGh5Bb37biqVgTcPwNbidN+wz+2S2
 QGlD5t5o9AFShqtjEc9vyKXQ3VG1W+OP2AyAQ+M/hIF59XgarnffbeFXvWO/+NMn7cRf
 i2vDWXkKc14OZJR6Gssia+d1c8HoAXJe2BGYR5aL4HiOEKdTQurnnyXhW10/2e+wc02/
 e6hnjW+6aeXal825OwXWZMEnVjtRaBRk/lKq2HjVWYlqf3Dq3oWNVUTb0nZspBIOv5Uu
 1aoZP9vEKJoSbWzLAZo3UKIrnwt8SQeIzlupIUslN0JiLKW2iQqZ4OWeOzod6Fu4QLJS
 FARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725036176; x=1725640976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ti26gzK1EQz5HySKD6b54SohAjKM16M+gJtA+MrRBY=;
 b=gLs89QMHevE/jTkzJyfdwT/MK/m4CL1jPi22WN5sm7rSJy61gLW0bt83rk/zQgo2/E
 e/qhxgtTkyE5ytJkAgUMXgkCZ+VhhDqGZIyYDg6CK5FZgjL6ubc2m/zrsWXwF1KuZ+u/
 apADauQnki6syrd7movZEvsmHlqt2a0uYqqzDDW0+bDpuZrViDJGHWjjvOly9fTwDV9s
 yRxfGK/O+KkNkC8fIXS9VtdcNM9DZDAIUO6Y0NxLAree6jviQgEBoQb4JWaRfJcFaPEO
 80uEwoF4ROAFTZt+5K18ciQnUkjKAeWzo2ZeoXQFirr8qqfZbgxloIZ1PKM+3A1w4zGB
 q1Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3VY1qsG2egWnYOg2tar9/b/SemF9ATGNWTDmcrHHSXkKKbXWvyYtp58ZdP0OMukLTRPZJdKj6t1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzCX7nmzExtTE07Blz+NHOJ08lI0YNiCFnWS6x4uBAropCPJ89
 Yx/7BtsGuhmIIBN/tLVhKX9bdCJ4PseJx0QX9iQajdgl7J8kSqVMaE5anFw/Llc=
X-Google-Smtp-Source: AGHT+IHPok1p6V+eHfwGcCeO0mQYbxw1nUP6jPzcZsijDd7LU+nuYlx/M/lyCnpp0vDdUCgJVIYcDg==
X-Received: by 2002:a05:6512:159a:b0:52c:e047:5c38 with SMTP id
 2adb3069b0e04-53546b0401cmr2164051e87.15.1725036175176; 
 Fri, 30 Aug 2024 09:42:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084dfc3sm680610e87.269.2024.08.30.09.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:42:54 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:42:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 05/21] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <fiydda6an5a4dc2gmrj4fnti4ymkk7ntbtpq6mgushmgnzl6cp@pwtz6goteljh>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-5-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-5-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:26PM GMT, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state and
> dropped clearing num_mixers in crtc_disable]

Hmm, I still see the chunk in dpu_crtc_disable(). I think the chunk is
correct so that if there is a disable/enable pair of calls with no
intermediate mode_set then num_mixers carry over the correct value.

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  89 +++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>  3 files changed, 183 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4c1be2f0555f..3296b0650056 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>  
>  	dpu_core_perf_crtc_update(crtc, 0);
>  
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -	cstate->num_mixers = 0;
> -
>  	/* disable clk & bw control until clk & bw properties are set */
>  	cstate->bw_control = false;
>  	cstate->bw_split_vote = false;

-- 
With best wishes
Dmitry
