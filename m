Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99738FA587
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 00:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B69E10E070;
	Mon,  3 Jun 2024 22:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oexfyiWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4F610E070;
 Mon,  3 Jun 2024 22:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9269F60AFA;
 Mon,  3 Jun 2024 22:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8A0C2BD10;
 Mon,  3 Jun 2024 22:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717453791;
 bh=5f9a0R2mCrPvkK7KpP8RCriUj65yzs0VJ4Rq1HprCHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oexfyiWuBGQ+/9Cg8ujHUG6B0riV65lkBjuEnePYZNcLjEyO+CI5qux2nR6ft7A5Q
 SXf7EZOnCmdmXC6OjEb7gZS7uQ+V6jY5UaKKgliYT0zquOr7UHIOUAfjxMaWHrIU0D
 ddvNEn0UfprFqMKm6zYhRg8gazeTZWCpa9E1YlbESM8vyNeF4TprsELiTfnjUr7fW2
 dEzh1yaZAyklVjzntj8Vfsjm6z2crenrg34Y3ZRGYf0o++JdxPDI6hBMhzQBE4PmEU
 FHwQEws761kLwQ0G/ujr8U9tDNbH7aONIevDfdpYQbqcEQbEe58WoX742hcdBkWV59
 08DJQcL/ECTAg==
Date: Mon, 3 Jun 2024 15:29:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Qingqing.Zhuo@amd.com, hamza.mahfooz@amd.com, chenhuacai@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: Increase frame-larger-than warning limit
Message-ID: <20240603222948.GB1802995@thelio-3990X>
References: <20240530145741.7506-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530145741.7506-2-palmer@rivosinc.com>
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

Hi Palmer,

On Thu, May 30, 2024 at 07:57:42AM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I get a handful of build errors along the lines of
> 
>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2352) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
>     static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>                 ^
>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2096) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>     void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>          ^

Judging from the message, this is clang/LLVM? What version? I assume
this showed up in 6.10-rc1 because of commit 77acc6b55ae4 ("riscv: add
support for kernel-mode FPU"), which allows this driver to be built for
RISC-V. Is this allmodconfig or some other configuration?

> as of 6.10-rc1.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index c4a5efd2dda5..b2bd72e63734 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -62,9 +62,9 @@ endif
>  
>  ifneq ($(CONFIG_FRAME_WARN),0)
>  ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -frame_warn_flag := -Wframe-larger-than=3072
> +frame_warn_flag := -Wframe-larger-than=4096
>  else
> -frame_warn_flag := -Wframe-larger-than=2048
> +frame_warn_flag := -Wframe-larger-than=3072
>  endif
>  endif
>  
> -- 
> 2.45.1
> 
