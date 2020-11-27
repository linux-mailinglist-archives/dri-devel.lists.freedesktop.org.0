Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E752C6D43
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 23:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5066EE98;
	Fri, 27 Nov 2020 22:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEB46EE98
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 22:36:26 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 33C1420033;
 Fri, 27 Nov 2020 23:36:17 +0100 (CET)
Date: Fri, 27 Nov 2020 23:36:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v1 02/28] video: fbcon: Use pr_debug() in fbcon
Message-ID: <20201127223615.GA872093@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
 <20201127195825.858960-3-sam@ravnborg.org>
 <f8b2737702e295b9f780b98f27faac759ffff7ae.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8b2737702e295b9f780b98f27faac759ffff7ae.camel@perches.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VOK_sTC4ckVJP7rGVwkA:9 a=wPNLvfGTeEIA:10
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
 dri-devel@lists.freedesktop.org, Peter Rosin <peda@axentia.se>,
 Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe.

On Fri, Nov 27, 2020 at 01:16:41PM -0800, Joe Perches wrote:
> On Fri, 2020-11-27 at 20:57 +0100, Sam Ravnborg wrote:
> > Replacing DPRINTK() statements with pr_debug fixes
> > W=3D1 warnings.
> > And moves to a more standard logging setup at the same time.
> []
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
> []
> > @@ -1015,9 +1007,9 @@ static const char *fbcon_startup(void)
> > =A0	rows /=3D vc->vc_font.height;
> > =A0	vc_resize(vc, cols, rows);
> > =A0
> > =

> > -	DPRINTK("mode:   %s\n", info->fix.id);
> > -	DPRINTK("visual: %d\n", info->fix.visual);
> > -	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
> > +	pr_debug("mode:   %s\n", info->fix.id);
> > +	pr_debug("visual: %d\n", info->fix.visual);
> > +	pr_debug("res:    %dx%d-%d\n", info->var.xres,
> > =A0		info->var.yres,
> > =A0		info->var.bits_per_pixel);
> =

> It'd be nicer to reindent the subsequent lines too.
> =

> > @@ -3299,7 +3291,7 @@ static void fbcon_exit(void)
> > =A0
> > =

> > =A0		if (info->queue.func)
> > =A0			pending =3D cancel_work_sync(&info->queue);
> > -		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
> > +		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" :
> > =A0			"no"));
> =

> perhaps:
> =

> 		pr_debug("fbcon: %s pending work\n", pending ? "canceled" : "no");
> =

Good suggestions, I will update accordingly in v2 or when applying in
case someone acks/r-b's the patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
