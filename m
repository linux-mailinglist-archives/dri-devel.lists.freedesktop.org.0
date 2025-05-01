Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F88AA5E55
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4510E816;
	Thu,  1 May 2025 12:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+Vxwh9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD70C10E816
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 12:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746102163; x=1777638163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iZADHagPzlbOXuR7Zz7ck4NkeUdS+gmooYnVB60pVpk=;
 b=n+Vxwh9nm0vvJBmXgNL76/MjkKL0D6t5lSIqaSDaFVHhq+EzwQzASw2J
 p0nZ0MS3Wbsag//fczNm8PPIyOp6IExj1NYN3PXFaIsuJ+m7uxf6UH8mo
 qSSahipOe1aZ8+WsnGQnwFbGRAz9oSXZ6CO0ucabLt+FfhO8fRjBaehtV
 Frzix9c9WUdP6eSomYEo/ts0i7f4exev749QJumL++4NY2hkq3Idf6uuw
 mMiHtwLJFHmWmGEEqfzJdhYPs5v4RwBp5qmMUEt7RVVeZki4Pk3ehYb1r
 n/4lkURqu8PrMyMSeGjhDNSvFKYOmYbjTzWhr+UElU2kUoiVSsTTt9esW Q==;
X-CSE-ConnectionGUID: uu9A2CvVQr6TdJ3SBkQwyw==
X-CSE-MsgGUID: Y+jZrE6nRXSZsUjcsH9ekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51593459"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="51593459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 05:22:32 -0700
X-CSE-ConnectionGUID: eaTPhNftRoyIC0JLOldXZg==
X-CSE-MsgGUID: ubKq23+6SiStcolwEQQAAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134891495"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 05:22:29 -0700
Date: Thu, 1 May 2025 15:22:25 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, andrealmeid@igalia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string array
Message-ID: <aBNngS4XZR4ZtdAL@black.fi.intel.com>
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
 <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
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

On Wed, Apr 09, 2025 at 09:24:41AM +0300, Raag Jadav wrote:
> On Wed, Apr 09, 2025 at 09:46:33AM +0800, jiangfeng@kylinos.cn wrote:
> > From: Feng Jiang <jiangfeng@kylinos.cn>
> > 
> > When calling scnprintf() to append recovery method to event_string,
> > the second argument should be `sizeof(event_string) - len`, otherwise
> > there is a potential overflow problem.
> > 
> > Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> > Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> 
> Thanks for the fix.

This one seems got lost in the noise but important for 6.15.
Any takers?

Raag
