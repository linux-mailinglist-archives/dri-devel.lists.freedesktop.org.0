Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFE95D9BB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 01:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180A10E14E;
	Fri, 23 Aug 2024 23:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIcb2ZW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B843F10E14E;
 Fri, 23 Aug 2024 23:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724455939; x=1755991939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QE6tOL6lECwZKber38VSosgwzqzqRhMJZ2xKrVtB2VA=;
 b=jIcb2ZW2f99fDiWiaQn7faJZSd4wlmOnnyEMt4ww1ZhG1QqLReSjj/c/
 DbeZhPUCAoQltpmg7tcx2erE8zTayC5p/TnNjOgCmITQjHAZxRb1NgV8R
 Ffs7iUzgTK2L2JrB6FqniK97UFUS+GBsDXNAgvAmdJ3yTiAcd0G+j1jUN
 PvF6nPo9+G3o+Ckwb+2KtLVn2imXoHb3v3HJCDxvC5K802lM4Lt5LgBdk
 TxS8NB4AGw9XvIiXnWJoaWs2uje1ZaoIicOYEwSmE7ZjgpFU8j/sZB25O
 yb9f0w/ea0uaNSWVl5tYs4ylRIw3duccsdO+2k5OGmODmXkQ/WehEv63G Q==;
X-CSE-ConnectionGUID: qCrGEO4PSuGjXwhDTrtnzQ==
X-CSE-MsgGUID: 3es46JCHSxS0Hz/MIwrweg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22921166"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="22921166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:32:19 -0700
X-CSE-ConnectionGUID: zAqVGhdPRYqF1K9RMoqgUg==
X-CSE-MsgGUID: BjivJ/TpRm6wJxYFjpQODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="66867863"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:32:14 -0700
Date: Sat, 24 Aug 2024 01:32:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v3] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Message-ID: <Zskb-gt8gmridvM9@ashyti-mobl2.lan>
References: <20240821024145.3775302-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821024145.3775302-1-yujiaoliang@vivo.com>
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

Hi Yu,

On Wed, Aug 21, 2024 at 10:41:27AM +0800, Yu Jiaoliang wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> v2:
> - Change subject
> - Leave one blank line between the commit log and the tag section
> - Fix code alignment issue
> 
> v3:
> - Fix code alignment
> - Apply the patch on a clean drm-tip
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

merged to drm-intel-gt-next.

Thanks,
Andi
