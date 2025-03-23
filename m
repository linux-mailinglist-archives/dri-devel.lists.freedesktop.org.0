Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E9DA6CE9F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0910E0D0;
	Sun, 23 Mar 2025 10:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GFgpFip7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580A110E0D0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742724656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BXl9GyVQdwlLt4k+hPv0mN15UAa6kqV0yN4st0Eg92g=;
 b=GFgpFip7n6l7yPaf4kbKMRbOosUrp/c8Hm+m3I9kka5v64x8qw4MaWYfOE5o+7IIC0EXG0
 EPPWO9eM4WWEr/0tH2/AC6KrIvng+VT5E4FmuW17DbwBU7S19V2Gv+2HL5YXZuUVMnmPmo
 DI4rGNpEDmC66PC2vJwp3Myn/7qz/sk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-54RDT5mnP4SARUxbVLfyIw-1; Sun, 23 Mar 2025 06:10:54 -0400
X-MC-Unique: 54RDT5mnP4SARUxbVLfyIw-1
X-Mimecast-MFC-AGG-ID: 54RDT5mnP4SARUxbVLfyIw_1742724654
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d51bd9b41so18314945e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742724653; x=1743329453;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXl9GyVQdwlLt4k+hPv0mN15UAa6kqV0yN4st0Eg92g=;
 b=NJnXgxCLNrKRpIvbIIHkWqMNeGE3ixXHl6YOZZ4/SWPNmzgXmiDqE8C5BueIMW/yzi
 DrBEnU+uZ/gCAT1Fy61OKVNxGKTMrYNrvci35phGHR6FntEx5yi7jmTvai+Us6CYkdM5
 Au0Pj9ElJqqXSHUuiUOEyA2vrF/8rpuD5yvVO9dsIheFQ8Zk47A8oFghPHW/SAvhgiUd
 zigId2sNNfACuvzD+Y03wEmycFqRQ6wG0XS4W7u2LZG4I8CKsBKHq18lN7q5xxW1kHHi
 kdkg2TnYCuGX6VaLaVSnmZnmCcc9y23tXPULFQ9RVZ1vQ7AeWRO5xjej1uLQXiyIjHMx
 vicA==
X-Gm-Message-State: AOJu0Yyd3YNqdHWAW22U4tq/hpCXG2B2dPxXCndNWUdLiB6g623AMXDk
 ROvrrTAxi2tRi5kvcp0oH4earcwxlUdPBhnMqCZVYHYRkeTE9UkywSp1Deo3DiVIwmNzilThXbA
 umI6bo67K+5rHeJkBkEsD7GK8ZLuIzu0BM2kFUYL2J6jjX23NeycW6wzOKKUJvzczrw==
X-Gm-Gg: ASbGnct7bmVgTt6t3/13ces8uROVitDQArfdQKbtKbcz6J+/modW1zI46cDWL29dBd3
 /5+SDuMZ9DvbOP4Ee1zjGbbf6lTAyhqXoX+tWUtblSpmP+o0bY23MQQcwbC3yIWgLLldyv+I2OP
 RdoNIPLtiTLgcgBySgDeUkAwmCT5s5kRzjacuutfE/6whMB0dMkUP+k8qtUKdsD/7iENBxxCw9i
 6gcrubL4exZqkwBzRsfkTepFzaJmZH0w+dtlW9UG3xsQtArkLCYaussuKNvqpf8yZ+bzAAwXszr
 ySLXVYhWD3MSQNClB2VU7NWy0fwwNAsuVRwlSPqZtYqt3oXK/8CCm2iwA/lZehfnWUJN0y6s5A=
 =
X-Received: by 2002:a05:600c:468a:b0:43c:ef55:f1e8 with SMTP id
 5b1f17b1804b1-43d509f4983mr82422625e9.13.1742724653561; 
 Sun, 23 Mar 2025 03:10:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnBgkawsccilJ6gtflli6TsgapqgogfWNhrjS1wx4oCyIoYzyNtrgztL2PYxPDN/9C2T5PFA==
X-Received: by 2002:a05:600c:468a:b0:43c:ef55:f1e8 with SMTP id
 5b1f17b1804b1-43d509f4983mr82422425e9.13.1742724653132; 
 Sun, 23 Mar 2025 03:10:53 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd27b59sm81446925e9.23.2025.03.23.03.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:10:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/18] drm/ofdrm: Remove struct ofdrm_device.pdev
In-Reply-To: <20250319083021.6472-2-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-2-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:10:50 +0100
Message-ID: <875xk0f45x.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2y-kqox68I-ISTINzB58ZCVje_Zy1RqZEUSnCb-SYWY_1742724654
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

> The field pdev is unused. Remove it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 13491c0e704a..7469dd281083 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -291,7 +291,6 @@ struct ofdrm_device_funcs {
>  
>  struct ofdrm_device {
>  	struct drm_device dev;
> -	struct platform_device *pdev;
>  
>  	const struct ofdrm_device_funcs *funcs;
>  
> -- 
> 2.48.1
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

