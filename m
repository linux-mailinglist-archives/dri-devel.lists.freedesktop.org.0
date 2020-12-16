Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7A2DC304
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D3A6E215;
	Wed, 16 Dec 2020 15:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023F16E215
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:23:27 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608132205;
 bh=bRL9U2okZulRp0E7XKVga3ZyzdUo07p2M6po4Ra66IY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=hj1NSZWVwoOFL9wLXUO17jsSHnAs8/i0DMtGwh5EziORuyj3ihdiSmlVaV89yXIPU
 iGRdM6GC40hKtekDpqPbzIq9IwDEivpGRKyUYGramCu7yEzZjuJi0G3Hec431NH2Xr
 GyvSAMZpzgdK8MWxuIDALGv33eZG72h/bARUSxBO8JoL1zEc7MIWgFTAuZTex3CbWQ
 zub1Hw/A7AlJpwbGYBnE1OcxNSV63Iiexgf+8yGscQkSCjYm1ncPzEEOp6sMGbktlQ
 axdSKexUIyDNd7hu+StbkPpPBl/Dzb+NHFKDgBf72fXRrtN5x3WKg9ZNlBXLQPCP+r
 Nk0RRCAe+ibww==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
Message-ID: <Ieaf7Com49xFBQeZZDqxLVWsOnfF7rjMfo2DaLdZ10oVx6k6_sVvCGjyXqroH9PGSaE5wu3vcgwrYnm1jkArnG87_R7kiuZ3pmE_T2zim_Q=@emersion.fr>
In-Reply-To: <20201214104149.2d5532c4@eldfell>
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
 <20201211155024.5ea63a88@eldfell>
 <K0Ezu_ZjJ0PpN07HHog8QTOfwsHGxmowZgYxSCV7QLlr1pGFKU06x-8PDxSJd0vShRCjjASXpoFd2D5NhJdUhN1ltsLD6cJLjfr_pKzudpc=@emersion.fr>
 <20201214104149.2d5532c4@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 14th, 2020 at 9:41 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 11 Dec 2020 14:39:35 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > On Friday, December 11th, 2020 at 2:50 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > > is there a reason why one cannot have more primary planes than CRTCs in
> > > existence?
> > >
> > > Daniel implied that in <20201209003637.GK401619@phenom.ffwll.local>,
> > > but I didn't get the reason for it yet.
> > >
> > > E.g. if all your planes are interchangeable in the sense that you can
> > > turn on a CRTC with any one of them, would one not then expose all the
> > > planes as "Primary"?
> >
> > I'm thinking of primary as a hint for simple user-space: "you can likely
> > light up a CRTC if you attach this plane and don't do anything crazy".
> > For anything more complicated, user-space uses atomic commits and can
> > completely ignore whether a plane is primary, cursor or overlay.
>
> That's a nice reason, do we have those written down anywhere?

Doesn't seem like it. The docs for enum drm_plane_type incorrectly say that the
a plane of type "Primary" will be used for legacy IOCTLs. Also, there are no
docs for the "type" property at all. I'm not even sure where to document it, as
there's no section for plane properties.

> - plane type "Primary" is a hint to userspace that using this plane
>   alone on a CRTC has the highest probability of being able to turn on
>   the CRTC
>
> - plane types are just a hint to userspace, userspace can and *should*
>   use atomic test_only commits to discover more ways of making use of
>   the planes (note: if this applies to cursor planes, it will invalidate
>   some "optimizations" that virtual hardware drivers like vmwgfx(?)
>   might do by having the cursor plane position controller directly from
>   the host rather than looped through the guest)

Yes. In an old thread, I suggested having a DRM cap that needs to be enabled
to allow the driver to de-synchronize a cursor plane's CRTC_X/Y.

> > > If the planes have other differences, like supported formats or
> > > scaling, then marking them all "Primary" would let userspace know that
> > > it can pick any plane with the suitable properties and expect to turn
> > > on the CRTC with it.
> >
> > That's interesting, but I'd bet no user-space does that. If new user-space
> > wants to, it's better to rely on test-only commits instead.
>
> Ok. So plane types are not a good reason to prune a compositor's testing
> matrix to avoid testing some combinations.

They are a hint, so in this sense they do help pruning the testing matrix. For
instance it would be impossible for user-space to figure out the right cursor
buffer parameters without DRM_CAP_CURSOR_{WIDTH,HEIGHT}. I also think there's
an undocumented assumption that the cursor buffer must be allocated with a
LINEAR layout when the driver doesn't support modifiers.

However, for this particular case I don't think the hint would be helpful.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
