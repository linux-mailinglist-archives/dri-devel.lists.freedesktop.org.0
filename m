Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A987EE4BE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B219810E290;
	Thu, 16 Nov 2023 15:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4B10E290
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700150026; x=1700409226;
 bh=3VcRG0KNMFotQuIS4x9T+r6NkPtuwOlYKeTjK/BY94I=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=lmCIAzs+hLZQ5OQfSseb+XH7zaMTIkaxPx1xbvnKHy3HminZ1kXA5aBnbBETv0zzx
 IDlsYJqGOQfq5Scd+3lmiGmEjShtZR//+7Mh8qvX16cR8nrTgmuHiquVvA9pOqw/FC
 QsH+upJmDsNafkZSdiJbpIJF7Hj3J49k2kiDiy9c8gKD6byQtRpdCYVKmhQRsI6q4o
 3D8uAsGHOtxMtOn81Z0VH14auPcq28zi53G9YFjmv6TxBs5Jk6CIwDW0BX2YOe6nTd
 t0HbtUDky1KxVTcsnSuWAHsD0La+/Cr0NTpquEdpsF58V+DjT5G4xYH6rgdTdbuEBw
 3ixr0z/twDICw==
Date: Thu, 16 Nov 2023 15:53:20 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <SsSohScL3nokTnLEzO0FXd2Mhxq9IYM3_qjKhHD8-rynieR_0otvP-WmHQ18UNJuf1Dp7u4iaRB-XPZU4eAxZADSFODzbXxYPFuoJNJ6GcU=@emersion.fr>
In-Reply-To: <20231109074545.148149-2-contact@emersion.fr>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 "T.J. Mercier" <tjmercier@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 08:45, Simon Ser <contact@emersion.fr> w=
rote:

> User-space sometimes needs to allocate scanout-capable memory for
> GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> is achieved via DRM dumb buffers: the v3d user-space driver opens
> the primary vc4 node, allocates a DRM dumb buffer there, exports it
> as a DMA-BUF, imports it into the v3d render node, and renders to it.
>=20
> However, DRM dumb buffers are only meant for CPU rendering, they are
> not intended to be used for GPU rendering. Primary nodes should only
> be used for mode-setting purposes, other programs should not attempt
> to open it. Moreover, opening the primary node is already broken on
> some setups: systemd grants permission to open primary nodes to
> physically logged in users, but this breaks when the user is not
> physically logged in (e.g. headless setup) and when the distribution
> is using a different init (e.g. Alpine Linux uses openrc).
>=20
> We need an alternate way for v3d to allocate scanout-capable memory.
> Leverage DMA heaps for this purpose: expose a CMA heap to user-space.

So we've discussed about this patch on IRC [1] [2]. Some random notes:

- We shouldn't create per-DRM-device heaps in general. Instead, we should t=
ry
  using centralized heaps like the existing system and cma ones. That way o=
ther
  drivers (video, render, etc) can also link to these heaps without dependi=
ng
  on the display driver.
- We can't generically link to heaps in core DRM, however we probably provi=
de
  a default for shmem and cma helpers.
- We're missing a bunch of heaps, e.g. sometimes there are multiple cma are=
as
  but only a single cma heap is created right now.
- Some hw needs the memory to be in a specific region for scanout (e.g. low=
er
  256MB of RAM for Allwinner). We could create one heap per such region (bu=
t is
  it fine to have overlapping heaps?).

Also I tried using the default CMA heap on a Pi 4 for scanout and it works =
fine.
Not super sure it's strictly equivalent to allocations done via dumb buffer=
s
(e.g. WC etc).

[1]: https://oftc.irclog.whitequark.org/dri-devel/2023-11-13#1699899003-169=
9919633;
[2]: https://oftc.irclog.whitequark.org/dri-devel/2023-11-14
