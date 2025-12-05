Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B95CA758C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C30210E108;
	Fri,  5 Dec 2025 11:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8VsXibj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0E10E108;
 Fri,  5 Dec 2025 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764933543; x=1796469543;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7WJSGU/0yILKGIXxm1WzCJo9clf0W8U5PC6ns58vYMM=;
 b=g8VsXibjKHReJcnPYUkZQhRKYMKFaGH6ZgYglen67JcL9JWP5rydR5fX
 se4bYS83yl4htcfLwUdjFn2iao6rGHJkwk244EYstaH0J7kaU23itDYjW
 jyJhuhKKSBE8fTo2IGDVHYg9nMCcrtKLBMuM8cFNExr0lEYh2SU8aYEv0
 Qc0AxbZum0Ny8VO0/kqgpzucm2WY3YXNO0/YpEPimqEmTspjeUJhQpjAc
 lyGHye7SO0nTNM9xJRHy9YzOPLSZQanxmjaq7E0OObhh9udV9qCLvIRJ8
 bnHsipvSX1iW+hWfqNIYHTCDxAdluaLWMHZUhyBtC3tr3EGXnkXFTdEIz Q==;
X-CSE-ConnectionGUID: enW1/nSRTEyC9eB+hYZppA==
X-CSE-MsgGUID: gZ/P7Ts4SGKMZeAXdkZN8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70585111"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="70585111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:19:02 -0800
X-CSE-ConnectionGUID: qFwCkogeT1W6MJDro6kkaw==
X-CSE-MsgGUID: Pck7QiBDR/C8deE51SuAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195300484"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:18:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
In-Reply-To: <f33b29bb-72bd-4925-adb6-e8cd5267c142@ursulin.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
 <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
 <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
 <f33b29bb-72bd-4925-adb6-e8cd5267c142@ursulin.net>
Date: Fri, 05 Dec 2025 13:18:55 +0200
Message-ID: <cd911303d0aa820ff5c478b2759f3301096a618c@intel.com>
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

On Fri, 05 Dec 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> On 05/12/2025 10:48, Ard Biesheuvel wrote:
>> OK, so something like
>> 
>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>> @@ -72,7 +72,7 @@ struct intel_memory_region {
>>          u16 instance;
>>          enum intel_region_id id;
>>          char name[16];
>> -       char uabi_name[16];
>> +       char uabi_name[20];
>>          bool private; /* not for userspace */
>> 
>>          struct {
>
> Yes please. There is only two of those objects at majority of systems, 
> and 3-4 on a few discrete cards supported by i915, so no big deal to 
> grow them a tiny bit.

For v2, please also fix the subject prefix: drm/i915.

BR,
Jani.


-- 
Jani Nikula, Intel
