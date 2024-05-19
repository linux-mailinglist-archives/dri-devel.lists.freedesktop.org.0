Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1678C9424
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 11:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F8510E15A;
	Sun, 19 May 2024 09:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UELyVik2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4916E10E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 09:01:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5238b7d0494so2466970e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716109263; x=1716714063; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SHiS5pE1L03XOoKJQJkG4h1GFh7GAgccKA8QwbdjkRw=;
 b=UELyVik2NuUGsMgSMmh6CtY0tiSGiZnKk56v1yLUUKN6DzGoZAx6nA9yaNxIGba544
 ZepooX9TM81pmCtl+CTGq1m+OqH8iMKGpuj0XwKfcClD8N92pCpHvOFOtaWR44/e7fq6
 FAaN79UPXcn7T0OdIZnkGHv1Q4ITTLvGahp3A8Seeg+0PjJT6GOd1snSACZgr4zUjqJf
 FTLTdO5JUCUXg5W32NUKGhv35qO4hCU7F2SmS5AaC/b0b7Axi5TDZw4+hXWT0jnWIQvi
 bf1DlA5Y5UTH99h4gBAgLXh4XJPDsjeyk0XdUja7C6+LJ1Im/lGwBxHLUSc6npeK0FKF
 kM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716109263; x=1716714063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHiS5pE1L03XOoKJQJkG4h1GFh7GAgccKA8QwbdjkRw=;
 b=vDKMUJZbS9AY2uPWORXWXAxISzxRim0XuLR8ii51cpxMNb9LW1p8k5JlH7PDekqsUh
 FgzrBka/hddi+Fufy4GWKkQr45KdAqNcbWwkAqi0SRLcV8zAkhH2KnT+YPlvoYEDhl9f
 V05jAYz36BG1Y+pjS3m/35MfRBis0mPHOoExaihihDLSUojJv6Ucgy/eFh+c5DoBok4F
 ZH2uW9gR4O9S2CHCEaY365NRszGmfWyCME3SrzGescqrv1IK1RG9dB/GZesRK7XAGy5i
 PzcOsg6/oLMylxj7j1klYHpZX/Xza92ssjdr1B8VxWoWdNtYIoUFJARWk2DXed4WaR4C
 z+6g==
X-Gm-Message-State: AOJu0YydX6iDKg3bMC62X1kuCk2+ywxMnhuCKFtFFZ2yt3OFt98e3lQ8
 to+7tLiIHpdY8Lh7ck5RkurlLBe1L4eHuJQq5p786boq6hzbrM8IIStH1KUVxEE=
X-Google-Smtp-Source: AGHT+IHcmU+ZC0Xb7OmSscvhRIHDI6QsjQ4mi4VtABxNNxSrLgAKtpjQJSmCpF9XzOuCOpVaraRjdw==
X-Received: by 2002:ac2:4108:0:b0:51d:1d42:3eef with SMTP id
 2adb3069b0e04-5220fd7b8b9mr21929054e87.29.1716109263261; 
 Sun, 19 May 2024 02:01:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d90b2sm3883215e87.242.2024.05.19.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:01:02 -0700 (PDT)
Date: Sun, 19 May 2024 12:01:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
Message-ID: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
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

On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Simplify the flow by updating the EDID property when the EDID is read
> instead of at .get_modes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---

The patch looks good to me, I'd like to hear an opinion from Doug (added
to CC).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What is the merge strategy for the series? Do you plan to pick up all
the patches to drm-misc or should we pick up individual patches into
driver trees?


> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>  3 files changed, 20 insertions(+), 40 deletions(-)

[skipped]

> @@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>  	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>  
>  	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> +		/* FIXME: get rid of drm_edid_raw() */

The code here can get use of something like drm_edid_smth_checksum().
'Something', because I could not come up with the word that would make
it clear that it is the declared checksum instead of the actual /
computed one.

> +		const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
>  		u8 checksum;
>  
> -		if (dp_panel->edid)
> -			checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +		if (edid)
> +			checksum = dp_panel_get_edid_checksum(edid);
>  		else
>  			checksum = dp_panel->connector->real_edid_checksum;
>  

-- 
With best wishes
Dmitry
