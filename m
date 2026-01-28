Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCIqMR6Peml+7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:35:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EECA99EF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388D10E2EC;
	Wed, 28 Jan 2026 22:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9KNFiBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF5610E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769639706; x=1801175706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nhYygQQwOHRkNC6CveoNJnpwHeTyhDqvKVE7dBa1WgY=;
 b=D9KNFiBfaCL6sNElvo44Pv5dI/KSr90RYr/rHIucInfWlrbTOB7TkDlC
 DNjShTpBzYLf6DGNm1/hYxDApJXbMHPC/tFOOWjKlH1qXWeWG6AA3w9xq
 a5L1JTIXWc38HS8mKRBGBSrheAA19Vq3GHfKWGE6xc6HdHjQ4VbnpzOnG
 /1WQwxu4cRykmbk2m9s/fev2AMtlwT3aOapKl4W/qPdkKQ1D49pbNWNSm
 h7eD1y4UdIHQgh4ECexLXfYXggCpYeMcgmreg4ypuYZK4mMe5/gAzZJAN
 /Qpws2jJBmPSd3btEpD3Gwt+9s0SY0QfXqaUzjzEZkuGsf7I6RxrhX3Aw w==;
X-CSE-ConnectionGUID: f8GUB5SCRbK+2js7RKiZ1Q==
X-CSE-MsgGUID: U1ypX58WR92wDLEN4mpmGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70905538"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70905538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:35:05 -0800
X-CSE-ConnectionGUID: 6X5jH80pQeSWIE+VLaAAww==
X-CSE-MsgGUID: Ss0/p/x2QCel/znQA4hZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207992461"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.57])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:35:03 -0800
Date: Thu, 29 Jan 2026 00:35:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: ChanSoo Shin <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aXqPFXQh5zpbnjhR@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128203938.962414-1-csshin9928@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 54EECA99EF
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate the start
> and end rows based on the damage offset and length and only mark the
> affected rows dirty. This reduces unnecessary full framebuffer updates
> for partial writes.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

This is v5 and no changelog and no answers to the reviewers' questions.
Please, read all what people replied to your previous attempts.
Without that processed correctly NAK to this one.

-- 
With Best Regards,
Andy Shevchenko


