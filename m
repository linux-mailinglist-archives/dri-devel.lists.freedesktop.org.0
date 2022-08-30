Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 836255A63AF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91A010E0BC;
	Tue, 30 Aug 2022 12:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A971C10E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 12:40:39 +0000 (UTC)
Date: Tue, 30 Aug 2022 12:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661863237; x=1662122437;
 bh=DDbZLxUGQM7NWlbvoEw0MpflTyUXJRXOoSiImLqawyc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=b8+R0etHiVQ47UyxJGAVTJwk9o0OKpH5QH5m3VAroVXPEJVxIbe5yHtaLrbN7CeGt
 15Aygl6Gl82pSXfmr/puIzdZiKO7RkqjonUecglgsOW56xFjOkNuKc+ODGr88roUqW
 B4Ego5bM9RxWzqbl/bwQoI/p/t7YRgCucRRe2W3DZlrxp/9GuWKCExq1ZOSUfTUtVO
 tC8afGtIgOn0kUoO/nrI+4+n1YI2cHQo2sU83VGbsquJMDFhy+GPMWiXUuX8as58RF
 SgvfeDlJp96jf/2Sp8jCFtPwP1i3wP6/9D0vTSqqDtl1XhSBNQabYBwZgg+rauYFfD
 Oq/VT22C3UyTw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <GuBTyEijVU0rrtfv9-VMzLYX-q8f4kGYQIEEngcvH-c5r1uYBQNJCeLEMpr7BTMrnUkpuJtNww5USab5xAAAHJShH5feJhuOnvyNkuxBulk=@emersion.fr>
In-Reply-To: <Yw3lcjg0yQ+R1CUV@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr> <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
 <Yw3FdhzAst1RRPxy@intel.com> <20220830114010.3ea02874@eldfell>
 <Yw3lcjg0yQ+R1CUV@intel.com>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 30th, 2022 at 12:24, Ville Syrj=C3=A4l=C3=A4 <ville.syrj=
ala@linux.intel.com> wrote:

> > > The current behaviour is to fall back to a blit if the async
> > > flip fails. So you still get the same effective behaviour, just
> > > not as efficient. I think that's a reasonable way to handle it.
> >
> > That's purely an Xorg thing, right?
>=20
> Yes.
>=20
> >
> > Should Wayland compositors implement the same thing is a good question.
>=20
> Is the whole tear+wayland situation more or less up in the air still?

The goal of the patches I'm sending is to allow Wayland compositors to requ=
est
tearing. We also have a WIP protocol extension for this [1].

[1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reque=
sts/65
