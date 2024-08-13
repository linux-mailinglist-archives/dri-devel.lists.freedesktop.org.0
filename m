Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D0950264
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1915010E2DF;
	Tue, 13 Aug 2024 10:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0YvIW1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5659010E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723544744; x=1755080744;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q9WkyHx53MsFELKub6AflyoHbkSjJrwxA9qcqbkaVXQ=;
 b=f0YvIW1w66e1h8m/SM5jlCuiJvg+SuRJuvs/CBLTCaScU3VhRRKcmNmM
 rzK3q1+4X3T19ajEjd2uIeOaag5KubBWjiax5Nt+xjFE1MCcDa5/B6PbN
 JSFRnBqSoKX8sFEnIHnFGc2X22B7hHOFWVlvQdKIsFWPp3rPnDlOD3C4C
 t/pzzaG35e3zY8W3buPzt8lKZFGnd0KQn/BB5EhAk/ig87rXu5vU1L9sw
 6aosM1ViuIMbXkefHX+Ih+qkQfmPhk9M5EPB0KFGt5qn/2ZHufEZ9EVcy
 aUaguDsu5SZCl9hkvf3FDgaWRdHztNYRHxqrifiQWwaj+1inga2bTChtx g==;
X-CSE-ConnectionGUID: ls8eeeHLQm+vKQOec88LCg==
X-CSE-MsgGUID: 1zOg/6ySSzOb9ETs1jtUBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33080795"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="33080795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:25:43 -0700
X-CSE-ConnectionGUID: PJACcPrpTTKypRG/hjEJJA==
X-CSE-MsgGUID: pwrt27J3T6azRNrLAmM05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63481849"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:25:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm: fixed: Don't use "proxy" headers
In-Reply-To: <ZrscJvDZqMQNFgR3@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
 <87r0exs067.fsf@intel.com> <ZiqPAeps9uiG63qD@smile.fi.intel.com>
 <ZrscJvDZqMQNFgR3@smile.fi.intel.com>
Date: Tue, 13 Aug 2024 13:25:36 +0300
Message-ID: <87zfpgzplr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 13 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Apr 25, 2024 at 08:12:33PM +0300, Andy Shevchenko wrote:
>> On Mon, Apr 22, 2024 at 09:49:04PM +0300, Jani Nikula wrote:
>> > On Mon, 22 Apr 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > > Update header inclusions to follow IWYU (Include What You Use)
>> > > principle.
>> > >
>> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> > 
>> > Assuming it builds, and nothing depends on other stuff from kernel.h via
>> > drm_fixed.h,
>> 
>> For the record, I have built-tested this via `make allyesconfig` on x86_64.
>> 
>> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Thank you!
>
> Who is going to apply this, please?

Pushed to drm-misc-next, thanks for the patch.

BR,
Jani.

-- 
Jani Nikula, Intel
