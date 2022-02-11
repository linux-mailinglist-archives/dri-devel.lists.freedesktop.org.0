Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F14B1B37
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 02:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE910E99D;
	Fri, 11 Feb 2022 01:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D1810E99D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 01:26:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92E7160BBF;
 Fri, 11 Feb 2022 01:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078B3C004E1;
 Fri, 11 Feb 2022 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644542779;
 bh=RIkLyIEnDnAtAvgTMBO+mKp45fPhtgteavEWXrg4euw=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=aB890eTXzZCpBszQDfR46CLeerYfBHc5bLDOkAywlVEA1WljJIWndIonbdQAIba26
 xG113oP2lThwHHoe3M83ctVw/pUHspye+lYttVTGEciEE2qKeAGQt44DX6MWPK76bC
 4bZ8cY/axNQM1EhhtLpK2pntYohJevqYDVeVvtfsH7p2kD769D1r9BY/9qwzgqILWH
 9T7CxFLnujhP2sBHaTeXDX5N9xS8K6GbyialzD4zrGZUz7UbVP8LMbXNoU0eR/VpOi
 gMM1QtiUldaL3aWS5FPDP+KW+DUfS/OGszuunc33ihXBpbbiqy0yewrE2xupzGc9Mi
 W+nVS9hpc6EHA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A8E2E5C0165; Thu, 10 Feb 2022 17:26:18 -0800 (PST)
Date: Thu, 10 Feb 2022 17:26:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next] video: fbdev: fbmem: fix pointer reference to
 null device field
Message-ID: <20220211012618.GA4285@paulmck-ThinkPad-P17-Gen-1>
References: <20220210065824.368355-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210065824.368355-1-zhouzhouyi@gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: pmenzel@molgen.mpg.de, linux-fbdev@vger.kernel.org, deller@gmx.de,
 linux-kernel@vger.kernel.org, willy@infradead.org, rcu@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 02:58:24PM +0800, Zhouyi Zhou wrote:
> In function do_remove_conflicting_framebuffers, if device is NULL, there
> will be null pointer reference. The patch add a check to the if expression.
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Dear Linux folks
> 
> I discover this bug in the PowerPC VM provided by
> Open source lab of Oregon State University:
> 
> https://lkml.org/lkml/2022/2/8/1145
> 
> I found that the root cause of null device field is in offb_init_fb:
> info = framebuffer_alloc(sizeof(u32) * 16, NULL);
> 
> I have tested the patch in the PowerPC VM. Hope my patch can be correct.

This looks plausible to me, but I am quite unfamiliar with this code.

						Thanx, Paul

> Many Thanks
> Zhouyi
> --
>  drivers/video/fbdev/core/fbmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 34d6bb1bf82e..422b1fc01722 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1579,7 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>  			 * If it's not a platform device, at least print a warning. A
>  			 * fix would add code to remove the device from the system.
>  			 */
> -			if (dev_is_platform(device)) {
> +			if (device && dev_is_platform(device)) {
>  				registered_fb[i]->forced_out = true;
>  				platform_device_unregister(to_platform_device(device));
>  			} else {
> -- 
> 2.25.1
> 
