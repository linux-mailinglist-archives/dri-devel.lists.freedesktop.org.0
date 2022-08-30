Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E35A63CC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DC910E031;
	Tue, 30 Aug 2022 12:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1802810E031
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 12:46:48 +0000 (UTC)
Date: Tue, 30 Aug 2022 12:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661863606; x=1662122806;
 bh=PAMpdWw6iah9QhaIO/AnDcvL5qIL+0mG/mAdJFZiORg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=d2eiWZV89fBoSJ7TL9kjUX8hsgRDJyWAKybw6Exv+/XucwhildwmwUAkeL1tWqwsU
 tqTmA9KtX6vU3uI0C8xjKruzi65tr2h18bFUlIKMRzoAuJYAtt5ncYqpjOrwIXa32U
 inhoN+5bGWq3SlOL4127BiMuo113Fv+lbN16xEKnaIW6Y3JZUiuO1KyvgF6P9zDZsH
 tj2fJBvrX0224ea6zL1m6t6BwjlZUABUeW7Gb0tqwO+ywR7PKxUWEPQSW+bvbk/Oj3
 DT7Lvcz9xhmShglO02OD7ELzMBcSvaBynHTHBPWbifJ7n8AqAAeIflKfafROQQ98/C
 oDr9xYkIfteTw==
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <jmQy1pXmwi-YHqNW0Oqu9E5oq7Xo0qQGt-QsWcfsJKcY-fI7fPkEWI1nZlYs4L_lGc_57VTEp6GwoB9KbrYOZ95Y6Wjzsa4Sx-zLenSyimM=@emersion.fr>
In-Reply-To: <318188b5-3078-14f3-83a3-8eeda995f425@mailbox.org>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
 <20220830111626.77307042@eldfell>
 <318188b5-3078-14f3-83a3-8eeda995f425@mailbox.org>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 30th, 2022 at 10:31, Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org> wrote:

> > For the atomic uAPI, we need to pick on of these two approaches:
> >
> > 1. Let the kernel fall back to a sync flip if async isn't possible. Thi=
s
> >    simplifies user-space, but then user-space has no reliable way to fi=
gure out
> >    what really happened (sync or async?). That could be fixed with a ne=
w
> >    read-only CRTC prop indicating whether the last flip was async or no=
t.
> >    However, maybe someone will come up in the future with user-space wh=
ich
> >    needs to only apply an update if async flip is possible, in which ca=
se this
> >    approach falls short.
>=20
> The future is now. :)
>=20
> As I described in the documentation patch discussion, this approach would
> make it tricky for a Wayland compositor to decide if it should use an asy=
nc
> commit (which needs to be done ASAP to serve the intended purpose) or not=
 (in
> which case the compositor may want to delay the commit as long as possibl=
e
> for minimal latency).

Ah right. If an async page-flip is not possible, then a Wayland compositor
could want to wait the "last moment" before the next vblank to see if a mor=
e
up-to-date buffer is available.

With that + Xorg usage, I think we have a rather solid case for failing asy=
nc
flips rather than silently falling back to vsync.
