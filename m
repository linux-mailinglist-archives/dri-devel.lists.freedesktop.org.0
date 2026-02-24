Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHhzFQ6qnWmgQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:39:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD8187DB0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097CC10E582;
	Tue, 24 Feb 2026 13:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTucrOmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841210E586;
 Tue, 24 Feb 2026 13:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771940361; x=1803476361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZWzYDdio7eRM6Sh6n7kMUp4dLQK/Gpzk4/2i6t5ZJe8=;
 b=MTucrOmWCrQzsDwdCGtJJDgApJUKh1pay1gkjAsnQdxj5ipN86GSgAh3
 bDGCQP8TQYrMW4QW93g/dB4Jj9qb8B2nyq/L0Z+S1eA8+nsRBMm2rbjcK
 jOTug+zrWip4S3+U6SCXvIBLRDqxxEy/EFE7lBOWRqAKggSsK9ewi9pX7
 WzzoIFQviC8AA01+Dn4P3+7Imj7daPgo53YrUlHBf0MM7yGwFtDIW/UK2
 O6oS94i50deFYzgsTolm4sTVEaC1H1jS9f3E3CJjwKIAfoER3LHJRCrME
 NwRg8YibGYOIbYwnKnixqd2ZFzj47JrAFDdsN14YVJn7Si8R2+V8WIKnm g==;
X-CSE-ConnectionGUID: wBVvU2M7SVOWEKPVE34A4w==
X-CSE-MsgGUID: K+VrfV25SgW5lduga6TX1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84410591"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84410591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:39:21 -0800
X-CSE-ConnectionGUID: 42ePsFd9Ssiv7/CksgaDTQ==
X-CSE-MsgGUID: dgv9PwfCSjmjpqq7hdzPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246478101"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:39:21 -0800
Message-ID: <8001c470-ca46-4390-be3c-f078b5fce498@linux.intel.com>
Date: Tue, 24 Feb 2026 14:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/pagemap: Unlock cache->lock before freeing it
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Bart Van Assche <bvanassche@acm.org>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260223222937.2008492-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260223222937.2008492-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,suse.de:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C1AD8187DB0
X-Rspamd-Action: no action

Hey,

Den 2026-02-23 kl. 23:29, skrev Matthew Brost:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Although freeing a spinlock without unlocking it is fine, this confuses
> static analyzers. Hence this patch.
> 
> Fixes: 77f14f2f2d73 ("drm/pagemap: Add a drm_pagemap cache and shrinker")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap_util.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> index 14ddb948a32e..50cb5f9cdac5 100644
> --- a/drivers/gpu/drm/drm_pagemap_util.c
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -74,6 +74,8 @@ static void drm_pagemap_cache_fini(void *arg)
>  		cache->dpagemap = NULL;
>  		spin_unlock(&cache->lock);
>  		drm_pagemap_destroy(dpagemap, false);
> +	} else {
> +		spin_unlock(&cache->lock);
>  	}
>  
>  out:

What about this idea?

https://lore.kernel.org/all/791538fb-56e5-4ca5-9484-1180cc928a70@linux.intel.com/
