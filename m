Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978836E79AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D010E1C7;
	Wed, 19 Apr 2023 12:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637B110E1C7;
 Wed, 19 Apr 2023 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681907047; x=1713443047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=68FQBcrAKVBu4dakYw+vyoZ8N53cKbrCyamzbg/NJv0=;
 b=c+5pPGgXsP5mS2abQd75smxw03aHpppZlJTl6DhVV7/iRAu2fnZnmalb
 EAPl/GbcR3n8bPTDo+Ko7gIduLUfPjQWy/9Bpx+iDDnW7fx8ap4/igOvH
 X3t/hNG+7wHI0ZNLBxJLoKIxtdGH3n309+GFxI1B0CV50xlOypGjzm5xQ
 7fu4SOL6xK+/9oc4YC/f6sn4pq0T8Kh/pHXI/RU7xepYY8lXM+JZz3xF3
 FD6gVMBwyuaymF0Ly0UY7gNLMD/OqgVRZBpPI63IDZzA/NYX/cjpMdNXC
 uOlD5NxIabxgk5OcdM190HXa4rq2Kf1tVpwQKC7CTRJbN+CKMNu8kjbZP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348185851"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348185851"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="835285166"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="835285166"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:24:03 -0700
Date: Wed, 19 Apr 2023 14:23:59 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 8/8] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZD/dX1Xsb9D3zLqK@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-9-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-9-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 11:25:03PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out its life cycle, {set, get}_caching ioctl's

/its/their/

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
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
