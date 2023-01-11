Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67826666104
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA3C10E7A1;
	Wed, 11 Jan 2023 16:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EECC10E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:55:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso13201098wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wMoQMQhB38nbcNla/KRz3O4QJ9q27t1i15WWEcz2Jmc=;
 b=lTrSYN/ycOKVefSYiUDi6rK+4awRhhWIhuFjdWOga20RotqekO7XjOtokkqEJCvg9v
 Xcn87Ryk2HVfq3p3V9ddCYllP50/GrSiJAeMHykifo1QFmrmYRSphjLsV644SMkKHF7S
 V9yG3sIPpDnILXz/ROfoIYQRSz0/XXefn1bF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wMoQMQhB38nbcNla/KRz3O4QJ9q27t1i15WWEcz2Jmc=;
 b=MpAlP9SLMrMWziPW+AxFYjlOWoCMvwJ+FfURIv4wQTyYvGlhs9Icl4C1pYgWpemhiH
 SdwlOTKL77lIJNVORGLjgkPMHppup2/PRst1BdEBrq+wyCXWrNecqQv5Vpr3joV9uDpq
 Gnpve5bqaWpDHiXfkXOr1f5Lf316octHnB6hmyl1JMewdzyywS8YohdRQk7cADR8TpSB
 x3XkzCJFMN6K2+06haTGibo4IRlq8B8f/JNir28Z9Nz8mpo8RxSRwY6QSrsaQpSNhaY5
 ZW4x2/VxTfx2XrB0yDmFdEJHJQfTwpJF2d+HmC67AmUA3u/7d8shfjPtfFZU8urxdMYH
 OGFQ==
X-Gm-Message-State: AFqh2kqITfDgo0I67x3kMzRHU4trTZOX34W2lqJXPFaT7EQYITRlSd75
 /NCYR2NKaeaPYKjQ6InVubDXEA==
X-Google-Smtp-Source: AMrXdXuH7F9Jvj2+GETMGkAU0b7SbfHCnmR86roP9bKzjfJPv40Q7aMZVHJzMhtfaFtf2sj6v3u0eA==
X-Received: by 2002:a05:600c:4fcc:b0:3d9:f91c:4bfc with SMTP id
 o12-20020a05600c4fcc00b003d9f91c4bfcmr5276949wmq.31.1673456120900; 
 Wed, 11 Jan 2023 08:55:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm23259500wmb.14.2023.01.11.08.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:55:19 -0800 (PST)
Date: Wed, 11 Jan 2023 17:55:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/11] video/aperture: Only kick vgacon when the pdev is
 decoding vga
Message-ID: <Y77p9rTAX2IG6WaY@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-5-daniel.vetter@ffwll.ch>
 <87119376-2813-f155-a2e1-006ffa382f12@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87119376-2813-f155-a2e1-006ffa382f12@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 05:03:02PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.01.23 um 16:41 schrieb Daniel Vetter:
> > Otherwise it's bit silly, and we might throw out the driver for the
> > screen the user is actually looking at. I haven't found a bug report
> > for this case yet, but we did get bug reports for the analog case
> > where we're throwing out the efifb driver.
> > 
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=216303
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> >   drivers/video/aperture.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> > index 3d8c925c7365..6f351a58f6c6 100644
> > --- a/drivers/video/aperture.c
> > +++ b/drivers/video/aperture.c
> > @@ -341,6 +341,9 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
> >   			return ret;
> >   	}
> > +	if (!primary)
> > +		return 0;
> > +
> 
> The original code from fbdev didn't do this, so this code didn't either.
> 
> It appears more to be a special case than an early-out branch. So can we
> write it as

Yeah I think this was a mistake going way back to when I added this to
i915 originally. It is a real change, but also I guess the people who have
machines without efifb or vesafb are ... really not many :-) Iirc you had
some very funny kernels going way back when vgacon was considered the only
safe choice to even hit this stuff.

> if (primary) {
>   // kick_vgacon
> }

Yeah, but next patch adds the vga aperture, and then I think it makes a
bit more sense.
-Daniel

> 
> ?
> 
> Best regards
> Thomas
> 
> >   	/*
> >   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> >   	 * otherwise the vga fbdev driver falls over.
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
