Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0012DEA4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122F689875;
	Wed,  1 Jan 2020 11:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE8189612;
 Wed,  1 Jan 2020 03:50:29 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 3B7503E9DC;
 Wed,  1 Jan 2020 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1577850628;
 bh=YdZrENY31tFEvhQW8UhSRWsAzqFtpPEHXpQaoGS21rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkG4ibOllK0kgywN0n/8NaH6a8BDheubrNOhq/75whH1IHzJY54Mw5SHk82evG11l
 aTVH9I4eKcYDROT7ci7UgbQdW+C9SVCZ+cXhGskbp/VJHYRyLLXLbZzaOYym6HmiB+
 JSjANMJ2bp2zluxMATBljglC2M8N0PB9/68nGWdI=
Date: Tue, 31 Dec 2019 22:50:27 -0500
From: Brian Masney <masneyb@onstation.org>
To: jeffrey.l.hugo@gmail.com, robdclark@gmail.com
Subject: Re: [PATCH RFC v2] drm/msm/mdp5: enable autorefresh
Message-ID: <20200101035027.GA9348@onstation.org>
References: <20191230020053.26016-1-masneyb@onstation.org>
 <20191230020053.26016-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191230020053.26016-2-masneyb@onstation.org>
X-Mailman-Approved-At: Wed, 01 Jan 2020 11:13:41 +0000
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
Cc: sean@poorly.run, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 29, 2019 at 09:00:53PM -0500, Brian Masney wrote:
> Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> support"), command-mode panels began throwing the following errors:
> 
>     msm fd900000.mdss: pp done time out, lm=0
> 
> Let's fix this by enabling the autorefresh feature that's available in
> the MDP starting at version 1.0. This will cause the MDP to
> automatically send a frame to the panel every time the panel invokes the
> TE signal, which will trigger the PP_DONE IRQ. This requires only
> sending a single START signal for command-mode panels.
> 
> This gives us a counter for command-mode panels that we can use to
> implement async commit support for the MDP5 in a follow up patch.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> ---
> Changes since v1:
> - Send a single start command to kick off the pipeline.
> 
> The reason I marked this patch as a RFC is that the display during some
> small percentage of boots will stop updating after a minute or so, and
> the ping pong IRQs stop. Most of the time it works with no issues and I
> haven't been able to find a way to reproduce the issue. I tried
> suspending the phone by toggling /sys/power/state since I thought that
> the issue could potentially be related to power management.

After working to get the IOMMU up on msm8974, I suspect that the issue
that I describe above is caused by a device probe deferral, which
explains the intermittent nature of what I'm seeing. First driver load
sets up the autorefresh registers, sends a single START signal, then a
-EPROBE_DEFER is thrown later on. Second driver load lost the state, and
sends a second START signal and overloads the DSI.

If that's the case, then potentially the solution may be to do
both of the following:

1) Disable autorefresh when the driver is unloaded.
2) Before sending the START signal, check to make sure that autorefresh
   is actually disabled.

I likely won't be able to work on any this until Sunday evening.

Brian

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
