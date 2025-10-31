Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51340C23DAD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA210EACC;
	Fri, 31 Oct 2025 08:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKM4FtVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5310EACC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761900021; x=1793436021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lEobPRPLUtvLJgGm6D2oVp+iskg4CGJ/ERaKYRsF7Q8=;
 b=QKM4FtVO90neArAmc9GFTDlI69bHOb++BDa9RfAwQpTFS26WwqX4Gkqx
 +7O+sOVBSf7k+4PCW/WLei4ALiD9/Foy2fOdqY3TMyqpyfLpthR+sqsTI
 61r2mfewPpmnWkfTct+XvDjkGAAlJiBX6sFUs7v8+8ofu84VKF7VwAnNF
 h7+IvpC8HC0WXTJkiGKhENrSWMHh9Za/lfmk1STpxglrF04CBtzWlRxla
 OAFfy8UhHgSeGPFrqt4oLwOzlPaUfayjjp9sPfqr38JXaxuUXCxtiSbub
 Cp0iQUtFoB6DLnHNA+vwwL7KXtHpoB9Cb2QwJjUYdDxReDjbM/+APajB/ w==;
X-CSE-ConnectionGUID: Yol3fjg7QPGAMgPZmsZsJg==
X-CSE-MsgGUID: TunbNJxFRyuLRsqbLd16kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63941043"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="63941043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:40:20 -0700
X-CSE-ConnectionGUID: qkmpKIy1S6uCeUj21pgabA==
X-CSE-MsgGUID: VyVZpSNZQkeGHUAbFOUW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="185388996"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:40:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, LiangCheng Wang
 <zaq14760@gmail.com>
Subject: Re: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to
 reduce stack usage
In-Reply-To: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
Date: Fri, 31 Oct 2025 10:40:13 +0200
Message-ID: <0d9e5bf4036dc0706fac603764276d2327d0bc69@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Oct 2025, LiangCheng Wang <zaq14760@gmail.com> wrote:
> Clang reports that pixpaper_panel_hw_init() exceeds the 8 KB stack
> frame limit:
>
>     drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
>       stack frame size (20024) exceeds limit (8192)
>       in 'pixpaper_panel_hw_init'
>
> This warning occurs because the compiler aggressively inlines
> pixpaper_send_cmd() and pixpaper_send_data() into
> pixpaper_panel_hw_init(), which inflates the estimated stack usage.
>
> Mark these two helper functions as 'noinline' to prevent inlining.
> This significantly reduces the reported stack usage without changing
> runtime behavior.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510270858.1GzE6iQg-lkp@intel.com/
> Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
> When building with Clang and frame size warnings enabled
> (-Wframe-larger-than=8192), the compiler reports that
> pixpaper_panel_hw_init() consumes over 20 KB of stack space:
>
>     drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
>       stack frame size (20024) exceeds limit (8192)
>       in 'pixpaper_panel_hw_init'
>
> This happens because Clang aggressively inlines
> pixpaper_send_cmd() and pixpaper_send_data() into
> pixpaper_panel_hw_init(), causing the calculated stack usage
> to balloon far beyond the warning threshold.
>
> The fix is straightforward: mark these two helper functions as
> 'noinline' to prevent inlining. This reduces the reported stack
> usage to within normal limits without changing runtime behavior.

I really *really* wish we wouldn't have to go this route at all.

But if we have to, I think noinline_for_stack is the keyword to use.


BR,
Jani.

> ---
>  drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
> index 32598fb2fee7fcdea3ea0696c2bf54404fcffa2e..70e3239adfd0f86f92551991872486380489fb9b 100644
> --- a/drivers/gpu/drm/tiny/pixpaper.c
> +++ b/drivers/gpu/drm/tiny/pixpaper.c
> @@ -536,7 +536,7 @@ static void pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg,
>  		err->errno_code = ret;
>  }
>  
> -static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
> +static noinline void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
>  			      struct pixpaper_error_ctx *err)
>  {
>  	if (err->errno_code)
> @@ -556,7 +556,7 @@ static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
>  	pixpaper_spi_sync(panel->spi, &msg, err);
>  }
>  
> -static void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
> +static noinline void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
>  			       struct pixpaper_error_ctx *err)
>  {
>  	if (err->errno_code)
>
> ---
> base-commit: d127176862a93c4b3216bda533d2bee170af5e71
> change-id: 20251031-fix_202510270858-2e4643b00545
>
> Best regards,

-- 
Jani Nikula, Intel
