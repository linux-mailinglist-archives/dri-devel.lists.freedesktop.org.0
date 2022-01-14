Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A548EB7F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A46B10E4F6;
	Fri, 14 Jan 2022 14:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CD610E4F2;
 Fri, 14 Jan 2022 14:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642169914; x=1673705914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AEvnDslGsOGfg/KTFj4CDj9oYhA5k0NUZG4ddu+7HzE=;
 b=OOj8h1vBGwHAM8kwVRbbjWVBsB8+1yJWuF/BngmiP2JhWA+7VLt1Q5hK
 1W/unN1HrRaNunJLstevQHNtLgPnm+RsPRXGD93GGr+JFQeP5aJ6P9NN6
 g5+eIcsw1Hd78Lj3tz9IgrI8OU0Yn66fvAUWowRyTVkP0lx6BGFILZNEh
 SsZXzzc95GUfYTZzartVm6WDoz9Nc++9D4wLmMAnC8fhKYip+6g5i3ucv
 C0OYR8FNTgd/S6k2jj6PJMRCGDw5xf2TKjkK+/e2IpMHHtTbTs5wQrqPC
 C0mLNAP+nc2yUVy+5ZQw/2FkdArYD69XhzIU4ou2Q9qIq3M+4bgvYIQnZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244453356"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="244453356"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 06:18:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="692227145"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 06:18:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n8NNq-00AeD8-2B; Fri, 14 Jan 2022 16:16:50 +0200
Date: Fri, 14 Jan 2022 16:16:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v3 2/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <YeGFugZvwbF7l2I/@smile.fi.intel.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-3-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114101753.24996-3-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Takanari Hayama <taki@igel.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Evan Quan <evan.quan@amd.com>, Mark Yacoub <markyacoub@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 07:17:52PM +0900, Tomohito Esaki wrote:
> The LINEAR modifier is advertised as default if a driver doesn't specify
> modifiers.

...

> +	const uint64_t default_modifiers[] = {
> +		DRM_FORMAT_MOD_LINEAR,
> +		DRM_FORMAT_MOD_INVALID

+ Comma?

> +	};

Why not enum?


-- 
With Best Regards,
Andy Shevchenko


