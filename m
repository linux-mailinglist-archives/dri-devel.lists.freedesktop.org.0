Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DE56012F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D5112060;
	Wed, 29 Jun 2022 13:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E7C10E1F4;
 Wed, 29 Jun 2022 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656508939; x=1688044939;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ka0Ii+O+Ss9C7HOlOsdx18EcmVCdM4z6UbEW3x+fZTQ=;
 b=mptVg3gGOOxLguV1LAEHJC2mOEMO5JbGNPbVvwjn0ag6UaLAIo07WkZ0
 eTAAKanwRrM2l26QPwuPOCmjGlvMYgRQu46E9YDM2xpIlamAuK1vUYon9
 wfJoCLVcuEgLJOdEtxPw6zGKWx5vPcpX6kZ6xfIMr2LmUd2co2wrcFB05
 dQegkPuT7LVATu6+RaeRyVk0A/BKkcFbS7rH/zR4xw5REjXEOfsCFQc2v
 mqkn7sbtNY5tT5A76xRhC67K9IEUF2OM3grBZySTSUQdDo9mZjL8bD9PE
 hHuVXjQH9CAb89hlIguF0Z4BUSJdjlcx/ia+y12SPue+7xViy/ioulign w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="265066699"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="265066699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:22:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="917599257"
Received: from clauter-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.48.175])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:22:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [RESEND RFC 07/18] drm/display/dp_mst: Add helper for finding
 payloads in atomic MST state
In-Reply-To: <20220607192933.1333228-8-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-8-lyude@redhat.com>
Date: Wed, 29 Jun 2022 16:22:07 +0300
Message-ID: <87v8sjppts.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Jun 2022, Lyude Paul <lyude@redhat.com> wrote:
> We already open-code this quite often, and will be iterating through
> payloads even more once we've moved all of the payload tracking into the
> atomic state. So, let's add a helper for doing this.
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
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 109 ++++++++----------
>  1 file changed, 45 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index ec52f91b1f0e..0bc2c7a90c37 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -1737,6 +1737,19 @@ drm_dp_mst_dump_port_topology_history(struct drm_d=
p_mst_port *port) {}
>  #define save_port_topology_ref(port, type)
>  #endif
>=20=20
> +static struct drm_dp_mst_atomic_payload *
> +drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
> +				 struct drm_dp_mst_port *port)
> +{
> +	struct drm_dp_mst_atomic_payload *payload;
> +
> +	list_for_each_entry(payload, &state->payloads, next)
> +		if (payload->port =3D=3D port)
> +			return payload;
> +
> +	return NULL;
> +}
> +
>  static void drm_dp_destroy_mst_branch_device(struct kref *kref)
>  {
>  	struct drm_dp_mst_branch *mstb =3D
> @@ -4381,39 +4394,31 @@ int drm_dp_atomic_find_time_slots(struct drm_atom=
ic_state *state,
>  				  int pbn_div)
>  {
>  	struct drm_dp_mst_topology_state *topology_state;
> -	struct drm_dp_mst_atomic_payload *pos, *payload =3D NULL;
> -	int prev_slots, prev_bw, req_slots;
> +	struct drm_dp_mst_atomic_payload *payload =3D NULL;
> +	int prev_slots =3D 0, prev_bw =3D 0, req_slots;
>=20=20
>  	topology_state =3D drm_atomic_get_mst_topology_state(state, mgr);
>  	if (IS_ERR(topology_state))
>  		return PTR_ERR(topology_state);
>=20=20
>  	/* Find the current allocation for this port, if any */
> -	list_for_each_entry(pos, &topology_state->payloads, next) {
> -		if (pos->port =3D=3D port) {
> -			payload =3D pos;
> -			prev_slots =3D payload->time_slots;
> -			prev_bw =3D payload->pbn;
> -
> -			/*
> -			 * This should never happen, unless the driver tries
> -			 * releasing and allocating the same timeslot allocation,
> -			 * which is an error
> -			 */
> -			if (WARN_ON(!prev_slots)) {
> -				drm_err(mgr->dev,
> -					"cannot allocate and release time slots on [MST PORT:%p] in the sam=
e state\n",
> -					port);
> -				return -EINVAL;
> -			}
> +	payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
> +	if (payload) {
> +		prev_slots =3D payload->time_slots;
> +		prev_bw =3D payload->pbn;
>=20=20
> -			break;
> +		/*
> +		 * This should never happen, unless the driver tries
> +		 * releasing and allocating the same timeslot allocation,
> +		 * which is an error
> +		 */
> +		if (WARN_ON(!prev_slots)) {
> +			drm_err(mgr->dev,
> +				"cannot allocate and release time slots on [MST PORT:%p] in the same=
 state\n",
> +				port);

I guess I'd combine the WARN_ON() and drm_err() to a single
drm_WARN(). Having both is a silly. But can be a follow-up, not part of
this patch really.


> +			return -EINVAL;
>  		}
>  	}
> -	if (!payload) {
> -		prev_slots =3D 0;
> -		prev_bw =3D 0;
> -	}
>=20=20
>  	if (pbn_div <=3D 0)
>  		pbn_div =3D mgr->pbn_div;
> @@ -4474,30 +4479,24 @@ int drm_dp_atomic_release_time_slots(struct drm_a=
tomic_state *state,
>  				     struct drm_dp_mst_port *port)
>  {
>  	struct drm_dp_mst_topology_state *topology_state;
> -	struct drm_dp_mst_atomic_payload *pos;
> -	bool found =3D false;
> +	struct drm_dp_mst_atomic_payload *payload;
>=20=20
>  	topology_state =3D drm_atomic_get_mst_topology_state(state, mgr);
>  	if (IS_ERR(topology_state))
>  		return PTR_ERR(topology_state);
>=20=20
> -	list_for_each_entry(pos, &topology_state->payloads, next) {
> -		if (pos->port =3D=3D port) {
> -			found =3D true;
> -			break;
> -		}
> -	}
> -	if (WARN_ON(!found)) {
> +	payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
> +	if (WARN_ON(!payload)) {
>  		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\=
n",
>  			port, &topology_state->base);

Ditto.

BR,
Jani.

>  		return -EINVAL;
>  	}
>=20=20
> -	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, pos->time_=
slots);
> -	if (pos->time_slots) {
> +	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->t=
ime_slots);
> +	if (payload->time_slots) {
>  		drm_dp_mst_put_port_malloc(port);
> -		pos->time_slots =3D 0;
> -		pos->pbn =3D 0;
> +		payload->time_slots =3D 0;
> +		payload->pbn =3D 0;
>  	}
>=20=20
>  	return 0;
> @@ -5194,18 +5193,8 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_d=
p_mst_port *port,
>  		return 0;
>=20=20
>  	if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> -		bool found =3D false;
> -
> -		list_for_each_entry(payload, &state->payloads, next) {
> -			if (payload->port !=3D port)
> -				continue;
> -			if (!payload->pbn)
> -				return 0;
> -
> -			found =3D true;
> -			break;
> -		}
> -		if (!found)
> +		payload =3D drm_atomic_get_mst_payload_state(state, port);
> +		if (!payload)
>  			return 0;
>=20=20
>  		/*
> @@ -5360,34 +5349,26 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomi=
c_state *state,
>  				 bool enable)
>  {
>  	struct drm_dp_mst_topology_state *mst_state;
> -	struct drm_dp_mst_atomic_payload *pos;
> -	bool found =3D false;
> +	struct drm_dp_mst_atomic_payload *payload;
>  	int time_slots =3D 0;
>=20=20
>  	mst_state =3D drm_atomic_get_mst_topology_state(state, port->mgr);
> -
>  	if (IS_ERR(mst_state))
>  		return PTR_ERR(mst_state);
>=20=20
> -	list_for_each_entry(pos, &mst_state->payloads, next) {
> -		if (pos->port =3D=3D port) {
> -			found =3D true;
> -			break;
> -		}
> -	}
> -
> -	if (!found) {
> +	payload =3D drm_atomic_get_mst_payload_state(mst_state, port);
> +	if (!payload) {
>  		drm_dbg_atomic(state->dev,
>  			       "[MST PORT:%p] Couldn't find payload in mst state %p\n",
>  			       port, mst_state);
>  		return -EINVAL;
>  	}
>=20=20
> -	if (pos->dsc_enabled =3D=3D enable) {
> +	if (payload->dsc_enabled =3D=3D enable) {
>  		drm_dbg_atomic(state->dev,
>  			       "[MST PORT:%p] DSC flag is already set to %d, returning %d tim=
e slots\n",
> -			       port, enable, pos->time_slots);
> -		time_slots =3D pos->time_slots;
> +			       port, enable, payload->time_slots);
> +		time_slots =3D payload->time_slots;
>  	}
>=20=20
>  	if (enable) {
> @@ -5399,7 +5380,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_=
state *state,
>  			return -EINVAL;
>  	}
>=20=20
> -	pos->dsc_enabled =3D enable;
> +	payload->dsc_enabled =3D enable;
>=20=20
>  	return time_slots;
>  }

--=20
Jani Nikula, Intel Open Source Graphics Center
