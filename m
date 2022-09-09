Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B55B3A37
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AF510ED81;
	Fri,  9 Sep 2022 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7C310ED80;
 Fri,  9 Sep 2022 14:01:19 +0000 (UTC)
Date: Fri, 09 Sep 2022 14:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1662732077; x=1662991277;
 bh=C60pLuHud11D9nKtULfHTleE6psuGlBBf0zrVj1sYT4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=Z134zbWZCH9feKKvWvxNtE6VXOgGfDe0zX8wGsq0jFNzb48PWQeziYqTCqgNkTEha
 oviL8+IC3Ldg0GcENSVDm/ekNg4l7u61uNXZX2ps84VLODQ2Q8s6rOFSd9QtniezMs
 M0+18zSXBlU/AjMHCNkIFmwc81EyMjF6Pr2bZm0SjsuyrVCww2gdgP35oyyGXMZ2EC
 NM2tIiFfyrVQxdKvuH8ieb+YQ3iD8eXm3jpl7awqxcYU8sR2YfalZly0zdtnUc04Fb
 UbZVMHle+PDJYWjM77C9ivcz/+jDoC5RB5YbD1tgJm7n+8voBQxlHYFEP6rpnvtgzX
 wZJJslJG7vkwA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <cQQRkjfHJeWwk18cW3TwpfFVRGqL3_aYkpiV-SAIdMk70Qs9nIm2zzIc_a_4jLwzPDLtUZZG221h8fCk0dLdyjKHBrsufJWPh7HhEkcWx6c=@emersion.fr>
In-Reply-To: <20220909165346.51e92499@eldfell>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
 <20220909165346.51e92499@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 9th, 2022 at 15:53, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> On Fri, 09 Sep 2022 13:39:37 +0000
> Simon Ser contact@emersion.fr wrote:
>=20
> > On Friday, September 9th, 2022 at 12:12, Hans de Goede hdegoede@redhat.=
com wrote:
> >=20
> > > Phase 3: Deprecate /sys/class/backlight uAPI
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > Once most userspace has moved over to using the new drm_connector
> > > brightness props, a Kconfig option can be added to stop exporting
> > > the backlight-devices under /sys/class/backlight. The plan is to
> > > just disable the sysfs interface and keep the existing backlight-devi=
ce
> > > internal kernel abstraction as is, since some abstraction for (non GP=
U
> > > native) backlight devices will be necessary regardless.
> > >=20
> > > It is unsure if we will ever be able to do this. For example people u=
sing
> > > non fully integrated desktop environments like e.g. sway often use cu=
stom
> > > scripts binded to hotkeys to get functionality like the brightness
> > > up/down keyboard hotkeys changing the brightness. This typically invo=
lves
> > > e.g. the xbacklight utility.
> > >=20
> > > Even if the xbacklight utility is ported to use kms with the new conn=
ector
> > > object brightness properties then this still will not work because
> > > changing the properties will require drm-master rights and e.g. sway =
will
> > > already hold those.
> >=20
> > I replied to this here in another thread 1.
> >=20
> > tl;dr I think it would be fine even for Sway-like compositors.
>=20
> Furthermore, if other compositors are like Weston in their KMS state
> handling, and do not track which property has already been programmed
> to KMS and which hasn't, and instead just smash all KMS properties
> every update anyway (it's also great for debugging, you always have the
> full state in flight), anything changed via sysfs will be immediately
> reverted.
>=20
> Therefore I think there is a high probability that the external or
> sysfs controls just naturally stop working anyway, even if the kernel
> does not remove them first.

Ah yes, that's a good point. And this wouldn't be a kernel regression,
it would be user-space like Sway or Weston taking the decision to use
the new uAPI in a way which breaks the sysfs interface.

(User-space could also take the decision to _not_ break the sysfs
interface, by implementing a simple "dirty" flag.)
