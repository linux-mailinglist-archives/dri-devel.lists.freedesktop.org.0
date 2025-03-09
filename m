Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BAA58193
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E4410E34F;
	Sun,  9 Mar 2025 08:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="edN5oXdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAC610E34F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 08:16:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so2008935e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741508195; x=1742112995; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
 b=edN5oXdBI08ktVkjxHW15G938RYLkf160Kh71BZi8Rnkb/gqcOcFp6FfT1sUufDp+F
 RX7Sblt35SwlxazM1nnfqHKOMgKWw1kY+e4B/V1VOBpG1q5j5tJDYZOGdF3lVsONaGKM
 W5QA32Kb5z3iLPRHKVu1t9g/bV4DFZUEr8MU/cnxWbcRrPFyI/zw5HNaDJHpw/HwnhbP
 ubx7FHPoBgRbdBvkSLV1m6bCQHQ8qAgt7qvCoz2TedFVABZwuU9dv7Bec5aquNFk3Iwd
 /OOzBCOapAhuesnr+tDbBoxZd5hkyLOkn58jPLHtNNpbcl+53jqDzhJhzwvU3yNNaINB
 Bjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741508195; x=1742112995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
 b=QlMl9t6RRsjoPeoHjuGJt/7GlNrzje3BR2Z0fvgfVQcNyj9uFfitqfhqveKEasEuXv
 hP6IeFqOdvQgRYmlSeutlySkmInmaDG6GAarI3UE/KgVbs8YrgTX8Dx/D3eUxn2/kIxu
 Y1I4BvHUNaKZrOD73XnWhrusQES6kPtXscvOk3g+6fXjzx8cDwXm/2xdVQqAPENExSQC
 kuq8hjbimMYI3qVRh7IXQi76uPnlAZAkC23j5v7KgHW409CWToPEIEe/hYW3Jw7ZCLyq
 Ouaa67reU8cabjBJCsRhAs9mQsemto4uUPFhfSChtrv/tqgSFY/JnKZd+2NMy9JjCSMr
 FvVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG8q7/ZvxgCDvxscvU+7OgC4PJaIfSn71E0FapSUPyhPlQoI//shM3RM/ALbSGuLJF9PPb3AlqL78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDmxq62if7CJqzEwjztRPqZbWaUE2o5r1uyNYy/z5zZzvMJhNM
 V4tUM+f+/Ln7quBnw0F2/nqvdfIxHOOLVGvGnHoXalFv50vi6z6wMpC+6PEW3bQ=
X-Gm-Gg: ASbGnculv66ZH2nJDA8glcusc8em4FSOUpHWaeoBQ1KVhiE3Fk20fChYvG73cgk+WrX
 o0RMHIxsMV44KtpmINbklS3hgzB3A94B7i9U1EPsmoNIN1cYttJ7GwxxO0BanIElxoG/Xxpj9I6
 2tqfUf5U9TgKgXcxP0Ja1WC/uM1PyFmdFsvkCoV56cm3iQUtjXlLnGrckYkF4MHh5jHi8K3fEI/
 3SqvwYZcetvkjsQVq9KUXdOeb3Q5xGZAuTNoXR91VIWnsc9Iii6aTh3QdATh8tquk/qJ7yOHlzm
 JaH6DbButtI7ETVSR8vfp5f8zkr6AhoBhJgUzSNr2zEx1IlRE1EX/mUP/6OZnHW+VrSTwuA0MkE
 NZpi0H32EyfQDDnMuQDVt85eO
X-Google-Smtp-Source: AGHT+IHonFYRVCOD3hc2ZLZ2k0nh0AnV9X63OZNmrpqQRQXGzg2TI3GANig2LQlLgV4Hue3Yp7RGkw==
X-Received: by 2002:a05:6512:1112:b0:548:9786:c18a with SMTP id
 2adb3069b0e04-54990e5da6emr3725516e87.19.1741508195235; 
 Sun, 09 Mar 2025 00:16:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae46199sm1054491e87.39.2025.03.09.00.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 00:16:33 -0800 (PST)
Date: Sun, 9 Mar 2025 10:16:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <5x4bmy52gxc6y3m6qswqxoxvjsk52zz7lvjpudqgr4d2hwaz4b@bdf2dzgji7gf>
References: <20250308144839.33849-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308144839.33849-1-qasdev00@gmail.com>
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

On Sat, Mar 08, 2025 at 02:48:39PM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys" 
> before the sanity checks which can lead to a NULL pointer dereference if 
> phys is NULL. 
> 
> Fix this by reordering the dereference after the sanity checks.
> 
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")

Your SoB should be the last tag. Fixes comes before it.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056..ba8b2a163232 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1667,8 +1667,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> -
>  	if (!phys) {
>  		DPU_ERROR("invalid argument(s)\n");
>  		return;
> @@ -1679,6 +1677,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  		return;
>  	}
>  
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +

I'm not a fan of having variable defs in the middle of the code. Please
keep the def at the top and assign it here.

>  	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
>  	    dpu_enc->cwb_mask) {
>  		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
