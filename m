Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058584E920
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 20:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA410EBDB;
	Thu,  8 Feb 2024 19:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INj0GR5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE710EB88;
 Thu,  8 Feb 2024 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707421746; x=1738957746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H1wnzpQqk2/6BK+Tq9CYC38MWNkImYKdMoqD2FjiBVg=;
 b=INj0GR5b8odUE+HsNzPFUD1Zky3y77C6xSx7aB20EZVx/7JuKu87dAVW
 15YVjoHjjiqNk4c/kNLxTBbno7cotdR3+sI7XTuAKl/zBN80dxYnG2o3K
 Cy803IvQ2FK6Z1Z5LiqNpaDJXYTbI7wRmsSytL4ccfZxF2Ly6Ziz654m+
 VJbbx50EnfWP9KhjJF2P7vCYBv13zX8HQvV/VcfxaJl8lES106RP3VO1V
 QF0UP4p4dmmIQb57orHgCuC7n1OoiVr/+648VNkaxK9qa1S1JmLD1xXj4
 vdP14n3Eg4syPbsnPTILeoXvdp/WvlMRZS+u5SnlQ/KTQdp25xtQgDMBf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395720815"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="395720815"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 11:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="24976779"
Received: from udig-mobl1.ger.corp.intel.com (HELO intel.com) ([10.246.32.229])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 11:49:01 -0800
Date: Thu, 8 Feb 2024 20:48:59 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZcUwK9DAVMVzq1Mk@ashyti-mobl2.lan>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208074521.577076-2-lucas.demarchi@intel.com>
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

Hi Lucas and Yury,

On Wed, Feb 07, 2024 at 11:45:19PM -0800, Lucas De Marchi wrote:
> From: Yury Norov <yury.norov@gmail.com>
> 
> Generalize __GENMASK() to support different types, and implement
> fixed-types versions of GENMASK() based on it. The fixed-type version
> allows more strict checks to the min/max values accepted, which is
> useful for defining registers like implemented by i915 and xe drivers
> with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to
> fail the build if a number outside of the range allowed is passed.
> Example:
> 
> 	#define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
> 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> 	      |                               ^~
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Lucas' SoB should be at the bottom here. In any case, nice patch:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
