Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2F6F108A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44310E332;
	Fri, 28 Apr 2023 02:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481C10E332
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 02:53:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec816c9d03so10359085e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650398; x=1685242398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vE9mFufVuuEPPpiBANamP0U11FQw7anKRzvG/pfu02E=;
 b=EFzcDt96e/aN9ZTndsXJqr06UVEDqd0+mTbcPXxvBiQPbHBgTitS8merGxKtQHMQHF
 6yWwq1BJIXLhWEemY9l1NeEzXxwBJe26p20Wzc42NnnyzEmN0hcuD0bl2BdGjOY9RjF/
 GaazsvskhL0V5K/KryiBZ6uU6EWASG4Ss3zXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650398; x=1685242398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vE9mFufVuuEPPpiBANamP0U11FQw7anKRzvG/pfu02E=;
 b=kWtVqxyrqFinOSBOLJPkhG4J+LNcWvTHg3H2VkmYtggNc560g2L2zgaOhXs4O6J3Bi
 Tjj8tnXm4xwgbPy4Nft7s6SbgdZ1ubrczhs4p3szg1vjPNEV8+l7u0XDAmXmuFhXQ2x9
 EyoZEQExbFHPs8uk2A3sA9pEa2JEMNlxsyYt2hkFlq7P4suhJoY7Uz/J7ycdomuLNW0H
 wncZbcrc/sw0nXijp6fARshKfAYD1YZ5JLADd02vqg5XGcuceYMbZwbcj8n+PnqERSW4
 h4LLE3rg5h0rXRiBxIZ3d3zY+F3GJ2GgD3jay/Tgl6YdBwOwB72dBlsajsi6fSBFRLLi
 VQrQ==
X-Gm-Message-State: AC+VfDzhbvZ+eCBPgz+mkmYDrzo6FBQGyh0407cIE7ZC+y+sQxj26KjX
 0k440nedxQBR+1/njKAIgGGGGcbPAsB7/4Gm3C+/Fg==
X-Google-Smtp-Source: ACHHUZ6xJQ4sb27gOJBUlLulAfb2SbKdzN0zDYzoaS1qx4bbhsz4aSaQhkb4yOzZEEEtGB2JaeTS0Q==
X-Received: by 2002:ac2:5614:0:b0:4ec:6b89:b0cc with SMTP id
 v20-20020ac25614000000b004ec6b89b0ccmr1102695lfd.24.1682650398157; 
 Thu, 27 Apr 2023 19:53:18 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 i7-20020ac25227000000b004eff4f67f1csm1716223lfl.304.2023.04.27.19.53.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 19:53:17 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4ecb7fe8fb8so15995e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:53:17 -0700 (PDT)
X-Received: by 2002:a05:6512:402a:b0:4ed:3ca3:9856 with SMTP id
 br42-20020a056512402a00b004ed3ca39856mr45141lfb.3.1682650397265; Thu, 27 Apr
 2023 19:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230425080240.3582324-1-brpol@chromium.org>
 <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
In-Reply-To: <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
From: Brandon Ross Pollack <brpol@chromium.org>
Date: Fri, 28 Apr 2023 11:53:06 +0900
X-Gmail-Original-Message-ID: <CALWYx-an3X0zeNyC-1ehR7WTni43YVgUevLN+c+BCEkcysjTpA@mail.gmail.com>
Message-ID: <CALWYx-an3X0zeNyC-1ehR7WTni43YVgUevLN+c+BCEkcysjTpA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: vkms: clarify devres managed refernce
 cleanup
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 7:02=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Apr 25, 2023 at 08:02:40AM +0000, Brandon Pollack wrote:
> > added documentation to drm_dev_unregister clarifying that devres manage=
d
> > devices allocated with devm_drm_dev_alloc do not require calls to
> > drm_dev_put.
> >
> > Signed-off-by: Brandon Pollack <brpol@chromium.org>
> >
> > ---
> >
> > This is my first patch to any tree.  I've tried my best to read as many
> > kernel docs etc as possible (wip). This took me a moment to realize so =
I
> > figured it was as good a candidate as any for a first patch (at the ver=
y
> > least to make sure I have the whole patching process figured out).  I
> > hope to make more janitorial changes as I continue to learn leading up
> > to the work I hope to do.
> >
> > We're hoping to add multiple display hotplug output support to VKMS for
> > testing purposes.  Some work has been done already, but we'll be taking
> > over moving forward.  Our intent is to remain involved and assist in
> > maintaining these changes.
> >
> > Looking forward to your comments/advice (now and henceforth!)
>
> Looking good!
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Since you're @chromium.org I'm assuming that one of the cros committers
> will push this to drm-misc-next. If not please holler.
> -Daniel

I'm actually working in relative isolation on this (I'm located in
Tokyo) so please go ahead.  I'll get in touch with some of those folks
soon :)

>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index cee0cc522ed9..12687dd9e1ac 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);
> >   *
> >   * Unregister the DRM device from the system. This does the reverse of
> >   * drm_dev_register() but does not deallocate the device. The caller m=
ust call
> > - * drm_dev_put() to drop their final reference.
> > + * drm_dev_put() to drop their final reference, unless it is managed w=
ith devres
> > + * (as devices allocated with devm_drm_dev_alloc() are), in which case=
 there is
> > + * already an unwind action registered.
> >   *
> >   * A special form of unregistering for hotpluggable devices is drm_dev=
_unplug(),
> >   * which can be called while there are still open users of @dev.
> > --
> > 2.40.0.634.g4ca3ef3211-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
