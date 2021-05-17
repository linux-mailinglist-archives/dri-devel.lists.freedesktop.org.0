Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1C383B33
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4686EA16;
	Mon, 17 May 2021 17:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1C6E9BB;
 Mon, 17 May 2021 17:24:14 +0000 (UTC)
IronPort-SDR: 3URc5UuiYatlzc/+9lw1dNvtUIDGRJccYTmc3+KaaDhhE5RaeYEBF27bURyZvhV8JSP7/cpR4R
 tI+EowO0JBxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180120447"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="180120447"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 10:24:04 -0700
IronPort-SDR: kF0CZl+GAeg2A0GvpYg15dIeMDeUqq1uyYy9TEHZFdrOMbYDz+DzmSlhN9sE6tGcFUrO/E1pq2
 QCZ5WEyCEKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="404444619"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 17 May 2021 10:24:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 May 2021 20:24:01 +0300
Date: Mon, 17 May 2021 20:24:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
Message-ID: <YKKmsbvTZBwCUiRu@intel.com>
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
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

On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> From: Vivek Das Mohapatra <vivek@collabora.com>
> 
> This patch is to do with seamless handover, eg when the sequence is
> bootloader → plymouth → desktop.
> 
> It switches the vga arbiter from the "other" GPU to the default one
> (intel in this case), so the driver can issue some io().

I don't understand what this commit message is trying to say.

> 
> Signed-off-by: Vivek Das Mohapatra <vivek@collabora.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> Greetings all,
> 
> This patch has been downstream for a while now yet it seems perfectly
> reasonable thing to have in the Linux kernel.
> 
> https://github.com/ValveSoftware/steamos_kernel/commit/5431b5b1999c3d3b5efee817fb3373fbbd473063
> 
> 
>  drivers/gpu/drm/i915/display/intel_vga.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index be333699c515..4f07b5ad5fa0 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -30,12 +30,14 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
>  	u8 sr1;
>  
>  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> -	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> -	outb(SR01, VGA_SR_INDEX);
> -	sr1 = inb(VGA_SR_DATA);
> -	outb(sr1 | 1 << 5, VGA_SR_DATA);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -	udelay(300);
> +	if (pdev == vga_default_device()) {
> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		outb(SR01, VGA_SR_INDEX);
> +		sr1 = inb(VGA_SR_DATA);
> +		outb(sr1 | 1 << 5, VGA_SR_DATA);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +		udelay(300);
> +	}
>  
>  	intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
>  	intel_de_posting_read(dev_priv, vga_reg);
> -- 
> 2.27.0

-- 
Ville Syrjälä
Intel
