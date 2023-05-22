Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF170BC5F
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E3710E2EE;
	Mon, 22 May 2023 11:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76310E2EE;
 Mon, 22 May 2023 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684756386; x=1716292386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oTf5XH1B8oC44XkDt4O4LgpWr15oxRXo9w+IuEWSHTU=;
 b=ZIPRXmEogfvqnJI4R7PWJsOo1zSAjGJSIHApWYWKsugsC3YPTKRgBG/s
 VU5JZ3nBAVCTg6LAaBd8317S6Oz2JZ3ldpIis4maqu9JJ6w11rh8LW90U
 THWvSuvQ2O9oPU0t5VTOoJvOZybexVYIXyhvBjwVJJAqfr7O9rfO2XUFQ
 r3qMTEruN3RYsBcZGkLxmoXyNPiLGUIA1775ff3xPxVJfJO+auaQGNwa9
 7vi0ekeuMxYHflwsICzWsdlDQxWQjrEsKRFpjv4ZwKt8jIFznNaDqH98Y
 4m/UZhLcxux6VY0AKdQzpepmGzs0UETIrqSBfnZeND9O4Rre9RqEKR/vb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351748408"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351748408"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="793260908"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="793260908"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:52:59 -0700
Date: Mon, 22 May 2023 13:52:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH v10 2/2] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZGtXmBh42oLIxcyi@ashyti-mobl2.lan>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <20230519051103.3404990-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519051103.3404990-3-fei.yang@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, rohan.garg@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 18, 2023 at 10:11:03PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> Test igt@gem_create@create_ext_set_pat posted at
> https://patchwork.freedesktop.org/series/117695/
> 
> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>

last call for comments and reviews on this patch. If nothing
comes I am going to push it tomorrow morning (Europe).

There is also a merge request from Mesa pending on this so that I
don't want to keep it hanging any longer.

Thanks,
Andi
