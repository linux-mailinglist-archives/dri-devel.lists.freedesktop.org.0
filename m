Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B5758247
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF2310E136;
	Tue, 18 Jul 2023 16:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12A10E136;
 Tue, 18 Jul 2023 16:39:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D81FB615D2;
 Tue, 18 Jul 2023 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E21CC433C8;
 Tue, 18 Jul 2023 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689698396;
 bh=eWaZcHsWI81n6SkQbS3KA6jeCLJ0Qmcg3VQycKfRq14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irVoVVtkRxdHhOFSKnVqtgvZ3OYBf/wX7sWiliHa85pGShBit+Mf6fuVvJjNhvpzJ
 NKq7zG53XEXYkMAOnXwMJzAOc5bYfz0VwhLdJORlF+eHibjZ9XVxwXRv/A7398a/cf
 P8wSN7Lfx1Blu7po8WM1dV067ahejkuV3ySjdHVZJ85pudBuayaYLHhcL1gfgwkhgs
 nK/3QXNeN5feJoTzN5ZP0McIx/Fk6FxTYxBhZLDrPRMdb3G0JAXAhqK+nC4kdIcBVJ
 3RoKHDpPxComNB/XK2HaazBV9lBxmi8j2vwAHBiBG4tXj3JGGYJsKpJsYcRcNSPyxE
 Oe3QBcQurZjZw==
Date: Tue, 18 Jul 2023 09:39:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH] drm/amd/display: Allow building DC with clang on RISC-V
Message-ID: <20230718163953.GA1279879@dev-arch.thelio-3990X>
References: <20230717222923.3026018-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717222923.3026018-1-samuel.holland@sifive.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 03:29:23PM -0700, Samuel Holland wrote:
> clang on RISC-V appears to be unaffected by the bug causing excessive
> stack usage in calculate_bandwidth(). clang 16 with -fstack-usage
> reports a 304 byte stack frame size with CONFIG_ARCH_RV32I, and 512
> bytes with CONFIG_ARCH_RV64I.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

I built ARCH=riscv allmodconfig drivers/gpu/drm/amd/amdgpu/ (confirming
that CONFIG_DRM_AMD_DC gets enabled) with LLVM 11 through 17 with and
without CONFIG_KASAN=y and I never saw the -Wframe-larger-than instance
that this was disabled for, so I agree.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> 
>  drivers/gpu/drm/amd/display/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index bf0a655d009e..901d1961b739 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -5,7 +5,7 @@ menu "Display Engine Configuration"
>  config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
> -	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
> +	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
>  	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> -- 
> 2.40.1
> 
