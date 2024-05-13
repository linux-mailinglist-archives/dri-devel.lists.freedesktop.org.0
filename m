Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D319B8C3D96
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5A10E525;
	Mon, 13 May 2024 08:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/BR6QbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76D010E525
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715590517; x=1747126517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2tR9myfW2d54OREPmUhOr4rW07utSQL3N1aBXRIRzk0=;
 b=H/BR6QbThmJR0K6OEhEDTMryIY9qLajIZ7FOyDPVPNj1K8e/6NdjC9XH
 q0o1iXHBMmmK4uK+owxPlS/ckBzyM8ezKHb5yzjBfnvqq5xyss4gJfyPT
 jK3y1pO+zNdTmk8eFby5eUbAXKPiJv/6VZYEBgtSo7jdYBTpr3KMP/cIT
 Kcy0ExqIuvSK/t9dIFbwFogMDjwuOR8T9sNJ6KWVmO9+wkLPClBSdH+8x
 zWwUa+aXK8CeUEJBbJxF/dl9IxMc6pxAC1KB7fOhB6fObWOuXtDugigbw
 dpmH0KwE7HEnef8u2MftNi/kCiHeU5OA9PsSXwUKMhSZRWFZr0C+UwsrJ A==;
X-CSE-ConnectionGUID: wzFZTgqeRwqdA/HWdfSxcA==
X-CSE-MsgGUID: 6tdeZ4DuQCWWdfbMGIfw1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="14460800"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="14460800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:55:17 -0700
X-CSE-ConnectionGUID: NunY6tscTCumNMyQ3sglAQ==
X-CSE-MsgGUID: pxpNORKhTKGIoaGUafGRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34828950"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:55:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s6RSc-000000073mk-3Kwu; Mon, 13 May 2024 11:55:06 +0300
Date: Mon, 13 May 2024 11:55:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, jani.nikula@intel.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <ZkHVaiLn4mH4fAaK@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
 <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
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

On Sun, May 12, 2024 at 07:46:58AM +0300, Alexey Dobriyan wrote:
> I think
> 
> 	roundup(x, 1 << n)

Since it's about power-of-two, round_up() is better.

> is more readable.

-- 
With Best Regards,
Andy Shevchenko


