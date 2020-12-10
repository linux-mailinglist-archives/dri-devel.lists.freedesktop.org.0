Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F442D5B67
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 14:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703AB6E52C;
	Thu, 10 Dec 2020 13:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA36E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:13:57 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id s1so1257580oon.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5sfm6EnshXORkWdPVxI8hiVvmkfGtjORedBYlOnVwQ=;
 b=Fhwrz5PM2WSNDwvRtJbNtQAIdTgj15TDLlkAlKNp2twWxn3v6agx8jzyKSb7/7Jxlb
 krFqOTPA2VXPr0h88ILJxB+8pT5gUfhTRxtRKNv6jJbBz3XUtKEvUak5JFE4zfxNreRB
 pW6ccQJbGdX1kfoLxxYrANnjv/HkPtvnM3Ga8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5sfm6EnshXORkWdPVxI8hiVvmkfGtjORedBYlOnVwQ=;
 b=aQGWjypqlbjOmAn5e//vPA4BF00Tuta6WaiUF4KP9ikDzenvX95pEcnhDYGJsazl6C
 2wzXUry1kAIatA+bBiQXHICioejnGoRyTFT25sIXMaOYVooYFAwEeTc7O1y5LZke33RJ
 jc8uDdo/7I2vsq8BlBTuOLaSHlhd3qrqiqPlvHc98w4+J9B+/dbKgaiEB1rHhPwXUGCc
 WXuMB93OkBmT2qvjakMqeZ7FDngjXgRVPA9asQLjJcvCRHU/V9vIWqUU+dWbNnI3lrAU
 cdFmeu7OpXwbDf1/DDJh7o7h2db+2Is01wacclXgIE8HGTW0HnS83JlOuydqUxho/DDC
 fC2A==
X-Gm-Message-State: AOAM533+O1kWSLhHgW0HLBsGH6gCMEBDn/puDKY/dRi6Ex/9kkQy1MJD
 NeZtuV1FXI2/SnjL7zlqDJ5FqFIGQGTkJfI9uXvIiWQgIzY=
X-Google-Smtp-Source: ABdhPJwkXsq23hP3NsswdZFHYSs0gV4viorUFM5Rey8WOTXvrQffrI863frgjTSDQ15TzQPixQDGZFrfDtIRoNPHUh4=
X-Received: by 2002:a4a:c387:: with SMTP id u7mr946133oop.89.1607606036371;
 Thu, 10 Dec 2020 05:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-3-p.zabel@pengutronix.de>
 <20201209160508.GU401619@phenom.ffwll.local>
 <162b2aedea8790df6b7a06adcfaa3898bed03212.camel@pengutronix.de>
In-Reply-To: <162b2aedea8790df6b7a06adcfaa3898bed03212.camel@pengutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 14:13:45 +0100
Message-ID: <CAKMK7uH8pBVvcjNfUPPOkikrYQXv3gdSTS2C=Wo=6_LEonW2aQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/19] drm: add drmm_encoder_alloc()
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 12:59 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Daniel,
>
> thank you for the review. I'll work in all your other comments, there's
> just one I'm not sure what to do about:
>
> On Wed, 2020-12-09 at 17:05 +0100, Daniel Vetter wrote:
> [...]
> > > +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> > > +                      const struct drm_encoder_funcs *funcs,
> > > +                      int encoder_type, const char *name, ...)
> > > +{
> > > +   void *container;
> > > +   struct drm_encoder *encoder;
> > > +   va_list ap;
> > > +   int ret;
> > > +
> > > +   if (WARN_ON(funcs && funcs->destroy))
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +   container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > > +   if (!container)
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +   encoder = container + offset;
> > > +
> > > +   va_start(ap, name);
> > > +   ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > > +   va_end(ap);
> > > +   if (ret)
> > > +           return ERR_PTR(ret);
> > > +
> > > +   ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> > > +   if (ret)
> > > +           return ERR_PTR(ret);
> > > +
> > > +   return container;
> > > +}
> > > +EXPORT_SYMBOL(__drmm_encoder_alloc);
> > > +
> [...]
> > > + * @encoder_type: user visible type of the encoder
> > > + * @name: printf style format string for the encoder name, or NULL for default name
> > > + *
> > > + * Allocates and initializes an encoder. Encoder should be subclassed as part of
> > > + * driver encoder objects. Cleanup is automatically handled through registering
> > > + * drm_encoder_cleanup() with drmm_add_action().
> > > + *
> > > + * The @drm_encoder_funcs.destroy hook must be NULL.
> > > + *
> > > + * Returns:
> > > + * Pointer to new encoder, or ERR_PTR on failure.
> > > + */
> > > +#define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
> > > +   ((type *)__drmm_encoder_alloc(dev, sizeof(type), \
> >
> > Need to upcast with container_of or this breaks if the base class is in
> > the wrong spot.
>
> This is modeled after devm_drm_dev_alloc(). Like __devm_drm_dev_alloc(),
> __drmm_encoder_alloc() returns a pointer to the allocated container
> structure, not a pointer to the embedded struct drm_encoder. I think
> this direct cast is correct, unless you suggest that
> __drmm_encoder_alloc should return encoder instead of container?

Uh sorry, I misread and forgot how __devm_drm_dev_alloc works too.
Looks all correct.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
