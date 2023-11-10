Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B377E7CEB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098C410E062;
	Fri, 10 Nov 2023 14:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F3A10E062
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699625881; x=1699885081;
 bh=WlbY2LEAk7LpUpUbD6ACqRnYpPaSJntxyx/r3mg6PqY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=omSmWRM4RmDX2trrkjFoAzDYm/uWlrYXbdrZy46V1oLM+UjdCKhZmGVzYsDxkd+2T
 RMiB2Va1eJ0oS5FXeLFwcKWyA3rDs3nrBmx0Lr/k7F1GbVvGtz8JwyLXDMN0g9semQ
 e0DLL0Lw0V93ezuh0YqYL4Q6MLbaaD+prp2M6VvLDHI5cB+fqxp2wjBK1lx0/5yuoY
 fgEFOHewzMsCJ8ymLfY9rDM87+gsj7gF6+F0cMGjqSYuFDU/RP5fKk3SDmAGPrmQTq
 RKD+/Ky73DpRvzL3DUI/3238VfsW9rBfwTVRS+baTK2es+MaJfB1aOoAVlvr8ZYL6K
 tuqdmf3NBh64Q==
Date: Fri, 10 Nov 2023 14:17:45 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <2pDb5-Ul5-NYArg5AkCgZg5-U26_xReMq03Y4rfPqsLur5DWRKOJQLQss27qxhUJrngcReeuXZbAzSHokMy8e2xjBJTCAeefUojHHptiBdQ=@emersion.fr>
In-Reply-To: <l72427ml6ljlbbf732pilstfavqznrtmdvz3pkn7vc5vgqxm6j@2kyg6bgjygce>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
 <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
 <oTp8iN2ODz4pEo4WpvMQ5HWhBfoPYzA4aGKhe04iKaGNo7dn1G3Uw04Nsw6ZKlflcboqsp_gPb-V6mqGCLwT-V68O6JzBYbua56bLq0H51s=@emersion.fr>
 <l72427ml6ljlbbf732pilstfavqznrtmdvz3pkn7vc5vgqxm6j@2kyg6bgjygce>
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
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, November 10th, 2023 at 15:13, Maxime Ripard <mripard@kernel.org>=
 wrote:

> > > > We've talked with Sima at XDC about adding a symlink pointing to th=
e
> > > > DMA heap and extra metadata files describing priorities and such.
> > > > However we don't actually need that part for the purposes of v3d --
> > > > I think I'd rather defer that until more DMA heaps are plumbed
> > > > across the DRM drivers.
> > >=20
> > > Honestly, I don't think we can afford to only consider vc4/v3d here. =
The
> > > issue you described seem to affect any SoC with a split scanout/GPU,
> > > which is pretty much all of them? And if they are all affected, we
> > > should design something that fixes it once and for all.
> >=20
> > We don't need any sysfs stuff to fix the primary node and DRM dumb buff=
er
> > issues in Mesa's kmsro/renderonly. The sysfs stuff is only required for=
 a fully
> > generic buffer placement constraint/compatibility uAPI. Which would be =
super
> > useful in compositors, but let's do one step at a time.
>=20
> I don't think a solution that further fragments the ecosystem is worth
> taking, sorry. What you're doing is valuable, we should totally fix the
> issue you have, but not at the expense of making vc4 special on one of
> the platforms it supports.

This does not fragment the ecosystem. It moves the ecosystem bit by bit
towards the final solution.
