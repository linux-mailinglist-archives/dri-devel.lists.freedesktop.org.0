Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E231D3E4F19
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 00:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3E89DCF;
	Mon,  9 Aug 2021 22:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212A889DCF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 22:18:18 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id e14so20211724qkg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kSuSdOzpn2BC3hOOiKLl3g0gaz4argQkrrvlL062JE=;
 b=kr9pYlMuV9ECH5XIXkt+0asDJ+giRnj4+5OSL6oQgpR/pvLqhUJJIA7vco8MDpekpg
 JNiiBamDLModZJ3liyKJ5Z/cSkx8a67P7K7Q12+71TEeSlCraUlj5CKRm4h3KFF7i360
 35Eu0UmQtpvg4y7StN2DunBOonRSZiHz90auk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kSuSdOzpn2BC3hOOiKLl3g0gaz4argQkrrvlL062JE=;
 b=pnM2f5NqCH37ICdGliSguJZR8wlpsPCU9TiX0bQpgMDwxsPZnxjrDoaTOWMsKt2QFM
 FZt2elCQxa8d4TAyIJYoBMoIWRsZJoWHsotRk1OyBv62XwDM8K+NrL7XONGJNDbo9yTi
 vszw34ykkXtqv1OlDDixhOv8XvWo7a72mASvkiztAfkRJztPxnxHL1xqMDfYWbU4/+cH
 H9mHNsga9udsBfzU286c3J3TcOjVWvO5GpPVu7Fn2nMh0GXMFRuP1thbik8efM3qdIi4
 wp419hkt9OFt2Lo+KrFSkIgGQSeQOd/R3D0GolODqvYXiWNJBaBH3AlrSHMLfRrS8h99
 l7QA==
X-Gm-Message-State: AOAM533Hf3PADFvbSMaSTZwLdNjNOT98LpkQk7Eat5GMAtltExmvhoY4
 uYictEJRMa4IqRScGGNzy01k63o+qAhqmw==
X-Google-Smtp-Source: ABdhPJxubm5nnXqLBlji/6LKHbXmpWEf8MZixamS9qvDomm1w5jaYURR0Kx8WETtkNoWGlXdgKiQKw==
X-Received: by 2002:a37:8906:: with SMTP id l6mr25232080qkd.210.1628547496864; 
 Mon, 09 Aug 2021 15:18:16 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id 37sm1789925qtf.33.2021.08.09.15.18.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 15:18:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id x192so32523607ybe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 15:18:15 -0700 (PDT)
X-Received: by 2002:a25:b845:: with SMTP id b5mr33593609ybm.343.1628547495182; 
 Mon, 09 Aug 2021 15:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730212625.3071831-1-dianders@chromium.org>
 <YQmp3mGpLW+ELxAC@ravnborg.org>
In-Reply-To: <YQmp3mGpLW+ELxAC@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Aug 2021 15:18:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
Message-ID: <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>, Linus W <linus.walleij@linaro.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Tue, Aug 3, 2021 at 1:41 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas,
>
> On Fri, Jul 30, 2021 at 02:26:19PM -0700, Douglas Anderson wrote:
> > The goal of this patch series is to move away from hardcoding exact
> > eDP panels in device tree files. As discussed in the various patches
> > in this series (I'm not repeating everything here), most eDP panels
> > are 99% probable and we can get that last 1% by allowing two "power
> > up" delays to be specified in the device tree file and then using the
> > panel ID (found in the EDID) to look up additional power sequencing
> > delays for the panel.
>
> Have you considered a new driver for edp panels?
> panel-edp.c?
>
> There will be some duplicate code from pnale-simple - but the same can
> be said by the other panel drivers too.
> In the end I think it is better to separate them so we end up with two
> less complex panel drivers rather than one do-it-all panel driver.
>
> I have not looked in detail how this would look like, but my first
> impression is that we should split it out.

I certainly could, but my argument against it is that really it's the
exact same set of eDP panels that would be supported by both drivers.
By definition the "simple" eDP panels are the ones that just have a
regulator/enable GPIO and some timings to turn them off. Those are the
exact same set of panels that can be probed if we just provide the
panel ID that's hardcoded in the EDID. As you can see from the
implementation patch I'm actually sharing the private data structures
(the ones containing the timing) for panels that are supported both as
"probable" and as hardcoded. If we split into two drivers we'd either
need to duplicate the timings for all panels supported by both drivers
or we'd have to somehow export them (maybe hard if things are in
modules). Also, since it's the same set of eDP panels we'd need to
exactly duplicate all the code handling delays / HPD. It just doesn't
feel right to me.


-Doug
