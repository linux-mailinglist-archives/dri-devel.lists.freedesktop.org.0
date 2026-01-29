Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKCIE6A9e2mNCgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:59:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2192AF4AF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAAA10E316;
	Thu, 29 Jan 2026 10:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPURgkUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F93B10E316
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769684379; x=1801220379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bQ0Q5APcgcKlSb7nEhSdvCM1gNhb+QfFD7Vv8Ooz8/A=;
 b=QPURgkULgfTPGs52MsNbGLPYGebNeVwYwTgclGbT9TaFj+LoXa1ZEORI
 sEyHIY8nAu0GzB4N0mMiRNtWqXVOXqEV+4KlIfcy5N9Z2x2J9OY2gJh0O
 b6mYGiQWK7YOpk0cXtQl6iaCOGOyO8DGAskcM7LGcropliLZMol5pgnZl
 MX4SY7Ix8yoWNT2uJrfjmlWJAs6zrEdKRt+E3c9N57yO9A0lWflflIZe1
 J0P6ftq1xbNb0EYtK0osm/SU4FL6zTk1+NbAuIAh0VWwwM/DYtJgeznnr
 d0EjGy1GyjRousbsuzHhg4FTe0sBColl48mR/IPU2k6wb5AQK7PNYUWVI A==;
X-CSE-ConnectionGUID: gjKhUxpxQZWWFx7NC2q7tA==
X-CSE-MsgGUID: 3CeBK2jHR8CeO1DN6+y9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82287323"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82287323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:59:39 -0800
X-CSE-ConnectionGUID: yOlryslmRdOS3t3cmOkNeQ==
X-CSE-MsgGUID: Y3U8pILCSuiGKYjyhzcQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213420756"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:59:37 -0800
Date: Thu, 29 Jan 2026 12:59:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aXs9lvhF9MIQASv0@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <aXr-RhUXwIvMHYZI@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXr-RhUXwIvMHYZI@stanley.mountain>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2192AF4AF
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 09:29:26AM +0300, Dan Carpenter wrote:
> On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> > Instead of marking the entire display as dirty, calculate the start
> > and end rows based on the damage offset and length and only mark the
> > affected rows dirty. This reduces unnecessary full framebuffer updates
> > for partial writes.
> > 
> > Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> > ---
> 
> TL/DR:  I suck as a reviewer so I would be nervous to apply this
> without testing.  Andy is an expert here and we trust him so if he's
> okay with it then great.  Or if some other expert could sign off, but
> I don't know enough to sign off myself.

The rule of thumb for _this_ driver (or set of drivers under FBTFT) is
that: we are in maintenance mode and we only accept bugfixes or treewide
changes. The rest can be accepted but unlikely. Either way, we really
want to see this (kind of changes) being tested on real HW. It's not as
simple as renaming variable 'i' to 'j'.

> The problem for me is how do I review something like this?  Staging
> is a grab bag of different modules and I'm not an expert in any of
> the subsystems.  Normally, it's easy to review staging patches
> because they are clean up work which does change how the code works
> so I just look for unintentional side effects.
> 
> It's trickier to review a patch like this which changes runtime.  If
> it were fixing a bug, then I could verify the bug is real and say
> well, "Maybe the fix is wrong, but we were going to corrupt memory
> anyway, so the worst case is that it is as bad as before.  It can't
> make the problem worse."
> 
> This is your first kernel patch.  You don't work for a company that
> makes the hardware.  You said earlier in a private email that this
> hasn't been tested.

Unfortunately it is not the best driver to go with this. At some point I might
be able to test this when I setup my fbtft minilab at home, I have a few I²C,
SPI, and parallel panels.

> The patch looks reasonable to me, but it also looks simple.  If it
> were that easy why didn't the original author do it?

-- 
With Best Regards,
Andy Shevchenko


