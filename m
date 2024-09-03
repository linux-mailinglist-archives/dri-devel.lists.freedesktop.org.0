Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926439699EE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 12:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C6C10E3B2;
	Tue,  3 Sep 2024 10:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XP5//rKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5610E266
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725358721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75hetENG4bc9yz1UukUCeOeiMHbzLEjg9bZNv+FtxvI=;
 b=XP5//rKxky3jmX/OUdmB6owSsPTFhKKV8obrMKjoVo/31/Q2F17vJ4EQXIEDcWLKqjmdxU
 7fgpIvDQlSUuViSWEa6mF+RRHM2VRbAdxuU1FdBH1IKGw3s/+f7jdErVVGmgd23SF8U645
 XIggygB3qXzUDIiTeazph3uoq+KU5YI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-LJx-WNg6M4iRRePMfS6x2w-1; Tue, 03 Sep 2024 06:18:40 -0400
X-MC-Unique: LJx-WNg6M4iRRePMfS6x2w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3730b54347cso3165606f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 03:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725358719; x=1725963519;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=75hetENG4bc9yz1UukUCeOeiMHbzLEjg9bZNv+FtxvI=;
 b=LTWr5SQbfVe9DGHBNfGDj2wfhS1Mz6tjG7V9fuYS7T3DoA8DLcURIoTzQ+3r9fPQtk
 sPdOY2Ng5NIxvULL3cG9xP7R8eyKoAUUPAMGcdmnJQ4CaMynv/I7FJOh3FZQGPGHmQuE
 sGUQ5isOF+6zvhA16P0eM58yxmHe9CndsGpEahpmMK9T5pZ7zkFEZodJkgElhmwkhRn7
 uouNMeX7P27+3DrYtV5gJXeUiavPq0W7sFWsx8I+L6H4jTKGZtnf6X6hoiDp/X7KaLYK
 drkSuBQoiqfCuL70hIxB+eDGijeQnqxnhbN/p2AHIHjaILopgT67ZK18/y9wf7/43I8U
 79Dw==
X-Gm-Message-State: AOJu0YycBuqsgXCUw3oj15ikYiwGyEWwzHJ0O2Nhuzdna+jaa9KqKG/5
 NulGd1hQ/tkTtDl5TsKg32djCiSvpB8OKIXHd7XAwEDvC026SbO4nteyYDqH9iDl0fO5KonHUhx
 p4MI4XtKrY1sKh4FZprHzMbYj2RSkV7GtBU7ddqkgP1UTmLY8LPm1JmFHChrb2xPvGg==
X-Received: by 2002:adf:9b93:0:b0:374:badf:966f with SMTP id
 ffacd0b85a97d-374ecc67b7fmr1995918f8f.7.1725358719261; 
 Tue, 03 Sep 2024 03:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8XHGNTolKI2k2kU/2hdxDQmpWW5estcVlaB0VFBow/EbJyd891aWev9zy/gYfhTBe2Uad5Q==
X-Received: by 2002:adf:9b93:0:b0:374:badf:966f with SMTP id
 ffacd0b85a97d-374ecc67b7fmr1995895f8f.7.1725358718785; 
 Tue, 03 Sep 2024 03:18:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df79b6sm165328715e9.22.2024.09.03.03.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:18:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 02/81] drm/fbdev-helper: Set and clear VGA switcheroo
 client from fb_info
In-Reply-To: <20240830084456.77630-3-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-3-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 12:18:37 +0200
Message-ID: <87mskpghvm.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Call vga_switcheroo_client_fb_set() with the PCI device from the
> instance of struct fb_info. All fbdev clients now run these calls.
> For non-PCI devices or drivers without vga-switcheroo, this does
> nothing. For i915 and radeon, it allows these drivers to use a
> common fbdev client.
>
> The device is the same as the one stored in struct drm_client and
> struct drm_fb_helper, so there is no difference in behavior. Some
> NULL-pointer checks are being removed, where those pointers cannot
> be NULL.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index af1fe79c701d..13095d38aa42 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -562,8 +562,12 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
>   */
>  void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>  {
> -	if (fb_helper && fb_helper->info)
> -		unregister_framebuffer(fb_helper->info);

I'm not sure if we can assume these won't be NULL... AFAICT some drivers
still have their own struct drm_client_funcs vtable and could potentially
pass a NULL struct drm_fb_helper ?

If you think that's safe to do this and the function semantics should be
changed, then I think that the kernel-doc needs to be updated:

- * @fb_helper: driver-allocated fbdev helper, can be NULL
+ * @fb_helper: driver-allocated fbdev helper, must not be NULL

Other than that, the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

