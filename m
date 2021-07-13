Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33273C776D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 21:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EA76E11F;
	Tue, 13 Jul 2021 19:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859746E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 19:46:45 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 11d3dc48-e413-11eb-8d1a-0050568cd888;
 Tue, 13 Jul 2021 19:46:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3C757194B15;
 Tue, 13 Jul 2021 21:46:55 +0200 (CEST)
Date: Tue, 13 Jul 2021 21:46:41 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] video: fbdev: kyrofb: fix a DoS bug by restricting user
 input
Message-ID: <YO3tobyeCs7pvzZr@ravnborg.org>
References: <1626180674-25195-1-git-send-email-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626180674-25195-1-git-send-email-zheyuma97@gmail.com>
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
Cc: security@kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi 
On Tue, Jul 13, 2021 at 12:51:14PM +0000, Zheyu Ma wrote:
> The user can pass in any value to the driver through the 'ioctl'
> interface. The driver dost not check, which may cause DoS bugs.
> 
> Fix this by checking if the divisor is 0

This fix is trying to avoid the situation on a too low layer.
Could you please try to look at validating the inputs on a much higher
level, in kyro_dev_overlay_viewport_set().
Then the checks are much more obvious and you are more likely to catch a
number of similar bugs that the test just fails to trigger for now.

	Sam

> 
> The following log reveals it:
> 
> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> RIP: 0010:SetOverlayViewPort+0x133/0x5f0 drivers/video/fbdev/kyro/STG4000OverlayDevice.c:476
> Call Trace:
>  kyro_dev_overlay_viewport_set drivers/video/fbdev/kyro/fbdev.c:378 [inline]
>  kyrofb_ioctl+0x2eb/0x330 drivers/video/fbdev/kyro/fbdev.c:603
>  do_fb_ioctl+0x1f3/0x700 drivers/video/fbdev/core/fbmem.c:1171
>  fb_ioctl+0xeb/0x130 drivers/video/fbdev/core/fbmem.c:1185
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x19b/0x220 fs/ioctl.c:739
>  do_syscall_64+0x32/0x80 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  drivers/video/fbdev/kyro/STG4000OverlayDevice.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
> index 9fde0e3b69ec..29d692fe5e75 100644
> --- a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
> +++ b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
> @@ -407,6 +407,9 @@ int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
>  		ulVertDecFactor = 1;
>  	}
>  
> +	if ((ulDest + 1) == 0)
> +		return -EINVAL;
> +
>  	ulDacYScale = ((ulSrc - 1) * 2048) / (ulDest + 1);
>  
>  	tmp = STG_READ_REG(DACOverlayVtDec);	/* Decimation */
> @@ -471,6 +474,9 @@ int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
>  		 */
>  		ulScaleLeft = ulSrcLeft;
>  
> +		if ((ulRight - ulLeft + 2) == 0)
> +			return -EINVAL;
> +
>  		/* shift fxscale until it is in the range of the scaler */
>  		ulhDecim = 0;
>  		ulScale = (((ulSrcRight - ulSrcLeft) - 1) << (11 - ulhDecim)) / (ulRight - ulLeft + 2);
> -- 
> 2.17.6
