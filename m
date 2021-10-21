Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90784361E4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 14:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3936E452;
	Thu, 21 Oct 2021 12:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55716E452
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:38:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="215939506"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="215939506"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 05:38:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="495131848"
Received: from ssuryana-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.45.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 05:38:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
In-Reply-To: <20211020131941.15367-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211020131941.15367-1-tzimmermann@suse.de>
Date: Thu, 21 Oct 2021 15:38:50 +0300
Message-ID: <877de6mu1x.fsf@intel.com>
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

On Wed, 20 Oct 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Move a number of files into modules and behind config options.
>
> So far, early boot graphics was provided by fbdev. With simpledrm, and
> possibly other generic DRM drivers, it's now possible to have general
> early-boot output with DRM. This requires the DRM core to be linked into
> the kernel binary image.
>
> The reduction in size here is only ~1%, but the patchset is part of a
> larger effort to reduce the size of the DRM core module.

I think the main problem is really that of organization. You have all of
the files under drivers/gpu/drm/ and the only way to know which module
the files belong to is to look at the Makefile and the Kconfig. It's not
obvious based on the file names or directory, at all. And there are
nearly a hundred drm_*.c files there!

We also seem to have stuff depend on DRM alone, while functionally they
should really depend on DRM_KMS_HELPER too.

The subdirectories under drm/ also don't have any distinction between
being part of drm core and helpers or drivers. We have lib, scheduler,
selftests, and ttm next to the drivers.

We should start adding drm_* subdirectories, and moving the modules
separate from drm core there. We should rename the current non-driver
directories drm_*. We need better structure.


BR,
Jani.




>
> Thomas Zimmermann (3):
>   drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
>   drm: Link several object files into drm_kms_helper.ko
>   drm: Move GEM memory managers into modules
>
>  drivers/gpu/drm/Kconfig                |  4 ++--
>  drivers/gpu/drm/Makefile               | 26 +++++++++++++++-----------
>  drivers/gpu/drm/drm_gem_cma_helper.c   |  4 ++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c |  4 ++++
>  drivers/gpu/drm/drm_irq.c              |  2 --
>  5 files changed, 25 insertions(+), 15 deletions(-)
>
> --
> 2.33.0
>

-- 
Jani Nikula, Intel Open Source Graphics Center
