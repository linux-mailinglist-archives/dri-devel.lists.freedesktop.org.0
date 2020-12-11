Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF42D780A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C636B6EE28;
	Fri, 11 Dec 2020 14:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61626E8EE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 14:39:42 +0000 (UTC)
Date: Fri, 11 Dec 2020 14:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607697580;
 bh=Newu9QDoujmKtx+yK37Z5goafDkQAw5SWPKAWnqoBgk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HaVNaAi+BSQX9+G1bKjEXZg3Vaqq4vntQSk8ZJw1PofvJ0/aG9RHp2/7SJOLEyyr0
 WZN8kjk8U99bIS6FN7mHjMOiBRSnr7VNlF4fj9ciRA0gChm2+jnjgNnSNS9I87SHfm
 d2uHz9PJz23gfljQHwutkalGWYUx6MECws6AylksoSC8XP4g8MHD8WWL5ndvkjLlwF
 rDmOP/qIg0sYpWQQz3NPnJCjuAFyLAjEogZ9O/tgbAwdcq7GY8PRA/UL1tW3El1sNo
 8NLVwhwZilKBMWlfqHOJBUU2gT1F5+miCvKO7hjNf/REC+Ix9gm5puAj91PpZsLq00
 otEyXTI8cyfrA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
Message-ID: <K0Ezu_ZjJ0PpN07HHog8QTOfwsHGxmowZgYxSCV7QLlr1pGFKU06x-8PDxSJd0vShRCjjASXpoFd2D5NhJdUhN1ltsLD6cJLjfr_pKzudpc=@emersion.fr>
In-Reply-To: <20201211155024.5ea63a88@eldfell>
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
 <20201211155024.5ea63a88@eldfell>
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

On Friday, December 11th, 2020 at 2:50 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> is there a reason why one cannot have more primary planes than CRTCs in
> existence?
>
> Daniel implied that in <20201209003637.GK401619@phenom.ffwll.local>,
> but I didn't get the reason for it yet.
>
> E.g. if all your planes are interchangeable in the sense that you can
> turn on a CRTC with any one of them, would one not then expose all the
> planes as "Primary"?

I'm thinking of primary as a hint for simple user-space: "you can likely
light up a CRTC if you attach this plane and don't do anything crazy".
For anything more complicated, user-space uses atomic commits and can
completely ignore whether a plane is primary, cursor or overlay.

> If the planes have other differences, like supported formats or
> scaling, then marking them all "Primary" would let userspace know that
> it can pick any plane with the suitable properties and expect to turn
> on the CRTC with it.

That's interesting, but I'd bet no user-space does that. If new user-space
wants to, it's better to rely on test-only commits instead.

> Or does marking a plane as "Primary" imply something else too, like
> "cannot scale"? I think Weston does make this assumption in an attempt
> to hit fewer causes for failure.

No, AFAIK "Primary" doesn't imply something else, e.g. on amdgpu you can do
scaling on the primary plane.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
