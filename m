Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40628A76DC9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 21:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83D710E47F;
	Mon, 31 Mar 2025 19:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjAZmNJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A72B10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743450925; x=1774986925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c7NzQUgJyQ6dXCaMlYVpOtWEnGAmsfB/UgZKrFbmZjA=;
 b=VjAZmNJ332q3t9XflrfyiWAm0xWGwXr9pFsPJtvVW3aadquyUy7NZTER
 Wen4xx4KZZvBmgCI+5aq3lyX5T4F9HtiYz9CZjUzeOiS9b+4u2xJGMH7x
 oYNR4M39AC83HC5XWTsNFdkqPgLzoAOgel/1B3UL63+lsnl3QGyVGqsYD
 FwbsNDNuFntKme0A+EusgbJoQBgdUH8d7dQfcpK8ugWXWx3kmrbnB6s/U
 YcVaXWMbaJOiM4N5geyuEsEIWSLOUwoF9btHokLUCvSYoEEpbraW7iGux
 cXhn+YGnqWKMQfSaXod6cifkO68j/6uOYZy00d5qnAceo6hOwT7y19huH Q==;
X-CSE-ConnectionGUID: iGLraeRwQACbJOwfY68+9Q==
X-CSE-MsgGUID: QPszK7mbTsGFNMRc1Lkgsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55411192"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="55411192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 12:55:18 -0700
X-CSE-ConnectionGUID: pkWiiMerQnuqaQO/d85r/w==
X-CSE-MsgGUID: ccVwXtgEQT2n4V/ycGhXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131397506"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 31 Mar 2025 12:55:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Mar 2025 22:55:13 +0300
Date: Mon, 31 Mar 2025 22:55:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Denis Arefev <arefev@swemel.ru>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
Message-ID: <Z-rzIfUMmOq1UZY1@intel.com>
References: <20250327100126.12585-1-arefev@swemel.ru>
 <20250327100126.12585-2-arefev@swemel.ru>
 <87pli26arh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pli26arh.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Mar 27, 2025 at 12:14:26PM +0200, Jani Nikula wrote:
> On Thu, 27 Mar 2025, Denis Arefev <arefev@swemel.ru> wrote:
> > The value LCD_MISC_CNTL is used in the 'aty_st_lcd()' function to
> > calculate an index for accessing an array element of size 9.
> > This may cause a buffer overflow.
> 
> The fix is to fix it, not silently brush it under the carpet.

There's actually nothing to fix. The backlight code is only
used on Rage Mobility which has real indexed LCD registers.

Older chips do supposedly have backlight control as well,
but implemented differently. I was mildly curious about
this stuff, so I I poked at my Rage LT Pro a bit to see
if I could get backlight control working on it, but the
only things I was able to achieve were either backlight
completely off, or blinking horribly. So looks like at least
on this machine (Dell Insipiron 7000) the backlight is
implemented in a way that can't be controller via the
normal registers. The machine does have brightness keys that
do work (though the difference between the min and max is
barely noticeable) but they don't result in any changes in
the relevant registers.

> 
> BR,
> Jani.
> 
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Denis Arefev <arefev@swemel.ru>
> > ---
> >  drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
> > index 210fd3ac18a4..93eb5eb6042b 100644
> > --- a/drivers/video/fbdev/aty/atyfb_base.c
> > +++ b/drivers/video/fbdev/aty/atyfb_base.c
> > @@ -149,6 +149,8 @@ static const u32 lt_lcd_regs[] = {
> >  void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
> >  {
> >  	if (M64_HAS(LT_LCD_REGS)) {
> > +		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
> > +			return;
> >  		aty_st_le32(lt_lcd_regs[index], val, par);
> >  	} else {
> >  		unsigned long temp;
> > @@ -164,6 +166,8 @@ void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
> >  u32 aty_ld_lcd(int index, const struct atyfb_par *par)
> >  {
> >  	if (M64_HAS(LT_LCD_REGS)) {
> > +		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
> > +			return 0;
> >  		return aty_ld_le32(lt_lcd_regs[index], par);
> >  	} else {
> >  		unsigned long temp;
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
