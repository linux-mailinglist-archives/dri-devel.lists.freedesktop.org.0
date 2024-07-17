Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DB933F46
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60D10E29C;
	Wed, 17 Jul 2024 15:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="foxULe5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAC10E29C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:10:05 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ee9bca8675so11035341fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721229004; x=1721833804; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wn4TP8PBVroM1jvpw0ODPErzX1wcuSE2iey02MAd1Zg=;
 b=foxULe5Pg4W4QHguhd5Y7gvj07DizdDOpBM1PYoRUNquifVt8Vaes1/evrQ8O824bC
 3nl0mqZaJisiUwuZMZ+MWx7x9Wt+iCYTM97hcr03OCrlSHsXeEHEuRvypMDFAIrfItsf
 a0BPVu8sy98aNrORN8jituBXljryRS/UpTdT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721229004; x=1721833804;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wn4TP8PBVroM1jvpw0ODPErzX1wcuSE2iey02MAd1Zg=;
 b=IAmGOwyXJ0p7+rTUXyZDXaU0NRRP1ar8D+bMUhPfj/GKw5CqwDkDo6z4+iq2ghQcfw
 XWRY7Ik9EeLk+GpurOKlr08LBzHmqEULPdJt+JjCKWtPCF5tqk22a7oa0X0GQ6KouJi9
 wnhY5QPv9FsL2zbIRJSRLL79328d4lnqyjUJURn9qe/9B8/ccmJT872V1sCM0Dtswm30
 nERVFg5p154jxA1bkttOGu7zGKjrzwjFrhpxRCvMVU38+E7ZGW2BnxMIGfvvIuOUFTjo
 2CuVFujQKWO/a1+mqjUOjlg1UMHnBeVyP99EFSUTVboLSdSU6KLRDXv1lq2a4o2JlwE/
 8OhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaM6kwLPiMa74blobPnga1dpmRybNpZb5LdtEugiugQTbORIRS78cpaDvqEx8ism3SujKMriW1t1kLCmoBvfv2KTV7U651VLxqV1EyQtQ/
X-Gm-Message-State: AOJu0YwHs8koNA0EQYAufCwX+/Gt18Z8cYRk5cZRmCtAHNI5bUkYXh3r
 SplEqZj9Uk8w7ZoEg2PyjXFAtlR2Cdm9ELUsGV+smsu5Z5P3F/4dL3jfcKzx+YY=
X-Google-Smtp-Source: AGHT+IFERPpApl0DTzfYtP7vReuydD6LyFVwPjkdroK6PS8C1ELiGKXsed2rqK8YbNxdsN3KnCok/A==
X-Received: by 2002:a05:651c:1a0c:b0:2ec:18c7:169d with SMTP id
 38308e7fff4ca-2eefd0b8418mr8758821fa.1.1721229002527; 
 Wed, 17 Jul 2024 08:10:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c7814203sm1212865e9.45.2024.07.17.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:10:01 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:09:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panic: Remove build time dependency with
 FRAMEBUFFER_CONSOLE
Message-ID: <Zpfex7mO2JcdVHWe@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-4-jfalempe@redhat.com>
 <87wmlk49ed.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmlk49ed.fsf@minerva.mail-host-address-is-not-set>
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

On Wed, Jul 17, 2024 at 12:09:46PM +0200, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> > Now that fbcon has the skip_panic option, there is no more conflicts
> > between drm_panic and fbcon.
> > Remove the build time dependency, so they can be both enabled.
> >
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> >  drivers/gpu/drm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 6dd0016fc9cd..a22cab218004 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
> >  
> >  config DRM_PANIC
> >  	bool "Display a user-friendly message when a kernel panic occurs"
> > -	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> > +	depends on DRM
> 
> This is great. Thanks for finding an alternative approach! I don't see any
> issues this time, because there is no locking involved. But let's see what
> others think about it.

Looks like it should work, I did check the history of fbcon_is_active and
we've used that to force/disable panic output for fbcon in the past. So I
think it's the right tool.

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
