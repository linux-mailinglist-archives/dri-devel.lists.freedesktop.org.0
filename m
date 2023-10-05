Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F197B9D48
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5A10E3FA;
	Thu,  5 Oct 2023 13:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E410E3FA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696511917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IwqSs3+/DmPy4uBb2/Z1zLNoXvAigFYFMa6dXUuHSsw=;
 b=hV12M9we/a2PPr7BBPsyGXNyvP+p2seBJAt90jHLHNrL7eiizkwwqCmgnLNKmavaZUijr2
 KQqD2T1nN7TglEbgn1Y2H1G2/OjjLLxtaiNA1SMhnezu9R99mfJkOeej/L66pBfeecVVo2
 WB5DW+XrhWuZjbgEQKlloelzludYxfk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-nErQRrj8O9OCh2ElhfdkpA-1; Thu, 05 Oct 2023 09:18:35 -0400
X-MC-Unique: nErQRrj8O9OCh2ElhfdkpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4054016ff33so4925115e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696511914; x=1697116714;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwqSs3+/DmPy4uBb2/Z1zLNoXvAigFYFMa6dXUuHSsw=;
 b=UyxCZTjMXDnqyHFWv5RPkuA/GIfLFXMdDJV9XHN3hhY/ayaG6txGVSfGU8aA/kASvp
 OmitVlPifycIhGDqmK2hrCnPSb+HdwDXCDdPhmfRNdO0Zd39npQXhH0+aLCbTqyOva9Y
 FUexIVo60Yf5u9Js8ra3nsKERlDFatxSHIDZxqH/avnTQzvkGocPHtWe+AMGyATIzrXy
 N7xfHzCjOiSBfQfIlQ0SUAYjFtT3hMUJVYyG7DsLSyrftxTqgNlLejYHkA8BJgnCET5x
 tVRisQ/oJdquLLQG50PgPJK0gAfWZK0ZwBkReZKid4py1KiZLvezET+xCbDOKbSOsPR0
 zyPQ==
X-Gm-Message-State: AOJu0YxzNTbiqcAe62oyfsySkPxCh+kROFkjMx+YR7YTEVPxej/FopMe
 MZ7qzPPNhuBEBE1KiWPOVJ4MZS0C/+6ZDhHYhIjrU0oyJbZYyeYPQshjQzA1/aXf7O2VYVwxdDV
 s29im54Lio15mOopsnz0g+Cen+++x
X-Received: by 2002:a05:600c:21d7:b0:406:45c1:4dd with SMTP id
 x23-20020a05600c21d700b0040645c104ddmr1439986wmj.14.1696511914701; 
 Thu, 05 Oct 2023 06:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErjYacLBg82C+9YjgKi/Jm5saEdIW4LKTkywsq/1FR/ujCssLbmny2rAsEIpmTagMdkfs1cw==
X-Received: by 2002:a05:600c:21d7:b0:406:45c1:4dd with SMTP id
 x23-20020a05600c21d700b0040645c104ddmr1439966wmj.14.1696511914343; 
 Thu, 05 Oct 2023 06:18:34 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z7-20020a7bc7c7000000b003fee567235bsm3782885wmk.1.2023.10.05.06.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 06:18:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
In-Reply-To: <20231005090520.16511-2-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-2-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 15:18:33 +0200
Message-ID: <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hold temporary memory for format conversion in an instance of struct
> drm_format_conv_state. Update internal helpers of DRM's format-conversion
> code accordingly. Drivers will later be able to maintain this cache by
> themselves.
>
> Besides caching, struct drm_format_conv_state will be useful to hold
> additional information for format conversion, such as palette data or
> foreground/background colors. This will enable conversion from indexed
> color formats to component-based formats.
>
> v3:
> 	* rename struct drm_xfrm_buf to struct drm_format_conv_state
> 	  (Javier)
> 	* remove managed cleanup
> 	* add drm_format_conv_state_copy() for shadow-plane support
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +/**
> + * drm_format_conv_state_init - Initialize format-conversion state
> + * @state: The state to initialize
> + *
> + * Clears all fields in struct drm_format_conv_state and installs a DRM
> + * release action for the buffer. The buffer will be empty with no
> + * preallocated resources.
> + */
> +void drm_format_conv_state_init(struct drm_format_conv_state *state)
> +{
> +	state->tmp.mem = NULL;
> +	state->tmp.size = 0;
> +	state->tmp.preallocated = false;
> +}
> +EXPORT_SYMBOL(drm_format_conv_state_init);
> +
> +/**
> + * drm_format_conv_state_copy - Copy format-conversion state
> + * @state: Destination state
> + * @old_state: Source state
> + *
> + * Copies format-conversion state from @old_state to @state; except for
> + * temporary storage.
> + */
> +void drm_format_conv_state_copy(struct drm_format_conv_state *state,
> +				const struct drm_format_conv_state *old_state)
> +{
> +	state->tmp.mem = NULL;
> +	state->tmp.size = 0;
> +	state->tmp.preallocated = false;
> +}
> +EXPORT_SYMBOL(drm_format_conv_state_copy);
> +

I'm confused, the copy helper is the same than init. What's the point of
this function ? Why not just call drm_format_conv_state_init() from the
__drm_gem_duplicate_shadow_plane_state() function in the next patch ?

Other than that the patch looks good to me. After fixing the issue that
Noralf pointed out:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

