Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52D5996BD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 10:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D5F10E8FD;
	Fri, 19 Aug 2022 08:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906310E963
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:16:20 +0000 (UTC)
Date: Fri, 19 Aug 2022 08:16:07 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="dvDBH8I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1660896971; x=1661156171;
 bh=A8ZPr/CVBT17Ov3I8UX0Pi8jH12CSafKVEWk+1EVHus=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=dvDBH8I6nRa0C59EX8m5Skd48Mu5hAj8ZvOrnTe4tIQOFy+gd6kPIj3rjZ2KB+u5/
 ibLcUDJyfcX4q6fu+O5V7l6LxIWQuDYyacEq45qBQjzu5LZ3b1YcDkBFdQN24O1wkN
 8BT1WkL8GDGoEud1sfPrShKbCMldOwtjvq+AVQ+B2jb21tFf7Q48l0r8fIs8ek/Dg6
 mkfFRA1469ZF90xYf7zU+yBwmT81zG9qu5E4+KcLDjMDtY1vuo3iciGVaUQSFWrk9m
 11gOnBvJxTJIE7Dv9TxqJDJCppHA1gqWHd/vzEsKwUPpXDbYdmk0MTNq62oFwhc5ay
 BPMJu4H297QQw==
To: =?utf-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/3] drm: Use full allocated minor range for DRM
Message-ID: <QfMoMae4qM8am6w1mha9iE_XrkqBLaR3r0gaT8oxaXDgysa0_8Si7kQuirRgJ-x_4YPILalQsNJKJqyi5ZDScnPUv65cPwd0y3di5Dntmrw=@emersion.fr>
In-Reply-To: <20220818120616.xuhlnsckjd4octwb@nostramo.hardline.pl>
References: <20220817230600.272790-1-michal.winiarski@intel.com>
 <wWV4E0y1qoweGL7vMn0IgY903SnA0rN5qqy_58NIvSX9j0XkFb1JKTmea4HhNCPsxCUe88Ni7HUa2Bu1UMIxtZZh1nrIR3aVaoooDiAaUvU=@emersion.fr>
 <20220818120616.xuhlnsckjd4octwb@nostramo.hardline.pl>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(It seems like the list was dropped in my reply, sorry about that.
Re-adding it now.)

On Thursday, August 18th, 2022 at 14:06, Micha=C5=82 Winiarski <michal.wini=
arski@intel.com> wrote:

> On Thu, Aug 18, 2022 at 07:39:13AM +0000, Simon Ser wrote:
>=20
> > Hm, I'm a bit worried about the user-space implications of this=
=E2=80=A6 e.g. libdrm
> > can check for the major/minor to find out the type of a node. Dropping =
CONTROL
> > from the enum will break that.
>=20
> Yeah, but that would only cause problems if there are more than 64 device=
s in
> the system, and the user-space in question is smart enough to support tha=
t.
>=20
> IIUC libdrm only looks for 16 devices:
> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/xf86drm.h#L47
>=20
> I'm not very familiar with mesa codebase, but I think it has something si=
milar:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/auxiliar=
y/pipe-loader/pipe_loader_drm.c#L52
>=20
> I expect other clients to also have something similar (loop over minors, =
0-63
> for primary, 128-191 for render).
>=20
> So this shouldn't really cause a regression, it's just that "old" userspa=
ce
> won't be able to use more devices (but it's also not able to use more dev=
ices
> without this series).

Unfortunately I think there are more assumptions all over the place, see e.=
g.
drmGetMinorType:
https://gitlab.freedesktop.org/mesa/drm/-/blob/main/xf86drm.c#L986

Also I'm not very found of dropping DRM_NODE_CONTROL from the kernel enum -=
-
this results in DRM_NODE_RENDER=3D1 in the kernel but DRM_NODE_RENDER=3D2 i=
n
user-space which sounds pretty error-prone.

> I could go with 0-63 primary, 64-127 empty, 128-191 render, 192-255 prima=
ry,
> 256-319 empty, (...)
> But it just seems like a waste to burn 1/3 of minors.

Could potentially work I guess.

> Perhaps it would also be possible to go with:
> 0-63 primary, 64-127 empty, 128-191 render, 192-512K continuous range
> where we distribute minors first-come first-serve, without any link to ty=
pe (so
> usually we'd get continuous card192, renderD193, and so on)

We would need to re-design drmGetMinorType if we go down this path.
