Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38888FDC9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD2110FC99;
	Thu, 28 Mar 2024 11:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SF/KD1cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B511123C5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711624273; x=1743160273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0sjnUhGSLWF4zdEeCOtICFa6SD4hLB0WrMWUZ010M2M=;
 b=SF/KD1cnq7+1T1miHqS+0y0yBtfMX3zWu46E2Ro54sFs95q9E2kobvtg
 BzT4L7CeaOwmoGwXgNHgPBaI5AaCWQamvPs7f4vL2nWWhZ0Zj822nY01X
 ngM/0KAG0FZ6hz3tOIOeA1Pym1i5IVLL3IPDkEEUa4cUv4f+ZdXYoReay
 ahyh9o/MAooHkSUQlnfwet6SXPSqQQrp2NoSjzRqRoJr6OePs5cSvsS9T
 mkZ9y9791W0MO9jW4eG/QVjNIX+jsrehv/iSbHr8+dVOAfT7LF6pczIwy
 fk9rVmTlGjrM47yXQ01cW6t/XcYG0jo7KqP9u86x0dp3ImW6V3z2sPtUC w==;
X-CSE-ConnectionGUID: MbfSnBkpQRGUCA8FBJxOsw==
X-CSE-MsgGUID: dSgj+WhPRNCGKTpKi245Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18205796"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18205796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17229579"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:11:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: DRM_WERROR should depend on DRM
In-Reply-To: <87msqkhhts.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <631a1f4c066181b54617bfe2f38b0bd0ac865b68.1711474200.git.geert+renesas@glider.be>
 <87msqkhhts.fsf@intel.com>
Date: Thu, 28 Mar 2024 13:11:06 +0200
Message-ID: <87jzlmfw6t.fsf@intel.com>
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

On Tue, 26 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 26 Mar 2024, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> There is no point in asking the user about enforcing the DRM compiler
>> warning policy when configuring a kernel without DRM support.
>>
>> Fixes: f89632a9e5fa6c47 ("drm: Add CONFIG_DRM_WERROR")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> D'oh! My bad.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-misc-next. Thanks for the patch!

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index f2bcf5504aa77679..2e1b23ccf30423a9 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -423,7 +423,7 @@ config DRM_PRIVACY_SCREEN
>>  
>>  config DRM_WERROR
>>  	bool "Compile the drm subsystem with warnings as errors"
>> -	depends on EXPERT
>> +	depends on DRM && EXPERT
>>  	default n
>>  	help
>>  	  A kernel build should not cause any compiler warnings, and this

-- 
Jani Nikula, Intel
