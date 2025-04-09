Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9187A81CFE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282810E7E3;
	Wed,  9 Apr 2025 06:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn6LKHYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A0D10E7E3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744179886; x=1775715886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=liMyIG7/4mCzxn6tmCcAdM+q9KqgorkJlhO8n903kjM=;
 b=jn6LKHYiCs1s5Vi4p0j110uz1g7WKPkM5gjeK8spsLtkfcxMlGRhVlDT
 yXUwmXDOrGj2vKgJhKJntQEmPdSvWlkXMSd9hul0ISQ7wLfUe/kSHrfTq
 Msv+zSM6bHzIX8njsxmFNZ/InwDkwFJT0ZYmsKs7BMbk0WAyGtAiu9/kf
 naoA1n5+fjs8K1qOnXsj6PTaCSLzZE7ReoBjnEI7XvjtW/Lmx2NsApE2+
 +LHfP9L5sCkt1EjDRXLMsfJUFb61lPRmasWb9sH2IOTRauhPbv8D0/VaQ
 6G6bIrKJl+TlG0Z1ZenYrN8toVPZW3T/RgNKxy0ZYJqi77535BhY+P+Kv w==;
X-CSE-ConnectionGUID: 62adiiMWSNO6RwyC59eV4g==
X-CSE-MsgGUID: JViUDfpkSMWHBGznX4Z+0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45769328"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45769328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 23:24:42 -0700
X-CSE-ConnectionGUID: ArX8oMHbQZ+GSIsQI/ir6A==
X-CSE-MsgGUID: 1oqwE9+3SdCqGmqUbtY7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="132614748"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 23:24:38 -0700
Date: Wed, 9 Apr 2025 09:24:35 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, andrealmeid@igalia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string array
Message-ID: <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409014633.31303-1-jiangfeng@kylinos.cn>
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

On Wed, Apr 09, 2025 at 09:46:33AM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.
> 
> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

Thanks for the fix.
