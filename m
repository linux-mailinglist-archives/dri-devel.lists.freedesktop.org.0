Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7BB3A2EE4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398096EB9A;
	Thu, 10 Jun 2021 15:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840776E364;
 Thu, 10 Jun 2021 15:01:37 +0000 (UTC)
IronPort-SDR: ei7PJGnFyVIq8HDkGtxAUxlfvmbNM7+Yc88GYPsXJIMQ0Iik6xfKttiDiuucqE/WvhIp97/nY5
 U6UUwWRefAiA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205128082"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205128082"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 08:01:33 -0700
IronPort-SDR: DfzEqKMNR6W8nene9JKY81pK7FYImXmYCRcbia8QkGnT/id8DmCa7mrscNJruz89BfkPlvspiQ
 v+XAEwg4MN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="414145612"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 10 Jun 2021 08:01:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Jun 2021 18:01:29 +0300
Date: Thu, 10 Jun 2021 18:01:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/i915: apply WaEnableVGAAccessThroughIOPort as needed
Message-ID: <YMIpSYuTrz1r5IxG@intel.com>
References: <20210604154905.660142-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210604154905.660142-1-emil.l.velikov@gmail.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 04:49:05PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Currently as the workaround is applied the screen flickers. As a result
> we do not achieve seamless boot experience.
> 
> Avoiding the issue in the common use-case might be hard, although we can
> resolve it for dual GPU setups - when the "other" GPU is primary and/or
> outputs are connected to it.
> 
> With this I was able to get seamless experience on my Intel/Nvidia box,
> running systemd-boot and sddm/Xorg. Note that the i915 driver is within
> initrd while the Nvidia one is not.
> 
> Without this patch, the splash presented by systemd-boot (UEFI BGRT) is
> torn down as the code-path kicks in, leaving the monitor blank until the
> login manager starts.
> 
> Same issue were reported with plymouth/grub, although personally I
> wasn't able to get them to behave on my setup.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---

Pushed to drm-intel-next. Thanks.

> 
> Supersedes
> https://lore.kernel.org/dri-devel/20210516171432.1734268-1-emil.l.velikov@gmail.com/
> 
> Ville, others,
> 
> Patch is based against drm-intel/drm-intel-next and will apply cleanly
> against drm-intel/drm-intel-fixes.
> 
> If possible, can one of the i915 maintainers apply it to the latter?
> 
> Thanks
> Emil
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index be333699c515..7beef1206097 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
>  	i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
>  	u8 sr1;
>  
> +	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> +		return;
> +
>  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>  	outb(SR01, VGA_SR_INDEX);
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
