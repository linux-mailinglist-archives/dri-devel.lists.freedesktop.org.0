Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319D62D370
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 07:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33C510E52E;
	Thu, 17 Nov 2022 06:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C3910E52E;
 Thu, 17 Nov 2022 06:29:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1E6AB81F9E;
 Thu, 17 Nov 2022 06:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020CEC433D6;
 Thu, 17 Nov 2022 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1668666543;
 bh=2lL2hzaia/cJFGMAWXRGKglaIEpZyNeP9+ahgQNP4kA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c249IZd66Tr+XAm2SsQCHdhz1pBIhYWCzc81bpqF0pv9NC/oJGCZ/1CwjofM/9N9U
 yZdZvpQinoxqQ7JUoKuHEGzZrLOlz7vufcjxKkzuKhENk52HDOrr/9ttoLvi6FJpPW
 rkWtdmUMnQsx26P43tugym2GArfJW2LQmgLG39y4=
Date: Thu, 17 Nov 2022 07:29:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH 1/7] drm: mark drm.debug-on-dyndbg as BROKEN for now
Message-ID: <Y3XUrOGAV4I7bB3M@kroah.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
 <20221111221715.563020-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111221715.563020-2-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 03:17:09PM -0700, Jim Cromie wrote:
> drm.debug-on-dyndbg has a regression, due to a chicken-egg
> initialization problem:
> 
> 1- modprobe i915
>    i915 needs drm.ko, which is loaded 1st
> 
> 2- "modprobe drm drm.debug=0x1ff" (virtual/implied)
>    drm.debug is set post-initialization, from boot-args etc
> 
> 3- `modprobe i915` finishes
> 
> W/O drm.debug-on-dyndbg that just works, because all drm_dbg*
> callsites use drm_debug_enabled() to check __drm_debug & DEM_UT_<CAT>
> before printing.
> 
> But the whole point of drm.debug-on-dyndbg is to avoid that runtime
> test, by enabling (at post-modinit) a static-key at each callsite in
> the just-loaded module.
> 
> And since drm.ko is loaded before all dependent modules, none are
> "just-loaded", and no drm.debug callsites are present yet, except
> those in drm.ko itself.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 34f5a092c99e..0d1e59e6bb7e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -54,6 +54,7 @@ config DRM_DEBUG_MM
>  config DRM_USE_DYNAMIC_DEBUG
>  	bool "use dynamic debug to implement drm.debug"
>  	default y
> +	depends on BROKEN	# chicken-egg initial enable problem
>  	depends on DRM
>  	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>  	depends on JUMP_LABEL
> -- 
> 2.38.1

This should go through the drm tree now.  The rest probably should also
go that way and not through my tree as well.

thanks,

greg k-h
