Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6A1A1630
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 21:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0136E8F3;
	Tue,  7 Apr 2020 19:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95096E8F3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 19:48:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0EAE380533;
 Tue,  7 Apr 2020 21:48:26 +0200 (CEST)
Date: Tue, 7 Apr 2020 21:48:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jules Irenge <jbi.octave@gmail.com>
Subject: Re: [PATCH 2/5] video: Add missing annotation for
 cyber2000fb_enable_ddc() and cyber2000fb_disable_ddc()
Message-ID: <20200407194824.GA28801@ravnborg.org>
References: <0/5> <20200403160505.2832-1-jbi.octave@gmail.com>
 <20200403160505.2832-3-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403160505.2832-3-jbi.octave@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=c_KzuGgbJLCNkQNsKyQA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, boqun.feng@gmail.com,
 Russell King <linux@armlinux.org.uk>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 "moderated list:CYBERPRO FB DRIVER" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jules.

On Fri, Apr 03, 2020 at 05:05:02PM +0100, Jules Irenge wrote:
> Sparse reports warnings at cyber2000fb_enable_ddc()
> 	and cyber2000fb_disable_ddc()
> 
> warning: context imbalance in cyber2000fb_enable_ddc()
> 	- wrong count at exit
> 
> warning: context imbalance in cyber2000fb_disable_ddc()
> 	- unexpected unlock
> 
> The root cause is the missing annotation at cyber2000fb_enable_ddc()
> 	and cyber2000fb_disable_ddc()
> 
> Add the missing __acquires(&cfb->reg_b0_lock) annotation
> Add the missing __releases(&cfb->reg_b0_lock) annotation
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

Thanks, added to drm-misc-next, so the patch will hit the kernel
when the merge windows opens the next time.

Was this the only locking relevant warning in fbdev?
I would expect a few more.

	Sam

> ---
>  drivers/video/fbdev/cyber2000fb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
> index 460826a7ad55..513f58f28b0f 100644
> --- a/drivers/video/fbdev/cyber2000fb.c
> +++ b/drivers/video/fbdev/cyber2000fb.c
> @@ -1160,12 +1160,14 @@ EXPORT_SYMBOL(cyber2000fb_detach);
>  #define DDC_SDA_IN	(1 << 6)
>  
>  static void cyber2000fb_enable_ddc(struct cfb_info *cfb)
> +	__acquires(&cfb->reg_b0_lock)
>  {
>  	spin_lock(&cfb->reg_b0_lock);
>  	cyber2000fb_writew(0x1bf, 0x3ce, cfb);
>  }
>  
>  static void cyber2000fb_disable_ddc(struct cfb_info *cfb)
> +	__releases(&cfb->reg_b0_lock)
>  {
>  	cyber2000fb_writew(0x0bf, 0x3ce, cfb);
>  	spin_unlock(&cfb->reg_b0_lock);
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
