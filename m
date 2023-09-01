Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB7279043C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793110E843;
	Fri,  1 Sep 2023 23:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D210E843
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:44:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so4471792e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611894; x=1694216694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgXrSJYfo1dkdyg09y4XFoQUBk4FG4+e88odjuhYWLg=;
 b=YuS+touWXdfFM1RiuQAg3wPH7FvNqCjt8jlcaEDnGAJ9bS+22v2qHoi8sOWzcAFVbf
 EtrD56A85E5xIoAoFH1y2QMNhosJPVKyPS7bLvXMsgHulighnoJCCKS9RXnmxXvjJaz6
 qxHZMLidkV0pmzqQlCS6qxhYdAL7P+N7WwNdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611894; x=1694216694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgXrSJYfo1dkdyg09y4XFoQUBk4FG4+e88odjuhYWLg=;
 b=mArpvJJPzApYvBq70H7cWfy2nyXt5JDOPpNwR2KGYnQD7/2rdyuHS5ULVVj/PxiLPO
 8lxk+HsKOxgBktkUcM3rINxZhcBxR4XNuV0lOqeQ7kvgGaJPCM33728Q4TMj/X29foox
 Tclm5lQH/8obn67h8lK5LrwLAKtzl6BMdcwFC9wzOaae1RHtdAH2+eJo5ZHlqcooSfSE
 Fx6uxHDjmz1/KEV3JMP391R02DhPR1d6bWUeDzs5/PNYz3/Sp/1jEIm4m0pqOjHtg7Fb
 1/SexVQwKQmp5x7YfpS9rVjO9/VkE972F7YqcopFv38CTUysXRuAuB6BfTDsQ1wX1+jb
 Oo+g==
X-Gm-Message-State: AOJu0YxIskxRMHBksviSfqjn0udmK6lfAqJZALWbofeUdiLrQApWVUw6
 L69hKE+EsJul93wDKQP5WNwNEy+Wtm0gmGOjemzsitBX
X-Google-Smtp-Source: AGHT+IE1mP1RuucLKvDI7r/mXSeUCee38KrJu5Rl5opqAlnMuOSCCBpDFWcRPIP1BKgMX7I2njKjEQ==
X-Received: by 2002:a05:6512:b08:b0:4fe:279b:7603 with SMTP id
 w8-20020a0565120b0800b004fe279b7603mr3227792lfu.14.1693611893975; 
 Fri, 01 Sep 2023 16:44:53 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402160600b0052544bca116sm2633086edv.13.2023.09.01.16.44.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 16:44:53 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3fef2fafee2so30225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:44:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1f16:b0:3fe:cd3a:ef92 with SMTP id
 bd22-20020a05600c1f1600b003fecd3aef92mr67452wmb.6.1693611892718; Fri, 01 Sep
 2023 16:44:52 -0700 (PDT)
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
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
In-Reply-To: <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Sep 2023 16:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vidq0hwk=wzMU2W7GrobC57kT1gk+cfh0VFCLQucYQhg@mail.gmail.com>
Message-ID: <CAD=FV=Vidq0hwk=wzMU2W7GrobC57kT1gk+cfh0VFCLQucYQhg@mail.gmail.com>
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

On Fri, Sep 1, 2023 at 6:42=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > > The above solves the problem with panels wanting to power sequence
> > > themselves at remove() time, but not at shutdown() time. Thus we'd
> > > still have a dependency on having all drivers use
> > > drm_atomic_helper_shutdown() so that work becomes a dependency.
> >
> > Does it? I think it can be done in parallel?
>
> I don't think it can be in parallel. While it makes sense for panels
> to call drm_panel_remove() at remove time, it doesn't make sense for
> them to call it at shutdown time. That means that the trick of having
> the panel get powered off in drm_panel_remove() won't help for
> shutdown. For shutdown, which IMO is the more important case, we need
> to wait until all drm drivers call drm_atomic_helper_shutdown()
> properly.

FWIW, it was a bit of a slog, but I've managed to put together a RFT
series. Good thing it's Friday and beer-o-clock. Please enjoy
reviewing.

Ugh. It's now two series because there are too many recipients. Email
is fun. OK, these should be at:

* https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
- patches targeting drm-misc

* https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
- patches targeting something that's not drm-misc

-Doug
