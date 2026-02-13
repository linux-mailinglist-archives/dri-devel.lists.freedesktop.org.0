Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEcoNJT6jmljGwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:19:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F9134F9A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29610E15F;
	Fri, 13 Feb 2026 10:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJ1xsFGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960010E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770977937; x=1802513937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P86JB5Zni+PGoOpigJg3FxB+a9oavX/tU1hPKbIxZ7s=;
 b=DJ1xsFGnDUUVEHZt52NmuKakGVGYhjsvKM3BHJChUVvK9jm3FCSmtarj
 xFQyuS7c5Zs9nhaHy0iS4pENQRSB+pZfbNb2d57PEPEzFXshGni2peRCQ
 MQhl47xckQA+19mF3d/5PvGeTKHrFTxSwy8vaAHDe2GDxbonykoIWljzh
 cMHFDF6MKY0EtAQEPsx/KDY1mR15ae60ONkBu9EIqcGQqjemjG4qwpXti
 qmW2VKMAgYr16vZriYvP2pc5SkRrSrjra0PLWexc1E0WeMnKJLoy2NU79
 tLHBWg9bb1FeQzu5otxiuoyWvk2AQjKlcEo+ph++AfMUzCLWYw49sbkTK A==;
X-CSE-ConnectionGUID: oS0Fc/AuSGC9S3cAtHf2oQ==
X-CSE-MsgGUID: e2XgCtmZTra741QbdbAcdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83602622"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83602622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:18:56 -0800
X-CSE-ConnectionGUID: sziJRZv4TMexr9OOgS/BIQ==
X-CSE-MsgGUID: /1hz4F7mTS+aWEoraqOdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217026888"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.242])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:18:54 -0800
Date: Fri, 13 Feb 2026 12:18:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Optimize partial write()
Message-ID: <aY76ixvOUEkvoPk0@smile.fi.intel.com>
References: <20260213085946.3673695-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213085946.3673695-1-namcao@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:namcao@linutronix.de,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_NA(0.00)[]
X-Rspamd-Queue-Id: 275F9134F9A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:59:46AM +0100, Nam Cao wrote:
> When user write() only to part of the screen, the driver still updates the
> entire screen. That wastes CPU cycles.
> 
> Optimize by updating only the changed lines. Improvement is measured by a
> pair of trace_printk() at the beginning of fb_write() and at the end of
> fbtft_deferred_io().

Can you elaborate on the HW (the exact model of the panel and [sub]driver)
in use?

> Update type         Before     After
> ====================================
> full screen         196ms      200ms
> half screen         200ms      124ms
> quarter screen      193ms       81ms
> one pixle           199ms       43ms
> 
> It is interesting to note that if the deferred IO's delay time (40ms) is
> subtracted, then the time amount scales linearly with the write size.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Some questions below, but they probably won't affect the decision on this change.

...

> -	/* special case, needed ? */

Do you know the history of this comment? What is "special case" and when does it appear?

> -	if (y == -1) {
> -		y = 0;
> -		height = info->var.yres;
> -	}

...

>  static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>  {
>  	struct fbtft_par *par = info->par;
> +	u32 start, end;
> +
> +	start = off / info->fix.line_length;
> +	end = (off + len - 1) / info->fix.line_length;
>  
> -	/* TODO: only mark changed area update all for now */

Ah, this change actually targets the TODO!

> -	par->fbtftops.mkdirty(info, -1, 0);
> +	par->fbtftops.mkdirty(info, start, end - start + 1);
>  }

...

In light of the last TODO line I think that the change is desired by
the original author. Nevertheless I am wondering about these side effects
that might be (very unlikely?) considered if this code (partial refresh)
runs for a significant period of time:

- some bits of the screen (on non-updated part) might be flipped
- the static picture may lead to wearing of (decolourisation) the panel
- what is the thermal distribution (probably with backlight off)?

Maybe it makes sense to refresh a full screen from time to time, but
TBH my knowledge of TFT panels from last decade is quite limited. I only
think from the point of the general physics and common sense. That's
why this long footnote rather philosophical, but I would be glad to
learn the state of affairs of the modern TFT panels in terms of the
physical parameters lasting over the time under different application
cases.

-- 
With Best Regards,
Andy Shevchenko


