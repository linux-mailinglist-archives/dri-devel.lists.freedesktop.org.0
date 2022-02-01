Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85204A5A2B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DDF10ED8D;
	Tue,  1 Feb 2022 10:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405AD10ED89;
 Tue,  1 Feb 2022 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643711893; x=1675247893;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wi6tGWu1Mtt2YCS7/AIUdH414QHgbGm8XFhLjMgdi/I=;
 b=jmYxhOfv3YPQ+LbDFxkXsLAnMEJHFITDZQ64t2xOpLzqdyaqZUXf5VUk
 klRMdf9TaNQYJvpCsup0K4YlL5MceH2M9OcQVPcUcyR1siU1Q2j16YwNx
 yagO32nOiw39GZFQWxrv0rQ+C/23WWCfnU6IR6UyJp/3CHvVlqlI1oVEb
 b6hOiyCE1UoVZ1LIzF4PEUsnv9D8PDgENNG1T7zel9xZskLIRuREmeHKb
 F5b+2hLCEB/ctvcTklYx4q2BawnHA9/xZtoUzQS4HQ+ZeKWheiWb44NpS
 qovcEfmgdw0GFgc/9zy6OKpXuXG+3uS3zXaxZqBG+xt1z+ArOI3Rv7e31 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="227636977"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="227636977"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:38:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="582990053"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:38:11 -0800
Message-ID: <8fdfcd85e26cee05994fe02a0b5b1622fd5f0d76.camel@linux.intel.com>
Subject: Re: [PATCH 08/20] drm/i915/buddy: adjust res->start
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 01 Feb 2022 11:38:08 +0100
In-Reply-To: <20220126152155.3070602-9-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-01-26 at 15:21 +0000, Matthew Auld wrote:
> Differentiate between mappable vs non-mappable resources, also if
> this
> is an actual range allocation ensure we set res->start as the
> starting
> pfn. Later when we need to do non-mappable -> mappable moves then we
> want TTM to see that the current placement is not compatible, which
> should result in an actual move, instead of being turned into a noop.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 6e5842155898..bc725a92fc5c 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -140,6 +140,13 @@ static int i915_ttm_buddy_man_alloc(struct
> ttm_resource_manager *man,
>                 mutex_unlock(&bman->lock);
>         }
>  
> +       if (place->lpfn - place->fpfn == n_pages)
> +               bman_res->base.start = place->fpfn;
> +       else if (lpfn <= bman->visible_size)
> +               bman_res->base.start = 0;
> +       else
> +               bman_res->base.start = bman->visible_size;
> +
>         *res = &bman_res->base;
>         return 0;
>  


