Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFF193AC5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441B46E2E6;
	Thu, 26 Mar 2020 08:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022996E2E6;
 Thu, 26 Mar 2020 08:24:14 +0000 (UTC)
IronPort-SDR: Bmw4M9msa7JEm9YKw+QAXqr4E7/vqB/Du/lv/tvwNqzx+hn6ocJGKFPNZ0g8VpwKpb+xlt09jx
 WZw0EwFr1wFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 01:24:14 -0700
IronPort-SDR: 5SWx7LobP7Xk7vAZTAJX2qluD5fcl2KfCQrXaLbWi5S2WCQNBYGo4s5/hFX18gOYhnHfbYeuqC
 pMs/3FbeTOdQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="393901243"
Received: from mschuste-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.32.130])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 01:24:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 09/16] drm/i915: remove always-defined
 CONFIG_AS_MOVNTDQA
In-Reply-To: <20200326080104.27286-10-masahiroy@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <20200326080104.27286-10-masahiroy@kernel.org>
Date: Thu, 26 Mar 2020 10:24:04 +0200
Message-ID: <87ftdvikwr.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Mar 2020, Masahiro Yamada <masahiroy@kernel.org> wrote:
> CONFIG_AS_MOVNTDQA was introduced by commit 0b1de5d58e19 ("drm/i915:
> Use SSE4.1 movntdqa to accelerate reads from WC memory").
>
> We raise the minimal supported binutils version from time to time.
> The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
> required binutils version to 2.21").
>
> I confirmed the code in $(call as-instr,...) can be assembled by the
> binutils 2.21 assembler and also by LLVM integrated assembler.
>
> Remove CONFIG_AS_MOVNTDQA, which is always defined.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ack for merging this via whichever tree you see fit; please let me know
if you want me to pick this up via drm-intel.

BR,
Jani.


> ---
>
> Changes in v2: None
>
>  drivers/gpu/drm/i915/Makefile      | 3 ---
>  drivers/gpu/drm/i915/i915_memcpy.c | 5 -----
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a1f2411aa21b..e559e53fc634 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -28,9 +28,6 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
>  CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>  
> -subdir-ccflags-y += \
> -	$(call as-instr,movntdqa (%eax)$(comma)%xmm0,-DCONFIG_AS_MOVNTDQA)
> -
>  subdir-ccflags-y += -I$(srctree)/$(src)
>  
>  # Please keep these build lists sorted!
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
> index fdd550405fd3..7b3b83bd5ab8 100644
> --- a/drivers/gpu/drm/i915/i915_memcpy.c
> +++ b/drivers/gpu/drm/i915/i915_memcpy.c
> @@ -35,7 +35,6 @@
>  
>  static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>  
> -#ifdef CONFIG_AS_MOVNTDQA
>  static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
>  {
>  	kernel_fpu_begin();
> @@ -93,10 +92,6 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
>  
>  	kernel_fpu_end();
>  }
> -#else
> -static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len) {}
> -static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len) {}
> -#endif
>  
>  /**
>   * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
