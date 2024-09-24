Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D069846D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DD610E2B3;
	Tue, 24 Sep 2024 13:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c7AqGC7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2A10E2B3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727185048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m3ZMnWSltBVqByR/5ym5WHRFLuJsdiXWp7fp/aKe+pg=;
 b=c7AqGC7Y7bjOsDGW+Rv6sKHEestkNaXyfZLpJlZszCYMbFd02IQBERJKAyUaqPNa8qDBjq
 aAOazIyKvc+UwI1vt1UOepLVJ8KO4WLVNrE3EJvMw1yD3g+CrOgDBK4gK+zkxd5zzcEuWp
 Mvbn901LuylsqrAsXnX+zpnwZCjmsHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-mOCq5XgwPaqrMCXvu55rQA-1; Tue, 24 Sep 2024 09:37:26 -0400
X-MC-Unique: mOCq5XgwPaqrMCXvu55rQA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cceb06940so39177135e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727185045; x=1727789845;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3ZMnWSltBVqByR/5ym5WHRFLuJsdiXWp7fp/aKe+pg=;
 b=Q59LV3T233sXZRKxANDXV1q4b/lFsZ/IehKA79CLcmkHIdCCYHXmrqM+1q0qK0sC9J
 WM1bS2lzhUVwvwoHZC6AuMlpSTLBi/TxthOs3awBq0B3wwhhukwcoMbMecHC45SST/fN
 NYgjKsJr+GXkp00MV7zUZnRNX/uW+8KhmOo7YiNn1fl/u9STLHJROAxpLfOCSWan/8sa
 3fCwLJPWPFnzxablv6NZk3St/CdtZtGVXcC6LUe6MIdnlKMrHsApI+6mwIVY/+Vek8g7
 9xxbA+6S/PoXtM8k10ULBMVZSVQzx5+NoPvxsOSScV0mK/5GpJjMFKyFOvrbRW+R/hQI
 WQ8w==
X-Gm-Message-State: AOJu0YyGH0xV9xPR/gkFujdBZdrfIyG18TueCJCwjyBMkcWr+M1nHRZH
 emgbwaCGria/+tctMlKC7e1thGcHyTyiBm1c74lIe6csatP3QdydGV4k5vmFRTWTBKkeqRnmpn8
 GYMghU6jwyjqgSgUqqxOsF/4YR0Uubgdr+64Nfm2nVrU/ii9b2e230DL7ZkCvbPhRPQ==
X-Received: by 2002:a05:600c:4ed2:b0:42c:b9dd:93ee with SMTP id
 5b1f17b1804b1-42e7adbdf3fmr106404165e9.34.1727185045161; 
 Tue, 24 Sep 2024 06:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAGSCJGChfO0p/dVmzD7aUd+YN0JjwCVik6wNggfJqRwa1bUk53dA48t1HKhd+ZLlCkGswjA==
X-Received: by 2002:a05:600c:4ed2:b0:42c:b9dd:93ee with SMTP id
 5b1f17b1804b1-42e7adbdf3fmr106403925e9.34.1727185044775; 
 Tue, 24 Sep 2024 06:37:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2c139esm1614306f8f.27.2024.09.24.06.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 06:37:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 chaitanya.kumar.borah@intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, Sam Ravnborg
 <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 stable@vger.kernel.org
Subject: Re: [PATCH] firmware/sysfb: Disable sysfb for firmware buffers with
 unknown parent
In-Reply-To: <20240924084227.262271-1-tzimmermann@suse.de>
References: <20240924084227.262271-1-tzimmermann@suse.de>
Date: Tue, 24 Sep 2024 15:37:23 +0200
Message-ID: <87ldzh8964.fsf@minerva.mail-host-address-is-not-set>
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

> The sysfb framebuffer handling only operates on graphics devices
> that provide the system's firmware framebuffer. If that device is
> not known, assume that any graphics device has been initialized by
> firmware.
>
> Fixes a problem on i915 where sysfb does not release the firmware
> framebuffer after the native graphics driver loaded.
>
> Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Closes: https://lore.kernel.org/dri-devel/SJ1PR11MB6129EFB8CE63D1EF6D932F94B96F2@SJ1PR11MB6129.namprd11.prod.outlook.com/
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b49420d6a1ae ("video/aperture: optionally match the device in sysfb_disable()")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info>
> Cc: <stable@vger.kernel.org> # v6.11+
> ---
>  drivers/firmware/sysfb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 02a07d3d0d40..a3df782fa687 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -67,9 +67,11 @@ static bool sysfb_unregister(void)
>  void sysfb_disable(struct device *dev)
>  {
>  	struct screen_info *si = &screen_info;
> +	struct device *parent;
>  
>  	mutex_lock(&disable_lock);
> -	if (!dev || dev == sysfb_parent_dev(si)) {
> +	parent = sysfb_parent_dev(si);
> +	if (!dev || !parent || dev == parent) {
>  		sysfb_unregister();
>  		disabled = true;
>  	}

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

