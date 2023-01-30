Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4B6809C9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 10:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905E10E22B;
	Mon, 30 Jan 2023 09:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394F810E066
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675071684; x=1706607684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cYHSKZJr+AsIJfCw75s0NaKF1+VC8e4ck3sYGiSJVxc=;
 b=Sz9yOkiIGR4mnE3LG0bEl3/jHg2Ryx6x9n53eLhgAQa2lLtdff5RVPnS
 3mKG/AAiq6ChNtWnEER8Jy1go2x201Gi4Nl5RONmVfegfa5dSvJnk+UGa
 E4uJiTLD/pVbc3+3olF+XSEezfuTsxK6gnEzFEFjsG+MdOofWjMpEoeVW
 xSlUgiFSF3eJ6wB+KcmZkW+rSFM98/OYVEGh9gS9xGfGV/syUI+dIuip8
 DASsvEBUGQeSlXJxT0cXE9YG9GK6D+/zNhSBFPtE8jF8lHUzfCLt9LhHC
 OCx7aEXgVU0L8d5OasQkgsptjCh2RYzHd4nB6E/oXC/Rt3RTlTN0fn9Vh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307861656"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="307861656"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 01:41:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="837914234"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="837914234"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 01:41:20 -0800
Date: Mon, 30 Jan 2023 10:41:18 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
Message-ID: <20230130094118.GA1627912@linux.intel.com>
References: <20230127221504.2522909-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127221504.2522909-1-arnd@kernel.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 11:14:55PM +0100, Arnd Bergmann wrote:
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
> 
> The problem is that DRM_ACCEL is a 'bool' symbol symbol, so driver that
> only depend on DRM_ACCEL but not also on DRM do not see the restriction
> to =m configs.
> 
> To ensure that each accel driver has an implied dependency on CONFIG_DRM,
> enclose the entire Kconfig file in an if/endif check.
> 
> Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
> v2: rearrage the DRM dependency rather than requiring DRM to be built-in
> ---
>  drivers/accel/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 834863902e16..c437206aa3f1 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -6,9 +6,10 @@
>  # as, but not limited to, Machine-Learning and Deep-Learning acceleration
>  # devices
>  #
> +if DRM
> +
>  menuconfig DRM_ACCEL
>  	bool "Compute Acceleration Framework"
> -	depends on DRM
>  	help
>  	  Framework for device drivers of compute acceleration devices, such
>  	  as, but not limited to, Machine-Learning and Deep-Learning
> @@ -25,3 +26,5 @@ menuconfig DRM_ACCEL
>  
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
> +
> +endif
> -- 
> 2.39.0
> 
