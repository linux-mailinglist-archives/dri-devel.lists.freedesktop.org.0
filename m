Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282CC8320CE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 22:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01410E7D9;
	Thu, 18 Jan 2024 21:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360210E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705612871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/RFuMwXFGgnLzX+gQ+7Eyl0Fns+nyjhizUJ9hMdtGQ=;
 b=WFCZ7QyEopp8GjFucHta7Cehrv/wunE11RbZtP3oqhdsSVhgmll4cM3VMhZEW+TrtLS4vP
 FGiIvRagutwpbcdSnB0RJyi3OsRvRnx6pDEKdRQf5U2QOMITgjMfu/oizujuOfOTh/rTyu
 v2fqkiDi+97PEJuxeoDLa66kgyEN134=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-lIxDAMryM82AXKuF4qWchg-1; Thu, 18 Jan 2024 16:21:10 -0500
X-MC-Unique: lIxDAMryM82AXKuF4qWchg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e46bceed8so670265e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 13:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705612868; x=1706217668;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/RFuMwXFGgnLzX+gQ+7Eyl0Fns+nyjhizUJ9hMdtGQ=;
 b=ia8cUMLkzxxtJErmZZz52J54Qnfcdfv2Yxy83SQmiMULxBkHtRm6muW2aRLumpiNxl
 WLRz+XfYos7hctiEcFeuPWC+FvV9tAzsPQ8WlSVzwndGmcUIC0nxEM0cJYlgl0Z26W9o
 L4nBmoAL2HICiWrqMi5CI9IAIPOUPLGN4xyNzDIDN3tILu/C9qieY53zK1eB9uDHfYq1
 XS29bB+IbsEchVzYHmaQlsJ/vK6/vNOZHG05adGFLuEeQtbyuLvcd6tVVmQKzlm40LD1
 CRUoqkF6wdDFFz8bI0hXX5mhiB1ueDF3tcT6cEJdNXHcJ4EuxF3d4bK7Wp3RxIMKct5c
 QQsg==
X-Gm-Message-State: AOJu0Yy4CG/lqIceGVOXgYrwlIkgnTxz6shzvL8cQVwWX3SBkJiQVcpS
 HIhFsYr0xP/JF3Oie0MXeELN3ntewtsclmFZetGMpYkEBAmlaSRMlW6Pa3CKFs85dAsdjBXGh17
 jC10Y+Np4gguhKhKWB4BVRXyJuta+6Bkdx898l+kJMn8mff+K695xNYz9WqVP8bP8rxhyW2SYzy
 x7
X-Received: by 2002:a05:600c:4fd0:b0:40e:7485:daee with SMTP id
 o16-20020a05600c4fd000b0040e7485daeemr889518wmq.90.1705612868215; 
 Thu, 18 Jan 2024 13:21:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbMdqyiktrO4MfePrGAzXbNxUb85rIEKPcPE1jD7jmO2KFaepfrTeZH0nCka73fDv9zyB9iQ==
X-Received: by 2002:a05:600c:4fd0:b0:40e:7485:daee with SMTP id
 o16-20020a05600c4fd000b0040e7485daeemr889513wmq.90.1705612867823; 
 Thu, 18 Jan 2024 13:21:07 -0800 (PST)
Received: from toolbox ([2001:9e8:89aa:f00:af88:d221:94de:a009])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b0040e95632357sm2223810wms.26.2024.01.18.13.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 13:21:07 -0800 (PST)
Date: Thu, 18 Jan 2024 22:21:05 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <20240118212105.GA30589@toolbox>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox>
 <jpcov2bvhpabws36ueywr4xjfnbmwjsd42b4tpcicyi66qkjs2@3xn5mdl4zyus>
MIME-Version: 1.0
In-Reply-To: <jpcov2bvhpabws36ueywr4xjfnbmwjsd42b4tpcicyi66qkjs2@3xn5mdl4zyus>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 04:25:41PM +0100, Maxime Ripard wrote:
> On Mon, Jan 15, 2024 at 03:33:08PM +0100, Sebastian Wick wrote:
> > On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
> > > The i915 driver has a property to force the RGB range of an HDMI output.
> > > The vc4 driver then implemented the same property with the same
> > > semantics. KWin has support for it, and a PR for mutter is also there to
> > > support it.
> > > 
> > > Both drivers implementing the same property with the same semantics,
> > > plus the userspace having support for it, is proof enough that it's
> > > pretty much a de-facto standard now and we can provide helpers for it.
> > > 
> > > Let's plumb it into the newly created HDMI connector.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  Documentation/gpu/kms-properties.csv               |   1 -
> > >  drivers/gpu/drm/drm_atomic.c                       |   5 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c          |  17 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
> > >  drivers/gpu/drm/drm_connector.c                    |  76 +++++
> > >  drivers/gpu/drm/tests/Makefile                     |   1 +
> > >  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 376 +++++++++++++++++++++
> > >  drivers/gpu/drm/tests/drm_connector_test.c         | 117 ++++++-
> > >  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 ++++++
> > >  include/drm/drm_connector.h                        |  36 ++
> > >  10 files changed, 737 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> > > index 0f9590834829..caef14c532d4 100644
> > > --- a/Documentation/gpu/kms-properties.csv
> > > +++ b/Documentation/gpu/kms-properties.csv
> > > @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
> > >  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
> > >  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
> > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
> > >  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
> > >  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
> > >  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > index c31fc0b48c31..1465a7f09a0b 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
> > >  	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
> > >  	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
> > >  
> > > +	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > > +	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
> > > +		drm_printf(p, "\tbroadcast_rgb=%s\n",
> > > +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> > > +
> > >  	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
> > >  		if (state->writeback_job && state->writeback_job->fb)
> > >  			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index e69c0cc1c6da..10d98620a358 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -583,6 +583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
> > >  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> > >  					      struct drm_connector_state *new_state)
> > >  {
> > > +	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> > >  
> > > @@ -650,6 +651,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
> > >  int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> > >  					   struct drm_atomic_state *state)
> > >  {
> > > +	struct drm_connector_state *old_state =
> > > +		drm_atomic_get_old_connector_state(state, connector);
> > > +	struct drm_connector_state *new_state =
> > > +		drm_atomic_get_new_connector_state(state, connector);
> > > +
> > > +	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
> > > +		struct drm_crtc *crtc = new_state->crtc;
> > > +		struct drm_crtc_state *crtc_state;
> > > +
> > > +		crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > > +		if (IS_ERR(crtc_state))
> > > +			return PTR_ERR(crtc_state);
> > > +
> > > +		crtc_state->mode_changed = true;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index aee4a65d4959..3eb4f4bc8b71 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -818,6 +818,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> > >  		state->max_requested_bpc = val;
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		state->privacy_screen_sw_state = val;
> > > +	} else if (property == connector->broadcast_rgb_property) {
> > > +		state->hdmi.broadcast_rgb = val;
> > >  	} else if (connector->funcs->atomic_set_property) {
> > >  		return connector->funcs->atomic_set_property(connector,
> > >  				state, property, val);
> > > @@ -901,6 +903,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> > >  		*val = state->max_requested_bpc;
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		*val = state->privacy_screen_sw_state;
> > > +	} else if (property == connector->broadcast_rgb_property) {
> > > +		*val = state->hdmi.broadcast_rgb;
> > >  	} else if (connector->funcs->atomic_get_property) {
> > >  		return connector->funcs->atomic_get_property(connector,
> > >  				state, property, val);
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index d9961cce8245..929b0a911f62 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =
> > >  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> > >  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> > >  
> > > +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
> > > +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> > > +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> > > +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> > > +};
> > > +
> > > +/*
> > > + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
> > > + * @broadcast_rgb: Broadcast RGB selection to compute name of
> > > + *
> > > + * Returns: the name of the Broadcast RGB selection, or NULL if the type
> > > + * is not valid.
> > > + */
> > > +const char *
> > > +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
> > > +{
> > > +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> > > +		return NULL;
> > > +
> > > +	return broadcast_rgb_names[broadcast_rgb].name;
> > > +}
> > > +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> > > +
> > >  /**
> > >   * DOC: standard connector properties
> > >   *
> > > @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB
> > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > + *      Infoframes will be generated according to that value.
> > > + *
> > > + *      The value of this property can be one of the following:
> > > + *
> > > + *      Automatic:
> > > + *              RGB Range is selected automatically based on the mode
> > > + *              according to the HDMI specifications.
> > > + *
> > > + *      Full:
> > > + *              Full RGB Range is forced.
> > > + *
> > > + *      Limited 16:235:
> > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > + *              this works for any number of bits-per-component.
> > > + *
> > > + *      Drivers can set up this property by calling
> > > + *      drm_connector_attach_broadcast_rgb_property().
> > > + *
> > 
> > This is a good time to document this in more detail.
> 
> I have the feeling that it already is documented in more detail. But
> anyway, last time we discussed it the answer was basically to not bother
> and just merge the thing. So I'm getting some mixed signals here.

I'm all for merging and not trying to improve the property but
documenting it in more detail is definitely something I want to see.

> > There might be two different things being affected:
> > 
> > 1. The signalling (InfoFrame/SDP/...)
> > 2. The color pipeline processing
> > 
> > All values of Broadcast RGB always affect the color pipeline processing
> > such that a full-range input to the CRTC is converted to either full- or
> > limited-range, depending on what the monitor is supposed to accept.
> > 
> > When automatic is selected, does that mean that there is no signalling,
> > or that the signalling matches what the monitor is supposed to accept
> > according to the spec?
> 
> The doc states that "Infoframes will be generated according to that
> value". Is it ambiguous?
> 
> > Also, is this really HDMI specific?
> 
> Probably not, but it can easily be expanded to other connector types
> when needs be.
> 
> > When full or limited is selected and the monitor doesn't support the
> > signalling, what happens?
> 
> I would expect colors to be off
> 
> Maxime


