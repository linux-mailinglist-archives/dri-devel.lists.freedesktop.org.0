Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D76A83A1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 14:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E01C10E4FC;
	Thu,  2 Mar 2023 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A87010E4FC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 13:38:08 +0000 (UTC)
Date: Thu, 02 Mar 2023 13:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677764286; x=1678023486;
 bh=XTpwZ1j3tnEo1xBLShuGPXMzvr9a6sRistIxvod9uBc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=cJu7nRqR7/c9y/AgG+/dPhRCppZTJsYLcqQUZmjLZ6nZKsXoMD/4e44TkJ8lgLgs5
 DjD3AjYzCva59yPq1MR1exod5bT4DkWiATaSrXMoVvvAssndIE6+bX+96FUrsx6MTQ
 A2DORK4SceXK2ezBaP4kXXzWN3Cwfh/U5kFBqtznMedMXT6z5DDn+xkDerEYFkPvxE
 v6XMrQM+yZGUtnYApIjnEM+FiPcvtXoE5tVAXHDCQo1u1Yy9eKK3tTTlnAnpAq4ak2
 fylDpCWfRCI6F9EuXwO7r3401R+UnKnAvldot2qpgXDihMex/6wnkkGTZqXx/0kQWl
 +GMdEsPwnvWag==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Message-ID: <IYfrkM6pX_UG4YmuGWHn_Svt3v41GcYgn5cUdbs1__7MI0VbE7-u_t4HR0w5TRsnp5UHgVm5EaXevgskKbiQ--cG9xF4FeWeObnC5Gto2Vk=@emersion.fr>
In-Reply-To: <e5b9ee07-f74a-8d00-066e-92c9c23eb32b@amd.com>
References: <20230301222903.458692-1-contact@emersion.fr>
 <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
 <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
 <e5b9ee07-f74a-8d00-066e-92c9c23eb32b@amd.com>
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

On Thursday, March 2nd, 2023 at 14:21, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:

> Am 02.03.23 um 11:14 schrieb Simon Ser:
>=20
> > On Thursday, March 2nd, 2023 at 08:11, Christian K=C3=B6nig christian.k=
oenig@amd.com wrote:
> >=20
> > > Am 01.03.23 um 23:29 schrieb Simon Ser:
> > >=20
> > > > We don't populate gem_prime_import_sg_table so only DMA-BUFs
> > > > exported from our own device can be imported. Still, this is useful
> > > > to user-space.
> > > > But what happens if one of your BOs is imported into another device=
?
> > > > Is there a way to make this fail, always?
>=20
> Well you could return an error from the attach callback if I'm not
> completely mistaken.

Hmm, but with GEM helpers this is handled by drm_gem_map_attach(). That
function calls drm_gem_object_funcs.pin but doesn't pass along the
dma_buf_attachment so there no way to reject the attach based on the
other device there=E2=80=A6

Would it be unreasonable to add a drm_driver.gem_prime_attach hook? Or
is there a better way to implement this?
