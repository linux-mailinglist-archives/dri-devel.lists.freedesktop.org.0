Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89C8818A9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E510EA89;
	Wed, 20 Mar 2024 20:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7k4dr9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1410EA89
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710966861; x=1742502861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N+rUS2s44+0WKHa8pBBiEgErSjUurHrIcJg593v1E5o=;
 b=D7k4dr9GGKjCHu9VqZZ+3faiYL2XT6jXOJANcjbsgRUIE4BzvKcXpm+d
 jx5QnKm+9s1f/UctwJJDNrhaWyyV2VSl7n6u0V9R6hvGfF2d/t9jINHgY
 daot3JKuaZNpCyMB9cnDSE06FfehbezyJDk3/jZ1f654JPxdVR8NE3Tbi
 YDSQnnd2ngR0EsZ9KP9MTomBC54qLG9lbbnwnt7TR8N6zm7HNcejN3HH7
 tM4gj8Bm6TmCsx/UAru8srtn0MCTz5d7P+TgDVUZbcrtmi2akbrf2j0QU
 S9TBWtkxO8wakwp00yjc3pMXLc5lMONsRSegkW1d2nJ74a9l1ZS3RwfpF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5791762"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5791762"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914678220"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="914678220"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:34:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1rn2db-0000000EgKN-11S6; Wed, 20 Mar 2024 22:34:15 +0200
Date: Wed, 20 Mar 2024 22:34:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/bridge: simple-bridge: Extend match support for
 non-DT based systems
Message-ID: <ZftIRz2gCiGcoPwj@smile.fi.intel.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-3-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122163220.110788-3-sui.jingfeng@linux.dev>
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

On Tue, Jan 23, 2024 at 12:32:17AM +0800, Sui Jingfeng wrote:
> Which is intended to be used on non-DT environment, where the simple-bridge
> platform device is created by either the display controller driver side or
> platform firmware subsystem. To avoid duplication and to keep consistent,
> we choose to reuse the OF match tables. Because the potentional user may
> not has a of_node attached, nor a ACPI match id. If this is the case,
> a software node string property can be provide to fill the niche.

...

> -	sbridge->info = of_device_get_match_data(&pdev->dev);
> +	if (pdev->dev.of_node)
> +		sbridge->info = of_device_get_match_data(&pdev->dev);
> +	else
> +		sbridge->info = simple_bridge_get_match_data(&pdev->dev);

This is wrong. Just use device_get_match_data() instead of of_ counter part.
The rest, if required, has to be addressed elsewhere.

So, formal NAK for the changes like above.

-- 
With Best Regards,
Andy Shevchenko


