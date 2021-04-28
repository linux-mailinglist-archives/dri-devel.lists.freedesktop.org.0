Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E336D79F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB23D6EB19;
	Wed, 28 Apr 2021 12:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC86EB19
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:46:04 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619613961;
 bh=Qv0PWpGXYJy6PsM/2F2SxytW28WHtmPrNGxI+tH48HE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WEjHpEeLxa4+lp53R5zKnineHjAO2YoXIIELZTAU2RBsLgaFQ7kRURTFTfU1iA3On
 jN32bojVES/wBHfttEN7KfPRxscxVZxGe6WkieHjCk4MUrqf8qXMNh8+dDuHy+oMw3
 k/SADMz2vtKjdv5vThtZr8XOZNwcuD4+lj+x/82YarG0qJRqU/ZhpkQvgMWMch5/ZS
 wK7rge4onWskbXH8hNR+EY6Ch8SFTVb5UQimJFEOpxWZo0K0SNIRY/oFmhWQqvQSDq
 8UbUJta7xqARPeQhYegPsOYINHFu4U+3PBcFxEFw1pckdiyZiBqFHPHs/MhRz/CEq5
 QmHN8s2bOt3oQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <_e1Ehagje93sjqgZPL8ZAGGADig6Kz46cPioyDMGLgVrl-9yBpY_mmhUZX4RgSkRvsonzSshylWcdwPiwpX0Kof1CbkQOu6ztFK8daZ-VSY=@emersion.fr>
In-Reply-To: <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
References: <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, April 28th, 2021 at 2:21 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> Yeah I think we have pretty clear consensus on that goal, just no one yet
> volunteered to get going with the winsys/wayland work to plumb drm_syncobj
> through, and the kernel/mesa work to make that optionally a userspace
> fence underneath. And it's for a sure a lot of work.

I'm interested in helping with the winsys/wayland bits, assuming the
following:

- We are pretty confident that drm_syncobj won't be superseded by
  something else in the near future. It seems to me like a lot of
  effort has gone into plumbing sync_file stuff all over, and it
  already needs replacing (I mean, it'll keep working, but we have a
  better replacement now. So compositors which have decided to ignore
  explicit sync for all this time won't have to do the work twice.)
- Plumbing drm_syncobj solves the synchronization issues with upcoming
  AMD hardware, and all of this works fine in cross-vendor multi-GPU
  setups.
- Someone is willing to spend a bit of time bearing with me and
  explaining how this all works. (I only know about sync_file for now,
  I'll start reading the Vulkan bits.)

Are these points something we can agree on?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
