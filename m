Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AC155BF8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9076EB00;
	Fri,  7 Feb 2020 16:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087666E0AF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 16:39:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t23so3242866wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XVUWQ66dkvZlVhMgAVolskWz95Cn5Ra1ERHvEZJqaYU=;
 b=imdJYPDbxgBxcEGy5/0Fk4y4lA24If9JaSQrfXeb+ytYxtCY1ZgjtUpQeE864ZDIzy
 Lu3Tx+FuAhR7qSTfNnXKIbP/MqXPOa59h+zX85TpuYlao7pRQTUqS16GpykN5X2FSwc0
 5eJZDPwFl92R1CJPMbybP52FwJ67VubAdrl24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XVUWQ66dkvZlVhMgAVolskWz95Cn5Ra1ERHvEZJqaYU=;
 b=uW2KPlT6KniLw4DLpbR/wXOvJKKg9ClUG3q68lAfWHHD1EoUaErg5vEstJ5UALS5Fo
 U6U4E9NiZncNMRp030No1O5DDOa57XNAZU9qzHLp7jQS3KQpmNV64jHYxDxxZLsCyiPy
 vsntdwVMl2s3yMyNFLqfdFvXQSpBZLAQkKq0P0mGpuSdzF9ymeIx+43O+fB/mdQc+L4Q
 HM0H2k0nZhctq800osV+7f4ws+dPqSwr8jgGp7n3CCrp5ctvIVeZxr1ZLwMug8/TNv6R
 1o81Ak1lIo+BVmAzNkn247lIX7tbtTyobTNBknbC22G+WmKgrxi+xbfRfhI6woJ50rRq
 yQ8g==
X-Gm-Message-State: APjAAAUOGDWLVvx1leajOKT3VK6QGrnr7YwppqXNSnADgu7tMdOWsEFX
 SgIGzh8cxeY89GXpFn/9vYUo9Q==
X-Google-Smtp-Source: APXvYqw9hxfRNiAA9wvQJLL6hjC6m8Fm4Fbnb48eJnmgfAxBUDtG1TcxAhMDLP7HlXHXWqmu2KZwBw==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr5210736wmc.123.1581093568714; 
 Fri, 07 Feb 2020 08:39:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a22sm4076271wmd.20.2020.02.07.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:39:27 -0800 (PST)
Date: Fri, 7 Feb 2020 17:39:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 6/6] drm: Validate encoder->possible_crtcs
Message-ID: <20200207163926.GN43062@phenom.ffwll.local>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207135950.6655-7-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 03:59:50PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> WARN if the encoder possible_crtcs is effectively empty or contains
> bits for non-existing crtcs.
> =

> TODO: Or should we perhapst just filter out any bit for a
> non-exisiting crtc?
> =

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

From a quick grep it looks like at least most drivers seem to get this
right. Worth a shot to find the hold-outs.

Two things:
- Imo also best to move into the drm_mode_config_validate I suggested.
- Please update the kerneldoc for drm_encoder.possible_crtcs to mention
  that this will WARN if you get it wrong (and maybe remove the line that
  most drivers screw this up).

Check itself lgtm.
-Daniel

> ---
>  drivers/gpu/drm/drm_encoder.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index bc2246f27e0d..f16b2a2518d7 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -107,6 +107,23 @@ static void validate_possible_clones(struct drm_enco=
der *encoder)
>  	     encoder->possible_clones, encoder_mask);
>  }
>  =

> +static void validate_possible_crtcs(struct drm_encoder *encoder)
> +{
> +	struct drm_device *dev =3D encoder->dev;
> +	struct drm_crtc *crtc;
> +	u32 crtc_mask =3D 0;
> +
> +	drm_for_each_crtc(crtc, dev)
> +		crtc_mask |=3D drm_crtc_mask(crtc);
> +
> +	WARN((encoder->possible_crtcs & crtc_mask) =3D=3D 0 ||
> +	     (encoder->possible_crtcs & ~crtc_mask) !=3D 0,
> +	     "Bogus possible_crtcs: "
> +	     "[ENCODER:%d:%s] possible_crtcs=3D0x%x (full crtc mask=3D0x%x)\n",
> +	     encoder->base.id, encoder->name,
> +	     encoder->possible_crtcs, crtc_mask);
> +}
> +
>  int drm_encoder_register_all(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
> @@ -115,6 +132,7 @@ int drm_encoder_register_all(struct drm_device *dev)
>  	fixup_possible_clones(dev);
>  =

>  	drm_for_each_encoder(encoder, dev) {
> +		validate_possible_crtcs(encoder);
>  		validate_possible_clones(encoder);
>  =

>  		if (encoder->funcs->late_register)
> -- =

> 2.24.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
