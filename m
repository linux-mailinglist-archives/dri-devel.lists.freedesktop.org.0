Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BA475639
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C810E478;
	Wed, 15 Dec 2021 10:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D7110E46F;
 Wed, 15 Dec 2021 10:24:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="299974349"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="299974349"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:24:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="614655687"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.7.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:24:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 0/3] drm/dp: Move DisplayPort helpers into own module
In-Reply-To: <83ab4452-3744-20fe-e3ba-5bd4b48622e3@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213093650.19598-1-tzimmermann@suse.de>
 <87lf0o7hnv.fsf@intel.com> <83ab4452-3744-20fe-e3ba-5bd4b48622e3@suse.de>
Date: Wed, 15 Dec 2021 12:24:22 +0200
Message-ID: <87sfuu4149.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 13.12.21 um 14:34 schrieb Jani Nikula:
>> On Mon, 13 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Split-off DisplayPort functions from KMS helper library and move them
>>> into their own module. Reduces the size of drm_kms_helper.ko by ~50%.
>>>
>>> This patchset is part of an on-going effort to reduce the minimum
>>> binary size of the DRM core and helpers. It's helpful for systems with
>>> early-boot DRM graphics, which requires DRM to be linked into the
>>> kernel image.
>> 
>> Would it be time to add a subdirectory for each non-driver, non-core drm
>> module? We've touched this topic before. I find it increasingly hard to
>> remember which files are part of helpers. This would also help with the
>> arbitrary drm_dp_helper_mod.c naming.
>> 
>> Perhaps drivers/gpu/drm/drm_dp/?
>
> It's probably worth it, but I'd prefer a separate patchset and 
> discussion over this. It affects several modules.

I guess the only thing here that we need to get right from the start is
the new module name, everything else is relatively easy to change
later. drm_dp_helper.ko seems fine by me.

Note that this will also affect the drm_kms_helper.ko module parameters
dp_aux_i2c_speed_khz, dp_aux_i2c_transfer_size and
drm_dp_cec_unregister_delay, which will move to drm_dp_helper.ko.

See the monstrosity near the top of drm_kms_helper_common.c I had to add
for backward compatibility when I moved drm_edid_load.c from
drm_kms_helper.ko to drm.ko. That was perhaps different, as these seem
more like debug knobs, but at a minimum this needs to be mentioned in
the commit message, and certainly needs acks from Dave and/or Daniel.


BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
