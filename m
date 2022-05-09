Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C1520464
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264B910E3F3;
	Mon,  9 May 2022 18:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544C810E3D9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652120385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDFIEGAmMkYI3lcSgWTP/D9Zx+5IJKr94HLnqcFoXoI=;
 b=h4X1zSapGWUOKNelZWoGubzia/ND/tsKEYHgrD3/6qnyPRbTQhNow0X7hnQd7daHUM2YdA
 L75GUdTBOhCU/De761h7fBZL96kReAXuZ+9WyIUE6y/f/7yWfbTa69cmcIlXIrM28lMyVm
 hKcNc7EqLpAd/Ho8+72FB6ETscJGvRc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-dyUq8XvKMwaLsxa09KwCUg-1; Mon, 09 May 2022 14:19:42 -0400
X-MC-Unique: dyUq8XvKMwaLsxa09KwCUg-1
Received: by mail-qk1-f197.google.com with SMTP id
 d67-20020a379b46000000b006a00045c8c9so9143703qke.22
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 11:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=PDFIEGAmMkYI3lcSgWTP/D9Zx+5IJKr94HLnqcFoXoI=;
 b=lTKwstLgkB//DzEbY054XgxH1IdlCjS53zdzFpdvpOow4UOWlPFokK8YtXG19xUwDK
 aTuY6xH+6EU+c3I6hjcmRC3TWX4BXQ+4nD6inXqm40rcvd/rVwyL/c0isSXRqhVwmkXU
 yHldzFmxObArgXby1rORnajbObgyqf395/ZhmhhGWoepfwXg6nwIHdb680qfJiHA1cH/
 vir3ODg3wfqwnYOw6dcYVWrTJ43hg7x0iXQs8qoXO1livpEWPnu19FvDCRSW28tn/Oba
 b/wusOowUJL8h1XZeAKNIDwBcnJTXddWTZpNA/ocKhqxL758GwsCTrHKUxnkWG0NRl7N
 H3NA==
X-Gm-Message-State: AOAM532O9Pm0sGTfnbopGdQSBELxsmlZTbB1xKgmHnHtxzlu+DjMMSu8
 IyHknyE7EoksDYJmDjTvaUTD3C/iw1RPjYHWhlMpb4FQL1opmuT6tOqzHZi5lJzVRH4rfY+QsrC
 a2HBFdOWjWoX96l/eO9FD/Lsye4zA
X-Received: by 2002:ad4:594b:0:b0:45a:9692:14a3 with SMTP id
 eo11-20020ad4594b000000b0045a969214a3mr14821470qvb.107.1652120381821; 
 Mon, 09 May 2022 11:19:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTKWoBx8hf4aO9oeLuMx3Wy5UIKOWsPo4PTItAkI7mNq7lPxt1S1WQ+QbyFWj4uh2wXeAczA==
X-Received: by 2002:ad4:594b:0:b0:45a:9692:14a3 with SMTP id
 eo11-20020ad4594b000000b0045a969214a3mr14821445qvb.107.1652120381597; 
 Mon, 09 May 2022 11:19:41 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 y7-20020ac87c87000000b002f39b99f67csm8127235qtv.22.2022.05.09.11.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 11:19:41 -0700 (PDT)
Message-ID: <1deeebc415c188c35f090048f32d7dacd93b14b1.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>
Date: Mon, 09 May 2022 14:19:39 -0400
In-Reply-To: <82c9b246bcbe544036d2fc0873f15f8483947a57.camel@redhat.com>
References: <20220504171851.17188-1-mmenzyns@redhat.com>
 <7574d491866ffa7c1a4607885b76140ba4206477.camel@redhat.com>
 <CA+i2r=uKq=CWts-6wXh2qqy6=vEVHLY0vRBxzcA-mg0P8wXOZg@mail.gmail.com>
 <82c9b246bcbe544036d2fc0873f15f8483947a57.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also JFYI Mark - I just realized that your email client is defaulting to
sending HTML mail when you reply to me, that doesn't really make it onto the
mailing list at all so you probably want to fix that.

Also - I misspoke here again, I think it should actually be a call to
drm_kms_helper_poll_fini() instead since that will both cancel the output poll
worker and update dev->mode_config.poll_enabled to prevent the output poll
worker from starting up again. The documentation doesn't say it's fine to call
drm_kms_helper_poll_disable() after that, but it seems to be safe from looking
at the code - and I think someone just generally forgot to write docs for
drm_kms_helper_poll_fini()…

On Mon, 2022-05-09 at 13:59 -0400, Lyude Paul wrote:
> On Mon, 2022-05-09 at 15:13 +0200, Mark Menzynski wrote:
> > I think there are no direct issues with initialization in the state how it
> > is now. I suspect it's because "drm_kms_helper_poll_enable()" starts the
> > first worker thread with a delay, which gives enough time to initialize
> > required resources. I changed the initialization part to keep it
> > consistent with the finish part, which is the one causing troubles.
> 
> I think I may have misspoke on what the issue was here since I was about to
> leave work. The MST bit might not actually be an issue, however I think
> nouveau_fbcon_init() being called before nouveau_display_init() would be an
> issue since nouveau_fbcon_init() can trigger a modeset - and we can't
> perform modesets before nouveau_display_init() has set things up.
> 
> Looking at the docs for drm_kms_helper_poll_disable() - I think the actual
> fix here (to ensure that we still call drm_kms_helper_poll_disable() at the
> right time during suspend) would be to actually add another call to
> drm_kms_helper_poll_disable() into nouveau_fbcon_fini() before we call
> nouveau_fbcon_accel_fini() and everything after. This should make sure that
> we stop the output polling work early on driver unload, and since the docs
> mention that it's OK to disable polling more then once with
> drm_kms_helper_poll_disable() I don't see any issues with that.
> 
> 
> > 
> > I am not sure where I could move "drm_kms_helper_poll_enable/disable()",
> > since it is defined in "drm/drm_probe_helper.c", which is only included in
> > "nouveau_display.c" and "nouveau_connector.c". Both creating a new
> > function in "nouveau_display.c", and including "probe_helper.h" and using
> > poll_enable in a different file like "nouveau_fbcon.c" seem like too big
> > changes for such small fix. I don't know.
> > 
> > Can this new proposed order break something in the finish part as well?
> > Maybe it would be just better to change the order of "nouveau_drm_finish"
> > and keep the current order of "noueau_drm_init"?
> > 
> > On Thu, May 5, 2022 at 9:57 PM Lyude Paul <lyude@redhat.com> wrote:
> > > Hmm, I think we might just need to move the drm_kms_helper_poll_enable()
> > > call
> > > to the end here instead of all of nouveau_display_init(). I realized
> > > this
> > > because in nouveau_display_init() it seems that we actually rely on
> > > nouveau_display_init() to setup hotplug interrupts - which we do
> > > actually need
> > > this early on in the driver probe process.
> > > 
> > > That being said though, drm_kms_helper_poll_enable() shouldn't be
> > > required for
> > > MST short HPD IRQs from working so moving that instead should work.
> > > 
> > > On Wed, 2022-05-04 at 19:18 +0200, Mark Menzynski wrote:
> > > > Resources needed for output poll workers are destroyed in
> > > > nouveau_fbcon_fini() before output poll workers are cleared in
> > > > nouveau_display_fini(). This means there is a time between fbcon_fini
> > > > and display_fini, where if output poll happens, it crashes.
> > > > 
> > > > BUG: KASAN: use-after-free in
> > > > __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> > > > [drm_kms_helper]
> > > > 
> > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > Cc: Karol Herbst <kherbst@redhat.com>
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
> > > >  1 file changed, 8 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > index 561309d447e0..773efdd20d2f 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > @@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
> > > >         if (ret)
> > > >                 goto fail_dispctor;
> > > >  
> > > > -       if (dev->mode_config.num_crtc) {
> > > > -               ret = nouveau_display_init(dev, false, false);
> > > > -               if (ret)
> > > > -                       goto fail_dispinit;
> > > > -       }
> > > > -
> > > >         nouveau_debugfs_init(drm);
> > > >         nouveau_hwmon_init(dev);
> > > >         nouveau_svm_init(drm);
> > > > @@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
> > > >         nouveau_fbcon_init(dev);
> > > >         nouveau_led_init(dev);
> > > >  
> > > > +       if (dev->mode_config.num_crtc) {
> > > > +               ret = nouveau_display_init(dev, false, false);
> > > > +               if (ret)
> > > > +                       goto fail_dispinit;
> > > > +       }
> > > > +
> > > >         if (nouveau_pmops_runtime()) {
> > > >                 pm_runtime_use_autosuspend(dev->dev);
> > > >                 pm_runtime_set_autosuspend_delay(dev->dev, 5000);
> > > > @@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
> > > >                 pm_runtime_forbid(dev->dev);
> > > >         }
> > > >  
> > > > +       if (dev->mode_config.num_crtc)
> > > > +               nouveau_display_fini(dev, false, false);
> > > >         nouveau_led_fini(dev);
> > > >         nouveau_fbcon_fini(dev);
> > > >         nouveau_dmem_fini(drm);
> > > >         nouveau_svm_fini(drm);
> > > >         nouveau_hwmon_fini(dev);
> > > >         nouveau_debugfs_fini(drm);
> > > > -
> > > > -       if (dev->mode_config.num_crtc)
> > > > -               nouveau_display_fini(dev, false, false);
> > > >         nouveau_display_destroy(dev);
> > > >  
> > > >         nouveau_accel_fini(drm);
> > > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

