Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C298340218
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EC56E8B8;
	Thu, 18 Mar 2021 09:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4576D6E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:33:02 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4F1MJV0TGqzFV;
 Thu, 18 Mar 2021 10:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1616059978; bh=40yQtqUk6OB6WNO5+EEEvp9Q3T5U2MxClWlqdMONUKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WBG6cvns8yTGsMV7Xw1j//stQexgeAQb+kErVz4xSFxgY9gyutYfIZYmCdZcK79P/
 NaQ0PZlB1zqyi+/N669EFIwyui0w3QTB9tmjeoBt1vd4oqGwnf5DhZARd1yJjnj2pB
 Y7kpL2IRmZIsL6s1sq7M5Azp4qGqOpqnD2sbryLWYItwkR/lkam+Zcow78FAIOv3nV
 +QHv9KFljoolhYvQsTt4lJ1DK6SwIcAbOLRlNeyxru3kkyFXVRpGXCoHZTj6VBexUn
 QDQDO2OAFCxtd587gfalRvxmikDG3Ys+UXVYfR+O/xmV88HL2+GqjzaWLSpTYM77w1
 AqKIVk5P31U0A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 18 Mar 2021 10:31:42 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v16 1/2] drm/tegra: dc: Support memory bandwidth management
Message-ID: <20210318093142.GB18038@qmqm.qmqm.pl>
References: <20210317185734.14661-1-digetx@gmail.com>
 <20210317185734.14661-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317185734.14661-2-digetx@gmail.com>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 09:57:33PM +0300, Dmitry Osipenko wrote:
[...]
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -8,6 +8,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/iommu.h>
> +#include <linux/interconnect.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> @@ -618,6 +619,9 @@ static int tegra_plane_atomic_check(struct drm_plane =
*plane,
>  	struct tegra_dc *dc =3D to_tegra_dc(new_plane_state->crtc);
>  	int err;
>  =

> +	plane_state->peak_memory_bandwidth =3D 0;
> +	plane_state->avg_memory_bandwidth =3D 0;
> +
>  	/* no need for further checks if the plane is being disabled */
>  	if (!new_plane_state->crtc)
>  		return 0;
> @@ -808,6 +812,12 @@ static struct drm_plane *tegra_primary_plane_create(=
struct drm_device *drm,
>  	formats =3D dc->soc->primary_formats;
>  	modifiers =3D dc->soc->modifiers;
>  =

> +	err =3D tegra_plane_interconnect_init(plane);
> +	if (err) {
> +		kfree(plane);
> +		return ERR_PTR(err);
> +	}
> +
>  	err =3D drm_universal_plane_init(drm, &plane->base, possible_crtcs,
>  				       &tegra_plane_funcs, formats,
>  				       num_formats, modifiers, type, NULL);
> @@ -841,9 +851,13 @@ static int tegra_cursor_atomic_check(struct drm_plan=
e *plane,
>  {
>  	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state,
>  										 plane);
> +	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(new_plan=
e_state);
>  	struct tegra_plane *tegra =3D to_tegra_plane(plane);
>  	int err;
>  =

> +	plane_state->peak_memory_bandwidth =3D 0;
> +	plane_state->avg_memory_bandwidth =3D 0;
> +
>  	/* no need for further checks if the plane is being disabled */
>  	if (!new_plane_state->crtc)
>  		return 0;
> @@ -985,6 +999,12 @@ static struct drm_plane *tegra_dc_cursor_plane_creat=
e(struct drm_device *drm,
>  	num_formats =3D ARRAY_SIZE(tegra_cursor_plane_formats);
>  	formats =3D tegra_cursor_plane_formats;
>  =

> +	err =3D tegra_plane_interconnect_init(plane);
> +	if (err) {
> +		kfree(plane);
> +		return ERR_PTR(err);
> +	}
> +
>  	err =3D drm_universal_plane_init(drm, &plane->base, possible_crtcs,
>  				       &tegra_plane_funcs, formats,
>  				       num_formats, NULL,
> @@ -1099,6 +1119,12 @@ static struct drm_plane *tegra_dc_overlay_plane_cr=
eate(struct drm_device *drm,
>  	num_formats =3D dc->soc->num_overlay_formats;
>  	formats =3D dc->soc->overlay_formats;
>  =

> +	err =3D tegra_plane_interconnect_init(plane);
> +	if (err) {
> +		kfree(plane);
> +		return ERR_PTR(err);
> +	}
> +
>  	if (!cursor)
>  		type =3D DRM_PLANE_TYPE_OVERLAY;
>  	else
> @@ -1216,6 +1242,7 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *=
crtc)
>  {
>  	struct tegra_dc_state *state =3D to_dc_state(crtc->state);
>  	struct tegra_dc_state *copy;
> +	unsigned int i;
>  =

>  	copy =3D kmalloc(sizeof(*copy), GFP_KERNEL);
>  	if (!copy)
> @@ -1227,6 +1254,9 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *=
crtc)
>  	copy->div =3D state->div;
>  	copy->planes =3D state->planes;
>  =

> +	for (i =3D 0; i < ARRAY_SIZE(state->plane_peak_bw); i++)
> +		copy->plane_peak_bw[i] =3D state->plane_peak_bw[i];
> +
>  	return &copy->base;
>  }
>  =

> @@ -1753,6 +1783,106 @@ static int tegra_dc_wait_idle(struct tegra_dc *dc=
, unsigned long timeout)
>  	return -ETIMEDOUT;
>  }
>  =

> +static void
> +tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state,
> +				   bool prepare_bandwidth_transition)
> +{
> +	const struct tegra_plane_state *old_tegra_state, *new_tegra_state;
> +	const struct tegra_dc_state *old_dc_state, *new_dc_state;
> +	u32 i, new_avg_bw, old_avg_bw, new_peak_bw, old_peak_bw;
> +	const struct drm_plane_state *old_plane_state;
> +	const struct drm_crtc_state *old_crtc_state;
> +	struct tegra_dc_window window, old_window;
> +	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> +	struct tegra_plane *tegra;
> +	struct drm_plane *plane;
> +
> +	if (dc->soc->has_nvdisplay)
> +		return;
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(state, crtc);
> +	old_dc_state =3D to_const_dc_state(old_crtc_state);
> +	new_dc_state =3D to_const_dc_state(crtc->state);
> +
> +	if (!crtc->state->active) {
> +		if (!old_crtc_state->active)
> +			return;
> +
> +		/*
> +		 * When CRTC is disabled on DPMS, the state of attached planes
> +		 * is kept unchanged. Hence we need to enforce removal of the
> +		 * bandwidths from the ICC paths.
> +		 */
> +		drm_atomic_crtc_for_each_plane(plane, crtc) {
> +			tegra =3D to_tegra_plane(plane);
> +
> +			icc_set_bw(tegra->icc_mem, 0, 0);
> +			icc_set_bw(tegra->icc_mem_vfilter, 0, 0);
> +		}
> +
> +		return;
> +	}
> +
> +	for_each_old_plane_in_state(old_crtc_state->state, plane,
> +				    old_plane_state, i) {
> +		old_tegra_state =3D to_const_tegra_plane_state(old_plane_state);
> +		new_tegra_state =3D to_const_tegra_plane_state(plane->state);
> +		tegra =3D to_tegra_plane(plane);
> +
> +		/*
> +		 * We're iterating over the global atomic state and it contains
> +		 * planes from another CRTC, hence we need to filter out the
> +		 * planes unrelated to this CRTC.
> +		 */
> +		if (tegra->dc !=3D dc)
> +			continue;
> +
> +		new_avg_bw =3D new_tegra_state->avg_memory_bandwidth;
> +		old_avg_bw =3D old_tegra_state->avg_memory_bandwidth;
> +
> +		new_peak_bw =3D new_dc_state->plane_peak_bw[tegra->index];
> +		old_peak_bw =3D old_dc_state->plane_peak_bw[tegra->index];
> +
> +		/*
> +		 * See the comment related to !crtc->state->active above,
> +		 * which explains why bandwidths need to be updated when
> +		 * CRTC is turning ON.
> +		 */
> +		if (new_avg_bw =3D=3D old_avg_bw && new_peak_bw =3D=3D old_peak_bw &&
> +		    old_crtc_state->active)
> +			continue;
> +
> +		window.src.h =3D drm_rect_height(&plane->state->src) >> 16;
> +		window.dst.h =3D drm_rect_height(&plane->state->dst);
> +
> +		old_window.src.h =3D drm_rect_height(&old_plane_state->src) >> 16;
> +		old_window.dst.h =3D drm_rect_height(&old_plane_state->dst);
> +
> +		/*
> +		 * During the preparation phase (atomic_begin), the memory
> +		 * freq should go high before the DC changes are committed
> +		 * if bandwidth requirement goes up, otherwise memory freq
> +		 * should to stay high if BW requirement goes down.  The
> +		 * opposite applies to the completion phase (post_commit).
> +		 */
> +		if (prepare_bandwidth_transition) {
> +			new_avg_bw =3D max(old_avg_bw, new_avg_bw);
> +			new_peak_bw =3D max(old_peak_bw, new_peak_bw);
> +
> +			if (tegra_plane_use_vertical_filtering(tegra, &old_window))
> +				window =3D old_window;
> +		}
> +
> +		icc_set_bw(tegra->icc_mem, new_avg_bw, new_peak_bw);
> +
> +		if (tegra_plane_use_vertical_filtering(tegra, &window))
> +			icc_set_bw(tegra->icc_mem_vfilter, new_avg_bw, new_peak_bw);
> +		else
> +			icc_set_bw(tegra->icc_mem_vfilter, 0, 0);
> +	}
> +}
> +
>  static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
>  				      struct drm_atomic_state *state)
>  {
> @@ -1934,6 +2064,8 @@ static void tegra_crtc_atomic_begin(struct drm_crtc=
 *crtc,
>  {
>  	unsigned long flags;
>  =

> +	tegra_crtc_update_memory_bandwidth(crtc, state, true);
> +
>  	if (crtc->state->event) {
>  		spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  =

> @@ -1966,7 +2098,215 @@ static void tegra_crtc_atomic_flush(struct drm_cr=
tc *crtc,
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>  }
>  =

> +static bool tegra_plane_is_cursor(const struct drm_plane_state *state)
> +{
> +	const struct tegra_dc_soc_info *soc =3D to_tegra_dc(state->crtc)->soc;
> +	const struct drm_format_info *fmt =3D state->fb->format;
> +	unsigned int src_w =3D drm_rect_width(&state->src) >> 16;
> +	unsigned int dst_w =3D drm_rect_width(&state->dst);
> +
> +	if (state->plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +		return false;
> +
> +	if (soc->supports_cursor)
> +		return true;
> +
> +	if (src_w !=3D dst_w || fmt->num_planes !=3D 1 || src_w * fmt->cpp[0] >=
 256)
> +		return false;
> +
> +	return true;
> +}
> +
> +static unsigned long
> +tegra_plane_overlap_mask(struct drm_crtc_state *state,
> +			 const struct drm_plane_state *plane_state)
> +{
> +	const struct drm_plane_state *other_state;
> +	const struct tegra_plane *tegra;
> +	unsigned long overlap_mask =3D 0;
> +	struct drm_plane *plane;
> +	struct drm_rect rect;
> +
> +	if (!plane_state->visible || !plane_state->fb)
> +		return 0;
> +
> +	/*
> +	 * Data-prefetch FIFO will easily help to overcome temporal memory
> +	 * pressure if other plane overlaps with the cursor plane.
> +	 */
> +	if (tegra_plane_is_cursor(plane_state))
> +		return 0;
> +
> +	drm_atomic_crtc_state_for_each_plane_state(plane, other_state, state) {
> +		rect =3D plane_state->dst;
> +
> +		tegra =3D to_tegra_plane(other_state->plane);
> +
> +		if (!other_state->visible || !other_state->fb)
> +			continue;
> +
> +		/*
> +		 * Ignore cursor plane overlaps because it's not practical to
> +		 * assume that it contributes to the bandwidth in overlapping
> +		 * area if window width is small.
> +		 */
> +		if (tegra_plane_is_cursor(other_state))
> +			continue;
> +
> +		if (drm_rect_intersect(&rect, &other_state->dst))
> +			overlap_mask |=3D BIT(tegra->index);
> +	}
> +
> +	return overlap_mask;
> +}
> +
> +static struct drm_plane *
> +tegra_crtc_get_plane_by_index(struct drm_crtc *crtc, unsigned int index)
> +{
> +	struct drm_plane *plane;
> +
> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
> +		if (to_tegra_plane(plane)->index =3D=3D index)
> +			return plane;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int tegra_crtc_calculate_memory_bandwidth(struct drm_crtc *crtc,
> +						 struct drm_atomic_state *state)
> +{
> +	ulong overlap_mask[TEGRA_DC_LEGACY_PLANES_NUM] =3D {}, mask;
> +	u32 plane_peak_bw[TEGRA_DC_LEGACY_PLANES_NUM] =3D {};
> +	bool all_planes_overlap_simultaneously =3D true;
> +	const struct tegra_plane_state *tegra_state;
> +	const struct drm_plane_state *plane_state;
> +	const struct tegra_dc_state *old_dc_state;
> +	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> +	const struct drm_crtc_state *old_state;
> +	struct tegra_dc_state *new_dc_state;
> +	struct drm_crtc_state *new_state;
> +	struct tegra_plane *tegra;
> +	struct drm_plane *plane;
> +	u32 i, k, overlap_bw;
> +
> +	/*
> +	 * The nv-display uses shared planes.  The algorithm below assumes
> +	 * maximum 3 planes per-CRTC, this assumption isn't applicable to
> +	 * the nv-display.  Note that T124 support has additional windows,
> +	 * but currently they aren't supported by the driver.
> +	 */
> +	if (dc->soc->has_nvdisplay)
> +		return 0;
> +
> +	new_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	new_dc_state =3D to_dc_state(new_state);
> +
> +	/*
> +	 * For overlapping planes pixel's data is fetched for each plane at
> +	 * the same time, hence bandwidths are accumulated in this case.
> +	 * This needs to be taken into account for calculating total bandwidth
> +	 * consumed by all planes.
> +	 *
> +	 * Here we get the overlapping state of each plane, which is a
> +	 * bitmask of plane indices telling with what planes there is an
> +	 * overlap. Note that bitmask[plane] includes BIT(plane) in order
> +	 * to make further code nicer and simpler.
> +	 */
> +	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, new_stat=
e) {
> +		tegra_state =3D to_const_tegra_plane_state(plane_state);
> +		tegra =3D to_tegra_plane(plane);
> +
> +		if (WARN_ON_ONCE(tegra->index >=3D TEGRA_DC_LEGACY_PLANES_NUM))
> +			return -EINVAL;
> +
> +		plane_peak_bw[tegra->index] =3D tegra_state->peak_memory_bandwidth;
> +		mask =3D tegra_plane_overlap_mask(new_state, plane_state);
> +		overlap_mask[tegra->index] =3D mask;
> +
> +		if (hweight_long(mask) !=3D 3)
> +			all_planes_overlap_simultaneously =3D false;
> +	}
> +
> +	old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
> +	old_dc_state =3D to_const_dc_state(old_state);
> +
> +	/*
> +	 * Then we calculate maximum bandwidth of each plane state.
> +	 * The bandwidth includes the plane BW + BW of the "simultaneously"
> +	 * overlapping planes, where "simultaneously" means areas where DC
> +	 * fetches from the planes simultaneously during of scan-out process.
> +	 *
> +	 * For example, if plane A overlaps with planes B and C, but B and C
> +	 * don't overlap, then the peak bandwidth will be either in area where
> +	 * A-and-B or A-and-C planes overlap.
> +	 *
> +	 * The plane_peak_bw[] contains peak memory bandwidth values of
> +	 * each plane, this information is needed by interconnect provider
> +	 * in order to set up latency allowness based on the peak BW, see
> +	 * tegra_crtc_update_memory_bandwidth().
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(plane_peak_bw); i++) {
> +		overlap_bw =3D 0;
> +
> +		for_each_set_bit(k, &overlap_mask[i], 3) {
> +			if (k =3D=3D i)
> +				continue;
> +
> +			if (all_planes_overlap_simultaneously)
> +				overlap_bw +=3D plane_peak_bw[k];
> +			else
> +				overlap_bw =3D max(overlap_bw, plane_peak_bw[k]);
> +		}
> +
> +		new_dc_state->plane_peak_bw[i] =3D plane_peak_bw[i] + overlap_bw;
> +
> +		/*
> +		 * If plane's peak bandwidth changed (for example plane isn't
> +		 * overlapped anymore) and plane isn't in the atomic state,
> +		 * then add plane to the state in order to have the bandwidth
> +		 * updated.
> +		 */
> +		if (old_dc_state->plane_peak_bw[i] !=3D
> +		    new_dc_state->plane_peak_bw[i]) {
> +			plane =3D tegra_crtc_get_plane_by_index(crtc, i);
> +			if (!plane)
> +				continue;
> +
> +			plane_state =3D drm_atomic_get_plane_state(state, plane);
> +			if (IS_ERR(plane_state))
> +				return PTR_ERR(plane_state);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	int err;
> +
> +	err =3D tegra_crtc_calculate_memory_bandwidth(crtc, state);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	/*
> +	 * Display bandwidth is allowed to go down only once hardware state
> +	 * is known to be armed, i.e. state was committed and VBLANK event
> +	 * received.
> +	 */
> +	tegra_crtc_update_memory_bandwidth(crtc, state, false);
> +}
> +
>  static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs =3D {
> +	.atomic_check =3D tegra_crtc_atomic_check,
>  	.atomic_begin =3D tegra_crtc_atomic_begin,
>  	.atomic_flush =3D tegra_crtc_atomic_flush,
>  	.atomic_enable =3D tegra_crtc_atomic_enable,
> @@ -2257,7 +2597,9 @@ static const struct tegra_dc_soc_info tegra20_dc_so=
c_info =3D {
>  	.overlay_formats =3D tegra20_overlay_formats,
>  	.modifiers =3D tegra20_modifiers,
>  	.has_win_a_without_filters =3D true,
> +	.has_win_b_vfilter_mem_client =3D true,
>  	.has_win_c_without_vert_filter =3D true,
> +	.plane_tiled_memory_bandwidth_x2 =3D false,
>  };
>  =

>  static const struct tegra_dc_soc_info tegra30_dc_soc_info =3D {
> @@ -2276,7 +2618,9 @@ static const struct tegra_dc_soc_info tegra30_dc_so=
c_info =3D {
>  	.overlay_formats =3D tegra20_overlay_formats,
>  	.modifiers =3D tegra20_modifiers,
>  	.has_win_a_without_filters =3D false,
> +	.has_win_b_vfilter_mem_client =3D true,
>  	.has_win_c_without_vert_filter =3D false,
> +	.plane_tiled_memory_bandwidth_x2 =3D true,
>  };
>  =

>  static const struct tegra_dc_soc_info tegra114_dc_soc_info =3D {
> @@ -2295,7 +2639,9 @@ static const struct tegra_dc_soc_info tegra114_dc_s=
oc_info =3D {
>  	.overlay_formats =3D tegra114_overlay_formats,
>  	.modifiers =3D tegra20_modifiers,
>  	.has_win_a_without_filters =3D false,
> +	.has_win_b_vfilter_mem_client =3D false,
>  	.has_win_c_without_vert_filter =3D false,
> +	.plane_tiled_memory_bandwidth_x2 =3D true,
>  };
>  =

>  static const struct tegra_dc_soc_info tegra124_dc_soc_info =3D {
> @@ -2314,7 +2660,9 @@ static const struct tegra_dc_soc_info tegra124_dc_s=
oc_info =3D {
>  	.overlay_formats =3D tegra124_overlay_formats,
>  	.modifiers =3D tegra124_modifiers,
>  	.has_win_a_without_filters =3D false,
> +	.has_win_b_vfilter_mem_client =3D false,
>  	.has_win_c_without_vert_filter =3D false,
> +	.plane_tiled_memory_bandwidth_x2 =3D false,
>  };
>  =

>  static const struct tegra_dc_soc_info tegra210_dc_soc_info =3D {
> @@ -2333,7 +2681,9 @@ static const struct tegra_dc_soc_info tegra210_dc_s=
oc_info =3D {
>  	.overlay_formats =3D tegra114_overlay_formats,
>  	.modifiers =3D tegra124_modifiers,
>  	.has_win_a_without_filters =3D false,
> +	.has_win_b_vfilter_mem_client =3D false,
>  	.has_win_c_without_vert_filter =3D false,
> +	.plane_tiled_memory_bandwidth_x2 =3D false,
>  };
>  =

>  static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] =3D {
> @@ -2382,6 +2732,7 @@ static const struct tegra_dc_soc_info tegra186_dc_s=
oc_info =3D {
>  	.has_nvdisplay =3D true,
>  	.wgrps =3D tegra186_dc_wgrps,
>  	.num_wgrps =3D ARRAY_SIZE(tegra186_dc_wgrps),
> +	.plane_tiled_memory_bandwidth_x2 =3D false,
>  };
>  =

>  static const struct tegra_windowgroup_soc tegra194_dc_wgrps[] =3D {
> @@ -2430,6 +2781,7 @@ static const struct tegra_dc_soc_info tegra194_dc_s=
oc_info =3D {
>  	.has_nvdisplay =3D true,
>  	.wgrps =3D tegra194_dc_wgrps,
>  	.num_wgrps =3D ARRAY_SIZE(tegra194_dc_wgrps),
> +	.plane_tiled_memory_bandwidth_x2 =3D false,
>  };

For globals you will have .x =3D false by default; I'm not sure those entri=
es
add much value.

Reviewed-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
