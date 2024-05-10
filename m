Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E48C2770
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BB610ED44;
	Fri, 10 May 2024 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpprehXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ED010ED44
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353848; x=1746889848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1j7eg+9n1ylc7PMU1qKoy953XxcAw3FLb1qDay6E/FI=;
 b=BpprehXUhdtp8LWG3bdIzCRxhOUpbTOTYLmJivb1nK14IVm1o33jOWrk
 fU26FbyZEv+HRhvADwQxjoGDyNW82R4CME2mlRUvw44Z44G9cS0fqPqvZ
 MytA1HjaODFN121a4kcRjTrBkp1p/Ux52mcd8BEoW1Z8LLfaTvncej33+
 4ysy8ozR2SnKKfKFWuTVb8utj3dJOC9k3GTAeqiyYizq0bUEzhyCqvPa7
 0sabDT4M5NQ3YMj738qfcKleWe3RuXUoQfi1aXd4qcPOpxKJR5nmrkrN3
 GGYR7j2LzgkCUmJbjyWIdMPX7uPKtZrxGNIjruDBlKuD5MwEE/CURp12W g==;
X-CSE-ConnectionGUID: qs+CCeHhQOOc87bSJwTYug==
X-CSE-MsgGUID: /hk6DxUbQeq5WNUG9y8eCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11468757"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11468757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:10:46 -0700
X-CSE-ConnectionGUID: NAF67pl8Qe+TSKl8VaEpXQ==
X-CSE-MsgGUID: SGb+tI1vQvi8k665RFaHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29592182"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:10:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5RtN-000000068i4-1K3v; Fri, 10 May 2024 18:10:37 +0300
Date: Fri, 10 May 2024 18:10:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple for
 cropping region
Message-ID: <Zj447ePSnccbj76v@smile.fi.intel.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509184001.4064820-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
> multiple of requested value while updating the crop rectangle coordinates.
> 
> Use the rounding macro which gives preference to rounding down in case two
> nearest values (high and low) are possible to raise the probability of
> cropping rectangle falling inside the bound region.

This is arguable. How do we know that the bigger range is supported?
The safest side is to go smaller than bigger.

-- 
With Best Regards,
Andy Shevchenko


