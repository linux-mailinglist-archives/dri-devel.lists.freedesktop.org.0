Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626B1C3CEA
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 16:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6485E6E417;
	Mon,  4 May 2020 14:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918BF6E417
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 14:25:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 744B48040D;
 Mon,  4 May 2020 16:25:47 +0200 (CEST)
Date: Mon, 4 May 2020 16:25:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 08/17] drm/mgag200: Split MISC register update into PLL
 selection, SYNC and I/O
Message-ID: <20200504142545.GA28466@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-9-tzimmermann@suse.de>
 <20200503153432.GA23105@ravnborg.org>
 <3e1b1164-7dae-91a5-6973-1eec17d02f6d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e1b1164-7dae-91a5-6973-1eec17d02f6d@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=e5mUnYsNAAAA:8 a=2i1sclw5l2DBOx2GZ4EA:9
 a=wPNLvfGTeEIA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

> >> @@ -1161,9 +1174,11 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
> >>  	}
> >>  =

> >>  	WREG_ECRT(0, ext_vga[0]);
> >> -	/* Enable mga pixel clock */
> >> -	misc =3D 0x2d;
> >>  =

> >> +	misc =3D RREG8(MGA_MISC_IN);
> >> +	misc |=3D MGAREG_MISC_IOADSEL |
> >> +		MGAREG_MISC_RAMMAPEN |
> >> +		MGAREG_MISC_HIGH_PG_SEL;
> >>  	WREG8(MGA_MISC_OUT, misc);
> > =

> > I am left puzzeled why there is several writes to MGA_MISC_OUT.
> > The driver needs to read back and then write again.
> > =

> > Would it be simpler to have one function that only took care of
> > misc register update?
> =

> I'm not quite sure what you mean. MISC contains all kinds of unrelated
> state. In the final atomic code, different state is set in different
> places. It's simple to have a function read-modify-write the content of
> MISC for the bits that it cares about. With multiple functions, that
> leads to some duplicated reads and write, but the code as a whole is simp=
le.
OK, when I looked at the code I initially got the impression that it was
a bit random. But then I also switched between patch and code etc.
The explanation above makes sense.

	Sam

> =

> Best regards
> Thomas
> =

> > =

> >>  =

> >>  	mga_crtc_do_set_base(mdev, fb, old_fb);
> >> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/m=
gag200/mgag200_reg.h
> >> index c096a9d6bcbc1..89e12c55153cf 100644
> >> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
> >> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
> >> @@ -16,10 +16,11 @@
> >>   *		MGA1064SG Mystique register file
> >>   */
> >>  =

> >> -
> >>  #ifndef _MGA_REG_H_
> >>  #define _MGA_REG_H_
> >>  =

> >> +#include <linux/bits.h>
> >> +
> >>  #define	MGAREG_DWGCTL		0x1c00
> >>  #define	MGAREG_MACCESS		0x1c04
> >>  /* the following is a mystique only register */
> >> @@ -227,6 +228,8 @@
> >>  #define MGAREG_MISC_CLK_SEL_MGA_MSK	(0x3 << 2)
> >>  #define MGAREG_MISC_VIDEO_DIS	(0x1 << 4)
> >>  #define MGAREG_MISC_HIGH_PG_SEL	(0x1 << 5)
> >> +#define MGAREG_MISC_HSYNCPOL		BIT(6)
> >> +#define MGAREG_MISC_VSYNCPOL		BIT(7)
> > I like BIT(), but mixing (1 << N) and BIT() does not look nice.
> > Oh, and do not get me started on GENMASK() :-)
> > =

> > 	Sam
> >>  =

> >>  /* MMIO VGA registers */
> >>  #define MGAREG_SEQ_INDEX	0x1fc4
> >> -- =

> >> 2.26.0
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
