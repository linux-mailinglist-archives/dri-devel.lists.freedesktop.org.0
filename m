Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6EF87ED14
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6B10FB7D;
	Mon, 18 Mar 2024 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaX0kFNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CFD10F0B2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710778298; x=1742314298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=84xfgGQdhPYLNJtOqDpwXG2/hc97FrIjHbfrfTzN6qs=;
 b=kaX0kFNnWUc1eAyNhyCJWDvMd8hydTtjYl0xxJp+AU7aS5LMUOR1SHLa
 8/UDyuj8xGdtnU+nkQTuHnpLX9l4YquZFTSPsXWURmVIX1rS33DA7+TWU
 6lAc6kJIsisIYbrTnJ/ANORaW+5y2WBpTd0hSOPofUQ+sLhpy+arxI0BQ
 MrdUT7RVJEg2XiQQ6UGsx3jzez9q6bDrJUCfmWn9r1Qfy8TMsxjITViUs
 pvyUEOhyDDweByUltMA71RPbb6sBRqVIc6dcgtWFiH6CINd7IGWOBQCBV
 gJE5cKl+DfOdyT/id+tejEDH8j96xYkbHXMMqdpOtvd8gU8j4L9MjQU/Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5536449"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5536449"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781855"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="827781855"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 09:11:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 18:11:30 +0200
Date: Mon, 18 Mar 2024 18:11:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v9 20/27] drm/connector: hdmi: Add Infoframes generation
Message-ID: <ZfhnsgYfwe_3mpWx@intel.com>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
 <20240311-kms-hdmi-connector-state-v9-20-d45890323344@kernel.org>
 <ZfQFLR2xO6vUpAJ9@intel.com>
 <20240318-abstract-myna-of-exercise-adfcde@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318-abstract-myna-of-exercise-adfcde@houat>
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

On Mon, Mar 18, 2024 at 02:49:47PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Mar 15, 2024 at 10:22:05AM +0200, Ville Syrjälä wrote:
> > On Mon, Mar 11, 2024 at 03:49:48PM +0100, Maxime Ripard wrote:
> > > Infoframes in KMS is usually handled by a bunch of low-level helpers
> > > that require quite some boilerplate for drivers. This leads to
> > > discrepancies with how drivers generate them, and which are actually
> > > sent.
> > > 
> > > Now that we have everything needed to generate them in the HDMI
> > > connector state, we can generate them in our common logic so that
> > > drivers can simply reuse what we precomputed.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/Kconfig                            |   1 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c          | 323 +++++++++++++++++++++
> > >  drivers/gpu/drm/drm_connector.c                    |  14 +
> > >  .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
> > >  drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
> > >  include/drm/drm_atomic_state_helper.h              |   8 +
> > >  include/drm/drm_connector.h                        | 133 +++++++++
> > >  7 files changed, 492 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index 872edb47bb53..ad9c467e20ce 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
> > >  	  If in doubt, say "N".
> > >  
> > >  config DRM_KMS_HELPER
> > >  	tristate
> > >  	depends on DRM
> > > +	select DRM_DISPLAY_HDMI_HELPER
> > >  	help
> > >  	  CRTC helpers for KMS drivers.
> > >  
> > >  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > >          bool "Enable refcount backtrace history in the DP MST helpers"
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index e66272c0d006..2bf53666fc9d 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -36,10 +36,12 @@
> > >  #include <drm/drm_plane.h>
> > >  #include <drm/drm_print.h>
> > >  #include <drm/drm_vblank.h>
> > >  #include <drm/drm_writeback.h>
> > >  
> > > +#include <drm/display/drm_hdmi_helper.h>
> > > +
> > >  #include <linux/slab.h>
> > >  #include <linux/dma-fence.h>
> > >  
> > >  /**
> > >   * DOC: atomic state reset and initialization
> > > @@ -912,10 +914,143 @@ hdmi_compute_config(const struct drm_connector *connector,
> > >  	}
> > >  
> > >  	return -EINVAL;
> > >  }
> > >  
> > > +static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
> > > +				       struct drm_connector_state *state)
> > > +{
> > > +	const struct drm_display_mode *mode =
> > > +		connector_state_get_mode(state);
> > > +	struct drm_connector_hdmi_infoframe *infoframe =
> > > +		&state->hdmi.infoframes.avi;
> > > +	struct hdmi_avi_infoframe *frame =
> > > +		&infoframe->data.avi;
> > > +	bool is_full_range = state->hdmi.is_full_range;
> > > +	enum hdmi_quantization_range rgb_quant_range =
> > > +		is_full_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
> > > +	int ret;
> > > +
> > > +	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	frame->colorspace = state->hdmi.output_format;
> > > +
> > > +	drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
> > 
> > drm_hdmi_avi_infoframe_quant_range() doesn't handle YCbCr currently.
> 
> I guess it's not really a problem anymore if we drop YUV422 selection,
> but I'll add a comment.
> 
> > > +	drm_hdmi_avi_infoframe_colorimetry(frame, state);
> > > +	drm_hdmi_avi_infoframe_bars(frame, state);
> > > +
> > > +	infoframe->set = true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > <snip>
> > > +
> > > +#define UPDATE_INFOFRAME(c, os, ns, i)				\
> > > +	write_or_clear_infoframe(c,				\
> > > +				 &(c)->hdmi.infoframes.i,	\
> > > +				 &(os)->hdmi.infoframes.i,	\
> > > +				 &(ns)->hdmi.infoframes.i)
> > 
> > This macro feels like pointless obfuscation to me.
> 
> I'll remove it then.
> 
> > <snip>
> > > @@ -1984,20 +2063,73 @@ struct drm_connector {
> > >  
> > >  	/**
> > >  	 * @hdmi: HDMI-related variable and properties.
> > >  	 */
> > >  	struct {
> > > +#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
> > > +		/**
> > > +		 * @vendor: HDMI Controller Vendor Name
> > > +		 */
> > > +		unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
> > > +
> > > +#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
> > > +		/**
> > > +		 * @product: HDMI Controller Product Name
> > > +		 */
> > > +		unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
> > > +
> > >  		/**
> > >  		 * @supported_formats: Bitmask of @hdmi_colorspace
> > >  		 * supported by the controller.
> > >  		 */
> > >  		unsigned long supported_formats;
> > >  
> > >  		/**
> > >  		 * @funcs: HDMI connector Control Functions
> > >  		 */
> > >  		const struct drm_connector_hdmi_funcs *funcs;
> > > +
> > > +		/**
> > > +		 * @infoframes: Current Infoframes output by the connector
> > > +		 */
> > > +		struct {
> > > +			/**
> > > +			 * @lock: Mutex protecting against concurrent access to
> > > +			 * the infoframes, most notably between KMS and ALSA.
> > > +			 */
> > > +			struct mutex lock;
> > > +
> > > +			/**
> > > +			 * @audio: Current Audio Infoframes structure. Protected
> > > +			 * by @lock.
> > > +			 */
> > > +			struct drm_connector_hdmi_infoframe audio;
> > > +
> > > +			/**
> > > +			 * @avi: Current AVI Infoframes structure. Protected by
> > > +			 * @lock.
> > > +			 */
> > > +			struct drm_connector_hdmi_infoframe avi;
> > > +
> > > +			/**
> > > +			 * @hdr_drm: Current DRM (Dynamic Range and Mastering)
> > > +			 * Infoframes structure. Protected by @lock.
> > > +			 */
> > > +			struct drm_connector_hdmi_infoframe hdr_drm;
> > > +
> > > +			/**
> > > +			 * @spd: Current SPD Infoframes structure. Protected by
> > > +			 * @lock.
> > > +			 */
> > > +			struct drm_connector_hdmi_infoframe spd;
> > > +
> > > +			/**
> > > +			 * @vendor: Current HDMI Vendor Infoframes structure.
> > > +			 * Protected by @lock.
> > > +			 */
> > > +			struct drm_connector_hdmi_infoframe hdmi;
> > > +		} infoframes;
> > >  	} hdmi;
> > 
> > What's the deal with this bloat? These are already tracked in the
> > connector's state so this looks entirely redundant.
> 
> The next patch in this series is about adding debugfs entries to read
> the infoframes, and thus we need to care about concurrency between
> debugfs files accesses and commits. Copying the things we care about
> from the state to the entity is the typical solution for that, but I
> guess we could also take the proper locks and access the current
> connector state.

Yeah, just lock and dump the latest state. That is the only thing
that should of interest to anyone in userspace.

Also are you actually adding some kind of ad-hoc state dump things
just for these? Why not do whatever is needed to include them in
the normal .atomic_state_print() stuff?

-- 
Ville Syrjälä
Intel
