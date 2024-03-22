Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377788691A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3EC10E87A;
	Fri, 22 Mar 2024 09:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOUdC6Qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DEA10E87A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711099372; x=1742635372;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dqz+Usb0C8ozA80PCCBjHib9D3xaFY8srzv1b7krGc4=;
 b=lOUdC6QzWDJQ29z47GpXjcKOMvQ+mD8MZWa0451PDUQ7SiSD6MZlefJ3
 4FeSTm0qACj6YnIFVO2yItivl4uHM+CrxtfU7AHVxzB9OwFLVvPqdGIGI
 oTaoXDwlfcJCe0A+sRaIlpt8UWhpwE93e2I9hebpCV/TYnY61BlmFXHNW
 4ns9xgIE7YhC5AtBqqv8IjuwTXcWIJfga8WHA3dYvoRH9ofbOuyiY/c2n
 ii/j3IZj4jmsXsGc/K3hFDQjO2r3vfK2TwW1XDSouIBQU+25wJo8pkTtZ
 xDnVf7EKnVwgx3bStMz9B2vwQ0E86/Qm1CnmnONaGx1dhOmBF0j9zIkl3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31575279"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="31575279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19508193"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.6])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:22:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick
 <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
In-Reply-To: <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
Date: Fri, 22 Mar 2024 11:22:14 +0200
Message-ID: <87sf0iliyh.fsf@intel.com>
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

On Fri, 22 Mar 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> Hi,
>
>
> On 2024/3/21 23:29, Maxime Ripard wrote:
>> Infoframes in KMS is usually handled by a bunch of low-level helpers
>> that require quite some boilerplate for drivers. This leads to
>> discrepancies with how drivers generate them, and which are actually
>> sent.
>>
>> Now that we have everything needed to generate them in the HDMI
>> connector state, we can generate them in our common logic so that
>> drivers can simply reuse what we precomputed.
>>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>   drivers/gpu/drm/Kconfig                            |   1 +
>>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>>   drivers/gpu/drm/drm_connector.c                    |  14 +
>>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>>   include/drm/drm_atomic_state_helper.h              |   8 +
>>   include/drm/drm_connector.h                        | 109 +++++++
>>   7 files changed, 483 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 16029435b750..3d3193c7aa5f 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>>   	  If in doubt, say "N".
>>   
>>   config DRM_KMS_HELPER
>>   	tristate
>>   	depends on DRM
>> +	select DRM_DISPLAY_HDMI_HELPER
>
> Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
> emerged with default config.

Can we stop abusing select instead of adding more selects to paper over
the issues?

Use select only for non-visible symbols (no prompts anywhere) and for
symbols with no dependencies.


BR,
Jani.


>
>
> : drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
> drm_atomic_state_helper.c:(.text+0x15e4): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
> : drm_atomic_state_helper.c:(.text+0x15f0): undefined reference to `drm_hdmi_avi_infoframe_bars'
> : drm_atomic_state_helper.c:(.text+0x1638): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
> make[2]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1
>
> make[1]: *** [/home/suijingfeng/UpStream/drm-tip/Makefile:1162: vmlinux] Error 2
>
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:240: __sub-make] Error 2
>
>>   	help
>>   	  CRTC helpers for KMS drivers.
>>   
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"

-- 
Jani Nikula, Intel
