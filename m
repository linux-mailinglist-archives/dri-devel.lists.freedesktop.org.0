Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE6899429
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 06:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37A1113893;
	Fri,  5 Apr 2024 04:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X0h+sQCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A07113896;
 Fri,  5 Apr 2024 04:37:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E4CAFCE35D7;
 Fri,  5 Apr 2024 04:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8622EC43390;
 Fri,  5 Apr 2024 04:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712291854;
 bh=fQSJmR5fXeT1gKRT6xVc9s6XAIrv64NLyk1tAD9C5N4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0h+sQCaGpjBLPFOm2xQNQMCU5oLeDF03fPj6tAlY6RTNfQnrK5F6BapIWUPLXnWP
 2uWu+p9v4S3+ywP1x4IR/M/2xI5CBMayVe6Q5E84QciliA8B1mr8zqykyLNhqPhZU0
 AIOnC0lmtTp0k0nJJXScRmV5o7i55Dp7io+zr3cY=
Date: Fri, 5 Apr 2024 06:37:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Cc: mripard@kernel.org, 1054514@bugs.debian.org, airlied@redhat.com,
 carnil@debian.org, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, regressions@lists.linux.dev,
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi,
 tzimmermann@suse.de, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 1/1] Revert "drm/qxl: simplify qxl_fence_wait"
Message-ID: <2024040515-salvage-uncounted-8164@gregkh>
References: <20240327-cuddly-smooth-trogon-59c02d@houat>
 <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
 <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 04, 2024 at 07:14:48PM +0100, Alex Constantino wrote:
> This reverts commit 5a838e5d5825c85556011478abde708251cc0776.
> 
> Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
> result in a '[TTM] Buffer eviction failed' exception whenever it reached a
> timeout.
> Due to a dependency to DMA_FENCE_WARN this also restores some code deleted
> by commit d72277b6c37d ("dma-buf: nuke DMA_FENCE_TRACE macros v2").
> 
> Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
> Link: https://lore.kernel.org/regressions/ZTgydqRlK6WX_b29@eldamar.lan/
> Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
> Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
> Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
> ---
>  drivers/gpu/drm/qxl/qxl_release.c | 50 +++++++++++++++++++++++++++----
>  include/linux/dma-fence.h         |  7 +++++
>  2 files changed, 52 insertions(+), 5 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
