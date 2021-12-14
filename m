Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C639473965
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 01:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B657610E8AC;
	Tue, 14 Dec 2021 00:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8B910E8AC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 00:13:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B4F4B81744;
 Tue, 14 Dec 2021 00:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E44C34600;
 Tue, 14 Dec 2021 00:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639440791;
 bh=amJgLdWIZOt98JM4XfKKdY2rx8uE3I1QvBy2rLEOECQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lABwMARzbxF5ADfS9X6lyyf67QZvfOmvlF/Id6/NFtpHo4wc1J3QPVTerbV6Ik6LU
 76MZX2JZm2VYpaWoRrCA8guCS2xpHWtCOegnj8XzoHOER+/e+sAu8eyvL8qLOxeB/H
 Q4bhBosMTDzzFG5YC4IcLONid5nI0/feyurk0ESNoyG75u0H7JGDx4IHnp7XlqeHw8
 nG7FQDOFSxK1M8B17htBcKUZ++TATkaVDaYbn0TBtVjH0KLMrzqJ+tnEtfcO6TZNJH
 ow1twsGiSftYCa2tMtliz9quSVof5Phq2jfDxMuPUBjpT6G5PGA+ylwtHwqZVggeB1
 ACNL4C1luEtNw==
Date: Mon, 13 Dec 2021 18:18:49 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/dp: Fix off-by-one in register cache size
Message-ID: <20211214001849.GA62559@embeddedor>
References: <20211203084333.3105038-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203084333.3105038-1-keescook@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 12:43:33AM -0800, Kees Cook wrote:
> The pcon_dsc_dpcd array holds 13 registers (0x92 through 0x9E). Fix the
> math to calculate the max size. Found from a -Warray-bounds build:
> 
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
> drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
>  3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
>       |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
>  3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
>       |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: e2e16da398d9 ("drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon")

This should be tagged for -stable:

Cc: stable@vger.kernel.org

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  include/drm/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..472dac376284 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -456,7 +456,7 @@ struct drm_panel;
>  #define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
>  
>  /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
> -#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
> +#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xD	/* 0x92 through 0x9E */
>  #define DP_PCON_DSC_ENCODER                 0x092
>  # define DP_PCON_DSC_ENCODER_SUPPORTED      (1 << 0)
>  # define DP_PCON_DSC_PPS_ENC_OVERRIDE       (1 << 1)
> -- 
> 2.30.2
> 
