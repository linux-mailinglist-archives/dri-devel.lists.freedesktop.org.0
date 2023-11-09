Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0127E6D8C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B88911F;
	Thu,  9 Nov 2023 15:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CE48911F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699544357; x=1699803557;
 bh=OQmpT261zJkuaK1T7JxywvcV4B5rxlwiGgrinx8S2e8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OWSyKvf62W09IlGZjCIJab+YWtOxyQvt8ERWCQOp10TjUOTG1f43YWI14qeG51VKA
 HFit5tDIQfgoJVi1Sc09q614ETlnmgrTJB4NZUA/8d+GUwBUKPV429Em/F8qxJa+LV
 YZf+RL/Io06hggsnZX3IKAwrlWWtTiOuvY2qdHqRDAUFN8SzWpbyuMdXrk0ddpH59S
 IRdcwuwjl1Cuor1T8xxKscS0Mbsbf1auZLLKTrx04mkedr7+GRcnizVrqrTAdh2a+o
 BRY6vOJMs6/9BkNpLCwmEn5J6WEMxPbwFG4+vCDkJ7JTj1caq6m0ggofRnSACFY6Eg
 j4X4zOlwOM79w==
Date: Thu, 09 Nov 2023 15:38:56 +0000
To: Maira Canal <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <JivCXrvwsBEzVe_IWMvmr32bunLJJMc81yqQyGhucEqX8cQy3P1kvdEftuQWRu7UTTFo7YdFUw-FWRdqh7IHe6q_TXh9UfGwzeczpgJGI7A=@emersion.fr>
In-Reply-To: <171f9c48-d080-944d-d24e-0f7cf341ea8e@igalia.com>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <171f9c48-d080-944d-d24e-0f7cf341ea8e@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 13:14, Maira Canal <mcanal@igalia.com> w=
rote:

> On 11/9/23 04:45, Simon Ser wrote:
> > User-space sometimes needs to allocate scanout-capable memory for
> > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> >
> > However, DRM dumb buffers are only meant for CPU rendering, they are
> > not intended to be used for GPU rendering. Primary nodes should only
> > be used for mode-setting purposes, other programs should not attempt
> > to open it. Moreover, opening the primary node is already broken on
> > some setups: systemd grants permission to open primary nodes to
> > physically logged in users, but this breaks when the user is not
> > physically logged in (e.g. headless setup) and when the distribution
> > is using a different init (e.g. Alpine Linux uses openrc).
> >
> > We need an alternate way for v3d to allocate scanout-capable memory.
>=20
> For me, it is a bit unclear how we import the vc4 DMA-BUF heap into v3d.
> Should we create an IOCTL for it on v3d?

Hm, but v3d is the render driver, so it shouldn't have any knowledge of wha=
t
vc4 -- the display driver -- actually needs to be able to scanout a piece o=
f
memory. It's true that other x86 drivers like amdgpu and i915 just have the=
ir
own IOCTL to allocate scanout-capable memory, however the split render/disp=
lay
SoC situation makes the situation a bit more hairy for vc4/v3d.

You can think of the vc4 DMA-BUF heaps as a vc4 alloc IOCTL, except it's us=
ing
a more standard framework instead of a custom IOCTL.

Does this make sense?

> Also, if you need some help testing with the RPi 5, you can ping on IRC
> and I can try to help by testing.

Thank you, appreciated!
