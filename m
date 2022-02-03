Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B724A7F57
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 07:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0292610E25A;
	Thu,  3 Feb 2022 06:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8001C10E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 06:39:46 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 35e49199-84bc-11ec-ac19-0050568cd888;
 Thu, 03 Feb 2022 06:40:43 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 52AFA194B3E;
 Thu,  3 Feb 2022 07:39:40 +0100 (CET)
Date: Thu, 3 Feb 2022 07:39:37 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yizhuo Zhai <yzhai003@ucr.edu>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Message-ID: <Yft4qf3Hw7ntxc98@ravnborg.org>
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
 <20220202235811.1621017-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202235811.1621017-1-yzhai003@ucr.edu>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-fbdev@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I assume you will take this.

Patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Wed, Feb 02, 2022 at 03:58:08PM -0800, Yizhuo Zhai wrote:
> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> and in "case FBIOBLANK:" this argument is casted into an int before
> passig to fb_blank(). In fb_blank(), the comparision
> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
> "arg" is a large number, which is possible because it comes from
> the user input. Fix this by adding the check before the function
> call.
> 
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/video/fbdev/core/fbmem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 0fa7ede94fa6..13083ad8d751 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1160,6 +1160,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  		ret = fbcon_set_con2fb_map_ioctl(argp);
>  		break;
>  	case FBIOBLANK:
> +		if (arg > FB_BLANK_POWERDOWN)
> +			return -EINVAL;
>  		console_lock();
>  		lock_fb_info(info);
>  		ret = fb_blank(info, arg);
> -- 
> 2.25.1
