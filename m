Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4590581C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FB410E8AF;
	Wed, 12 Jun 2024 16:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D75fJfMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9810E8AF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:06:53 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3d220039bc6so2436801b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718208412; x=1718813212;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IqehpmeT3Gvcj7Szl/e6rWIKHCUYKVZi38Av+Wl/SE=;
 b=D75fJfMkcnafKPdMK52DaUeUIRbzsr6vcOEu0ZgVk9In5qEzYeAcupbfX3u6qiPZny
 2Licpo3gLq2l/ipyn9qI/n0O/VMgKkb7FiZPkTSzi9nAhAMzivJq3k7tvfPbdi20k4T1
 1Fy/0tRvd/CPaBc0URAUAmQYam7NbuHX8lFMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718208412; x=1718813212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IqehpmeT3Gvcj7Szl/e6rWIKHCUYKVZi38Av+Wl/SE=;
 b=ffCG46PDAdbhLE99p31BD7TbFcUGhJroEu5osgXcevdouPL8hVprsTxCtSD8VQQ01U
 K5C8DYcyyyoYF08W8kJ6c2jkMm8THkyZqMq17LzV2Wt/VfrEHojkqDlUdqcCGoiDHMiY
 RzP58cXRZ/QCd2gI8q3iHFNjMeAWzVRqmn+yDjcqgJCzoOF6X+W4Y8ml1CYeATBYY4mf
 X/BDlQceCrN6ziKgf80NSxQuTMlW9h3VekpSplGJ+rmhghteC2KSCBbMftCkuKwYReU5
 vcFfIYwvSl38x9rCnQty6E0LO/9Tq10NXSQCv54Mb/S1rEHoxALKNhA+2HYb1AeqiNtt
 xwIQ==
X-Gm-Message-State: AOJu0YxbuN+9sElWBRSaZN/+gbvZKqUSU8HBtXeouGOb6298J5E3kAtZ
 8nE4r6wGDNg/QgK+QTqOXJ9ynVKP9ufBMY9aLq8mTAbtM/xEnCqH2sED3vsL96mAFVF189VLu1E
 =
X-Google-Smtp-Source: AGHT+IGbnkGrc0rS8CJXC4eu1JMOTzH8uG8OCbsNjYM8dz/RgVmBxVa1YW6VUhQSDs+1P6lJLN2JPg==
X-Received: by 2002:a05:6871:b29:b0:254:b3cc:a6da with SMTP id
 586e51a60fabf-25514c664afmr2372791fac.29.1718208411510; 
 Wed, 12 Jun 2024 09:06:51 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b90da5f08fsm2068850173.35.2024.06.12.09.06.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 09:06:51 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-375a84006a4so113385ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:06:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:441:4878:1238 with SMTP id
 d75a77b69052e-44158bc73f9mr4776301cf.8.1718208042481; Wed, 12 Jun 2024
 09:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <20240612-lean-intrepid-sponge-bb30e6@houat>
In-Reply-To: <20240612-lean-intrepid-sponge-bb30e6@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 09:00:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgJ6GNgEfjATYMVE=T8yFtZTjNMM2bK0pfUepdJxFkRg@mail.gmail.com>
Message-ID: <CAD=FV=XgJ6GNgEfjATYMVE=T8yFtZTjNMM2bK0pfUepdJxFkRg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 12, 2024 at 8:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > > Why does something like this now work?
> > >
> > > drm_panel_shutdown_fixup(panel)
> > > {
> > >         /* if you get warnings here, fix your main drm driver to call
> > >          * drm_atomic_helper_shutdown()
> > >          */
> > >         if (WARN_ON(panel->enabled))
> > >                 drm_panel_disable(panel);
> > >
> > >         if (WARN_ON(panel->prepared))
> > >                 drm_panel_unprepare(panel);
> > > }
> > >
> > > And then call that little helper in the relevant panel drivers? Also =
feel
> > > free to bikeshed the name and maybe put a more lengthly explainer int=
o the
> > > kerneldoc for that ...
> > >
> > > Or am I completely missing the point here?
> >
> > The problem is that the ordering is wrong, I think. Even if the OS was
> > calling driver shutdown functions in the perfect order (which I'm not
> > convinced about since panels aren't always child "struct device"s of
> > the DRM device), the OS should be calling panel shutdown _before_
> > shutting down the DRM device. That means that with your suggestion:
> >
> > 1. Shutdown starts and panel is on.
> >
> > 2. OS calls panel shutdown call, which prints warnings because panel
> > is still on.
> >
> > 3. OS calls DRM driver shutdown call, which prints warnings because
> > someone else turned the panel off.
> >
> > :-P
> >
> > Certainly if I goofed and the above is wrong then let me know--I did
> > my experiments on this many months ago and didn't try repeating them
> > again now.
> >
> > In any case, the only way I could figure out around this was some sort
> > of list. As mentioned in the commit message, it's super ugly and
> > intended to be temporary. Once we solve all the current in-tree
> > drivers, I'd imagine that long term for new DRM drivers this kind of
> > thing would be discovered during bringup of new boards. Usually during
> > bringup of new boards EEs measure timing signals and complain if
> > they're not right. If some EE cared and said we weren't disabling the
> > panel correctly at shutdown time then we'd know there was a problem.
>
> Based on a discussion we had today With Sima on IRC, I think there's
> another way forward.
>
> We were actually discussing refcount'ing the panels to avoid lifetime
> issues. It would require some API overhaul to have a function to
> allocate the drm_panel structure and init'ing the refcount, plus some to
> get / put the references.
>
> Having this refcount would mean that we also get a release function now,
> called when the panel is free'd.
>
> Could we warn if the panel is still prepared/enabled and is about to be
> freed?
>
> It would require to switch panel-simple and panel-edp to that new API,
> but it should be easy enough.

I think there are two problems here:

1. The problem is at shutdown here. Memory isn't freed at shutdown
time. This isn't a lifetime issue. No release functions are involved
in shutdown and we don't free memory then.

2. As I tried to point out, even if we were guaranteed the correct
order it still doesn't help us. In other words: if all device links
were perfect and all ordering was proper then the panel should get
shutdown _before_ the DRM device. That means we can't put a check in
the panel code to see if the DRM device has been shutdown.


-Doug
