Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895441AD95
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 13:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89E36E10C;
	Tue, 28 Sep 2021 11:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A971C6E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632827260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR6VXnQsyOwoBA0NqYwQwAM8amF8J8DkhanQviHV1Bg=;
 b=Ku2Z2wFnPTAJg90dw+b1xKtdu+xqqh7vew7X/Sdm5toSPkZbMRLMs+gba2DxTVFns9+OjD
 XUbjYlYkXS9DTQCD38Zj7oz6cU1L5o6UL+sfxzc2ASvePc/h9+MTItVr99teA/MikklRlm
 5o8UQYaR+RLXwhcnMMEVXKyXIWOowr0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-A4alCtaUMYiZnGMhkplXCg-1; Tue, 28 Sep 2021 07:07:33 -0400
X-MC-Unique: A4alCtaUMYiZnGMhkplXCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c77-20020a1c9a50000000b0030d06638a56so542340wme.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 04:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WR6VXnQsyOwoBA0NqYwQwAM8amF8J8DkhanQviHV1Bg=;
 b=4MJSLUieYRpfTn8d4N4V/iFDGU/mPzMB7gYXhT+DTVgFJB4+TyBgPByWFZubYOGOAq
 T38BQVMWbn91xH0FdT5lWwM/xhDtySKmqXkKwT0eld+gouITB/10xvHbOpCuMQg/amUx
 3YLLRdOsoJLhavjycTtsBT7jd46l0CJ4ogVxMOEdNJP+CwBCZx7xFRLBYNCjTfDODRk6
 sjeI57M5NjNSOQfnbqv36vM0qY96pzzxXYwotVb9XmCh4/VF4MzlkALHfIkqIq0j8m8+
 s6goFtM5nxJqnxxHU0qqfZj1S9/YYJ2soDRorM9T8Otpeya3yowIPlQ1RKIzyZDzrY9s
 rWJg==
X-Gm-Message-State: AOAM531oPw70Tx/BYCW84GKvmU6KTwRi1cOoMZCcePmBdZHtWrcvyOLJ
 P7kcV6kxDLsuiM9CbD/p6pYnct95N9NE2kmllLfidQfziIeKX0J2uYLNTdT9X2WT4q8AAFoM6IK
 glq7O2TzOUPAEf8EdGc5xp1ACxW2+LmbLOjXbUJxnB9Jx
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr4036162wmk.141.1632827224641; 
 Tue, 28 Sep 2021 04:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0TvRX1heajsLZFd4GGwP4vhnY328h7RyY16leHPFWlcyFhg8AWc8/US2AUGlQu71mjn+OzM8EFLIlyzTcL7Y=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr4036143wmk.141.1632827224471; 
 Tue, 28 Sep 2021 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201203000220.18238-1-jcline@redhat.com>
 <7f51dbe3dac85f692e01bb5cecdf4454a40b1893.camel@redhat.com>
In-Reply-To: <7f51dbe3dac85f692e01bb5cecdf4454a40b1893.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:06:53 +0200
Message-ID: <CACO55ttDK4eCZ-RUOnPRLawZYUbX9xyXDnqwB=4z7vNrZkkvxg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: avoid a use-after-free when BO init fails
To: Lyude Paul <lyude@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, 
 Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

and queued

On Fri, Mar 26, 2021 at 10:41 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> On Wed, 2020-12-02 at 19:02 -0500, Jeremy Cline wrote:
> > nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
> > back to the caller. On failures, ttm_bo_init() invokes the provided
> > destructor which should de-initialize and free the memory.
> >
> > Thus, when nouveau_bo_init() returns an error the gem object has already
> > been released and the memory freed by nouveau_bo_del_ttm().
> >
> > Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 787d05eefd9c..d30157cc7169 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -211,10 +211,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int
> > align, uint32_t domain,
> >         }
> >
> >         ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > -       if (ret) {
> > -               nouveau_bo_ref(NULL, &nvbo);
> > +       if (ret)
> >                 return ret;
> > -       }
> >
> >         /* we restrict allowed domains on nv50+ to only the types
> >          * that were requested at creation time.  not possibly on
>
> --
> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>
> Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email to check
> on my status. I don't bite!
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

