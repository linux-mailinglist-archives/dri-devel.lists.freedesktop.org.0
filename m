Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08896472FC6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 15:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B0D10E6CB;
	Mon, 13 Dec 2021 14:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4791110E6CB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A4FBB8110B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49C7C34604
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639407053;
 bh=rB04KlTnYTjNvX6bGvzpbKOreiTVBbB8v7GBGdsXRH4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CR2I3+knGQjmO/40sXgCZiS4qnJRyJJCJ1XrWY9fFbkBK5J0EZEuYfxhlzcnFLq4Q
 yz7mnKB05bFM/yfKu1rcybHK0yTSiGfkMhR0jgiWyXyvJ0d3RUhMoLJlHvo5RkmZIj
 pEx2QhJ2SmhoA+5VSOCgTcPtXejma5QA9xWKziz3knD9uQonq0m3QJ4ZVG8kkOeM9p
 +Euv2+LUrLBqLqHyU3drZ1wy8AxcDNtfhV3hf4yNnh19LBKtx8jrbiij/7baCgP4Tu
 fHTh2aie142hhSsIjLG+uUmg2OgGYg6ZRtwnNY0erhJx5ND7rrJ3A7nBrRKSSLPDxb
 CJnmEd0pone1w==
Received: by mail-ed1-f51.google.com with SMTP id e3so53673145edu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 06:50:53 -0800 (PST)
X-Gm-Message-State: AOAM531ZiJEopb7/i/iNxEQ/JszdzkmR2Ek/NDqRfPsyxZ6dEMAnKXzJ
 DYYYPjeO3CJU8bGyOB0ICn3hGCBvQtpqT63Mow==
X-Google-Smtp-Source: ABdhPJxuMWm3S7JoggtMzbpLVFQySOBI3xqLHwXO9iPRtHwEd/Xvusq53GXxW9i8hDwfKj8uU5iKsme2fJ01l2MfwJg=
X-Received: by 2002:a17:907:75f0:: with SMTP id
 jz16mr45909802ejc.77.1639407048498; 
 Mon, 13 Dec 2021 06:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
 <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
 <251204bb-18f6-36cb-377a-557135633318@suse.de>
In-Reply-To: <251204bb-18f6-36cb-377a-557135633318@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 Dec 2021 08:50:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLpRgtZyzw4zT=vvcepd=0piJeSJUob=dLWujpO4m7O4g@mail.gmail.com>
Message-ID: <CAL_JsqLpRgtZyzw4zT=vvcepd=0piJeSJUob=dLWujpO4m7O4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 2:16 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 12.12.21 um 22:29 schrieb Rob Herring:
> > On Sun, Dec 12, 2021 at 12:24 AM Hector Martin <marcan@marcan.st> wrote:
> >>
> >> This code is required for both simplefb and simpledrm, so let's move it
> >> into the OF core instead of having it as an ad-hoc initcall in the
> >> drivers.
> >>
> >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> ---
> >>   drivers/of/platform.c          |  4 ++++
> >>   drivers/video/fbdev/simplefb.c | 21 +--------------------
> >>   2 files changed, 5 insertions(+), 20 deletions(-)
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
>
> Can I merge this patch through DRM trees?

Yes.

Rob
