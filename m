Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A13A72D80
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458A10E02D;
	Thu, 27 Mar 2025 10:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcizOs1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEAD10E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743070472; x=1774606472;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=giySu6xIZjlmmNFPqaCfRdb3ApliqH0pfCPum+wMMX0=;
 b=EcizOs1J1/dYWhEzA0lbazBkh97uc324l1f+sXkKGANvPQsWSR9jLEXk
 fudZ6FSqVJdXfLaEqbtB84BrRk/PdmGnrgMwg48ykD6YeDCzW+08ATwjB
 gkKzqYBEvZdsbX3ONykApp2mr08oxh5g2NHbRrnQghf8SjJsDcwohBrja
 OFlX4H3L4OCkROXYxa8HzxmGuFy1onbdmIBK1gqfhxA9ZoJivN6LGP8sd
 6zmkBy+isV/SSB+JdTfHIQhd8VZt6UEO5e1mp1L3aA+rWRnD/t56gyMsY
 /g/5HWLIEnUMlWv3XTtCb5IcIyo01S7kgpy6vJD6behWTAPiKbGctIRnr g==;
X-CSE-ConnectionGUID: nl4lMwvfSP+0TeCK1nWnVA==
X-CSE-MsgGUID: BSB76CbSQnO8QOT/EVC4kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69755456"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69755456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:14:32 -0700
X-CSE-ConnectionGUID: BviyDncsTJKOyQmh/7vWTQ==
X-CSE-MsgGUID: EWJfyvPNTu27FiuKthCc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130189060"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:14:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Denis Arefev <arefev@swemel.ru>, Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
In-Reply-To: <20250327100126.12585-2-arefev@swemel.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250327100126.12585-1-arefev@swemel.ru>
 <20250327100126.12585-2-arefev@swemel.ru>
Date: Thu, 27 Mar 2025 12:14:26 +0200
Message-ID: <87pli26arh.fsf@intel.com>
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

On Thu, 27 Mar 2025, Denis Arefev <arefev@swemel.ru> wrote:
> The value LCD_MISC_CNTL is used in the 'aty_st_lcd()' function to
> calculate an index for accessing an array element of size 9.
> This may cause a buffer overflow.

The fix is to fix it, not silently brush it under the carpet.

BR,
Jani.

>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
> index 210fd3ac18a4..93eb5eb6042b 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -149,6 +149,8 @@ static const u32 lt_lcd_regs[] = {
>  void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>  {
>  	if (M64_HAS(LT_LCD_REGS)) {
> +		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
> +			return;
>  		aty_st_le32(lt_lcd_regs[index], val, par);
>  	} else {
>  		unsigned long temp;
> @@ -164,6 +166,8 @@ void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>  u32 aty_ld_lcd(int index, const struct atyfb_par *par)
>  {
>  	if (M64_HAS(LT_LCD_REGS)) {
> +		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
> +			return 0;
>  		return aty_ld_le32(lt_lcd_regs[index], par);
>  	} else {
>  		unsigned long temp;

-- 
Jani Nikula, Intel
