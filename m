Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56463910979
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCDD10E12F;
	Thu, 20 Jun 2024 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWHR6w4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855AE10EA57;
 Thu, 20 Jun 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718896486; x=1750432486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dvP4jTc5sV94L41isogzRFiMcodHKb1E7/7b8WnQfyc=;
 b=JWHR6w4S68SwVRkddc7hp7hya26CZNL4KN9QPai0QUqDEZkjAlC3ETeL
 MtBLo7cxm+i0Zj4uoO4GeS6/ShyojL/FSA1XOkG4f+WfnRIckZlYfircU
 y2vTkLVCKbkR9xDjZ9o91XHepuJy5msqN0tV5J4TUVo9Q7+/QoLJHNKxw
 TbCu5zQ6mCZzZppWRcT6hlcDyv2jAuptOfo0VQ1m2xgNdKCwY8fY6KWiN
 26vq5TIolJLfl8PzILH+M8FDIriltBKdR8pwhGE/73G7Ra5cGNaVxp0H+
 Uj4mQNiQjYwcfPd8myY9N7BphXbO7ROJFmO3KkdZiV4nM7711KK03TXLZ Q==;
X-CSE-ConnectionGUID: 13UQyCPzQrOuTxKfFHHceg==
X-CSE-MsgGUID: zsCxhFWrTkaZ+rkzO+dKWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19658133"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19658133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 08:14:46 -0700
X-CSE-ConnectionGUID: +Vj8QanaQoyC3elqhAdWcw==
X-CSE-MsgGUID: 66OmtHx4TsyVY1wv47+xPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42361474"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.101])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 08:14:43 -0700
Date: Thu, 20 Jun 2024 17:14:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Return SIGBUS for wrong mapping parameters
Message-ID: <ZnRHYXqIuYhPjiEf@ashyti-mobl2.lan>
References: <20240617124115.260250-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617124115.260250-1-andi.shyti@linux.intel.com>
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

Hi,

> index a2195e28b625..698ff42b004a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -223,6 +223,7 @@ static vm_fault_t i915_error_to_vmf_fault(int err)
>  	default:
>  		WARN_ONCE(err, "unhandled error in %s: %i\n", __func__, err);
>  		fallthrough;
> +	case -EINVAL: /* the memory parameters provided are wrong */

no point for this... it was offline nacked :-)

Thanks,
Andi

>  	case -EIO: /* shmemfs failure from swap device */
>  	case -EFAULT: /* purged object */
>  	case -ENODEV: /* bad object, how did you get here! */
> -- 
> 2.45.1
