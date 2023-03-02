Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5D6A8446
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 15:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5DD10E501;
	Thu,  2 Mar 2023 14:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC90410E501
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 14:36:23 +0000 (UTC)
Date: Thu, 02 Mar 2023 14:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677767781; x=1678026981;
 bh=osR+yWGrTbNMaC3x31zUC/jYYodHzr/0r0AvwQDKMBo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=pAVnr/re5+sJSPD87XgeslJROX/vuOYr4qe5s7kPJb7tvvITELls8Kk55xOcZOmrp
 PQVtDKRZEGPyKvYMVloK2zLC8vNWZkO1Rikvk7u8rWKrHhujOelazq2QYdPzcnFyhT
 +rSW1rKMCF4EgWBl/KNSwe+O5P1EBMOjYNgsLKoNu+hAw9JIU55C2SLQJ9vTyMs+wN
 IDJaVJTtEBJmZbT9oBj32fIjiHDvOMtyrWJKWEfjpL+Vz6cEmCPlIBm7QpGp4qyx/Q
 MLdfj7l6w5RxLTl351cMEQe8eP1zZcurYmHJRlK2PznQuqChbW55aFlXLorLHbfwdP
 YSRJknH4byWFg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Message-ID: <LWuF905lxdxiaPJPZpK3MwHLO2SMHUNJ2O0zfdcn9yqMw3A_FEkqyAWtFvcSMqgK9m8dR83ouYD_914iyB06yngDdPB7qxZR9InSQTTc7OA=@emersion.fr>
In-Reply-To: <88d22a5b-a9b2-2c36-4f97-61a9457de5ff@amd.com>
References: <20230301222903.458692-1-contact@emersion.fr>
 <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
 <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
 <e5b9ee07-f74a-8d00-066e-92c9c23eb32b@amd.com>
 <IYfrkM6pX_UG4YmuGWHn_Svt3v41GcYgn5cUdbs1__7MI0VbE7-u_t4HR0w5TRsnp5UHgVm5EaXevgskKbiQ--cG9xF4FeWeObnC5Gto2Vk=@emersion.fr>
 <88d22a5b-a9b2-2c36-4f97-61a9457de5ff@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 2nd, 2023 at 14:45, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:

> Am 02.03.23 um 14:37 schrieb Simon Ser:
>=20
> > On Thursday, March 2nd, 2023 at 14:21, Christian K=C3=B6nig christian.k=
oenig@amd.com wrote:
> >=20
> > > Am 02.03.23 um 11:14 schrieb Simon Ser:
> > >=20
> > > > On Thursday, March 2nd, 2023 at 08:11, Christian K=C3=B6nig christi=
an.koenig@amd.com wrote:
> > > >=20
> > > > > Am 01.03.23 um 23:29 schrieb Simon Ser:
> > > > >=20
> > > > > > We don't populate gem_prime_import_sg_table so only DMA-BUFs
> > > > > > exported from our own device can be imported. Still, this is us=
eful
> > > > > > to user-space.
> > > > > > But what happens if one of your BOs is imported into another de=
vice?
> > > > > > Is there a way to make this fail, always?
> > > > > > Well you could return an error from the attach callback if I'm =
not
> > > > > > completely mistaken.
> > > > > > Hmm, but with GEM helpers this is handled by drm_gem_map_attach=
(). That
> > > > > > function calls drm_gem_object_funcs.pin but doesn't pass along =
the
> > > > > > dma_buf_attachment so there no way to reject the attach based o=
n the
> > > > > > other device there=E2=80=A6
> >=20
> > Would it be unreasonable to add a drm_driver.gem_prime_attach hook? Or
> > is there a better way to implement this?
>=20
> That would be the mid layering we usually try hard to avoid.

Indeed!

> Your obj doesn't implement the obj->funcs->get_sg_table() callback
> doesn't it? In this case drm_gem_map_dma_buf() would fail just a little
> bit later anyway.
>=20
> What you could do is to add a check for the get_sg_table callback a bit
> earlier in drm_gem_map_attach() and if that's not implemented reject the
> attachment.

That's a good idea, thanks for the suggestion! Done in v2.
