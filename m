Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171D9D38FC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5E210E706;
	Wed, 20 Nov 2024 11:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YOdkep+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9107010E705
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:02:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53da3545908so4877449e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732100556; x=1732705356; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a5zgbWAlYfYCr8Nk6Jg9k5X2+R3v6k9oDP6EluhSmbg=;
 b=YOdkep+1axAsQTyw8+KkA4Pi6246vwq1OWKCdmhHZX5rhCm+o53tpvG8U+c1eNuJUG
 KqyxurnXEkArjlHClBkEezlkglW++BJAXswMJ9WbQXRgVFPFwHzxChB1SQVPB6f7ssV+
 js0ZQB/vU3vnteNCWuQhoHDp8oAfFZwwwtrgujo/Hz2/6L1qdpvd1DjA50J++O+CUxDu
 4vrX2i+9PloCzxEVaQXgDY38U/OnqJ1ljFQRu8qQIGf58tAPDlrP9R1XgbXlmnK4lGD1
 zMvYnn5iqluWmunYWyb36DMEXOD+e556qI/UyKAzJQwYSnOO1V7YzWbbIxJ1qsBHKN2N
 KtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732100556; x=1732705356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5zgbWAlYfYCr8Nk6Jg9k5X2+R3v6k9oDP6EluhSmbg=;
 b=k69SyDQxD5qIKzGfJN0gOs1NFBr7MlPVQjNbPY2jiZ3Ma8p2ylNyByq721/zOGmpcN
 /xwVd96EkqhoLHwwscnmLwMp9dzfYrMwPkj0SISKBn5cuTUwubGvc3jnoMbwSiDuOWbC
 K57IhoISwURr/e0HUP5cKwrVwidixq3jyARKYA3Irntyzpv5PqlXo1tgqwZirsr71bDs
 QObsg++gA7E28GKNKZd0Dn6/uHtjPjirj9lx6Os/YNaBLFDN24lMywuv7vPTU3ikYcrU
 CCX9Wub48DvN8uFVsc20oeWQOBoXcau3kBCwDPfkTGHAqkLsuvzI53hVKPLdpv9ndolm
 5uvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAAg5mEzILoDQ9xT1oqMR4pLbjBcqagR99OvniSIYMoFHf5MJShzogy+qQtAkMxzQgOu3xm6sa9Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRddMfoVwnLRuJwO6OKtR/WcefflZJWSheTpuDmZFbu/uXteEg
 E5MnyqFBvUEqSNGv+S6wjhG30KXdrbj7JwhO1hrI5qRfLdHkSYK78Q86H35Qw7Y=
X-Google-Smtp-Source: AGHT+IHKWiTrRrCzYnYM6d7Ym7wDAknR4wn2POzDwbTPgBhBhzfbphYglKnHr9g6u4D92E9megUh/Q==
X-Received: by 2002:a05:6512:3d19:b0:53d:a86a:6b2b with SMTP id
 2adb3069b0e04-53dc136a95emr1101614e87.35.1732100555170; 
 Wed, 20 Nov 2024 03:02:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbf09664esm394046e87.162.2024.11.20.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:02:34 -0800 (PST)
Date: Wed, 20 Nov 2024 13:02:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 linux-arm-msm@vger.kernel.org, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, simona@ffwll.ch, quic_bjorande@quicinc.com, 
 quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
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

On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> The variable pixel_div can remain zero due to an invalid rate input,

No, it can not. Rate is set by the driver, which knowns which rates are
supported. 

> leading to a potential division by zero issue. This patch fixes it and
> the function now logs an error and returns early.

See Documentation/process/submitting-patches.rst, look for "This patch"
string.

> 
> Additionally, this patch resolves trailing whitespace issues detected
> by checkpatch.pl in the same file.

Additionally perform ... => separate commits.

> 
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d..e170f70f1d42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
>   * This function reset AUX controller
>   *
>   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> - * 
> + *
>   */
>  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
>  {
> @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>  		pixel_div = 2;
>  	else if (rate == link_rate_hbr2)
>  		pixel_div = 4;
> -	else
> +	else {
>  		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;
> +	}
>  
>  	dispcc_input_rate = (rate * 10) / pixel_div;
>  
> @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
>   * This function reset the DP controller
>   *
>   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> - * 
> + *
>   */
>  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
>  {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
