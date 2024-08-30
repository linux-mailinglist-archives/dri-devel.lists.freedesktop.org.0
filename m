Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F4965A5A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB410E851;
	Fri, 30 Aug 2024 08:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="dV7eCOTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 08:30:59 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4810E851
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725006653; x=1725611453; i=spasswolf@web.de;
 bh=rLZNMuyCRmqs3FEvJHEFsz3u3ucAr75iaGC9Dy8BKeY=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dV7eCOTLmiK3w15UVNd+MSDbhJVJbxQA/UEbeb1XhLvFHHWzeRSwWKSjVXWdKs1D
 vM9abhHqj/6MbwPNd3REer1A5pzyEAByDE9F276rycu0i/LRvWW/BZ4R3yQYrCsfg
 tsfSE4CgJhT7yUcPGIwyWpyCaBwtFhtBmyGESf4ljX90gyyXK3p8n7zQxTEvXA2d5
 yQYRW4XC9pxifIy25RBU1DU7L2rtdWDUDLEJE+D94Dqqgc4cggN2gyfB86eN/rKgw
 KtAX5twhfLVwZcpIXdero1sGcIMJVQEkeLIpXn0qPs1zCtmj0Blnih/JJ8Bfarbtk
 n+3d6mhED69qPxUUWQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkElZ-1sLNqS2vqz-00qZcc; Fri, 30
 Aug 2024 10:25:37 +0200
Message-ID: <7fec4df2e44ea2b11ac617d1a4ed5cbb49214f7b.camel@web.de>
Subject: Re: [PATCH 3/5] fbdev: Introduce devm_register_framebuffer()
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Helge Deller
 <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Peter Jones
 <pjones@redhat.com>, spasswolf@web.de
Date: Fri, 30 Aug 2024 10:25:37 +0200
In-Reply-To: <8b52669c-4c99-45e2-8b5e-9348e5e00f70@t-8ch.de>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net>
 <8b52669c-4c99-45e2-8b5e-9348e5e00f70@t-8ch.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+FdI8o/2YrKjm68Lbh/q8MiS51hHZaxjW9Zbi2U4FBolgcbKulo
 LONFJnjTZHwQfC2kKD3MMzfPdlK50LqMksqoWPGQ3LKkuRRN9fHuLljGNOIAK/kX1pBkvK3
 NXEI1REb/ggvBmb3OCFLWdLoS9Bdc3y38EdmCG5RYlbRPY/tdVTfxxkr3MS+iLRkMe+zns5
 FH0LgYlG2BWUjo/b3uNGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CTbxhbHXrQU=;fsZsL9GuT2DEJWuncJrL9il4W/j
 vEsW1XU5rinHzC78hBjiOXvZKIx0KOlSiceWSlsu/M9t7ak+7Ev+FYHOiTt4kpqOOhuNa6aSQ
 3T1fICuyW0cAnHs4tN85MvGcwv5bDmSsLET0BzHQ8j4M+wDutTBn/7Wdehs9WO7MtfK00W7TP
 VG9WZQR/wKI8FSPGeU8BbPcJkEW3ol+F7o75yOvJqAUfzkrs9l5wPJmvxgVijfX+RCZv4gg1V
 zVuqBSZyCHtz6GVzBc5sMM+eL4L9C8GA6WedtibHlYvN22DLVX0mdUwSrFT7p6x/WTY0djxyw
 sEcviQzC9vlJxC9rs2rPYbdtKo6r+YmxSFHvZEJ7pH6KJX+rSJAcngBBEDmPUkJPPauj8olDC
 FaVlDqRjiXKPmYzDIcx64riwPxiPlMvlQD1AnrkAfb9ha4E4lWLJg1j2HL7d1iVs54ZO7ayGU
 YqXBK8l/8jmkcMTxHDRGb0ulqUML4puLox2CoHdpp7OwtOyDVCwf4jysQ+01iauz57W0FhHl4
 wEYPkvnAy5pBxXpTOZetLH15uMii1KIeP9mLxD4ABrxw/LGMdLmdTB6Owtgtxj4xtUqiWUX0A
 /pmial4G6SD8MVyEWVH7Ycp4g6Lk0E8bF+8P1hYq7quTKx2+A8mQSifT9PuqPFfiEsAQG2xE1
 0sE5m4ii6R8Fohy+H37nO7trdVRr2oJVs5hTxIuuvhMVyrKhhXwPXvDhSUoJs5C0RmsSaS8YP
 5NRefTo0mnUFj/0nDzuYY8oJ1gtLVAwMIMVwc8FNiThGtPyJkJhoQ4y5wxc2q2KnvXF5imnuu
 zE7sPPapyde9u/EQ48v9W69w==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 30.08.2024 um 09:17 +0200 schrieb Thomas Wei=C3=9Fschuh:
> Hi everybody,
>
> On 2024-08-27 17:25:14+0000, Thomas Wei=C3=9Fschuh wrote:
> > Introduce a device-managed variant of register_framebuffer() which
> > automatically unregisters the framebuffer on device destruction.
> > This can simplify the error handling and resource management in driver=
s.
>
> Bert reported that this series broke his framebuffer ([0], [1]).
>
> [0] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de/
> [1] https://lore.kernel.org/lkml/20240829230438.3226-1-spasswolf@web.de/
>
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 24 ++++++++++++++++++++++++
> >  include/linux/fb.h               |  1 +
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/co=
re/fbmem.c
> > index 4c4ad0a86a50..d17a2daa2483 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -544,6 +544,30 @@ unregister_framebuffer(struct fb_info *fb_info)
>
> [..]
>
> > +/**
> > + *	devm_register_framebuffer - resource-managed frame buffer device r=
egistration
> > + *	@dev: device the framebuffer belongs to
> > + *	@fb_info: frame buffer info structure
> > + *
> > + *	Registers a frame buffer device @fb_info to device @dev.
> > + *
> > + *	Returns negative errno on error, or zero for success.
> > + *
> > + */
> > +int
> > +devm_register_framebuffer(struct device *dev, struct fb_info *fb_info=
)
> > +{
> > +	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb=
_info);
> > +}
> > +EXPORT_SYMBOL(devm_register_framebuffer);
>
> This implementation is wrong, it never actually registers the
> framebuffer. It should look like this:
>
> int
> devm_register_framebuffer(struct device *dev, struct fb_info *fb_info)
> {
> 	int ret;
>
> 	ret =3D register_framebuffer(fb_info);
> 	if (ret)
> 		return ret;
>
> 	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb_in=
fo);
> }
> EXPORT_SYMBOL(devm_register_framebuffer);
>
> Bert, could you test this?
> Helge, do you want me to resend the series, minus the original patch 1?

Yes, this works for me. Thanks!

Bert Karwatzki

