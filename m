Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D78818A6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9A910EC1E;
	Wed, 20 Mar 2024 20:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UreEp/fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0205A10F62B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710966751; x=1742502751;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I5Y39iE3LeKBqFbvJmR/QKXpE0W5iZdRKP3x2On8OL0=;
 b=UreEp/fwcXQIDNYcAwAtkN8EovTGsHa0F4zf1elLxpeoDEIeLT+Mfzps
 GsRLhAT4NLUJt9iJLVhFaTPxRsFYTDJ3yQQUAKqRivgJeoG9kF0zO7JB0
 kPVFofGWGy/7ZNXrWtG43KTHJryVIz48kkMVy01n0jOhqvENGfgPRySlB
 BzKbQJs4KLA9iP/We8798S20anjuhtlboNVuGVIshq/cE3MsXcf1JpnMB
 t81b+cuT9hMvZEPsfIfrkatD2+Tf89tVoGZEZC+mkwEwtYAAPKrO8pSJY
 CsJ7iH0lVYh7ttOZJoghQIydKGI8kbOyJm/zSsHesShUi1I31xedQwWY+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5791644"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5791644"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914678181"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="914678181"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:32:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1rn2bo-0000000EgIt-3dvc; Wed, 20 Mar 2024 22:32:24 +0200
Date: Wed, 20 Mar 2024 22:32:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 5/5] drm-bridge: display-connector: Switch to use fwnode
 API
Message-ID: <ZftH2ArlSkt4kX7M@smile.fi.intel.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-6-sui.jingfeng@linux.dev>
 <20240123012026.GC22880@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123012026.GC22880@pendragon.ideasonboard.com>
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

On Tue, Jan 23, 2024 at 03:20:26AM +0200, Laurent Pinchart wrote:
> On Tue, Jan 23, 2024 at 12:32:20AM +0800, Sui Jingfeng wrote:

...

> >  	conn->bridge.of_node = pdev->dev.of_node;
> > +	conn->bridge.fwnode = pdev->dev.fwnode;
> 
> This goes in the right direction. Let's address the other drivers and
> drop the OF-based calls in the same series :-)

+1. BUT, please use device_set_node() instead of both lines.

-- 
With Best Regards,
Andy Shevchenko


