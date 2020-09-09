Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FB0262810
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416E26EA06;
	Wed,  9 Sep 2020 07:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C176EA04
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:10:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so1674039wrn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtmj5uPEpqhxC9o0DX4vOiZyXI5lMuxYoxf6p901bCo=;
 b=K6Cy98GqT7buX/sicFtFmkeXdI6HSXFoCD2pdz67W9rBoIbf0LBHNo37e/lPPmyw8t
 cY/5qkhni8LkC+iTVmvxN18Uh9gWh/aJNWXv2/2GodEAmyjHrB3jpTMAFiLscZgJ7EJ1
 X4Rt+f1kc76TEVD8Su4C9XlYC6/BmrL7q+EQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtmj5uPEpqhxC9o0DX4vOiZyXI5lMuxYoxf6p901bCo=;
 b=gCS7mFrEs8m0TlQS8Q3vYVQWwYOultFPSjc/8hN10zPArSatES4ozZcqJdu3VDj0f1
 KoQlMbpetXByOOMcwdYNSaHgWoNbqLwztRr5kG4c/YqSu3P0gTDg38iy7f4tfU6JEKdu
 3RbmaNyC3O00MQ20myfHTghgGZYQxjm3AioT5I3/RdnaDbH5+PcIWRgFLkoMaTlcLiF4
 9uVb8t7cYKIu7YlTKrYQLXlrCVdVqE5rND8X/t07ifS5b4fweXlOCVjvZgxgWz9kjXF9
 FS4G3k2MZZ/8EqMj+pDGI3BgDJCqbVXh9v5zQNLvmsgj9si5Jtxgsyj76P9Nc5q5gG00
 WTqA==
X-Gm-Message-State: AOAM532NOVelJhF5PlqP9vl6YedOBJS0ftzHgqhz+XonSTXbWnx2HK5z
 BKS3/gFWBFGlQSER6PrqHfoeg3zuy5M/rsmWtm89bg==
X-Google-Smtp-Source: ABdhPJxmoww9ZUUB8QjZ8Y4OgawYkyetrR+KKlU+u5qokoIJ+jqoJTN2fSx52h2cFjEVHsz/rpyArAG7Tzz12mhFgtg=
X-Received: by 2002:adf:f24f:: with SMTP id b15mr2435251wrp.301.1599635407102; 
 Wed, 09 Sep 2020 00:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200901162133.5.I900b1b80709b7632a47d0ddb4cd375b4a3616c9e@changeid>
 <bb5a9165-4605-f9da-81df-92278b393a30@xs4all.nl>
In-Reply-To: <bb5a9165-4605-f9da-81df-92278b393a30@xs4all.nl>
From: Sam McNally <sammc@chromium.org>
Date: Wed, 9 Sep 2020 17:09:29 +1000
Message-ID: <CAJqEsoA6vEbQCSuHZO5rCD_TwnuHBjYE3wT9gFsj5EKU6J_20A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm_dp_cec: add the implementation of MST support
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Sep 2020 at 18:08, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Sam,
>
> On 01/09/2020 08:22, Sam McNally wrote:
> > With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> > topology.
>
> Oh wow, this is finally supported in the spec. Very nice to see this.
> Also very nice to see that my old experimental patches attempting to
> support CEC on MST didn't go to waste!
>
> Do you know of any MST HW that supports this? I'd love to experiment
> with this.

A Realtek RTD2142 with the right firmware can support CEC over MST.
There's nothing released with it that I know of though.
>
> Regards,
>
>         Hans
>
> >
> > There are some minor differences for CEC tunneling through an MST
> > topology compared to CEC tunneling to an SST port:
> > - CEC IRQs are delivered via a sink event notify message
> > - CEC-related DPCD registers are accessed via remote DPCD reads and
> >   writes.
> >
> > This results in the MST implementation diverging from the existing SST
> > implementation:
> > - sink event notify messages with CEC_IRQ ID set indicate CEC IRQ rather
> >   than ESI1
> > - setting edid and handling CEC IRQs, which can be triggered from
> >   contexts where locks held preclude HPD handling, are deferred to avoid
> >   remote DPCD access which would block until HPD handling is performed
> >   or a timeout
> >
> > Register and unregister for all MST connectors, ensuring their
> > drm_dp_aux_cec struct won't be accessed uninitialized.
> >
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/drm_dp_cec.c          | 67 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
> >  include/drm/drm_dp_helper.h           |  4 ++
> >  3 files changed, 90 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> > index 04ab7b88055c..9f6aeaa27f00 100644
> > --- a/drivers/gpu/drm/drm_dp_cec.c
> > +++ b/drivers/gpu/drm/drm_dp_cec.c
> > @@ -249,6 +249,10 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
> >       if (!aux->transfer)
> >               return;
> >
> > +     if (aux->cec.is_mst) {
> > +             schedule_work(&aux->cec.mst_irq_work);
> > +             return;
> > +     }
> >       mutex_lock(&aux->cec.lock);
> >       if (!aux->cec.adap)
> >               goto unlock;
> > @@ -277,6 +281,24 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
> >       return true;
> >  }
> >
> > +static void drm_dp_cec_mst_irq_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux = container_of(work, struct drm_dp_aux,
> > +                                           cec.mst_irq_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +     mutex_lock(&aux->cec.lock);
> > +     if (aux->cec.adap)
> > +             drm_dp_cec_handle_irq(aux);
> > +
> > +     mutex_unlock(&aux->cec.lock);
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /*
> >   * Called if the HPD was low for more than drm_dp_cec_unregister_delay
> >   * seconds. This unregisters the CEC adapter.
> > @@ -298,7 +320,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
> >   * were unchanged and just update the CEC physical address. Otherwise
> >   * unregister the old CEC adapter and create a new one.
> >   */
> > -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
> > +                                    const struct edid *edid)
> >  {
> >       struct drm_connector *connector = aux->cec.connector;
> >       u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> > @@ -307,10 +330,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >       unsigned int num_las = 1;
> >       u8 cap;
> >
> > -     /* No transfer function was set, so not a DP connector */
> > -     if (!aux->transfer)
> > -             return;
> > -
> >  #ifndef CONFIG_MEDIA_CEC_RC
> >       /*
> >        * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
> > @@ -321,6 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >        */
> >       cec_caps &= ~CEC_CAP_RC;
> >  #endif
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> >
> >       mutex_lock(&aux->cec.lock);
> > @@ -375,6 +395,18 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >       }
> >       mutex_unlock(&aux->cec.lock);
> >  }
> > +
> > +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +{
> > +     /* No transfer function was set, so not a DP connector */
> > +     if (!aux->transfer)
> > +             return;
> > +
> > +     if (aux->cec.is_mst)
> > +             schedule_work(&aux->cec.mst_set_edid_work);
> > +     else
> > +             drm_dp_cec_handle_set_edid(aux, edid);
> > +}
> >  EXPORT_SYMBOL(drm_dp_cec_set_edid);
> >
> >  /*
> > @@ -393,6 +425,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
> >               goto unlock;
> >
> >       cec_phys_addr_invalidate(aux->cec.adap);
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +
> >       /*
> >        * We're done if we want to keep the CEC device
> >        * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> > @@ -414,6 +448,25 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
> >  }
> >  EXPORT_SYMBOL(drm_dp_cec_unset_edid);
> >
> > +static void drm_dp_cec_mst_set_edid_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux =
> > +             container_of(work, struct drm_dp_aux, cec.mst_set_edid_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +     struct edid *edid = NULL;
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +
> > +     edid = drm_get_edid(port->connector, &port->aux.ddc);
> > +
> > +     drm_dp_cec_handle_set_edid(aux, edid);
> > +
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /**
> >   * drm_dp_cec_register_connector() - register a new connector
> >   * @aux: DisplayPort AUX channel
> > @@ -435,6 +488,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> >       aux->cec.is_mst = is_mst;
> >       INIT_DELAYED_WORK(&aux->cec.unregister_work,
> >                         drm_dp_cec_unregister_work);
> > +     INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
> > +     INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
> >  }
> >  EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >
> > @@ -444,6 +499,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >   */
> >  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
> >  {
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +     cancel_work_sync(&aux->cec.mst_set_edid_work);
> >       if (!aux->cec.adap)
> >               return;
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index c783a2a1c114..fd9430d88fd6 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2183,6 +2183,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
> >  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
> >                                      struct drm_dp_mst_port *port)
> >  {
> > +     drm_dp_cec_register_connector(&port->aux, connector, true);
> > +
> >       DRM_DEBUG_KMS("registering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >
> > @@ -2206,6 +2208,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
> >       DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >       drm_dp_aux_unregister_devnode(&port->aux);
> > +
> > +     drm_dp_cec_unregister_connector(&port->aux);
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
> >
> > @@ -2515,6 +2519,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
> >               queue_work(system_long_wq, &mstb->mgr->work);
> >  }
> >
> > +static void
> > +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> > +                         struct drm_dp_sink_event_notify *sink_event)
> > +{
> > +     struct drm_dp_mst_port *port;
> > +
> > +     if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> > +             port = drm_dp_get_port(mstb, sink_event->port_number);
> > +             if (port) {
> > +                     drm_dp_cec_irq(&port->aux);
> > +                     drm_dp_mst_topology_put_port(port);
> > +             }
> > +     }
> > +}
> > +
> >  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
> >                                                              u8 lct, u8 *rad)
> >  {
> > @@ -3954,6 +3973,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
> >       if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
> >               drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
> >               hotplug = true;
> > +     } else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> > +             drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
> >       }
> >
> >       drm_dp_mst_topology_put_mstb(mstb);
> > @@ -4147,6 +4168,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >               break;
> >       }
> >  out:
> > +     if (ret != connector_status_connected)
> > +             drm_dp_cec_unset_edid(&port->aux);
> >       drm_dp_mst_topology_put_port(port);
> >       return ret;
> >  }
> > @@ -4177,6 +4200,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
> >               edid = drm_get_edid(connector, &port->aux.ddc);
> >       }
> >       port->has_audio = drm_detect_monitor_audio(edid);
> > +     drm_dp_cec_set_edid(&port->aux, edid);
> >       drm_dp_mst_topology_put_port(port);
> >       return edid;
> >  }
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 12bca1b9512b..e973eba06875 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1497,6 +1497,8 @@ struct drm_connector;
> >   * @connector: the connector this CEC adapter is associated with
> >   * @is_mst: this is an MST branch
> >   * @unregister_work: unregister the CEC adapter
> > + * @mst_irq_work: IRQ for CEC events on an MST branch
> > + * @mst_set_edid_work: set the EDID for an MST branch
> >   */
> >  struct drm_dp_aux_cec {
> >       struct mutex lock;
> > @@ -1504,6 +1506,8 @@ struct drm_dp_aux_cec {
> >       struct drm_connector *connector;
> >       bool is_mst;
> >       struct delayed_work unregister_work;
> > +     struct work_struct mst_irq_work;
> > +     struct work_struct mst_set_edid_work;
> >  };
> >
> >  /**
> >
>



On Tue, 8 Sep 2020 at 18:08, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Sam,
>
> On 01/09/2020 08:22, Sam McNally wrote:
> > With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> > topology.
>
> Oh wow, this is finally supported in the spec. Very nice to see this.
> Also very nice to see that my old experimental patches attempting to
> support CEC on MST didn't go to waste!
>
> Do you know of any MST HW that supports this? I'd love to experiment
> with this.
>



> Regards,
>
>         Hans
>
> >
> > There are some minor differences for CEC tunneling through an MST
> > topology compared to CEC tunneling to an SST port:
> > - CEC IRQs are delivered via a sink event notify message
> > - CEC-related DPCD registers are accessed via remote DPCD reads and
> >   writes.
> >
> > This results in the MST implementation diverging from the existing SST
> > implementation:
> > - sink event notify messages with CEC_IRQ ID set indicate CEC IRQ rather
> >   than ESI1
> > - setting edid and handling CEC IRQs, which can be triggered from
> >   contexts where locks held preclude HPD handling, are deferred to avoid
> >   remote DPCD access which would block until HPD handling is performed
> >   or a timeout
> >
> > Register and unregister for all MST connectors, ensuring their
> > drm_dp_aux_cec struct won't be accessed uninitialized.
> >
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/drm_dp_cec.c          | 67 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
> >  include/drm/drm_dp_helper.h           |  4 ++
> >  3 files changed, 90 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> > index 04ab7b88055c..9f6aeaa27f00 100644
> > --- a/drivers/gpu/drm/drm_dp_cec.c
> > +++ b/drivers/gpu/drm/drm_dp_cec.c
> > @@ -249,6 +249,10 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
> >       if (!aux->transfer)
> >               return;
> >
> > +     if (aux->cec.is_mst) {
> > +             schedule_work(&aux->cec.mst_irq_work);
> > +             return;
> > +     }
> >       mutex_lock(&aux->cec.lock);
> >       if (!aux->cec.adap)
> >               goto unlock;
> > @@ -277,6 +281,24 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
> >       return true;
> >  }
> >
> > +static void drm_dp_cec_mst_irq_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux = container_of(work, struct drm_dp_aux,
> > +                                           cec.mst_irq_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +     mutex_lock(&aux->cec.lock);
> > +     if (aux->cec.adap)
> > +             drm_dp_cec_handle_irq(aux);
> > +
> > +     mutex_unlock(&aux->cec.lock);
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /*
> >   * Called if the HPD was low for more than drm_dp_cec_unregister_delay
> >   * seconds. This unregisters the CEC adapter.
> > @@ -298,7 +320,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
> >   * were unchanged and just update the CEC physical address. Otherwise
> >   * unregister the old CEC adapter and create a new one.
> >   */
> > -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
> > +                                    const struct edid *edid)
> >  {
> >       struct drm_connector *connector = aux->cec.connector;
> >       u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> > @@ -307,10 +330,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >       unsigned int num_las = 1;
> >       u8 cap;
> >
> > -     /* No transfer function was set, so not a DP connector */
> > -     if (!aux->transfer)
> > -             return;
> > -
> >  #ifndef CONFIG_MEDIA_CEC_RC
> >       /*
> >        * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
> > @@ -321,6 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >        */
> >       cec_caps &= ~CEC_CAP_RC;
> >  #endif
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> >
> >       mutex_lock(&aux->cec.lock);
> > @@ -375,6 +395,18 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >       }
> >       mutex_unlock(&aux->cec.lock);
> >  }
> > +
> > +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +{
> > +     /* No transfer function was set, so not a DP connector */
> > +     if (!aux->transfer)
> > +             return;
> > +
> > +     if (aux->cec.is_mst)
> > +             schedule_work(&aux->cec.mst_set_edid_work);
> > +     else
> > +             drm_dp_cec_handle_set_edid(aux, edid);
> > +}
> >  EXPORT_SYMBOL(drm_dp_cec_set_edid);
> >
> >  /*
> > @@ -393,6 +425,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
> >               goto unlock;
> >
> >       cec_phys_addr_invalidate(aux->cec.adap);
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +
> >       /*
> >        * We're done if we want to keep the CEC device
> >        * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> > @@ -414,6 +448,25 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
> >  }
> >  EXPORT_SYMBOL(drm_dp_cec_unset_edid);
> >
> > +static void drm_dp_cec_mst_set_edid_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux =
> > +             container_of(work, struct drm_dp_aux, cec.mst_set_edid_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +     struct edid *edid = NULL;
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +
> > +     edid = drm_get_edid(port->connector, &port->aux.ddc);
> > +
> > +     drm_dp_cec_handle_set_edid(aux, edid);
> > +
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /**
> >   * drm_dp_cec_register_connector() - register a new connector
> >   * @aux: DisplayPort AUX channel
> > @@ -435,6 +488,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> >       aux->cec.is_mst = is_mst;
> >       INIT_DELAYED_WORK(&aux->cec.unregister_work,
> >                         drm_dp_cec_unregister_work);
> > +     INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
> > +     INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
> >  }
> >  EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >
> > @@ -444,6 +499,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >   */
> >  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
> >  {
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +     cancel_work_sync(&aux->cec.mst_set_edid_work);
> >       if (!aux->cec.adap)
> >               return;
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index c783a2a1c114..fd9430d88fd6 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2183,6 +2183,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
> >  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
> >                                      struct drm_dp_mst_port *port)
> >  {
> > +     drm_dp_cec_register_connector(&port->aux, connector, true);
> > +
> >       DRM_DEBUG_KMS("registering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >
> > @@ -2206,6 +2208,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
> >       DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >       drm_dp_aux_unregister_devnode(&port->aux);
> > +
> > +     drm_dp_cec_unregister_connector(&port->aux);
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
> >
> > @@ -2515,6 +2519,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
> >               queue_work(system_long_wq, &mstb->mgr->work);
> >  }
> >
> > +static void
> > +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> > +                         struct drm_dp_sink_event_notify *sink_event)
> > +{
> > +     struct drm_dp_mst_port *port;
> > +
> > +     if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> > +             port = drm_dp_get_port(mstb, sink_event->port_number);
> > +             if (port) {
> > +                     drm_dp_cec_irq(&port->aux);
> > +                     drm_dp_mst_topology_put_port(port);
> > +             }
> > +     }
> > +}
> > +
> >  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
> >                                                              u8 lct, u8 *rad)
> >  {
> > @@ -3954,6 +3973,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
> >       if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
> >               drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
> >               hotplug = true;
> > +     } else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> > +             drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
> >       }
> >
> >       drm_dp_mst_topology_put_mstb(mstb);
> > @@ -4147,6 +4168,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >               break;
> >       }
> >  out:
> > +     if (ret != connector_status_connected)
> > +             drm_dp_cec_unset_edid(&port->aux);
> >       drm_dp_mst_topology_put_port(port);
> >       return ret;
> >  }
> > @@ -4177,6 +4200,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
> >               edid = drm_get_edid(connector, &port->aux.ddc);
> >       }
> >       port->has_audio = drm_detect_monitor_audio(edid);
> > +     drm_dp_cec_set_edid(&port->aux, edid);
> >       drm_dp_mst_topology_put_port(port);
> >       return edid;
> >  }
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 12bca1b9512b..e973eba06875 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1497,6 +1497,8 @@ struct drm_connector;
> >   * @connector: the connector this CEC adapter is associated with
> >   * @is_mst: this is an MST branch
> >   * @unregister_work: unregister the CEC adapter
> > + * @mst_irq_work: IRQ for CEC events on an MST branch
> > + * @mst_set_edid_work: set the EDID for an MST branch
> >   */
> >  struct drm_dp_aux_cec {
> >       struct mutex lock;
> > @@ -1504,6 +1506,8 @@ struct drm_dp_aux_cec {
> >       struct drm_connector *connector;
> >       bool is_mst;
> >       struct delayed_work unregister_work;
> > +     struct work_struct mst_irq_work;
> > +     struct work_struct mst_set_edid_work;
> >  };
> >
> >  /**
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
