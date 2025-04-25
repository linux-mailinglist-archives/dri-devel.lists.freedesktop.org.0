Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE0A9BF7F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B63110E89C;
	Fri, 25 Apr 2025 07:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aztSutTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4910E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745565337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7r2z4B/7Mbfi0IDabIkh3LojKAky8fE2btyGmdHAwA=;
 b=aztSutTDHJkoAecXau3x00BDNCwCuaHQGYcZytPO1LZz7RuVUmsh8laG2D2DyA6HOPWmyB
 nXR3qigfxi/CKmmYRNthtuEH0STEM5mx3vZdcXjD85+I/JH/PxoNtu2zCcfCYSeeeXZdPz
 NqiRstkxHvb4b+Y4Q+FMDXw0iedhuY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-Jse5A9i5N2CyIYrvm8EgAQ-1; Fri, 25 Apr 2025 03:15:33 -0400
X-MC-Unique: Jse5A9i5N2CyIYrvm8EgAQ-1
X-Mimecast-MFC-AGG-ID: Jse5A9i5N2CyIYrvm8EgAQ_1745565332
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso11373445e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 00:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745565332; x=1746170132;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T7r2z4B/7Mbfi0IDabIkh3LojKAky8fE2btyGmdHAwA=;
 b=m+Ma5WakEOfgaaaGudt+qlWO+xzSYzB6VLrthNpm9unwoeCN0sAnt7EvXJUyIEffK/
 4O5CpIJwfomLyGOu+VKcpCfiqn6AHvk5M75aQqywUy00HRhNZK+tpreEiRecQnlptXza
 ZHzogQ/cZw69enA9ZwP1gud2ZNTtQvF2zLTCuTj5H2iedXsKS83xsNWak86ECSellojP
 +wUC9TkIL4eePWuolGMzQPGWqxQZYprn56GXqMi+3X71yd0HFi2EInAvLm4z1zrZz/iP
 2WK03I2lwDflemauXHAbkoYFrIAvZPdHq8CpYstb6iC3hxdWUgk2Yw3nBmGvUH0Tid7T
 jzXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4NlIVttYN9oNmCr5QAFircW5Hlg/mMwlTzqcOMRbwuH1Y3LMu2JbVp3gWFrzuHk9qbnD3HPVb0oM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrGBvZpwCat6ncyP22Pc3NdYbViOads+hxI5p/W6PiPuItNjk0
 g0CNsCfQa/25P3YqR8nWYrfZnXP37hpc9Kq6+sIg/S9LXhQVT+HvJ7pPNhurGyTF7cWfIzWh+TN
 gzEJ33HdqXcb/FpZhMXJmRWWzFfkKn8sGmrIAlMcCTpV9gTMB4pAGaJGfW8U43LlVZw==
X-Gm-Gg: ASbGncvz00gqVwa+E9i6/8kGpSavcUso5V5DAnbuz9WTENQIwvYnOfQx/C4XZ4rKCJE
 3D5GQYYwblEzdiXWWJtAmh+6R5DaeXz9b9l+ktkmYKCH304YYKhhY4Pt8HHUmSIr8QrZOEmoZQt
 fN9cGMQwAf2oJ64Nd9sxBILiY3otJyIlzETrlelbA3s/cNO5G2WKcmr8feLJmn8JSG06HOjBocj
 dnT0sUc8BKQAtoILvOv47/gczhoI1V3H3ycI/I4j4j3utMnPLJq5qZqDI/zipIbgZAWd7DcroV/
 pmtCy3oN/3xnwksMAktyr2WxXP8UYiRKge0dZpc2d4SLm/vNlJzcNhIw0vWJn9rXNFrCew==
X-Received: by 2002:a05:6000:186c:b0:39f:fcb:3bf6 with SMTP id
 ffacd0b85a97d-3a074e0dfccmr653957f8f.2.1745565332264; 
 Fri, 25 Apr 2025 00:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKjltySyoEEsZUoyQAjvToSkGsH8mjTJtTxmkBO665sLQSkBEEV6kyM0pGb2qhN8WQSJn6fQ==
X-Received: by 2002:a05:6000:186c:b0:39f:fcb:3bf6 with SMTP id
 ffacd0b85a97d-3a074e0dfccmr653934f8f.2.1745565331871; 
 Fri, 25 Apr 2025 00:15:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca543bsm1492506f8f.34.2025.04.25.00.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 00:15:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
In-Reply-To: <20250425063234.757344-1-ryasuoka@redhat.com>
References: <20250425063234.757344-1-ryasuoka@redhat.com>
Date: Fri, 25 Apr 2025 09:15:29 +0200
Message-ID: <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DgpeQdvAZxJJ4gRI0cU-EnqIhBmAImzsWHey5OfufYw_1745565332
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

Ryosuke Yasuoka <ryasuoka@redhat.com> writes:

Hello Ryosuke,

> Drop simple-KMS in favor of regular atomic helpers to make the code more
> modular. The simple-KMS helper mix up plane and CRTC state, so it is
> obsolete and should go away [1]. Since it just split the simple-pipe
> functions into per-plane and per-CRTC, no functional changes is
> expected.
>
> [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@suse.de/
>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>



> -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
> -			       struct drm_crtc_state *crtc_state,
> -			       struct drm_plane_state *plane_state)
> +static const uint32_t hyperv_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t hyperv_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +

I think the kernel u32 and u64 types are preferred ?

> +static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *state)
>  {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> -	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct hyperv_drm_device *hv = to_hv(crtc->dev);
> +	struct drm_plane *plane = &hv->plane;
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_crtc_state *crtc_state = crtc->state;
>  
>  	hyperv_hide_hw_ptr(hv->hdev);
>  	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
>  				crtc_state->mode.hdisplay,
>  				crtc_state->mode.vdisplay,
>  				plane_state->fb->pitches[0]);
> -	hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
>  }
>  
> -static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> -			     struct drm_plane_state *plane_state,
> -			     struct drm_crtc_state *crtc_state)
> +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					      struct drm_atomic_state *state)
> +{ }
> +

Why do you need an empty CRTC atomic disable callback? Can you just not
set it instead?

>  
> -static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *old_state)
> +static void hyperv_plane_atomic_update(struct drm_plane *plane,
> +						      struct drm_atomic_state *old_state)
>  {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> -	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(old_state, plane);
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct drm_plane_state *state = plane->state;

You should never access the plane->state directly, instead the helper
drm_atomic_get_new_plane_state() should be used. You can also rename
the old_state paramete to just state, since it will be used to lookup
both the old and new atomic states.

More info is in the following email from Ville:

https://lore.kernel.org/dri-devel/Yx9pij4LmFHrq81V@intel.com/

>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>  	struct drm_rect rect;
>  
> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +	if (drm_atomic_helper_damage_merged(old_pstate, state, &rect)) {

I know that most of the simple-KMS drivers do this but since this driver
enables FB damage clips support, it is better to iterate over the damage 
areas. For example:

	struct drm_atomic_helper_damage_iter iter;
        struct drm_rect dst_clip;
	struct drm_rect damage;

	drm_atomic_helper_damage_iter_init(&iter, old_pstate, state);
	drm_atomic_for_each_plane_damage(&iter, &damage) {
		dst_clip = state->dst;

		if (!drm_rect_intersect(&dst_clip, &damage))
			continue;

                hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->data[0], &damage);
                hyperv_update_dirt(hv->hdev, &damage);
        }


Other than these small comments, the patch looks good to me. So if you take
into account my suggestions, feel free to add:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

