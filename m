Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DD6E148E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 20:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3FB10EBC9;
	Thu, 13 Apr 2023 18:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA610EBE0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 18:47:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34FAC640F0;
 Thu, 13 Apr 2023 18:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97E3C433D2;
 Thu, 13 Apr 2023 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681411647;
 bh=mkbJGGjfVkWp270Vlh6GLKeqXvgPYjdfjauLg3DCCWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iU60ymNU//wlioH8Qp0n9wi/EMQ8EVBLnhMKRUSItaFADysFEblNtIvmrNmZL/toK
 0FERzr4szZYQ/gXrF2Y/GjqLqfr491cBTjFHq/6J2vv844nMI1c5XQ6rARGqCr0uyt
 3ZNDY5jFbTWtqxbPeFeZknN3ls2ketaqRF0AYKR0hrmV/wIupAbTua+oufq374vnYj
 0PiI4h6l2vmO56skSGCcnV4FXWL8hTZp9WbQR7ss/oUIlqSB+b40O0b0al5XjQfn5c
 SipdKARiz8B3fFQx3whLX4uvswZji6RcceMqS1PaBGNYtsMqhZOpyDrA50F6H5fGZY
 nBFwJ7mzX1Jsg==
Date: Thu, 13 Apr 2023 11:47:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <20230413184725.GA3183133@dev-arch.thelio-3990X>
References: <20230412112213.59365041@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412112213.59365041@canb.auug.org.au>
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On Wed, Apr 12, 2023 at 11:22:13AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/drm/amd/display/Kconfig
> 
> between commit:
> 
>   78f0929884d4 ("powerpc/64: Always build with 128-bit long double")
> 
> from the powerpc tree and commit:
> 
>   4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")
> 
> from the drm tree.
> 
> I fixed it up (I used the powerpc version - with "(PPC64 && ALTIVEC)")
> and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This resolution is not quite right on next-20230412 and next-20230413,
as the drm tree's rename was not taken into account on the conflicting
line. In other words, I need this diff for everything to work properly.

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index b990ef80d686..2d8e55e29637 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and

Please consider resolving this in a future -next update, I was rather
surprised that my AMD test machine's graphical output was not working
until I noticed the configuration difference :)

Cheers,
Nathan
