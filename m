Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A0755FAB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C32A10E214;
	Mon, 17 Jul 2023 09:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED69910E214
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:45:43 +0000 (UTC)
Date: Mon, 17 Jul 2023 09:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689587141; x=1689846341;
 bh=oXtIh0hpYCfWsqtZYZH7Ka/OxBZoYfd5CoM9zjqBZ2s=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=jJ24DrjD6KU8yaNwS7VsF1Ne1JK7b3Eg9Zns5hcmx9Q09pPafm015E9E8wd8YZST0
 +XfMvgBGIdn7lI2MHaBv5iMjSNAu8WQL+xbeWlI0B7TLeAMshdOCPaEAfGfiHifS7L
 d44ymDXNla2IcuqseOIzxoa/nEkBo+9+Gr7jUG+kM9RjQFR9piWaAwMI1cIQT1U1W9
 GmIwlAPNE5zazMpY2+vYkMkJnVU1PRuW68+S0w7VgkhH5ArapC2wRIaI4fl3OnCJu1
 dKCOGepsDI9r1SfxAIZ/R0DdOKgusG9vtvkbMjGyAw9CXV2lpltFzqgaA6ZXFBTGAx
 V05oEbJzQ3dhw==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: support up to 128 drm devices
Message-ID: <PguMcqMlRDvAT5fdpZfgyOWT8DQ1ZLXhgLD0puLL8l0ZYj0UiBvDclFp54l3ov1vH9A7whpUQhY4H65Fh3u6a4aXZzK5a_6fgSKpi4_PXx8=@emersion.fr>
In-Reply-To: <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
 <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, July 17th, 2023 at 09:30, Emil Velikov <emil.l.velikov@gmail.com=
> wrote:

> > I'm worried what might happen with old user-space, especially old libdr=
m.
>=20
> I also share the same concern. Although the bigger issue is not libdrm
> - since we can update it and prod distributions to update it.
> The biggest concern is software that cannot be rebuild/updated -
> closed source and various open-source that has been abandoned.

Well. Now that we have Flatpak and AppImage and friends, we're really likel=
y
to have old libdrm copies vendored all over the place, and these will stick
around essentially forever.

> For going forward, here is one way we can shave this yak:
>  - update libdrm to max 64 nodes
>  - roll libdrm release, nag distributions to update to it // could be
> folded with the next release below
>  - update libdrm to use name driven type detection
>  - roll libdrm release, nag distributions to update to it
>  - once ^^ release hits most distributions, merge the above proposed
> kernel patch
>    - the commit message should explain the caveats and fixed libdrm versi=
on
>    - we should be prepared to revert the commit, if it causes user
> space regression - fix (see below) and re-introduce the kernel patch
> 1-2 releases later

That sounds really scary to me. I'd really prefer to try not to break the
kernel uAPI here.

The kernel rule is "do not break user-space".
