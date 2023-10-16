Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E47CB642
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 00:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836410E180;
	Mon, 16 Oct 2023 22:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127DD10E180;
 Mon, 16 Oct 2023 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697494266; x=1729030266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uOSGYUIh2bCQLm9WrX2gbSaTh3qGkOYaDbBrkhXMx+E=;
 b=EsT1VTe+9GsZWYRbiU6wcAamRcTJW+jmyZBTPfpfpDs9VTSSxYW7mq+k
 /eoYpyZii0cq3+Ml/f+PSd7bzFoVfk8RkwWXIAqwqAyVZSo+ZJazkW0Ca
 eo2Gzv/UMwyDZ0YeHloTEoHYgyshWSA0PG5gz4NoE8ZBtTEwVwqrKLIa5
 H6/gn7PhOsxyiNxwNwHcGPCbkxVGM4MCleZl2AkMHDkLtLGUzRkIPXs76
 Xuc7Xgl/v304+X30yxigJ4/9324h2pir9Jkd0RYCIIxpxkSg2UC3bosPf
 NhomoR77+XH8X7L78DYz8jw5LCh8PvrG/dDO9ZbmrZo0Imofq2zXYsUWG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370723373"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="370723373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 15:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087243992"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="1087243992"
Received: from yckhoo-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.215.157.119])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 15:10:54 -0700
Date: Tue, 17 Oct 2023 00:10:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: avoid stringop-overflow warning
Message-ID: <ZS206TuYnhE3PozK@ashyti-mobl2.lan>
References: <20231016201012.1022812-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016201012.1022812-1-arnd@kernel.org>
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
 Badal Nilawar <badal.nilawar@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

>  static void rc6_res_reg_init(struct intel_rc6 *rc6)
>  {
> -	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));

This is a complex initialization, indeed... how about just

   memset(rc6->res_reg, 0, sizeof(rc6->res_reg));

> +	i915_reg_t res_reg[INTEL_RC6_RES_MAX] = {
> +		[0 ... INTEL_RC6_RES_MAX - 1] = INVALID_MMIO_REG,
> +	};

This is basically a

   i915_reg_t res_reg[INTEL_RC6_RES_MAX] = { };

Don't know which one is clearer.

Andi
