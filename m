Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E297E208
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7263310E0BC;
	Sun, 22 Sep 2024 14:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KlGHWloG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0E710E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:45:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so4463460e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727016310; x=1727621110; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2cFIWlQEpg4yYKfKEiN8b4f9CB/NTT5qfc3eckbpNis=;
 b=KlGHWloGQntQTWZ60/oKznTi653Y0FZOp1pz62M5zCIbWoWNfPtx8Py6CvIl4Cbp34
 4kpkdMWDxSZBwCAncYtDqSPOMroRXKKmXVGEBVrPsunAog11ATdoAPKIRTUSAth57cJF
 lozBxJnBe/D8bSJlc2Sz06NvIx4Z6c2kJVSSeJ6bo/izkTRgK5VzSVsC5A7inwiGpG1y
 0zn9jWvwVGxBLbyIYQ+n0puB1W8rPUIhz/DHtVtIl/7dDtYicQZigbrTWDN/NoVQC3th
 WIh5oiaIGTB6SPqKd4aLE34dxvpRsHnzKji5LWjOWdwGXiMhQWL9YeRdk7Ut5KU9/t5N
 0Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727016310; x=1727621110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cFIWlQEpg4yYKfKEiN8b4f9CB/NTT5qfc3eckbpNis=;
 b=drWMpaF2pGNhiraK3Pp6J8AT/am1YSW58E6/jxkDUIVaLTL5AB+2Ec2lx1R02pdOt0
 w7gYv/UPEenmyQv3NJJxjgW4OwsvivnC2OJJ03dNn5zry+YPmZK2llN/m8qX3Tn1d50o
 J+bbatwlhq4KFSzQzbGWVzqQIVY0Nd1MWfunFMx/dmxJdtayi4TL4y9q31y9jSwwuCTc
 gsz9h7UdUnp4Jg+0E777WOipVzEWmc1yBVaziGtC3kYyswsw4s1nWLOrACFnNEXhHouU
 cDLwHISrWYheJhpmoCX1Cx1wvQSelP12sAZEYLkAzoz/JgqmtXcPDV9Q3WhxQvem2wUC
 uhvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBrO7mlexXWQd3a424dK8UNLyuX16z7FMqgNbrFXKnULVRoSVuX6nLOEu4qlummDsFoRdVoNlg+r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy39k8WBrAAvzyfzCToPhDlFwUrMOsJ7ZmKbhbMc0kN1bO4+ZEY
 BWyjMZY+4YxNcvSzgVTz4sYpt12D5zhHPJKas5xfumhd7JeJjCDpGHbXMhTKbLg=
X-Google-Smtp-Source: AGHT+IEmba5pmwDH7Fqb5k5mkZ6dxxmrmN0NkbYXp4vrViTWJAciliMjfjOzKCRWA+B3H8aCpS0VFQ==
X-Received: by 2002:a05:6512:a91:b0:535:665f:cfc0 with SMTP id
 2adb3069b0e04-536ac2f2c26mr4272329e87.32.1727016309699; 
 Sun, 22 Sep 2024 07:45:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b8ccbsm2986578e87.279.2024.09.22.07.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 07:45:09 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
Message-ID: <pqzvhnrvtb4r3olxkkx2kyhsms3y3cki7cow52au3bug2hqzc6@h7wxgyruzd6n>
References: <20240917071710.1254520-1-tejasvipin76@gmail.com>
 <c3wv3r44cmua2hphyjqzb7pp2a32pvs6svcj6s2zohp77qn3cr@4iica7j5bx5l>
 <d470e0ef-0193-478c-a858-d6498758aa9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d470e0ef-0193-478c-a858-d6498758aa9a@gmail.com>
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

On Sun, Sep 22, 2024 at 11:49:49AM GMT, Tejas Vipin wrote:
> 
> 
> On 9/20/24 9:59 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 17, 2024 at 12:47:10PM GMT, Tejas Vipin wrote:
> >> Changes the elida-kd35t133 panel to use multi style functions for
> >> improved error handling.
> >>
> >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >> ---
> >>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 107 ++++++++-----------
> >>  1 file changed, 45 insertions(+), 62 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> >> index 00791ea81e90..62abda9559e7 100644
> >> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> >> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> >> @@ -135,25 +127,16 @@ static int kd35t133_prepare(struct drm_panel *panel)
> >>  
> >>  	msleep(20);
> >>  
> >> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> >> -	if (ret < 0) {
> >> -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> >> -		goto disable_iovcc;
> >> -	}
> >> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >> +	mipi_dsi_msleep(&dsi_ctx, 250);
> >>  
> >> -	msleep(250);
> >> +	kd35t133_init_sequence(&dsi_ctx);
> >> +	if (!dsi_ctx.accum_err)
> >> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
> >>  
> >> -	ret = kd35t133_init_sequence(ctx);
> >> -	if (ret < 0) {
> >> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> >> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> >> +	if (dsi_ctx.accum_err)
> >>  		goto disable_iovcc;
> >> -	}
> > 
> > Move this after the last mipi_dsi_msleep(), merge with the error
> > handling.
> > 
> >> -
> >> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> >> -	if (ret < 0) {
> >> -		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
> >> -		goto disable_iovcc;
> >> -	}
> >>  
> >>  	msleep(50);
> > 
> > mipi_dsi_msleep()
> 
> Is this necessary though? Converting this msleep to mipi_dsi_msleep and
> moving the previous dsi_ctx.accum_err check to below this seems
> redundant. If the check is placed above msleep, then we need to only
> check for the error once. If its placed below mipi_dsi_msleep, we end up
> checking for the error twice (once as written in the code, once in the
> code generated by the macro) which is unnecessary.

Yes, uniformity. And the compiler will most likely optimize things away.

> 
> -- 
> Tejas Vipin

-- 
With best wishes
Dmitry
