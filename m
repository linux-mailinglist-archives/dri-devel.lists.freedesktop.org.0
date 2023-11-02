Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5C7DEF09
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEEE10E83A;
	Thu,  2 Nov 2023 09:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5E410E839;
 Thu,  2 Nov 2023 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917764; x=1730453764;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h5W9LCdVcZfD2AdsHxR/+8vgEFKmYrPZoLM9o3OP560=;
 b=GeGZSyS6FBOkTPo5dvtOrQWMkjnf9p6RTEQd9yhIzCxBr14sWc4vUnCd
 gMe2g+ym1gYSA8mClrnKSTdJ7Sb/LLrtEf63LdoDHeHtzEOKsQ0cw13I1
 r+wMGqp96ApaOEHh1TCc37g2ieawpplDnuUme1dI2mQLaubFoIXaR3KXh
 EOFr4AeqlG04+HEeWIGq4tRtTPGN5Juk3dra0Jx4eHACwLNDjWrOyrcFn
 rCrPPJPX82QuQOw6DWwqnIUigLumu+3t1u81jrhnAl7arUXYy48lZKwPJ
 kNvmmknd6NoePDWtyXE2dV8hMADQ7PehdAbjab1P2hu90KvkGCA0YRnLv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="419783878"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="419783878"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851866682"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="851866682"
Received: from nofferma-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.121])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:35:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/6] drm/edid: split out drm_eld.[ch], add some SAD
 helpers
In-Reply-To: <cover.1698747331.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698747331.git.jani.nikula@intel.com>
Date: Thu, 02 Nov 2023 11:35:53 +0200
Message-ID: <877cn04hvq.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/123384/
>
> Jani Nikula (6):
>   drm/edid: split out drm_eld.h from drm_edid.h
>   drm/eld: replace uint8_t with u8
>   drm/edid: include drm_eld.h only where required
>   drm/edid: use a temp variable for sads to drop one level of
>     dereferences
>   drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
>   drm/eld: add helpers to modify the SADs of an ELD

Maxime, Maarten, Thomas -

I'm moving a bunch of code around here, and would like to get your acks
before merging. I'm planning on merging this via drm-misc-next, it's
just that it only has Intel reviews, and don't want to feel like I'm
sneaking this in.

Thanks,
Jani.

>
>  Documentation/gpu/drm-kms-helpers.rst         |   6 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
>  drivers/gpu/drm/drm_edid.c                    |  43 +++--
>  drivers/gpu/drm/drm_eld.c                     |  55 ++++++
>  drivers/gpu/drm/drm_internal.h                |   6 +
>  drivers/gpu/drm/i915/display/intel_audio.c    |   1 +
>  .../drm/i915/display/intel_crtc_state_dump.c  |   1 +
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |   1 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   1 +
>  drivers/gpu/drm/radeon/radeon_audio.c         |   1 +
>  drivers/gpu/drm/tegra/hdmi.c                  |   1 +
>  drivers/gpu/drm/tegra/sor.c                   |   1 +
>  include/drm/drm_edid.h                        | 148 ----------------
>  include/drm/drm_eld.h                         | 164 ++++++++++++++++++
>  sound/core/pcm_drm_eld.c                      |   1 +
>  sound/soc/codecs/hdac_hdmi.c                  |   1 +
>  sound/soc/codecs/hdmi-codec.c                 |   1 +
>  sound/x86/intel_hdmi_audio.c                  |   1 +
>  19 files changed, 275 insertions(+), 160 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_eld.c
>  create mode 100644 include/drm/drm_eld.h

-- 
Jani Nikula, Intel
