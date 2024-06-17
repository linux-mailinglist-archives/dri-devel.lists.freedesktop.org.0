Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3695D90A912
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78810E32A;
	Mon, 17 Jun 2024 09:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="QYpkpTSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FCD10E319
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:07:36 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9C66C40E021A; 
 Mon, 17 Jun 2024 09:07:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1tYAHRnnhZSf; Mon, 17 Jun 2024 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718615250; bh=93xF8rs/wjUBEtgEpr7tQlOJPFf9+opilZV8ptie4Nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYpkpTSLgrvpPrAlswZow//AsuYEbjjinUWC6nd+33iSCUPXVBEK6Bm+ADDGt8SOr
 9+KRcgxd98dvGPGZujaLX9P43PnI5sSmATt/vbrB1AT2Nf+UoDIhsaq1jFUn2DFh4G
 gixf/Mi5guPsTEd0WOhByPMkXvSPq5dt+NrTiXXrQTXZFAJDfVKheIjeWiPW2fBDUz
 F3qWxu1Jix4hqPCpDS6/KDXKCtAXNHA5A40knsMCmRe3FfdxRUnTXC4nLjKjdt1Fop
 Ze6K1lG99XciHmbe3TlgCo5pVTggFz3+gv6zCmJtSJ8xbtIx2PDg6e8ioRurxuZe7G
 y+2Gt6shUrTVKk/qLODYcvuHYFSZyrSz2yFmWgZVQ4ntDb1EW9sYjpSf4djUWZjYYf
 Qqg9uARa6aSctTJnZRX9dwvA2Kl45w9U9xeJFrLoKVo36unxH6Zf9Svv+Ni4D5fReR
 sD234aIcj4HDXg2HjFHiRozMncHHDCEQ++yrYANZh6CCoA0OszwUxM2G+/Ppjy8x52
 zg7exTPy2qvSrkmmc28fW5DZ95qKngBfUUSKtAR6cJNCVPXSIp/dNOvjqFMnBlhouJ
 FQi8Yras4bbiKF+s3UKeA5OKq/9XOKFp6Am+w6STS/vLJI3gYhJHB5of8NwOJg2zXM
 6+Mkc7YxiePNigshZMmLeQjI=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A241040E01A5;
 Mon, 17 Jun 2024 09:07:10 +0000 (UTC)
Date: Mon, 17 Jun 2024 11:07:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 lkp@intel.com, zack.rusin@broadcom.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com,
 andrea.collamati@gmail.com, oe-kbuild-all@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
Message-ID: <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local>
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240616012511.198243-1-alexey.makhalov@broadcom.com>
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

On Sat, Jun 15, 2024 at 06:25:10PM -0700, Alexey Makhalov wrote:
> VMWARE_HYPERCALL alternative will not work as intended without
> VMware guest code initialization.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> index faddae3d6ac2..6f1ac940cbae 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_VMWGFX
>  	tristate "DRM driver for VMware Virtual GPU"
>  	depends on DRM && PCI && MMU
> -	depends on X86 || ARM64
> +	depends on (X86 && HYPERVISOR_GUEST) || ARM64
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
>  	select MAPPING_DIRTY_HELPERS
> -- 

Right, I'll queue this soon but it doesn't reproduce here with gcc-11 or gcc-13.
This must be something gcc-9 specific or so...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
