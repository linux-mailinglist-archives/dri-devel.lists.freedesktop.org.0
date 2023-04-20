Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962176E9306
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE2810E0D0;
	Thu, 20 Apr 2023 11:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970D10E0B6;
 Thu, 20 Apr 2023 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681990750; x=1713526750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PvixyuloEo/QIsKLiyo3ekmfnXT7cLsJ5cIwKToUYsM=;
 b=aNRCo+M19kUFQJS8Vtqc9LWRxIqSJms4VtNZtSKcVBowEskw3dqAJxBV
 qG9DoCXuXjyydwxglIug2nn9bFsYuPo7QxcyGEMece6dt/q2tN0xMgg7/
 1XIQ2mzf9gDFi0TCru2CFrgYkcybKAchvaFaSaInKXq5rhPb7TWcLbvAV
 1U+DxLUabNZETrsdEWbIktwduaJ3kHW4QHnk7tSYkouXloZQ9pve+WAQk
 LnTMmDi8iDrN4SC0EFYS0evTa5jlcBtyhMUr2ajH61b/cyN0TnjgVwZf/
 uzru/IEUWv97NB4EmhMK9O6ReUQgfwOI/gYBuDdYWA927+rN/7nh/Dp8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348471582"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="348471582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691885518"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="691885518"
Received: from ashwinva-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.120])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:39:06 -0700
Date: Thu, 20 Apr 2023 13:39:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 8/8] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-9-fei.yang@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

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
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

because this is an API change, we need some more information
here.

First of all you need to CC the userspace guys that have been
working on top of your series and get their ack's.

I also believe that this series has also been tested on a
separate repository, would you link it in the commit message?

Thanks,
Andi
