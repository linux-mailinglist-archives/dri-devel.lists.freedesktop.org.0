Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF18A8F52
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EC310F940;
	Wed, 17 Apr 2024 23:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F5ypeMcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21F11387D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:31:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d487659bso224241e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713396662; x=1714001462; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GoRisbGnaphvkOMl0BaR8O6Ht/Z9FTi+nAoLdKSqnlw=;
 b=F5ypeMcHtPT2keRBcquIp7uOJrqcCcm914BS15ydqpMUOPwbnV/h/gAFi7LIc8n/v+
 ybEAg5rroSIjN944FgFboSw0Q2pfGiYVujQpRG9OMemD3ht3oeTde57/2dAuluAgCNMu
 xFMwvXVAcdHV8XQqnweqqLt7V5nqlc/CLlaRBMSvdRmVDmYLT6Vx38pXptu43FTpgL8E
 UEcjeJGn+PF7mMP8x1hPmYbwND5aWh1QE5XIO8+WIRIRddRPSmHi3XPmHUutoXxSX0GH
 vHTsPB0H9Grv2e4CRvVJJXXOQPfNaooaulK1aOWgkfh0HzB3L7Mgi9NGA/wgCzP+n3/y
 688Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713396662; x=1714001462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GoRisbGnaphvkOMl0BaR8O6Ht/Z9FTi+nAoLdKSqnlw=;
 b=uby1zUtdOMJeSYdTqWHcHKpJxm3f0SoD4zylEQNLl7ZakgdnI5yf6ft71UhTpDUnin
 0mqjT2kVkTkAerkrsn0Qb7n1hpyFEzyJjJV6mGpZinmkc9FZOzl56gHiDns80gHgKRjf
 XjSr9l3ieT/Z94R4F0uvDXZndTi+a07IY/LAeXf1ifmeMZxdu6iXx+Tz6Yakq0POjCnh
 M3lGgd7Bw6QPAe5ATDAW4QqzUJ17F/tcKLlSLQ4Vb4iPptyF5N2ouEINHvzFmlykboW1
 CsUPQgrnLBWUHrAuQjjXQ8P7qgZ6s+kBGBV5KNaSWAvH2yRc9k9VF9qI/sL8jSFRsqSP
 ATqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNntPaYDl04vvH32f/AQsypKTc5WhzMr6DCLOp5ogtefRWR+gEsIZ3EiGLT/NLK9CTh4masKxTNTPsQXiJCEI3HZX+/xZMhL5+BYEuXoyG
X-Gm-Message-State: AOJu0YySiCp8U1TP9NDbYgYKwR9xAdDbacru0AESdykgftKmaPcopdf6
 asziEslmEM12PHQZ+6oQKH186klZATL6NblixUAkO5vU87vyuxNR8gYwYDXQsh4=
X-Google-Smtp-Source: AGHT+IFdNJlkHn8NQV8zP3hm/RjD7xvcRdfYhoYaJN6camRxCnIHqiip6JS4Fiw3DsaEK+EVXCYA8g==
X-Received: by 2002:ac2:4e4f:0:b0:515:c102:c825 with SMTP id
 f15-20020ac24e4f000000b00515c102c825mr352459lfr.19.1713396662157; 
 Wed, 17 Apr 2024 16:31:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a197516000000b005195b134404sm34870lfe.103.2024.04.17.16.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:31:01 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:30:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 5/7] drm/msm/dpu: Correct dual-ctl -> dual-intf typo in
 comment
Message-ID: <76hjmo4sq6sfjgmnvjoienc5aij74pfjtwevnnls65kxinyaxu@y3yydacvcflm>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-5-78ae3ee9a697@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-5-78ae3ee9a697@somainline.org>
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

On Wed, Apr 17, 2024 at 01:57:45AM +0200, Marijn Suijten wrote:
> This comment one line down references a single, "same CTL" that controls
> two interfaces, so the comment should clearly describe two interfaces
> used with a single active CTL and not "two CTLs".
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d9e7dbf0499c..7e849fe74801 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -428,7 +428,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>  	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>  
>  	/*
> -	 * For single flush cases (dual-ctl or pp-split), skip setting the
> +	 * For single flush cases (dual-intf or pp-split), skip setting the

It should be fixed, but in the other way: it's 'single-ctl'. See
sde_encoder_phys_needs_single_flush().

>  	 * flush bit for the slave intf, since both intfs use same ctl
>  	 * and HW will only flush the master.
>  	 */
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
