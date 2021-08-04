Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D403DF8BC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 02:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F36E97D;
	Wed,  4 Aug 2021 00:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999996E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 00:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628035730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sY1UxtnXvG6Ht3D4q2dI3/Frx2c1fYcxG6eAAUMWo9M=;
 b=im8nf7ewlyfgmi5LxVx0+XkH86x/vdFmvPvnIQHMtkHnLyhqzNG1wnqdZkIHjKsHZovtab
 ZOMeb0BLtCTC8Knd2jJkOQu35lMwYYLYq+V/s13rhaAYSmtUUQ73sdFObesuxIT9zgqSOz
 1FXQDJ9b6b8qDG9LFp37UYhWJ7ltkXs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-erlOQfV_MfaIa61YSIpfAw-1; Tue, 03 Aug 2021 20:08:47 -0400
X-MC-Unique: erlOQfV_MfaIa61YSIpfAw-1
Received: by mail-qv1-f69.google.com with SMTP id
 z25-20020a0ca9590000b029033ba243ffa1so460287qva.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 17:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=sY1UxtnXvG6Ht3D4q2dI3/Frx2c1fYcxG6eAAUMWo9M=;
 b=HQox9aUGudkeudn/xOBvvywjvaHT8IIIYmYamkYW8xBjZGgOwoYCqsRtHk6xoFHIJb
 B5yssNOoHnLpkJIwTUNNNCMaUL14tJ3ttRv3Jn3ooSNH+61R8tpnuXNwzdmhzDnGrowz
 4byvHzg6PEeggqnT1QTbY5pZ1y/fts3CMGAPGbo1W04tvlV+vGP3B7fy8TMbhzJGuFwz
 9sIzMF6CI7vaBPJzLXHvt9UQ0HmT0IBJcuLpoP4nmGsZ7Q6RTHiQB2wtJP8tytqEM/d7
 CAN9ose2/O5I0k8rXIDFZGwYUFiBStzSuHVIhzT2e89H4Du1L9hoYy5z2jQP02q+Dw3O
 dRiQ==
X-Gm-Message-State: AOAM532Pu5EUbT2d+icjubGsUUPQlmwsSJh4cuFUpCjq1OWxunpD5FH1
 zTe5/s2ZvwQOcL94fvvQE88ag/lEpGwxzNBwCDirmp5VNGGmpAEFtx/conCV5ZNXHD5hywEdMkS
 crL7cy2sUvaouhQpfBWp76AATxb95
X-Received: by 2002:a05:620a:e81:: with SMTP id
 w1mr23092754qkm.473.1628035726704; 
 Tue, 03 Aug 2021 17:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi6fv/aA0/8qfxEoNEhiGFx0cLyNQCPIsdR9AR92381CLDpdGoA5TuK7WctxhKsYkAIExVWQ==
X-Received: by 2002:a05:620a:e81:: with SMTP id
 w1mr23092703qkm.473.1628035726462; 
 Tue, 03 Aug 2021 17:08:46 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y67sm346696qkd.58.2021.08.03.17.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:08:45 -0700 (PDT)
Message-ID: <292d6ead03d6afe54f81d52f705e38bbf9feb7bd.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Only create connector for connected end
 device
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: Nicholas.Kazlauskas@amd.com, harry.wentland@amd.com, jerry.zuo@amd.com, 
 hersenxs.wu@amd.com, Juston Li <juston.li@intel.com>, Imre Deak
 <imre.deak@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Harry Wentland <hwentlan@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Nikola Cornij
 <nikola.cornij@amd.com>, Jani Nikula <jani.nikula@intel.com>, Manasi Navare
 <manasi.d.navare@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, Sean Paul
 <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Date: Tue, 03 Aug 2021 20:08:43 -0400
In-Reply-To: <69a5f39580f0d3519468f45ecbfd50d7ad1b3036.camel@redhat.com>
References: <20210720160342.11415-1-Wayne.Lin@amd.com>
 <20210720160342.11415-3-Wayne.Lin@amd.com>
 <69a5f39580f0d3519468f45ecbfd50d7ad1b3036.camel@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-08-03 at 19:58 -0400, Lyude Paul wrote:
> On Wed, 2021-07-21 at 00:03 +0800, Wayne Lin wrote:
> > [Why]
> > Currently, we will create connectors for all output ports no matter
> > it's connected or not. However, in MST, we can only determine
> > whether an output port really stands for a "connector" till it is
> > connected and check its peer device type as an end device.
> 
> What is this commit trying to solve exactly? e.g. is AMD currently running
> into issues with there being too many DRM connectors or something like that?
> Ideally this is behavior I'd very much like us to keep as-is unless there's
> good reason to change it.
> 
> Some context here btw - there's a lot of subtleties with MST locking that
> isn't immediately obvious. It's been a while since I wrote this code, but if
> I
> recall correctly one of those subtleties is that trying to create/destroy
> connectors on the fly when ports change types introduces a lot of potential
> issues with locking and some very complicated state transitions. Note that
> because we maintain the topology as much as possible across suspend/resumes
> this means there's a lot of potential state transitions with drm_dp_mst_port
> and drm_dp_mst_branch we need to handle that would typically be impossible
> to
> run into otherwise.
> 
> An example of this, if we were to try to prune connectors based on PDT
> on the fly: assume we have a simple topology like this
> 
> Root MSTB -> Port 1 -> MSTB 1.1 (Connected w/ display)
>           -> Port 2 -> MSTB 2.1
> 
> We suspend the system, unplug MSTB 1.1, and then resume. Once the
> system starts reprobing, it will notice that MSTB 1.1 has been
> disconnected. Since we no longer have a PDT, we decide to unregister our
> connector. But there's a catch! We had a display connected to MSTB 1.1,
> so even after unregistering the connector it's going to stay around
> until userspace has committed a new mode with the connector disabled.
> 
> Now - assuming we're still in the same spot in the resume processs, let's
> assume
> somehow MSTB 1.1 is suddenly plugged back in. Once we've finished
> responding to the hotplug event, we will have created a connector for
> it. Now we've hit a bug - userspace hasn't removed the previous zombie
> connector which means we have references to the drm_dp_mst_port in our
> atomic state and potentially also our payload tables (?? unsure about
> this one).

Whoops. One thing I totally forgot to mention here: the reason this is a
problem is because we'd now have two drm_connectors which both have the same
drm_dp_mst_port pointer.

> 
> So then how do we manage to add/remove connectors for input connectors
> on the fly? Well, that's one of the fun normally-impossible state
> transitions I mentioned before. According to the spec input ports are always
> disconnected, so we'll never receive a CSN for them. This means in
> theory the only possible way we could have a connector go from being an
> input connector to an output connector connector would be if the entire
> topology was swapped out during suspend/resume, and the input/output
> ports in the two topologies topology happen to be in different places.
> Since we only have to reprobe once during resume before we get
> hotplugging enabled, we're guaranteed this state transition will only
> happen once in this state - which means the second replug I described in
> the previous paragraph can never happen.
> 
> Note that while I don't actually know if there's topologies with input
> ports at indexes other than 0, since the specification isn't super clear
> on this bit we play it safe and assume it is possible.
> 
> Anyway-this is -all- based off my memory, so please point out anything
> here that I've explained that doesn't make sense or doesn't seem
> correct :). It's totally possible I might have misremembered something.
> 
> > 
> > In current code, we have chance to create connectors for output ports
> > connected with branch device and these are redundant connectors. e.g.
> > StarTech 1-to-4 DP hub is constructed by internal 2 layer 1-to-2 branch
> > devices. Creating connectors for such internal output ports are
> > redundant.
> > 
> > [How]
> > Put constraint on creating connector for connected end device only.
> > 
> > Fixes: 6f85f73821f6 ("drm/dp_mst: Add basic topology reprobing when
> > resuming")
> > Cc: Juston Li <juston.li@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <hwentlan@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Cc: Eryk Brol <eryk.brol@amd.com>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Nikola Cornij <nikola.cornij@amd.com>
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: "José Roberto de Souza" <jose.souza@intel.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v5.5+
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 51cd7f74f026..f13c7187b07f 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2474,7 +2474,8 @@ drm_dp_mst_handle_link_address_port(struct
> > drm_dp_mst_branch *mstb,
> >  
> >         if (port->connector)
> >                 drm_modeset_unlock(&mgr->base.lock);
> > -       else if (!port->input)
> > +       else if (!port->input && port->pdt != DP_PEER_DEVICE_NONE &&
> > +                drm_dp_mst_is_end_device(port->pdt, port->mcs))
> >                 drm_dp_mst_port_add_connector(mstb, port);
> >  
> >         if (send_link_addr && port->mstb) {
> > @@ -2557,6 +2558,10 @@ drm_dp_mst_handle_conn_stat(struct
> > drm_dp_mst_branch
> > *mstb,
> >                 dowork = false;
> >         }
> >  
> > +       if (!port->input && !port->connector && new_pdt !=
> > DP_PEER_DEVICE_NONE &&
> > +           drm_dp_mst_is_end_device(new_pdt, new_mcs))
> > +               create_connector = true;
> > +
> >         if (port->connector)
> >                 drm_modeset_unlock(&mgr->base.lock);
> >         else if (create_connector)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

