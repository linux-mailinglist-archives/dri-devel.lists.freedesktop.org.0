Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB7gAaDhhWk9HwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:42:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D6FDAAE
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4110E65D;
	Fri,  6 Feb 2026 12:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgB2dZTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C410E65D;
 Fri,  6 Feb 2026 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770381723; x=1801917723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7QS4MIfGTEZ+vRLfRDQHs54AFl65zKm1PclwnWPY/Zw=;
 b=DgB2dZTIRFuQ69SODe9h76TB3nGvuDu6H3ZjI1QPX9XmVD922gkFQjGz
 fBbZNxC/aPhADWVdiZ8WtM5MMP4Td+ib/nuisbR94CgfqOljVBOYVdY3I
 TMm2NPTQKhQfsdFK3zhYKku1YcTs6FUTdre642CAxQeN7VmJz5H7zvFeI
 Y4sWpt4mumfRNl2GKTLn7ZCCldeBP0aLiIKXf8/CbUaXadMvzzPykT3O/
 UDWXNOA5Ph2juG4IShlOSJxq1pedYuEsBh8sUdvucoJUAlkBfHfYq2sKJ
 Z1bJneoHhlMThA+9Yq3nZdVrUIL4i+KEcNZmL8JQb4ivlQ3afByEI20t8 A==;
X-CSE-ConnectionGUID: CzkalnTrRPaOHjZ4zkN65w==
X-CSE-MsgGUID: ZQ4E/kgBQOyz/T31jJ7uxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71579641"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71579641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:42:02 -0800
X-CSE-ConnectionGUID: GNQDFF2DQRKDT4lTd3I56g==
X-CSE-MsgGUID: 347jv7kMRg6y3GLhqMtkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="233805215"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:41:58 -0800
Date: Fri, 6 Feb 2026 14:41:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/xe/fbdev: Fix BIOS FB vs.s stolen size check
Message-ID: <aYXhVgRXcHgTKnA-@intel.com>
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
 <20260205140235.338410-2-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205140235.338410-2-vinod.govindapillai@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spamd-Result: default: False [0.28 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C67D6FDAAE
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 04:02:30PM +0200, Vinod Govindapillai wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Looks like stolen->size is in bytes, not pages. Remove the
> bogus PAGE_SHIFT stuff.

It looks to me like ttm itself is the problem here. It appears
to be a mismash of pages and bytes, and missing documentation
on which unit applies where.

Even worse, it looks like different drivers use different conventions
on what units to use. Eg. ttm_resource_manager_init() sometimes gets
passed the size in pages, sometimes in bytes. xe even uses both
units in one driver: pages in xe_ttm_sys_mgr_init(), bytes in
__xe_ttm_vram_mgr_init().

Cc'ing some ttm folks...

> 
> Also for some rnadom reason xe rejects the FB if it takes up
> exactly half of stolen, whereas i915 allows it to be used
> in that case. Adjust xe to follow the i915 rule for consistency.
> 
> v2: rebase related updates
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 4cfeafcc158d..38ecc201ac4e 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -99,7 +99,7 @@ initial_plane_bo(struct xe_device *xe,
>  		 * features.
>  		 */
>  		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
> -		    plane_config->size * 2 >> PAGE_SHIFT >= stolen->size)
> +		    plane_config->size * 2 > stolen->size)
>  			return NULL;
>  	}
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
