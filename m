Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3B30BCD2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 12:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23AC89C07;
	Tue,  2 Feb 2021 11:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8F89C07
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 11:22:13 +0000 (UTC)
IronPort-SDR: 3iv0ZSiDVqSbX2lnyJk2VUaigAusqoGuJN73Ry+uArj0zKHplaTbQBxBe3QtWvsHtHozLlihjA
 NVZTxXfH1YGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168515483"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="168515483"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 03:22:12 -0800
IronPort-SDR: /1V5fzeEwGzRZz4DCX7n893+GxToAy3bSuaOseczwa4d1XoTuChdIUXvXCZuMVHPp447V7f4Vr
 lmmTTuKYPbrw==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="578673540"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 03:22:10 -0800
Date: Tue, 2 Feb 2021 13:22:07 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Message-ID: <20210202112207.GA494606@ideak-desk.fi.intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
 <20210201120145.350258-2-imre.deak@intel.com>
 <BN8PR12MB4770A088BA001258FCDE973AFCB59@BN8PR12MB4770.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB4770A088BA001258FCDE973AFCB59@BN8PR12MB4770.namprd12.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 03:38:16AM +0000, Lin, Wayne wrote:
> [AMD Public Use]
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Monday, February 1, 2021 8:02 PM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>
> > Subject: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
> >
> > Caching EDIDs for physical ports prevents updating the EDID if a port gets reconnected via a Connection Status Notification message,
> > fix this.
> >
> > Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index deb7995f42fa..309afe61afdd 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2302,7 +2302,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
> >  }
> >
> >  if (port->pdt != DP_PEER_DEVICE_NONE &&
> > -    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> > +    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
> > +    port->port_num >= DP_MST_LOGICAL_PORT_0) {
> Hi Imre Deak,
> 
> Thanks for the patch!
> Just curious that you mean we don't want to fetch the EDID of the sst
> monitor like below case?
>
>     Src->MST device ->SST monitor

The intention of the mst cached_edid logic is to cache the EDID for
logical ports where the EDID cannot change anyway. The EDID on physical
ports is fetched during connector probing just as for any other
connector.

> I thought we still need to get the EDID even the monitor is connected
> to the physical output port of mst device.

For sinks attached to phyisical ports we get the EDID whenever probing
the corresponding connector.

> Maybe what we should fix here is why the EDID is not get updated once
> reconnected via CSN message?

This patch fixes the problem that we stopped updating the EDID for
physical connectors. After this change it will get updated when probing
such connectors.

> Thanks!
> >  port->cached_edid = drm_get_edid(port->connector,
> >   &port->aux.ddc);
> >  drm_connector_set_tile_property(port->connector);
> > --
> > 2.25.1
> Regards,
> Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
