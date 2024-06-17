Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DCA90AA92
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 12:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742D710E32E;
	Mon, 17 Jun 2024 10:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="TXfbg8gC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8276510E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:02:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ABDC240E021A; 
 Mon, 17 Jun 2024 10:02:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p-SwtidTbXwT; Mon, 17 Jun 2024 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718618542; bh=hk8qAv1xkelStwfpGcnWoiVIdVGUKqufug9abuox7ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXfbg8gChJROKcS7Y/Q95/XP3hPTOGtUQG9RULQxSAPp/U31ELpExyR7R2eP6JvPv
 GBo/JMTUPKJkzBmwfvqv3Aa/OHmtphGUF5ObrfG0KD6KN/uxUNCGaFKX/toaaPmocK
 dUruAb5F/VIBChTG3m2nmJRfiI+pJLYYTnNAVP86hIqUJQbLnIjXor7z6r8JsOWymw
 +zP7yAp+bxNprgPOZYlLabLJOC+mA1IKIsZ15Ws2UtxL0uWgf/dYDonpJ+c9zA3MnI
 KtB0BfSYZgSXDdgBumPTd69RR6BEC07BGeujoaoetOGsO6aXSDtqfUqgJ8IZdx3VXK
 bE/EAEhvtfRiy1hhkwI5VkZhHfhA88mlCAjWL3OWlao+ZQceZvRnrDiOpvPskzytIl
 dR/2Ttih6SHsZR7ZY6qU2rBTgc2cFyl1BJTz53XnjswrTPrIMv6d7MnlWZ/IWHN5rZ
 JfviQAn9l4hwngIfPd6YcRZVzp6Y93p0TAmsxRtBobXqiWP0emeMZV6i1St+lKRzsO
 FCl39wI/2EuMIbvWDVPxd49vkTXwgTLK5WYfUjDQPQN5bxDD5rYjIRdG0iFTXst0Y/
 3/3ywFM9g6Vor4KD6CyKgeLMCuqNBLfro21rP6XXFx+k7Z4itqZLgT5WJ7Xm3KbrWM
 jGWNxY3vqsz4yn0YbfBQH0I4=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 156CB40E01F9;
 Mon, 17 Jun 2024 10:01:56 +0000 (UTC)
Date: Mon, 17 Jun 2024 12:01:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 lkp@intel.com, zack.rusin@broadcom.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com,
 andrea.collamati@gmail.com, oe-kbuild-all@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
Message-ID: <20240617100150.GDZnAJjoH5wZKu2OAV@fat_crate.local>
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local>
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

On Mon, Jun 17, 2024 at 11:07:09AM +0200, Borislav Petkov wrote:
> On Sat, Jun 15, 2024 at 06:25:10PM -0700, Alexey Makhalov wrote:
> > VMWARE_HYPERCALL alternative will not work as intended without
> > VMware guest code initialization.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
> > Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> > ---
> >  drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> > index faddae3d6ac2..6f1ac940cbae 100644
> > --- a/drivers/gpu/drm/vmwgfx/Kconfig
> > +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_VMWGFX
> >  	tristate "DRM driver for VMware Virtual GPU"
> >  	depends on DRM && PCI && MMU
> > -	depends on X86 || ARM64
> > +	depends on (X86 && HYPERVISOR_GUEST) || ARM64
> >  	select DRM_TTM
> >  	select DRM_TTM_HELPER
> >  	select MAPPING_DIRTY_HELPERS
> > -- 
> 
> Right, I'll queue this soon but it doesn't reproduce here with gcc-11 or gcc-13.
> This must be something gcc-9 specific or so...

Actually, that's a DRM patch.

Folks in To: ok to carry this though the tip tree?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
