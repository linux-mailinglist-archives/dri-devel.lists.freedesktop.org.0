Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7745FD5FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7988B10E4C8;
	Thu, 13 Oct 2022 08:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EAF10E102;
 Thu, 13 Oct 2022 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665648749; x=1697184749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7n7bm9cEbwpAcQHLjxyNJZugoRkYPQp3Pb3ATCfFMcw=;
 b=ObT1NxtidbhoCaH2SFUCGamK0rrVCNOqdyRGLdKNr4RZU2ad9Hi85uqc
 LPItVJnSFXRZ9/GcTHBuZUtYMDhinpCHRxUAyru8wUCFttyFyCnT47Ba6
 SWzU2ZaMPURmNhecRN29OZ7ER35FXfUXd34nMzjNaLXGmTFYTiQICG6wU
 7ER0K35vKf+/uxs8cHqSSFOsZomdXE4Umj48ggY77sNXfP2J5LYt0bUhh
 fnFr/yX7eAiGzggpTZpRbkmY7dBxjllAiJGCZwpkqibOUCQKkVMig5XYw
 h/tJNVf4E4PPl1wIY8Wj3z1MF1reKdny9EmfPGDjtCUvFQ8dZ3y0Nb1Hz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306079538"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="306079538"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:12:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="769524814"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="769524814"
Received: from ndenisov-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.197])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:12:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, keescook@chromium.org
Subject: Re: [PATCH v3] overflow: Introduce overflows_type() and
 castable_to_type()
In-Reply-To: <20221013064956.1548741-1-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221013064956.1548741-1-gwan-gyeong.mun@intel.com>
Date: Thu, 13 Oct 2022 11:12:29 +0300
Message-ID: <87zge0rvki.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, arnd@kernel.org, airlied@linux.ie,
 trix@redhat.com, dlatypov@google.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-gfx@lists.freedesktop.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index 0d98c9bc75da..44da9d190057 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,11 @@
>  #include <linux/types.h>
>  #include <linux/vmalloc.h>
>  
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#ifdef CONFIG_CC_IS_CLANG
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +#endif

I thought #pragma was discouraged. I didn't try this, but would
something like this work in the Makefile instead:

CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)

Sorry for not noticing before. If you all think pragma is fine, sorry
for the noise.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
