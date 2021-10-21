Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D243582B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 03:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379D6E406;
	Thu, 21 Oct 2021 01:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6C6E406
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 01:23:47 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so10461726otr.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PBBRVt+qyfXrXc/28+QlFLE6PXlM/7wV4pTsdquhS9Y=;
 b=eqNfb1eo6q9DTbeG5OQirYFNwI7q18NICzzJXmLqDzZxRZ9NPlChUIw9eLYl/TNLyJ
 8pJ7v9ALNFd/EPa/aOEY5uBp9gzvkmyXUfRw37J6J0ZsTUtGIN+Y5AFqgCU3Ej0gc2NA
 xy/nrbWPf1VaHB4qf8aaraHBWiXRpK86OPUbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBBRVt+qyfXrXc/28+QlFLE6PXlM/7wV4pTsdquhS9Y=;
 b=FDaOwDglkTNp8kwyZ5riC76Yo0IHfiRFsevUdQQZL7luQ7Vx3EAvj9FNQPYEYA4pli
 l+O7au2MTveMIqTNhUuOu6fhpIWrMyJchGy9vYon38BrFxSB6JGExATF+SyI6DgNLxy3
 lUC1xG+P7R34+cBD9YEddw630DigksmLUZ1VEpY48UF0DOwT6/gJ1TwTP2ChXnNbWWt6
 Ex8cNeiMo0i9p3V3+U+1hDbAMilB6MDJNb65q3vr11ZT4IRiF5LDAfahacHRWWc7TVCs
 Z40sSCyFnKzgSC2Q1ib4/hCyvIAJXdV8fdtFsYHel8zf1bv/+TX8sP/TjEVeYLyZzN8W
 3EMA==
X-Gm-Message-State: AOAM5324GbEOsK04yKr6GzdQt3pSJ5CToLhOv9QGVa7oqwxKKunO0HBR
 /GCv0pqFZhN7200pfzTSH+ifz9xekcr7hA==
X-Google-Smtp-Source: ABdhPJwttVmgJRBu412E8blq9Tj7mguhkIm2q0Bwp0PfCPPjZ0s6GaOrA4bSql73I1zcmuJFm1GQqw==
X-Received: by 2002:a9d:60dd:: with SMTP id b29mr2174993otk.117.1634779425296; 
 Wed, 20 Oct 2021 18:23:45 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174])
 by smtp.gmail.com with ESMTPSA id a2sm802308otf.46.2021.10.20.18.23.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 18:23:44 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id bk18so2964813oib.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:23:43 -0700 (PDT)
X-Received: by 2002:aca:603:: with SMTP id 3mr2265520oig.117.1634779423368;
 Wed, 20 Oct 2021 18:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
 <20211021004015.GD2515@art_vandelay>
In-Reply-To: <20211021004015.GD2515@art_vandelay>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 20 Oct 2021 18:23:35 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNNPHfAVuN_Q7UJR6GLaepHghtovDUKyMKrVM_UboiM2A@mail.gmail.com>
Message-ID: <CA+ASDXNNPHfAVuN_Q7UJR6GLaepHghtovDUKyMKrVM_UboiM2A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Make PSR-disable non-blocking
To: Sean Paul <sean@poorly.run>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, stable@vger.kernel.org, 
 Zain Wang <wzz@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
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

On Wed, Oct 20, 2021 at 5:40 PM Sean Paul <sean@poorly.run> wrote:
> On Wed, Oct 20, 2021 at 04:17:28PM -0700, Brian Norris wrote:
> > Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
> > "PSR disable" used non-blocking analogix_dp_send_psr_spd(). The refactor
> > accidentally (?) set blocking=true.
>
> IIRC this wasn't accidental.
>
> The reason it became synchronous was:
>  - To avoid racing a subsequent PSR entry (if exit takes a long time)

How did this work pre-commit-6c836d965bad then? I don't see any
provision for avoiding subsequent PSR entry. Or I guess that was
implicitly covered by PSR_FLUSH_TIMEOUT_MS, which means we allowed at
least 100ms between exit/entry each time, which was good enough? And
in the "new" implementation, that turned into a running average that
gets measured on each commit? So we're no longer guaranteed 100ms, and
it's even worse if we cheat the timing measurement?

I'm still not sure that "race" is truly a problem without consulting
some kind of hardware documentation though. It wouldn't surprise me if
these things are cancelable.

>  - To avoid racing disable/modeset
>  - We're not displaying new content while exiting PSR anyways, so there is
>    minimal utility in allowing frames to be submitted
>  - We're lying to userspace telling them frames are on the screen when we're
>    just dropping them on the floor
>
> The actual latency gains from doing this synchronously are minimal since the
> panel will display new content as soon as it can regardless of whether the
> kernel is blocking. There is likely a perceptual difference, but that's only
> because kernel is lying to userspace and skipping frames without consent.

Hmm, you might well be right about some of the first points (I'm still
learning the DRM framework), but I'm a bit skeptical that the
perceptual difference is "only" because we're cheating in some way.
I'm not doing science here, and it's certainly not a blinded test, but
I'm nearly certain this patch cuts out approx 50-80% of the cursor lag
I see without this patch (relative to the current Chrome OS kernel). I
don't see how cheating would produce a smoother cursor movement --
we'd still be dropping frames, and the movement would appear jumpy
somewhere along the way.

In any case, I'm absolutely certain that mainline Linux performs much
much worse with PSR than the current CrOS kernel, but there are some
other potential reasons for that, such as the lack of an
input-notifier [1].

> Going back to the first line, it's entirely possible my memory is failing
> and this was accidental!

Well either way, thanks for the notes. I'll see if I can get anywhere
on proving/disproving that they are relevant, or if they can be worked
around some other way; or perhaps I can regain the lost performance
some other way. It'll be a few days before I get around to that.

Brian

[1] This got locked up in "controversy":
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20180405095000.9756-25-enric.balletbo@collabora.com/
