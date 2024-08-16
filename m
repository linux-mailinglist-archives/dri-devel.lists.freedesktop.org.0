Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AB954AD0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4801B10E64B;
	Fri, 16 Aug 2024 13:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDajUZ2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C7810E64B;
 Fri, 16 Aug 2024 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813950; x=1755349950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CSNRPAmNVIQVfSpw7eMIfJxVBuuHOmb1Ba5ZLcKKGME=;
 b=KDajUZ2lBy1xN3d9xQw7V5QE1rRBf1qOVkBScEuOUqqSmd/JzDwvXizP
 nhTRdNQlXzjyTVPDfb/u73vZgPQ9tYbBkq3GrUzBcjRAGKqPU7VlGIOed
 nkc4NzxVNRyEgaZx/uT1B428Fjd1Xc9wj47vSf3Jpt4uyysLOR2yIElDH
 GSWp/aZuFBfzCH0oPq8grq38rFH6tFbB2NcTL0hCo8kodcDnJe4Zc0GX5
 mRdpHGSrolX6bmLXSSVPLNSeH72iJ4A7lBBQ9DdU4WOtC/TL7o1UKuDle
 Uibmqtt3Pp8lx7GP5fscUxTIx6VIXxlwLgwjnE0AnkMWW5FQjJehSr461 g==;
X-CSE-ConnectionGUID: UcTXLEn7Syyz6cvLlc7cOg==
X-CSE-MsgGUID: dc6AkX+xTv6X1r9b8eoZbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32743501"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="32743501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:12:28 -0700
X-CSE-ConnectionGUID: 8vH0jRjNQTiHB7BsNgeZUg==
X-CSE-MsgGUID: bf53aPjkSO+HYej1rgtMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64065126"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:12:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 2/2] drm: use mem_is_zero() instead of !memchr_inv(s,
 0, n)
In-Reply-To: <202408150907.5B5C5FCDF@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240814100035.3100852-1-jani.nikula@intel.com>
 <20240814100035.3100852-2-jani.nikula@intel.com>
 <202408150907.5B5C5FCDF@keescook>
Date: Fri, 16 Aug 2024 16:12:20 +0300
Message-ID: <87ed6o7gsr.fsf@intel.com>
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

On Thu, 15 Aug 2024, Kees Cook <kees@kernel.org> wrote:
> On Wed, Aug 14, 2024 at 01:00:35PM +0300, Jani Nikula wrote:
>> Use the mem_is_zero() helper where possible.
>> 
>> Conversion done using cocci:
>> 
>> | @@
>> | expression PTR;
>> | expression SIZE;
>> | @@
>> |
>> |   <...
>> | (
>> | - memchr_inv(PTR, 0, SIZE) == NULL
>> | + mem_is_zero(PTR, SIZE)
>> | |
>> | - !memchr_inv(PTR, 0, SIZE)
>> | + mem_is_zero(PTR, SIZE)
>> | |
>> | - memchr_inv(PTR, 0, SIZE)
>> | + !mem_is_zero(PTR, SIZE)
>> | )
>> |   ...>
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks for these patches! Since drm is the first user, feel free to
> carry it there unless you'd prefer I carry it in my trees?
>
> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks for the reviews. I've gone ahead and merged both to
drm-misc-next, heading for the next merge window.

BR,
Jani.


-- 
Jani Nikula, Intel
