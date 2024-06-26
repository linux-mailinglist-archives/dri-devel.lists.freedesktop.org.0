Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2791873E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6010E945;
	Wed, 26 Jun 2024 16:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NcvSliNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E0A10E945
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:23:18 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso71152421fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719418997; x=1720023797; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lc6XwGsT/OrBaQc7KsXWoDsazkeJ45Mt+fnavfI74KE=;
 b=NcvSliNv75mfQv5xMeRMPs0Q5c5eGiH57/hYG29rlaTxazbDvkIXW5iZ2inrx7seil
 5H4eTule20jDKgcUNnh72up/uoLglwAXilqnj2xM2TMKuCKYb+7cgCHJHPz2FAZxeRVl
 BpKD2XjOKjgc+wPGYF9N4xl5/6RYGtfM6nVwdYDdkZ2KdE8ed1LDcH22+Ie4ceQjgK7L
 miQQrJPGPSqOHS10Hm4A/+avvg1mTO9U+2TG3OT7eGrim4Ok9dXN7Xmwu3Bbrs3lCJ7k
 +Xnjqnox33I+ImmAJ6UopARyzxXmxVdYxmca0jM6e1lBNl0DeWSrtOsU3czq+AU43tAa
 WZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719418997; x=1720023797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lc6XwGsT/OrBaQc7KsXWoDsazkeJ45Mt+fnavfI74KE=;
 b=FxWcJbw9XDaxwOU1XjG9HmSZxTdBDPHusGQWRgjDTGiZFf+4udbxfKuKJl2e+a7DYr
 ijoFiRE1irL3aF4OzKQURPcp1dROxvI4RCCl+W87+Ocp4MFp5kdLPlkTOG/HFakYEV9R
 twdloMmQVxQXjUMWtE6U/FABPxgrs1xxdUrtXYe+3t9zgeUtj8IOy12ZlVS7bQkoztUf
 7Jt+Vck2uABN8GowDJKgG2ICEtPJmq9coKA3oBW8GuHUr336FWSIn3MQXc0wqDOBwl9l
 Y1onene/UrhNliyW1yOSjGfmSkap/JBquKxjsKuKTaD/FS+p1IGzmORiPSaXKezW7qAW
 5FgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI5BzR2zjXRJqoDPV1yl+BXCjGw+CojR1UJ59kkQyPRBABCWv26X+79pauQoIl93+XnRWJsmkYzV53L8hYgg3P5b7Pm1P4cm+pgEuV7viW
X-Gm-Message-State: AOJu0YwaHNNUr2lzhl5uARx5geZagGGmRFFBNkqkEmSrq15ujeLaH8ky
 /3QYTO+Aj5YC43LXxhu0d1o+6vgrSeamPQq1Xu1te8nY99cCXpeO2siQb5sMQ+4=
X-Google-Smtp-Source: AGHT+IHsv74XlRJnwnRUxhAYexJVGMUjY7Ar9S60EXozImhBAVCdYFUzOtce+wPdqcdJOMLB9uGZWw==
X-Received: by 2002:a2e:95d4:0:b0:2ec:40ab:694d with SMTP id
 38308e7fff4ca-2ec593be836mr69495321fa.1.1719418996603; 
 Wed, 26 Jun 2024 09:23:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d602519sm15325611fa.6.2024.06.26.09.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:23:15 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:23:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for TI TDP158
Message-ID: <a5wz5xufyd64dg2cyfptdviutaqiawucdytp52kb7qlmza2bui@ppqlooifzy7v>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-2-a3b344707fa7@freebox.fr>
 <bgp36sjj5hvldl4tqtjt7q6eva553hkek55easqpugzhdmcjv2@uhafklf25rit>
 <19167580-4e25-4820-90f1-2d03c7e9cb04@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19167580-4e25-4820-90f1-2d03c7e9cb04@freebox.fr>
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

On Wed, Jun 26, 2024 at 05:26:10PM GMT, Marc Gonzalez wrote:
> On 26/06/2024 06:47, Dmitry Baryshkov wrote:
> 
> > On Tue, Jun 25, 2024 at 06:38:13PM GMT, Marc Gonzalez wrote:
> >
> >> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> >> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> >>
> >> The default settings work fine for our use-case.
> >>
> >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >> ---
> >>  drivers/gpu/drm/bridge/Kconfig     |   6 +++
> >>  drivers/gpu/drm/bridge/Makefile    |   1 +
> >>  drivers/gpu/drm/bridge/ti-tdp158.c | 103 +++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 110 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >> index c621be1a99a89..0859f85cb4b69 100644
> >> --- a/drivers/gpu/drm/bridge/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/Kconfig
> >> @@ -368,6 +368,12 @@ config DRM_TI_DLPC3433
> >>  	  It supports up to 720p resolution with 60 and 120 Hz refresh
> >>  	  rates.
> >>  
> >> +config DRM_TI_TDP158
> >> +	tristate "TI TDP158 HDMI/TMDS bridge"
> >> +	depends on OF
> >> +	help
> >> +	  Texas Instruments TDP158 HDMI/TMDS Bridge driver
> > 
> > Please run ./scripts/checkpatch.pl on your patch.
> 
> Oops, sorry, will do.
> For the record, I did run:
> $ make -j16 dt_binding_check DT_SCHEMA_FILES=ti,tdp158.yaml
> 
> 
> >> +	if ((err = regulator_enable(tdp158->vcc)))
> >> +		pr_err("%s: vcc: %d", __func__, err);
> > 
> > - dev_err
> > - please expand error messages
> > - ERROR: do not use assignment in if condition
> 
> simple-bridge.c uses DRM_ERROR, but it says:
> "NOTE: this is deprecated in favor of pr_err()"
> Hence, I used pr_err.
> Are you saying I need to record the dev,
> just to be able to call dev_err?

Yes, please. Otherwise it's just random 'foo: vcc: -1'. Note, that most
of the error-reporting codes doesn't use __func__.

> 
> 
> > empty line
> 
> Will do.
> 
> >> +	return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > 
> > No. Pass flags directly.
> 
> Oh, just pass the flags argument here? OK.

Yes

> 
> 
> >> +	tdp158->next = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > 
> > Missing `select DRM_PANEL_BRIDGE`
> 
> OK.
> 
> >> +	if (IS_ERR(tdp158->next))
> >> +		return dev_err_probe(dev, PTR_ERR(tdp158->next), "next");
> > 
> > This results in a cryptic message 'foo: ESOMETHING: next'. Please
> > expand.
> 
> OK.
> 
> Thanks for the in-depth review & suggestions.
> Will respin with fixes.
> 
> Regards
> 

-- 
With best wishes
Dmitry
