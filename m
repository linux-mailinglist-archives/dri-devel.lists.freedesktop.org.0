Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2C896292
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 04:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90504112326;
	Wed,  3 Apr 2024 02:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ATp9EgQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFEA112323
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 02:35:45 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-515b43b39fdso423339e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 19:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712111743; x=1712716543; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e8VzvbIvZUqUsbzF90itURicxpIVMmC97qdhjpsuRak=;
 b=ATp9EgQuRy63iaz2vbKS9jzK0cHXzsHKkBMmruVzd0SypboQwSywXqzMrAEJZ5HKjo
 RZdTaeUghOCWTuiY8MidGs/EQkutrFpK7HAHddCTSbQle/0e3xDQ5ToeeXgTvUyXfs2C
 KOH/Q/ugj2Yphu/jiZvhmzlP6Zg3D7SotE6W6CEBhBOCNldhQBAbqAV0DJViyl/weUmB
 B3JJOMN0gMlIkFk+gKjtnbyMJu9+1u/3hE3ikaGnPPqIx4cr5I56us+zocDG75oLF/0w
 wbC5EuEy4kyM6+2AUZ0IJXi2LPfE4YM7GoMeKOPVcAmK9zi+Oohqs+UY8JoaAYNnXgFP
 w2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712111743; x=1712716543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8VzvbIvZUqUsbzF90itURicxpIVMmC97qdhjpsuRak=;
 b=S1WHorgks5GWWLK8QlrSJV5RB1hM1ihVRiTiBt5oD+MS7+Nu1JaA7ekyI8gCPJ4i7i
 4GDbDcPS4fdHP+xKvVqXU15Ieb7PzFUO4Mi76MbcAlZuv5deH8xC038VWFZT9v9OjhXv
 ciTarkNa/A7DEinNvt466JxP91loiKHTnzkHG2r8gt518gF5PqgSKp8jnzdLgvynG4gO
 dNRmJrsvECchQh8+rn7oZagwhw6k/6UB00w/u+QBfmM257kIjdlHesLt06HuDhUoMXEp
 lNkx/R3WWchZDVWJ7b3tpNtPGa2lB9wkm3Mh81v7ODRuGIYIOEaNRARVwBYy9oU64htZ
 cCIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPqp7mdJYKf5FA8HpAW36PlVbVeNdfZGEtRDHv5Y6YgDO9IqRURHbC1bKaq5dApLnxUE0cUNO/qBLEw6yhfKx+UhoT6cBsBG+yg6NW3pVQ
X-Gm-Message-State: AOJu0YyuJDQhZoCqDtX+B+An0XFQy2lIvrQv6x6jOa3HHlZAwcJH4T+V
 41SFsijqe9UuJZUjqjmSYPOpirliZPHzqoBODNZQEPz/rjnxiJDLGxwpWAyBJFE=
X-Google-Smtp-Source: AGHT+IEpBE/QniA46Q09+tzLd/yM8WPzlg3OeroU44yFIFF96IeElPJ3blpP497K5qTVuhDGY4AjvQ==
X-Received: by 2002:ac2:4827:0:b0:515:c17f:725c with SMTP id
 7-20020ac24827000000b00515c17f725cmr378282lft.2.1712111743419; 
 Tue, 02 Apr 2024 19:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a056512109500b00515c7ec957fsm1878878lfg.220.2024.04.02.19.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 19:35:43 -0700 (PDT)
Date: Wed, 3 Apr 2024 05:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
Message-ID: <h3tc6hc6pomfjegionssupcxqz3az7zhxexfbu4jwqxkpxyzp4@6gldlmtp2jxo>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-3-144f17a11a56@linaro.org>
 <dgvztw55cr4wsbfxhf4ondzhaetodfcv4pndfug73suae5vp3v@4ozlmmsemfbm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dgvztw55cr4wsbfxhf4ondzhaetodfcv4pndfug73suae5vp3v@4ozlmmsemfbm>
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

On Tue, Apr 02, 2024 at 11:09:29PM +0200, Marijn Suijten wrote:
> On 2024-04-02 02:51:14, Dmitry Baryshkov wrote:
> > Add the extended version of mipi_dsi_compression_mode(). It provides
> > a way to specify the algorithm and PPS selector.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 33 +++++++++++++++++++++++++++------
> >  include/drm/drm_mipi_dsi.h     |  9 +++++++++
> >  2 files changed, 36 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> > index 9874ff6d4718..0ecbc811eb7a 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -645,19 +645,24 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
> >  EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
> >  
> >  /**
> > - * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> > + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
> >   * @dsi: DSI peripheral device
> >   * @enable: Whether to enable or disable the DSC
> > + * @algo: Selected algorithm
> > + * @pps_selector: The PPS selector
> 
> Not a big fan of paraphrasing the parameter name, it adds no value.  How about
> describing what this parameter means and what it does?:
> 
> 	PPS table index to use.  Corresponds to a table pre-programmed on the peripheral
> 	or a table programmed with &drm_dsc_picture_parameter_set.pps_identifier.
> 
> (That should be a valid kernel-doc cross-reference to the field)

I don't think such meaning is defined in the standard. In the end, the
pps_identifier is 8-bit wide, while this field has just 2 bits and 4
possible values. The standards are pretty vague about this field. 

> 
> >   *
> > - * Enable or disable Display Stream Compression on the peripheral using the
> > - * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> > + * Enable or disable Display Stream Compression on the peripheral.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> > +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> > +				  enum mipi_dsi_compression_algo algo,
> > +				  unsigned int pps_selector)
> >  {
> > -	/* Note: Needs updating for non-default PPS or algorithm */
> > -	u8 tx[2] = { enable << 0, 0 };
> > +	u8 data = (enable << 0) |
> > +		(algo << 1) |
> > +		(pps_selector << 4);
> 
> Do we need some size validation (if > 3 return -EINVAL)?  FIELD_PREP() might be
> too heavy though.

Ack, let's add it.

> 
> > +	u8 tx[2] = { data, 0 };
> >  	struct mipi_dsi_msg msg = {
> >  		.channel = dsi->channel,
> >  		.type = MIPI_DSI_COMPRESSION_MODE,
> > @@ -668,6 +673,22 @@ int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> >  
> >  	return (ret < 0) ? ret : 0;
> >  }
> > +EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
> > +
> > +/**
> > + * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> > + * @dsi: DSI peripheral device
> > + * @enable: Whether to enable or disable the DSC
> > + *
> > + * Enable or disable Display Stream Compression on the peripheral using the
> > + * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> > +{
> > +	return mipi_dsi_compression_mode_ext(dsi, enable, 0, MIPI_DSI_COMPRESSION_DSC);
> 
> I hope the compiler complains here that it should be MIPI_DSI_COMPRESSION_DSC,0

Nope, it didn't. Both are integers.

> 
> (Enum algo first, int pps_selector last)
> 
> > +}
> >  EXPORT_SYMBOL(mipi_dsi_compression_mode);
> >  
> >  /**
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 3011d33eccbd..78cb7b688b1d 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
> >  	return -EINVAL;
> >  }
> >  
> > +enum mipi_dsi_compression_algo {
> > +	MIPI_DSI_COMPRESSION_DSC = 0,
> 
> Add 1.1?  Or does it also allow 1.2 (when the version is also set via PPS)?

I have only DSI 1.3 at hand, which only talks about 1.1. I think 1.2 is
allowed by inheritance. That's why I skipped the version here.

> 
> > +	MIPI_DSI_COMPRESSION_VENDOR = 3,
> > +	/* other two values are reserved, DSI 1.3 */
> > +};
> > +
> >  struct mipi_dsi_device *
> >  mipi_dsi_device_register_full(struct mipi_dsi_host *host,
> >  			      const struct mipi_dsi_device_info *info);
> > @@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
> >  int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
> >  					    u16 value);
> >  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> > +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> > +				  unsigned int pps_selector,
> > +				  enum mipi_dsi_compression_algo algo);
> 
> Oh, this declaration is inverse from the definition...

I'll check it.

> 
> - Marijn
> 
> >  int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> >  				   const struct drm_dsc_picture_parameter_set *pps);
> >  
> > 
> > -- 
> > 2.39.2
> > 

-- 
With best wishes
Dmitry
