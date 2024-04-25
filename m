Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56288B274B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 19:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919B11A682;
	Thu, 25 Apr 2024 17:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvR5SyuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496DE11A682
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714065159; x=1745601159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/MX7mb48Oaas11ALBDWxgSss1C+Eafy+xBsAFtLrbSc=;
 b=AvR5SyuC8D8fS1SM8A4aIZHLKa5JKNI8bAyjDJgQs0OhYjNdgwieb5/s
 o/HTC7JvZS1paIjvLWsmijmxTNADDTRUdxvXhiH6I3h+KT9oYIxvW19S3
 JFUQ5nqyXwr0iPlMJqZa7RUjJoNp6MB/+b0OzwZWJnxU/sA7xkT8+/0aQ
 l0YG/AzGfQBrFEt6hYPUE8WFC4zQK0w+aKwUghNTJpe27DZU9KE620cBg
 lJluXgqkpFaPJ8kaNF2MQfFFM5xyTRykc0TMwrcjd8FLveDyFdQeVZVzo
 o5W/LrsAIqIvsmWivazDj4oxEyaSAKiHBGlTH4Al+wKRDYWj1wUDdo7tX A==;
X-CSE-ConnectionGUID: hX0YvStnR2+n141m9Z0BDA==
X-CSE-MsgGUID: xrrjBJYhR6inlBpBAgKSQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9641507"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9641507"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:12:38 -0700
X-CSE-ConnectionGUID: 5ntsbN1DQ2COxAcOuixMBg==
X-CSE-MsgGUID: KawXo31RSom3YxIbDfqqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29611907"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:12:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s02e9-0000000149G-3Rpi; Thu, 25 Apr 2024 20:12:33 +0300
Date: Thu, 25 Apr 2024 20:12:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm: fixed: Don't use "proxy" headers
Message-ID: <ZiqPAeps9uiG63qD@smile.fi.intel.com>
References: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
 <87r0exs067.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0exs067.fsf@intel.com>
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

On Mon, Apr 22, 2024 at 09:49:04PM +0300, Jani Nikula wrote:
> On Mon, 22 Apr 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Update header inclusions to follow IWYU (Include What You Use)
> > principle.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Assuming it builds, and nothing depends on other stuff from kernel.h via
> drm_fixed.h,

For the record, I have built-tested this via `make allyesconfig` on x86_64.

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


