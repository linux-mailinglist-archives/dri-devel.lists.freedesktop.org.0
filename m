Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE8198409
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39D38932E;
	Mon, 30 Mar 2020 19:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD38D8925D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 19:16:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7155D20024;
 Mon, 30 Mar 2020 21:16:20 +0200 (CEST)
Date: Mon, 30 Mar 2020 21:16:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Qiujun Huang <hqjagain@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] fbcon: fix null-ptr-deref in fbcon_switch
Message-ID: <20200330191619.GF7594@ravnborg.org>
References: <20200329085647.25133-1-hqjagain@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200329085647.25133-1-hqjagain@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8
 a=hSkVLCK3AAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=NVFoAeSCgwShZuBWzHEA:9
 a=ViYWLu_RVrLAkblt:21 a=QLy0bD8Az-XStLsx:21 a=CjuIK1q_8ugA:10
 a=W4TVW4IDbPiebHqcZpNg:22 a=cQPPKAXgyycSBL8etih5:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: daniel.thompson@linaro.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ghalat@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qiujun

On Sun, Mar 29, 2020 at 04:56:47PM +0800, Qiujun Huang wrote:
> Set logo_shown to FBCON_LOGO_CANSHOW when the vc was deallocated.
> 
> syzkaller report: https://lkml.org/lkml/2020/3/27/403
> general protection fault, probably for non-canonical address
> 0xdffffc000000006c: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000360-0x0000000000000367]
> RIP: 0010:fbcon_switch+0x28f/0x1740
> drivers/video/fbdev/core/fbcon.c:2260
> 
> Call Trace:
> redraw_screen+0x2a8/0x770 drivers/tty/vt/vt.c:1008
> vc_do_resize+0xfe7/0x1360 drivers/tty/vt/vt.c:1295
> fbcon_init+0x1221/0x1ab0 drivers/video/fbdev/core/fbcon.c:1219
> visual_init+0x305/0x5c0 drivers/tty/vt/vt.c:1062
> do_bind_con_driver+0x536/0x890 drivers/tty/vt/vt.c:3542
> do_take_over_console+0x453/0x5b0 drivers/tty/vt/vt.c:4122
> do_fbcon_takeover+0x10b/0x210 drivers/video/fbdev/core/fbcon.c:588
> fbcon_fb_registered+0x26b/0x340 drivers/video/fbdev/core/fbcon.c:3259
> do_register_framebuffer drivers/video/fbdev/core/fbmem.c:1664 [inline]
> register_framebuffer+0x56e/0x980 drivers/video/fbdev/core/fbmem.c:1832
> dlfb_usb_probe.cold+0x1743/0x1ba3 drivers/video/fbdev/udlfb.c:1735
> usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
> 
> accessing vc_cons[logo_shown].d->vc_top causes the bug.
> 
> Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index bb6ae995c2e5..5eb3fc90f9f6 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1283,6 +1283,9 @@ static void fbcon_deinit(struct vc_data *vc)
>  	if (!con_is_bound(&fb_con))
>  		fbcon_exit();
>  
> +	if (vc->vc_num == logo_shown)
> +		logo_shown = FBCON_LOGO_CANSHOW;
> +
>  	return;
>  }

Looks much better than the previous version.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I expect Bartlomiej to review/apply.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
