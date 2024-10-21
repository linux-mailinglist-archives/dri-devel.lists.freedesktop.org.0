Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7609A6ACD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E29D10E504;
	Mon, 21 Oct 2024 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cUYuxOcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D6610E504
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:44:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so2391087e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729518275; x=1730123075; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wA9D1co2BPCyRcKrOGgUmRJb42G/2xnYI/PJRf0sfiI=;
 b=cUYuxOcEm+wt6dHhTMf6ykCMlUr0V1sVF7fTjj1pVJSMX+5y2leEfqWCu+GLgsiiXk
 vxsTokP32VTeBy6jnuMyr4HHTMj2GUIUXfuExdAw3rt8icfnQSZ+Zmw3czaJ8Ve9ZqU8
 uhS8TIFDeits4Huex4nVrziSbcrUixjb6uLcDPsayk2AM7SKa+yTSnEbd1d4k2ZRJKwk
 WlcLJ5+lM3l4L5fOIusdpsjJcnKNoc5JF2akjJ+UbEQ93HOwgWt9BWI1krizJoLXrAfj
 d4bV3ygKR/bSTtfGtyoaX83m2yJuzc8KJ2JhpG8NcvWRSW6aKzd9i69pXAst+YSM9saa
 i5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729518275; x=1730123075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wA9D1co2BPCyRcKrOGgUmRJb42G/2xnYI/PJRf0sfiI=;
 b=hsdFmVjsI+HW3GEHrvkDl/lFArT2N/XS800WyRYT0AKAwnfSwVcOVgoHZJQF6KjuIj
 ZnGQtGBOKEyPvWZw5NCF3Us3GonOpizlEKA5btdE5CbF7BR37SSreJ95n9B7q+W5hrGl
 j/30ONgpZ0spgEWzOIhyMrx9CLuYS1QXlZ5Blx614sK6Cy4vrGlwXfv2d4iZ/IK3N73Q
 I0TNN5+ODUBcqo8gKm34m2Gnh7w9NK1HqBObXoqsXaZ4cWaW43Fxbtyp2peQAHW72tWf
 dz9rLnpHB6sBN8IErqycaTCCmCW8975afcKGqSgsAKxWrPfhwClu3MOmAnXcO7OBsOvR
 xzow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpd9Ddd7NrUVsl4JQA6vlh155Drki24hMdvYEeP8OGcPM20UDnKu7Y2A8S1WFd+GKS1Sg8tK/saVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvMisKsNScRegYxSVTcDYga1LKqkP8D1ImXeiFlu4YbjItUS58
 /HcYpag4iNvFD1ftiN/Ou77+7eC3FZ/szA1kji2J87kcIcyr7WY5d1kZovVuDAQ=
X-Google-Smtp-Source: AGHT+IFXHRDcy85ee1/d4HX6Zxgy37C2+Hq/Nm/Ll9Oqk+925jbxRjDc0fXfRkY9HnW5XrkeyVxUGw==
X-Received: by 2002:a05:6512:2210:b0:539:8d9b:b624 with SMTP id
 2adb3069b0e04-53a1547049dmr5031415e87.55.1729518275386; 
 Mon, 21 Oct 2024 06:44:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223f0067sm487737e87.81.2024.10.21.06.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:44:34 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:44:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/6] drm/display: hdmi: add generic mode_valid helper
Message-ID: <2az2ja5zrd5kw4iusvl23grvrgjcvh7jcyw66kjdsh2gftvmkb@araqcfpv246x>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
 <20241018-hdmi-mode-valid-v1-1-6e49ae4801f7@linaro.org>
 <20241021-chubby-fascinating-labradoodle-144990@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-chubby-fascinating-labradoodle-144990@houat>
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

On Mon, Oct 21, 2024 at 11:32:03AM +0200, Maxime Ripard wrote:
> On Fri, Oct 18, 2024 at 11:34:19PM +0300, Dmitry Baryshkov wrote:
> > Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> > It can be either used directly or as a part of the .mode_valid callback.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c | 25 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_helper.h     |  4 ++++
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > index 74dd4d01dd9b..0ac5cb000ee2 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -256,3 +256,28 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > +
> > +/**
> > + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
> > + * @connector: DRM connector to validate the mode
> > + * @mode: Display mode to validate
> > + *
> > + * Generic .mode_valid implementation for HDMI connectors.
> > + */
> > +enum drm_mode_status
> > +drm_hdmi_connector_mode_valid(const struct drm_connector *connector,
> > +			      const struct drm_display_mode *mode)
> > +{
> > +	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> > +	unsigned long long rate;
> > +
> > +	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > +	if (!rate)
> > +		return MODE_ERROR;
> > +
> > +	if (!funcs || !funcs->tmds_char_rate_valid)
> > +		return MODE_OK;
> > +
> > +	return funcs->tmds_char_rate_valid(connector, mode, rate);
> > +}
> > +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
> 
> As discussed in the discussion that sparked that change, I believe that
> we should use hdmi_clock_valid.

Ack, I will modify the code accordingly.

> 
> AFAIU, your concern was that max_tmds_clock might get stale, but then it
> would not only prevent mode_valid from running but also the commit
> entirely.

It might be stale when parsing / validating the modes. But let's try
landing it the way you had in mind and fix the drivers which misbehave
(if any).

> 
> We don't have any evidence from that, so I'd rather try to keep
> consistency between the two. And we can always try to address whatever
> issue we might have if it turned out to be a bad idea :)

-- 
With best wishes
Dmitry
