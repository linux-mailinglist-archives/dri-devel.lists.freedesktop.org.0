Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C89765D5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596AD10EB2E;
	Thu, 12 Sep 2024 09:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hG36fB1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2810EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726133944; x=1757669944;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1+0GP3Fhl1TeD1OEJjKM0XcsNeZlLNpmcfCIBdsnhtc=;
 b=hG36fB1xq1wKixbATl4kJKEm0WZ05vv/xST+njnoBwQeKtsXQUuspvyd
 zLAHnQ37b6Q2RQf2YfN1ESC+PSPx1IfNBb4JLXZNh5+xp/HIyqpAf/mJK
 5mBGo2jSwK1q+qv6fz+TfkmS8RTUMcKCA1+CC6GfjVnQ14bAzaTvbyMWx
 sN7+tLdndMLw7JuR5TYHeqc8uPu1itJ9bhPyRjv3xWJRK2L0evtH8CRg9
 t/oNJ+68LoT1ViTYinNlsJmfg3fohXiHYzZ9aER5GiyCMVX24h4JBxT07
 RSZuDgHE4ximBmsj4gusSS9FCSTqEsae2ymz1t8SU0pHWUu3PeLEcTwQC Q==;
X-CSE-ConnectionGUID: KTc+NoUQStiM+k+I8VoZYg==
X-CSE-MsgGUID: h7GlIZQDTsSMge2J/vEiGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25171015"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25171015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:39:04 -0700
X-CSE-ConnectionGUID: /OrnQwkOT1SwhcYdpQ+5Sg==
X-CSE-MsgGUID: ZhKrTV4FS76Xf2ApDvac0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72244869"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:39:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tejas Vipin
 <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <988bb389-13e6-4465-ab37-3ed94ecee9be@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
 <87ldzxi71s.fsf@intel.com> <988bb389-13e6-4465-ab37-3ed94ecee9be@suse.de>
Date: Thu, 12 Sep 2024 12:38:56 +0300
Message-ID: <87y13xgqj3.fsf@intel.com>
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
> Am 12.09.24 um 10:56 schrieb Jani Nikula:
>> Moreover, in this case .detect() only detects digital displays as
>> reported by EDID. If you postpone that to .get_modes(), the probe helper
>> will still report connected, and invent non-EDID fallback modes. The
>> behaviour changes.
>
> The change in behavior is intentional, because the current test seems 
> arbitrary. Does the driver not work with analog outputs?

Not on a DVI/HDMI port. Same with i915.

That's possibly the only way to distinguish a DVI-A display connected to
DVI-D source.


BR,
Jani.


-- 
Jani Nikula, Intel
