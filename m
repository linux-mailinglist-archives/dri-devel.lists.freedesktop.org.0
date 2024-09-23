Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B051497E8D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9C10E180;
	Mon, 23 Sep 2024 09:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VME8RMWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE5710E180
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727084190; x=1758620190;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hxOOIcHxpn1k7+C+uO984/vXp2LIHB/TbDCDWpqrAvQ=;
 b=VME8RMWXgWPnOgRqooasxk0uzeWrqyISwhsRAa1xt4hApcKrC1X+D3Hy
 LJBAR9zD9KdqTnpulV1nAI7dqSuhj1UAymx+kHAnvkNES71nloU/39y8p
 d57PU3jE7rrFSFHN0Xt8HHozTjJ93M9smMoE4laW0REN6vyw5mtxmgFFs
 fFi/F43Y0Ax+HxjeVYNiTiqpRTi8wCt2qakYH+Hae4e9IDMQwI+xjFRzS
 TA9cGt6A0TZYYZPxVPVaz1EALM2MjIJnEvTPW3glNw2qEcenOYb4VIQxu
 iCY56MimxJmG7u9oNFlCHNH/e2HYN9opkWCZnmr60tZUjpGhrvWf3arSI w==;
X-CSE-ConnectionGUID: ziGxWlIXQy6nVQeq0ZsN3A==
X-CSE-MsgGUID: i0uv3kk2TKykswK+1hKrKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37158380"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="37158380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:36:30 -0700
X-CSE-ConnectionGUID: xSqErfLXSPy0NpRFbaE5Xw==
X-CSE-MsgGUID: KAkOJ+AZTX2KjfaFW8d8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71032232"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:36:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Vipin <tejasvipin76@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <4c053d01-2f67-47c3-9f08-e20e8e6ef1dd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de>
 <4c053d01-2f67-47c3-9f08-e20e8e6ef1dd@gmail.com>
Date: Mon, 23 Sep 2024 12:36:22 +0300
Message-ID: <877cb27lux.fsf@intel.com>
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

On Thu, 12 Sep 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> On 9/12/24 12:49 PM, Thomas Zimmermann wrote:
>> Hi
>> 
>> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
>>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
>>> monitor HDMI information is available after EDID is parsed. Additionally
>>> rewrite the code the code to have fewer indentation levels.
>> 
>> The problem is that the entire logic is outdated. The content of cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detect_ctx callback should be set to drm_connector_helper_detect_from_ddc() and cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx will detect the presence of a display and ->get_modes will update EDID and other properties.
>> 
>> Do you have  a device for testing such a change?
>> 
>> Best regards
>> Thomas
>
> I do not have a device to test this. Reading the rest of the series and
> given my circumstances, I do not think I will be continuing with this
> patch.

*sad trombone*

I think we could've made concrete incremental positive changes here,
without changing everything about detect and get_modes.

BR,
Jani.



-- 
Jani Nikula, Intel
