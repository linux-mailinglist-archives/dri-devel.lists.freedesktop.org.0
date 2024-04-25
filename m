Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CA8B28D0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EC611A785;
	Thu, 25 Apr 2024 19:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3cZYF/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C811A785
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714072378; x=1745608378;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQKDUIkbcqXJvPnx+i1N+rPtXZr4oQXNIGA0HlIQiyg=;
 b=D3cZYF/4cpIoPuHlxA/1xYooHvxn6Q7wJ7dCjpZDcwEwTUkmG+58FvmB
 d8pUjJskCk1pg7UmHCPVueuz+Y00q3Of8fvrcflkCguSyoTpN6VQkYGrQ
 ytubdQq0+Y8ecSPByP36ez7D9ycutKeOgYYC+ViACSayLqBeeeuVpOha4
 TA11ej7Bhi2Ot8lkyVz8AxsvqHbPkbUAFr5slj9UqogRb88p3aWDpReeS
 hBXeaKdhfCmK0mtd3FM9JJKtoI4vL9exPHkpPhu3sCQBKdYlVv9nihbZk
 1GRxrl9H77UVsozzjP698M9Eb7QOUMoTTZjHEVAad1GO7LNeAUj9RS1Yf Q==;
X-CSE-ConnectionGUID: tMqWWOBsR/WPpd0KlBo4Ng==
X-CSE-MsgGUID: hJGGQjVzRxCzAQOwtxnS5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9947190"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9947190"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:12:57 -0700
X-CSE-ConnectionGUID: df/CsiBnRgmg2dLfU5Xx2g==
X-CSE-MsgGUID: eL3v1+bjRhWyfjtKO+H61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29819636"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:12:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s04WT-000000016tI-1sdd; Thu, 25 Apr 2024 22:12:45 +0300
Date: Thu, 25 Apr 2024 22:12:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZiqrLfezhns4UycR@smile.fi.intel.com>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
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

On Fri, Apr 26, 2024 at 02:53:22AM +0800, Sui Jingfeng wrote:
> On 2024/4/26 02:08, Sui Jingfeng wrote:

Are you speaking to yourself? I'm totally lost.

Please, if you want to give a constructive feedback, try to understand
the topic from different aspects and then clearly express it.

-- 
With Best Regards,
Andy Shevchenko


