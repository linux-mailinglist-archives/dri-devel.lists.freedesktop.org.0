Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2F427ADA8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 14:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460C6E169;
	Mon, 28 Sep 2020 12:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEB86E169;
 Mon, 28 Sep 2020 12:18:34 +0000 (UTC)
IronPort-SDR: u3ejz9REGmVGWsFkneoq2RXJb0U0nfoNIsB+XxQEHyTt6dreq3AxzlLZi/L3SH8k0VEON8DTDy
 ybxarMhRdHCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="141390491"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="141390491"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 05:18:33 -0700
IronPort-SDR: WoZj++GqjhAS64ZYYBgut6NvPQDylqUQfNjcEbyVwwsBb2hzgt52jyyPtrLiIanZ04jEcuRAB9
 PFlT49hz0wAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="311763592"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 28 Sep 2020 05:18:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Sep 2020 15:18:28 +0300
Date: Mon, 28 Sep 2020 15:18:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v10 0/8] Asynchronous flip implementation for i915
Message-ID: <20200928121828.GU6112@intel.com>
References: <20200921110210.21182-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921110210.21182-1-karthik.b.s@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 04:32:02PM +0530, Karthik B S wrote:
> Without async flip support in the kernel, fullscreen apps where game
> resolution is equal to the screen resolution, must perform an extra blit
> per frame prior to flipping.
> =

> Asynchronous page flips will also boost the FPS of Mesa benchmarks.
> =

> v2: -Few patches have been squashed and patches have been shuffled as
>      per the reviews on the previous version.
> =

> v3: -Few patches have been squashed and patches have been shuffled as
>      per the reviews on the previous version.
> =

> v4: -Made changes to fix the sequence and time stamp issue as per the
>      comments received on the previous version.
>     -Timestamps are calculated using the flip done time stamp and current
>      timestamp. Here I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP flag is u=
sed
>      for timestamp calculations.
>     -Event is sent from the interrupt handler immediately using this
>      updated timestamps and sequence.
>     -Added more state checks as async flip should only allow change in pl=
ane
>      surface address and nothing else should be allowed to change.
>     -Added a separate plane hook for async flip.
>     -Need to find a way to reject fbc enabling if it comes as part of this
>      flip as bspec states that changes to FBC are not allowed.
> =

> v5: -Fixed the Checkpatch and sparse warnings.
> =

> v6: -Reverted back to the old timestamping code as per the feedback recei=
ved.
>     -Added documentation.
> =

> v7: -Changes in intel_atomic_check_async()
>     -Add vfunc for skl_program_async_surface_address()
> =

> v8: -Add WA for older platforms with double buffered
>      async address update enable bit.
> =

> v9: -Changes as per feedback received on previous version.
> =

> v10: -Changes as per feedback received on previous version.

Everything seems good, so pushed the series to dinq.  Thanks.

Gave this a little test run on my cfl as well. At first it didn't
kick in, but then I remebered that I'm running X with modifiers
enabled so I was getting compression instead. After disabling
modifiers I got plain old X-tile again and did see async flips
happening.

> =

> Karthik B S (8):
>   drm/i915: Add enable/disable flip done and flip done handler
>   drm/i915: Add support for async flips in I915
>   drm/i915: Add checks specific to async flips
>   drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
>   drm/i915: Add dedicated plane hook for async flip case
>   drm/i915: WA for platforms with double buffered address update enable
>     bit
>   Documentation/gpu: Add asynchronous flip documentation for i915
>   drm/i915: Enable async flips in i915
> =

>  Documentation/gpu/i915.rst                    |   6 +
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +-
>  drivers/gpu/drm/i915/display/intel_display.c  | 199 ++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |   3 +
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  30 +++
>  drivers/gpu/drm/i915/i915_irq.c               |  52 +++++
>  drivers/gpu/drm/i915/i915_irq.h               |   3 +
>  drivers/gpu/drm/i915/i915_reg.h               |   1 +
>  8 files changed, 299 insertions(+), 1 deletion(-)
> =

> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
