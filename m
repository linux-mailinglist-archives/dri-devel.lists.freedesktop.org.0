Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED294C3ED6D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1BD10EA39;
	Fri,  7 Nov 2025 07:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q9HYsZ+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C05410EA39
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:59:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D68860143;
 Fri,  7 Nov 2025 07:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C259CC113D0;
 Fri,  7 Nov 2025 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762502352;
 bh=HXlBUhOYIBOJ9oilCjQB+f6cehxoQEttizxFn4B+Cto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9HYsZ+Lmm9GfC3MxOV1sNLDbn4kenQ73MfZlxKJcIOTUMEYT1652SlE0hPM5aiws
 aUqi7iyBBJbnaV3/3OHDsI0zF7X2XwRVmjLrNZdh9eNjRhhEvaYykNT3IMKbrkCew3
 LmHUK1PGarhf+kvLN21wHGwGc2zoLEAmghvd4soPHrURl0RmJhIm+AYXIen1jTolmK
 t0xhTz2N947fGcHxM+yHue9DvV8u7LY98eeHARZqP4fbnlEhPyDr80cPYMLwcqow+w
 ydSP3MxnADjXtlQD+RoD07QouakaxyECnijWFoaoEGXDlwoGiwgYByBjH3G+/R4ZW6
 YFrJizH1yXREg==
Date: Fri, 7 Nov 2025 08:59:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 louis.chauvet@bootlin.com, 
 aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
Message-ID: <20251107-sparkling-brown-bison-be7fca@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-6-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-6-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:27PM +0530, Swamil Jain wrote:
>  
>  void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
> @@ -3003,6 +3009,14 @@ int dispc_init(struct tidss_device *tidss)
>  
>  	dispc_init_errata(dispc);
>  
> +	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
> +								   "ti,clk-ctrl");
> +	if (IS_ERR(dispc->clk_ctrl)) {
> +		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
> +				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
> +		return r;

NAK. Read previous comments instead of silently ignoring them.

Best regards,
Krzysztof

