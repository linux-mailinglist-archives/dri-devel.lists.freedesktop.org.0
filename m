Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2A94A3F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 11:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2ED10E487;
	Wed,  7 Aug 2024 09:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fiv2EC5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFA910E487
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 09:16:07 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5a2333c92ceso254821a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723022166; x=1723626966; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XQbny0HkjVuo6JfWA4Q5oAJp+UQNXy5jrTslbzHf0M8=;
 b=fiv2EC5IozG+djHhou5QGn8ntbDfk5KzI3/N9TvYGZA4CGRniDtI4o7h+DwYe9xgfX
 bBKbyqoGHnU9MekEFIKSLOs/P80I7x0syVZn69F36frhQkz12mi063iAjTeorCqFo0uN
 Y/tD17sSdR+Z7tE4U9FuHw/Vjc/Wso88E8G9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723022166; x=1723626966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQbny0HkjVuo6JfWA4Q5oAJp+UQNXy5jrTslbzHf0M8=;
 b=dt6rQPTS5ELiz6m2Ej1Q7aJ820MB1e4tWuUVio2E30O0MeFUGlUYLZj848D/kMjGtB
 18xnOYkHa3skLgqoruSgzeTnrbLVGpOGek2dhe7eR9gG99/L0U/r/C7XAfVO6AP9rBGB
 qFXg5/LCDD9vjBsKbd7/UX0oDq7BsBY+3Dogdszw4GosqIUTGldki3cHEb+PSiHwroOf
 6ANXCHUwIQ3JDwMmrMkR6A73q6YKNDu34CCX9dg7CDooO0O4nuX3uYOgIRSUAGXVi2QT
 xxygqo9MALK32Hp0/sCO+u+zYT8glcM8eVtNELcLqzeRt31JVtrDIFrn3aF1QRXyDTha
 ds2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3rvn1gvSlJkPp7IdMLfNGrg7C7IBZ9I+nx1OHLPInvAenFHa2fXIxNs3QOFIE0inVv7DomFyrFrRdmTi8j7BubQ8cCRY/p23pIsUqbgxY
X-Gm-Message-State: AOJu0Yy+XjR7PHhwSd/HL81uaTDLxJSKXMplkXrAv01KUsYqzLAqVSnP
 tgDIA79F8WZjfQQmu4D970DRuyTYeU6bP00d/d36kHkp14pxmgzzj9iuJuQJlTw=
X-Google-Smtp-Source: AGHT+IG5Gxll+yBRwsG4Zkqwt7fC2+iHTdUij87uBXtcj/5q0g/+ZwdHYR1UgJmWCL4YzTzWLngUhw==
X-Received: by 2002:a50:cd89:0:b0:5a1:dda5:229f with SMTP id
 4fb4d7f45d1cf-5b7f56fbe05mr7873419a12.3.1723022165418; 
 Wed, 07 Aug 2024 02:16:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83a03b514sm6851671a12.44.2024.08.07.02.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 02:16:04 -0700 (PDT)
Date: Wed, 7 Aug 2024 11:16:03 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/panic: Move copyright notice to the top
Message-ID: <ZrM7U55eze4_CUEC@phenom.ffwll.local>
References: <20240723091553.286844-1-jfalempe@redhat.com>
 <20240723091553.286844-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723091553.286844-5-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Tue, Jul 23, 2024 at 11:11:33AM +0200, Jocelyn Falempe wrote:
> Move the copyright notice to the top of drm_panic.h, and add the
> missing Red Hat copyright notice.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Patches 1-4 are Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
> ---
>  include/drm/drm_panic.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index a4bd3681920d..54085d5d05c3 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 or MIT */
> +
> +/*
> + * Copyright (c) 2024 Intel
> + * Copyright (c) 2024 Red Hat
> + */
> +
>  #ifndef __DRM_PANIC_H__
>  #define __DRM_PANIC_H__
>  
> @@ -8,9 +14,6 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_fourcc.h>
> -/*
> - * Copyright (c) 2024 Intel
> - */
>  
>  /**
>   * struct drm_scanout_buffer - DRM scanout buffer
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
