Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016D78F265
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4DC10E6AE;
	Thu, 31 Aug 2023 18:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECD10E6AE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 18:19:11 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bce552508fso19947081fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693505947; x=1694110747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8TbKgzDw8JoqGaaI6UUHierJWn4flZMBUHu6upXnRE=;
 b=SCyRCfopcSm0jGcQ6KbGBDG8tr/DLHAAw+ISDE7jV43HRpzAiVQm7nmvOYvOFGs72A
 M2e4Yx9i2BW5odG9j+ekgKYAMBy7emsrQOcWG7oti3JqclNlcYvI8fXYUajVaYVXuQVw
 RD9/dy65st6m8rbMzW/EMECw8rsTowwxYO3kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693505947; x=1694110747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8TbKgzDw8JoqGaaI6UUHierJWn4flZMBUHu6upXnRE=;
 b=h77vyhhgJzUCHuvPdZVE5x89LJ+h0wbW6MEHkOS501R3zL0rfHzuLrqFoVJZM/Kd7N
 2rkAHQHUnQaEXqTtObLyp0iXRhw46jvEAb1o9b2K8dB8Jsb/FWAvGajsNz+EpVB8JK9R
 GRoGEHNdMKfmUzx/f2nj5qUU3kGKXuIS5ztCOr+usthoi7WkjbJfVFqC43KOATlOLWu3
 gmVrHzyRiDkvpLfnNnjBUYnllyhDAlEVuHjXv4BoLSTXRKzg7wdyCkmLeQG+NTVZpE/f
 EoYj8AxllwMzDFLqHxXdE61xpZX/TnPjC08fM4wxZLYtBrSqTulbEEfO0pfgtkabUbdf
 rtAw==
X-Gm-Message-State: AOJu0Yw4bA24NxZjqk0KVXVPbSis8LG9dvMdfIpD9Yf0UCoXfsDXx/UR
 Tf+rITpDBpp6I2kIdR5bvygKe4HteUWHWtx9pNMND1hY
X-Google-Smtp-Source: AGHT+IE1kh7UmO4Ec9Qs/Kmpy7MHIQp8uKVem03lP82QzKWgF3kF5TfUEaSlE3ZsErLMkrZamsPROw==
X-Received: by 2002:a2e:9a8e:0:b0:2bc:b0ae:a9e5 with SMTP id
 p14-20020a2e9a8e000000b002bcb0aea9e5mr10819lji.42.1693505947434; 
 Thu, 31 Aug 2023 11:19:07 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 g14-20020a1709061e0e00b00988b8ff849csm998496ejj.108.2023.08.31.11.19.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 11:19:07 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso9195e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 11:19:06 -0700 (PDT)
X-Received: by 2002:a05:600c:35cd:b0:400:fffe:edf6 with SMTP id
 r13-20020a05600c35cd00b00400fffeedf6mr18948wmq.1.1693505946288; Thu, 31 Aug
 2023 11:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
In-Reply-To: <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Aug 2023 11:18:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
Message-ID: <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 31, 2023 at 12:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> If so, then I think we can implement everything by doing something like:
>
>   - Implement enable and disable refcounting in panels.
>     drm_panel_prepare and drm_panel_enable would increase it,
>     drm_panel_unprepare and drm_panel_disable would decrease it.
>
>   - Only actually call the disable and unprepare functions when that
>     refcount goes to 0 in the normal case.

Just to be clear: by refcounting do you mean switching this to actual
refcount? Today this is explicitly _not_ refcounting, right? It is
simply treating double-enables as no-ops and double-disables as
no-ops. With our current understanding, the only thing we actually
need to guard against is double-disable but at the moment we do guard
against both. Specifically we believe the cases that are issues:

a) At shutdown/remove time we want to disable the panel, but only if
it was enabled (we wouldn't want to call disable if the panel was
already off because userspace turned it off).

b) At shutdown time we want to disable the panel but then we don't
want to double-disable if the main DRM driver also causes us to get
disabled.

I'd rather keep it the way it is (prevent double-disable) and not
switch it to a refcount.


I'll also note that drm_panel currently already keeps track of the
enabled/prepared state, so there's no "implement" step here, right?
That's what landed in commit d2aacaf07395 ("drm/panel: Check for
already prepared/enabled in drm_panel"). Just to remind ourselves of
the history:

1. I needed to keep track of the "prepared" state anyway to make the
"panel follower" API work properly. See drm_panel_add_follower() where
we immediately power on a follower if the panel they're following was
already prepared.

2. Since I was keeping track of the "prepared" state in the core
anyway, it seemed like a good idea to prevent
double-prepare/unprepare/enable/disable in the drm_panel core so that
we could remove it from individual panels since that was always a
point of contention in individual panels. It was asserted that, even
in the core, we shouldn't need code to prevent
double-prepare/unprepare/enable/disable but that as a first step
moving this to the core and out of drivers made sense. Anyone relying
on the core would get a warning printed out indicating that they were
doing something wrong and this would eventually move to a WARN_ON.

3. While trying to remove this from the drivers we ended up realizing
some of the issues with panels wanting to power them off at shutdown /
remove time.


>   - In drm_panel_remove, if we still have a refcount > 0, then we WARN
>     and force unprepare/disable the panel.

I think the net-net of this is that you're saying I should fold the
code from this patch straight into drm_panel_remove() and add a WARN
if it ever triggers, right? In this patch series I'd remove the calls
to drm_panel_helper_shutdown() and rely on drm_panel_remove() to do
the power off at remove time. This might give a warning but, as
discussed, removing a panel like this isn't likely to work well and at
least we'd power sequence it properly. In some cases, I might have to
move the call to drm_panel_remove() around a little bit but I think
it'll work.

The above solves the problem with panels wanting to power sequence
themselves at remove() time, but not at shutdown() time. Thus we'd
still have a dependency on having all drivers use
drm_atomic_helper_shutdown() so that work becomes a dependency.


> > I can't give you an exact list because I don't have a great search
> > that identifies the problem. I'm mostly looking for all instances of
> > drm_dev_register() where the driver is "DRIVER_MODESET" and then
> > manually checking their use of drm_atomic_helper_shutdown(). Until I
> > get through them all I won't know the count, and it's a manual
> > process.
>
> I think my coccinnelle script will match with most of them, but we might
> still miss a few indeed.

I'll just plug through with my original list for now, then I can try
your script when I'm done and see if it catches anything I missed.

-Doug
