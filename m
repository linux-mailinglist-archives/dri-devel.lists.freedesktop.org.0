Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD587142EE2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 16:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA036E9C5;
	Mon, 20 Jan 2020 15:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08446E9C3;
 Mon, 20 Jan 2020 15:38:14 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 07:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="244432839"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 20 Jan 2020 07:38:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 20 Jan 2020 17:38:04 +0200
Date: Mon, 20 Jan 2020 17:38:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH v3 03/22] drm: Add get_vblank_timestamp() to
 struct drm_crtc_funcs
Message-ID: <20200120153804.GX13686@intel.com>
References: <20200120082314.14756-1-tzimmermann@suse.de>
 <20200120082314.14756-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120082314.14756-4-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexandre.torgue@st.com, thellstrom@vmware.com, sean@poorly.run,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 mcoquelin.stm32@gmail.com, sunpeng.li@amd.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com, vincent.abriou@st.com,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 alexander.deucher@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 09:22:55AM +0100, Thomas Zimmermann wrote:
> The callback get_vblank_timestamp() is currently located in struct
> drm_driver, but really belongs into struct drm_crtc_funcs. Add an
> equivalent there. Driver will be converted in separate patches.
> =

> The default implementation is drm_calc_vbltimestamp_from_scanoutpos().
> The patch adds drm_crtc_vblank_helper_get_vblank_timestamp(), which is
> an implementation for the CRTC callback.
> =

> v3:
> 	* use refactored timestamp calculation to minimize duplicated code
> 	* do more checks for crtc !=3D NULL to support legacy drivers
> v2:
> 	* rename helper to drm_crtc_vblank_helper_get_vblank_timestamp()
> 	* replace drm_calc_vbltimestamp_from_scanoutpos() with
> 	  drm_crtc_vblank_helper_get_vblank_timestamp() in docs
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_vblank.c             | 74 +++++++++++++++++++++---
>  include/drm/drm_crtc.h                   | 46 ++++++++++++++-
>  include/drm/drm_modeset_helper_vtables.h |  4 +-
>  include/drm/drm_vblank.h                 | 16 +++--
>  4 files changed, 123 insertions(+), 17 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 7e962c29780c..fc297043e3ba 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -333,7 +333,9 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *c=
rtc)
>  	u64 vblank;
>  	unsigned long flags;
>  =

> -	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) && !dev->driver->get_vblank_tim=
estamp,
> +	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
> +		  !crtc->funcs->get_vblank_timestamp &&
> +		  !dev->driver->get_vblank_timestamp,
>  		  "This function requires support for accurate vblank timestamps.");
>  =

>  	spin_lock_irqsave(&dev->vblank_time_lock, flags);
> @@ -511,9 +513,9 @@ EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
>   *
>   * Calculate and store various constants which are later needed by vblan=
k and
>   * swap-completion timestamping, e.g, by
> - * drm_calc_vbltimestamp_from_scanoutpos(). They are derived from CRTC's=
 true
> - * scanout timing, so they take things like panel scaling or other adjus=
tments
> - * into account.
> + * drm_crtc_vblank_helper_get_vblank_timestamp(). They are derived from
> + * CRTC's true scanout timing, so they take things like panel scaling or
> + * other adjustments into account.
>   */
>  void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  				     const struct drm_display_mode *mode)
> @@ -577,8 +579,9 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>   *
>   * Implements calculation of exact vblank timestamps from given drm_disp=
lay_mode
>   * timings and current video scanout position of a CRTC. This can be dir=
ectly
> - * used as the &drm_driver.get_vblank_timestamp implementation of a kms =
driver
> - * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
> + * used as the &drm_crtc_funcs.get_vblank_timestamp implementation of a =
kms
> + * driver if &drm_crtc_helper_funcs.get_scanout_position or
> + * &drm_driver.get_scanout_position is implemented.
>   *
>   * The current implementation only handles standard video modes. For dou=
ble scan
>   * and interlaced modes the driver is supposed to adjust the hardware mo=
de
> @@ -774,6 +777,48 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
>  =

> +/**
> + * drm_crtc_vblank_helper_get_vblank_timestamp - precise vblank timestamp
> + *                                               helper
> + * @crtc: CRTC whose vblank timestamp to retrieve
> + * @max_error: Desired maximum allowable error in timestamps (nanosecs)
> + *             On return contains true maximum error of timestamp
> + * @vblank_time: Pointer to time which should receive the timestamp
> + * @in_vblank_irq:
> + *     True when called from drm_crtc_handle_vblank().  Some drivers
> + *     need to apply some workarounds for gpu-specific vblank irq quirks
> + *     if flag is set.
> + *
> + * Implements calculation of exact vblank timestamps from given drm_disp=
lay_mode
> + * timings and current video scanout position of a CRTC. This can be dir=
ectly
> + * used as the &drm_crtc_funcs.get_vblank_timestamp implementation of a =
kms
> + * driver if &drm_crtc_helper_funcs.get_scanout_position is implemented.
> + *
> + * The current implementation only handles standard video modes. For dou=
ble scan
> + * and interlaced modes the driver is supposed to adjust the hardware mo=
de
> + * (taken from &drm_crtc_state.adjusted mode for atomic modeset drivers)=
 to
> + * match the scanout position reported.
> + *
> + * Note that atomic drivers must call drm_calc_timestamping_constants() =
before
> + * enabling a CRTC. The atomic helpers already take care of that in
> + * drm_atomic_helper_update_legacy_modeset_state().
> + *
> + * Returns:
> + *
> + * Returns true on success, and false on failure, i.e. when no accurate
> + * timestamp could be acquired.
> + */
> +bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
> +						 int *max_error,
> +						 ktime_t *vblank_time,
> +						 bool in_vblank_irq)
> +{
> +	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
> +		crtc, max_error, vblank_time, in_vblank_irq,
> +		crtc->helper_private->get_scanout_position, NULL);
> +}
> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
> +
>  /**
>   * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
>   *                             vblank interval
> @@ -799,15 +844,22 @@ static bool
>  drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>  			  ktime_t *tvblank, bool in_vblank_irq)
>  {
> +	struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>  	bool ret =3D false;
>  =

>  	/* Define requested maximum error on timestamps (nanoseconds). */
>  	int max_error =3D (int) drm_timestamp_precision * 1000;
>  =

>  	/* Query driver if possible and precision timestamping enabled. */
> -	if (dev->driver->get_vblank_timestamp && (max_error > 0))
> +	if (crtc && crtc->funcs->get_vblank_timestamp && max_error > 0) {
> +		struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
> +
> +		ret =3D crtc->funcs->get_vblank_timestamp(crtc, &max_error,
> +							tvblank, in_vblank_irq);
> +	} else if (dev->driver->get_vblank_timestamp && max_error > 0) {
>  		ret =3D dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
>  							tvblank, in_vblank_irq);
> +	}
>  =

>  	/* GPU high precision timestamp query unsupported or failed.
>  	 * Return current monotonic/gettimeofday timestamp as best estimate.
> @@ -1790,9 +1842,11 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, =
void *data,
>  =

>  static void drm_handle_vblank_events(struct drm_device *dev, unsigned in=
t pipe)
>  {
> +	struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>  	struct drm_pending_vblank_event *e, *t;
>  	ktime_t now;
>  	u64 seq;
> +	bool high_prec;
>  =

>  	assert_spin_locked(&dev->event_lock);
>  =

> @@ -1812,8 +1866,10 @@ static void drm_handle_vblank_events(struct drm_de=
vice *dev, unsigned int pipe)
>  		send_vblank_event(dev, e, seq, now);
>  	}
>  =

> -	trace_drm_vblank_event(pipe, seq, now,
> -			dev->driver->get_vblank_timestamp !=3D NULL);
> +	high_prec =3D crtc && crtc->funcs->get_vblank_timestamp ||
> +		    dev->driver->get_vblank_timestamp;

I'm sure gcc will complain about the && vs. || here. Hmm, yeah looks
like quite a few gcc/sparse/checkpatch warnings in this series.

With some of the more important warns fixed patches 1-3 are
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
> +	trace_drm_vblank_event(pipe, seq, now, high_prec);
>  }
>  =

>  /**
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 5e9b15a0e8c5..db46abbbf4e7 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -867,6 +867,47 @@ struct drm_crtc_funcs {
>  	 * new drivers as the replacement of &drm_driver.disable_vblank hook.
>  	 */
>  	void (*disable_vblank)(struct drm_crtc *crtc);
> +
> +	/**
> +	 * @get_vblank_timestamp:
> +	 *
> +	 * Called by drm_get_last_vbltimestamp(). Should return a precise
> +	 * timestamp when the most recent vblank interval ended or will end.
> +	 *
> +	 * Specifically, the timestamp in @vblank_time should correspond as
> +	 * closely as possible to the time when the first video scanline of
> +	 * the video frame after the end of vblank will start scanning out,
> +	 * the time immediately after end of the vblank interval. If the
> +	 * @crtc is currently inside vblank, this will be a time in the future.
> +	 * If the @crtc is currently scanning out a frame, this will be the
> +	 * past start time of the current scanout. This is meant to adhere
> +	 * to the OpenML OML_sync_control extension specification.
> +	 *
> +	 * Parameters:
> +	 *
> +	 * crtc:
> +	 *     CRTC for which timestamp should be returned.
> +	 * max_error:
> +	 *     Maximum allowable timestamp error in nanoseconds.
> +	 *     Implementation should strive to provide timestamp
> +	 *     with an error of at most max_error nanoseconds.
> +	 *     Returns true upper bound on error for timestamp.
> +	 * vblank_time:
> +	 *     Target location for returned vblank timestamp.
> +	 * in_vblank_irq:
> +	 *     True when called from drm_crtc_handle_vblank().  Some drivers
> +	 *     need to apply some workarounds for gpu-specific vblank irq quirks
> +	 *     if flag is set.
> +	 *
> +	 * Returns:
> +	 *
> +	 * True on success, false on failure, which means the core should
> +	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().
> +	 */
> +	bool (*get_vblank_timestamp)(struct drm_crtc *crtc,
> +				     int *max_error,
> +				     ktime_t *vblank_time,
> +				     bool in_vblank_irq);
>  };
>  =

>  /**
> @@ -974,11 +1015,12 @@ struct drm_crtc {
>  	 * Programmed mode in hw, after adjustments for encoders, crtc, panel
>  	 * scaling etc. Should only be used by legacy drivers, for high
>  	 * precision vblank timestamps in
> -	 * drm_calc_vbltimestamp_from_scanoutpos().
> +	 * drm_crtc_vblank_helper_get_vblank_timestamp().
>  	 *
>  	 * Note that atomic drivers should not use this, but instead use
>  	 * &drm_crtc_state.adjusted_mode. And for high-precision timestamps
> -	 * drm_calc_vbltimestamp_from_scanoutpos() used &drm_vblank_crtc.hwmode,
> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() used
> +	 * &drm_vblank_crtc.hwmode,
>  	 * which is filled out by calling drm_calc_timestamping_constants().
>  	 */
>  	struct drm_display_mode hwmode;
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_m=
odeset_helper_vtables.h
> index e398512bfd5f..0afaf58da40d 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -459,8 +459,8 @@ struct drm_crtc_helper_funcs {
>  	 * Returns the current display scanout position from a CRTC and an
>  	 * optional accurate ktime_get() timestamp of when the position was
>  	 * measured. Note that this is a helper callback which is only used
> -	 * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
> -	 * @drm_driver.get_vblank_timestamp callback.
> +	 * if a driver uses drm_crtc_vblank_helper_get_vblank_timestamp()
> +	 * for the @drm_crtc_funcs.get_vblank_timestamp callback.
>  	 *
>  	 * Parameters:
>  	 *
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 1c84e99b3f4f..4bfffe990828 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -174,13 +174,13 @@ struct drm_vblank_crtc {
>  	unsigned int pipe;
>  	/**
>  	 * @framedur_ns: Frame/Field duration in ns, used by
> -	 * drm_calc_vbltimestamp_from_scanoutpos() and computed by
> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() and computed by
>  	 * drm_calc_timestamping_constants().
>  	 */
>  	int framedur_ns;
>  	/**
>  	 * @linedur_ns: Line duration in ns, used by
> -	 * drm_calc_vbltimestamp_from_scanoutpos() and computed by
> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() and computed by
>  	 * drm_calc_timestamping_constants().
>  	 */
>  	int linedur_ns;
> @@ -190,8 +190,8 @@ struct drm_vblank_crtc {
>  	 *
>  	 * Cache of the current hardware display mode. Only valid when @enabled
>  	 * is set. This is used by helpers like
> -	 * drm_calc_vbltimestamp_from_scanoutpos(). We can't just access the
> -	 * hardware mode by e.g. looking at &drm_crtc_state.adjusted_mode,
> +	 * drm_crtc_vblank_helper_get_vblank_timestamp(). We can't just access
> +	 * the hardware mode by e.g. looking at &drm_crtc_state.adjusted_mode,
>  	 * because that one is really hard to get from interrupt context.
>  	 */
>  	struct drm_display_mode hwmode;
> @@ -239,6 +239,10 @@ wait_queue_head_t *drm_crtc_vblank_waitqueue(struct =
drm_crtc *crtc);
>  void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>  				   u32 max_vblank_count);
>  =

> +/*
> + * Helpers for struct drm_crtc_funcs
> + */
> +
>  typedef bool (*drm_vblank_get_scanout_position_func)(struct drm_crtc *cr=
tc,
>  						     bool in_vblank_irq,
>  						     int *vpos, int *hpos,
> @@ -259,5 +263,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(=
struct drm_crtc *crtc,
>  						     bool in_vblank_irq,
>  						     drm_vblank_get_scanout_position_func get_scanout_position,
>  						     drm_vblank_get_scanout_position_legacy_func get_scanout_posit=
ion_legacy);
> +bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
> +						 int *max_error,
> +						 ktime_t *vblank_time,
> +						 bool in_vblank_irq);
>  =

>  #endif
> -- =

> 2.24.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
