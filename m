Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CD6D6902
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2815910E715;
	Tue,  4 Apr 2023 16:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A55E10E70F;
 Tue,  4 Apr 2023 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680626202; x=1712162202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9RHZYBOwNCmxW0n+VSk5Tp91iJJEX/1/7wfuZN6b2MQ=;
 b=WIRMFTqXzQnSfdGMdQRPd8h9sj8BHT8t52d5MDTZ1IyFMz568F9nQd1+
 pyp34Gph+xVJ/woPGS8vjorY/WhAa7SOrB7ni5TJTi0wmHGy++NG5VXJD
 ddwEyQhSmUt5bPgEJ7LBgjvBu95L5HsrQUxa7UemsxsloF4zujwxvuvLY
 XTLeCABT4G1Zbs95+QWRLRm82Du9WZTrtOs/wOj7ooVKGtFJopRWGd0+c
 P6ILC06bXr0Thr/0XXONmNJDMIfnBaWrCfSka8bs+SjBENn25xcHLpAIT
 UJ/N1vqb57PFIjR5YsA3olnbSM0Y+WjYc2815nrDorTQp9stKSFc5iIaX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370056573"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370056573"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686425869"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686425869"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:36:36 -0700
Date: Tue, 4 Apr 2023 18:36:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/5] drm/i915/display: Set I915_BO_ALLOC_USER for fb
Message-ID: <ZCxR+dpGxIk2rw7u@ashyti-mobl2.lan>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <20230404143100.10452-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404143100.10452-2-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Apr 04, 2023 at 04:30:57PM +0200, Nirmoy Das wrote:
> Framebuffer is exposed to userspace so make sure we set
> proper flags for it. Set I915_BO_PREALLOC for prealloced
> fb so that ttm won't clear existing data.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
