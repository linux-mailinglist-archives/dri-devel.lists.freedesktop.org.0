Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D6A73228
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 13:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC4A10E338;
	Thu, 27 Mar 2025 12:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4gANWYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEA910E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743077985; x=1774613985;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ogviNyQJY+a4RyhZhcuBFEO01+van6MfR2sybibRnME=;
 b=j4gANWYeYuabHzmDp/gDH5D8obZbduqpwIcjvy1hRmwqqLs0OC6gID9O
 J2CfVlC9uxjl/EpFP/5gPXPWHLEiv4gFx/eJhlyD5DZ7AwvERVicqHMxJ
 Qj8octNVT6AYE5UgieW460nTNVU06rC0yqIerULaKd5tIL1Nso9bM3j0E
 Lv/YM8AE6qXukFwmtn/Nif9Cv+r2YNU69AfZx2IBwiIHbHm3E8qMFGzqE
 qHcnyX0ak/uNXaNaovG/rvcvYIyYX6uD3LYUMW9HY5YMGVdY45uX16NaE
 7RIlhbOgX9JcCNbELOY5un3nU76ysDzd6TWHQ6KyZ5yOJYZaSw+6VCOYj w==;
X-CSE-ConnectionGUID: eqYW1rHVQRes/8CAXlbtgA==
X-CSE-MsgGUID: iFNiIL+ETw+zN3XAm2ePyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43559987"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="43559987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:19:45 -0700
X-CSE-ConnectionGUID: 7NbovEYXS3+iQKa/Zz6iGQ==
X-CSE-MsgGUID: aJyvrZdjRiOrm7oP/F5k4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129809325"
Received: from kwywiol-mobl1.ger.corp.intel.com (HELO [10.245.83.152])
 ([10.245.83.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:19:43 -0700
Message-ID: <fdb8ae46-6de5-4bdc-8c7d-5d8a3249d98b@linux.intel.com>
Date: Thu, 27 Mar 2025 13:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
 <878qoq678p.fsf@intel.com>
 <3a6a2168-3b38-4173-9731-6505a83d4d82@collabora.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3a6a2168-3b38-4173-9731-6505a83d4d82@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 3/27/2025 12:37 PM, Dmitry Osipenko wrote:
> On 3/27/25 14:30, Jani Nikula wrote:
>> On Thu, 27 Mar 2025, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
>>> pages_use_count") changed the type of
>>> drm_gem_shmem_object::pages_use_count but accel drivers were left
>>> behind.
>>>
>>> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>> Cc: dri-devel@lists.freedesktop.org
>>
>> Just for build, on the series,
>>
>> Tested-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Please merge.
> 
> Applied to misc-next

This was applied in less then an hour after posting for review without any testing (building is not testing).
I can't see how this is up to community standards.
I would prefer that patches for accel/ivpu were merged by ivpu maintainers.
At least give us time to review them. 

Regards,
Jacek
