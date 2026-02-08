Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAK4DduTiGlbrgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 14:47:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B6108CF1
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 14:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DED10E102;
	Sun,  8 Feb 2026 13:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmO99yFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970110E102
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770558421; x=1802094421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IfCx8FuhXcmPUmvEZWLLSa3nIj7MtGEd1V5PX3u5lZM=;
 b=OmO99yFtSzscFdeNuWAo2KZ69imyLJloyuB316ap+WYqdmsSH7UPT10K
 Ag5+iGMUL8C+OrBj6rxycXAkDJV9WEeCuL/lpR10j1nW6Xzwj8qxTlhpU
 JL16W1ntFY5oDnNVQcf3OO21520BK41/1ov2a38xAXBUrE9O1yDO5NmLL
 Zps1HEDxemIebUPAH9B/APfthPlDaEmWZqwAEAMmASzl3/BcZPih4m/Pk
 LI+Z1lpvMJm22xuiwi89A/I5TDR7nHB+swx1HMDuRJDDvHeF7+cfs3IdW
 Frp2XNBkULV80/4b1eNQtv55j+7ogp3tF+hA1Q4T31zTZf8c4lPJh+bs/ A==;
X-CSE-ConnectionGUID: KPY0y7fYQpazPaWfraJ9UQ==
X-CSE-MsgGUID: JseOsIqyQ8ayhgRR8Z12wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75311516"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="75311516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 05:47:00 -0800
X-CSE-ConnectionGUID: U8Xf+RzOT8mH95qaZlMQEg==
X-CSE-MsgGUID: xz95bUBSTYSkoWwIuVgdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="211390967"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 05:46:57 -0800
Date: Sun, 8 Feb 2026 15:46:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix unchecked write return value in
 fb_agm1264k-fl
Message-ID: <aYiTz5_OUhwJ9Vhs@smile.fi.intel.com>
References: <20260207220523.3816-1-iprintercanon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207220523.3816-1-iprintercanon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iprintercanon@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A59B6108CF1
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 10:05:23PM +0000, Artem Lytkin wrote:
> The second call to par->fbtftops.write() does not capture the return
> value, so the subsequent error check tests a stale value from the
> first write call. Add the missing assignment so the error check
> applies to the correct write operation.

Hmm... Sounds about right, but it was like that from the day 1.
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


