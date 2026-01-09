Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FCD07C07
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0008410E80A;
	Fri,  9 Jan 2026 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihV5qP51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8C010E80B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767946695; x=1799482695;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1dclAeAmo/kEKTJgPxF3hc0nU/ucwLIlvxkT6ispSeo=;
 b=ihV5qP51RQi+Mn0kaHsmqlZ35jJVlPbogOdh/bTBe2fo301f5Fzvjsh4
 kr3iwvDPeDspo8Li5Dnho0xcD0A1QytPV5rljJfBOUtuW+HR8K7u0hGwf
 vaYW568mo22irv6jiK98Yk8Cl+SUMS3MwVIOTajsJZIBuX0Pi9IpoRBYP
 TtaLeGi9zXeSZulW5N3OqU6mTk4gDoY+YCYzRFcuS/3NSdlE59WJTrq5u
 F0Sdg6VXExGPAqrzDbXhpWycq5lt6N0JbQx6kIhLL43xidneZdTVjJbPL
 Ngo0DvgrrAlCNpIEj640gfAv5KmGMXth96f1h9A95XQGz4ti1DqLjv+9J g==;
X-CSE-ConnectionGUID: qRJxmzwhR8WJFxJqsnF7BA==
X-CSE-MsgGUID: cHwEaJrXRbqM1pZ9JETQEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79623979"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79623979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:18:15 -0800
X-CSE-ConnectionGUID: yHCXLxk+Sw+DerJM4Bzemw==
X-CSE-MsgGUID: swLwwOcHSXGGGha3ZSthpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="234596574"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:18:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aaron Erhardt <aer@tuxedocomputers.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH 1/1] drm: ensure that vblank diff is never
 negative
In-Reply-To: <20260108165139.1381835-2-aer@tuxedocomputers.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260108165139.1381835-1-aer@tuxedocomputers.com>
 <20260108165139.1381835-2-aer@tuxedocomputers.com>
Date: Fri, 09 Jan 2026 10:18:08 +0200
Message-ID: <686ae9c3d4697956d16eff0b6f2e6e43cb25ba90@intel.com>
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

On Thu, 08 Jan 2026, Aaron Erhardt <aer@tuxedocomputers.com> wrote:
> Handle cases, where drivers report incorrect timestamps and negative
> time differences are calculated. If the negative difference is large
> enough, negative missed vblanks are reported, but stored in an unsigned
> integer which can causes freezes. This patch prevents this case.
>
> This fix has been verified to fix problems with the i915 driver on
> modern Intel CPUs (e.g. Intel Core Ultra 7 155H).

Is there a reported bug about this, preferrably with logs? If not,
please file one as instructed at [1], and reference the patch.


BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


>
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 94e45ed6869d..1022b6d61e4e 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1563,7 +1563,14 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
>  	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
>  
>  	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
> -	if (framedur_ns)
> +
> +	/*
> +	 * Make sure no bogus diffs result from negative differences
> +	 * when incorrect timestamps are reported by a driver.
> +	 */
> +	if (drm_WARN_ON_ONCE(dev, t_vblank < vblank->time))
> +		diff = 0;
> +	else if (framedur_ns)
>  		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);

-- 
Jani Nikula, Intel
