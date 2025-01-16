Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD0A13456
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F2C10E55C;
	Thu, 16 Jan 2025 07:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="erJjSonC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404210E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:52:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so594858e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737013912; x=1737618712; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9KeTcvRzSBRZoETGqvAsD3cwrr3v6t0G+jUydDVDOWE=;
 b=erJjSonCUDa4mH2MfTH6yh0Tsmnjlyb1WFIkfSHkO5DO6Uu8LKtTm7oHfJLZ1WvqXW
 FNLTn5aiQTg+olvPqIS8VHE1CvdOZ/u0cBo6ysQf9JqTf7gJfo5DwxRFVrcCr/iUB0tZ
 tbhzY65dOvRPu0tge8ic52NY98McvMZ80vr4UAXTV8TAtWpyqd/k9TdoxVnJBmTwH7cj
 jLYm2WJt99ewcdLy55rOrlwgNJVOHIfU8eSgJ18jaCXd1L1f7k5LQcuJUayCmUfyCvh+
 fBVquHJzpHcekYjU0w0io4wWbf2svWO9TZTGaLwkgqVuJkePo8t0nnZUOYYaAP5/wR7w
 DUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737013912; x=1737618712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KeTcvRzSBRZoETGqvAsD3cwrr3v6t0G+jUydDVDOWE=;
 b=AhKLQrAujTKmkB2cUY3l2lQK6ubbpmSzWj2VeliNHwuL9Gvrcv25CJH5dSVJE4A03K
 HrFDCLq3CUmlY5VE4yWd1YxJl7rHJfIRu4wpS8Tx8Y8N8tcTpSCtG+vt4GcShKwrpTzd
 rk06DumXtathfiqYHnjExAKPeQ9afRgLvdUn5m5p5jGvIUc85zhIWkiO/4crUa4Iu/5E
 xkL7qHFV27TSPY4FibNh82qmjj2e017uldhHtpSPXJNbPnbOREffmssIslDAmEmCbXU9
 R9Fcm1dqomy0cfS5zhMxC1QtPjVqohRdqXclzvSS2KsvdsSqKLeyfgG+mgz01FqcqEVO
 Xj4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4wwYNXYcEJhwR6o3zc6rdCWMnX5YrkOhxwTFEIBJJmyUSRv0IJUJKvLgjOhMyqJ+dabqJwkZ3XNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/dOzamhdlmXp4ldfrd1wbt/BmOI4s4MzzjPDnrODP9TtVaUQ2
 N28wamX4orV+DmJNuRnQKfCg25rNRwUM2wTZkqp0czcQi/BZek+h8JPZmpaQnN0=
X-Gm-Gg: ASbGncvUFvLygExAw5v+R9B2o+6KKFsG/JHZowJY+CWmIWJVpwREA6XZL9/L5gVsW5p
 eLEZ44W/QAPwH8XMl5hdb0BT03dd7K2R5YZgRJoOz5sazGDoLXTYnGiyfUaO0P5t1ZwtWff28KO
 8tbdYQyAMVXBq+Gt5zTYniBlT71ez1L28jZYnbEahP0XXWjRTTQCzJK8YcRl6dXNQ9uHVcLZgRy
 M7CkZ36/CoMY0dLMmS2yqpcoULVbxtwUjZiueFtfX1+bR1tpYXksTY5aoXrHKOGRGLHChOM7Ln5
 dsJOUwpM8f8x12ShAcJESAiLIUgFrGx4qNk2
X-Google-Smtp-Source: AGHT+IGPJCJqYj/cimGurDWfRa4t15Cl982J3dR8pYm0UoxlgQOAe+YlDndj4ssRizqsQTlDi67H9A==
X-Received: by 2002:a05:6512:3e19:b0:542:986c:11ef with SMTP id
 2adb3069b0e04-542986c134emr6310487e87.5.1737013911933; 
 Wed, 15 Jan 2025 23:51:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6acasm2225579e87.117.2025.01.15.23.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:51:50 -0800 (PST)
Date: Thu, 16 Jan 2025 09:51:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/16] drm/msm/dpu: polish log for resource allocation
Message-ID: <cjtwvbnpqqkcrqs3f2elol5s5wcdxtk5yeevgtf6zj4gvypqth@dcg3ydqk3v4r>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:53PM +0800, Jun Nie wrote:
> Add resource type info on allocation failure to ease debug. Because
> more resources are required in new usage cases, such as quad-pipe case.
> It is more likely that resource allocation may fail than existing usage
> cases.

- Problem description
- Analysis
- Resolution

The patch LGTM, the commit message doesn't. Please work with one of your
colleagues to make your patch descriptions understandable. You are
putting the cart before the horse.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index a67ad58acd99f..24e085437039e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>  		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>  
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "unknown",
> +};
> +
>  /**
>   * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
>   *     assigned to this encoder
> @@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  			continue;
>  
>  		if (num_blks == blks_size) {
> -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> -				  blks_size, enc_id);
> +			DPU_ERROR("More than %d %s assigned to enc %d\n",
> +				  blks_size, dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		if (!hw_blks[i]) {
> -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -				  type, enc_id);
> +			DPU_ERROR("%s unavailable to assign to enc %d\n",
> +				  dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		blks[num_blks++] = hw_blks[i];
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
