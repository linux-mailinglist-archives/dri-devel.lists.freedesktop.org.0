Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A82C8D34
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CBB6E7DC;
	Mon, 30 Nov 2020 18:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D026E7DC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:46:54 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BC0D72002C;
 Mon, 30 Nov 2020 19:46:49 +0100 (CET)
Date: Mon, 30 Nov 2020 19:46:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 21/28] video: fbdev: tmiofb: Fix set but not used
 warnings
Message-ID: <20201130184648.GA1502362@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-22-sam@ravnborg.org>
 <e2300be8-525f-f289-5e78-d4fd488c90d4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2300be8-525f-f289-5e78-d4fd488c90d4@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=kG_Li1YSC5bgHzEcAboA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Nov 30, 2020 at 03:36:44PM +0100, Thomas Zimmermann wrote:
> =

> =

> Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> > Fix W=3D1 warnings by avoiding local variables and use direct reference=
s.
> =

> What's the bug here?

sh define iounmap like this:
#define iounmap(addr)		do { } while (0)

So par is not used resulting in a warning.

My patch just papers over the real issue.
The right fix is to fix sh so we reference addr.
Will give that a shot.

	Sam

> =

> > =

> > v2:
> >    - Updated subject (Lee)
> > =

> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/video/fbdev/tmiofb.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/video/fbdev/tmiofb.c b/drivers/video/fbdev/tmiofb.c
> > index 50111966c981..b70faa3850f2 100644
> > --- a/drivers/video/fbdev/tmiofb.c
> > +++ b/drivers/video/fbdev/tmiofb.c
> > @@ -802,10 +802,8 @@ static int tmiofb_remove(struct platform_device *d=
ev)
> >   	const struct mfd_cell *cell =3D mfd_get_cell(dev);
> >   	struct fb_info *info =3D platform_get_drvdata(dev);
> >   	int irq =3D platform_get_irq(dev, 0);
> > -	struct tmiofb_par *par;
> >   	if (info) {
> > -		par =3D info->par;
> >   		unregister_framebuffer(info);
> >   		tmiofb_hw_stop(dev);
> > @@ -816,8 +814,8 @@ static int tmiofb_remove(struct platform_device *de=
v)
> >   		free_irq(irq, info);
> >   		iounmap(info->screen_base);
> > -		iounmap(par->lcr);
> > -		iounmap(par->ccr);
> > +		iounmap(((struct tmiofb_par *)info->par)->lcr);
> > +		iounmap(((struct tmiofb_par *)info->par)->ccr);
> >   		framebuffer_release(info);
> >   	}
> > =

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
