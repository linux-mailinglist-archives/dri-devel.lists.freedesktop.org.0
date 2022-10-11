Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DF5FB6DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B007F10E036;
	Tue, 11 Oct 2022 15:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985410E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:20:48 +0000 (UTC)
Date: Tue, 11 Oct 2022 15:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665501645; x=1665760845;
 bh=2bL0ZRiSlWbExEQy95pO/lVQkIbuqpaSUtxd4EyJSes=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=H8BmH/UERxWuO7nRYcFwoo+mZ2JQqOfYoXCW6jBzWsiUfV15p7WzA1aDzrKDvZw9x
 bj8j4/2jYbGxmwxo3mpaD35jY+cUzGjXZJGnerbmcDBZUX7oY1EmEaZpQJQ50pHckq
 i8dX/SeMliYxrAPAE95FhIrTxi3OcJjUMoisWY90OcCsNbyWGVTHvrKakfihL7lyI0
 4u1ycJVaqLZUEeJOKGcSI5ZVzoVcnb/U6rdJO+XxLPx/rtLxWbhxaxIbWpLCMAfHHs
 qsvjPIFwUBGXWhZ+oYeEW7pH7V/ZRt4niDBP8VAAMduwjEYpPsXmNIz07OUU/GT/2I
 5NEFnj1hSAoxg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Render only DRM devices
Message-ID: <7IxXaAojWv9lUvhfsVunLet4nXmj7JUmYWlg5w6FMjaIpwD3q4TTLa35cCXozQAkGTXw3SaNKn5h-kwS1zOYV7fR8SqOfaX36mylqAihZfE=@emersion.fr>
In-Reply-To: <7f14fd6b-475c-0b75-4faf-b777ebc42b02@gmail.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
 <7f14fd6b-475c-0b75-4faf-b777ebc42b02@gmail.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 11th, 2022 at 13:56, Christian K=C3=B6nig <ckoenig.leic=
htzumerken@gmail.com> wrote:

> Am 11.10.22 um 13:37 schrieb Simon Ser:
>=20
> > On Tuesday, October 11th, 2022 at 13:04, Christian K=C3=B6nig ckoenig.l=
eichtzumerken@gmail.com wrote:
> >=20
> > > we already have quite a bunch of devices which are essentially render
> > > only and don't expose any connectors or more general display function=
ality.
> > >=20
> > > Just recently I ran into a case where an older X/DDX combination
> > > caused problems for such a device so I looked a bit into the
> > > possibility to allow drivers to disable the primary node and only
> > > expose the render node.
> > >=20
> > > It turned out that this effectively hides the device from X, but
> > > OpenGL and Vulkan can still use it perfectly fine.
> > >=20
> > > The only crux is that this is checked so early in the initialization
> > > that drivers don't have an opportunity to update their
> > > dev->driver_features. So we will always need a separate drm_driver
> > > structure for render only devices.
> > > Typically render-only devices still expose a primary node, but don't
> > > expose any KMS resources on it. See drmIsKMS() in libdrm.
> >=20
> > Primary nodes could still be used by older user-space for rendering wit=
h
> > legacy DRM authentication.
>=20
> Yeah, and that's exactly what we try to avoid :)

But, wouldn't that regress user-space which renders using primary nodes +
DRM auth?
