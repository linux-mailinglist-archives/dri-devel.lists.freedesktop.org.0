Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPXyArmjnWlrQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:12:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A681876C4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BFF10E580;
	Tue, 24 Feb 2026 13:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JO8xmZlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839110E580
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771938740; x=1803474740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UBqfpuoHiHO12Q6XzOi0hlOWzhBh1VVhircJp5oD0zY=;
 b=JO8xmZlwLN8/blqzufXXqKmayJfcxbmblmi3PiUYakzLLcSCnttJO4Lv
 A8DC1ItZwyceMdmauC7fVP3vgDrSq4LMNrPcuUWvwQXKA9FpznNqB6u51
 S3rKsGGl/BQk4JacOrUadSeKG/lFQXc5KajWnafe2DDcitlXQn56t2nrs
 Ut7Y4zuVLigr3HzWTUrp5yhi0HuTCg/PBWOEMA+Lrx6bivVPRWee/77i8
 iG4CpeOV5beiE/hl6bbVVrUj+M49Ux0nTDkKVptP3rTJAPjg4syq4yjod
 jkQHrRxkshaoPyol91xW6zlIxuxdztPYxy4DZo2gtIno6VuXRvvVqIcfC w==;
X-CSE-ConnectionGUID: 5ooL+tELQ56NgUQ7Lxtbiw==
X-CSE-MsgGUID: 1VChQcTaTjuehGqMXiHPQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72862841"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72862841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:12:20 -0800
X-CSE-ConnectionGUID: QUCI7yJ1RpCc5Hff2hmmvg==
X-CSE-MsgGUID: AvrppeMxSXSpSWelIKC1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253626735"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:12:18 -0800
Message-ID: <791538fb-56e5-4ca5-9484-1180cc928a70@linux.intel.com>
Date: Tue, 24 Feb 2026 14:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/pagemap_util: Ensure proper cache lock management on
 free
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com,
 thomas.hellstrom@linux.intel.com, matthew.brost@intel.com
References: <20260220190943.66961-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260220190943.66961-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cavitt@intel.com,m:saurabhg.gupta@intel.com,m:alex.zuo@intel.com,m:thomas.hellstrom@linux.intel.com,m:matthew.brost@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 58A681876C4
X-Rspamd-Action: no action



Den 2026-02-20 kl. 20:09, skrev Jonathan Cavitt:
> Static analysis issue:
> 
> Though probably unnecessary given the cache is being freed at this step,
> for the sake of consistency, ensure that the cache lock is always
> unlocked after drm_pagemap_cache_fini.
> 
> Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap_util.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> index c6ae3357c7fb..79e07b3658ed 100644
> --- a/drivers/gpu/drm/drm_pagemap_util.c
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -65,18 +65,18 @@ static void drm_pagemap_cache_fini(void *arg)
>  	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
>  	spin_lock(&cache->lock);
>  	dpagemap = cache->dpagemap;
> -	if (!dpagemap) {
> -		spin_unlock(&cache->lock);
> +	if (!dpagemap)
>  		goto out;
> -	}
>  
>  	if (drm_pagemap_shrinker_cancel(dpagemap)) {
>  		cache->dpagemap = NULL;
>  		spin_unlock(&cache->lock);
>  		drm_pagemap_destroy(dpagemap, false);
> +	} else {
> +out:
> +		spin_unlock(&cache->lock);
>  	}
>  
> -out:
>  	mutex_destroy(&cache->lookup_mutex);
>  	kfree(cache);
>  }

I think this flow without goto is slightly more readable:

	spin_lock(&cache->lock);
	dpagemap = cache->dpagemap;
	cache->dpagemap = NULL;
	if (dpagemap && !drm_pagemap_shrinker_cancel(dpagemap))
		dpagemap = NULL;
	spin_unlock(&cache->lock);

	if (dpagemap)
		drm_pagemap_destroy(dpagemap, false);

	mutex_destroy(&cache->lookup_mutex);
	kfree(cache);
}

Although since we are freeing, it doesn't matter if cache->dpagemap stays assigned,
so perhaps the cache->dpagemap = NULL assignment can be removed too.

Kind regards,
~Maarten Lankhorst
