Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE859029F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8C11B3D5;
	Thu, 11 Aug 2022 16:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A03214AC29
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:11:44 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id j8so34323711ejx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=LEZOE0Zt4s9PCFiKFwKYRDr114AmkBBPDRdQoJzg3yY=;
 b=LoZkUtf5xb8gMd6GN3/nO/n1py2Og5JC5zdDRm8vx7llsnHr+1KIC171liULEbmot5
 VBfKEU1S/2YtzlEkYUoZYafjv2UsYl0vFEKeRj3essa3WmKld/4ZAFVCpyozdfroy2ql
 z7CCAVaTuWDBXLuznzbB4azxbiwFfC0QaA35U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=LEZOE0Zt4s9PCFiKFwKYRDr114AmkBBPDRdQoJzg3yY=;
 b=hRVI2SmNOpjHKHd9MoCOal/TK9946TNliO4oeMUx8imjHZt3Jp4LDjZqeS3wbIKF6x
 +bCVaW9ddOouB9dQtD73rEpxh+5DATmQTTBQLbfAoRBHD2QzKiO4RKpBxleaUcGL6Gzr
 k1934XZ7B7l2L6ntWUCjz0ZqMfq9/qRGie2P5rjfed6EIQFX+xAV6Tf8Gh7KrCPcyH8X
 bnvjjj8hMhxVn7B5RlgQnJn58PYF7qTsLK0Lie7WJaF78uoWl6gPfPQtDp6gKglfTooB
 aQuyBxKuF9kULa6HQQmzM1RM/hjYymR18AMMqmE18mc2QEfPXRZKC+Z0mXOu5QtIuzhC
 4Wkw==
X-Gm-Message-State: ACgBeo1Cf5q9bUIhaJkSukj9msvcqPdaTZ5/wTUZ8z2rfU8TOoHVYRQt
 MmIsnvgQSe0lCPFW655lsBGC2g==
X-Google-Smtp-Source: AA6agR66L82QusO6KrB9+U3SJWdVMGMWDY+DvWnD4qEGwK4ex8vWC3yUtjD00Z3O76kxXxSBatkgMg==
X-Received: by 2002:a17:907:2d2b:b0:731:2179:5ba with SMTP id
 gs43-20020a1709072d2b00b00731217905bamr19660655ejc.207.1660234302668; 
 Thu, 11 Aug 2022 09:11:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090626ca00b0072ed9efc9dfsm3679678ejc.48.2022.08.11.09.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:11:41 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:11:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
Message-ID: <YvUqPL5l8/+XbvaQ@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
 <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
 <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 09:59:39AM +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Wed, Aug 10, 2022 at 5:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Jul 08, 2022 at 08:20:46PM +0200, Geert Uytterhoeven wrote:
> > > Add a helper to retrieve the actual number of bits per pixel for a
> > > plane, taking into account the number of characters and pixels per
> > > block for tiled formats.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -370,6 +370,25 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
> > >  }
> > >  EXPORT_SYMBOL(drm_format_info_block_height);
> > >
> > > +/**
> > > + * drm_format_info_bpp - number of bits per pixel
> > > + * @info: pixel format info
> > > + * @plane: plane index
> > > + *
> > > + * Returns:
> > > + * The actual number of bits per pixel, depending on the plane index.
> > > + */
> > > +unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
> > > +{
> > > +     if (!info || plane < 0 || plane >= info->num_planes)
> > > +             return 0;
> > > +
> > > +     return info->char_per_block[plane] * 8 /
> > > +            (drm_format_info_block_width(info, plane) *
> > > +             drm_format_info_block_height(info, plane));
> >
> > Do we really needs this for blocky formats where this is potentially
> > ill-defined? I think if there's no need then this should also return 0
> > when block_width/height != 1, it doesn't make much sense to compute bpp
> > when it's not really bits per _pixel_.
> 
> Yes, we do need this.  For low-color formats, the number of bits
> per pixel is less than eight, and block_width is larger than one.
> That is actually the point of this patch.

Hm right, I didn't realize that this is how we have to describe the
formats with less than 8 bpp.

I think we can include them easily with a check for char_per_block == 1
and then making sure that the division does not have a reminder (just in
case someone does something really funny, it could e.g. be a 332 layout or
something like that for 3 pixels).

> > Minimally this needs to check whether the division actually makes sense or
> > whether there's a reminder, and if there's  reminder, then fail. But that
> > feels like a bad hack and I think we should avoid it if it's not
> > absolutely necessary.
> 
> Looking at drivers/gpu/drm/drm_fourcc.c, the only supported format
> where there can be a remainder is P030, which has 2 spare bits per
> 32-bit word, and thus is special anyway.
> Still, 4 * 8 / 3 = 10, so you get the correct numbers of bits for
> the first plane.  For the second plane, you get 8 * 8 / 3 = 21,
> but as .is_yuv = true, you have to divide that result by two again,
> so you get 10 again.

Yeah I don't think we should describe these with bpp or cpp or anything
like that. bpp < 8 makes sense since that's how this has been done since
decades, but trying to extend these to funny new formats is a bad idea.
This is also why cpp and depth refuse to compute these (or at least
should).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
