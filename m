Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E81A6CEDF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFCA10E1A2;
	Sun, 23 Mar 2025 10:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XJSvjcJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D5B10E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742727474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m88yLYqVOoL4ZL8f5qJ1IIToIdq2WjHT04RPagWCTO4=;
 b=XJSvjcJnw/q0RBRrBjveJ/6qxmDkudh/8wbm1unclZdE+CAFidcHu8a4mtHjAAjoXxnBao
 vMvSVAbfuEYSSt4J7gd5QhgeYc/nRdDtHsWiX2PlzVWI9bxavFIJcFBW6YLFzfpDDFln7a
 tzPGDbXMWLyGXjsJfLj7FE4tCIvWeYQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36--QcolaBxP5C_5A3iuWU-1g-1; Sun, 23 Mar 2025 06:57:52 -0400
X-MC-Unique: -QcolaBxP5C_5A3iuWU-1g-1
X-Mimecast-MFC-AGG-ID: -QcolaBxP5C_5A3iuWU-1g_1742727471
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-438e4e9a53fso19826225e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742727471; x=1743332271;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m88yLYqVOoL4ZL8f5qJ1IIToIdq2WjHT04RPagWCTO4=;
 b=bc1NPyJ8dNsActRMUPS9QFHsaRPYTtzr+0r02F1QeaanwfKQIa3ROblsLJq7IsV50g
 t+vptcy+arc5vQ6j+m8TBc0p8gGGXoZAE0k/lmGu8zvyG32e/pVnZC5SmU1L4UXtKEfB
 ni1QV3TMxFEB2ZzF9v02VM455VnHQidMJ936iF25YB7EVwkPYeTbgrX0WY1HXPHqviS0
 78+82W2cWzZDdZKJGUW56RqybEcZOgKKaCr+K6niHmdO0X4MxOay1Q0Jcoyw/J5Uu7Sr
 thx3sYcKqXdK0q87Txz2LUrODOvULEMw1fciSZNG3xMLGxdjOQCb5zNS7kosc9VQRd/D
 wESQ==
X-Gm-Message-State: AOJu0YxhYkA9bxBvORpi10Hc0dfxxwgqiQkFzl38bW+8BhtzKSsf9R+S
 YnNN9HkxxB+43sMhFXzuXyFzNL6bct1lmcXgnRN2xxMGf5XVKoCcg+vYzb6iCEQc8XNCkNYZ8Vd
 vB7werRPfDAE1WsJ944ASY8d863zRJCYFF37WqgEQvXZ9m1q3+ZmYP3PRiIhdNJZPkA==
X-Gm-Gg: ASbGncsA56Np/crJXCNcLpJTwxorPV+RJz0N/CYkB95TR1soShVTN913U/9wao1mo21
 cjNtlG/wWUIyGX9Yi8N/yIgCdQi51bMIKwC6gY3e+nmJuYVbXrvqDO1PzAzQ3E/chbAVtBvOBVz
 LJJdzLjH9uxkkR/gmDLPFM3b9n9s3W6g9wqT6FVj+C3O/Lf/ai/f34wN7ojfOf0CFPwGTlXw2Nc
 Eck1yK9/7BaDIK5cPTJZh1vc00EMTTrXl6I14BkJWUWbv4/H6phLx7wj0BgKGUv3HSpd3zYXqqi
 BJMFYkGIwjfwhOUakYCYy0mDg2oIA0X01NxbV/wyy4DHtqLxnYOIa5YgQMmIWj6xOUwIJ/4QIQ=
 =
X-Received: by 2002:a05:600c:1c18:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-43d5ddec8f2mr30949135e9.18.1742727471387; 
 Sun, 23 Mar 2025 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuzWydQK1/I03UAx/MFH2jFLfajbV/wQQr3YJTDWp6BHT9etiVtNRPauk46cUMw5aX4q9cIw==
X-Received: by 2002:a05:600c:1c18:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-43d5ddec8f2mr30948955e9.18.1742727470914; 
 Sun, 23 Mar 2025 03:57:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9eb21sm82288865e9.32.2025.03.23.03.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:57:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 08/18] drm/sysfb: Merge connector functions
In-Reply-To: <20250319083021.6472-9-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-9-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:57:49 +0100
Message-ID: <87ldswdnf6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: be5pxLMZGwxAZKoP3F4YFf2hGZrN5fE2hNZoajY7xeE_1742727471
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

> Merge the connector functions of ofdrm and simpledrm. Replace the
> code in each driver with the shared helpers. Set up callbacks with
> initializer macros.
>
> No effective code changes. The sysfb connector only returns the
> preconfigured display mode.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

...

> +#define DRM_SYSFB_CONNECTOR_FUNCS \
> +	.reset = drm_atomic_helper_connector_reset, \
> +	.fill_modes = drm_helper_probe_single_connector_modes, \
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state
> +
>  /*

...

>  static const struct drm_connector_funcs ofdrm_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> +	DRM_SYSFB_CONNECTOR_FUNCS,
>  	.destroy = drm_connector_cleanup,

Why not include the .destroy callback in DRM_SYSFB_CONNECTOR_FUNCS ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

