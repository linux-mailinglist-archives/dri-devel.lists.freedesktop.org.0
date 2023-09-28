Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A07B149A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 09:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288F910E5D9;
	Thu, 28 Sep 2023 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E633E10E067;
 Thu, 28 Sep 2023 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695885525; x=1727421525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ghpnYYlGAY+pjuSf9m3vCLN0dzZLkBf6ceGhA1Nk+uM=;
 b=W7qQoJ7Gx9iZc2UR/tRflKJvFqx91sLVf1Ri1+r1Exy7VIy1LDVNLsgP
 M4M9I/8R3nf70gtRUqfwA3OO0la0Gt/Mi9gwPj+kTyEU5eZGUtP0D/zYq
 QhIeHIXDpZm1Poj+BNcu4o66cS5dDMlxO09BYkvGjZFwJItsUjWg5aBKq
 zOm+50mLbqZgbIXtxiQL9aQJO2hNFZ11LcVjmgy043G4Hcy7geFFMI7Ac
 IV2hRTwW1xkI27ubSqMbcBqAlpK4x1idd5527nAXZiGpX/DLjwAlqsjFS
 sGm0qmezjHEyK8tHJVtuMrHNgzezIKl1kA666+HELmq7dVVcb0nSrJ9ZF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446146726"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="446146726"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839755569"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="839755569"
Received: from mnazleas-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.37.197])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:18:40 -0700
Date: Thu, 28 Sep 2023 09:18:34 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 1/4] drm/i915: Introduce intel_gt_mcr_lock_reset()
Message-ID: <ZRUoytWs/9DIUG+y@ashyti-mobl2.lan>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927210357.17461-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

your client is still missing my e-mails? :)

> +void intel_gt_mcr_lock_reset(struct intel_gt *gt)
> +{
> +	unsigned long __flags;
> +
> +	lockdep_assert_not_held(&gt->uncore->lock);
> +
> +	spin_lock_irqsave(&gt->mcr_lock, __flags);
> +
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
> +
> +	spin_unlock_irqrestore(&gt->mcr_lock, __flags);

I commented here that probably we don't need the locks. And I
asked you whether you had any reason for locking here.

Andi

> +}
