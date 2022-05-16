Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F889528571
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4B1122A5;
	Mon, 16 May 2022 13:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06311122A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652708062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb/8An3mqSgld1P6n0OvlMOR0nMhCH6RoPrboPbM3tA=;
 b=YlaEj9WJlboTb0DlL7mDLukJ/Dn2psBDSLI5WoKWgesm34UJFoPKrRO3yrzDCGEiO4EzPs
 BDD+IHVL1MrEp9m35VgKQ11ucKeCvRFIdsEmvJNqRp+s2RsdsdKtAQQvr/6GK13Jb86vqB
 NXav1OgKN5jDVHy7t5A9PRFP3s0FcwU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583--bmypdjbO86_9EgYapaN5w-1; Mon, 16 May 2022 09:34:21 -0400
X-MC-Unique: -bmypdjbO86_9EgYapaN5w-1
Received: by mail-wm1-f70.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so6782710wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nb/8An3mqSgld1P6n0OvlMOR0nMhCH6RoPrboPbM3tA=;
 b=QMFwUhd3seLRQkbeSb/Ins3FyekV+n+NewBXGBGaVqAcVb7HBmczD9dTCsoAJnv4mF
 gnzYP5nzdTce3ETvsJwP10igaAdAOJtWNQXKp1Cxko8GlDgr1JfQhzo3MHbsUISty/Wi
 X79SrLuK701JQ5frZ1E7v45DNfBxl1K/ABzeyxuy3BMKYF/hu+H/Vi52nTOBATCeIzk+
 V0ybM/l36GcpNavyJGw4plB69i+/lcPEE9GA8rV/wC6q4/3BM7JWVdo6beoEi2Vs8BiB
 HFgVr1ZeI2noExOFUDtDPGB4Xv3oVDk9P6006Xj5f3re3nK5oeT4+p2U8GTaVkNnLjS/
 GBlA==
X-Gm-Message-State: AOAM5307Fv7UQf3+xxfwf/Ay2AQUjqe/sVt+B5RPSrXWebMbVJTLrcEZ
 sZKr3CCyp8ABQ6zl7Fs5JCuPpepjSKgthWUxpnPudwJVw5YaF2TRquuDGEU12E/1+3SnSsBumm2
 2XkEaD3QPTLX95zUU8lIworDa6aJc
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr27543944wmc.135.1652708060167; 
 Mon, 16 May 2022 06:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaOii4zBMfMZg+KccYJvrGK2M6c6adlM61FVirK/FYUsD8wwCFrZHtg4GbQyWNzzMNqmPIkA==
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr27543926wmc.135.1652708059912; 
 Mon, 16 May 2022 06:34:19 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v15-20020adf8b4f000000b0020d0c48d135sm1948567wra.15.2022.05.16.06.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:34:19 -0700 (PDT)
Message-ID: <196da052-6251-af7d-fb00-7e8cfdb43708@redhat.com>
Date: Mon, 16 May 2022 15:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] drm/gem-vram: Ignore planes that are unused by
 framebuffer format
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509081602.474-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 10:16, Thomas Zimmermann wrote:
> Only handle color planes that exist in a framebuffer's color format.
> Ignore non-existing planes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> @@ -673,7 +679,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
>  err_drm_gem_vram_unpin:
>  	while (i) {
>  		--i;
> -		gbo = drm_gem_vram_of_gem(new_state->fb->obj[i]);
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (!obj)
> +			continue;
> +		gbo = drm_gem_vram_of_gem(obj);
>  		drm_gem_vram_unpin(gbo);

The code in this error path to unpin the GEM vram objects...

>  	}
>  	return ret;
> @@ -694,16 +703,19 @@ void
>  drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
>  				     struct drm_plane_state *old_state)
>  {
> -	size_t i;
> +	struct drm_framebuffer *fb = old_state->fb;
>  	struct drm_gem_vram_object *gbo;
> +	struct drm_gem_object *obj;
> +	unsigned int i;
>  
> -	if (!old_state->fb)
> +	if (!fb)
>  		return;
>  
> -	for (i = 0; i < ARRAY_SIZE(old_state->fb->obj); ++i) {
> -		if (!old_state->fb->obj[i])
> +	for (i = 0; i < fb->format->num_planes; ++i) {
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (!obj)
>  			continue;
> -		gbo = drm_gem_vram_of_gem(old_state->fb->obj[i]);
> +		gbo = drm_gem_vram_of_gem(obj);
>  		drm_gem_vram_unpin(gbo);

... and this, seems to be basically the same.

So maybe as a follow-up you can do a similar cleanup like you did in patch
1/4 and use a helper function to handle both.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

