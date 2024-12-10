Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0A9EB0DD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609410E395;
	Tue, 10 Dec 2024 12:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a01lz9nQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A5D10E395;
 Tue, 10 Dec 2024 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733834003; x=1765370003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LIpgMujgy92NjBA7n1bjPRaZfSoCmE4sA0ZOFUFTsY4=;
 b=a01lz9nQEfDwQevyVvJnsVEWYXKEGw7pLBgNTweKXDl+7OZU62wBLuAM
 fw2AdZloM8ImMrdMeyqcoAq2AaAnowp3Z+HwipwZURqvMrrHcNZVHwBlu
 inFN9K4P2+TDDsRUD7PmfHw+dNGS/8ZhGy5vsQtftZlRAOX6XvWF7PUgY
 bvM1ThTwxJPERDQKGZ3KfrlXC3ceSZkx4Q8hi3RH7EEdgNL9C8ACrxyOh
 DzQyxgxXbJ1QmZjMwcIfNaPpFP5G3fS7qteHD0B0jnKd8BGTBGWCIsVdC
 7AHSFe76MwI5ip2OLLIiJn9Fw2Gh5V+WOTixRP0vVQYOHNIqTEFJp5d/I w==;
X-CSE-ConnectionGUID: LKRMpueZReWV4fYQObrTMA==
X-CSE-MsgGUID: tqqhi74iT1uRb+CD19m0nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34095480"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34095480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:33:23 -0800
X-CSE-ConnectionGUID: pUwsLZLUSjWHPijd3tvxJg==
X-CSE-MsgGUID: x+5tkHm/S+CUFd12wdJRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95855172"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:33:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/print: add drm_print_hex_dump()
In-Reply-To: <Z1Gmt1rdhgjQOlYD@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733392101.git.jani.nikula@intel.com>
 <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
 <Z1Gmt1rdhgjQOlYD@ashyti-mobl2.lan>
Date: Tue, 10 Dec 2024 14:33:18 +0200
Message-ID: <874j3bzpip.fsf@intel.com>
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

On Thu, 05 Dec 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
> On Thu, Dec 05, 2024 at 11:49:33AM +0200, Jani Nikula wrote:
>> Add a helper to print a hex dump to a struct drm_printer. There's no
>> fancy formatting stuff, just 16 space-separated bytes per line, with an
>> optional prefix.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks for the review, pushed the series to drm-intel-next with Thomas'
IRC ack on patch 1.

BR,
Jani.

>
> Thanks,
> Andi

-- 
Jani Nikula, Intel
