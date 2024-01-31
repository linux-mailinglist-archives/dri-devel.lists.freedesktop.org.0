Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED7843DA4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 12:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6089A10EAE8;
	Wed, 31 Jan 2024 11:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031B310EE8B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706699037; x=1738235037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l97JaM/WxbJ3cuZRvKI3tEr4j0C+sm43YPiTF6kpOBQ=;
 b=LWCfUDrJwxLresBSRIAXce4TjnDiuRGPyliEjO+yZ/79aq0lp9oBv9cp
 VymN2fwp3MKLB+LuQuH6DhauGmQ3H5TSqSS9XtF7E4lJwKKfUWeEq5hWd
 oQcwAV9X6pXaGtbNzEdsY86kLIWpFHbQUM3XoXaIeYPZYEwTxKYfqm1SR
 9ATuGb1qYsCVNqOTypl986N1irPms5LFKg3q7p1u1tlZ/RxLYs/13oglG
 +11ef0wTcc2wwl9J47j8ndYUIM0Ncj4m1MyY/0e9nlN2ZAR9Amg/XPsm3
 ELpWWXOG47Wd1r754PlHA499xw9GMka8+BTBNM67sy6SvkGjsXIJmiJPI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2508382"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2508382"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822533447"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="822533447"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 31 Jan 2024 03:03:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 31 Jan 2024 13:03:50 +0200
Date: Wed, 31 Jan 2024 13:03:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.1 04/53] drm: Fix color LUT rounding
Message-ID: <ZbopFnfEwETj0mlx@intel.com>
References: <20240122150949.994249-1-sashal@kernel.org>
 <20240122150949.994249-4-sashal@kernel.org>
 <Za6ano6dg0Mau7OI@intel.com> <Zbl_gq9FhTICi4FS@sashalap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zbl_gq9FhTICi4FS@sashalap>
X-Patchwork-Hint: comment
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
Cc: tzimmermann@suse.de, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 06:00:18PM -0500, Sasha Levin wrote:
> On Mon, Jan 22, 2024 at 06:50:00PM +0200, Ville Syrjälä wrote:
> >On Mon, Jan 22, 2024 at 10:08:05AM -0500, Sasha Levin wrote:
> >> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>
> >> [ Upstream commit c6fbb6bca10838485b820e8a26c23996f77ce580 ]
> >
> >Why is this being backported?
> 
> Is this not a fix for an issue?

It is, for a very minor one that's not really going to hurt
anyone. But it doesn't exist in a vacuum so backprting it
alone can introduce other issues that people will actually
notice. If I wanted it backported I would have have
tagged it as such.

-- 
Ville Syrjälä
Intel
