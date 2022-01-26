Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B649D1AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 19:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3670610E5AF;
	Wed, 26 Jan 2022 18:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F410E38C;
 Wed, 26 Jan 2022 18:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643221501; x=1674757501;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hM7HDkJbApR2GD/yQT9ziotZaDQgdL9ixm1lADqtjpA=;
 b=gaOo1iykWSULGICKnqMvSaxMNhRsXblXgcIHSf1qlMSclvADzTUF6+5t
 4s0pF69w2Q3MDXkN6DOWDRJ0FmAsUQMry+uHyouGDHKxgKEXJyU9SYkou
 tYcaOr/ENOS3r2hRfgbTTGMuVqGdF8bExmnPDnA+uKOTwbfky0KmeuJSf
 hlTLOPZaP4C0H2zGbWHZFEKg1gZgqu8bwbecmue2N1obM7mubiS3EEPQd
 aOHGIOXY/8OulYC1GHb0L707ZllconjeN7ZWg4WhcA8wmobVbfk0vhtCm
 8M83YBTFqPZN4YE5Xj+s3sMNWAYVHeEnLJCGH0zTPfqJQQDYFEtjE7XUz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="271068041"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="271068041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 10:25:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="696325523"
Received: from nbasu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.16.197])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 10:24:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Stop spamming log with drm_cache
 message
In-Reply-To: <20220126004345.1137674-2-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220126004345.1137674-1-lucas.demarchi@intel.com>
 <20220126004345.1137674-2-lucas.demarchi@intel.com>
Date: Wed, 26 Jan 2022 20:24:54 +0200
Message-ID: <87ee4uxsll.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Only x86 and in some cases PPC have support added in drm_cache.c for the
> clflush class of functions. However warning once is sufficient to taint
> the log instead of spamming it with "Architecture has no drm_cache.c
> support" every few millisecond.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/drm_cache.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index f19d9acbe959..2d5a4c463a4f 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -112,7 +112,6 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
>  		kunmap_atomic(page_virtual);
>  	}
>  #else
> -	pr_err("Architecture has no drm_cache.c support\n");
>  	WARN_ON_ONCE(1);

An alternative would be to replace the two lines with:

	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");

But I'm not insisting.

BR,
Jani.


>  #endif
>  }
> @@ -143,7 +142,6 @@ drm_clflush_sg(struct sg_table *st)
>  	if (wbinvd_on_all_cpus())
>  		pr_err("Timed out waiting for cache flush\n");
>  #else
> -	pr_err("Architecture has no drm_cache.c support\n");
>  	WARN_ON_ONCE(1);
>  #endif
>  }
> @@ -177,7 +175,6 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>  	if (wbinvd_on_all_cpus())
>  		pr_err("Timed out waiting for cache flush\n");
>  #else
> -	pr_err("Architecture has no drm_cache.c support\n");
>  	WARN_ON_ONCE(1);
>  #endif
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
