Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPUpHfeIemkE7gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:08:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9BA9663
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7CC10E2EB;
	Wed, 28 Jan 2026 22:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYFWkmVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9010E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769638131; x=1801174131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MKkq/+o6+JFhxH/lx1U+jyyO0F2kD83mOBwrBuwtSIE=;
 b=UYFWkmVrfeOkv3gPsbCW+Ngxd13OsYcIw7QFMfV2eyWmty93PELowrXP
 CVFaqje6B97QH8mLEMNMXVkaRz4WPF0kVt0ZL3pIEBGT7e2S20e/F1pH4
 tQPjtf9Les7UlKs0Rq54U+UIGmkBINu3GchpzmUkgwAV3RTwKDeOh/Sks
 yB6qZ996zFloTP4f+WZq/P/8zsoP5rl9X0O9+fiIZwIlEOhGXQqDVRvfL
 yLYiOgwZvFsQFUce/tFRnZrwEeQZPG7WYycYCPjPhmzaLmmyiyCovt16L
 vqnPKfekhuskfb3zv+tJUNTZiu5MR8DpDZYAhUMi0ao9mjHYp9WLMvRIF g==;
X-CSE-ConnectionGUID: dEN+oZhaSNe+TXXYlceyzQ==
X-CSE-MsgGUID: FsKcsdGgSBSkWTtvXPIjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93522750"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="93522750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:08:51 -0800
X-CSE-ConnectionGUID: u2Byrd5eRZOlS+yBtkhkAw==
X-CSE-MsgGUID: PGqYRV4MTwGsKD04vBBFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212474357"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.57])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:08:49 -0800
Date: Thu, 29 Jan 2026 00:08:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use guard() to simplify code
Message-ID: <aXqI7qbxZEulU_GO@smile.fi.intel.com>
References: <20260128212644.1170970-1-paul.retourne@orange.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128212644.1170970-1-paul.retourne@orange.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:paul.retourne@orange.fr,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[orange.fr];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 05A9BA9663
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:26:42PM +0100, Paul Retourné wrote:
> Use guard() to simplify mutex locking. No functional change.

...

>  #include <linux/init.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
> +#include <linux/cleanup.h>

Try to squeeze the new inclusion into the longest ordered chain with some
pieces left unordered. With the given context the lease is to put it before
delay.h, but maybe there is a better place.

...

>  	if (par->gamma.curves[0] == 0) {
> -		mutex_lock(&par->gamma.lock);
> +		guard(mutex)(&par->gamma.lock);
>  		if (par->info->var.yres == 64)
>  			par->gamma.curves[0] = 0xCF;
>  		else
>  			par->gamma.curves[0] = 0x8F;
> -		mutex_unlock(&par->gamma.lock);
>  	}

This has close to 0 added value. Don't do conversion just for fun.

...

> --- a/drivers/staging/fbtft/fb_ssd1306.c
> +++ b/drivers/staging/fbtft/fb_ssd1306.c

Ditto.

...

Sorry, but I don't see much value in this change.

-- 
With Best Regards,
Andy Shevchenko


