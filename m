Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0106A73254
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 13:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DED10E32B;
	Thu, 27 Mar 2025 12:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ikd+0UEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A975810E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743078807; x=1774614807;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1qUO0MBYemzPSLBW6MOoCvhMEn3+p0HUFlE7+CgFknI=;
 b=Ikd+0UEgarOK4nBZL+jxjZTARzuSdTriT0NnKQl0YAwgORnCFyqSvc7p
 tK+p30w4WTekzt0UpEGlroKu7FncVjvdzVS2PVEykOAv0mzAu6RuDN+Bh
 5ZABzIEvIhMmleL70OniovyUZn3YUIoeHl7ZuhNrVlskL1vQrQ7ivLmIC
 qRtHaNhcuxt7kXCBDJ09vb2CrWwm7XSMz4WwiW9+4daluIef2ls62V3hi
 d+20EWZ1qe9S/su8wvF53DcEBR9eGtzSoHOtzvCQ+o1tiZ1DvLM5/qw0N
 6V0ihlDGTud5jPUUK9nBYtnbDqgzhEP5VWbP07hW3cEECasnaldbmkyj2 w==;
X-CSE-ConnectionGUID: Iu6YqpxhSxKJG6+tS4+xBA==
X-CSE-MsgGUID: d0zgYym/Rbei6Yy/oTEKUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48190785"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="48190785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:33:04 -0700
X-CSE-ConnectionGUID: 7CphrUGzRmuxnoxsh8Ky1w==
X-CSE-MsgGUID: RcGr6TrAReugJ3/w05Iv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129282364"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:33:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
In-Reply-To: <fdb8ae46-6de5-4bdc-8c7d-5d8a3249d98b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
 <878qoq678p.fsf@intel.com>
 <3a6a2168-3b38-4173-9731-6505a83d4d82@collabora.com>
 <fdb8ae46-6de5-4bdc-8c7d-5d8a3249d98b@linux.intel.com>
Date: Thu, 27 Mar 2025 14:32:58 +0200
Message-ID: <87wmca4ps5.fsf@intel.com>
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

On Thu, 27 Mar 2025, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> wrote:
> Hi,
>
> On 3/27/2025 12:37 PM, Dmitry Osipenko wrote:
>> On 3/27/25 14:30, Jani Nikula wrote:
>>> On Thu, 27 Mar 2025, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
>>>> pages_use_count") changed the type of
>>>> drm_gem_shmem_object::pages_use_count but accel drivers were left
>>>> behind.
>>>>
>>>> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>
>>> Just for build, on the series,
>>>
>>> Tested-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> Please merge.
>> 
>> Applied to misc-next
>
> This was applied in less then an hour after posting for review without any testing (building is not testing).
> I can't see how this is up to community standards.
> I would prefer that patches for accel/ivpu were merged by ivpu maintainers.
> At least give us time to review them. 

I regret rushing Boris/Dmitry to merge. Sorry about that.

My only excuse is that the build was broken, and the changes were small
and mechanical, similar to what was done elsewhere to change the
interfaces.


BR,
Jani.

-- 
Jani Nikula, Intel
