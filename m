Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71C9767BC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 13:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D504210EB4B;
	Thu, 12 Sep 2024 11:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8IpuPm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE210EB4B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726140346; x=1757676346;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J1GXTNFncPwjt81U/3BVKaEweFbhgjsaC38ofE+SfYw=;
 b=U8IpuPm180txrdTKOueBCGJfnCExAApCNlNkEXXXvPjvuiN536eqwMlZ
 tmZM9R8SZs6tMRttezK9IFB2fq8MRu0g1C0DiDP7ms9HBdDUK7gJer1d0
 i1aK7B0z10YrFN5bLsqcz1Z2xo/p6u6qjxBtrrKPrIFT/oeIH8R9ctGwr
 k3BBNHDJDlPLupdWTL3M2eXYpF0IgbgMvlZkucJHGlcyPrmGFel+NyTe1
 3BMfOwEhqu8UfrfT4aG4jJPLp5y4+NNbB78pjNufiDHjr5awyNrZ1iPT/
 Y08ZVLLNs4ql5v4f7kITTMQkQU9c0de5Kc3mn5XNRrVPsd9WV3BZKjAZF w==;
X-CSE-ConnectionGUID: OXCdG7RHTkW+C5hZkJGZVw==
X-CSE-MsgGUID: aAlaQvFwR3Wh9cLCagaJxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25181105"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25181105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:25:46 -0700
X-CSE-ConnectionGUID: oRgBbhK6Q3G7veiWxmeMKw==
X-CSE-MsgGUID: bSr1+S1/Rxq9g1WkDqUP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="71784573"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:25:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tejas Vipin
 <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <57016d01-4525-4685-b029-41e03b0abbda@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
 <87ldzxi71s.fsf@intel.com> <988bb389-13e6-4465-ab37-3ed94ecee9be@suse.de>
 <87y13xgqj3.fsf@intel.com> <57016d01-4525-4685-b029-41e03b0abbda@suse.de>
Date: Thu, 12 Sep 2024 14:25:40 +0300
Message-ID: <87bk0tgll7.fsf@intel.com>
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

On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 12.09.24 um 11:38 schrieb Jani Nikula:
>> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Am 12.09.24 um 10:56 schrieb Jani Nikula:
>>>> Moreover, in this case .detect() only detects digital displays as
>>>> reported by EDID. If you postpone that to .get_modes(), the probe helper
>>>> will still report connected, and invent non-EDID fallback modes. The
>>>> behaviour changes.
>>> The change in behavior is intentional, because the current test seems
>>> arbitrary. Does the driver not work with analog outputs?
>> Not on a DVI/HDMI port. Same with i915.
>>
>> That's possibly the only way to distinguish a DVI-A display connected to
>> DVI-D source.
>
> That's a detect failure, but IMHO our probe helpers should really handle 
> this case.

How? Allow returning detect failures from .get_modes()?

BR,
Jani.


-- 
Jani Nikula, Intel
