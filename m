Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADzdGKi5kGmbcgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 19:06:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF413CAC3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 19:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03010E0A2;
	Sat, 14 Feb 2026 18:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9FiflZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDF10E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771092386; x=1802628386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=usd0K5keZeMOWvHWVSE7Ssn7zoDRX0rgTmbce/m4OqE=;
 b=m9FiflZ40HWL+MJu+1QLp8Fn9rK3sygvg1+u71im31j26EVDR81Xfg2v
 yV1s6V2B25w/5Ns4JME2Mkj5NLmY4ul8gVAWTUcKe8TyOEd7j0eP8GkUX
 Zp0G6U6ouuP2AVXwGJ2j7mdTkW28BMum0hSHD1zhEeNkl8agWMRdobBEo
 6RunIAnVcvfllgjTs4LkjK4OO7KPF8sAJzes+ddRLDg23qIF2ySnTAtXC
 gQUlM5TNJ7DZLUBccKH8iAjO/sTdMPZlEW9qyyRJrbJNUTD2KQuokpYm5
 NDMkkRRyD2lPUgjB3dJURReJVKRIfXao/Z4mGfMgOs6wwdB2fDKfntQLX Q==;
X-CSE-ConnectionGUID: tgQjaRfcRj2r8IJskKPKIg==
X-CSE-MsgGUID: Ebt1tX5iQhKU7YqQtEEfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="76099223"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; d="scan'208";a="76099223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2026 10:06:25 -0800
X-CSE-ConnectionGUID: lGHamWo2SraaL/pLbWnHMg==
X-CSE-MsgGUID: EV5JJ2RpT9u2Dg9+1slFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; d="scan'208";a="212288613"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2026 10:06:24 -0800
Date: Sat, 14 Feb 2026 20:06:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Optimize partial write()
Message-ID: <aZC5nTK5wE7l8YAv@smile.fi.intel.com>
References: <20260213085946.3673695-1-namcao@linutronix.de>
 <aY76ixvOUEkvoPk0@smile.fi.intel.com> <87bjhsqe9y.fsf@yellow.woof>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjhsqe9y.fsf@yellow.woof>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:namcao@linutronix.de,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 93BF413CAC3
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 08:56:09AM +0700, Nam Cao wrote:
> Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> > On Fri, Feb 13, 2026 at 09:59:46AM +0100, Nam Cao wrote:
> >> When user write() only to part of the screen, the driver still updates the
> >> entire screen. That wastes CPU cycles.
> >> 
> >> Optimize by updating only the changed lines. Improvement is measured by a
> >> pair of trace_printk() at the beginning of fb_write() and at the end of
> >> fbtft_deferred_io().
> >
> > Can you elaborate on the HW (the exact model of the panel and [sub]driver)
> > in use?
> 
> My hardware is the Adafruit's ILI9340. Driver is fbtft/fb_ili9340.c.

Please, add that into commit message.
It will leave the trace that this change has been tested and how.

...

> >> -	/* special case, needed ? */
> >
> > Do you know the history of this comment? What is "special case" and when does it appear?
> 
> This allows caller to pass -1 to "make dirty" the entire screen. The
> only caller that uses this special case is removed in this patch.

Perhaps a small note (summary of the above) to the commit message as well?

...

> > In light of the last TODO line I think that the change is desired by
> > the original author. Nevertheless I am wondering about these side effects
> > that might be (very unlikely?) considered if this code (partial refresh)
> > runs for a significant period of time:
> >
> > - some bits of the screen (on non-updated part) might be flipped
> > - the static picture may lead to wearing of (decolourisation) the panel
> > - what is the thermal distribution (probably with backlight off)?
> >
> > Maybe it makes sense to refresh a full screen from time to time, but
> > TBH my knowledge of TFT panels from last decade is quite limited. I only
> > think from the point of the general physics and common sense. That's
> > why this long footnote rather philosophical, but I would be glad to
> > learn the state of affairs of the modern TFT panels in terms of the
> > physical parameters lasting over the time under different application
> > cases.
> 
> I can't tell you much about TFT panels, sorry. My company used to do a
> demo board with one of them, that's how I have some hardware to play with.
> 
> If user uses mmap() instead of write(), then full refresh is never done
> (well, unless user writes to the entire screen). So if lack of refresh
> is a problem, someone should have noticed already.

Right, that's why I asked more for my own learning.

-- 
With Best Regards,
Andy Shevchenko


