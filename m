Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F097260E9E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 11:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63266E5D4;
	Tue,  8 Sep 2020 09:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A486E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 09:25:02 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id FZs3kWcwSMeQuFZs4kfOHr; Tue, 08 Sep 2020 11:25:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1599557100; bh=8COC+nn7sKl2+uger3PAu7UoZsqRrBMqLhCGUSfsIKw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=U0Zl7yzasoD8bybPlR2QYTuaHZzevNmYnOuLdRHTxlXWnv8x8Tnk/6wRIiS1MWzDh
 fyl/s/s4IXZqgpcYmOkglttnqXpmQSwZGqDczR+cvMNe+UQ0lDx7k9G15AnNNRh2pQ
 I6EC5v8OwfJzFSM+gKPBd8yeZJtAUQuqM6T5oEtF0rWQdv17aQRrp/IqBchDeN/xAw
 i+zrNH/TynKRApPxlB/7Svu3OiCY/7kcuKBZAJxBIvXO4qzo29onPr472ai4YGdkQa
 KAGDyPJrdtiSjlyPJ8OFS+zlszaYpspsPqHT0ZkxQ850Sb+3OmnYTGTSEczMZhI+Lo
 6+A4homyqACdQ==
Subject: Re: [PATCH 5/5] drm_dp_cec: add the implementation of MST support
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200901162133.5.I900b1b80709b7632a47d0ddb4cd375b4a3616c9e@changeid>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c9ec5c76-8c51-9ad6-0169-c615ae9d8f7f@xs4all.nl>
Date: Tue, 8 Sep 2020 11:24:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901162133.5.I900b1b80709b7632a47d0ddb4cd375b4a3616c9e@changeid>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCGjVpMVreZvkEhOu4e81X3UmbwXymCIUeJLHmAiZHdOE461vi3w3MB8bB/SYKWBKfn0s13vaQ1q3l2MBlv7mlDJT03ERSRYYbzv8iLBZTWlSsXJCxpc
 wl95K8tudG5HUaYnSbE32ELhlhAJCQ0VwCubQZo8jDvWtOe+UQKnBPSfSfI4jODLEB6xFFywEss+U0+qUE8npAdY/SNwBMPdK2JvIbVq8LLI6x2ie0ERcTtF
 s2gIOqwpdEX0nOCMmMEm9zItZHRDwtWm0tUnRUy1P4jx31BjkW/YN1Z8MmJzmtU8XUYDg76AZJiFJR0/Tya21RmyjLm7soVuRfUYRQoV53GmexWFkP4vMVl7
 A3Bcxt4XtWv1PSvONzNp3jp4m1n5qDAfsrz9+ovBjGUTm1nobCeMLVGoDUCEydJ+8AQjA33Txm8I8jrv6wr3C0sGFKKXcw==
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
Cc: David Airlie <airlied@linux.ie>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2020 08:22, Sam McNally wrote:
> With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> topology.
> 
> There are some minor differences for CEC tunneling through an MST
> topology compared to CEC tunneling to an SST port:
> - CEC IRQs are delivered via a sink event notify message
> - CEC-related DPCD registers are accessed via remote DPCD reads and
>   writes.
> 
> This results in the MST implementation diverging from the existing SST
> implementation:
> - sink event notify messages with CEC_IRQ ID set indicate CEC IRQ rather
>   than ESI1
> - setting edid and handling CEC IRQs, which can be triggered from
>   contexts where locks held preclude HPD handling, are deferred to avoid
>   remote DPCD access which would block until HPD handling is performed
>   or a timeout
> 
> Register and unregister for all MST connectors, ensuring their
> drm_dp_aux_cec struct won't be accessed uninitialized.
> 
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
>  drivers/gpu/drm/drm_dp_cec.c          | 67 +++++++++++++++++++++++++--
>  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
>  include/drm/drm_dp_helper.h           |  4 ++
>  3 files changed, 90 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index 04ab7b88055c..9f6aeaa27f00 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -249,6 +249,10 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
>  	if (!aux->transfer)
>  		return;
>  
> +	if (aux->cec.is_mst) {
> +		schedule_work(&aux->cec.mst_irq_work);
> +		return;
> +	}
>  	mutex_lock(&aux->cec.lock);
>  	if (!aux->cec.adap)
>  		goto unlock;
> @@ -277,6 +281,24 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
>  	return true;
>  }
>  
> +static void drm_dp_cec_mst_irq_work(struct work_struct *work)
> +{
> +	struct drm_dp_aux *aux = container_of(work, struct drm_dp_aux,
> +					      cec.mst_irq_work);
> +	struct drm_dp_mst_port *port =
> +		container_of(aux, struct drm_dp_mst_port, aux);
> +
> +	port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> +	if (!port)
> +		return;
> +	mutex_lock(&aux->cec.lock);
> +	if (aux->cec.adap)
> +		drm_dp_cec_handle_irq(aux);
> +

Nitpick: this empty line feels unbalanced. It makes more sense to add
an empty line just before the mutex_lock() and remove this one.

> +	mutex_unlock(&aux->cec.lock);
> +	drm_dp_mst_topology_put_port(port);
> +}
> +
>  /*
>   * Called if the HPD was low for more than drm_dp_cec_unregister_delay
>   * seconds. This unregisters the CEC adapter.
> @@ -298,7 +320,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>   * were unchanged and just update the CEC physical address. Otherwise
>   * unregister the old CEC adapter and create a new one.
>   */
> -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
> +				       const struct edid *edid)
>  {
>  	struct drm_connector *connector = aux->cec.connector;
>  	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> @@ -307,10 +330,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	unsigned int num_las = 1;
>  	u8 cap;
>  
> -	/* No transfer function was set, so not a DP connector */
> -	if (!aux->transfer)
> -		return;
> -
>  #ifndef CONFIG_MEDIA_CEC_RC
>  	/*
>  	 * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
> @@ -321,6 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	 */
>  	cec_caps &= ~CEC_CAP_RC;
>  #endif
> +	cancel_work_sync(&aux->cec.mst_irq_work);
>  	cancel_delayed_work_sync(&aux->cec.unregister_work);
>  
>  	mutex_lock(&aux->cec.lock);
> @@ -375,6 +395,18 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	}
>  	mutex_unlock(&aux->cec.lock);
>  }
> +
> +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +{
> +	/* No transfer function was set, so not a DP connector */
> +	if (!aux->transfer)
> +		return;
> +
> +	if (aux->cec.is_mst)
> +		schedule_work(&aux->cec.mst_set_edid_work);
> +	else
> +		drm_dp_cec_handle_set_edid(aux, edid);
> +}
>  EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  
>  /*
> @@ -393,6 +425,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  		goto unlock;
>  
>  	cec_phys_addr_invalidate(aux->cec.adap);
> +	cancel_work_sync(&aux->cec.mst_irq_work);

I'd swap these two lines. It's a bit more robust.

Shouldn't this also cancel cec.mst_set_edid_work?

> +
>  	/*
>  	 * We're done if we want to keep the CEC device
>  	 * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> @@ -414,6 +448,25 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  }
>  EXPORT_SYMBOL(drm_dp_cec_unset_edid);
>  
> +static void drm_dp_cec_mst_set_edid_work(struct work_struct *work)

It's a bit weird to have this function appear after the drm_dp_cec_unset_edid()
function. Wouldn't it be better to move it to just before drm_dp_cec_set_edid()?
That way all the 'set_edid()' functions are grouped together.

Regards,

	Hans

> +{
> +	struct drm_dp_aux *aux =
> +		container_of(work, struct drm_dp_aux, cec.mst_set_edid_work);
> +	struct drm_dp_mst_port *port =
> +		container_of(aux, struct drm_dp_mst_port, aux);
> +	struct edid *edid = NULL;
> +
> +	port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> +	if (!port)
> +		return;
> +
> +	edid = drm_get_edid(port->connector, &port->aux.ddc);
> +
> +	drm_dp_cec_handle_set_edid(aux, edid);
> +
> +	drm_dp_mst_topology_put_port(port);
> +}
> +
>  /**
>   * drm_dp_cec_register_connector() - register a new connector
>   * @aux: DisplayPort AUX channel
> @@ -435,6 +488,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>  	aux->cec.is_mst = is_mst;
>  	INIT_DELAYED_WORK(&aux->cec.unregister_work,
>  			  drm_dp_cec_unregister_work);
> +	INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
> +	INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
>  }
>  EXPORT_SYMBOL(drm_dp_cec_register_connector);
>  
> @@ -444,6 +499,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
>   */
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
>  {
> +	cancel_work_sync(&aux->cec.mst_irq_work);
> +	cancel_work_sync(&aux->cec.mst_set_edid_work);
>  	if (!aux->cec.adap)
>  		return;
>  	cancel_delayed_work_sync(&aux->cec.unregister_work);
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index c783a2a1c114..fd9430d88fd6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2183,6 +2183,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
>  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
>  				       struct drm_dp_mst_port *port)
>  {
> +	drm_dp_cec_register_connector(&port->aux, connector, true);
> +
>  	DRM_DEBUG_KMS("registering %s remote bus for %s\n",
>  		      port->aux.name, connector->kdev->kobj.name);
>  
> @@ -2206,6 +2208,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
>  	DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
>  		      port->aux.name, connector->kdev->kobj.name);
>  	drm_dp_aux_unregister_devnode(&port->aux);
> +
> +	drm_dp_cec_unregister_connector(&port->aux);
>  }
>  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
>  
> @@ -2515,6 +2519,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
>  		queue_work(system_long_wq, &mstb->mgr->work);
>  }
>  
> +static void
> +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> +			    struct drm_dp_sink_event_notify *sink_event)
> +{
> +	struct drm_dp_mst_port *port;
> +
> +	if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> +		port = drm_dp_get_port(mstb, sink_event->port_number);
> +		if (port) {
> +			drm_dp_cec_irq(&port->aux);
> +			drm_dp_mst_topology_put_port(port);
> +		}
> +	}
> +}
> +
>  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
>  							       u8 lct, u8 *rad)
>  {
> @@ -3954,6 +3973,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
>  	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
>  		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
>  		hotplug = true;
> +	} else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> +		drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
>  	}
>  
>  	drm_dp_mst_topology_put_mstb(mstb);
> @@ -4147,6 +4168,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  		break;
>  	}
>  out:
> +	if (ret != connector_status_connected)
> +		drm_dp_cec_unset_edid(&port->aux);
>  	drm_dp_mst_topology_put_port(port);
>  	return ret;
>  }
> @@ -4177,6 +4200,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
>  		edid = drm_get_edid(connector, &port->aux.ddc);
>  	}
>  	port->has_audio = drm_detect_monitor_audio(edid);
> +	drm_dp_cec_set_edid(&port->aux, edid);
>  	drm_dp_mst_topology_put_port(port);
>  	return edid;
>  }
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 12bca1b9512b..e973eba06875 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1497,6 +1497,8 @@ struct drm_connector;
>   * @connector: the connector this CEC adapter is associated with
>   * @is_mst: this is an MST branch
>   * @unregister_work: unregister the CEC adapter
> + * @mst_irq_work: IRQ for CEC events on an MST branch
> + * @mst_set_edid_work: set the EDID for an MST branch
>   */
>  struct drm_dp_aux_cec {
>  	struct mutex lock;
> @@ -1504,6 +1506,8 @@ struct drm_dp_aux_cec {
>  	struct drm_connector *connector;
>  	bool is_mst;
>  	struct delayed_work unregister_work;
> +	struct work_struct mst_irq_work;
> +	struct work_struct mst_set_edid_work;
>  };
>  
>  /**
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
