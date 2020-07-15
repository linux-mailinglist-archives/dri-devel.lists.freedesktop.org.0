Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E8220936
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 11:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B270896B5;
	Wed, 15 Jul 2020 09:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6B6EA77
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 09:50:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06F9mSh7176609;
 Wed, 15 Jul 2020 09:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=L1fC24AO0mFGrHZ+aeKv7ArHLZSEsoi+M3DofTmccgo=;
 b=yusml1W+ItxebkMydFTO6Lu0XB7PqaZ7ZytBPghep5MTwdPUvM85wje7wtukJRhtHKBK
 daFyp0vFfmaN/h/NSJ8Mx0Ic9bC9ClTp0aDxjMo5hyybbASJu3MqJuQ5H0UWt/mLFjw2
 Hta5Ub3rxsvTvqBP0hGW7Mp+mi+SQa15sFzHcBAtAT+rlh5xbvXqeUD5xmYFNvtddex5
 vDk7hceohFW8rhK5ZgQzUWgV3x5VFqNzN3pggi6dWBoZ76Ri+9pRrEeILe3s9NUMGZyd
 r0mg8pLLZxDdGpSnaPLMBrBbB662aZM31X6AvahJgcxxIPnsh2SxaJSxZzJqByqFxMDw kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3275cmac7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Jul 2020 09:50:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06F9ldJH118956;
 Wed, 15 Jul 2020 09:48:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 327q6u3f6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 09:48:47 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06F9miY4015244;
 Wed, 15 Jul 2020 09:48:44 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 Jul 2020 02:48:44 -0700
Date: Wed, 15 Jul 2020 12:48:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200715094836.GD2571@kadam>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150081
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 10:51:02AM +0900, Tetsuo Handa wrote:
> syzbot is reporting general protection fault in bitfill_aligned() [1]
> caused by integer underflow in bit_clear_margins(). The cause of this
> problem is when and how do_vc_resize() updates vc->vc_{cols,rows}.
> 
> If vc_do_resize() fails (e.g. kzalloc() fails) when var.xres or var.yres
> is going to shrink, vc->vc_{cols,rows} will not be updated. This allows
> bit_clear_margins() to see info->var.xres < (vc->vc_cols * cw) or
> info->var.yres < (vc->vc_rows * ch). Unexpectedly large rw or bh will
> try to overrun the __iomem region and causes general protection fault.
> 
> Also, vc_resize(vc, 0, 0) does not set vc->vc_{cols,rows} = 0 due to
> 
>   new_cols = (cols ? cols : vc->vc_cols);
>   new_rows = (lines ? lines : vc->vc_rows);
> 
> exception. Since cols and lines are calculated as
> 
>   cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
>   rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>   cols /= vc->vc_font.width;
>   rows /= vc->vc_font.height;
>   vc_resize(vc, cols, rows);
> 
> in fbcon_modechanged(), var.xres < vc->vc_font.width makes cols = 0
> and var.yres < vc->vc_font.height makes rows = 0. This means that
> 
>   const int fd = open("/dev/fb0", O_ACCMODE);
>   struct fb_var_screeninfo var = { };
>   ioctl(fd, FBIOGET_VSCREENINFO, &var);
>   var.xres = var.yres = 1;
>   ioctl(fd, FBIOPUT_VSCREENINFO, &var);
> 
> easily reproduces integer underflow bug explained above.
> 
> Of course, callers of vc_resize() are not handling vc_do_resize() failure
> is bad. But we can't avoid vc_resize(vc, 0, 0) which returns 0. Therefore,
> as a band-aid workaround, this patch checks integer underflow in
> "struct fbcon_ops"->clear_margins call, assuming that
> vc->vc_cols * vc->vc_font.width and vc->vc_rows * vc->vc_font.heigh do not
> cause integer overflow.
> 
> [1] https://syzkaller.appspot.com/bug?id=a565882df74fa76f10d3a6fec4be31098dbb37c6
> 
> Reported-and-tested-by: syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
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
                            ^^^^^^^^^^^^^^^^^^^^^^

If you choose a very high positive "rw" then this addition can overflow.
info->var.xoffset comes from the user and I don't think it's checked...

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
