Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5117465F3D1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908310E1BB;
	Thu,  5 Jan 2023 18:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F1B10E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:36:31 +0000 (UTC)
Date: Thu, 05 Jan 2023 18:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672943788; x=1673202988;
 bh=rJ9JcjtQqZL1h/V8XE0YzRIcXNpJEn4NyBXn5iot1/I=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=k+br2ZmVNyfsn4DftU0G9Jt2v+T1DFpD9NLn7hfE7PKKOxuqukhNPX96RsvhMtvnQ
 6Q++paatUkUuL5S2kpG5Pyj5lcrMq/OJkG3L3CMOQ9XdQMhoxMj0fZY2U9Kw/zIxaw
 v9wqxCBiWnQfP2tr5Id4468aeLJrXJvETBk/RYWv+8pSLNtT7AvuczChvuNfyDENQ7
 8rJLxW1f0axQXdV7j43vYHXFW9ZYK6+55W/mdt8YxyCI8W1PaUI9b8b/piWuJtrA4t
 6GHzob9MOUgNK1Oe+dCqEGwgY6MtzNhVxAeGu5iZmEB9f7lZHvC8TdnBlPQNjyp1OA
 bmp6K05PdVghQ==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <UBhD-Gmig3Df3ErqWGXZZ1hWkfdkPBywcckHxoKwwoc3N33Uf8rQumRw-nlsyrk9r8-KINUU8Evudytuu3lLcFnNZijSV3LbA0K8UVagpHc=@emersion.fr>
In-Reply-To: <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
 <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 5th, 2023 at 19:30, Ma=C3=ADra Canal <mcanal@igalia.co=
m> wrote:

> > > > I think to really make sure we have consensus it'd be good to exten=
d this
> > > > to a series which removes all the callers to drm_any_plane_has_form=
at()
> > > > from the various drivers, and then unexports that helper. That way =
your
> > > > series here will have more eyes on it :-)
> > >=20
> > > I took a look at the callers to drm_any_plane_has_format() and there =
are only
> > > 3 callers (amdgpu, i915 and vmwgfx). They all use drm_any_plane_has_f=
ormat()
> > > before calling drm_framebuffer_init(). So, I'm not sure I could remov=
e
> > > drm_any_plane_has_format() from those drivers. Maybe adding this same=
 check
> > > to drm_gem_fb_init() and refactor the drivers to make them use drm_ge=
m_fb_init(),
> > > but I guess this would be part of a different series.
> >=20
> > Well vmwgfx still not yet using gem afaik, so that doesn't work.
> >=20
> > But why can't we move the modifier check int drm_framebuffer_init()?
> > That's kinda where it probably should be anyway, there's nothing gem
> > bo specific in the code you're adding.
>=20
>=20
> I'm not sure if this would correct the problem that I was trying to fix i=
nitially.
> I was trying to make sure that the drivers pass on the
> igt@kms_addfb_basic@addfb25-bad-modifier IGT test by making sure that the=
 addfb
> ioctl returns the error.
>=20
> By moving the modifier check to the drm_framebuffer_init(), the test woul=
d still
> fail.

Hm, why is that? The ADDFB2 IOCTL impl calls drm_framebuffer_init().
