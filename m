Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FF21E9F0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91C06E3EC;
	Tue, 14 Jul 2020 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58B6E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:22:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200714072231euoutp02873d64f18c3a524074b0e50ed63c383e~hjYZ5E4v11575415754euoutp02P
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:22:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200714072231euoutp02873d64f18c3a524074b0e50ed63c383e~hjYZ5E4v11575415754euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594711351;
 bh=A+eNGV3ET0CirM0GBnHCLZbHHAmr71tTDLcyfoMOPQM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=rYsyyqlDCYEoFOy+qUSuppsoXG6TLfjjpOnL4bDLXbHLfWHmXBW9uThHZvNbrZy0J
 Mt9htNr8krQ59icm//ky1GDRxUGwUti/mu8hVNwxV2NiQBA1QUBp+B3MrI410xsku7
 myat8QJ770ufA5yk0wEb/aUsyW40MEDk3jVx54ME=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200714072231eucas1p22c497ab5e9ebe1ff4bc738d19d8296a5~hjYZxz2pn0515905159eucas1p2w;
 Tue, 14 Jul 2020 07:22:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 28.BC.06456.73D5D0F5; Tue, 14
 Jul 2020 08:22:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346~hjYZdX8n61369813698eucas1p1O;
 Tue, 14 Jul 2020 07:22:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200714072231eusmtrp1ac15a51868ed9bc2710216639489d440~hjYZcn5E-1735217352eusmtrp1S;
 Tue, 14 Jul 2020 07:22:31 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-9b-5f0d5d37eb20
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C1.9B.06314.73D5D0F5; Tue, 14
 Jul 2020 08:22:31 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200714072230eusmtip19b265bf4092b878a513ab0bb1ff17b66~hjYY9oE_k2784427844eusmtip1J;
 Tue, 14 Jul 2020 07:22:30 +0000 (GMT)
Subject: Re: [PATCH] fbdev: Detect integer underflow at
 "struct fbcon_ops"->clear_margins.
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <db4b3346-b9f8-a428-1445-1fcbd8521e1d@samsung.com>
Date: Tue, 14 Jul 2020 09:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7rmsbzxBs+OK1m8/jedxeLK1/ds
 FhMetrFbfP6zlt2iefF6NospGz4wWZzo+8BqcXnXHDaL2S3vWB04PRZsKvXYuXYVk8f+uWvY
 Pe53H2fy+Pj0FovH+i1XWTw+b5ILYI/isklJzcksSy3St0vgypi9+xZTwUOniusbljI2MD4y
 7WLk5JAQMJHYeayTqYuRi0NIYAWjxIW+BewQzhdGif1ND1kgnM+MElc/HmfrYuQAa/k6qwYi
 vpxRYvOFqVAdbxklrl+eww4yV1ggRmLywvXMILaIgKnEpzs7mUGKmAXWM0nMPnuIESTBJmAl
 MbF9FZjNK2Ancf7uZlYQm0VAVeLz1edsILaoQITEpweHWSFqBCVOznzCAmJzCnhIfPvSCVbD
 LCAucevJfCYIW15i+9s5YMskBC6xS7yd8I8N4lMXiZ+n+tghbGGJV8e3QNkyEqcn97BANKxj
 lPjb8QKqezujxPLJMN3WEnfO/QIHALOApsT6XfoQYUeJpbMPM0PChU/ixltBiCP4JCZtmw4V
 5pXoaBOCqFaT2LBsAxvM2q6dK5knMCrNQvLaLCTvzELyziyEvQsYWVYxiqeWFuempxYb5qWW
 6xUn5haX5qXrJefnbmIEJqvT/45/2sH49VLSIUYBDkYlHl4Jf554IdbEsuLK3EOMEhzMSiK8
 TmdPxwnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAuM7/
 g4+K/aEphvpyWV8j64vZcq+0PSpdxsfJ2OSWqReyd7WdS1OmTGjTuhtHXLnnnZZ+mlUZ+fB8
 xRvN304n/u4LCBSv/xh+Zd+9pzO2WX/m+nljVsiP89efzMkT4Uppe7dibU2Q6t6uzIjZNf+6
 xK43OM1Q+3LuVnnxn5sPv+7Z07L9oX07jxJLcUaioRZzUXEiAIUrigZSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xu7rmsbzxBq/m8Fi8/jedxeLK1/ds
 FhMetrFbfP6zlt2iefF6NospGz4wWZzo+8BqcXnXHDaL2S3vWB04PRZsKvXYuXYVk8f+uWvY
 Pe53H2fy+Pj0FovH+i1XWTw+b5ILYI/SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
 tTIyVdK3s0lJzcksSy3St0vQy5i9+xZTwUOniusbljI2MD4y7WLk4JAQMJH4Oqumi5GLQ0hg
 KaPE0TtXGSHiMhLH15d1MXICmcISf651sUHUvGaUuDu5mR0kISwQI/Hg/wZWEFtEwFTi052d
 zCBFzALrmSS27PjIBNFxiFHi1PFzLCBVbAJWEhPbVzGC2LwCdhLn724G62YRUJX4fPU5G4gt
 KhAhcXjHLKgaQYmTM5+A9XIKeEh8+9IJVsMsoC7xZ94lZghbXOLWk/lMELa8xPa3c5gnMArN
 QtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYm9uO/dy8g/HSxuBD
 jAIcjEo8vBL+PPFCrIllxZW5QA9yMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKi
 yfnAtJFXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFRYJn2JAWT
 W0/XMvW+yvibIrh/qXHKPYFsp6cV23jOlkyQKb58dFbSpHylqb4dCycvfX9vmW5Q/FuTxR8s
 T/GITYn5XxX8IbDda4NUhMfjVRscp6YeVF3BYT5XT2w+n1tX3vW4K09MKnQaJOcFeswuCkqv
 9li3pbDJ8dasUJurCV4RIiusGrcrsRRnJBpqMRcVJwIAtEUzb+MCAAA=
X-CMS-MailID: 20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346
X-Msg-Generator: CA
X-RootMTR: 20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
 <CGME20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346@eucas1p1.samsung.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, George Kennedy <george.kennedy@oracle.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ Please Cc: fbdev Maintainer (happens to be me :) on fbdev patches, thanks. ]

Hi,

On 7/12/20 1:10 PM, Tetsuo Handa wrote:
> I found that
> 
>   const int fd = open("/dev/fb0", O_ACCMODE);
>   struct fb_var_screeninfo var = { };
>   ioctl(fd, FBIOGET_VSCREENINFO, &var);
>   var.xres = var.yres = 1;
>   ioctl(fd, FBIOPUT_VSCREENINFO, &var);
> 
> causes general protection fault in bitfill_aligned(), for vc_do_resize()
> updates vc->vc_{cols,rows} only when vc_do_resize() will return 0.
> 
> [   20.102222] BUG: unable to handle page fault for address: ffffb80500d7b000
> [   20.102225] #PF: supervisor write access in kernel mode
> [   20.102226] #PF: error_code(0x0002) - not-present page
> [   20.102227] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 132525067 PTE 0
> [   20.102230] Oops: 0002 [#1] SMP
> [   20.102232] CPU: 3 PID: 2786 Comm: a.out Not tainted 5.8.0-rc4+ #749
> [   20.102233] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
> [   20.102237] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
> [   20.102277] Call Trace:
> [   20.102281]  cfb_fillrect+0x159/0x340 [cfbfillrect]
> [   20.102747]  vmw_fb_fillrect+0x12/0x30 [vmwgfx]
> [   20.102755]  bit_clear_margins+0x92/0xf0 [fb]
> [   20.102760]  fbcon_clear_margins+0x4c/0x50 [fb]
> [   20.102763]  fbcon_switch+0x321/0x570 [fb]
> [   20.102771]  redraw_screen+0xe0/0x250
> [   20.102775]  fbcon_modechanged+0x164/0x1b0 [fb]
> [   20.102779]  fbcon_update_vcs+0x15/0x20 [fb]
> [   20.102781]  fb_set_var+0x364/0x3c0 [fb]
> [   20.102817]  do_fb_ioctl+0x2ff/0x3f0 [fb]
> [   20.103139]  fb_ioctl+0x2e/0x40 [fb]
> [   20.103141]  ksys_ioctl+0x86/0xc0
> [   20.103146]  __x64_sys_ioctl+0x15/0x20
> [   20.103148]  do_syscall_64+0x54/0xa0
> [   20.103151]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> If vc_do_resize() fails (e.g. kzalloc() failure) when var.xres or var.yres
> is going to shrink, bit_clear_margins() hits integer underflow bug due to
> info->var.xres < (vc->vc_cols * cw) or info->var.yres < (vc->vc_rows * ch).
> Unexpectedly large rw or bh will try to overrun the __iomem region and
> causes general protection fault.
> 
> This crash is easily reproducible by calling vc_do_resize(vc, 0, 0)
> which the reproducer above will do. Since fbcon_modechanged() is doing
> 
>   cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
>   rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>   cols /= vc->vc_font.width;
>   rows /= vc->vc_font.height;
>   vc_resize(vc, cols, rows);
>   (...snipped...)
>   update_screen(vc);
> 
> , var.xres < vc->vc_font.width makes cols = 0 and var.yres < vc->vc_font.height
> makes rows = 0. But vc_do_resize() does not set vc->vc_cols = vc->vc_rows = 0
> due to
> 
>   new_cols = (cols ? cols : vc->vc_cols);
>   new_rows = (lines ? lines : vc->vc_rows);
> 
> exception.
> 
> Of course, the root problem is that callers of do_vc_resize() are not
> handling vc_do_resize() failures, but it might not be easy to handle
> them under complicated dependency. Therefore, as a band-aid workaround,
> this patch checks integer underflow in "struct fbcon_ops"->clear_margins
> call, assuming that vc->vc_cols * vc->vc_font.width and
> vc->vc_rows * vc->vc_font.heigh do not cause integer overflow.
> 
> I hope that we can survive even if info->var.{xres,yres} were increased
> but vc->vc_{cols,rows} were not increased due to kzalloc() failure, for
> the __iomem memory for cfb_fillrect() seems to be allocated upon driver
> load.
> 
> By the way, syzbot has several reports which are stalling inside filling
> functions. Although reproducer for [1] is not found yet, it has tried
> 
>   r0 = openat$fb0(0xffffffffffffff9c, &(0x7f0000000180)='/dev/fb0\x00', 0x0, 0x0)
>   ioctl$FBIOPUT_VSCREENINFO(r0, 0x4601, &(0x7f0000000000)={0x0, 0x0, 0x0, 0x500, 0x0, 0x0, 0x4})
> 
> which corresponds to
> 
>   const int fd = open("/dev/fb0", O_ACCMODE);
>   struct fb_var_screeninfo var = { };
>   var.yres_virtual = 0x500;
>   var.bits_per_pixel = 4;
>   ioctl(fd, FBIOPUT_VSCREENINFO, &var);
> 
> and somehow hit unexpectedly long bit_clear_margins() loops. I don't know
> why syzbot does not hit general protection fault, but it would depend on
> environment because in my VMware environment ioctl(FBIOPUT_VSCREENINFO)
> returns -EINVAL if var.xres == var.yres == 0.
> 
> [1] https://syzkaller.appspot.com/bug?id=91ecc3bf32ab1a551c33a39dab7fc0c8cd7b7e16
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

How does this patch relate to:

	https://marc.info/?l=linux-fbdev&m=159415024816722&w=2

?

It seems to address the same issue, I've added George and Dan to Cc:.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/core/bitblit.c   | 4 ++--
>  drivers/video/fbdev/core/fbcon_ccw.c | 4 ++--
>  drivers/video/fbdev/core/fbcon_cw.c  | 4 ++--
>  drivers/video/fbdev/core/fbcon_ud.c  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index ca935c09a261..35ebeeccde4d 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -216,7 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
>  	region.color = color;
>  	region.rop = ROP_COPY;
>  
> -	if (rw && !bottom_only) {
> +	if ((int) rw > 0 && !bottom_only) {
>  		region.dx = info->var.xoffset + rs;
>  		region.dy = 0;
>  		region.width = rw;
> @@ -224,7 +224,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
>  		info->fbops->fb_fillrect(info, &region);
>  	}
>  
> -	if (bh) {
> +	if ((int) bh > 0) {
>  		region.dx = info->var.xoffset;
>  		region.dy = info->var.yoffset + bs;
>  		region.width = rs;
> diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
> index dfa9a8aa4509..78f3a5621478 100644
> --- a/drivers/video/fbdev/core/fbcon_ccw.c
> +++ b/drivers/video/fbdev/core/fbcon_ccw.c
> @@ -201,7 +201,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
>  	region.color = color;
>  	region.rop = ROP_COPY;
>  
> -	if (rw && !bottom_only) {
> +	if ((int) rw > 0 && !bottom_only) {
>  		region.dx = 0;
>  		region.dy = info->var.yoffset;
>  		region.height = rw;
> @@ -209,7 +209,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
>  		info->fbops->fb_fillrect(info, &region);
>  	}
>  
> -	if (bh) {
> +	if ((int) bh > 0) {
>  		region.dx = info->var.xoffset + bs;
>  		region.dy = 0;
>                  region.height = info->var.yres_virtual;
> diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
> index ce08251bfd38..fd098ff17574 100644
> --- a/drivers/video/fbdev/core/fbcon_cw.c
> +++ b/drivers/video/fbdev/core/fbcon_cw.c
> @@ -184,7 +184,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
>  	region.color = color;
>  	region.rop = ROP_COPY;
>  
> -	if (rw && !bottom_only) {
> +	if ((int) rw > 0 && !bottom_only) {
>  		region.dx = 0;
>  		region.dy = info->var.yoffset + rs;
>  		region.height = rw;
> @@ -192,7 +192,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
>  		info->fbops->fb_fillrect(info, &region);
>  	}
>  
> -	if (bh) {
> +	if ((int) bh > 0) {
>  		region.dx = info->var.xoffset;
>  		region.dy = info->var.yoffset;
>                  region.height = info->var.yres;
> diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
> index 1936afc78fec..e165a3fad29a 100644
> --- a/drivers/video/fbdev/core/fbcon_ud.c
> +++ b/drivers/video/fbdev/core/fbcon_ud.c
> @@ -231,7 +231,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
>  	region.color = color;
>  	region.rop = ROP_COPY;
>  
> -	if (rw && !bottom_only) {
> +	if ((int) rw > 0 && !bottom_only) {
>  		region.dy = 0;
>  		region.dx = info->var.xoffset;
>  		region.width  = rw;
> @@ -239,7 +239,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
>  		info->fbops->fb_fillrect(info, &region);
>  	}
>  
> -	if (bh) {
> +	if ((int) bh > 0) {
>  		region.dy = info->var.yoffset;
>  		region.dx = info->var.xoffset;
>                  region.height  = bh;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
