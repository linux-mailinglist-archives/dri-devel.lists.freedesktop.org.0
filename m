Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B29652F17
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F5010E444;
	Wed, 21 Dec 2022 10:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B8510E447
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671616923; x=1703152923;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sTpjYpJOpx7qdP0xas5FwpKwCfxPRtPCkY5JOu1aeNo=;
 b=E9KFJio0Xj+dmApcnzAAl5ZXKk3IMQsb3WLVe7xZWWd0kQlZZYyPvlj9
 DP42Kd5/cYFRz+2BSAOEVbyhW/8elM9LCMWfpA2EU9fVwPa1z4PGIvKDl
 tBTLq3rOG+kdACSuHG3Yl5+CbAcY8xld1VAD3bFxr1IneAPNF7aeC+CRP
 +S20E7yaCUbqG6LMGWomDn+obKuudbEFa4s40ej97VE17oH101f2WSeRY
 yUt80d/wlbo18Wbj8aB89BsPME2G5YDOGyZGRJe6CGXdMdK5MaMAGTFYN
 PX0xm13v92Dd/5OZDBVpQBxF2oOkm0FtHJBy1RkwcWIocSUYnKKSHZMLE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="382061484"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="382061484"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:02:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="719892991"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="719892991"
Received: from jorgeblx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:01:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Siddh Raman Pant
 <code@siddh.me>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/10] drm: Remove usage of deprecated DRM_* macros
In-Reply-To: <339505f3-9005-df0b-3c73-b54320568db2@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1671566741.git.code@siddh.me>
 <339505f3-9005-df0b-3c73-b54320568db2@suse.de>
Date: Wed, 21 Dec 2022 12:01:57 +0200
Message-ID: <8735992hyi.fsf@intel.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 20.12.22 um 21:16 schrieb Siddh Raman Pant:
>> This patchset aims to remove usages of deprecated DRM_* macros from the
>> files residing in drivers/gpu/drm root.
>> 
>> In process, I found out that NULL as first argument of drm_dbg_* wasn't
>> working, but it was listed as the alternative in deprecation comment,
>> so I fixed that before removing usages of DRM_DEBUG_* macros.
>> 
>> This patchset should be applied in order as changes might be dependent.
>> 
>> Please review and let me know if any errors are there, and hopefully
>> this gets accepted.
>
> Thanks for the patchset. Overall this looks fine.
>
> But the use of pr_() functions is not optimal in my opinion. I know that 
> I recommended using it, but at a closer look, I think we might want to 
> reconsider that. I wouldn't like losing the '[drm]' tag, but adding them 
> to each pr_() call isn't a good idea either.
>
> I think it would be nicer to replace DRM_INFO with drm_info(NULL, ). 
> Depending on the device being NULL, the helpers would select dev-based 
> messages or printk-based messages. It would then work like drm_dbg_(). 
> But it needs some additional changes.
>
> Can you first move all pr_() related changes into a new patchset? The 
> trivial conversion were the device is known and not NULL can remain in 
> this patchset and be merged soon. We can afterwards have a separate 
> discussion for the changes that currently involve pr_().

Same thoughts, agreed.

BR,
Jani.


>
> Best regards
> Thomas
>
>> 
>> Siddh Raman Pant (10):
>>    drm: Remove usage of deprecated DRM_INFO
>>    drm: Remove usage of deprecated DRM_NOTE
>>    drm: Remove usage of deprecated DRM_ERROR
>>    drm/print: Fix support for NULL as first argument of drm_dbg_*
>>    drm: Remove usage of deprecated DRM_DEBUG
>>    drm: Remove usage of deprecated DRM_DEBUG_DRIVER
>>    drm: Remove usage of deprecated DRM_DEBUG_KMS
>>    drm: Remove usage of deprecated DRM_DEBUG_PRIME
>>    drm/drm_blend: Remove usage of deprecated DRM_DEBUG_ATOMIC
>>    drm/drm_lease: Remove usage of deprecated DRM_DEBUG_LEASE
>> 
>>   drivers/gpu/drm/drm_agpsupport.c        |   4 +-
>>   drivers/gpu/drm/drm_blend.c             |  13 ++-
>>   drivers/gpu/drm/drm_bridge.c            |   8 +-
>>   drivers/gpu/drm/drm_bufs.c              | 122 ++++++++++++------------
>>   drivers/gpu/drm/drm_client_modeset.c    | 118 +++++++++++++----------
>>   drivers/gpu/drm/drm_color_mgmt.c        |   4 +-
>>   drivers/gpu/drm/drm_connector.c         |  28 +++---
>>   drivers/gpu/drm/drm_context.c           |  18 ++--
>>   drivers/gpu/drm/drm_crtc.c              |  36 ++++---
>>   drivers/gpu/drm/drm_crtc_helper.c       |  62 ++++++------
>>   drivers/gpu/drm/drm_debugfs_crc.c       |   8 +-
>>   drivers/gpu/drm/drm_displayid.c         |   6 +-
>>   drivers/gpu/drm/drm_dma.c               |  10 +-
>>   drivers/gpu/drm/drm_drv.c               |  28 +++---
>>   drivers/gpu/drm/drm_edid.c              |  17 ++--
>>   drivers/gpu/drm/drm_file.c              |  18 ++--
>>   drivers/gpu/drm/drm_flip_work.c         |   2 +-
>>   drivers/gpu/drm/drm_framebuffer.c       |   3 +-
>>   drivers/gpu/drm/drm_gem.c               |   7 +-
>>   drivers/gpu/drm/drm_gem_dma_helper.c    |   6 +-
>>   drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
>>   drivers/gpu/drm/drm_hashtab.c           |  10 +-
>>   drivers/gpu/drm/drm_ioc32.c             |  13 +--
>>   drivers/gpu/drm/drm_ioctl.c             |  24 ++---
>>   drivers/gpu/drm/drm_irq.c               |   4 +-
>>   drivers/gpu/drm/drm_kms_helper_common.c |   2 +-
>>   drivers/gpu/drm/drm_lease.c             |  68 ++++++-------
>>   drivers/gpu/drm/drm_legacy_misc.c       |   4 +-
>>   drivers/gpu/drm/drm_lock.c              |  36 +++----
>>   drivers/gpu/drm/drm_mipi_dbi.c          |  19 ++--
>>   drivers/gpu/drm/drm_mm.c                |   8 +-
>>   drivers/gpu/drm/drm_mode_config.c       |   2 +-
>>   drivers/gpu/drm/drm_mode_object.c       |   6 +-
>>   drivers/gpu/drm/drm_modes.c             |  10 +-
>>   drivers/gpu/drm/drm_modeset_helper.c    |   2 +-
>>   drivers/gpu/drm/drm_pci.c               |  14 +--
>>   drivers/gpu/drm/drm_plane.c             |  46 ++++-----
>>   drivers/gpu/drm/drm_probe_helper.c      |  39 ++++----
>>   drivers/gpu/drm/drm_rect.c              |   4 +-
>>   drivers/gpu/drm/drm_scatter.c           |  19 ++--
>>   drivers/gpu/drm/drm_syncobj.c           |   2 +-
>>   drivers/gpu/drm/drm_sysfs.c             |  22 ++---
>>   drivers/gpu/drm/drm_vm.c                |  45 +++++----
>>   include/drm/drm_print.h                 |  91 ++++++++++++++----
>>   44 files changed, 549 insertions(+), 465 deletions(-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
