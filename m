Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFDB1BC2D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 23:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9310E117;
	Tue,  5 Aug 2025 21:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXX8q7Yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B93F10E117
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754430915; x=1785966915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M/K5gkGPUVp2DBi4KKVQbUk/OVqba8EVQEdmuAN63as=;
 b=YXX8q7YiHMDcDWLWNKgpJjLD7yVK2m+YnPv4PUIADqiyyiW+IAoCzesZ
 UgeBp/vGikOKdr6XZYykL2CpHzBsCFEw7d0JK4xO0cwbxHOQZ3mNyC4f0
 WK48bHlUwJ1Z52UGdsS6DrCzAmjOMi8vDLt9Dreuq9h2nT1LNbV/gH9TG
 i2FOVrmxHTQcW2qNWxnYELVu1SXs9Pn1s2ZGz+3o/8G36gYBVVDpt/BMv
 kYK7kqX/eQhiVZOBPBePDbYcElv7FWLY9oLHe7fdANtQ4IFp8BEG3WI8o
 Q22chkW6NOz/0dCiYBDUS3iNCm9py3JcxG7W3svtUHKJpq4FJzFzJwlJE A==;
X-CSE-ConnectionGUID: bl8Gtd2HQAy4bNurum9kzQ==
X-CSE-MsgGUID: DQxGZcOXT9O9eLIIDsL3Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74318760"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="74318760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 14:55:14 -0700
X-CSE-ConnectionGUID: h7wGwCTwTGO4NE8ICxCugQ==
X-CSE-MsgGUID: AbNEH4ZZSMSRzb7kVk5p+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164942184"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 14:55:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ujPcd-00000003rWR-0d6e; Wed, 06 Aug 2025 00:55:03 +0300
Date: Wed, 6 Aug 2025 00:55:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:
> Add an equivalent of list_first_entry_or_null() to obtain the last element
> of a list.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


