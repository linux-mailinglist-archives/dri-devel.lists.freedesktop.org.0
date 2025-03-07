Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5DCA56831
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE83610E183;
	Fri,  7 Mar 2025 12:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/0bx2bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ED610E183
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741351866; x=1772887866;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FTjF2SQSsL/AoWgnz/jZ6lWWge2Q1dxx+2qbU31bxOk=;
 b=e/0bx2bhcgXTVjR0D/JGd8Nt7uvS6JWwKLDu+k/jDOpf17NQUufpQo89
 rwDBfReNMDck/Y8AbKgpYTj+APBnRzL+u6A+fhIHsYFu8P97ufroOpaeV
 dkUSCGWUMQJLEPdJuR43kEygkhscKcyekZU6e2IXFNrQ7VHcIplhwwihM
 YSVB7uxM4Nvi411RATNjFet9U++eUoadZ67ogIYMAETmT3S9hR6LXV51Y
 gnXb3oB8kR4LRXWpThHT7/6FNNwuOW16vJBSTEwe/0JM6Wye87AZWhiu1
 R/DunG2iEKnlBO1+MqH2L2kjTnLlKW7m0uMgijTQ2PnG6vUwzer4ILK/6 g==;
X-CSE-ConnectionGUID: 7kYBrvvfTFqKJVeacloVsA==
X-CSE-MsgGUID: K152kzRITjG+Qm+KAm6nVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42277043"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42277043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:51:04 -0800
X-CSE-ConnectionGUID: zS/Js1jSSkeI2ew4bCVT+g==
X-CSE-MsgGUID: hiwL0Z9hQgyPIr5HcEMunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119315841"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.240])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:50:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com,
 admin@kodeit.net, gargaditya08@live.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Provide a dedicated DMA device for PRIME
 import
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250307080836.42848-1-tzimmermann@suse.de>
Date: Fri, 07 Mar 2025 14:50:55 +0200
Message-ID: <87tt85gg28.fsf@intel.com>
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

On Fri, 07 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Importing dma-bufs via PRIME requires a DMA-capable hardware device.
> This is not the case for USB, where DMA is performed entirely by the
> USB controller instead of the USB devices.
>
> Drivers for USB-based hardware maintain their own workarounds for this
> problem. The original idea to resolve this was to provide different
> PRIME helpers for such devices, but the dma-buf code internally assumes
> DMA functionality as well. So that ideas is not realistic.
>
> Let's instead turn the current workaround into a feature. Patch 1 adds a
> dma_dev field to struct drm_device and makes the PRIME code use it. Patches
> 2 to 5 replace related driver code.
>
> It will also be useful in other code. The exynos and mediatek drivers
> already maintain a dedicated DMA device for non-PRIME code. They could
> likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
> memory with the regular parent device. They should support the dma_dev
> settings as well.
>
> Tested with udl.

I mainly reviewed the first patch, but then glanced through all the rest
too, and didn't spot anything obviously wrong.

So FWIW,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

on the rest too.


>
> v2:
> - maintain reference on dma_dev (Jani)
> - improve docs (Maxime)
> - update appletbdrm
>
> Thomas Zimmermann (5):
>   drm/prime: Support dedicated DMA device for dma-buf imports
>   drm/appletbdrm: Set struct drm_device.dma_dev
>   drm/gm12u320: Set struct drm_device.dma_dev
>   drm/gud: Set struct drm_device.dma_dev
>   drm/udl: Set struct drm_device.dma_dev
>
>  drivers/gpu/drm/drm_drv.c          | 21 ++++++++++++++
>  drivers/gpu/drm/drm_prime.c        |  2 +-
>  drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++---------------
>  drivers/gpu/drm/gud/gud_internal.h |  1 -
>  drivers/gpu/drm/tiny/appletbdrm.c  | 27 +++++++-----------
>  drivers/gpu/drm/tiny/gm12u320.c    | 46 +++++++++---------------------
>  drivers/gpu/drm/udl/udl_drv.c      | 17 -----------
>  drivers/gpu/drm/udl/udl_drv.h      |  1 -
>  drivers/gpu/drm/udl/udl_main.c     | 14 ++++-----
>  include/drm/drm_device.h           | 41 ++++++++++++++++++++++++++
>  10 files changed, 102 insertions(+), 101 deletions(-)

-- 
Jani Nikula, Intel
