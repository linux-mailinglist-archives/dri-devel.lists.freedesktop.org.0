Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE634F8DF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50796E9DD;
	Wed, 31 Mar 2021 06:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Tue, 30 Mar 2021 23:50:59 UTC
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3EF6E990
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 23:50:59 +0000 (UTC)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4F95Yb3zB7zyd1;
 Wed, 31 Mar 2021 10:41:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
 s=201702; t=1617147670;
 bh=uKyEWSIcHfUcK8zBcsDH41txsKVfTheNfEODQV2NebA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YAl6PvyLl3bAPBNH3zi++L8Ie9uhwOlFzJ6+gj0h+CcibpE0+7KrzBwjODt6K1Bxo
 ltE1Q2vh9NFMMxCd3Li0qMkKQOK62p8Dc/QKRvF6BJSoDAKorYTY/gRah85gMFkFvO
 u3afeVrory1Yt7TXsLhD63izgmYZ21/OSSCgykW65ONzONSPaX3pY5M/U2UkC/HLd7
 dS/xtHitwm3R7c7S6ed/GeEsXQXBVbyz98zIOJGjolPC/pIuUVeAbTIECiUcnenbwk
 6DkjR0Wis/x0CCLkwM0cbpk8o9tu9GJHgsPmEGC9QxQqHBFe1zq7HpqK9bpvDDzv5Q
 F2hEa+5rBNlrQ==
Date: Wed, 31 Mar 2021 10:41:06 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210331104106.0bd18bb5@elm.ozlabs.ibm.com>
In-Reply-To: <CAMuHMdXtjy4HDzK2y2+3Fb788=OQAv_OQJaw31FRL0pkjLXb4g@mail.gmail.com>
References: <20210329131401.15724766@canb.auug.org.au>
 <CAMuHMdXtjy4HDzK2y2+3Fb788=OQAv_OQJaw31FRL0pkjLXb4g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Mar 2021 06:41:05 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Tue, 30 Mar 2021 09:36:57 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Mon, Mar 29, 2021 at 4:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >
> > between commits:
> >
> >   9adb125dde69 ("drm/amdgpu: re-enable suspend phase 2 for S0ix")
> >   4021229e32bd ("drm/amdgpu/swsmu: skip gfx cgpg on s0ix suspend")
> >   9bb735abcbd8 ("drm/amdgpu: update comments about s0ix suspend/resume")
> >
> > from Linus' tree and commit:
> >
> >   e3c1b0712fdb ("drm/amdgpu: Reset the devices in the XGMI hive duirng probe")
> >
> > from the drm tree.
> >
> > I fixed it up (I think - see below) and can carry the fix as necessary.
> > This is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 8a5a8ff5d362,0f82c5d21237..000000000000
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@@ -2743,16 -2712,15 +2720,25 @@@ static int amdgpu_device_ip_suspend_pha
> >                         continue;
> >                 }
> >
> >  +              /* skip suspend of gfx and psp for S0ix
> >  +               * gfx is in gfxoff state, so on resume it will exit gfxoff just
> >  +               * like at runtime. PSP is also part of the always on hardware
> >  +               * so no need to suspend it.
> >  +               */
> >  +              if (adev->in_s0ix &&
> >  +                  (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP ||
> >  +                   adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX))
> >  +                      continue;
> >  +
> > +               /* skip unnecessary suspend if we do not initialize them yet */
> > +               if (adev->gmc.xgmi.pending_reset &&
> > +                   !(adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC ||
> > +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC ||
> > +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
> > +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH)) {
> > +                       adev->ip_blocks[i].status.hw = false;
> > +                       continue;
> > +               }
> >                 /* XXX handle errors */
> >                 r = adev->ip_blocks[i].version->funcs->suspend(adev);
> >                 /* XXX handle errors */  
> 
> The above is not what you have in next-20210329?
> Your tree has a second copy of the first conflict block after the second:
> 
>                 /* skip suspend of gfx and psp for S0ix
>                 [...]
>                 /* skip unnecessary suspend if we do not initialize them yet */
>                 [...]
>                 /* skip suspend of gfx and psp for S0ix
> 

It happened because those commits in Linus' tree are also (as different
commits) in the amdgpu tree and so git happily did a new merge
resolution and ended up with what you see :-(  I'll see if I can fix it
up for today.

-- 
Cheers,
Stephen Rothwell
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
