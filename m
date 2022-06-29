Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98473560149
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8510EF81;
	Wed, 29 Jun 2022 13:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAB110ECC2;
 Wed, 29 Jun 2022 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656509441; x=1688045441;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jG00zai/N7F5DdwFDb28+o4sLG0VcDGg5Q5uR0sGKiw=;
 b=hNwxqodPVVaoFbit7oysAY+v+8Y89aXy6qHhlkHQGJtPbKkm18ewv7Sr
 OekNoi8SXkhI2Vq60JsJj8MugR9oZMNh/r/PvMUUIZPn9VE/ONN+L+ZZu
 QeJW/Li1T6Z0+PzniEVNAvCKLLgdXlNdWX+VVwB7cJjj6cLPlLqzjnggh
 6aXkOtG3DRWYQFqLC5HsCtKYJ6dwRDFtRTDxBplN9ipWqhJw52gVFW7ej
 f7AaPI6MVRlTDRYklBprw0F77/+ACxO3IOIywZs4p8nCfLUhGb5FPjJXW
 4EE+s/ZCqxsQaB4HRYvsvsSKZs36g17up/tBsN1AoroSbJCnUp4WI/YrA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="270793824"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="270793824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:30:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647395129"
Received: from clauter-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.48.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:30:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [RESEND RFC 08/18] drm/display/dp_mst: Add nonblocking helpers
 for DP MST
In-Reply-To: <20220607192933.1333228-9-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-9-lyude@redhat.com>
Date: Wed, 29 Jun 2022 16:30:28 +0300
Message-ID: <87r137ppfv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "open
 list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jude Shih <shenshih@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Jun 2022, Lyude Paul <lyude@redhat.com> wrote:
> As Daniel Vetter pointed out, if we only use the atomic modesetting locks
> with MST it's technically possible for a driver with non-blocking modesets
> to race when it comes to MST displays - as we make the mistake of not doi=
ng
> our own CRTC commit tracking in the topology_state object.
>
> This could potentially cause problems if something like this happens:
>
> * User starts non-blocking commit to disable CRTC-1 on MST topology 1
> * User starts non-blocking commit to enable CRTC-2 on MST topology 1
>
> There's no guarantee here that the commit for disabling CRTC-2 will only
> occur after CRTC-1 has finished, since neither commit shares a CRTC - only
> the private modesetting object for MST. Keep in mind this likely isn't a
> problem for blocking modesets, only non-blocking.
>
> So, begin fixing this by keeping track of which CRTCs on a topology have
> changed by keeping track of which CRTCs we release or allocate timeslots
> on. As well, add some helpers for:
>
> * Setting up the drm_crtc_commit structs in the ->commit_setup hook
> * Waiting for any CRTC dependencies from the previous topology state
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 93 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c  | 11 +++
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++
>  include/drm/display/drm_dp_mst_helper.h       | 15 +++
>  5 files changed, 139 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f84a4ad736d8..d9c7393ef151 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -211,6 +211,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *=
dev,
>  static int amdgpu_dm_connector_get_modes(struct drm_connector *connector=
);
>=20=20
>  static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state);
> +static int amdgpu_dm_atomic_setup_commit(struct drm_atomic_state *state);
>=20=20
>  static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  				  struct drm_atomic_state *state);
> @@ -2808,7 +2809,8 @@ static const struct drm_mode_config_funcs amdgpu_dm=
_mode_funcs =3D {
>  };
>=20=20
>  static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperf=
uncs =3D {
> -	.atomic_commit_tail =3D amdgpu_dm_atomic_commit_tail
> +	.atomic_commit_tail =3D amdgpu_dm_atomic_commit_tail,
> +	.atomic_commit_setup =3D amdgpu_dm_atomic_setup_commit,
>  };
>=20=20
>  static void update_connector_ext_caps(struct amdgpu_dm_connector *aconne=
ctor)
> @@ -9558,6 +9560,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm=
_atomic_state *state)
>  		DRM_ERROR("Waiting for fences timed out!");
>=20=20
>  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
>=20=20
>  	dm_state =3D dm_atomic_get_new_state(state);
>  	if (dm_state && dm_state->context) {
> @@ -9958,6 +9961,10 @@ static void amdgpu_dm_atomic_commit_tail(struct dr=
m_atomic_state *state)
>  		dc_release_state(dc_state_temp);
>  }
>=20=20
> +static int amdgpu_dm_atomic_setup_commit(struct drm_atomic_state *state)
> +{
> +	return drm_dp_mst_atomic_setup_commit(state);
> +}

I guess all the driver specific wrappers for setup commit could be
dropped in favor of directly using drm_dp_mst_atomic_setup_commit?

BR,
Jani.

>=20=20
>  static int dm_force_atomic_commit(struct drm_connector *connector)
>  {
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 0bc2c7a90c37..a0ed29f83556 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4395,12 +4395,16 @@ int drm_dp_atomic_find_time_slots(struct drm_atom=
ic_state *state,
>  {
>  	struct drm_dp_mst_topology_state *topology_state;
>  	struct drm_dp_mst_atomic_payload *payload =3D NULL;
> +	struct drm_connector_state *conn_state;
>  	int prev_slots =3D 0, prev_bw =3D 0, req_slots;
>=20=20
>  	topology_state =3D drm_atomic_get_mst_topology_state(state, mgr);
>  	if (IS_ERR(topology_state))
>  		return PTR_ERR(topology_state);
>=20=20
> +	conn_state =3D drm_atomic_get_new_connector_state(state, port->connecto=
r);
> +	topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->crtc);
> +
>  	/* Find the current allocation for this port, if any */
>  	payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
>  	if (payload) {
> @@ -4480,11 +4484,15 @@ int drm_dp_atomic_release_time_slots(struct drm_a=
tomic_state *state,
>  {
>  	struct drm_dp_mst_topology_state *topology_state;
>  	struct drm_dp_mst_atomic_payload *payload;
> +	struct drm_connector_state *conn_state;
>=20=20
>  	topology_state =3D drm_atomic_get_mst_topology_state(state, mgr);
>  	if (IS_ERR(topology_state))
>  		return PTR_ERR(topology_state);
>=20=20
> +	conn_state =3D drm_atomic_get_old_connector_state(state, port->connecto=
r);
> +	topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->crtc);
> +
>  	payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
>  	if (WARN_ON(!payload)) {
>  		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\=
n",
> @@ -4503,6 +4511,83 @@ int drm_dp_atomic_release_time_slots(struct drm_at=
omic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_time_slots);
>=20=20
> +/**
> + * drm_dp_mst_atomic_setup_commit() - setup_commit hook for MST helpers
> + * @state: global atomic state
> + *
> + * This function saves all of the &drm_crtc_commit structs in an atomic =
state that touch any CRTCs
> + * currently assigned to an MST topology. Drivers must call this hook fr=
om their
> + * &drm_mode_config_helper_funcs.atomic_commit_setup hook.
> + *
> + * Returns:
> + * 0 if all CRTC commits were retrieved successfully, negative error cod=
e otherwise
> + */
> +int drm_dp_mst_atomic_setup_commit(struct drm_atomic_state *state)
> +{
> +	struct drm_dp_mst_topology_mgr *mgr;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	int i, j, commit_idx, num_commit_deps;
> +
> +	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +		if (!mst_state->pending_crtc_mask)
> +			continue;
> +
> +		num_commit_deps =3D hweight32(mst_state->pending_crtc_mask);
> +		mst_state->commit_deps =3D kmalloc_array(num_commit_deps,
> +						       sizeof(*mst_state->commit_deps), GFP_KERNEL);
> +		if (!mst_state->commit_deps)
> +			return -ENOMEM;
> +		mst_state->num_commit_deps =3D num_commit_deps;
> +
> +		commit_idx =3D 0;
> +		for_each_new_crtc_in_state(state, crtc, crtc_state, j) {
> +			if (mst_state->pending_crtc_mask & drm_crtc_mask(crtc)) {
> +				mst_state->commit_deps[commit_idx++] =3D
> +					drm_crtc_commit_get(crtc_state->commit);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
> +
> +/**
> + * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending comm=
its on MST topologies
> + * @state: global atomic state
> + *
> + * Goes through any MST topologies in this atomic state, and waits for a=
ny pending commits which
> + * touched CRTCs that were/are on an MST topology to be programmed to ha=
rdware and flipped to before
> + * returning. This is to prevent multiple non-blocking commits affecting=
 an MST topology from racing
> + * with eachother by forcing them to be executed sequentially in situati=
ons where the only resources
> + * the modeset objects in these commits share are an MST topology.
> + *
> + * This function also prepares the new MST state for commit by performin=
g some state preparation
> + * which can't be done until this point, such as reading back the final =
VC start slots (which are
> + * determined at commit-time) from the previous state.
> + *
> + * All MST drivers must call this function after calling drm_atomic_help=
er_wait_for_dependencies(),
> + * or whatever their equivalent of that is.
> + */
> +void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *st=
ate)
> +{
> +	struct drm_dp_mst_topology_state *old_mst_state;
> +	struct drm_dp_mst_topology_mgr *mgr;
> +	int i, j, ret;
> +
> +	for_each_old_mst_mgr_in_state(state, mgr, old_mst_state, i) {
> +		for (j =3D 0; j < old_mst_state->num_commit_deps; j++) {
> +			ret =3D drm_crtc_commit_wait(old_mst_state->commit_deps[j]);
> +			if (ret < 0)
> +				drm_err(state->dev, "Failed to wait for %s: %d\n",
> +					old_mst_state->commit_deps[j]->crtc->name, ret);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_mst_atomic_wait_for_dependencies);
> +
>  /**
>   * drm_dp_mst_update_slots() - updates the slot info depending on the DP=
 ecoding format
>   * @mst_state: mst_state to update
> @@ -5079,6 +5164,9 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *=
obj)
>  	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
>=20=20
>  	INIT_LIST_HEAD(&state->payloads);
> +	state->commit_deps =3D NULL;
> +	state->num_commit_deps =3D 0;
> +	state->pending_crtc_mask =3D 0;
>=20=20
>  	list_for_each_entry(pos, &old_state->payloads, next) {
>  		/* Prune leftover freed timeslot allocations */
> @@ -5111,6 +5199,7 @@ static void drm_dp_mst_destroy_state(struct drm_pri=
vate_obj *obj,
>  	struct drm_dp_mst_topology_state *mst_state =3D
>  		to_dp_mst_topology_state(state);
>  	struct drm_dp_mst_atomic_payload *pos, *tmp;
> +	int i;
>=20=20
>  	list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
>  		/* We only keep references to ports with non-zero VCPIs */
> @@ -5119,6 +5208,10 @@ static void drm_dp_mst_destroy_state(struct drm_pr=
ivate_obj *obj,
>  		kfree(pos);
>  	}
>=20=20
> +	for (i =3D 0; i < mst_state->num_commit_deps; i++)
> +		drm_crtc_commit_put(mst_state->commit_deps[i]);
> +
> +	kfree(mst_state->commit_deps);
>  	kfree(mst_state);
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 186b37925d23..5475f66c0ed8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8446,6 +8446,7 @@ static void intel_atomic_commit_tail(struct intel_a=
tomic_state *state)
>  	intel_atomic_commit_fence_wait(state);
>=20=20
>  	drm_atomic_helper_wait_for_dependencies(&state->base);
> +	drm_dp_mst_atomic_wait_for_dependencies(&state->base);
>=20=20
>  	if (state->modeset)
>  		wakeref =3D intel_display_power_get(dev_priv, POWER_DOMAIN_MODESET);
> @@ -9514,6 +9515,15 @@ static int intel_initial_commit(struct drm_device =
*dev)
>  	return ret;
>  }
>=20=20
> +static int intel_atomic_commit_setup(struct drm_atomic_state *state)
> +{
> +	return drm_dp_mst_atomic_setup_commit(state);
> +}
> +
> +static const struct drm_mode_config_helper_funcs intel_mode_config_funcs=
 =3D {
> +	.atomic_commit_setup =3D intel_atomic_commit_setup,
> +};
> +
>  static void intel_mode_config_init(struct drm_i915_private *i915)
>  {
>  	struct drm_mode_config *mode_config =3D &i915->drm.mode_config;
> @@ -9528,6 +9538,7 @@ static void intel_mode_config_init(struct drm_i915_=
private *i915)
>  	mode_config->prefer_shadow =3D 1;
>=20=20
>  	mode_config->funcs =3D &intel_mode_funcs;
> +	mode_config->helper_private =3D &intel_mode_config_funcs;
>=20=20
>  	mode_config->async_page_flip =3D HAS_ASYNC_FLIPS(i915);
>=20=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 631dba5a2418..768312607fdb 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2134,6 +2134,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_stat=
e *state)
>  	nv50_crc_atomic_stop_reporting(state);
>  	drm_atomic_helper_wait_for_fences(dev, state, false);
>  	drm_atomic_helper_wait_for_dependencies(state);
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
>  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
>  	drm_atomic_helper_calc_timestamping_constants(state);
>=20=20
> @@ -2614,6 +2615,16 @@ nv50_disp_func =3D {
>  	.atomic_state_free =3D nv50_disp_atomic_state_free,
>  };
>=20=20
> +static int nv50_disp_atomic_setup_commit(struct drm_atomic_state *state)
> +{
> +	return drm_dp_mst_atomic_setup_commit(state);
> +}
> +
> +static const struct drm_mode_config_helper_funcs
> +nv50_disp_helper_func =3D {
> +	.atomic_commit_setup =3D nv50_disp_atomic_setup_commit,
> +};
> +
>  /***********************************************************************=
*******
>   * Init
>   ***********************************************************************=
******/
> @@ -2713,6 +2724,7 @@ nv50_display_create(struct drm_device *dev)
>  	nouveau_display(dev)->fini =3D nv50_display_fini;
>  	disp->disp =3D &nouveau_display(dev)->disp;
>  	dev->mode_config.funcs =3D &nv50_disp_func;
> +	dev->mode_config.helper_private =3D &nv50_disp_helper_func;
>  	dev->mode_config.quirk_addfb_prefer_xbgr_30bpp =3D true;
>  	dev->mode_config.normalize_zpos =3D true;
>=20=20
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index eb0ea578b227..dd74afcee888 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -576,6 +576,19 @@ struct drm_dp_mst_topology_state {
>  	/** @mgr: The topology manager */
>  	struct drm_dp_mst_topology_mgr *mgr;
>=20=20
> +	/**
> +	 * @pending_crtc_mask: A bitmask of all CRTCs this topology state touch=
es, drivers may
> +	 * modify this to add additional dependencies if needed.
> +	 */
> +	u32 pending_crtc_mask;
> +	/**
> +	 * @commit_deps: A list of all CRTC commits affecting this topology, th=
is field isn't
> +	 * populated until drm_dp_mst_atomic_wait_for_dependencies() is called.
> +	 */
> +	struct drm_crtc_commit **commit_deps;
> +	/** @num_commit_deps: The number of CRTC commits in @commit_deps */
> +	size_t num_commit_deps;
> +
>  	/** @total_avail_slots: The total number of slots this topology can han=
dle (63 or 64) */
>  	u8 total_avail_slots;
>  	/** @start_slot: The first usable time slot in this topology (1 or 0) */
> @@ -885,6 +898,8 @@ int __must_check
>  drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  				 struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port);
> +void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *st=
ate);
> +int __must_check drm_dp_mst_atomic_setup_commit(struct drm_atomic_state =
*state);
>  int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port, bool power_up);
>  int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *=
mgr,

--=20
Jani Nikula, Intel Open Source Graphics Center
