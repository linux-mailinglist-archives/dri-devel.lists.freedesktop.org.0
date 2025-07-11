Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8234B01BE0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A9910EA36;
	Fri, 11 Jul 2025 12:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JaylaLtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E010EA37
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752236660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xUgL9Dz+oW7+DeOz096RSABhOz6S9pVb8w5EfdNrkv4=;
 b=JaylaLtPaTDjc+PHIa3GgyAc2cNqqJrybtR2DXAQ/+tFI+saxZH71BbtZMA8UgE5xo3ojp
 B14v5WAr/B90yyxSdz0zXnQNjeP0jj9wgaBKrKycRm5SiHoa28ovcSLszhb1pE+qBNrHl8
 1EAbGd+RPrClKTKGCVbHOzAbr8QQOVs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-G_XkLB0ONDaTfP53I2vfxA-1; Fri, 11 Jul 2025 08:24:19 -0400
X-MC-Unique: G_XkLB0ONDaTfP53I2vfxA-1
X-Mimecast-MFC-AGG-ID: G_XkLB0ONDaTfP53I2vfxA_1752236658
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b4a0013c0dso950810f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752236657; x=1752841457;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUgL9Dz+oW7+DeOz096RSABhOz6S9pVb8w5EfdNrkv4=;
 b=tKy/BTzs15ZlHKhjtNUa8wkLyZjMWKdjYqwp8sHHgGWunGRsaKydHjVjKY4UdgdgRk
 b3dexcvP68CvBub0v+rVpg6ZQAdizZ4RFoZB9DvBdeORngylHnnoot+GarWJWw3ofaum
 ZD/r+B55h1JGGxh9v2RMc68uSu66nkGuP56l895IN2DWL/o/EkzMNXfu+c6VPV9ZYSt6
 NEZ4itqr1P4eC5NaKZ1lxgCCGyAjLSU/bWEFMYxOPf7MlpHP1SN1nHRa/hQPpCzM1J9F
 8NfOBtHC5q57slIzs2U99GEC9/FW6PQdIaWiFaJObRaMxqp1Z1GJtmb7FKNpjX13tw6x
 WvXQ==
X-Gm-Message-State: AOJu0Yyd/5RRYWNGR1yP8OEJkLeNSv26MKkg0AhOyXs4Gp3oamW0+Io/
 qLkSzAB9TOvVJNbnYb85dFgucMqJIjwDvex0Df71b2OastuBQoBa2bwFOj6XuSXYzByDwoIuehp
 qmRnzoWYkoFn8tflbjqhYTmKmp3lTxGyeg2jk3gYfkqVlf0xGihSJKN9oFtkQ1zrXjtPBCSujNN
 TTqg==
X-Gm-Gg: ASbGnctB5k5ETaNr+vRSv+XjT7iFB4azlmsdks0L+Vxh8WLvylXbuKmE9vRkfeKz8AO
 LxAXvNe/y9hFBX91MKJ13L3VfEegGCN5GxEv4LSbmU1DP0wXEjyVce5/+6CKdG0EV8D8ybTZcKf
 Y13qtk0ggIcGjU8LAAfBZWhg+ecPRQhA9jj480MkE7MLNePaNmE/V1FIY1gcFpzzpCLaEz90w3m
 Hj51GqQis0rsctWQko844BiRx8qO4BWaRemCpPi8r7BNo8jQoEi2dW7m5i6rj/6NlAiipdbBy6+
 sjPmM7+OsDOK9uUF/8zoGWtrX2kHp1kwYe/t20IuR6xmRLkYfP7VC9J4nn0oeRfhuzolavP5JjD
 2XDUEFAtsjZ67Ui5rdGrx2g==
X-Received: by 2002:a05:6000:2b11:b0:3a6:d92d:9f7c with SMTP id
 ffacd0b85a97d-3b5f187e900mr2146211f8f.9.1752236657233; 
 Fri, 11 Jul 2025 05:24:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGILWtjbjeXj6ovdqZxVf3VjVvrQMhFPqeg4Us2t84C25RVQp1c6exggIJW+x7QmM/3aqlLdg==
X-Received: by 2002:a05:6000:2b11:b0:3a6:d92d:9f7c with SMTP id
 ffacd0b85a97d-3b5f187e900mr2146188f8f.9.1752236656657; 
 Fri, 11 Jul 2025 05:24:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d719sm4361069f8f.54.2025.07.11.05.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:24:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/9] drm/color-mgmt: Prepare for RGB332 palettes
In-Reply-To: <20250617143649.143967-6-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-6-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:24:15 +0200
Message-ID: <87ple6ex00.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1U8uzenvreZty_mC6hASPr4xjpqcdVcqEbsf8-Xqdgo_1752236658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add helper drm_crtc_fill_palette_332(), which fills palettes with
> RGB332 color data. Each color in RGB332 format serves as an index
> into an 8-bit palette that stores the corresponding component-based
> colors.
>
> Vesadrm will use the new helper to emulate RGB formats on top of
> framebuffers in C8 format.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 32 ++++++++++++++++++++++++++++++++
>  include/drm/drm_color_mgmt.h     |  1 +
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 37a3270bc3c2..7ef214848313 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -817,6 +817,38 @@ void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *
>  }
>  EXPORT_SYMBOL(drm_crtc_load_palette_8);
>  
> +static void fill_palette_332(struct drm_crtc *crtc, u16 r, u16 g, u16 b,
> +			     drm_crtc_set_lut_func set_palette)
> +{
> +	unsigned int i = (r << 5) | (g << 2) | b;
> +
> +	r = (r << 13) | (r << 10) | (r << 7) | (r << 4) | (r << 1) | (r >> 2);
> +	g = (g << 13) | (g << 10) | (g << 7) | (g << 4) | (g << 1) | (g >> 2);
> +	b = (b << 14) | (b << 12) | (b << 10) | (b << 8) | (b << 6) | (b << 4) | (b << 2) | b;
> +
> +	set_palette(crtc, i, r, g, b);
> +}

I think this helper can benefit of having a kernel-doc or some code
comments, e.g:

          /* Calculate the 8-bit palette index from the color components */
          unsigned int i = (r << 5) | (g << 2) | b;

          /* Expand R (3-bit) G (3-bit) and B (2-bit) values to 16-bit depth colors */
          r = (r << 13) | (r << 10) | (r << 7) | (r << 4) | (r << 1) | (r >> 2);
          g = (g << 13) | (g << 10) | (g << 7) | (g << 4) | (g << 1) | (g >> 2);
          b = (b << 14) | (b << 12) | (b << 10) | (b << 8) | (b << 6) | (b << 4) | (b << 2) | b;

          /* Call the drivers' specific callback to program the hardware LUT */
          set_palette(crtc, i, r, g, b);

It might be evident to you, but I don't think it will be for others looking
at the code later.

The code itself looks good to me, if I understood it correctly :)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

