Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B174B4CA7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022A410E404;
	Mon, 14 Feb 2022 10:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635A10E404
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:52:17 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644835934;
 bh=MlZxepE7UcCIx7JdbAa36YidmF6d5y+C8F78t64Xio0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=LThY4lgUqhN8sGqwUbzGNFG1jSZlOqseiQAm9FRwnlotQK8Bibz9NV5fvBRzZkA6e
 AKdMcgVjEBUpigN+wbQqLLFpMpKqwoX4f/XY+4BKYUTk9WLnDIkOhF2IYvOYMxXq4H
 /+su7TPrhRIkglRZdbbO4kQikJA2b6Qjq8D6y/OXk1/hIsJfRqkNgbPpDFTLkhegbZ
 iaoLIMVLTzrHznyG58N/ooRjJnqpJpXq5iboveuFIgQPg4EJtHXoDn2D6MvMkgbJTs
 nms6hiOAFWrVqs6w8Er37CEQVw+JzcW3PYzmzFJVIQyOmoq/+Qd497VPQPxmkUH7FK
 VPZyRvj0tT/IA==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <aW25lLbuIQGCr0FHtnqiM-UB-VYfk-BaLhhwq3Ur9ONgrXyxHspO_JKXCIgAeI0IBhW7hqZwTdACzd9a1b8A9MIBDrn12ymzMGYjbeqcSYE=@emersion.fr>
In-Reply-To: <YgoxFBGNsrezVxmi@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, February 14th, 2022 at 11:38, Andy Shevchenko <andriy.shevchenko=
@linux.intel.com> wrote:

> > > > IMO *always* prefer a for loop over while or do-while.
> > > >
> > > > The for (i =3D 0; i < N; i++) is such a strong paradigm in C. You
> > > > instantly know how many times you're going to loop, at a glance. No=
t so
> > > > with with the alternatives, which should be used sparingly.
> > >
> > > while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> >
> > Naw, that's not true.
>
> In the section 3.5 "Loops - While and For" in "The C Programming
> Language" 2nd by K&R, the authors said:
>
> =09The for statement ... is equivalent to ... while..."
>
> They said that for is equivalent to while, and not otherwise.
>
> Also, syntax sugar by definition declares something that can be written a=
s
> a single line of code, which usually is done using more (not always).

arr[i] is syntaxic sugar for *(arr + i), yet we keep writing the former,
because it's way more readable. The same goes for the for vs. while loops.
It may be obvious for you because you're a C guru, but to me it just obfusc=
ates
the code. Too many C projects end up becoming completely unreadable because=
 of
patterns like these.

Idiomatic C code isn't written by doing pointless micro-optimizations.
