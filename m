Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44596B652
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FCB8911F;
	Wed,  4 Sep 2024 09:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etV7KExd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10448911F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441557; x=1756977557;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VKpRU+5B793TwrhoCZoT/4dHv803Xk1ulHEQY0NeDhQ=;
 b=etV7KExdsBZFtHgB2u7DhoGaxic3POoYEO0Cjw4Ng7EGAdx+JGxtNLqe
 ifdbBJc6kb/ESGYaQXDT6Fb1/aD3VKGwmHEtKzNoGrdbGgMyebeMh1Bjb
 04x/BWlTddIeLIrzlQTSNfw5SdJC/PamWSjb/DyuCbLyX1Gbh1KHxQCWG
 5YOsnPrquHGlakk44GKsHisFdJ1ZElC7WBcnD2IrH2zOp1j5y242P/kuk
 1E3M/oEeCLXyzGDzlyumC9wNpClDoJ+E0+6VPFYEekP7+1wz/SCIx01CW
 jkL0CkbhoQYd9W20aQ/Eb3gKceZT11F8HAdEPm3prsPcuGrUJ4NmpRQBe g==;
X-CSE-ConnectionGUID: 9g9FXOOvS2u6QUTlrjCAHA==
X-CSE-MsgGUID: GyfUhu9qRUy9eMYpbihjHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27006121"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="27006121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:19:16 -0700
X-CSE-ConnectionGUID: xQgPzs1mTHmSxlfcNCE1MQ==
X-CSE-MsgGUID: HJMUC4W+RImol8qOZWcN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65940636"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:19:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/mm: annotate drm_mm_node_scanned_block() with
 __maybe_unused
In-Reply-To: <ZtdUcteHkNDNbZAw@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240903173437.3212437-1-jani.nikula@intel.com>
 <ZtdUcteHkNDNbZAw@smile.fi.intel.com>
Date: Wed, 04 Sep 2024 12:18:57 +0300
Message-ID: <87r09zsrni.fsf@intel.com>
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

On Tue, 03 Sep 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Sep 03, 2024 at 08:34:37PM +0300, Jani Nikula wrote:
>> Clang build with CONFIG_DRM_DEBUG_MM=n, CONFIG_WERROR=y, and W=1 leads
>> to:
>> 
>>   CC [M]  drivers/gpu/drm/drm_mm.o
>> ../drivers/gpu/drm/drm_mm.c:614:20: error: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>> static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
>>                    ^
>> 
>> Fix this by annotating drm_mm_node_scanned_block() with __maybe_unused.
>
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pushed to drm-misc-next, thanks for the review.

BR,
Jani.

-- 
Jani Nikula, Intel
