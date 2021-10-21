Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5F436463
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474476ECA2;
	Thu, 21 Oct 2021 14:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347E6ECA0;
 Thu, 21 Oct 2021 14:35:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292513422"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="292513422"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495174359"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 21 Oct 2021 07:35:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 17:35:32 +0300
Date: Thu, 21 Oct 2021 17:35:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 14/17] uapi/drm/dg2: Format modifier for DG2 unified
 compression and clear color
Message-ID: <YXF6tItZLX4Cn6Aw@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-15-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021142627.31058-15-ramalingam.c@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Oct 21, 2021 at 07:56:24PM +0530, Ramalingam C wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> DG2 unifies render compression and media compression into a single
> format for the first time.  The programming and buffer layout is
> supposed to match compression on older gen12 platforms, but the
> actual compression algorithm is different from any previous platform; as
> such, we need a new framebuffer modifier to represent buffers in this
> format, but otherwise we can re-use the existing gen12 compression driver
> logic.
> 
> DG2 clear color render compression uses Tile4 layout. Therefore, we need
> to define a new format modifier for uAPI to support clear color rendering.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
>  .../drm/i915/display/intel_display_types.h    | 10 +++-
>  drivers/gpu/drm/i915/display/intel_fb.c       |  7 +++
>  .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++++++--
>  include/uapi/drm/drm_fourcc.h                 | 30 ++++++++++++
>  5 files changed, 94 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9b678839bf2b..2949fe9f5b9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1013,6 +1013,9 @@ intel_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
>  					  cmd->pixel_format);
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
> +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
> +	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
> +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
>  		return lookup_format_info(gen12_ccs_formats,
>  					  ARRAY_SIZE(gen12_ccs_formats),
>  					  cmd->pixel_format);

That seems not right. Flat CCS is invisible to the user so the format
info should not include a CCS plane.

-- 
Ville Syrjälä
Intel
