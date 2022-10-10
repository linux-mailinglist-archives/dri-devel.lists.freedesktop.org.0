Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91A5F9BC0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 11:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD49210E47B;
	Mon, 10 Oct 2022 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A716E10E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 09:20:39 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665393637; x=1665652837;
 bh=kHPdIhM/Em5TO8ucghJIMTRtpzIEcDmFHgtYfmJo+vE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=UL/ef02js72MkEdyXCWhYb9nJoYRvVCxaFOLZ1ChDQXxN8sb4zOBtIehDdk9+0wy/
 NNxJYCsNzlN5niQ8ve2oVX0xFCiTWfbK/44qRSIGv2cZnwCS5niA8qun6gJygDisU3
 743tg85iIyiTKCqqISy/DJQnW2LrALnATml0BqVt8Id0A7gbUuq/BVKiKcRgZEh/4s
 DXYtAqYWHvvVg/yK6YiUKAnWjvCtMgtT4Gx8Rp7x6ADFLdW2AvhTVZmKH52ORpxI+V
 3l5xSY6e2zC9WOs7RXGrLawksIXiP1FW06lvpxVbH1+WC7yUDyC+YJAidq1ijU7zdM
 hEfs2ptm/MBlw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Message-ID: <PwH1v2fZRV20Te8iW4axdzC3kwoihXXBTjCXH1OLZKFxW2OcG2Mwz7b2TpgFgb9gtK6hsoHO50aZPg5wjgODd1qi5BjO-LgClq9nbLT4yhw=@emersion.fr>
In-Reply-To: <20221010111934.1e1d84ac@eldfell>
References: <20221009144001.161124-1-contact@emersion.fr>
 <20221010111934.1e1d84ac@eldfell>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 10th, 2022 at 10:19, Pekka Paalanen <ppaalanen@gmail.com=
> wrote:

> I'm completely clueless about this API.

No worries!

> > +/**
> > + * struct drm_syncobj_timeline_register_eventfd
> > + *
> > + * Register an eventfd to be signalled when a timeline point completes=
. The
> > + * eventfd counter will be incremented by one.
>=20
> Sounds nice.
>=20
> Since the action is to increment the counter by one, does it mean it
> will be possible to wait for a bunch of completions and have the
> eventfd poll return only when they have all signaled?

It is possible to perform the IOCTL multiple times with the same eventfd, b=
ut
eventfd semnatics would wake up user-space each time any timeline point
completes.

> > + */
> > +struct drm_syncobj_timeline_register_eventfd {
> > +=09__u32 handle;
>=20
> Handle of what?

drm_syncobj handle

> > +=09__u32 flags;
>=20
> What flags are allowed? Must be zero for now?

Same flags as the wait IOCTL.

Must be WAIT_AVAILABLE for now, but I'll implement the zero case as well (s=
ee
TODO).

> > +=09__u64 point;
>=20
> Is this some Vulkan thingy?

It's a drm_syncobj timeline thing. The timeline contains multiple sync poin=
ts.

> > +=09__s32 fd;
>=20
> I guess the userspace needs to create an eventfd first, and pass it as
> the argument here? This is not creating a new eventfd itself?

Correct

> > +=09__u32 pad;
>=20
> Must be zero?

Indeed.

I'll spell out these requirements explicitly in the next version.
