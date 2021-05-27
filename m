Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74943936DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9943D6F4A6;
	Thu, 27 May 2021 20:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396AE6F4A3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 20:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622146359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p88nsQ9k8vXGqsIMjaKmSjOXZyJJ+7FFkp711P5nvBo=;
 b=IxbIcAdPm9WtQHIJ/qtxsCeDVrJMJ/xsofWV2GF9hdI5nGBYG36XyzYW6GqDffSlYP9C2F
 0Xw3KsW1Ax9GHGogVPi7013HQjjr0+2HWvi/ZjC96DOUN90B6yo260ANYgneZ7OLsqFih6
 3wSF6ZqzEnNoFg+PmM5ifxFyiKOx45Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-FvIEybI7PsGHSqtQZ2lzmA-1; Thu, 27 May 2021 16:12:37 -0400
X-MC-Unique: FvIEybI7PsGHSqtQZ2lzmA-1
Received: by mail-qk1-f200.google.com with SMTP id
 x12-20020ae9f80c0000b02903a6a80ade45so1280365qkh.22
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 13:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=p88nsQ9k8vXGqsIMjaKmSjOXZyJJ+7FFkp711P5nvBo=;
 b=WiuUTfKSLYJvdUN5OBLLYTzRNMOQIOSB62/ATrQs0MUzGjkdvML7IoWGRWnS/qq1ZF
 nxo5Ti15AJqx3a409ffpIt0JXprBneCO5CXTfS9dbvgbqhjU+816TnvNNch5vuEGyHM7
 HBhW0Lxwy+eJkqh3MjdBz3WOF1TPQB8VABMCVvTF/bGFKiZjkURICqr1HbudlLBWMuWE
 D7SuZZE8ikZXV12ypQnD/IgckRDELlbwR5PcHiiZf4NFcp/JjIRZ6/89Osd0wVH8CEQK
 nehLAEQxY9iQ6kXPHkwbH3KPn+TuUlysl73BshlYcF6wi4YiFbKqQYee2lIfTlEYk9xv
 19WA==
X-Gm-Message-State: AOAM5311QJ3FjrmUTNI+uPAVQmaG8xUeB53NCAF6VEYOg4yqv2lmmQaY
 w3bWIG/9v/FKbiE9jcGJ8HzYzQr0yq1+OTSA+QNPSWU5+SoPNKnwn3ySFx7EBHMFnV5+gM31HUU
 YQqZ9uj2+e+B5Dx2A+Mg+e+85pxbm
X-Received: by 2002:ac8:4b65:: with SMTP id g5mr299286qts.99.1622146356893;
 Thu, 27 May 2021 13:12:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk0cpgY8zKiNOWNvoaVGuOHBdqEPndQlEyRAu1sDc9JFiZ18WmHo8kAcAuC2ClcKVAIVUohg==
X-Received: by 2002:ac8:4b65:: with SMTP id g5mr299266qts.99.1622146356665;
 Thu, 27 May 2021 13:12:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r3sm2074116qtu.50.2021.05.27.13.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:12:36 -0700 (PDT)
Message-ID: <e50f9596e2ba55f27007b05315f523839abc6019.camel@redhat.com>
Subject: Re: [PATCH v5 3/3] drm_dp_cec: add MST support
From: Lyude Paul <lyude@redhat.com>
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Date: Thu, 27 May 2021 16:12:35 -0400
In-Reply-To: <20210525105913.v5.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
References: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
 <20210525105913.v5.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 10:59 +1000, Sam McNally wrote:
> With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> topology.
> 
> When tunneling CEC through an MST port, CEC IRQs are delivered via a
> sink event notify message; when a sink event notify message is received,
> trigger CEC IRQ handling - ESI1 is not used for remote CEC IRQs so its
> value is not checked.
> 
> Register and unregister for all MST connectors, ensuring their
> drm_dp_aux_cec struct won't be accessed uninitialized.
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Removed use of work queues
> - Updated checks of aux.transfer to accept aux.is_remote
> 
> Changes in v3:
> - Fixed whitespace in drm_dp_cec_mst_irq_work()
> - Moved drm_dp_cec_mst_set_edid_work() with the other set_edid functions
> 
> Changes in v2:
> - Used aux->is_remote instead of aux->cec.is_mst, removing the need for
>   the previous patch in the series
> - Added a defensive check for null edid in the deferred set_edid work,
>   in case the edid is no longer valid at that point
> 
>  drivers/gpu/drm/drm_dp_cec.c          | 20 ++++++++++++++++----
>  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index 3ab2609f9ec7..1abd3f4654dc 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drm_dp_mst_helper.h>
>  
>  /*
>   * Unfortunately it turns out that we have a chicken-and-egg situation
> @@ -245,13 +246,22 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
>         int ret;
>  
>         /* No transfer function was set, so not a DP connector */
> -       if (!aux->transfer)
> +       if (!aux->transfer && !aux->is_remote)
>                 return;
>  
>         mutex_lock(&aux->cec.lock);
>         if (!aux->cec.adap)
>                 goto unlock;
>  
> +       if (aux->is_remote) {
> +               /*
> +                * For remote connectors, CEC IRQ is triggered by an
> explicit
> +                * message so ESI1 is not involved.
> +                */
> +               drm_dp_cec_handle_irq(aux);
> +               goto unlock;
> +       }
> +
>         ret = drm_dp_dpcd_readb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
>                                 &cec_irq);
>         if (ret < 0 || !(cec_irq & DP_CEC_IRQ))
> @@ -307,7 +317,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const
> struct edid *edid)
>         u8 cap;
>  
>         /* No transfer function was set, so not a DP connector */
> -       if (!aux->transfer)
> +       if (!aux->transfer && !aux->is_remote)
>                 return;
>  
>  #ifndef CONFIG_MEDIA_CEC_RC
> @@ -375,6 +385,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const
> struct edid *edid)
>  unlock:
>         mutex_unlock(&aux->cec.lock);
>  }
> +
>  EXPORT_SYMBOL(drm_dp_cec_set_edid);

probably want to get rid of this whitespace

With that fixed, this is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  
>  /*
> @@ -383,7 +394,7 @@ EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  {
>         /* No transfer function was set, so not a DP connector */
> -       if (!aux->transfer)
> +       if (!aux->transfer && !aux->is_remote)
>                 return;
>  
>         cancel_delayed_work_sync(&aux->cec.unregister_work);
> @@ -393,6 +404,7 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>                 goto unlock;
>  
>         cec_phys_addr_invalidate(aux->cec.adap);
> +
>         /*
>          * We're done if we want to keep the CEC device
>          * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> @@ -428,7 +440,7 @@ void drm_dp_cec_register_connector(struct drm_dp_aux
> *aux,
>                                    struct drm_connector *connector)
>  {
>         WARN_ON(aux->cec.adap);
> -       if (WARN_ON(!aux->transfer))
> +       if (WARN_ON(!aux->transfer && !aux->is_remote))
>                 return;
>         aux->cec.connector = connector;
>         INIT_DELAYED_WORK(&aux->cec.unregister_work,
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 29aad3b6b31a..5612caf9fb49 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2359,6 +2359,8 @@ static void build_mst_prop_path(const struct
> drm_dp_mst_branch *mstb,
>  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
>                                        struct drm_dp_mst_port *port)
>  {
> +       drm_dp_cec_register_connector(&port->aux, connector);
> +
>         drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
>                     port->aux.name, connector->kdev->kobj.name);
>  
> @@ -2382,6 +2384,8 @@ void drm_dp_mst_connector_early_unregister(struct
> drm_connector *connector,
>         drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
>                     port->aux.name, connector->kdev->kobj.name);
>         drm_dp_aux_unregister_devnode(&port->aux);
> +
> +       drm_dp_cec_unregister_connector(&port->aux);
>  }
>  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
>  
> @@ -2682,6 +2686,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>                 queue_work(system_long_wq, &mstb->mgr->work);
>  }
>  
> +static void
> +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> +                           struct drm_dp_sink_event_notify *sink_event)
> +{
> +       struct drm_dp_mst_port *port;
> +
> +       if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> +               port = drm_dp_get_port(mstb, sink_event->port_number);
> +               if (port) {
> +                       drm_dp_cec_irq(&port->aux);
> +                       drm_dp_mst_topology_put_port(port);
> +               }
> +       }
> +}
> +
>  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct
> drm_dp_mst_topology_mgr *mgr,
>                                                                u8 lct, u8
> *rad)
>  {
> @@ -4170,6 +4189,8 @@ drm_dp_mst_process_up_req(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
>                 drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
>                 hotplug = true;
> +       } else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> +               drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
>         }
>  
>         drm_dp_mst_topology_put_mstb(mstb);
> @@ -4362,6 +4383,8 @@ drm_dp_mst_detect_port(struct drm_connector
> *connector,
>                 break;
>         }
>  out:
> +       if (ret != connector_status_connected)
> +               drm_dp_cec_unset_edid(&port->aux);
>         drm_dp_mst_topology_put_port(port);
>         return ret;
>  }
> @@ -4392,6 +4415,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector
> *connector, struct drm_dp_
>                 edid = drm_get_edid(connector, &port->aux.ddc);
>         }
>         port->has_audio = drm_detect_monitor_audio(edid);
> +       drm_dp_cec_set_edid(&port->aux, edid);
>         drm_dp_mst_topology_put_port(port);
>         return edid;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

