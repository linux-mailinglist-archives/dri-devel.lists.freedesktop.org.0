Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528A9F8BF0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BAD10EEC7;
	Fri, 20 Dec 2024 05:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ghHsurDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA6D10EEBC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:44:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so1585914e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734673450; x=1735278250; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
 b=ghHsurDD9hNIhrBg1YPx2VInZbYsi8HfNi72TwnPYSumiv2CsaDhx3DBpfdeOm99h9
 bFVdxPkHCPFtYhMA2h9S+eOzJrxwSi9ZPzcx87OUOzsbF0P78uahZwlH3BCWZmBwyMn7
 S73V76Jah5UznC3Lqzk1YaOhPnwfnCtnlIDr167bxg1I1UlMFAldtqZvUlSfloL+QOxA
 D6jBlnqlxDXOk+2Ce/Pzz4O2Z7HSrJyQWtLlG7UUIfEASzCNOuV9UIb0UTXgnNCpf2hY
 26tmyNxc7DB7yE+tey1hGYNTSfViSZwzV4+Ucm0OQZ4ZVlc/y9g6x6nmuboUnanCtGfT
 3rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734673450; x=1735278250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
 b=p7p74wAq5gxElIkh4Y6iF5qW0VlmMNuXWwxGE5/VjqUIoRQR7/ju7XZuPsn8PNiXTH
 qnmnFtBiQYr0padL4nPWcI1DQQveEnhOoh/yO2QRX0qNN2uPk1znLno7hRUNI1efgKNu
 gQnfdnPHbJEOeTH/9zmkvyrQ/9xWqKBwzP1yQSp3GY+aCMoiPphBsto1QueiZvIc4UPu
 HlugicZU9aS80lq4+xSOUg79Y/pk55u+F7FmcFEAeV5GjDbW1nIc9z4eWRR73Ttj87L/
 WBDozBtAtqVuyGDJJKZbqOvkaM6WBl+kjoTfefIrPeU3Wn+oGB0R7viPxDv71G+WK/mJ
 5oMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc75cyHl2K5hIRC3HB1wBAvehDRSSC7O1DQPOmetCpiVFoLrOrfFYHVsmqeMsW82RBetXQ2IWPxYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjmnzvaUumn8gLA1Aw0QYA3sYBL/+HduIPIPbNIu8ov+D9giAM
 Q4Qyw23JAKq9uBFg6cIi6y9xLLljUKNZ7MCp58W8SwxcaOiWZOwErjYtcrT8vx4=
X-Gm-Gg: ASbGncuJ8loaVveD4hKprkgb9qKAPQzmwffDJV+jnb50Vg8z8w2IsZGgH0CEfOoDxf2
 MRemnmYRUnPWt7wcNBF0b4S4w/cf6gt84rDTFVNZI9YFYB1kB94DEv4vV9VDFQpxEQu0XSEddlM
 75HY/NJh+vHu2HQmAA20gzuIg4LRYl9UITo3VoXrwvx+irGPXvMD6ljz57xN9cWDYf1o/FClFun
 qrwMH7RrofqsG8RejNgfyxwzVXl8iLhiGqSKYAr0jGRAGXM73sLtdcWhwfr2qqEE2ppeP0cYesU
 WH8iqFAekzMnfeWymcAS46R9KAKJBYauQz+t
X-Google-Smtp-Source: AGHT+IG1bm19MGRUcfrW96Z6d6TtKC4b/8GqwGpE6HtAltw9S1z+lUZCzMntZDup7UjIvLEdtD1Wjw==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id
 2adb3069b0e04-542295989femr303192e87.52.1734673450312; 
 Thu, 19 Dec 2024 21:44:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238215f2sm377633e87.199.2024.12.19.21.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:44:09 -0800 (PST)
Date: Fri, 20 Dec 2024 07:44:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Message-ID: <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
> We cannot support both CWB and CDM simultaneously as this would require
> 2 CDM blocks and currently our hardware only supports 1 CDM block at
> most.

Why would CWB require a second CDM block? I think that YUV output over
DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
work. Am I wrong?

> 
> Thus return an error if both CWB and CDM are enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9bb920d28bae2706b3892c167fe2bec3fd8857f4..a6372eee916e8aba702bbefc3615d8882ddcaad9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1261,6 +1261,10 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>  		return 0;
>  
>  	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
> +
> +	if (topology.cwb_enabled && topology.needs_cdm)
> +		return -EINVAL;
> +
>  	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>  			     crtc, &topology);
>  	if (ret)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
