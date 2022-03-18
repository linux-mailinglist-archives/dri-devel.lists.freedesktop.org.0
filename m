Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB974DDFA5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA7310E008;
	Fri, 18 Mar 2022 17:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C2710E008
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:11:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BBA9B82386;
 Fri, 18 Mar 2022 17:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B364C340E8;
 Fri, 18 Mar 2022 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647623504;
 bh=u0qd+S0q51vCysUim79f+I9JbPn7MGWn77B1wiYQT+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLoXwVh3SN5jeC8rBVy7DfOEgmytYZtZOBmEvka2IlFochqZnTTJXoJoMgoj1CY6+
 bUcbMSKahAYsBsDoBr30EoSgNfuOLUg1PFLJ9NFAANO4Pp7viKHA640YP0NZlt9XYn
 /MAOLQheOYR2nkdDosQD0VTLMZCFty5wwT4dbhQMr9o3k0kmy3rbGRa3C6hi5hI/Sh
 OBBQ/ws+MPgmVeD7SfhVpLlv8s8eOH46BM3IDP8NXE1gjA948bA94eG64rUyu4Fw91
 XvhTXwnWCTXIo7igRT4aBsA3yCsozaIaBMqs9cFaNFBdwSnoOWWj44KgkzljiqZuG4
 DGU1NTl0Lgyww==
Date: Fri, 18 Mar 2022 10:11:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/selftest: plane_helper: Put test structures in
 static storage
Message-ID: <YjS9SHCYIRsju8O/@dev-arch.thelio-3990X>
References: <20220302235909.784935-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302235909.784935-1-nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Claudio Suarez <cssk@net-c.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping, could someone review and/or pick this up? This is going to break a
few builds with CONFIG_WERROR, it would be nice to have it in
drm-misc-next-fixes, as the commit it is fixing is in drm-misc-next.

Cheers,
Nathan

On Wed, Mar 02, 2022 at 04:59:09PM -0700, Nathan Chancellor wrote:
> Clang warns on certain 32-bit architectures:
> 
>   drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: warning: stack frame size (1064) exceeds limit (1024) in 'igt_check_plane_state' [-Wframe-larger-than]
>   int igt_check_plane_state(void *ignored)
>       ^
>   1 warning generated.
> 
> The structures in igt_check_plane_state() total 1008 bytes, so any small
> amount of inlining will cause the stack frame to exceed the 32-bit limit
> of 1024, triggering the warning.
> 
> Move these structures to static storage, which dramatically reduces the
> amount of stack space in igt_check_plane_state(). There is no testing
> impact, as igt_check_plane_state() is only called once in the driver.
> 
> Fixes: 943e6a8beeac ("mock a drm_plane in igt_check_plane_state to make the test more robust")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1600
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/selftests/test-drm_plane_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> index ceebeede55ea..b61273e9c403 100644
> --- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> @@ -77,7 +77,7 @@ int igt_check_plane_state(void *ignored)
>  {
>  	int ret;
>  
> -	const struct drm_crtc_state crtc_state = {
> +	static const struct drm_crtc_state crtc_state = {
>  		.crtc = ZERO_SIZE_PTR,
>  		.enable = true,
>  		.active = true,
> @@ -87,14 +87,14 @@ int igt_check_plane_state(void *ignored)
>  				DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
>  		},
>  	};
> -	struct drm_plane plane = {
> +	static struct drm_plane plane = {
>  		.dev = NULL
>  	};
> -	struct drm_framebuffer fb = {
> +	static struct drm_framebuffer fb = {
>  		.width = 2048,
>  		.height = 2048
>  	};
> -	struct drm_plane_state plane_state = {
> +	static struct drm_plane_state plane_state = {
>  		.plane = &plane,
>  		.crtc = ZERO_SIZE_PTR,
>  		.fb = &fb,
> 
> base-commit: 9ae2ac4d31a85ce59cc560d514a31b95f4ace154
> -- 
> 2.35.1
> 
> 
