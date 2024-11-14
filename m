Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781559C8EC6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D4510E814;
	Thu, 14 Nov 2024 15:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNJ42KWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9970910E80B;
 Thu, 14 Nov 2024 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731599639; x=1763135639;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/+SRlLPVSoEcqhnEB8irN9IMlpg5pF84WuBgpr4BvI4=;
 b=YNJ42KWim8XhS8jrDJdLjjksdI5DZ1htI2SkIj38uiJ/o9v2TNb9qLN0
 8xYyK7fsZezRb9djj2DJ3DbL7TBuhVj2eo/B5HKy+VBtpRk80oZ5Xj+Pt
 RBeG0hl7h5pj9+aAUrtub1AqUZ/bO5/oajyj8HbS8/mJblQ/H6xf+Eyt5
 q4kMTVOTIjhu0D/5YXIHmvxBpZqbpIG4bpvO616TNYc5457b0Mkr9RrZW
 tP36q9rFLJP1dImunZSNZ1Qhnii0h5mRnHjaqXZIu8utm9pgQbo242Idr
 vzEp0mYQXrjl56+in7O3hu+PuGoVHZg/yKe6z6/DEsHtI3DUmwmcOo3w7 A==;
X-CSE-ConnectionGUID: QezS6rPPQ6itdF5wc3Rnyg==
X-CSE-MsgGUID: a+WkSGWUR+an4HxAzZvGYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31420263"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31420263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:53:58 -0800
X-CSE-ConnectionGUID: ca6lHrFMTKih0NmqmX/crA==
X-CSE-MsgGUID: ikoNUm1aRsKw6pFS4HukvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93324440"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:53:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ville.syrjala@linux.intel.com
Subject: Re: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
In-Reply-To: <87msi3bidr.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
 <20241113083920.GH1458936@google.com> <87msi3bidr.fsf@intel.com>
Date: Thu, 14 Nov 2024 17:53:46 +0200
Message-ID: <87cyix6cc5.fsf@intel.com>
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

On Wed, 13 Nov 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 13 Nov 2024, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>> On (24/10/31 19:51), Sergey Senozhatsky wrote:
>>> intel_ddi_init() may skip connector initialization, for instance,
>>> both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
>>> are optional.  This leads to situation that ->attached_connector may
>>> be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
>>> and 'DDI TC1/PHY TC1' are not initialized.
>>> 
>>> However, functions like intel_dp_dual_mode_set_tmds_output() and
>>> friends don't take this into consideration.  This leads to NULL
>>> ptr-derefs:
>>> 
>>> KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
>>> RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
>>> Call Trace:
>>> <TASK>
>>> i915_driver_shutdown+0x2d8/0x490
>>> pci_device_shutdown+0x83/0x150
>>> device_shutdown+0x4ad/0x660
>>> __se_sys_reboot+0x29c/0x4d0
>>> do_syscall_64+0x60/0x90
>>> 
>>> Add a new helper to avoid NULL ->attached_connector derefs and
>>> switch some intel_hdmi function to it.  I'm not sure if we need
>>> to switch all or just intel_dp_dual_mode_set_tmds_output() (I
>>> have only seen this one doing NULL derefs so far).
>>
>> Folks, any more comments / opinions on this?
>> What should be the way forward?
>
> Ville, we handle intel_ddi_init_dp_connector() failures but not
> intel_ddi_init_hdmi_connector() failures. Do you recall if there's a
> reason for that? Something like a dual-mode port where DP works but HDMI
> gets rejected because of bogus VBT info?
>
> My gut feeling is to propagate errors from intel_hdmi_init_connector()
> and handle them properly in g4x_hdmi_init() and
> intel_ddi_init_hdmi_connector().
>
> Of course, we have cases where hdmi is just not initialized on DDI, and
> those should be handled. But I don't think hdmi->attached_connector !=
> NULL is really the right check for that.

I'm hoping [1] would solve the issue.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1731599468.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel
