Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F76D7610
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF67910E85A;
	Wed,  5 Apr 2023 07:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8FE10E85A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 07:59:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso110880966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680681595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QWRlHnE/h9CHhOnCyIwfqeN7rycMW6udSf7Sak+vLlY=;
 b=GECUPzBKXyxRtK9B5BMf9gddf5keqlI6rSrALHQ9v5KZSFeG1AMYoKvlFxnkx+bG4W
 ZhD6oGhqmf2ydoBxWcagllBzYLPhO+iZKShdMDjchCBq+010dxFDbOUe4TAEtFGjLeKC
 5fDm6LK8DakG5VH+8PTz01xiujsTmOrRZy9VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWRlHnE/h9CHhOnCyIwfqeN7rycMW6udSf7Sak+vLlY=;
 b=Z35OAQg1XaVoeDsbs8dLQyL0Ydh5uek0hi+2xiImZTMlw+wLI4P/TNiE8XW21r1hEK
 NAeZ+Z0byQjAJRYmk5+Scj3m6E33ntZdxI1TTB0rOx0l+8p9QacOytGHK+iC3CepqGHD
 EZ3Lf60IO3erIvso28ZPfh8Ih4Eu/ylbeCAnS2vD2w8EFPPsUrIheV/cV7DDZrCxn8Hm
 j6N07+YoQx4lCEUCJ7XeLtljGc3k30UO76xVrkWvuWYAUYSssHI6payq4am4t8c0x06c
 Yl5GHLPWV07v8G3UBWFKivehv+uSyiu8oLy2lvNGEwqCOTAp8GBZTyV+KY/4AirTb0IN
 QWhg==
X-Gm-Message-State: AAQBX9e+OiX8Fjjo8/bNAnLmpUCcrwGwBcZjm9WK6pUzQND9EnXXui70
 xLF/lMa+fdUJlbjTUV15PctWXg==
X-Google-Smtp-Source: AKy350aZa5JopCjviKbhJm28ZhXM2zvV14RCuJIx8HSiDAC10TBC9Epg32FCs7vHo6XU2DPqA8AfjQ==
X-Received: by 2002:a17:906:7381:b0:930:7f40:c1bb with SMTP id
 f1-20020a170906738100b009307f40c1bbmr2362085ejl.4.1680681595433; 
 Wed, 05 Apr 2023 00:59:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 rv27-20020a17090710db00b008d606b1bbb1sm7038046ejb.9.2023.04.05.00.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 00:59:54 -0700 (PDT)
Date: Wed, 5 Apr 2023 09:59:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/atomic-helper: Do not assume vblank is always present
Message-ID: <ZC0qeB5CMy0qdm1m@phenom.ffwll.local>
References: <20230405045611.28093-1-zack@kde.org>
 <87mt3mdbn2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt3mdbn2.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 mombasawalam@vmware.com, banackm@vmware.com, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, iforbes@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 09:35:45AM +0200, Javier Martinez Canillas wrote:
> 
> Hello Zack,
> 
> Thanks for your patch.
> 
> Zack Rusin <zack@kde.org> writes:
> 
> > From: Zack Rusin <zackr@vmware.com>
> >
> > Many drivers (in particular all of the virtualized drivers) do not
> > implement vblank handling. Assuming vblank is always present
> > leads to crashes.
> >
> > Fix the crashes by making sure the device supports vblank before using
> > it.
> >
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 299fa2a19a90..6438aeb1c65f 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -997,12 +997,16 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
> >  {
> >  	unsigned int pipe = drm_crtc_index(crtc);
> >  	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> > -	struct drm_display_mode *mode = &vblank->hwmode;
> > +	struct drm_display_mode *mode;
> >  	u64 vblank_start;
> >  
> > +	if (!drm_dev_has_vblank(crtc->dev))
> > +		return -EINVAL;
> > +
> >  	if (!vblank->framedur_ns || !vblank->linedur_ns)
> >  		return -EINVAL;
> >  
> > +	mode = &vblank->hwmode;
> >  	if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
> >  		return -EINVAL;
> >  
> 
> Rob already posted more or less the same fix:
> 
> https://lore.kernel.org/lkml/CAF6AEGsdT95-uAKcv2+hdMLKd2xwfPeN+FMuDTRMc-Ps7WbRjw@mail.gmail.com/T/

Yeah I pushed it to drm-misc-next yesterday, please check that works. Also
note that we still (in some cases at least where) need another fix to
handle the crtc on/off state transitions (but only for drivers which do
have vblank), I'll send that out asap.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
