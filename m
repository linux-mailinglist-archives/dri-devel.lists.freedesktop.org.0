Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A590143E509
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83E6E994;
	Thu, 28 Oct 2021 15:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5C76E994
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:24:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z14so10878211wrg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tv2oay0BJwn9J4qOktOFDlX3UCtKb/zY1x+VfaeHlvA=;
 b=PqYOXRiakc6910z5E0b0jhDIseWTs/ati5gqTU2+KetsIuYl+LCKRSuA9DnUF04DTG
 a3Tb+crbiPS8wQY10mICkzNWU3BwKVElwV0Xu51Np4GyP/K37nlp6VuGsNB/3vBr+hWO
 wPGvjGXCGyoRsCmBnz3uBRYuNqYbbaK562IXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=tv2oay0BJwn9J4qOktOFDlX3UCtKb/zY1x+VfaeHlvA=;
 b=a9B5TkbEJ3hFtsPGteHDJoinKnm4ZaifFnX3aaU5JByIJ/uoK/4er72vrFuO2+xe+r
 KBqpsBLy2CKK/rTuyGZv2+PqCcHhy5gTVNHc28aH3G9vC6JWuH54i2xEDiqEE3FkxMKT
 tRB0Yo51sAnP1/S5moWlkJOjg49PCbGT/ka4vK5VdOSkNLCPDQeI3RkYIvspVLuF/oFZ
 gtyU6p/A3x0NkAYgWo3oo2sOqWuAHG9wy7GtRdlPJ84Juak7HAXKgG78EkIzdoHFilAW
 w0r0HjlD3LHwXn0o/PpwNUdoe88N+Pzp2XIWIqMlrHBoCe1viCfFAYx6j01aVsmDSbBr
 XDog==
X-Gm-Message-State: AOAM5313jk5mmc+CYaj2jfhlZWA0NoSWLgQ6/6Gfs4uTVnK6gimcErYl
 /gD7lgpJguLWRlz7rzOQHu2b+cZSHcNRtw==
X-Google-Smtp-Source: ABdhPJyoOV0TArYwFSys/pEgfWguKwZVtXaxh2rVmLpBFDFOkvNOyx2RNdVA2wiYCMc2yoJTXJQT8A==
X-Received: by 2002:a05:6000:15cc:: with SMTP id
 y12mr6643371wry.333.1635434654399; 
 Thu, 28 Oct 2021 08:24:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n68sm6474347wmn.13.2021.10.28.08.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:24:13 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:24:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
Message-ID: <YXrAm6d6ALx0aciQ@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook>
 <YVXJLE8UqgcUNIKl@phenom.ffwll.local> <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <ca11cd15-3877-468b-c6b7-9022b6b11824@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca11cd15-3877-468b-c6b7-9022b6b11824@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Wed, Oct 27, 2021 at 03:19:34PM +0200, Javier Martinez Canillas wrote:
> On 10/27/21 14:18, Arnd Bergmann wrote:
> 
> [snip]
> 
> > Right, how about this change on top?
> > 
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -117,9 +117,8 @@ config DRM_DEBUG_MODESET_LOCK
> > 
> >  config DRM_FBDEV_EMULATION
> >         bool "Enable legacy fbdev support for your modesetting driver"
> > -       depends on DRM
> > -       depends on FB=y || FB=DRM
> > -       select DRM_KMS_HELPER
> > +       depends on DRM_KMS_HELPER
> > +       depends on FB=y || FB=DRM_KMS_HELPER
> >         select FB_CFB_FILLRECT
> >         select FB_CFB_COPYAREA
> >         select FB_CFB_IMAGEBLIT
> > 
> > That would probably make it work for DRM=y, FB=m, DRM_KMS_HELPER=m,
> > but it needs more randconfig testing, which I can help with.
> 
> Looks good to me as well.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Is the mess I created sorted now, or something for me to do? I'm terribly
burried in stuff :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
