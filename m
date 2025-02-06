Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636AA2A722
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9CC10E2F2;
	Thu,  6 Feb 2025 11:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/fqmDrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6D10E837;
 Thu,  6 Feb 2025 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738840591; x=1770376591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zs0+BwxLlK6ivUzSt1CK3pZxZ6vu1Uq4LmDa+8MwPrs=;
 b=m/fqmDrrN2d5AKfuCCquPSK5JuI8kKGp+ulbmQD5dd46/HUmW+2ebBpc
 VheeXx2leAjRhI3xZQG3E3jGnjeaQL6wN+CjipYSkhzHljJqdhGnYciRB
 0E5Pkl+pYLI95Oy9Uyy6mLgxMhF7pk4yzWus9Sqxx1FaHuRPQJsq+2/Yc
 KxfQTlT1YLHCszoWKJwo0+9xVIpMGf2/AuV9ysBVUwvZW4024B7Dw9uzY
 NaNAkuOHKvLYnzyByagBQjCMgshmEK8erUdJuXU37NGQqXCQVleQ/+QSO
 CtB8EDTgJYJOsVDcYQu/WRIdg/g4ESj/HLoGfbGodBTPzQeCfTK21Ck0Z w==;
X-CSE-ConnectionGUID: yReLE4XNSr6DFItIA/HOIQ==
X-CSE-MsgGUID: wbfFojA7S4SaYalgXs8Bmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27039883"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="27039883"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:16:31 -0800
X-CSE-ConnectionGUID: ys+oaFQtTTOPXHbXt6DIJw==
X-CSE-MsgGUID: v/Q8hn8WRWapAGS1Wo2XZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111104631"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:16:25 -0800
Date: Thu, 6 Feb 2025 12:16:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Josef Bacik <josef@toxicpanda.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <Z6SaBeZ_DmdDstka@ashyti-mobl2.lan>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
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

> The filemap_lock_folio() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

...

>  		struct folio *folio;
>  
>  		folio = filemap_lock_folio(mapping, i);
> -		if (!folio)
> +		if (IS_ERR(folio))

ops! Thanks, Dan

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
