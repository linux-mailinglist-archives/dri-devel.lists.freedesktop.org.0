Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7FF65F3FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3067110E491;
	Thu,  5 Jan 2023 18:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9C610E125
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:54:08 +0000 (UTC)
Date: Thu, 05 Jan 2023 18:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672944847; x=1673204047;
 bh=/rHGqTfXb/2RdH4XjH2NYoItpm9O937H7tl+cVwQdoI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gu9sxWdhMxvMbCOLRRrRhtZCY4AAbKUNyg8hdDs2m3VxqQym2cFZrM093syG9KzxV
 JSxOX310qwNOPmWRw7QZxmZkUqpRKVEy2SRN0chfJxHp3fed10+4+O+8dTuzHHorqq
 pV7R0nVTJP8QeGijrF1JntbVaIslU7mnWBGdCxKaoxFO3ijGSY1CIKoMe5/HtH2VUt
 U1N/6TbVv+NH8wXswWiZAmZSMqVaKcklqVSlFzkkR1Neam/2SYYtMII8+wuk3MmKJh
 sc8hJ3MWTMIHNDstW3QlyccQf8VOXx8ptFo8F3MY8tS5FhiSSsd0gOiaLhd8Qgg9Ee
 f/O4tq9R/LJGw==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <ukOECyKlhRh1kJyKRS31jhyXsjawb6urSVNYuLkOjRC15BbVEif1wANfPtHAjzLAirubEc8oGt56k6GsUjSSQYeDSbwq2uwYBFsvAAFMwXQ=@emersion.fr>
In-Reply-To: <ccc74a8e-a7f9-7eb1-22b6-9bce60bdcdc7@igalia.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
 <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
 <UBhD-Gmig3Df3ErqWGXZZ1hWkfdkPBywcckHxoKwwoc3N33Uf8rQumRw-nlsyrk9r8-KINUU8Evudytuu3lLcFnNZijSV3LbA0K8UVagpHc=@emersion.fr>
 <ccc74a8e-a7f9-7eb1-22b6-9bce60bdcdc7@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 5th, 2023 at 19:48, Ma=C3=ADra Canal <mcanal@igalia.co=
m> wrote:

> On 1/5/23 15:36, Simon Ser wrote:
>=20
> > On Thursday, January 5th, 2023 at 19:30, Ma=C3=ADra Canal mcanal@igalia=
.com wrote:
> >=20
> > > > > > I think to really make sure we have consensus it'd be good to e=
xtend this
> > > > > > to a series which removes all the callers to drm_any_plane_has_=
format()
> > > > > > from the various drivers, and then unexports that helper. That =
way your
> > > > > > series here will have more eyes on it :-)
> > > > >=20
> > > > > I took a look at the callers to drm_any_plane_has_format() and th=
ere are only
> > > > > 3 callers (amdgpu, i915 and vmwgfx). They all use drm_any_plane_h=
as_format()
> > > > > before calling drm_framebuffer_init(). So, I'm not sure I could r=
emove
> > > > > drm_any_plane_has_format() from those drivers. Maybe adding this =
same check
> > > > > to drm_gem_fb_init() and refactor the drivers to make them use dr=
m_gem_fb_init(),
> > > > > but I guess this would be part of a different series.
> > > >=20
> > > > Well vmwgfx still not yet using gem afaik, so that doesn't work.
> > > >=20
> > > > But why can't we move the modifier check int drm_framebuffer_init()=
?
> > > > That's kinda where it probably should be anyway, there's nothing ge=
m
> > > > bo specific in the code you're adding.
> > >=20
> > > I'm not sure if this would correct the problem that I was trying to f=
ix initially.
> > > I was trying to make sure that the drivers pass on the
> > > igt@kms_addfb_basic@addfb25-bad-modifier IGT test by making sure that=
 the addfb
> > > ioctl returns the error.
> > >=20
> > > By moving the modifier check to the drm_framebuffer_init(), the test =
would still
> > > fail.
> >=20
> > Hm, why is that? The ADDFB2 IOCTL impl calls drm_framebuffer_init().
>=20
>=20
> From what I can see, ADDFB2 IOCTL calls drm_internal_framebuffer_create()=
 [1],
> then drm_internal_framebuffer_create() calls the fb_create hook [2]. I'm =
not sure
> here ADDFB2 implicitly calls drm_framebuffer_init(), but I'm probably mis=
sing
> something.

Right, but then all drivers will call drm_framebuffer_init() somewhere
in their fb_create hook. For instance amdgpu calls it in
amdgpu_display_gem_fb_verify_and_init().
