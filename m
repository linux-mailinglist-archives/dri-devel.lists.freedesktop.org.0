Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857966E4B13
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8C10E52B;
	Mon, 17 Apr 2023 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1555610E52B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:13:45 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1poPbr-002HuW-Kt; Mon, 17 Apr 2023 16:13:35 +0200
Received: from p5b13a017.dip0.t-ipconnect.de ([91.19.160.23]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1poPbr-0043co-Cy; Mon, 17 Apr 2023 16:13:35 +0200
Message-ID: <0b07fbadce4512e4696750cf69cf3fbbf38355a3.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 16/19] arch/sh: Implement <asm/fb.h> with generic
 helpers
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, 
 daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
 gregkh@linuxfoundation.org
Date: Mon, 17 Apr 2023 16:13:33 +0200
In-Reply-To: <132f1185-d61f-b8c7-8d6e-4e4280a1a4ad@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <20230417125651.25126-17-tzimmermann@suse.de>
 <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>
 <132f1185-d61f-b8c7-8d6e-4e4280a1a4ad@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.160.23
X-ZEDAT-Hint: PO
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas!

On Mon, 2023-04-17 at 16:06 +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.04.23 um 15:02 schrieb John Paul Adrian Glaubitz:
> > Hi Thomas!
> >=20
> > On Mon, 2023-04-17 at 14:56 +0200, Thomas Zimmermann wrote:
> > > Replace the architecture's fbdev helpers with the generic
> > > ones from <asm-generic/fb.h>. No functional changes.
> > >=20
> > > v2:
> > > 	* use default implementation for fb_pgprotect() (Arnd)
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> > > Cc: Rich Felker <dalias@libc.org>
> > > Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > > ---
> > >   arch/sh/include/asm/fb.h | 15 +--------------
> > >   1 file changed, 1 insertion(+), 14 deletions(-)
> > >=20
> > > diff --git a/arch/sh/include/asm/fb.h b/arch/sh/include/asm/fb.h
> > > index 9a0bca2686fd..19df13ee9ca7 100644
> > > --- a/arch/sh/include/asm/fb.h
> > > +++ b/arch/sh/include/asm/fb.h
> > > @@ -2,19 +2,6 @@
> > >   #ifndef _ASM_FB_H_
> > >   #define _ASM_FB_H_
> > >  =20
> > > -#include <linux/fb.h>
> > > -#include <linux/fs.h>
> > > -#include <asm/page.h>
> > > -
> > > -static inline void fb_pgprotect(struct file *file, struct vm_area_st=
ruct *vma,
> > > -				unsigned long off)
> > > -{
> > > -	vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> > > -}
> >=20
> > Looking at the macro in asm-generic/fb.h, fb_pgprotect() is being repla=
ced with
> > a no-op function. Is that intentional? Can you briefly explain the back=
ground
> > for this change?
>=20
> Patch 01 of this patchset changes the generic fb_pgprotect() to set=20
> pgprot_writecombine(). So on SH, there should be no change at all.
>=20

Ah, I missed that, thanks for the explanation. Let me check and Ack your pa=
tch
then. I assume you will be taking this patch as part of the whole series th=
rough
your own tree?

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
