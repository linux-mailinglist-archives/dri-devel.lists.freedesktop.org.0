Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3C7CDAFA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 13:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7FE10E0DE;
	Wed, 18 Oct 2023 11:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBAE10E0DE;
 Wed, 18 Oct 2023 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697629840; x=1729165840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c0T0784LHoIAqHXgdsl2Rw+iriwcWCmFOJzkyPyWkAM=;
 b=WsdRusr4ZbABCeztYXaKTU34BrmiCWQxYPar8Uzee0j/gUqHQS0BS6c+
 N5TYxPCwTTX0a4f0LpH1u+bjAiIC83xmEVEPQmgn8jf8J1Iz7CGW8XP0p
 049TcQPfTY4zk3uqCcvWIe5gIilXyjnHdWVO0hvVHiTxntq3e5lMHB3gG
 AkWtRFYUQuFQja7ZIJ7Ciph11jvNg9M5mstKYFQZqDlvkXTn/Fg/nd4xP
 mgAqHeoTcK6Fk85l+mPHQOj6RnWO1hsJht5NzMaAVH7IDUNEIhDkKxxr+
 tWSzNC7hohw7YHyJgxJPcdFGe09tXofCZ1ojS3ni/MHRBlGrfI15trCiy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="417111311"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="417111311"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756566650"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="756566650"
Received: from nurfahan-mobl3.gar.corp.intel.com (HELO intel.com)
 ([10.213.159.217])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:50:08 -0700
Date: Wed, 18 Oct 2023 13:49:59 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v3] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
References: <20231018093815.1349-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018093815.1349-1-nirmoy.das@intel.com>
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
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Oct 18, 2023 at 11:38:15AM +0200, Nirmoy Das wrote:
> gen8_ggtt_invalidate() is only needed for limited set of platforms
> where GGTT is mapped as WC. This was added as way to fix WC based GGTT in
> commit 0f9b91c754b7 ("drm/i915: flush system agent TLBs on SNB") and
> there are no reference in HW docs that forces us to use this on non-WC
> backed GGTT.
> 
> This can also cause unwanted side-effects on XE_HP platforms where
> GFX_FLSH_CNTL_GEN6 is not valid anymore.
> 
> v2: Add a func to detect wc ggtt detection (Ville)
> v3: Improve commit log and add reference commit (Daniel)
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")

I'm wondering if this is the right Fixes, though. Should this
rather be:

Fixes: 6266992cf105 ("drm/i915/gt: remove GRAPHICS_VER == 10")

?

Andi
