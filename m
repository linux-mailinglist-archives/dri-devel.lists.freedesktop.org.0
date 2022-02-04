Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488994AA057
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD48610E5DE;
	Fri,  4 Feb 2022 19:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0610E1D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:45:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 31c0cf47-85f3-11ec-b20b-0050568c148b;
 Fri, 04 Feb 2022 19:46:49 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 37B32194B91;
 Fri,  4 Feb 2022 20:45:49 +0100 (CET)
Date: Fri, 4 Feb 2022 20:45:46 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 15/21] fbcon: Consistently protect deferred_takeover with
 console_lock()
Message-ID: <Yf2CajIWrEEcA//9@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-16-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-16-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:46PM +0100, Daniel Vetter wrote:
> This shouldn't be a problem in practice since until we've actually
> taken over the console there's nothing we've registered with the
> console/vt subsystem, so the exit/unbind path that check this can't
> do the wrong thing. But it's confusing, so fix it by moving it a tad
> later.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Du Cheng <ducheng2@gmail.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

It had helped me if the commitlog was explicit that the
deferred_takeover falg is moved to the worker function to reset it as
late as possible.

With the commit log updated:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  drivers/video/fbdev/core/fbcon.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 496bc5f2133e..11b9f962af6f 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -3247,6 +3247,9 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>  
>  	console_lock();
>  
> +	deferred_takeover = false;
> +	logo_shown = FBCON_LOGO_DONTSHOW;
> +
>  	for_each_registered_fb(i)
>  		fbcon_fb_registered(registered_fb[i]);
>  
> @@ -3264,8 +3267,6 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>  	pr_info("fbcon: Taking over console\n");
>  
>  	dummycon_unregister_output_notifier(&fbcon_output_nb);
> -	deferred_takeover = false;
> -	logo_shown = FBCON_LOGO_DONTSHOW;
>  
>  	/* We may get called in atomic context */
>  	schedule_work(&fbcon_deferred_takeover_work);
> -- 
> 2.33.0
