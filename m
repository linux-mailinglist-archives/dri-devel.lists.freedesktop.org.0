Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30B947C2A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8004B10E15B;
	Mon,  5 Aug 2024 13:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXFP66nP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4C10E15B;
 Mon,  5 Aug 2024 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722865658; x=1754401658;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cQgCyROh7fLbJsGP+jVz6p5k82HANaqAheccmp1s5mg=;
 b=IXFP66nPbaLljj/Hq/Yzpyq5YyAxgv7vlMG3DOhgOwGa09RxXH3Uv0pu
 VsJCYSIqrhh0dzP5Z4CikmoDomzYCZZHakGndfD71fJ5zb4SkcWSrZX6a
 tq16WJ+qPmqJfe4G7XWrK/HGrJ7GtHlhm2amUwfF+l73/Kepm/Bce5+G/
 9UmzeR8wQajflaqVfSaua1+mIBmlDWVkC3xRZYh/zrmZc0HuQSJc4/BHt
 Np9cl+lq3jEtA/+n82fd8CTfkLLic3zOW+Im1pVU1TYDFyJXN+QYVcqqv
 /mvokxk4YGopjmef7spygLnIbi23TbdEFUAZq/XI9ZjIuyoNnRxh/c5cu g==;
X-CSE-ConnectionGUID: RaGXsfcrScmskfYAkXbC1g==
X-CSE-MsgGUID: /OSMrhE/RcGOHwRUCWUgMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24595969"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24595969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 06:47:37 -0700
X-CSE-ConnectionGUID: Aj+wIEaiQB6gVJ3s/h421g==
X-CSE-MsgGUID: gyGNHDYPTm2E+/D/xqhxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56115014"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 06:47:35 -0700
Date: Mon, 5 Aug 2024 16:47:52 +0300
From: Imre Deak <imre.deak@intel.com>
To: Manasi Navare <navaremanasi@chromium.org>
Cc: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 03/14] drm/dp_mst: Simplify the condition when to
 enumerate path resources
Message-ID: <ZrDYCC-jpk0hpltR@ideak-desk.fi.intel.com>
References: <20240722165503.2084999-1-imre.deak@intel.com>
 <20240722165503.2084999-4-imre.deak@intel.com>
 <CAE72mNkg06wZGuwrhfGazP+=1yE4ufaXZJe8chVkGV9nw_oF1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE72mNkg06wZGuwrhfGazP+=1yE4ufaXZJe8chVkGV9nw_oF1g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 04, 2024 at 06:45:43AM -0700, Manasi Navare wrote:
> On Mon, Jul 22, 2024 at 9:55 AM Imre Deak <imre.deak@intel.com> wrote:
> >
> > In the
> >         if (old_ddps != port->ddps || !created)
> >                 if (port->ddps && !port->input)
> >                         ret = drm_dp_send_enum_path_resources();
> >
> > sequence the first if's condition is true if the port exists already
> > (!created) or the port was created anew (hence old_ddps==0) and it was
> > in the plugged state (port->ddps==1). The second if's condition is true
> > for output ports in the plugged state. So the function is called for an
> > output port in the plugged state, regardless if it already existed or
> > not and regardless of the old plugged state. In all other cases
> > port->full_pbn can be zeroed as the port is either an input for which
> > full_pbn is never set, or an output in the unplugged state for which
> > full_pbn was already zeroed previously or the port was just created
> > (with port->full_pbn==0).
> >
> > Simplify the condition, making it clear that the path resources are
> > always enumerated for an output port in the plugged state.
> 
> Would this take care of the cases where a branch device is present
> between source and the sink and its properly allocating the resources
> and advertising UHBR capability from branch to sink. This was a bug
> earlier with UHBR on branch device/ MST hub

I suppose you refer to [1].

The patchset as a whole should ensure that the BW reported by branch
devices via the ENUM_PATH_RESOURCES message is correct even across
changing between UHBR <-> non-UHBR link rates between the source and the
first downstream branch devices. More on this are detailed at [2] and
[3]. It looks like this would also address the issue described in [1],
but I couldn't test this yet, as I don't have any hub/dock supporting
UHBR rates.

--Imre

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10970
[2] https://patchwork.freedesktop.org/patch/605424/?series=136347&rev=2
[3] https://patchwork.freedesktop.org/patch/605419/?series=136347&rev=2



> 
> Manasi
> 
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 19 ++++++++-----------
> >  1 file changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 70e4bfc3532e0..bcc5bbed9bd04 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -2339,7 +2339,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
> >  {
> >         struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
> >         struct drm_dp_mst_port *port;
> > -       int old_ddps = 0, ret;
> > +       int ret;
> >         u8 new_pdt = DP_PEER_DEVICE_NONE;
> >         bool new_mcs = 0;
> >         bool created = false, send_link_addr = false, changed = false;
> > @@ -2372,7 +2372,6 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
> >                  */
> >                 drm_modeset_lock(&mgr->base.lock, NULL);
> >
> > -               old_ddps = port->ddps;
> >                 changed = port->ddps != port_msg->ddps ||
> >                         (port->ddps &&
> >                          (port->ldps != port_msg->legacy_device_plug_status ||
> > @@ -2407,15 +2406,13 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
> >          * Reprobe PBN caps on both hotplug, and when re-probing the link
> >          * for our parent mstb
> >          */
> > -       if (old_ddps != port->ddps || !created) {
> > -               if (port->ddps && !port->input) {
> > -                       ret = drm_dp_send_enum_path_resources(mgr, mstb,
> > -                                                             port);
> > -                       if (ret == 1)
> > -                               changed = true;
> > -               } else {
> > -                       port->full_pbn = 0;
> > -               }
> > +       if (port->ddps && !port->input) {
> > +               ret = drm_dp_send_enum_path_resources(mgr, mstb,
> > +                                                     port);
> > +               if (ret == 1)
> > +                       changed = true;
> > +       } else {
> > +               port->full_pbn = 0;
> >         }
> >
> >         ret = drm_dp_port_set_pdt(port, new_pdt, new_mcs);
> > --
> > 2.44.2
> >
