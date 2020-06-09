Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5B1F3A7F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 14:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022576E045;
	Tue,  9 Jun 2020 12:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709B889FD3;
 Tue,  9 Jun 2020 12:16:07 +0000 (UTC)
IronPort-SDR: LTr7AzznEKAWdUdmXZl1ikGPeCTRmD3DUnCjymNa5ycdJgvd+itAyvHTKQXXSk9Pc86NCGoBqa
 UmGvC0L3lmoQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 05:16:06 -0700
IronPort-SDR: +a+a/mDosKbuqbWAE1DIiLt1uo6jnfFYj++aiF7g0pQbH16iMS6cQJFN+P7Tx29VR+ap6QWZo5
 ardEP0DHWhbg==
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; d="scan'208";a="447106441"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 05:16:04 -0700
Date: Tue, 9 Jun 2020 15:15:56 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915/dp_mst: Work around
 out-of-spec adapters filtering short pulses
Message-ID: <20200609121556.GF22647@ideak-desk.fi.intel.com>
References: <20200603211040.8190-3-imre.deak@intel.com>
 <20200604184500.23730-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604184500.23730-2-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Lyude,

are you ok to merge this patchset via the drm-intel-next-queued tree?

--Imre

On Thu, Jun 04, 2020 at 09:45:00PM +0300, Imre Deak wrote:
> Some TypeC -> native DP adapters, at least the Club 3D CAC-1557 adapter,
> incorrectly filter out HPD short pulses with a duration less than
> ~540 usec, leading to MST probe failures.
> =

> According to the DP Standard 2.0 section 5.1.4:
> - DP sinks should generate short pulses in the 500 usec -> 1 msec range
> - DP sources should detect short pulses in the 250 usec -> 2 msec range
> =

> According to the DP Alt Mode on TypeC Standard section 3.9.2, adapters
> should detect and forward short pulses according to how sources should
> detect them as specified in the DP Standard (250 usec -> 2 msec).
> =

> Based on the above filtering out short pulses with a duration less than
> 540 usec is incorrect.
> =

> To make such adapters work add support for a driver polling on MST
> inerrupt flags, and wire this up in the i915 driver. The sink can clear
> an interrupt it raised after 110 msec if the source doesn't respond, so
> use a 50 msec poll period to avoid missing an interrupt. Polling of the
> MST interrupt flags is explicitly allowed by the DP Standard.
> =

> This fixes MST probe failures I saw using this adapter and a DELL U2515H
> monitor.
> =

> v2:
> - Fix the wait event timeout for the no-poll case.
> v3 (Ville):
> - Fix the short pulse duration limits in the commit log prescribed by the
>   DP Standard.
> - Add code comment explaining why/how polling is used.
> - Factor out a helper to schedule the port's hpd irq handler and move it
>   to the rest of hotplug handlers.
> - Document the new MST callback.
> - s/update_hpd_irq_state/poll_hpd_irq/
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c        | 32 ++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 10 ++++++
>  drivers/gpu/drm/i915/display/intel_hotplug.c | 18 +++++++++++
>  drivers/gpu/drm/i915/display/intel_hotplug.h |  2 ++
>  include/drm/drm_dp_mst_helper.h              |  9 ++++++
>  5 files changed, 68 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 5bc72e800b85..2a309fb2c4cc 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1178,11 +1178,37 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp=
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
> +		/*
> +		 * If the driver provides a way for this, change to
> +		 * poll-waiting for the MST reply interrupt if we didn't receive
> +		 * it for 50 msec. This would cater for cases where the HPD
> +		 * pulse signal got lost somewhere, even though the sink raised
> +		 * the corresponding MST interrupt correctly. One example is the
> +		 * Club 3D CAC-1557 TypeC -> DP adapter which for some reason
> +		 * filters out short pulses with a duration less than ~540 usec.
> +		 *
> +		 * The poll period is 50 msec to avoid missing an interrupt
> +		 * after the sink has cleared it (after a 110msec timeout
> +		 * since it raised the interrupt).
> +		 */
> +		ret =3D wait_event_timeout(mgr->tx_waitq,
> +					 check_txmsg_state(mgr, txmsg),
> +					 mgr->cbs->poll_hpd_irq ?
> +						msecs_to_jiffies(50) :
> +						wait_timeout);
> +
> +		if (ret || !mgr->cbs->poll_hpd_irq ||
> +		    time_after(jiffies, wait_expires))
> +			break;
> +
> +		mgr->cbs->poll_hpd_irq(mgr);
> +	}
> +
>  	mutex_lock(&mgr->qlock);
>  	if (ret > 0) {
>  		if (txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_TIMEOUT) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index d18b406f2a7d..9be52643205d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -33,6 +33,7 @@
>  #include "intel_connector.h"
>  #include "intel_ddi.h"
>  #include "intel_display_types.h"
> +#include "intel_hotplug.h"
>  #include "intel_dp.h"
>  #include "intel_dp_mst.h"
>  #include "intel_dpio_phy.h"
> @@ -765,8 +766,17 @@ static struct drm_connector *intel_dp_add_mst_connec=
tor(struct drm_dp_mst_topolo
>  	return NULL;
>  }
>  =

> +static void
> +intel_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
> +{
> +	struct intel_dp *intel_dp =3D container_of(mgr, struct intel_dp, mst_mg=
r);
> +
> +	intel_hpd_trigger_irq(dp_to_dig_port(intel_dp));
> +}
> +
>  static const struct drm_dp_mst_topology_cbs mst_cbs =3D {
>  	.add_connector =3D intel_dp_add_mst_connector,
> +	.poll_hpd_irq =3D intel_dp_mst_poll_hpd_irq,
>  };
>  =

>  static struct intel_dp_mst_encoder *
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/d=
rm/i915/display/intel_hotplug.c
> index 4f6f560e093e..664f88354101 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -347,6 +347,24 @@ static void i915_digport_work_func(struct work_struc=
t *work)
>  	}
>  }
>  =

> +/**
> + * intel_hpd_trigger_irq - trigger an hpd irq event for a port
> + * @dig_port: digital port
> + *
> + * Trigger an HPD interrupt event for the given port, emulating a short =
pulse
> + * generated by the sink, and schedule the dig port work to handle it.
> + */
> +void intel_hpd_trigger_irq(struct intel_digital_port *dig_port)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
> +
> +	spin_lock_irq(&i915->irq_lock);
> +	i915->hotplug.short_port_mask |=3D BIT(dig_port->base.port);
> +	spin_unlock_irq(&i915->irq_lock);
> +
> +	queue_work(i915->hotplug.dp_wq, &i915->hotplug.dig_port_work);
> +}
> +
>  /*
>   * Handle hotplug events outside the interrupt handler proper.
>   */
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.h b/drivers/gpu/d=
rm/i915/display/intel_hotplug.h
> index 777b0743257e..a704d7c94d16 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.h
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.h
> @@ -10,6 +10,7 @@
>  =

>  struct drm_i915_private;
>  struct intel_connector;
> +struct intel_digital_port;
>  struct intel_encoder;
>  enum port;
>  =

> @@ -18,6 +19,7 @@ enum intel_hotplug_state intel_encoder_hotplug(struct i=
ntel_encoder *encoder,
>  					       struct intel_connector *connector);
>  void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
>  			   u32 pin_mask, u32 long_mask);
> +void intel_hpd_trigger_irq(struct intel_digital_port *dig_port);
>  void intel_hpd_init(struct drm_i915_private *dev_priv);
>  void intel_hpd_init_work(struct drm_i915_private *dev_priv);
>  void intel_hpd_cancel_work(struct drm_i915_private *dev_priv);
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_hel=
per.h
> index 9e1ffcd7cb68..b230ff6f7081 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -475,6 +475,15 @@ struct drm_dp_mst_topology_mgr;
>  struct drm_dp_mst_topology_cbs {
>  	/* create a connector for a port */
>  	struct drm_connector *(*add_connector)(struct drm_dp_mst_topology_mgr *=
mgr, struct drm_dp_mst_port *port, const char *path);
> +	/*
> +	 * Checks for any pending MST interrupts, passing them to MST core for
> +	 * processing, the same way an HPD IRQ pulse handler would do this.
> +	 * If provided MST core calls this callback from a poll-waiting loop
> +	 * when waiting for MST down message replies. The driver is expected
> +	 * to guard against a race between this callback and the driver's HPD
> +	 * IRQ pulse handler.
> +	 */
> +	void (*poll_hpd_irq)(struct drm_dp_mst_topology_mgr *mgr);
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
