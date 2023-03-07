Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BA6AF5E1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 20:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8A10E2FA;
	Tue,  7 Mar 2023 19:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C3A10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 19:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678217925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/YUSlzGSxs7xfAmVqcyYxvP2dLSzFAel7vgkTdgImg=;
 b=bz8VtTZxZOqv7aCCkuzyXvNQpPcFWuSkxKN1dkbDtf+nD3+bv5a20n03cVPRVQ0n8xpNoG
 xafSaOJfcV/+Hs4B7JJEW3gjeODczNZ1paCbQkaI8/6uV9Qp6TVpjhVLF0ombk0P+RDqAD
 TuNF9yAN4CKUqW7imUhYZ6pysSro7XE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-tyXDivCFMe-K7VP7WmZXUA-1; Tue, 07 Mar 2023 14:38:44 -0500
X-MC-Unique: tyXDivCFMe-K7VP7WmZXUA-1
Received: by mail-wr1-f72.google.com with SMTP id
 y11-20020a056000168b00b002ce179d1b90so2429149wrd.23
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 11:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678217923;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/YUSlzGSxs7xfAmVqcyYxvP2dLSzFAel7vgkTdgImg=;
 b=UHuoVcNBaLTVhSMVb4UjEPcsRKAKzNlcBmi1V4UFpiSZ6FJRbK081/O01K4gFBViVI
 4jd9BXk5W3zKBziU7dPWpy6Rlfug+HUF/ZoEbCFHHPHISpWW9gUnWQF9PJ/H7JbiCg31
 V/PRZKuCRkvn0GB9vDXMM0t2G9TGxVaHr+nYvLz7iSpU3xx+pfj/3jb3oF9pLXLiqtEW
 xgOQtYjcygi3C5XogON9Vwo1TCcbYMb4d6DvlLMPzzZqT+oBXfLscFx0C1/CA09PrZHG
 PnPtx1tByQgLcpgaqjSBw/hqBDMjlWAA84MXN96WfledQDeVqdd9JnGGQ1yplwHogU0i
 ImIg==
X-Gm-Message-State: AO0yUKVOthSqqfYhG8VUjAxbaKJAsZFO9UtC5AIQTSq/Th1gCooOqON1
 5JsT65Zv9cDl3RfzU/hAYiP/WOwintQcN53+EHiJ4sejE4BiS0VVOXSJu1oLYTTpAzyv/7yb9SA
 C44TyL/wm/fhfvteCBrvah9UKLeku
X-Received: by 2002:adf:f686:0:b0:2c8:4bca:7fc6 with SMTP id
 v6-20020adff686000000b002c84bca7fc6mr10651782wrp.62.1678217923050; 
 Tue, 07 Mar 2023 11:38:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9sqRaaWvCx+trk5j4xJ2KdsZv3yIUH6ggRbuzt8JftvpnJP95RYmY0cynhbzEW7TAtVGwuTg==
X-Received: by 2002:adf:f686:0:b0:2c8:4bca:7fc6 with SMTP id
 v6-20020adff686000000b002c84bca7fc6mr10651766wrp.62.1678217922739; 
 Tue, 07 Mar 2023 11:38:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002c7163660a9sm13254454wru.105.2023.03.07.11.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 11:38:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/format_helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
In-Reply-To: <20230302200131.754154-1-arthurgrillo@riseup.net>
References: <20230302200131.754154-1-arthurgrillo@riseup.net>
Date: Tue, 07 Mar 2023 20:38:41 +0100
Message-ID: <87lek81hdq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Arthur,

Thanks a lot for your patch!

Arthur Grillo <arthurgrillo@riseup.net> writes:

> Extend the existing test cases to test the conversion from XRGB8888 to
> monochromatic.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

[...]

> +static size_t conversion_buf_size_mono(unsigned int dst_pitch, const struct drm_rect *clip)
> +{
> +	if (!dst_pitch) {
> +		unsigned int linepixels = drm_rect_width(clip) * 1;
> +
> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> +	}
> +
> +	return dst_pitch * drm_rect_height(clip);
> +}
> +

I don't think you need a new helper only for this. There are other
formats that have sub-byte pixels, so you may want to instead make
the existing conversion_buf_size() function more general.

Could you please base on the following patch that I just posted?

https://lists.freedesktop.org/archives/dri-devel/2023-March/394466.html

I believe with that you should be able to drop this format specific
helper and just use the fourcc DRM_FORMAT_C1 instead.

[...]

>  
> +static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_mono_result *result = &params->mono_result;
> +	size_t dst_size;
> +	u8 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size_mono(result->dst_pitch, &params->clip);
> +

Then here you could just do:

	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch,
				       &params->clip);

If you do that, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

