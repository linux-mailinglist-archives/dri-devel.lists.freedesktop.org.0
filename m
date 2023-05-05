Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4876F865B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1577F10E602;
	Fri,  5 May 2023 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D522C10E602;
 Fri,  5 May 2023 16:06:43 +0000 (UTC)
Date: Fri, 05 May 2023 16:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683302800; x=1683562000;
 bh=xpX/dfOp34n/cplTCW6XPIzPOHp9DlI3O8TI4iDggZk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ge1k0dKbBkbrj6goAuGhRLZ8pTUA6meLYnrpFLvsyWPLyL4iLz5ITn3Z627MmocCy
 sF5lloS6ytozmdypXG74/Q+noXXy2q4weOdy+rbdQ5vQKXBr+C7Syafj9HpTc5SjBw
 xaXMTKoLKuFoQLEDiM8VhvRAeWZanc3iywEuNAyYgcMu6s7nvb96Sos3g/Tz91TY8p
 uzTELWTNxtowKZKtPA/zuG5aaGgBcM08e+0XmfoJ5uONrc+F/0qHkehF3qolHeIk7O
 gKJfOGso7irX87szD3ny+9qjSZU5BZW55+nGgjXRAfZuYBnOw1sEjACsnW3BF05Iwe
 Fy0h7ODF7dYbA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
In-Reply-To: <ZFUgnMI4IIbv78By@phenom.ffwll.local>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 5th, 2023 at 17:28, Daniel Vetter <daniel@ffwll.ch> wrote:

> Ok no comments from me on the actual color operations and semantics of al=
l
> that, because I have simply nothing to bring to that except confusion :-)
>=20
> Some higher level thoughts instead:
>=20
> - I really like that we just go with graph nodes here. I think that was
>   bound to happen sooner or later with kms (we almost got there with
>   writeback, and with hindsight maybe should have).

I'd really rather not do graphs here. We only need linked lists as Sebastia=
n
said. Graphs would significantly add more complexity to this proposal, and
I don't think that's a good idea unless there is a strong use-case.
