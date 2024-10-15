Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619999E4EE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689510E10C;
	Tue, 15 Oct 2024 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="EjXiWyCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56CA10E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1728990102; x=1729249302;
 bh=HyiWpnQZqKsLZw9ooewGclLgHnxEYoC90jQRJFq0Ioc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=EjXiWyCL4YPHHrNxwQojYjnwoT2ObiVElILOkosiizoGK/utFf/iLYwHinoHbz3Jf
 SGFIytny4aMSC5AbuGurJLTOhvWjAXiEkmKQXUFeI5WiLo+MbBvFkXM5K5F4Rf4jHC
 c7DsQipJUUDwWHuwF2qyWUYSOjyfEaPIqZSRIY3SQES7ANizSPhjzKnkBWeg8sOeIW
 FA9BAZEaDYAZUcFxeSSB4RbfyB2q/WTE83qkltyKJph8X7mg/BJeIjsnInutGjCNoF
 Nb0cXs/GEoCMwhvipe/WfDfNoahz4FghRYKUtB0F0atB5Mw1jIXFJqNCA5zcXMOg7m
 N1nlwLk6o9ZdQ==
Date: Tue, 15 Oct 2024 11:01:38 +0000
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Austin Shafer <ashafer@nvidia.com>
Subject: Re: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
Message-ID: <25vi9vBXOv96OiTmn95BrTK8uiAOG8FKCm-21ityj0t6SvTT0iiHqr42Xk-chIYeWOE-Pfne5ae9oadGN1QBXB1Z5vaaHcxmhdD588Rtpww=@emersion.fr>
In-Reply-To: <a55560b2-288f-48a5-ba79-8074e61f13fc@mailbox.org>
References: <20241013133431.1356874-1-contact@emersion.fr>
 <a55560b2-288f-48a5-ba79-8074e61f13fc@mailbox.org>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 626bd168e0a3489dbbe9e3d8c860cae1abf4fec9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 15th, 2024 at 12:47, Michel D=C3=A4nzer <michel.daenzer=
@mailbox.org> wrote:

> On 2024-10-13 15:34, Simon Ser wrote:
>=20
> > This is a flag to opt-out of the automagic buffer migration to
> > system memory when importing a DMA-BUF.
> >=20
> > In multi-GPU scenarii, a Wayland client might allocate on any
> > device. The Wayland compositor receiving the DMA-BUF has no clue
> > where the buffer has been allocated from. The compositor will
> > typically try to import the buffer into its "primary" device,
> > although it would be capable of importing into any DRM device.
> >=20
> > This causes issues in case buffer imports implicitly result in
> > the buffer being moved to system memory. For instance, on a
> > system with an Intel iGPU and an AMD dGPU, a client rendering
> > with the dGPU and whose window is displayed on a screen
> > connected to the dGPU would ideally not need any roundtrip
> > to the iGPU. However, any attempt at figuring out where the
> > DMA-BUF could be accessed from will move the buffer into system
> > memory, degrading performance for the rest of the lifetime of the
> > buffer.
> >=20
> > Describing on which device the buffer has been allocated on is
> > not enough: on some setups the buffer may have been allocated on
> > one device but may still be directly accessible without any move
> > on another device. For instance, on a split render/display system,
> > a buffer allocated on the display device can be directly rendered
> > to from the render device.
> >=20
> > With this new flag, a compositor can try to import on all DRM
> > devices without any side effects. If it finds a device which can
> > access the buffer without a move, it can use that device to render
> > the buffer. If it doesn't, it can fallback to the previous
> > behavior: try to import without the flag to the "primary" device,
> > knowing this could result in a move to system memory.
>=20
> One problem with this approach is that even if a buffer is originally cre=
ated in / intended for local VRAM of a dGPU, it may get temporarily migrate=
d to system RAM for other reasons, e.g. to make room for other buffers in V=
RAM. While it resides in system RAM, importing into another device with DRM=
_PRIME_FD_TO_HANDLE_NO_MOVE will work, but will result in pinning the buffe=
r to system RAM, even though this isn't optimal for the intended buffer usa=
ge.

Indeed. Do you think we could have a flag which also prevents pinning?

Sounds like that would involve implementing dynamic DMA-BUF importers in
GEM? (Some drivers like xe already implement that.)

As a first step, a flag which checks whether the buffer comes from the
same device it's imported from would be tremendously useful, even if
that wouldn't work with split render/display systems. Ideally a new uAPI
which can be extended to support such systems in the future would be
great.

> In other words, the new flag only gives the compositor information about =
the current state, not about the intention of the client. Another mechanism=
 like https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requ=
ests/268 is needed for the latter.
>=20
> So while this flag might be useful to prevent unintended buffer migration=
 in some cases, it can't solve all multi-GPU issues for compositors.

I'm still not willing to give up on the idea that this doesn't need
protocol changes in the long run, but maybe I'm being too optimistic
here. :)
