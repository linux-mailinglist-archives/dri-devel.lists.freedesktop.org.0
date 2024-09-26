Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE1987522
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 16:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D0F10EB65;
	Thu, 26 Sep 2024 14:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDe7qN1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422410EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359786; x=1758895786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CBIcxsevWfFlLWzH3KOiKgyEb9rHaYOTP4D6HOmKNtc=;
 b=mDe7qN1EIy/ZHyXF9hqgDvpx8t5o20CqkaOMMyG4n7mVaje3u8ZHCAG2
 lwmetgylqe/m21koim4eO9OXqrUrvdEGcUQz5zDVYKXnK/4doVaTqgMTu
 muVNZPxbzoEzO9jFiubwniJljF/JG++l4WG8qBoOmJQ4SDCmKLSS6tFXF
 vuvqhvRQ5RRFn8E+73G5yW+nBPPzCnUB7CoRvkrKo5tGwP9atpzbCJptv
 hA0qRpDmDBV8NETnlmvj5qxpBhJdcwk+fnsbMEjvudkrVUKdWB9rGutQY
 fFBK+IP68ehSEi8mlQua0lkucLpPj4eonrjv8f0LOtvYis8a1r0DJpWHD w==;
X-CSE-ConnectionGUID: L+Cg1zFtSkuTXIJYvUOKyg==
X-CSE-MsgGUID: U49elB2/RNWgzX7Jv0cg6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26269057"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26269057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:09:46 -0700
X-CSE-ConnectionGUID: gVHLDt0MTdGdLVQQIZ16Og==
X-CSE-MsgGUID: qOaAXtWKQseusR+WaeLwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72167464"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:09:45 -0700
Date: Thu, 26 Sep 2024 07:09:43 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Print bad EDID notices only once
Message-ID: <ZvVrJw7dUTbzZ1dX@tassilo>
References: <20240926133253.2623342-1-ak@linux.intel.com>
 <20240926-jumping-garrulous-tarsier-9dc7e8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-jumping-garrulous-tarsier-9dc7e8@houat>
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

On Thu, Sep 26, 2024 at 03:51:09PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Sep 26, 2024 at 06:32:53AM GMT, Andi Kleen wrote:
> > I have an old monitor that reports a zero EDID block, which results in a
> > warning message. This happens on every screen save cycle, and maybe in
> > some other situations, and over time the whole kernel log gets filled
> > with these redundant messages. Printing it only once should be
> > sufficient.
> > 
> > Mark all the bad EDID notices as _once.
> 
> Is it?
> 
> I mean, it probably is if you connect and reconnect the same display,
> but if it's two different then the second definitely has value.

If the first display had a good (or differently corrupted) EDID block the
second bad one would still be printed. The case where you don't see anything
is if you connect two different displays with the same kind of EDID corruption.

I'm not sure if that is actually actionable in any way. I certainly
have no idea what I would do with it.

But I think what you're suggesting is to include some identifier per
monitor, but I'm not aware of anything that would work here because
if the EDID block is bad there is nothing that is intelligible to
the user. Including the device like it was suggested earlier also
wouldn't help because it is tied to the connector, not the monitor.

In the end it's a trade off between a dubious benefit versus
a significant down side (flooding logs).

-Andi
