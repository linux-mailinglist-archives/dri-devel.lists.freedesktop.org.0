Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BE748249
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 12:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9032B10E351;
	Wed,  5 Jul 2023 10:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442F910E351
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688553520; x=1720089520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KeDkSxw3GeVMko9LZI1XQngr4d3rtot40aazDajnPDE=;
 b=gomdU0HJYWbzpVlHLJqMx1DLYE1lUPrmtUf5oaUdBZ7xO32Ch0dq8HjU
 fGyjBy1BqGeuOTgWpaNtcYVEckvjO2xvz+SNKn4mg3UTN6inqzEXjSDzs
 849ri40o8EJMYa2SyfPwjis4UtdXoP9zVjWsmlbxz1xXVL4ILquFkmjE4
 LZfVe5L2uExVhsHl6XmMdT2X9HN9nhoI8gTVssiWrOjqHkohrXrCSjChZ
 95VOHSTDFv8d+/MJ7GF2xnYkZhKnp4sC+h7+nx51pKMFQRsSM3J7TSiGw
 SqGSvdCGKt0jq8u52EJoqezNMNzqqF7iqX17O/3G9Y7gQ7izRYPMhSvSe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366792253"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="366792253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 03:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="722353917"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="722353917"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 03:38:36 -0700
Date: Wed, 5 Jul 2023 12:38:34 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] accel/ivpu: Fix VPU register access in irq disable
Message-ID: <20230705103834.GA2135759@linux.intel.com>
References: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-fixes

Thanks
Stanislaw

On Mon, Jul 03, 2023 at 10:07:24AM +0200, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Incorrect REGB_WR32() macro was used to access VPUIP register.
> Use correct REGV_WR32().
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Cc: stable@vger.kernel.org # 6.3.x
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_mtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index 3ff60fbbc8d9..d3ba633daaa0 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -874,7 +874,7 @@ static void ivpu_hw_mtl_irq_disable(struct ivpu_device *vdev)
>  	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x1);
>  	REGB_WR32(MTL_BUTTRESS_LOCAL_INT_MASK, BUTTRESS_IRQ_DISABLE_MASK);
>  	REGV_WR64(MTL_VPU_HOST_SS_ICB_ENABLE_0, 0x0ull);
> -	REGB_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
> +	REGV_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
>  }
>  
>  static void ivpu_hw_mtl_irq_wdt_nce_handler(struct ivpu_device *vdev)
> -- 
> 2.25.1
> 
