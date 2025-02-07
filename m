Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058FA2B8A0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F5110E0BD;
	Fri,  7 Feb 2025 02:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vnmZwymr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F112210E0BD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:06:31 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5441040a325so1161185e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738893990; x=1739498790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ujQXMd3f5rR8lvPCe761XT8r53CWwMCKlPO4+SHJsQ=;
 b=vnmZwymrprnH6TzYzWTW6KR3AEdhDIxi9Tzsh3VYUi6cFEoy0kjfzvs/7uNZx7gu5k
 g/g8AddxWup19lLZV9PrHva8cs3QpaTE8cxxfEHw6orYSFoajlCDBSwHJ+PBpyZQRQlL
 bgULZm/Xc7GWnK7/9ZOo1PR5IzFeNkT76hdRdGa/8MQ6f8b250bvG4S0DXbQbBTozTbn
 fJXzr7E0g65CVmFaJaei5tWIrQfZ7/qML+A14KGJpJwI6ghfIyPJvu86n7JGaeW8ZIir
 k3XwkWVUgPP5jAxiIgQyrhqLtlEDxUGTJvrtffUafc7/vWcMN9jSUvLg0GpKMfgUybfN
 zAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738893990; x=1739498790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ujQXMd3f5rR8lvPCe761XT8r53CWwMCKlPO4+SHJsQ=;
 b=abxgLm3cN6l+UOe/McuF4goqktkjnIi6qBpilPtwUQElCEPWLPs7vNvVh+h9uzd2Mu
 hG6uA4J/DzQJu73rfTPOIKk1VHzTkKpT16/qtbaaJksOFlpbqTgVJ2eWi9mVcZqjf3dv
 6SyfZdlPodzVgaZTk+GUel9h8+JObuSuGlP0YsX+jbOFJZyZf++g8ew54C9RNoqAJlJv
 049VPkFGJp/6Zhw/sNKiRD1I6UqWyznUkdoRB9/4nXIvUfvcZIoyF9zO6Z0AGjJ87K7B
 KTVAblHwgt6lTYy6NshontDDXqb9005F/tYQ2a7NJ+Y9gIKnvYAvtFc3WRyjy8MQTM6B
 mP6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1iTBdnZJ1xwi13LyrH14m71kvyD/ZyDRCe0djrSizlZXU1LimnCazGSPwDsD2nFn6Hhu7mFsPzoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIPlCuMZceZOcKC7+ILB1UyQvXF889ZzBdFf4GTtOpXO0If1SG
 R4lFU08iopUGANWFJcwcVcYa5Z/q5LGhR3m2seKjmLIRJMc3GWQnsdN5aCoKU2I=
X-Gm-Gg: ASbGncvOk7mFOnSIMVowlVlKQvbbuLoqhYgXaSZGykbTizKv4yGcezXKzIp/B9xO0wG
 FFeP65kY6zQrRJ2J5HrdPwCAkLYvc6UV7zvAWxpAXAQYIhsHuyhCM6hIIdFt3VRseblmIbDSWfg
 PUIN9ejJXJQYwibrciMU0xraS2SbcJhtMR31QPEz/V5ik+6uXl9musgACt3YoqJX/UwgbpbRD2E
 pRBARAdunA91W2K4d5sPEOH6dyYhJXq/yupbApDfv+bt43cdKGbuaokFcJyxiZBVHcvbT8pEm3r
 StqfwVuTL0KKCMFJb7yHU5ibmD5nLObEgBPhB8R0HoN5YIxJ8nrMowijUFbNY2Q/lquASbk=
X-Google-Smtp-Source: AGHT+IGSvbfbhwvFe2ZxA945w3FQ/WVD5eHjbkXKqsZNGZOOvNSGAyY3FitJEH9UmMivIMdxH8YSOA==
X-Received: by 2002:a05:6512:ea6:b0:544:132b:603a with SMTP id
 2adb3069b0e04-54414aa8905mr250920e87.29.1738893990018; 
 Thu, 06 Feb 2025 18:06:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105557ddsm292039e87.75.2025.02.06.18.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:06:28 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/14] drm/panel/boe-bf060y8m-aj0: Move to using
 mipi_dsi_dcs_write_seq_multi()
Message-ID: <mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp@wmvfvhaqhpkm>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <20250206-mipi-cocci-v1-1-4ff0c69e8897@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-mipi-cocci-v1-1-4ff0c69e8897@redhat.com>
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

On Thu, Feb 06, 2025 at 04:05:56PM -0500, Anusha Srivatsa wrote:
> Use mipi_dsi_dcs_write_seq_multi() instead of
> mipi_dsi_dcs_write_seq()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier dsi_var;
> expression dsi_device;
> expression list es;
> @@
> struct mipi_dsi_device *dsi_var = dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> -mipi_dsi_dcs_write_seq(dsi_var,es);
> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);

This is not enough. All the commands and sleeps inbetween should also be
converted to _multi(), so that there is a single return at the end or
even a return via the context. Most of foo_on() functions can take
context as a param and return void, having error code in the context.

> ...+>
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 36 ++++++++++++++------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> index 7e66db4a88bbed27920107458d01efd9cf4986df..640312096c1370c293c84431efa6fd17dc520f2e 100644
> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> @@ -55,15 +55,17 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
>  static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	struct device *dev = &dsi->dev;
>  	int ret;
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
> -	mipi_dsi_dcs_write_seq(dsi, 0xf8,
> -			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
> +				     DCS_ALLOW_HBM_RANGE);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00, 0x08, 0x10, 0x00,
> +				     0x22, 0x00, 0x00, 0x2d);
>  
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>  	if (ret < 0) {
> @@ -72,17 +74,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  	}
>  	msleep(30);
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc0,
> -			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
> -			       0x2a, 0x31, 0x39, 0x20, 0x09);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> -	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
> -			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
> -			       0x5c, 0x5c, 0x5c);
> -	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x08, 0x48, 0x65, 0x33,
> +				     0x33, 0x33, 0x2a, 0x31, 0x39, 0x20, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12,
> +				     0x92, 0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83,
> +				     0x83, 0x5c, 0x5c, 0x5c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77,
> +				     0x3e);
>  
>  	msleep(30);
>  
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
