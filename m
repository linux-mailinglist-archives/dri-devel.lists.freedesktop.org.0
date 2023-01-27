Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62967E156
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F0710E439;
	Fri, 27 Jan 2023 10:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFAC10E439
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674814626; x=1706350626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55TvKFgIeJ9Ccx613u9iCST4aYVD68p4Vcl3AOnOUm8=;
 b=YrrCNG5fFzegjlQs4wZvuRJ7rPWFL49TFyGo+1OVdaqy6f6stAJPbmrU
 1ACQIzqQhZFNYvMzldL/B9fbsxGgGhRE8by7XNqtfekYfVOaBuBWEdPl4
 Ybb+0Abt+xD1e5DIln7qqEk0UMfUSqQwxhzUfOysjZHgmrVefp3c8Z/YE
 JghWTc2KZdHI8sa1eWxnyFUd69FGnOvvQzUdaNXV1DSmjMc5Um5ERwe/n
 NGFiGLjXD3+Vx4OMNT9SlaRHmFPI9acI1CIQRW5CuHkHUVfTD+cfRbvXx
 vAAt/B3NR4O/ndoc4Fb7R99LkxmO1E/ljpR1K9nJNlCA1Lyve/YFX3LSR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="329184902"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="329184902"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 02:17:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="663213467"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="663213467"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 02:17:03 -0800
Date: Fri, 27 Jan 2023 11:17:01 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] accel: work around DRM_ACCEL dependencies
Message-ID: <20230127101701.GA1416485@linux.intel.com>
References: <20230127093631.2132187-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127093631.2132187-1-arnd@kernel.org>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Jan 27, 2023 at 10:36:20AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> At the moment, accel drivers can be built-in even with CONFIG_DRM=m,
> but this causes a link failure:
> 
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_dev_init':
> ivpu_drv.c:(.text+0x1535): undefined reference to `drmm_kmalloc'
> x86_64-linux-ld: ivpu_drv.c:(.text+0x1562): undefined reference to `drmm_kmalloc'
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_remove':
> ivpu_drv.c:(.text+0x1faa): undefined reference to `drm_dev_unregister'
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_probe':
> ivpu_drv.c:(.text+0x1fef): undefined reference to `__devm_drm_dev_alloc'

Ehh, this should not happen.

> This could be avoided by making DRM_ACCEL a tristate symbol, which
> would mean that every ACCEL driver is guarantee to be able to link
> against DRM as well. However, having both as =m causes another link
> failure because the DRM core code also links against the accel driver:
>
> x86_64-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_minor_register':
> drm_drv.c:(.text+0x259): undefined reference to `accel_debugfs_init'
> x86_64-linux-ld: drm_drv.c:(.text+0x298): undefined reference to `accel_minor_replace'
> 
> I think it will be necessary to establish a link hierarchy between drm.ko
> and drm_accel.ko to avoid circular dependencies like this, but until then
> the only way that both can be used is to have both subsystems built into
> the kernel. Enforce this using a Kconfig dependency.

Hmm, it was discussed a bit before and conclusion was that accel will be
compiled in drm.ko to avoid circular dependencies. There should be
no drm_accel.ko module.

> Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/accel/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 834863902e16..dd18d3b2028c 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -8,7 +8,7 @@
>  #
>  menuconfig DRM_ACCEL
>  	bool "Compute Acceleration Framework"
> -	depends on DRM
> +	depends on DRM=y

Would making ivpu Kconfig:

depends on DRM
select DRM_ACCEL

solve the problem and still allow to drm to be build as module ? 

Regards
Stanislaw

