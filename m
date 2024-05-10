Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE18C2746
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BCB10E55F;
	Fri, 10 May 2024 15:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHQffnzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8A010E55F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353444; x=1746889444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DfIwLOulQLcLembSLllTkooRPlHt5xY4HjiqBcwUzpw=;
 b=WHQffnzFzpDRRgk8AJLgcCgfRIr2pXQ1GuwkCDuI3vX2FAWpPzx+z3PR
 Nm/hp96kMgmq9Gjyzb6Ti0wyvTafru9H6+rpgq/4UQ6FxRgRIKS5Hw0Y1
 ihiZ2GI+2oD5l8IdxGwDSslapIDZ7EqQbZ/kqROO/fOWRQLHiAKXNSrYn
 qN6yAbT4Xe/i8yP3h/1Jo9Zy/FAb+/wUXtEXoIah1V1t3BCuRRCcObtEG
 pjifHQJCUcwpulsU0vygI4huPzjPecF3V3UCp5dG/JiCvPZYHS2d563tv
 0QTr6Hn4QxwR5gwEds+0hj+kRbG4hjpJ5WiyZr6MXlkgnkB5p7hzsyfky w==;
X-CSE-ConnectionGUID: 5oJzmvaZQ/WSN82rU4RMZg==
X-CSE-MsgGUID: HKPRZ1V9QRu8kbVKDAuRHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11200619"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11200619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:04:03 -0700
X-CSE-ConnectionGUID: GHZdCY6/TtajG/italIwTA==
X-CSE-MsgGUID: 7K0z7nQkRdS4ezJTcxrYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29489293"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:03:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5Rmq-000000068aS-1p1l; Fri, 10 May 2024 18:03:52 +0300
Date: Fri, 10 May 2024 18:03:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
Message-ID: <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509184010.4065359-1-devarsht@ti.com>
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

On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
> Use generic macro round_closest_up for rounding to nearest multiple instead

round_closest_up()

We refer to the functions as func().

> of using local function.

...

> @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
>  		 * The closest input sample position that we could actually
>  		 * start the input tile at, 19.13 fixed point.
>  		 */
> -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
> +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
>  		/* Convert 19.13 fixed point to integer */
>  		in_pos_rounded = in_pos_aligned / 8192U;

Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
families of macros. What the semantic of 8192 is?

-- 
With Best Regards,
Andy Shevchenko


