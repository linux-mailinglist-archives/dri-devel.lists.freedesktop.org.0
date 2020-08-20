Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A124C4FF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14986E9A8;
	Thu, 20 Aug 2020 18:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F656E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 18:03:21 +0000 (UTC)
IronPort-SDR: 9BGL/jH0VAeCCvRqlGyOLBaP3KIkSxazPgfLcWQNNHJw+Ka6BFh+lCQylEA2k/D21YFm8bAv6m
 bEAfH0/Z6cTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="156430077"
X-IronPort-AV: E=Sophos;i="5.76,334,1592895600"; d="scan'208";a="156430077"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 11:03:20 -0700
IronPort-SDR: S4p126MCiKlIxJsIsWUV3tm82b5hHCiHGuZgAZOxjmaZdNzFnwNc8osQDQKeb2Q+QIxiM7Oauz
 lGNVkIxPohrg==
X-IronPort-AV: E=Sophos;i="5.76,334,1592895600"; d="scan'208";a="472741700"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 11:03:18 -0700
Date: Thu, 20 Aug 2020 21:03:12 +0300
From: Imre Deak <imre.deak@intel.com>
To: Sam McNally <sammc@chromium.org>, Wayne Lin <Wayne.Lin@amd.com>,
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Add ddc i2c device links for DP MST connectors
Message-ID: <20200820180312.GC2423@ideak-desk.fi.intel.com>
References: <20200729161510.1.Iaa9c3d7c4332cf8717653f3d3ae6f2b955aa3fc6@changeid>
 <20200814145956.GA12962@ideak-desk.fi.intel.com>
 <CAJqEsoCAR-3NNL+pD4QeUWioq-uLdEdZwNrPVkzjULM39KiayA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJqEsoCAR-3NNL+pD4QeUWioq-uLdEdZwNrPVkzjULM39KiayA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 12:27:03PM +1000, Sam McNally wrote:
> > > [...]
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 1ac874e4e7a1..73a2299c2faa 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -2161,11 +2161,23 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
> > >  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
> > >                                      struct drm_dp_mst_port *port)
> > >  {
> > > +     int ret;
> > >       DRM_DEBUG_KMS("registering %s remote bus for %s\n",
> > >                     port->aux.name, connector->kdev->kobj.name);
> > >
> > >       port->aux.dev = connector->kdev;
> > > -     return drm_dp_aux_register_devnode(&port->aux);
> > > +     ret = drm_dp_aux_register_devnode(&port->aux);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (port->pdt != DP_PEER_DEVICE_NONE &&
> > > +         drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> >
> > How can we get here when drm_dp_mst_is_end_device(port) is not true?
> > AFAICS that's only case where we should create a connector and an i2c
> > device. (IOW we don't create them for branch ports.)
> 
> I'm not sure what you mean. Wouldn't this condition be checked during
> the registration of any MST connector? This follows the pattern used
> in drm_dp_mst_port_add_connector() [0], which seems like it's invoked
> in the same cases as drm_dp_mst_connector_late_register(), modulo
> early outs for errors.

Re-reading the code, a DRM connector is created whenever the MST port is
an output port, so even in the case of an output branch port.

I'm still not sure why we can't register/unregister the I2C bus whenever
creating/removing the DRM connector. That's also the scope of the AUX
bus, which is what I2C depends on, and if a port doesn't support I2C
messaging then the corresponding AUX messages would be NAKed.

--Imre

> 
> [0] https://cgit.freedesktop.org/drm-tip/tree/drivers/gpu/drm/drm_dp_mst_topology.c?id=1939e049a8ec6cef03a098f7cc99cb0bbcff21c6#n2188
> 
> 
> 
> > > +             ret = sysfs_create_link(&port->connector->kdev->kobj,
> > > +                                     &port->aux.ddc.dev.kobj, "ddc");
> > > +             if (ret)
> > > +                     drm_dp_aux_unregister_devnode(&port->aux);
> > > +     }
> > > +     return ret;
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_mst_connector_late_register);
> > >
> > > @@ -5490,6 +5502,7 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
> > >  {
> > >       struct drm_dp_aux *aux = &port->aux;
> > >       struct device *parent_dev = port->mgr->dev->dev;
> > > +     int ret;
> > >
> > >       aux->ddc.algo = &drm_dp_mst_i2c_algo;
> > >       aux->ddc.algo_data = aux;
> > > @@ -5504,7 +5517,17 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
> > >       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
> > >               sizeof(aux->ddc.name));
> > >
> > > -     return i2c_add_adapter(&aux->ddc);
> > > +     ret = i2c_add_adapter(&aux->ddc);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (port->connector && port->connector->kdev) {
> > > +             ret = sysfs_create_link(&port->connector->kdev->kobj,
> > > +                                     &port->aux.ddc.dev.kobj, "ddc");
> > > +             if (ret)
> > > +                     i2c_del_adapter(&port->aux.ddc);
> > > +     }
> > > +     return ret;
> > >  }
> > >
> > >  /**
> > > @@ -5513,6 +5536,8 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
> > >   */
> > >  static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
> > >  {
> > > +     if (port->connector && port->connector->kdev)
> > > +             sysfs_remove_link(&port->connector->kdev->kobj, "ddc");
> > >       i2c_del_adapter(&port->aux.ddc);
> > >  }
> > >
> > > --
> > > 2.28.0.rc0.142.g3c755180ce-goog
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
