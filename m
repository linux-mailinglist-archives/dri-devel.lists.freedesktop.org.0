Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672F60082D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 09:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999B210E39B;
	Mon, 17 Oct 2022 07:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3959 seconds by postgrey-1.36 at gabe;
 Mon, 17 Oct 2022 07:55:36 UTC
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A57510E341
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:55:36 +0000 (UTC)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29H6i57k008119;
 Mon, 17 Oct 2022 01:44:06 -0500
Message-ID: <365fe5029716e589eaef71ababf27a459348f9ff.camel@kernel.crashing.org>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Javier Martinez Canillas <javierm@redhat.com>, Michal
 =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Oct 2022 17:44:05 +1100
In-Reply-To: <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
References: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
 <20221012142707.GD28810@kitsune.suse.cz>
 <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, mark.cave-ayland@ilande.co.uk,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Geert Uytterhoeven <geert@linux-m68k.org>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-10-13 at 09:39 +0200, Javier Martinez Canillas wrote:
> > In absence of such test results I think the most reasonable thing is to
> > keep the logic that nobody complained about for 10+ years.
> >=20
>=20
> I agree with Michal and Thomas on this. I don't see a strong reason to no=
t
> use the same heuristic that the offb fbdev driver has been doing for this=
.
>=20
> Otherwise if this turns out to be needed, it will cause a regression for =
a
> user that switches to this driver instead. Specially since both fbdev and
> DRM drivers match against the same "display" OF compatible string.

I agree.

In the end, what it boils down to is, we don't know, we should guess. The
endianness of the kernel is as good a guess as anything here.

If not that, then assume BE.

That code was originally written for old macs. Those could simply not boot
anything other than a BE kernel. OF would always setup a 8bpp fb (so endian=
ness
is irrelevant) but BootX could setup something else.

There's almost no old LE powerpc system out there, and I'm reasonably sure
actually none of any relevance to this code.

That leaves us with newer systems capable of endian switching. Those should=
 just
get the property added.

I don't know of many cases out there. There' SLOS on powerpc which still wo=
n't
set it (which is what qemu uses). That could just be fixed. In the meantime
it makes sense for the kernel to follow its existing behaviour.

Cheers,
Ben.
