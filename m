Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824499027D8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 19:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BE810E0E4;
	Mon, 10 Jun 2024 17:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YiC8eGMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EF910E0F9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 17:37:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52c6f381434so310568e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718041034; x=1718645834; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TEEh5KUewfmYnZ3Q1Chus2HvKgHcn8j4nfiNpTmt2M4=;
 b=YiC8eGMWS64+MBUX2Mm85tqIzRlmOD6IA8U/IPds7dJ8OwN7dUA+/E11h7tutO3NSR
 bzWTwCvgrKXx5luPcRTi1xIAB26hjHiIvh3XeD9RrmRrOd5OCh+qtxZWZ8jRu74HZyJ5
 y7BTSDFHOphMNXlXZpSHRaKM4qzM2/C3DWCxvu4h8F1kPzsUXishplMYuJiZDPZFsbGB
 qI8u/ZSgYDliR7vSOnYhXnmG5dJNk8+ObEBZFxUDOfBpu8FIjrOTCeU20Y34RZC00oL6
 hCt2y5ymzW5LQxRabMzen3Ckq4wz3TvhhxdTHlC1KEEgnDS5MfWduoAnCNtwYveZDX86
 GqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718041034; x=1718645834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEEh5KUewfmYnZ3Q1Chus2HvKgHcn8j4nfiNpTmt2M4=;
 b=lGmc0G69FewlPICpY3tBlo3lfipLJLFUOUzTkFLAeSOLQjsc9wlaopoKzlMyG77sJP
 ik/4XCLhrYXyzGaio7Ypa+Zz2mLRn2tsmog+cXWOT4/XGI9u+TfsoP18tlux4om8WHKE
 x1MHcsJYshNOkOUQSoIJ0gBPNJyIjTgb3AqEJp6cuHZ0fB8I/XhrYslx2ZWBeHYKwNTo
 2pw4MLwgb/VxTvneglnzkTUMEOGQitGYEVFoIPsQIVxNqO/nx0W6ZwfHX5I4KcfkOffT
 fu6Kl2hbcHJSwkT45GpNP12NwNN5lBtlQVlYdbiNhIvm141Jc1qdd235e/LE4yLgTQD6
 p41Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVusB9aBXxUfgmoe64h8PsMH7F0jY/ss2bhhPG+ZApcvFL1m71T1E0jO4iqm6TdFSkGLurYQSB4fRAPGsVDZ8zoUv3G5Ep9wpGgt5CP/1Gz
X-Gm-Message-State: AOJu0YxzX3BhgSvLqU687zldxl2/5i34RgdRrZkBlx9/nL/+9T30u2Fe
 olP5abgQ0ZSllTgqBceK7MsNpWXkL3wytypSVg249OTS8dGbaDq902zWeqWY4PY=
X-Google-Smtp-Source: AGHT+IEwN5GXDdCSSPBpIsgaZw66Nb9x4NckjGz5YCW6eYhsHn+R7JHRmJZAvzVcvknfacTENnz8sg==
X-Received: by 2002:a05:6512:61b:b0:52c:73be:f14a with SMTP id
 2adb3069b0e04-52c73bef481mr5193626e87.33.1718041033710; 
 Mon, 10 Jun 2024 10:37:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8970d282sm776839e87.221.2024.06.10.10.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:37:13 -0700 (PDT)
Date: Mon, 10 Jun 2024 20:37:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v2 7/9] drm/bridge: cdns-dsi: Support atomic bridge APIs
Message-ID: <hofs67cb2oylwdkuazdzukswbi5t7v7e6frhv52zaz4p2lgwro@vr3muasxj4mw>
References: <20240530093621.1925863-1-a-bhatia1@ti.com>
 <20240530093621.1925863-8-a-bhatia1@ti.com>
 <4fsu5fa5zbrqgc5bepxscoenrax5c6p5b4eyomavioy3bhwuq3@rjjbur3v52e3>
 <a78d5ddf-38d8-4b54-a9b3-7a8745d3b537@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78d5ddf-38d8-4b54-a9b3-7a8745d3b537@ti.com>
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

On Mon, Jun 10, 2024 at 06:02:41PM +0530, Aradhya Bhatia wrote:
> Hi Dmitry,
> 
> Thank you for reviewing the patches.
> 
> On 31/05/24 04:51, Dmitry Baryshkov wrote:
> > On Thu, May 30, 2024 at 03:06:19PM +0530, Aradhya Bhatia wrote:
> >> Change the existing (and deprecated) bridge hooks, to the bridge
> >> atomic APIs.
> >>
> >> Add drm helpers for duplicate_state, destroy_state, and bridge_reset
> >> bridge hooks.
> >>
> >> Further add support for the input format negotiation hook.
> >>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 70 ++++++++++++++++---
> >>  1 file changed, 62 insertions(+), 8 deletions(-)
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Minor nit below.
> > 
> >>
> >> @@ -915,13 +920,62 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> >>  	cdns_dsi_hs_init(dsi);
> >>  }
> >>  
> >> +static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> >> +					       struct drm_bridge_state *bridge_state,
> >> +					       struct drm_crtc_state *crtc_state,
> >> +					       struct drm_connector_state *conn_state,
> >> +					       u32 output_fmt,
> >> +					       unsigned int *num_input_fmts)
> >> +{
> > 
> > This code below looks pretty generic. Would be logical to extract it to
> > a helper and allow it to be used by other DSI host bridges?
> 
> I agree, it would indeed make sense.
> 
> I just tried to make a helper function that could directly be passed to
> the drm_bridge_funcs list - like we do with
> "drm_atomic_helper_bridge_propagate_bus_fmt". This would have been ideal
> in my opinion.
> 
> But, that doesn't seem possible today. The parameter "output_fmt"
> doesn't describe any of the DSI pixel formats from "enum
> mipi_dsi_pixel_format", which is what's required to ascertain the input
> bus format for dsi hosts. Neither do the drm_bridge{_state} help with
> that.
> 
> For now, I am thinking to just add a common function that accepts the
> dsi bus output format and returns the corresponding input bus format.
> With this, every dsi host will still need to implement their own
> get_input_fmt hook and call that function.
> 
> If you had something else in mind, do let me know! =)

No, the code that you have described looks pretty good. Please proceed
with the implementation!

> 
> Regards
> Aradhya
> 
> > 
> >> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> >> +	struct cdns_dsi *dsi = input_to_dsi(input);
> >> +	struct cdns_dsi_output *output = &dsi->output;
> >> +	u32 *input_fmts;
> >> +
> >> +	*num_input_fmts = 0;
> >> +
> >> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> >> +	if (!input_fmts)
> >> +		return NULL;
> >> +
> >> +	switch (output->dev->format) {
> >> +	case MIPI_DSI_FMT_RGB888:
> >> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >> +		break;
> >> +
> >> +	case MIPI_DSI_FMT_RGB666:
> >> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> >> +		break;
> >> +
> >> +	case MIPI_DSI_FMT_RGB666_PACKED:
> >> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
> >> +		break;
> >> +
> >> +	case MIPI_DSI_FMT_RGB565:
> >> +		input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
> >> +		break;
> >> +
> >> +	default:
> >> +		/* Unsupported DSI Format */
> >> +		return NULL;
> >> +	}
> >> +
> >> +	*num_input_fmts = 1;
> >> +
> >> +	return input_fmts;
> >> +}
> >> +
> > 

-- 
With best wishes
Dmitry
