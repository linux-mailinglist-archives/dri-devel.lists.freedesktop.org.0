Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A1145BB5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 19:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6186F64D;
	Wed, 22 Jan 2020 18:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35066F64D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 18:47:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 10:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="284680527"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 22 Jan 2020 10:44:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jan 2020 20:44:41 +0200
Date: Wed, 22 Jan 2020 20:44:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Fix clearing payload state on topology
 disable
Message-ID: <20200122184441.GE13686@intel.com>
References: <20200117224749.128994-1-lyude@redhat.com>
 <20200117224749.128994-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117224749.128994-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 05:47:49PM -0500, Lyude Paul wrote:
> The issues caused by:
> =

> 64e62bdf04ab ("drm/dp_mst: Remove VCPI while disabling topology mgr")
> =

> Prompted me to take a closer look at how we clear the payload state in
> general when disabling the topology, and it turns out there's actually
> two subtle issues here.
> =

> The first is that we're not grabbing &mgr.payload_lock when clearing the
> payloads in drm_dp_mst_topology_mgr_set_mst(). Seeing as the canonical
> lock order is &mgr.payload_lock -> &mgr.lock (because we always want
> &mgr.lock to be the inner-most lock so topology validation always
> works), this makes perfect sense. It also means that -technically- there
> could be racing between someone calling
> drm_dp_mst_topology_mgr_set_mst() to disable the topology, along with a
> modeset occurring that's modifying the payload state at the same time.
> =

> The second is the more obvious issue that Wayne Lin discovered, that
> we're not clearing proposed_payloads when disabling the topology.
> =

> I actually can't see any obvious places where the racing caused by the
> first issue would break something, and it could be that some of our
> higher-level locks already prevent this by happenstance, but better safe
> then sorry. So, let's make it so that drm_dp_mst_topology_mgr_set_mst()
> first grabs &mgr.payload_lock followed by &mgr.lock so that we never
> race when modifying the payload state. Then, we also clear
> proposed_payloads to fix the original issue of enabling a new topology
> with a dirty payload state. This doesn't clear any of the drm_dp_vcpi
> structures, but those are getting destroyed along with the ports anyway.
> =

> Cc: Sean Paul <sean@poorly.run>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 89c2a7505cbd..58287f4c1baf 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3483,6 +3483,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_m=
st_topology_mgr *mgr, bool ms
>  	int ret =3D 0;
>  	struct drm_dp_mst_branch *mstb =3D NULL;
>  =

> +	mutex_lock(&mgr->payload_lock);
>  	mutex_lock(&mgr->lock);
>  	if (mst_state =3D=3D mgr->mst_state)
>  		goto out_unlock;
> @@ -3541,7 +3542,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_=
mst_topology_mgr *mgr, bool ms
>  		/* this can fail if the device is gone */
>  		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
>  		ret =3D 0;
> -		memset(mgr->payloads, 0, mgr->max_payloads * sizeof(struct drm_dp_payl=
oad));
> +		memset(mgr->payloads, 0,
> +		       mgr->max_payloads * sizeof(struct drm_dp_payload));
> +		memset(mgr->proposed_vcpis, 0,
> +		       mgr->max_payloads * sizeof(void*));

void* is an odd choice.

sizeof(foo[0]) would be more future proof (for both of these).

Also might be a good idea to update the docs to mention
max_payloads defines the size of these arrays.

>  		mgr->payload_mask =3D 0;
>  		set_bit(0, &mgr->payload_mask);
>  		mgr->vcpi_mask =3D 0;
> @@ -3550,6 +3554,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_m=
st_topology_mgr *mgr, bool ms
>  =

>  out_unlock:
>  	mutex_unlock(&mgr->lock);
> +	mutex_unlock(&mgr->payload_lock);
>  	if (mstb)
>  		drm_dp_mst_topology_put_mstb(mstb);
>  	return ret;
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
