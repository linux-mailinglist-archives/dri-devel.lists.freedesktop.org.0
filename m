Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360B905815
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65CA10E8A9;
	Wed, 12 Jun 2024 16:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fDZBpx4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F009C10E8A9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:05:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6e57506bb2dso401a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718208355; x=1718813155;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZINL17H+hC2HjFcR8qtul7lujxSNFTkCsIl7pDQAU0=;
 b=fDZBpx4dX6AyxMf8UX4KVSaqHFvymCKcSkasQOfXmyRs8RREZWFwA36krfflrwq044
 YdJQ1oSnDkzGZyXH1hDFBMKxtSQWiFNaqadQC1TbLYHTCgbUu8cvI5dOkokLKNWtAZ/X
 c1cFbtAD8qm8PQ5ybNGJ6fkbK3ncZtLzn0qG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718208355; x=1718813155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZINL17H+hC2HjFcR8qtul7lujxSNFTkCsIl7pDQAU0=;
 b=dlXwRkqlI0dNgjGrAgZp3h6EVK3RQBiQZTXT56Y9z93WYymIl/HxrOFNTsCIxdBVzR
 7BQ8XVTQWfE40MxyZYTUtNh7R+WAn8jawGoVJ7cQGtAHAbIXgdKvjtNK/lmGm4/sZcgG
 tr2er9yGnNoX9AuBBUHM0M/QWPNIdyy6q/jzSe/HO4UOw+tzSKyhcaxus9JI0qJkQhHc
 bgSNW0sCIvp1R4o/kVn9yLP2KAjePs40QsQZgaRIxHCo55voxvJSRGpHrCLM++E/Xd1q
 ftwOTS8lXBCbDDDNT0khSu9CMDRA+eK0x+eJ54Z+QMSO8n3GVEBCxtxVJ3A5EPhn03R1
 YvPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUve2/za198ADJE+lNNuz52NwcQWe5JOHNKRy+z3gj4VYE6lQcEQiZZQu4CK3rka3qACioXIcg8VNmf9n7e65ES/kThMe6incKBw6CMGmEL
X-Gm-Message-State: AOJu0YzU1pPdIrSYpH+1sg7QMl273eZ4VBxzH0y0k7fB9f8ohVFHUdG4
 nKEIhuTy+fOSWakhFCDL+AyJEbUimHhdT8sh/hc5gQ2aC1SCdfARBhu5XbP+iTFwc0Wu2sOu/XQ
 =
X-Google-Smtp-Source: AGHT+IH5S19L2bVJmYx166/hVndJJuUMWe6AQ2w8E6fKkXHnnd4SX4/w/GWetYUGkgRx9oGY4l8F2w==
X-Received: by 2002:a17:90a:4409:b0:2b1:b1a1:1310 with SMTP id
 98e67ed59e1d1-2c4a7639daamr2452650a91.29.1718208354541; 
 Wed, 12 Jun 2024 09:05:54 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4a75ee6efsm1986806a91.19.2024.06.12.09.05.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 09:05:54 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f61742a024so204025ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:05:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5BYyGUzW1W1mOcJ+RtbCr+uOB/0qqmZWSUMQrzhOEeYAYr3TPsUOsan6oEByfzSp6rtdt6bLRsu2shn6k2eIV7O9q3bN/8UA7xOUpgeJy
X-Received: by 2002:a05:622a:1dca:b0:43e:3833:c5e3 with SMTP id
 d75a77b69052e-44159e10eabmr2381201cf.11.1718208042474; Wed, 12 Jun 2024
 09:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
In-Reply-To: <Zmm6i6iQOdP613w3@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 09:00:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBVfBZrgGay=XY2Usq3FA3m9i6y0cU4=b=w7qO6gRBFQ@mail.gmail.com>
Message-ID: <CAD=FV=WBVfBZrgGay=XY2Usq3FA3m9i6y0cU4=b=w7qO6gRBFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>
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

On Wed, Jun 12, 2024 at 8:11=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
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
>
> Uh, that's a _much_ more fundamental issue.
>
> The fix for that is telling the driver core about this dependency with
> device_link_add. Unfortuantely, despite years of me trying to push for
> this, drm_bridge and drm_panel still don't automatically add these,
> because the situation is a really complex mess.
>
> Probably need to read dri-devel archives for all the past attempts around
> device_link_add.
>
> But the solution is definitely not to have a manually tracked list, what'=
s
> very architectural unsound way to tackle this problem.
>
> > Certainly if I goofed and the above is wrong then let me know--I did
> > my experiments on this many months ago and didn't try repeating them
> > again now.
>
> Oh the issue is very real and known since years. It also wreaks module
> unload and driver unbinding, since currently nothing makes sure your
> drm_panel lives longer than your drm_device.

In this case I'm mostly worried about the device "shutdown" call, so
it's not quite a lifetime issue but it is definitely related.

As per my reply to Maxime, though, I'd expect that if all ordering
issues were fixed and things were perfect then we'd still have a
problem. Specifically it would seem pretty wrong to me to say that the
panel is the "parent" of the DRM device, right? So if the panel is the
"child" of the DRM device that means it'll get shutdown first and that
means that the panel's shutdown call cannot be used to tell whether
the DRM device's shutdown call behaved properly.


> > In any case, the only way I could figure out around this was some sort
> > of list. As mentioned in the commit message, it's super ugly and
> > intended to be temporary. Once we solve all the current in-tree
> > drivers, I'd imagine that long term for new DRM drivers this kind of
> > thing would be discovered during bringup of new boards. Usually during
> > bringup of new boards EEs measure timing signals and complain if
> > they're not right. If some EE cared and said we weren't disabling the
> > panel correctly at shutdown time then we'd know there was a problem.
>
> You've stepped into an entire hornets nest with this device dependency
> issue unfortunately, I'm afraid :-/

As you've said, you've been working on this problem for years. Solving
the device link problem doesn't help me, but even if it did it's
really not fundamental to the problem here. The only need is to get a
warning printed out so we know for sure which DRM drivers need to be
updated before deleting the old crufty code. Blocking that on a
difficult / years-long struggle might not be the best.

That all being said, I'm also totally OK with any of the following:

1. Dropping my patch and just accepting that we will have warnings
printed out for all DRM drivers that do things correctly and have no
warnings for broken DRM drivers.

2. Someone else posting / landing a patch to remove the hacky "disable
/ unprepare" for panel-simple and panel-edp and asserting that they
don't care if they break any DRM drivers that are still broken. I
don't want to be involved in authoring or landing this patch, but I
won't scream loudly if others want to do it.

3. Someone else taking over trying to solve this problem.

...mostly this work is janitorial and I'm trying to help move the DRM
framework forward and get rid of cruft, so if it's going to cause too
much conflict I'm fine just stepping back.

-Doug
