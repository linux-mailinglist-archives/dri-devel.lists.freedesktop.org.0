Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24E1EE76D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 17:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90596E431;
	Thu,  4 Jun 2020 15:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA8D6E431;
 Thu,  4 Jun 2020 15:12:32 +0000 (UTC)
IronPort-SDR: qxaLpiR7iyGb1pAokCTUKSZsZVoiTjJElr6+gQZvaIpBj9mvLnMVt0zykXpqviov5nTzwv955X
 5KsVDl7iuKnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 08:12:31 -0700
IronPort-SDR: sn4ASYubxUZg5VNgPD64lVHCg4X6uOZLqOkCZ1LKcq1N+PpuSNDtSBUXtua7dBfR5qZGexffQL
 dgZ0Sb4NjM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="287402513"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Jun 2020 08:12:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Jun 2020 18:12:27 +0300
Date: Thu, 4 Jun 2020 18:12:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/dp_mst: Work around
 out-of-spec adapters filtering short pulses
Message-ID: <20200604151227.GT6112@intel.com>
References: <20200603211040.8190-3-imre.deak@intel.com>
 <20200603221859.9600-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603221859.9600-1-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 01:18:59AM +0300, Imre Deak wrote:
> Some TypeC -> native DP adapters, at least the Club CAC-1557 adapter,
> incorrectly filter out HPD short pulses with a duration less than ~540
> usec, leading to MST probe failures.
> =

> According to the DP alt mode specification adapters should forward short
> pulses with a duration greater than 250 usec. According to the DP
> specificatin DP sources should detect short pulses in the
> 500 usec -> 2 ms range. =


IIRC it was 250 usec -> 2 ms as well in the DP spec.

500 usec -> 1 ms is the duration of the short hpd
the signalling side should use.

> Based on this filtering out short pulses with a
> duration less than 540 usec is incorrect.
> =

> To make such adapters work add support for a driver polling on MST
> inerrupt flags, and wire this up in the i915 driver. The sink can clear
> an interrupt it raised after 110 ms if the source doesn't respond, so
> use a 50 ms poll period to avoid missing an interrupt. Polling of the
> MST interrupt flags is explicitly allowed by the DP specification.
> =

> This fixes MST probe failures I saw using this adapter and a DELL U2515H
> monitor.
> =

> v2:
> - Fix the wait event timeout for the no-poll case.
> =

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c       | 19 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 15 +++++++++++++++
>  include/drm/drm_dp_mst_helper.h             |  1 +
>  3 files changed, 32 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 5bc72e800b85..4e987a513df8 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1178,11 +1178,24 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp=
_mst_branch *mstb,
>  				    struct drm_dp_sideband_msg_tx *txmsg)
>  {
>  	struct drm_dp_mst_topology_mgr *mgr =3D mstb->mgr;
> +	unsigned long wait_timeout =3D msecs_to_jiffies(4000);
> +	unsigned long wait_expires =3D jiffies + wait_timeout;
>  	int ret;
>  =

> -	ret =3D wait_event_timeout(mgr->tx_waitq,
> -				 check_txmsg_state(mgr, txmsg),
> -				 (4 * HZ));
> +	for (;;) {
> +		ret =3D wait_event_timeout(mgr->tx_waitq,
> +					 check_txmsg_state(mgr, txmsg),
> +					 mgr->cbs->update_hpd_irq_state ?
> +						msecs_to_jiffies(50) :
> +						wait_timeout);
> +
> +		if (ret || !mgr->cbs->update_hpd_irq_state ||
> +		    time_after(jiffies, wait_expires))
> +			break;

First I thought this was changing the behaviour when the callback
isn't provided, but then I noticed the ?: stuff for the timeout.

I think this stuff deserves a comment to explain why we would
ever do such a thing instead of simply waiting like we did before.

> +
> +		mgr->cbs->update_hpd_irq_state(mgr);
> +	}
> +
>  	mutex_lock(&mgr->qlock);
>  	if (ret > 0) {
>  		if (txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_TIMEOUT) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index d18b406f2a7d..1ff7d0096262 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -765,8 +765,23 @@ static struct drm_connector *intel_dp_add_mst_connec=
tor(struct drm_dp_mst_topolo
>  	return NULL;
>  }
>  =

> +static void
> +intel_dp_mst_update_hpd_irq_state(struct drm_dp_mst_topology_mgr *mgr)
> +{
> +	struct intel_dp *intel_dp =3D container_of(mgr, struct intel_dp, mst_mg=
r);
> +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> +	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
> +
> +	spin_lock_irq(&i915->irq_lock);
> +	i915->hotplug.short_port_mask |=3D BIT(dig_port->base.port);
> +	spin_unlock_irq(&i915->irq_lock);
> +
> +	queue_work(i915->hotplug.dp_wq, &i915->hotplug.dig_port_work);

I might suggest putting this code right next to intel_hpd_irq_handler()
so that people can actually see it when working on the hotplug code.

> +}
> +
>  static const struct drm_dp_mst_topology_cbs mst_cbs =3D {
>  	.add_connector =3D intel_dp_add_mst_connector,
> +	.update_hpd_irq_state =3D intel_dp_mst_update_hpd_irq_state,
>  };
>  =

>  static struct intel_dp_mst_encoder *
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_hel=
per.h
> index 9e1ffcd7cb68..c902f4380200 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -475,6 +475,7 @@ struct drm_dp_mst_topology_mgr;
>  struct drm_dp_mst_topology_cbs {
>  	/* create a connector for a port */
>  	struct drm_connector *(*add_connector)(struct drm_dp_mst_topology_mgr *=
mgr, struct drm_dp_mst_port *port, const char *path);
> +	void (*update_hpd_irq_state)(struct drm_dp_mst_topology_mgr *mgr);

I guess a bit of docs for this might be nice. Maybe s/update/poll/
might make the intention more clear? Not sure.

>  };
>  =

>  #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
> -- =

> 2.23.1
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
