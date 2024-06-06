Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8B8FE8C9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 16:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97B10E0F2;
	Thu,  6 Jun 2024 14:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XusJ0kNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCE510E0F2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717683043; x=1749219043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MUI6PIsAE4F5Czr38Qw9LN4nLxY0Y714ALhc4YdR7Ig=;
 b=XusJ0kNwpwS8Rs2Wc9rP4fQ2f5ju4pjrJKbYqNKkIGEpleo2ujmMUKT7
 nmjhZcqvccFPB6E39OK9v4DVhZAEa619cHz4T5iZd2HoXthYlGPeiTNT/
 3n62jr6/WjEAEZBIYWsmpCC9SQJiyi/R4Js0X5XPVfgDQXjsbtAB1vzbF
 mvJOfYrlucJxjwCqtA6TXOX/i1Jqb6E1pVb0v7rcDdSzFN5LMVahv5O75
 a1ZacTM2yaGUZOWZkmfh98taArlc7qEAeQ0lVQm6hhSHwUvklyY1sRH13
 XdVLJ8UACdte5D9+9mNXajuLUt6L6D7PNVq/7yWZeFz4D6L7E2gddP9lg g==;
X-CSE-ConnectionGUID: KE3/GuMwR6WR/zC697kvMw==
X-CSE-MsgGUID: ypSabs1gTTWEXqyv1TQKGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18144819"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18144819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 07:10:43 -0700
X-CSE-ConnectionGUID: 3UNBXoQ1QG+szVQWA/DKGA==
X-CSE-MsgGUID: 8x0BivwhSzSELBrM4WHGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42444804"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 07:10:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sFDp4-0000000ECQy-0sFQ; Thu, 06 Jun 2024 17:10:34 +0300
Date: Thu, 6 Jun 2024 17:10:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Subject: Re: [PATCH v12 12/13] media: imagination: Round to closest multiple
 for cropping region
Message-ID: <ZmHDWeuezCEgj20m@smile.fi.intel.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
 <20240604105335.2257629-1-devarsht@ti.com>
 <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
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

On Thu, Jun 06, 2024 at 01:44:59PM +0200, Sebastian Fricke wrote:
> Hey,
> 
> On 04.06.2024 16:23, Devarsh Thakkar wrote:
> > If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
> > (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
> > multiple of requested value while updating the crop rectangle coordinates.
> > 
> > Use the rounding macro which gives preference to rounding down in case two
> > nearest values (high and low) are possible to raise the probability of
> > cropping rectangle falling inside the bound region.
> > 
> > This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
> > description as documented in v4l uapi [1] which specifies that driver
> > should choose crop rectangle as close as possible if no flags are passed by
> > user-space, as quoted below :
> > 
> > "``0`` - The driver can adjust the rectangle size freely and shall choose a
> > crop/compose rectangle as close as possible to the requested
> > one."
> > 
> > Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> 
> Acked-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Can, whoever picks up the math changes, pick up this change as well?
> I will send 1-6 via the media subsystem.

math.h is orphaned, meaning any Tier-1 maintainer may push this through.
So, there is nobody behind it.

-- 
With Best Regards,
Andy Shevchenko


