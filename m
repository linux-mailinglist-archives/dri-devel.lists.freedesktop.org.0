Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20831847477
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570E210E059;
	Fri,  2 Feb 2024 16:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZJOFpJ+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6C510E059
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:16:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E984862017;
 Fri,  2 Feb 2024 16:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8346EC433F1;
 Fri,  2 Feb 2024 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706890563;
 bh=3+ROZCHRstlhfJrYnl17w0ODHvifPB3P/gZGeOEDPJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJOFpJ+mDJyJe1oGJnMSLS2Jj3bfyMk8IZvzcIUoZ+vGh10MXrMi+x5rf0d+KAVZ1
 BkzJX29citcKhE14tbFR1lSsgwW33ZipTpujUoxLGMtxOJWJNYlUrJ6P5oM+2uERh0
 N8MGfCCZNTCSpKAFKH+03/iHS8CHvAuzSPxKwVbg=
Date: Fri, 2 Feb 2024 08:16:02 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Cc: gfx-internal-devel@eclists.intel.com, chris.p.wilson@intel.com,
 ayaz.siddiqui@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 Sagar Chormale <sagar.chormale@intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 40/46] dma-buf: move dma-buf symbols into the DMA_BUF
 module namespace.
Message-ID: <2024020202-unthread-handed-0938@gregkh>
References: <20240202083153.2635684-1-kolanupaka.naveena@intel.com>
 <20240202083153.2635684-41-kolanupaka.naveena@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202083153.2635684-41-kolanupaka.naveena@intel.com>
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

On Fri, Feb 02, 2024 at 02:01:47PM +0530, Kolanupaka Naveena wrote:
> +#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
> +#include <linux/module.h>
> +#endif

No #ifdef in .c files please, this should not be an issue, just include
the .h file.

>  #include <drm/intel_iaf_platform.h>
>  
>  #include "gem/i915_gem_dmabuf.h"
> @@ -23,6 +26,10 @@
>  #include "i915_trace.h"
>  #include "intel_iaf.h"
>  
> +#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
> +MODULE_IMPORT_NS(DMA_BUF);
> +#endif

Why is a #ifdef needed here?  If this isn't built as a module, it's not
an issue, please just make it simpler.

But really, why is this a #define at all in the first place?

thanks,

greg k-h
