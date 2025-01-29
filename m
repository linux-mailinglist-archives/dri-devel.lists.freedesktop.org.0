Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E6A223F1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5631510E010;
	Wed, 29 Jan 2025 18:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lkOMe1mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1151410E010
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 18:32:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so7435684e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738175569; x=1738780369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0WQDGTjwpOWFF/+TOhFhnEF0nvuu2y0K3Bho/f1lI2U=;
 b=lkOMe1mx2fGgFQlqvolmtdOuJ/RtRFGW18F9JQB0bnSCaZNP/jy0OP5XqCULt98Cik
 ooczVwDlASmGIFGT26zJgVoztsbSAKlQscXd1iJ6HymjjixAYsbGKMkOZaLwgsFpcLNg
 eyrBWjcaaJ5WeFTGxfq1CkPMBTJZUTREEc0r4bnzM7HUUw5SnHHtCmTNF23RAqtLRQNH
 t27xGNZNsbZRquKBxQYcJWt8dM0jY1BMW1V1Mkcpu+8dlo1svaRsIgPZKOPh6jRfiLud
 djFuuRj4hOx/v1WnP1oFhJlU2NsTpqLkF178F0Tw0V/H1h8Lyi4DKOZRawHQ0A6HT1jG
 BBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738175569; x=1738780369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WQDGTjwpOWFF/+TOhFhnEF0nvuu2y0K3Bho/f1lI2U=;
 b=LLcUI1i8WwTpU28kg0J8ZA4vIm6qyK9JQ3gTNrZ1/9TUOi7dRzylfwQxys/ScrmBJg
 uYp+KQp53hiGt4KOeVFzkk2CL5VLoxwmko6aZG3CAuLIyzm/QM/3FuAE/jTFMhxfqFC0
 M4E4pDWM4VQ7U1Q5FG37BEdNsqI418cJ6tYH8Y6NUpGQau/xOLwFBB1oQwQDbX9xrOay
 vlQhbuRFKJcvXU9Iw84SgxJeouowcV6tc1BzwANzj+iuvDB2tfgGqCSEp5tk02TD8jEH
 hfl5VRXU0Kod6/i6irquVtzC7nwzYmgUWb799uBDw6osw0QsM2BH7xsMyGSI7SSJH0B5
 vt2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDffEjHPXr1sJLq6WMOQ0Z4IAZnnaPCgMOxfZBFzFE/GRWW4tGB+UtZOKnq0JDTeIkz8sepigG5zA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Nn+kzOrtMdn/0teSyTDpto/rvhG3i2mBGzdqxvHfJxaYwGi7
 7CE7c8VcY16ATA0r+tieEhb3Ur/cbf5G23olKWsT4smiJuTRxp3YxDtf+BNup9Y=
X-Gm-Gg: ASbGncuV36n9F3XL6qd4VhsbnbhErHm51r3oetNCzL/UFPpFyMiFwcyzjb80ehDd3ii
 5pNqT3d0Qu5II5RQ1FS3vENLbUWIrprgiUvyWqV6jMsa0Q+mALKUH0GwhGmOzWf1ZlEZMYGO36R
 NIfN8bzXWZIMxYPWh4vTNMIjN/ho/svP/RpdsEga/7jeMEG+oXnz+wpF8AK4Y/NfCTYgetrrFIb
 USiHner6/CX1sqkWrFYicCiNOFA5Kv6gpkU13hK2pmYprfXUbmXqUcFTsF9ZWfefyJXz8kYwEdf
 ZkrnCzOwSCIQXi7SoXIeycflzpLJ5Q0R+KJiCVHjOV9rGkdmeRsdqCkXOuwJwHHum+C/EUI=
X-Google-Smtp-Source: AGHT+IElTnwSVKi6MZo+1NGIgBsRRnCn8N7AxB90A4mEzyT0dXpC8YcetBNofgV4M57HJJ4zOMTZqw==
X-Received: by 2002:a05:651c:2125:b0:302:3e14:34c8 with SMTP id
 38308e7fff4ca-307968f8e4bmr17478991fa.22.1738175569097; 
 Wed, 29 Jan 2025 10:32:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba6bd3csm22097091fa.21.2025.01.29.10.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 10:32:48 -0800 (PST)
Date: Wed, 29 Jan 2025 20:32:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
Message-ID: <abbyf3h4weoshu63mrdwy4vmm3z4t3vb74ikvcnk3lhptlxhm7@bdcj4a3cxpzu>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
 <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
 <qe7cm52nozxvawm6yjzbvfarwoiokpwkr26s66tkypgrsztc7t@vnzbek6i4qhr>
 <c676ef1a-3b08-4342-b4da-d0b525f2f55b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c676ef1a-3b08-4342-b4da-d0b525f2f55b@linaro.org>
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

On Wed, Jan 29, 2025 at 05:44:31PM +0100, Neil Armstrong wrote:
> On 29/01/2025 00:44, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 05:14:06PM +0100, Maxime Ripard wrote:
> > > On Sun, Jan 26, 2025 at 03:29:13PM +0200, Dmitry Baryshkov wrote:
> > > >   /* -----------------------------------------------------------------------------
> > > >    * Bridge Connector Initialisation
> > > >    */
> > > > @@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >   			if (ret)
> > > >   				return ERR_PTR(ret);
> > > >   		}
> > > > +
> > > > +		if (bridge->hdmi_cec_adapter_name) {
> > > > +			if (!bridge->funcs->hdmi_cec_enable ||
> > > > +			    !bridge->funcs->hdmi_cec_log_addr ||
> > > > +			    !bridge->funcs->hdmi_cec_transmit)
> > > > +				return ERR_PTR(-EINVAL);
> > > > +
> > > > +			ret = drm_connector_hdmi_cec_register(connector,
> > > > +							      &drm_bridge_connector_hdmi_cec_ops,
> > > > +							      bridge->hdmi_cec_adapter_name,
> > > > +							      bridge->hdmi_cec_available_las,
> > > > +							      bridge->hdmi_dev);
> > > > +			if (ret)
> > > > +				return ERR_PTR(ret);
> > > > +		}
> > > 
> > > Maybe we can use a different bridge feature flag to trigger the CEC code
> > > support instead?
> > 
> > it is possible, but what is the possible usecase? DP drivers should be
> > using DP_AUX CEC instead. And I think there are no other kinds of
> > bridges which implement CEC support. Meson driver does something strange
> > by registering CEC notifier from meson_encoder_hdmi. I think instead
> > this should be moved to the DW HDMI bridge itself
> 
> It was done before bridge_connector has any support for CEC to keep the
> functionnality, I'll be happy to switch to this.

Well... Converting dw-hdmi to use all HDMI API is going to be
interesting anyway:

- iMX8, iMX6 attach with flags=0, so dw-hdmi creates connector (with all
  its fanciness).
- Ingenic and RCAR-DU use simple drm_bridge_connector, so they will just
  get all new features.
- Meson uses drm_bridge_connector + additional bits on top of it (like
  CEC, max_bpc, HDR).

Either we end up with a monstruous commit that reworks dw-hdmi _and_
drop extra bits from meson driver at the same time or we need some
well-thought plan. For example, first make some of the features of Meson
optional and dependent on their generic counterparts being registered by
drm_bridge_connector, then convert dw-hdmi _and_ use
drm_bridge_connector internally, finally drop extra meson features now
consumed by the core.


-- 
With best wishes
Dmitry
