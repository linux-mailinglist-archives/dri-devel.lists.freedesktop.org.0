Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA83228A4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 11:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F3A6E3AC;
	Tue, 23 Feb 2021 10:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F2889FCE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 10:12:39 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id g46so3702512ooi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOSAlApA97M3mGym+YwLnnRJqpfph4UE7MWWQc5ZjVA=;
 b=ZxRKWbOdmlER619XScdcnAbBFbhYJpK8RfcZQEULE9rFTxEMZ8zqiGvImMmC+SEjwb
 gOkYkOXPMCEJ6zbqMQMcNRfsl3DH9uVfZIGuZGyD59hCjiZAS1ompPEM5cddCf1o/Fko
 qyIEwTYZShc2M6Nro058ntOAtfw6F+ppEWgdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOSAlApA97M3mGym+YwLnnRJqpfph4UE7MWWQc5ZjVA=;
 b=nOw7BlNtHa5gu9lpO4np6HjKsgdwgw9+tzP+yPIusOnSOrkuWurKgYeeQtBNXN0Qps
 XVwTXt0KsbIELrtWdpgzaRWPO0/YUR72PAgKmPh6ihVKsry3Az17IQlU38vZYMXhrmCg
 9HeDQOmJh/qkG+9Rq+ObdEFTvcMtlQJhiLFS+Q5c7MLj/7QsJMhry0d/65RJ1bcFU6Y0
 chzUAxAeW5GugQ94FZmpX2vsNqJpFXZcv4MJ0wMOSeU7ZvQhJl+olH900vosRv7SOkmH
 AUCfeSndl0P6Qpj5ghMDqRuNsyKQ5Ob888ILJOrDApLSS5zXHhtWUeGX6bvxEz2+/+14
 7cfQ==
X-Gm-Message-State: AOAM533730QGTDjh5SUOkF1pCpE/9aJ3tDqM2Glhr7oafqfo1qBZPV/B
 Uvj4y1qDGwcyoXC/pNgS3kLlAI4ilHliHzkNIfySqg==
X-Google-Smtp-Source: ABdhPJwDnvu0zIP9XALv2RFSHHsxTvA11YahyrpKqWZVmx4KEH+ihfQqXwVN1mWTGlnSD6ds14LCkRcY5pRj0h4kThw=
X-Received: by 2002:a4a:be01:: with SMTP id l1mr14808034oop.89.1614075158846; 
 Tue, 23 Feb 2021 02:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20210220143850.k22n4r4uel5zhxr2@smtp.gmail.com>
 <YDPeGjnrQKRdfRpZ@phenom.ffwll.local>
 <20210223094242.shy3ndudhw3hweav@smtp.gmail.com>
In-Reply-To: <20210223094242.shy3ndudhw3hweav@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 Feb 2021 11:12:27 +0100
Message-ID: <CAKMK7uHK1KHeDHnOD33gFKftGF2wW6G8G8RSv-DsN190EzAJ4g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/vkms: decouple cursor plane setup from
 crtc_init
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 10:42 AM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On 02/22, Daniel Vetter wrote:
> > On Sat, Feb 20, 2021 at 11:38:50AM -0300, Melissa Wen wrote:
> > > Initialize CRTC only with primary plane (without cursor) as a preparation
> > > to init overlay plane before cursor plane and keep cursor on the top.
> > >
> > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> >
> > Why can't we first initialize all the planes (primary, cursor, overlay)
> > and then the crtc?
> >
> > For drivers where there's not really a functional difference between these
> > planes (like vkms, since it's all sw, only difference is z position
> > really) the usual approach is to initialize all planes in a loop. And then
> > call crtc init with the first and last plane for that crtc.
> >
> Hi Daniel,
>
> It was a misundertanding from my side. I thought that, besides to
> initialize the planes, setting the possible_crtcs should also be done in
> order.

Yeah possible_crtcs is a bit fun. Since most drivers set up their
crtcs in the order they are numbered in hw registers, and the
possible_crtcs mask is index based (not based on the kms object id
userspace sees), you can set it before you actually set up the crtc.

Or (and this is what i915 does for encoders iirc) you can do a special
function which computes the possible_crtcs mask after everything is
set up, but before you call drm_dev_register - before that point no
one else can see any of this anyone, so no problem if it's
inconsistent. But that's rather convoluted way of doing things.

So yeah for the future when vkms supports multiple output, we can just
pass the index of the output we're creating to that function, and that
can be used for possible_crtcs. And as long as we set up all outputs
in order, that will then match up with the drm_crtc_index() of the
crtc. Fundamentally it's a bit chicken/egg problem, so always a bit
confusing.
-Daniel

> Thanks for the feeback. I will discard this patch from the series.
>
> Melissa
>
> > Passing NULL for the cursor for crtc_init and then patching it up
> > afterwards is a bit a hack, so would be good to avoid that.
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_crtc.c   |  4 ++--
> > >  drivers/gpu/drm/vkms/vkms_drv.h    |  2 +-
> > >  drivers/gpu/drm/vkms/vkms_output.c | 14 +++++++++-----
> > >  3 files changed, 12 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > index 0443b7deeaef..2d4cd7736933 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -270,12 +270,12 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> > >  };
> > >
> > >  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > > -              struct drm_plane *primary, struct drm_plane *cursor)
> > > +              struct drm_plane *primary)
> > >  {
> > >     struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> > >     int ret;
> > >
> > > -   ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > > +   ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL,
> > >                                     &vkms_crtc_funcs, NULL);
> > >     if (ret) {
> > >             DRM_ERROR("Failed to init CRTC\n");
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > index 35540c7c4416..9ad5ad8b7737 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -110,7 +110,7 @@ struct vkms_device {
> > >
> > >  /* CRTC */
> > >  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > > -              struct drm_plane *primary, struct drm_plane *cursor);
> > > +              struct drm_plane *primary);
> > >
> > >  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > > index f5f6f15c362c..05d3bb45e6c1 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > @@ -47,6 +47,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >     if (IS_ERR(primary))
> > >             return PTR_ERR(primary);
> > >
> > > +   ret = vkms_crtc_init(dev, crtc, primary);
> > > +   if (ret)
> > > +           goto err_crtc;
> > > +
> > >     if (vkmsdev->config->cursor) {
> > >             cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> > >             if (IS_ERR(cursor)) {
> > > @@ -55,9 +59,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >             }
> > >     }
> > >
> > > -   ret = vkms_crtc_init(dev, crtc, primary, cursor);
> > > -   if (ret)
> > > -           goto err_crtc;
> > > +   crtc->cursor = cursor;
> > > +   if (cursor && !cursor->possible_crtcs)
> > > +           cursor->possible_crtcs = drm_crtc_mask(crtc);
> > >
> > >     ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> > >                              DRM_MODE_CONNECTOR_VIRTUAL);
> > > @@ -100,11 +104,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >  err_connector:
> > >     drm_crtc_cleanup(crtc);
> > >
> > > -err_crtc:
> > > +err_cursor:
> > >     if (vkmsdev->config->cursor)
> > >             drm_plane_cleanup(cursor);
> > >
> > > -err_cursor:
> > > +err_crtc:
> > >     drm_plane_cleanup(primary);
> > >
> > >     return ret;
> > > --
> > > 2.30.0
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
