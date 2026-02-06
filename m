Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA+8OSTEhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:36:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6DFCB2E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223C810E01F;
	Fri,  6 Feb 2026 10:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvyvKfsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABAC10E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770374177; x=1801910177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kVwx9xHPOct8NYQjPahVHNDHhBM1uFvr3Q+pL3rRQM8=;
 b=cvyvKfsmy2IKLt7AiF48tF+JvEDbbAcxVzjsadHsRefW4vnWPxcy3qKF
 6Pd6l5UhvLq50hsVQsCzREGH0LfyGryWUkLajfJF6mbEOE4K6kr9XLzZL
 mAy4opLJlDQuCpX/r1W1O+cODApxBvAdJ+a4WsNZHGX61aZhaKjCf2HzP
 9iGVug1TZOflgUnLoEgsPDgFgVJNYJPiW5N28dtpMMHX5VSpYMpeUlEuG
 wVkX3DY9Wgj/hwWT3wNTiDPsEiAQStFAQaoCRVRnGRLW3i08MgoZC1sgk
 OtEgCIxaeUiBz85kiwecxsQND057VXALgDSvhT+bxtzq6iFifkSEJqGNF A==;
X-CSE-ConnectionGUID: 8wiSUxmzQlmcQmNP+86vqw==
X-CSE-MsgGUID: kszEsKkpTyuThaNpv8Xtaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71305136"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71305136"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 02:36:17 -0800
X-CSE-ConnectionGUID: +Yyql3ZPSYK99KG0JX3E3Q==
X-CSE-MsgGUID: iNHMpSgsSK+G5P9oOfGcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215006133"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 02:36:15 -0800
Date: Fri, 6 Feb 2026 12:36:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcaov@gmail.com>
Cc: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aYXEHajVeKvIMmL7@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <87y0l668ki.fsf@yellow.woof>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0l668ki.fsf@yellow.woof>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:namcaov@gmail.com,m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 74B6DFCB2E
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 01:04:45AM +0100, Nam Cao wrote:
> ChanSoo Shin <csshin9928@gmail.com> writes:
> > Instead of marking the entire display as dirty, calculate the start
> > and end rows based on the damage offset and length and only mark the
> > affected rows dirty. This reduces unnecessary full framebuffer updates
> > for partial writes.
> 
> This looks useful and I prefer to see it applied. I understand lack of
> testing is the main obstacle.

Correct.

> Are you still trying to get it merged? If not, I can take over.

Do you have an actual HW to test? If not, won't be applied either.

-- 
With Best Regards,
Andy Shevchenko


