Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8593905F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 16:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E50210E0CB;
	Mon, 22 Jul 2024 14:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fv7SU93I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C5C10E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 14:13:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-426659ff58bso5013225e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721657581; x=1722262381; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tgbm5Spa6iNkRq2Ux0zzj+WvaN7ol/xJ5I1VMsf8wA=;
 b=fv7SU93IlJ1cq//qAs/UJbCaNU0DKBGpLvmX5qVeWsQdsdI6RACMHCdiyBXeiaJygc
 zC5LL7nn5M78epVtNkJFnTGxmSd82w+CR7ev5U1ZclcLGa4WKKmJUYIlHEK6LZGjYmzu
 awf7BkhqMaU3ypCk/urL6+0LmvqrSpKeyG/uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721657581; x=1722262381;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Tgbm5Spa6iNkRq2Ux0zzj+WvaN7ol/xJ5I1VMsf8wA=;
 b=E+o4nMM3FtGBVXjOVJ7vqF86eMZ4N7O1UCrxt2jH5QXsCTvss8QwaPRHQZVKcz+KIN
 CimOcUqOvjX2yM4H4Nz7F3uiXHfCIhN1ebmVF0NN4soh1zUhoqEnP726l/XMBS9dm0r9
 vKw4k14po9o3ndtDF7iC7vjs+IUIRZtpMvOyJCAxM6zsNQM7tsWixcDliJNvfqkTXT36
 f0AlFD5pLPVNsSP023/jboHYNKt4bstn6WrS+BA7QckzUiU2Z1RaphDXh2F+mdEUaix+
 KmiQkhY7j/g7bLuUM7nvnL2LFW+oACy7DByPQSNPaHnLMa1Z1/i6W+BIJRkakCm2pESL
 700A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCoPYt0GKRDv7Ri4eYv+qQ7zjg8kEtLns4UcIVsnlRyfGjoLyqZq0t4qlh1/jt+ssJ7ORazS0blJYcMJZcRSt4py5L1nnQjqjvCFugXes6
X-Gm-Message-State: AOJu0YykzE3cOsZ5++uS+ZrVjSLCj+B9zP7DzTChFniWQCBd4p+bpgoO
 bLM1FeejzclVv36EA3ghXK661bebiMPOAlrNs2Z/NSS1Lxdn90rSHtwFuUCuh40=
X-Google-Smtp-Source: AGHT+IEWsvPxVi7zS2plkJNlwJ+meC0H3C4mcFP8YEp/srMJx9fmtOr9AjHG6UxguTL2eGdmswxsrw==
X-Received: by 2002:a05:600c:4f4b:b0:427:9f71:16ba with SMTP id
 5b1f17b1804b1-427daa927f5mr33298725e9.5.1721657580586; 
 Mon, 22 Jul 2024 07:13:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6901781sm129162825e9.14.2024.07.22.07.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:12:59 -0700 (PDT)
Date: Mon, 22 Jul 2024 16:12:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
Message-ID: <Zp5o6fnBuTlxm-X_@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
 <ZpfeiMj48JQTQcOE@phenom.ffwll.local>
 <34305c58-38a6-4b5a-9777-69833aefa003@redhat.com>
 <60419d31-f467-4277-97da-23c9573af2bf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60419d31-f467-4277-97da-23c9573af2bf@redhat.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Thu, Jul 18, 2024 at 11:30:05AM +0200, Jocelyn Falempe wrote:
> 
> 
> On 18/07/2024 09:04, Jocelyn Falempe wrote:
> > 
> > 
> > On 17/07/2024 17:08, Daniel Vetter wrote:
> > > On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
> > > > It allows to check if the drm device supports drm_panic.
> > > > Prepare the work to have better integration with fbcon and vtconsole.
> > > > 
> > > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
> > > >   include/drm/drm_panic.h     |  2 ++
> > > >   2 files changed, 22 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> > > > index 948aed00595e..d9a25c2d0a65 100644
> > > > --- a/drivers/gpu/drm/drm_panic.c
> > > > +++ b/drivers/gpu/drm/drm_panic.c
> > > > @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct
> > > > drm_plane *plane, int index)
> > > >   static void debugfs_register_plane(struct drm_plane *plane,
> > > > int index) {}
> > > >   #endif /* CONFIG_DRM_PANIC_DEBUG */
> > > > +/**
> > > > + * drm_panic_is_enabled
> > > > + * @dev: the drm device that may supports drm_panic
> > > > + *
> > > > + * returns true if the drm device supports drm_panic
> > > > + */
> > > > +bool drm_panic_is_enabled(struct drm_device *dev)
> > > > +{
> > > > +    struct drm_plane *plane;
> > > > +
> > > > +    if (!dev->mode_config.num_total_plane)
> > > > +        return false;
> > > > +
> > > > +    drm_for_each_plane(plane, dev)
> > > > +        if (plane->helper_private &&
> > > > plane->helper_private->get_scanout_buffer)
> > > > +            return true;
> > > > +    return false;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_panic_is_enabled);
> > > 
> > > This feels like overkill since you currently only have one user in the
> > > fbdev emulation code, but maybe useful in some other places ...
> > > 
> > > > +
> > > >   /**
> > > >    * drm_panic_register() - Initialize DRM panic for a device
> > > >    * @dev: the drm device on which the panic screen will be displayed.
> > > > diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> > > > index 73bb3f3d9ed9..c3a358dc3e27 100644
> > > > --- a/include/drm/drm_panic.h
> > > > +++ b/include/drm/drm_panic.h
> > > > @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
> > > >   #ifdef CONFIG_DRM_PANIC
> > > > +bool drm_panic_is_enabled(struct drm_device *dev);
> > > 
> > > Since it's internal only, this should be in
> > > drivers/gpu/drm/drm_crtc_internal.h and not int he include for drivers.
> > 
> > Yes, that makes sense, drivers won't need that API.
> > 
> > > With that:
> > > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > >   void drm_panic_register(struct drm_device *dev);
> > > >   void drm_panic_unregister(struct drm_device *dev);
> > > 
> > > These two are only used in drm.ko. Can you please move them to
> > > drm_crtc_internal.h too and drop the EXPORT_SYMBOL in a follow-up patch?
> > > We're trying to limit the exported interface and official headers to
> > > really only the pieces drivers actually need.
> > 
> > Sure, I'll add this to my next drm_panic series.
> 
> I think this also applies to drm_panic_init() and drm_panic_exit(), that I
> introduce in my QR code series:
> https://patchwork.freedesktop.org/patch/604890/?series=135944&rev=2
> I will move them to drm_crtc_internal.h

Yup.
-Sima

> 
> > 
> > > 
> > > Thanks, Sima
> > > 
> > > >   #else
> > > > +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> > > >   static inline void drm_panic_register(struct drm_device *dev) {}
> > > >   static inline void drm_panic_unregister(struct drm_device *dev) {}
> > > > -- 
> > > > 2.45.2
> > > > 
> > > 
> > 
> > Best regards,
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
