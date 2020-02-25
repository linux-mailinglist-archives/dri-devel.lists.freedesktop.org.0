Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABE16C3A9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6EB6EAEB;
	Tue, 25 Feb 2020 14:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F736EAEB;
 Tue, 25 Feb 2020 14:17:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 06:17:49 -0800
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="231032368"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 06:17:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Eric Anholt <eric@anholt.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH][next] drm: Replace zero-length array with flexible-array
 member
In-Reply-To: <20200225140347.GA22864@embeddedor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200225140347.GA22864@embeddedor>
Date: Tue, 25 Feb 2020 16:17:35 +0200
Message-ID: <87a756sqdc.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2020, "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h         | 2 +-
>  drivers/gpu/drm/gma500/intel_bios.h           | 2 +-
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_lrc.c           | 2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.h         | 2 +-

Please split out the i915 changes to a separate patch.

>  drivers/gpu/drm/msm/msm_gem.h                 | 2 +-
>  drivers/gpu/drm/qxl/qxl_cmd.c                 | 2 +-
>  drivers/gpu/drm/vboxvideo/vboxvideo.h         | 2 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                 | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 2 +-
>  include/drm/bridge/mhl.h                      | 4 ++--
>  include/drm/drm_displayid.h                   | 2 +-
>  include/uapi/drm/i915_drm.h                   | 4 ++--

Not sure it's worth touching uapi headers. They're full of both [0] and
[]. Again, please at least split it to a separate patch to be decided
separately.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
