Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7851C8AAB6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043D10E660;
	Wed, 26 Nov 2025 15:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exZ223Hw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9110E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764171262; x=1795707262;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CCug/MBOMnHF2yMXUk/0NXt665eJWKaxeq4tP0rPVE8=;
 b=exZ223Hw07yNJKukwCw8799oJHdPUHOJYvfveCujWvi+gp9uReBfnq+b
 dZKyeyUrEGsqEGYPtAXrrDC5dFGOFSOR4O7qKgroFA33LIUiv4Xhyl0aY
 0GaDPLiHneRIAlzkwylCN91BeHf4EsPjkpvqrWt4jnEZJysStiQaOJ7UW
 0ZYbVZrKnbd1kO5lfOtXE52QB4VXBbhtZK9hhj8H7lL5PpH5U3b6tWcfY
 9rS8dXahEoygFwxKVDgiu7Yh46ppN9kKEnQK1SvHu8DdSUpGpeVdLEf+N
 L7q4K/nIIo8JIl1u8Vu0yiHT23rR7WlFV5H8c0XzPWpFtSfHX21911t/2 g==;
X-CSE-ConnectionGUID: REnT3x/zTU2p1hnF8CdgcQ==
X-CSE-MsgGUID: 6qAhZyL1SFivf/gLlAVIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77684743"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77684743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:34:21 -0800
X-CSE-ConnectionGUID: scrlhLSzSdSsZostakmPdA==
X-CSE-MsgGUID: By7fM+D4Ska02rjESYC85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="216326569"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:34:19 -0800
Message-ID: <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
Date: Wed, 26 Nov 2025 16:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey,

Den 2025-11-21 kl. 16:12, skrev Christian König:
> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>> Until now ttm stored a single pipelined eviction fence which means
>> drivers had to use a single entity for these evictions.
>>
>> To lift this requirement, this commit allows up to 8 entities to
>> be used.
>>
>> Ideally a dma_resv object would have been used as a container of
>> the eviction fences, but the locking rules makes it complex.
>> dma_resv all have the same ww_class, which means "Attempting to
>> lock more mutexes after ww_acquire_done." is an error.
>>
>> One alternative considered was to introduced a 2nd ww_class for
>> specific resv to hold a single "transient" lock (= the resv lock
>> would only be held for a short period, without taking any other
>> locks).
>>
>> The other option, is to statically reserve a fence array, and
>> extend the existing code to deal with N fences, instead of 1.
>>
>> The driver is still responsible to reserve the correct number
>> of fence slots.
>>
>> ---
>> v2:
>> - simplified code
>> - dropped n_fences
>> - name changes
>> v3: use ttm_resource_manager_cleanup
>> ---
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Going to push separately to drm-misc-next on Monday.
> 
Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.

Kind regards,
~Maarten Lankhorst
