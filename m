Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA426C39A5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 20:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334710E7E9;
	Tue, 21 Mar 2023 19:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5610E7DD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 19:00:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BF00B81974;
 Tue, 21 Mar 2023 19:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B8C433EF;
 Tue, 21 Mar 2023 18:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679425199;
 bh=6arZelYocI9orClpYNJvmJalsRRqOtIofHAidD2kpgc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YVGYrrb229pmXs31wu9ec3dL/4JNjxBCPiT5rIaXuKDXrem3e58pXoN4h+XylkRha
 lTYnQuPOcaCk9fFxy6qH3CgY0IJMFFjKIxLYDVedTTE4BRpzkEs+w0JVkyOAYpama3
 LGLYVeEy1Oj4gH+EnqKpBM7dsDg6Nv9RqMIIJYyJQ+B7TZTJNVWtRaO8/Q6bskDtoN
 G16W10tsr3dQZkb4RxrkA9NdEG+6fd/hAzCEEP/yqOJPBT7k4nJ3HYCun61RwUpl3D
 U5NxRjzrIVjE42/ihOBqnBcW8Vybrhs0UPBLte930ZdkcM1uYmPjyeehcwiUxPBqkV
 JhSneKkcBeSIQ==
Message-ID: <3479e3d4e5e1d84243ca35398ab392ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d13cd7bf-0b1e-e9e1-266a-00db40e51de7@gmail.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
 <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
 <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
 <d13cd7bf-0b1e-e9e1-266a-00db40e51de7@gmail.com>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
From: Stephen Boyd <sboyd@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Tue, 21 Mar 2023 11:59:57 -0700
User-Agent: alot/0.10
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matti Vaittinen (2023-03-20 22:45:52)
> Morning Stephen,
>=20
> On 3/20/23 21:23, Stephen Boyd wrote:
> > Quoting Matti Vaittinen (2023-03-18 23:36:20)
> >>>
> >>> I think you would have an easier time if you just copied and renamed
> >>> them into the kunit folder as an preparation series.
> >>
> >> Yes. That would simplify the syncing between the trees. It slightly bu=
gs
> >> me to add dublicate code in kernel-but the clean-up series for DRM use=
rs
> >> could be prepared at the same time. It would be even possible to just
> >> change the drm-helper to be a wrapper for the generic one - and leave
> >> the callers intact - although it leaves some seemingly unnecessary
> >> "onion code" there.
> >>
> >>> That way, you wouldn't have to coordinate DRM, CCF and IIO, you'd just
> >>> create new helpers that can be reused/converted to by everyone eventu=
ally
> >>
> >> Yes. Thanks - I think I may go with this approach for the v5 :)
> >=20
> > Which kunit directory?
>=20
> I was thinking of adding the platform_device.h (I liked your suggestion) =

> in the include/kunit/

Ok, thanks for clarifying.

>=20
> > I imagine if there are conflicts they will be
> > trivial so it probably doesn't matter.
>=20
> Probably so. Still, I am not the one who needs to deal with the=20
> conflicts. Hence I like at least asking if people see good way to avoid=20
> them in the first place.

Same for me. I'm not the maintainer of the drivers/base directory.

>=20
> Besides, I was not sure if you were planning to add similar helper or=20
> just wrappers to individual functions. Wanted to ping you just in case=20
> this has some impact to what you do.

I don't have a need to bind a device to a driver to satisfy devm APIs
currently. I could probably use it though to test some devm code in the
clk APIs. The only impact is that we're modifying the same files.

>=20
> > Have you Cced kunit folks and the
> > list on the kunit patches? They may have some opinion.
>=20
> This patch was should have contained the=20
> include/kunit/platform_device.h. That file was pulling the Kunit people=20
> in recipients but I messed up things with last minute changes so both=20
> the header and people were dropped. I'll fix this for v5.
>=20

Ok, I'll be on the lookout for v5. From what I can tell kunit goes
through the kernel selftest tree and there isn't a kunit git tree as
such.
