Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F88ACF14
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34E112618;
	Mon, 22 Apr 2024 14:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKjskCcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C210EEE0;
 Mon, 22 Apr 2024 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713795190; x=1745331190;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3VH0wPSYjbxLBOo5XQYtJGrCcBkZEO/wQnEkLB2vOfM=;
 b=dKjskCcn2P2xfyGsZHavSSTJ4LGBRSmfvTG1nNDobMmGJ2Dvwy1piB7I
 CNVL3eI0J06KkNgvS+ODj8HV6z6O4GXv9h85fncdrmaFofiaSTviq0kmX
 O+nGLLL51eokpkfTOKhcXaswo+1Bm0p8MqLw1Vb4bcfFLB+rJf3vyEHYL
 TDY0gIDHs4QAquLJhJXMLH3aM/+aozvkXR1qtevVqK6rjCvUrJtAQtOcJ
 pxzgMj2HYhjT0qy3QOVR9Bc1nCwbrO04Rmws9o93UUruGpLUJ4XWThVq8
 LLLNM6YpZxszdFZJ3kN+J2X0N65mjEwZsmJyPalEEPP5OfdAV2ty4HGaS Q==;
X-CSE-ConnectionGUID: SnDZN2xJSHSI2vzSF4quNg==
X-CSE-MsgGUID: vpmbyvWHSOGtlyS0NNdCKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19941196"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19941196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:13:09 -0700
X-CSE-ConnectionGUID: DZsqbfzjR8OdPfj3CGCp5w==
X-CSE-MsgGUID: SRZKEL0xRoiveeHtQ3FgsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28810038"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:13:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michael Olbrich <m.olbrich@pengutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: graphics@pengutronix.de
Subject: Re: Reliably selecting non-CEA modes on Intel graphics (and maybe
 others)
In-Reply-To: <ZiZs94-ZP1n98RZu@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZiZs94-ZP1n98RZu@pengutronix.de>
Date: Mon, 22 Apr 2024 17:13:00 +0300
Message-ID: <8734rdtrir.fsf@intel.com>
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

On Mon, 22 Apr 2024, Michael Olbrich <m.olbrich@pengutronix.de> wrote:
> Hi,
>
> In short: I have a HDMI monitor attached to Intel graphics. I'm trying to
> set a non-CEA mode but the driver always maps it to the corresponding CEA
> mode.

Please file a bug as described at [1], and attach dmesg with debugs
enabled, so we can see what's going on and what kernel and hardware
you're using exactly, and so on.

BR,
Jani.



[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


>
> More specifically, the monitor has two 1920x1080@60 modes in the EDID:
> 1. The CEA mode with VIC 16
> 2. A custom DTD mode with exactly the same timings (this is the preferred
>    mode).
>
> From a userspace perspective, the two modes are mostly identical, except
> for the 16:9 aspect ratio flag in the CEA mode and the preferred type in
> the other.
>
> I want to select the second (preferred) mode, but that does not seem
> possible:
> intel_hdmi_compute_avi_infoframe() tries to determine which VIC should be
> added to the avi infoframe and if limited or full range is used.
> It uses various DRM helpers here but in the end drm_match_cea_mode() is
> called. And here lies the problem:
> The mode provided by the userspace has explicitly no aspect ratio. But
> here, it is interpreted as "the aspect ration is undefined". So matching
> ignored the aspect ratio and the CEA mode with VIC 16 is found and limited
> range is used.
>
> The commit that introduces this fuzzy matching
> 357768cc9e3fdacf6551da0ae1483bc87dbcb4e8 ("drm/edid: Fix cea mode aspect
> ratio handling") made sense at the time. The capability
> DRM_CLIENT_CAP_ASPECT_RATIO that exposes aspect ratios to userspace was
> introduced later in the same merge request, from what I can tell
> 7595bda2fb4378ccbb8db1d0e8de56d15ea7f7fa ("drm: Add DRM client cap for
> aspect-ratio").
>
> Am I missing something here, or is it just not possible to select the
> non-CEA mode right now? In my specific example, the selected CEA mode is
> actually supported by the monitor, but as far as I can tell, the CEA mode
> is used even if the monitor does not support it at all.
>
> I've only tested this on Intel, but I assume that other drivers that use
> the same helpers have the same problem.
>
> So how can this be fixed? I've considered matching the aspect ratio based
> on the DRM_CLIENT_CAP_ASPECT_RATIO capability, but I'm not sure if that is
> valid. The documentation is limited and I found nothing that describes what
> the userspace should do here.
> Or would a new capability make sense here? Or something entirely different?
> I'm not sure how I should proceed here. Any help would be appreciated.
>
> Regards,
> Michael

-- 
Jani Nikula, Intel
