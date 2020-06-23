Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6B204B1D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BE46E947;
	Tue, 23 Jun 2020 07:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256DC6E947;
 Tue, 23 Jun 2020 07:30:22 +0000 (UTC)
IronPort-SDR: qXcQg0K4zi9HEZ6uAVgmx1gQgZj43UBP8Xv1vMMyiDB0clkxJjSZMNz6LRnqlak+0nelgRyf6+
 JhhAcrMc9wqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="123660812"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="123660812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 00:30:21 -0700
IronPort-SDR: /5HxP1/hdIaqYfnC6/nlaI1qepVLZtCN2f+36qDwE1ToU+CgsyTaFYA6fxRMKgtIzGPfJhCxsr
 vSfU9Vp6hREA==
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="264721429"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 00:30:20 -0700
Date: Tue, 23 Jun 2020 10:30:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 6/6] drm/i915/dp_mst: Ensure the DPCD ACT sent flag is
 cleared before waiting for it
Message-ID: <20200623073010.GB21923@ideak-desk.fi.intel.com>
References: <20200616141855.746-6-imre.deak@intel.com>
 <20200616211146.23027-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616211146.23027-3-imre.deak@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 12:11:46AM +0300, Imre Deak wrote:
> Atm, we clear the ACT sent flag in the sink's DPCD before updating the
> sink's payload table, along clearing the payload table updated flag.
> The sink is supposed to set this flag once it detects that the source
> has completed the ACT sequence (after detecting the 4 required ACT MTPH
> symbols sent by the source). As opposed to this 2 DELL monitors I have
> set the flag already along the payload table updated flag, which is not
> quite correct.
> =

> To be sure that the sink has detected the ACT MTPH symbols before
> continuing enabling the encoder, clear the ACT sent flag before enabling
> or disabling the transcoder VC payload allocation (which is what starts
> the ACT sequence).
> =

> v2 (Ville):
> - Use the correct bit to clear the flags.
> - Add code comment explaining the clearing semantics of the ACT handled
>   flag.
> =

> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Dropping this patch because clearing the ACT handled flag from DPCD
causes a problem for some sinks, which set this flag only once when the
VC payload table is updated and do not set it when the ACT symbols are
actually sent by the source.

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c       | 38 +++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
>  include/drm/drm_dp_mst_helper.h             |  2 ++
>  3 files changed, 40 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index b2f5a84b4cfb..1f5d14128c1a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4377,6 +4377,41 @@ void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_=
topology_mgr *mgr,
>  }
>  EXPORT_SYMBOL(drm_dp_mst_deallocate_vcpi);
>  =

> +/**
> + * drm_dp_clear_payload_status() - Clears the payload table status flags
> + * @mgr: manager to use
> + *
> + * Clears the payload table ACT handled and table updated flags in the M=
ST hub's
> + * DPCD. This function must be called before updating the payload table =
or
> + * starting the ACT sequence and waiting for the corresponding flags to =
get
> + * set by the hub.
> + *
> + * Returns:
> + * 0 if the flags got cleared successfully, otherwise a negative error c=
ode.
> + */
> +int drm_dp_clear_payload_status(struct drm_dp_mst_topology_mgr *mgr)
> +{
> +	int ret;
> +
> +	/*
> +	 * Note that the following is based on the DP Standard stating that
> +	 * writing the DP_PAYLOAD_TABLE_UPDATED bit alone will clear both the
> +	 * DP_PAYLOAD_TABLE_UPDATED and the DP_PAYLOAD_ACT_HANDLED flags. This
> +	 * seems to be also the only way to clear DP_PAYLOAD_ACT_HANDLED.
> +	 */
> +	ret =3D drm_dp_dpcd_writeb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
> +				 DP_PAYLOAD_TABLE_UPDATED);
> +	if (ret < 0) {
> +		DRM_DEBUG_DRIVER("Can't clear the ACT handled/table updated flags (%d)=
\n",
> +				 ret);
> +		return ret;
> +	}
> +	WARN_ON(ret !=3D 1);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_clear_payload_status);
> +
>  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>  				     int id, struct drm_dp_payload *payload)
>  {
> @@ -4384,8 +4419,7 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_=
mst_topology_mgr *mgr,
>  	int ret;
>  	int retries =3D 0;
>  =

> -	drm_dp_dpcd_writeb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
> -			   DP_PAYLOAD_TABLE_UPDATED);
> +	drm_dp_clear_payload_status(mgr);
>  =

>  	payload_alloc[0] =3D id;
>  	payload_alloc[1] =3D payload->start_slot;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 9308b5920780..3c4b0fb10d8b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -323,6 +323,8 @@ static void clear_act_sent(struct intel_dp *intel_dp)
>  =

>  	intel_de_write(i915, intel_dp->regs.dp_tp_status,
>  		       DP_TP_STATUS_ACT_SENT);
> +
> +	drm_dp_clear_payload_status(&intel_dp->mst_mgr);
>  }
>  =

>  static void wait_for_act_sent(struct intel_dp *intel_dp)
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_hel=
per.h
> index 8b9eb4db3381..2facb87624bf 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -763,6 +763,8 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology=
_mgr *mgr,
>  			   int pbn);
>  =

>  =

> +int drm_dp_clear_payload_status(struct drm_dp_mst_topology_mgr *mgr);
> +
>  int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
>  =

>  =

> -- =

> 2.23.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
