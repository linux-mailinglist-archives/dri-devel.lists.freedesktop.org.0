Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7F6C370F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 17:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4327C10E7EF;
	Tue, 21 Mar 2023 16:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C554B10E26B;
 Tue, 21 Mar 2023 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679416718; x=1710952718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wnmv9VkG5Xwa1hZGVPIaSIYEkK2sSR9fPa0uDXjlpNU=;
 b=Xk2sLLfruqVNJQ1bPczQ5Oc7jbbyfS19tRW6uAGfph9u3feQSBK6ywa5
 vJ6GOKzQp52NedWPKQ+duFw0cKvpaWYo8/ZrfbUY394UJjBfaJ/+r1iuc
 /L1W4RT1/haZ0RUwC0VphouKM//ZKKJqyuKJx39x26WM1O9SDw02Xonxc
 CLKv1VioP2T7EUMOk2rOjwo9CUctTf1Ti5hRjdzXG05oFZ3QpRZ9332td
 v1qfRAZjOByOjdxtuC03DrL1m7L+ltLyTppCqn9Q0YcG3T9zUx1nq8/AK
 C1JnffGUtzeFl6Bldk9fnLtt1BCllNSuzMziPTSfHLlGwCE6FhRzH37Md Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366729126"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="366729126"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770721949"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="770721949"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:38:36 -0700
Date: Tue, 21 Mar 2023 17:38:13 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Sanitycheck MMIO access early
 in driver load
Message-ID: <ZBnddVWywj4pc9ZI@ashyti-mobl2.lan>
References: <20230320202326.296498-1-andi.shyti@linux.intel.com>
 <20230320202326.296498-2-andi.shyti@linux.intel.com>
 <877cva8hdj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cva8hdj.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Thanks for looking into this,

[...]

> > +#define COND (__raw_uncore_read32(uncore, FORCEWAKE_MT) != ~0)
> > +	if (wait_for(COND, 2000) == -ETIMEDOUT) {
> 
> I guess this somewhat reimplements intel_wait_for_register_fw()?

Thanks!

Andi

> > +		drm_err(&i915->drm, "Device is non-operational; MMIO access returns 0xFFFFFFFF!\n");
> > +		return -EIO;
> > +	}
