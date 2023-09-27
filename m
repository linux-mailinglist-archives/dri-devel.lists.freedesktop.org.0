Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA77B0333
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DCE10E4DE;
	Wed, 27 Sep 2023 11:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F110E4DB;
 Wed, 27 Sep 2023 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814660; x=1727350660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=50vlclPlNTmq9RpTDMplXX9hrrGAhb+Y0NdiBwYeYsg=;
 b=AgQGR6yw1AGBHux3T7CKzlhcoOumt2+gKUyW/ZgQElITQm3G7+Sjy1FM
 RwByN1AaZcT6BG2+WnGfLEQo7InlqzuDH9TT02yhlsc84xyVyPI2gOqZ6
 Dqzxk+J2CIzln6r3yKTplhaf//JAh69DJI6aUAxR/HpbMe5jSZncLIf3f
 OqjdLkA3pmg5JZj/U77rDgUSxfp4UOv/96WOlY+qpbumj0IbhIF9P2hQ1
 kzmbnLeV3vZ8Ufnps+c7EjoOyjnNsRlkNuEANuiLsgy3ysx8Tk0yILyAE
 aFORynaT8bv7stNdyHIzjYtKUMcFbwVC72/Oc33ipVxQWK1yYmwp+ZGI5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361188642"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361188642"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080117146"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080117146"
Received: from xueqilim-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:37:35 -0700
Date: Wed, 27 Sep 2023 13:37:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Introduce intel_gt_mcr_lock_reset()
Message-ID: <ZRQT+OcS5v2yB5jx@ashyti-mobl2.lan>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927102237.30773-1-nirmoy.das@intel.com>
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

[...]

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

As we discussed offline, I don't think spinlocks are needed here.
I don't expect the gt to be holding the lock somewhere else.

Andi

> +}
