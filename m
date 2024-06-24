Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD5914639
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925A910E3D0;
	Mon, 24 Jun 2024 09:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="I3caW1oP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74D810E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:22:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4218e647d62so3624605e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719220942; x=1719825742; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Et+d0MzdKGzP2qwlgOja2wouceOR8AhOlBHu8kBvdu4=;
 b=I3caW1oP0i98EPxerYlwB7+7vKgscToCtnur/hklJlRTCHYqtFmxzMC+h1hFKrv9Tj
 lnknPTNZXNDBvyLNXGCpo+sQYph9wIYVmIRrzGXIasXwYLedNW+3zmo8ClAka6NIVYqE
 vVVpPSWf8ixpvpbtTPjQIBxy7IUeYo+yRAiCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220942; x=1719825742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Et+d0MzdKGzP2qwlgOja2wouceOR8AhOlBHu8kBvdu4=;
 b=eqWxrxfP1xH5u2r2MXEZTGkB2Ovdl7eEczOrteYjOvqN/jwDcHl4a5VYd/ch+4cVsv
 Opj0MSEWdSglmha2xakAYrR5CITZtEOxHGe5D97uzuwCRmEQaStgDzzOO5sHnAr+1xxp
 ftYIYoVu+cCf+yC7MlicOHypfLBx/Os30SkvQGEEGVQ8QRHBN2Df+iKe91Vamm+BfMqh
 TrSTarZlGoZwK+2W3ICAsbiFkNTI//MjMpXEd1r43zUMPZk32t9K/ML+6Rq/TXGd+bUP
 x4b2S1NCyPKlElmsZNpNKJ6/shgbNISRI7E3pnP7K26eZ76wvktw3CDZXtFDFgw3e+Xy
 B3SA==
X-Gm-Message-State: AOJu0YwDzA1AsJgEAYkY4ywj01ADz5qvMonxO5iHgeUdPhThvXBPPOnL
 n/r1bIyQRkhZpv0h6XDTBqhKpFyRbzuHSxGT2DmjXMeWfjUlau3XXFuFCn1cUi8=
X-Google-Smtp-Source: AGHT+IEHp+5NPv+1A7RzjGn132tVAWhgg0PbURlFYjxAl2b3SYYpLfK2F25Lc1LQWgurb0KZxaZn3A==
X-Received: by 2002:a05:600c:3b88:b0:424:8c1b:f873 with SMTP id
 5b1f17b1804b1-4248e3fe70emr25216995e9.4.1719220942079; 
 Mon, 24 Jun 2024 02:22:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c9818sm9454225f8f.107.2024.06.24.02.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:22:21 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:22:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/11] drm/sti/sti_hdmi: convert to struct drm_edid
Message-ID: <Znk6y4_attY361en@phenom.ffwll.local>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <dd1c232cb85d5e0815af73c918953fa3b852baa2.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1c232cb85d5e0815af73c918953fa3b852baa2.1715691257.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, May 14, 2024 at 03:55:08PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> The functional change is that the CEC physical address gets invalidated
> when the EDID could not be read.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 500936d5743c..3b62ec2d742f 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -974,28 +974,32 @@ static const struct drm_bridge_funcs sti_hdmi_bridge_funcs = {
>  
>  static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
> +	const struct drm_display_info *info = &connector->display_info;
>  	struct sti_hdmi_connector *hdmi_connector
>  		= to_sti_hdmi_connector(connector);
>  	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	int count;
>  
>  	DRM_DEBUG_DRIVER("\n");
>  
> -	edid = drm_get_edid(connector, hdmi->ddc_adapt);
> -	if (!edid)
> -		goto fail;
> +	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_adapt);

I think you can use drm_edid_read here since the ddc is correctly set up
with drm_connector_init_with_ddc()

> +
> +	drm_edid_connector_update(connector, drm_edid);
>  
> -	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
> +	cec_notifier_set_phys_addr(hdmi->notifier,
> +				   connector->display_info.source_physical_address);
> +
> +	if (!drm_edid)
> +		goto fail;

Unless I missed something, all the functions can cope with a NULL edid,
but this jump means in the failure case you'll return stack garbage in
count. Just drop this check?

>  
> -	count = drm_add_edid_modes(connector, edid);
> -	drm_connector_update_edid_property(connector, edid);
> +	count = drm_edid_connector_add_modes(connector);
>  
>  	DRM_DEBUG_KMS("%s : %dx%d cm\n",
> -		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
> -		      edid->width_cm, edid->height_cm);
> +		      info->is_hdmi ? "hdmi monitor" : "dvi monitor",
> +		      info->width_mm / 10, info->height_mm / 10);
>  
> -	kfree(edid);
> +	drm_edid_free(drm_edid);
>  	return count;

With the two items addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  fail:
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
