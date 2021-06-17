Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB23AB06A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 11:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF406E8D5;
	Thu, 17 Jun 2021 09:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A826E8D2;
 Thu, 17 Jun 2021 09:55:14 +0000 (UTC)
IronPort-SDR: cKlFkL0ggHmXe01Bpl/Izejc22dXp4kgqssDiX1N8yUpkxagJ3hZXzJpzr3eTRTm52IE3taJ4h
 ELjJxRh6Ya4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="206158115"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="206158115"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 02:54:55 -0700
IronPort-SDR: 1+4wM5q0fSkC9Ahwg7Q7Vd5xHQCO3NJ9P14blvcmCMyQVBeUk8AIBqu47KoXmkHW1Y1CnLaqyM
 V8nIXnBoSrBw==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="554351645"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 02:54:53 -0700
Date: Thu, 17 Jun 2021 15:26:20 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Perform execbuffer object locking as a
 separate step
Message-ID: <20210617095620.GA15664@intel.com>
References: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-15 at 13:36:00 +0200, Thomas Hellström wrote:
> To help avoid evicting already resident buffers from the batch we're
> processing, perform locking as a separate step.
> 
Looks reasonable to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 201fed19d120..394eb40c95b5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -922,21 +922,38 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  	return err;
>  }
>  
> -static int eb_validate_vmas(struct i915_execbuffer *eb)
> +static int eb_lock_vmas(struct i915_execbuffer *eb)
>  {
>  	unsigned int i;
>  	int err;
>  
> -	INIT_LIST_HEAD(&eb->unbound);
> -
>  	for (i = 0; i < eb->buffer_count; i++) {
> -		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
>  		struct eb_vma *ev = &eb->vma[i];
>  		struct i915_vma *vma = ev->vma;
>  
>  		err = i915_gem_object_lock(vma->obj, &eb->ww);
>  		if (err)
>  			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int eb_validate_vmas(struct i915_execbuffer *eb)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	INIT_LIST_HEAD(&eb->unbound);
> +
> +	err = eb_lock_vmas(eb);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < eb->buffer_count; i++) {
> +		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
> +		struct eb_vma *ev = &eb->vma[i];
> +		struct i915_vma *vma = ev->vma;
>  
>  		err = eb_pin_vma(eb, entry, ev);
>  		if (err == -EDEADLK)
> -- 
> 2.31.1
> 
