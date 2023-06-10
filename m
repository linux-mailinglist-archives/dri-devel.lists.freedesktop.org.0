Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2E72A9C3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7158710E17C;
	Sat, 10 Jun 2023 07:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50210E162;
 Sat, 10 Jun 2023 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686381253; x=1717917253;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/AJK6BcsI1+pYayq4GPa+LNrEBFVNr39nXOAfbSELVQ=;
 b=DMlab+E0krCIGWLq6E6qsZaaWGm0etDoTLL8v+UQrUCeeRgKH13z7Y9n
 /ytXEx94tmJXoP/6a7JzjeMSJ3dxIgztSWI/5v/4/9jl8LA8J26LdWn7x
 UDOs7tHX2dUMY7svc3dsCpwM/Shc2gvHtRbB+tmtDHjPtE0wHs6oXjSGX
 ykloczcYXJdcWrhyFCzaF/rpJWPOfDbyk3v/aJxrnHdqnv3yFss2P7p//
 Y6VfXzgEvwrXWLJZXnZlwZ8OBxgj75ZGs1EsoTSExfrHwnLZVH1+Yurbt
 yPhgNafOLYbYiB5jS/8QZT7OEVuvPt9VfdDQwLcrMSt4zrLvLG+ofX6B1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355228629"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; d="scan'208";a="355228629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854981401"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; d="scan'208";a="854981401"
Received: from mnovakov-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.60.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:14:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: Re: [PATCH] drm/amdgpu: Wrap -Wunused-but-set-variable in cc-option
In-Reply-To: <20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-v1-1-48ca005f2247@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-v1-1-48ca005f2247@kernel.org>
Date: Sat, 10 Jun 2023 10:14:05 +0300
Message-ID: <87ttvfpz5u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org,
 Kenny.Ho@amd.com, hamza.mahfooz@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jun 2023, Nathan Chancellor <nathan@kernel.org> wrote:
> -Wunused-but-set-variable was only supported in clang starting with
> 13.0.0, so earlier versions will emit a warning, which is turned into a
> hard error for the kernel to mirror GCC:
>
>   error: unknown warning option '-Wunused-but-set-variable'; did you mean '-Wunused-const-variable'? [-Werror,-Wunknown-warning-option]
>
> The minimum supported version of clang for building the kernel is
> 11.0.0, so match the rest of the kernel and wrap
> -Wunused-but-set-variable in a cc-option call, so that it is only used
> when supported by the compiler.

I wonder if there's a table somewhere listing all the warning options,
which GCC and Clang versions support them, and which versions have them
in -Wall and -Wextra. Would be really useful.

If there isn't one, it would be really helpful. *wink*.

BR,
Jani.


>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1869
> Fixes: a0fd5a5f676c ("drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 7ee68b1bbfed..86b833085f19 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -40,7 +40,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
>  	-I$(FULL_AMD_PATH)/amdkfd
>  
>  subdir-ccflags-y := -Wextra
> -subdir-ccflags-y += -Wunused-but-set-variable
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
>  subdir-ccflags-y += -Wno-unused-parameter
>  subdir-ccflags-y += -Wno-type-limits
>  subdir-ccflags-y += -Wno-sign-compare
>
> ---
> base-commit: 6bd4b01e8938779b0d959bdf33949a9aa258a363
> change-id: 20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-0be9528ac5c8
>
> Best regards,

-- 
Jani Nikula, Intel Open Source Graphics Center
