Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C089A74464
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 08:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5721D10E990;
	Fri, 28 Mar 2025 07:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3L8Jobw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA35010E990
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743147689; x=1774683689;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FSrsg5r1uGG3U95F70kg9m6JHgBmg5/5oGUpOoPnDlQ=;
 b=D3L8Jobwvn4TDcMNdVCVLrlC5hiyAb60hzZzeqTOPz9MhaUqit9OJLll
 x2ahIeFm5+3wfPUCIQQfwTqF+/OxS2kAbTVy5djzkJXo9vtdOltwhWcqT
 P+uIns4EkhQRtqZPosrDumMHJrnICbnDxY0dcd75+VxWwAZncodF/CFVe
 LLb8z/ShjAWHd0qYIj1SlNY5ctUJkgx14prx1hlsg8Cpn7eTt+bVITMM2
 VfalXdOO11SZc9+7vb13GK69QZyoF0KMk00PQ2Zlje4Tyuvi+c2KrFGml
 M6mzxKeVX81hYo5Mhg6ayixqyPjA/Tox+R34uK2p8AepDmwo+sTKoE+8I A==;
X-CSE-ConnectionGUID: qWi3cdRNRPW2yHv5FjbU1w==
X-CSE-MsgGUID: EOUfUlYxTmqcdZAH6ICP7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44419073"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44419073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:41:28 -0700
X-CSE-ConnectionGUID: 2CHDSwNXTlSMdbMx3/B0+g==
X-CSE-MsgGUID: FwNyIya3QGyl4xHCfwbs+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="126299951"
Received: from tmilea-mobl3.ger.corp.intel.com (HELO [10.245.115.15])
 ([10.245.115.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:41:26 -0700
Message-ID: <44f879d4-a4ae-4abc-9017-22f525d458ec@linux.intel.com>
Date: Fri, 28 Mar 2025 08:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
 <878qoq678p.fsf@intel.com>
 <3a6a2168-3b38-4173-9731-6505a83d4d82@collabora.com>
 <fdb8ae46-6de5-4bdc-8c7d-5d8a3249d98b@linux.intel.com>
 <87wmca4ps5.fsf@intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <87wmca4ps5.fsf@intel.com>
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

On 3/27/2025 1:32 PM, Jani Nikula wrote:
> On Thu, 27 Mar 2025, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> wrote:
>> Hi,
>>
>> On 3/27/2025 12:37 PM, Dmitry Osipenko wrote:
>>> On 3/27/25 14:30, Jani Nikula wrote:
>>>> On Thu, 27 Mar 2025, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
>>>>> pages_use_count") changed the type of
>>>>> drm_gem_shmem_object::pages_use_count but accel drivers were left
>>>>> behind.
>>>>>
>>>>> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>>> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>
>>>> Just for build, on the series,
>>>>
>>>> Tested-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> Please merge.
>>>
>>> Applied to misc-next
>>
>> This was applied in less then an hour after posting for review without any testing (building is not testing).
>> I can't see how this is up to community standards.
>> I would prefer that patches for accel/ivpu were merged by ivpu maintainers.
>> At least give us time to review them. 
> 
> I regret rushing Boris/Dmitry to merge. Sorry about that.
> 
> My only excuse is that the build was broken, and the changes were small
> and mechanical, similar to what was done elsewhere to change the
> interfaces.

I guess it OK as this doesn't happen too often and I would probably do the same :)

Regards,
Jacek

