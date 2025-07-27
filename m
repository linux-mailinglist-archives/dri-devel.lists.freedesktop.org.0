Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1331B12DCA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 07:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C13410E0E7;
	Sun, 27 Jul 2025 05:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tXz6EQdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD910E0E7;
 Sun, 27 Jul 2025 05:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C45B600AA;
 Sun, 27 Jul 2025 05:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860A2C4CEEB;
 Sun, 27 Jul 2025 05:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753594100;
 bh=F0QM02Ui4yMHpMGEue/MbddjFcHQ2e4EXDJlxhgCpL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXz6EQdBOuardgqn/IxtHuiBMu3qSYyCkcaVAhgEzScpXvf4cXEkYK+0TtVExQI04
 J7lbrkec3ORam5xrJWQD98T7fWUEM2WedhcxijxYQVCsE5xD7B1M2hMYPt01rXG8F6
 LFR2QxKawvlJi0bamK7OqM9lzJzKoJ0lERmUSP3Y=
Date: Sun, 27 Jul 2025 07:28:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 1109776@bugs.debian.org, jeffbai@aosc.io
Subject: Re: [PATCH 1/1] Mark xe driver as BROKEN if kernel page size is not
 4kB
Message-ID: <2025072708-saxophone-watch-3020@gregkh>
References: <20250727042825.8560-1-Simon.Richter@hogyros.de>
 <20250727042825.8560-2-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727042825.8560-2-Simon.Richter@hogyros.de>
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

On Sun, Jul 27, 2025 at 01:27:36PM +0900, Simon Richter wrote:
> This driver, for the time being, assumes that the kernel page size is 4kB,
> so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with 64kB
> pages.
> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2bb2bc052120..7c9f1de7b35f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe2 Graphics"
> -	depends on DRM && PCI
> +	depends on DRM && PCI && (PAGE_SIZE_4KB || BROKEN)
>  	depends on KUNIT || !KUNIT
>  	depends on INTEL_VSEC || !INTEL_VSEC
>  	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
> -- 
> 2.47.2
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
