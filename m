Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72F5883EC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FE311B419;
	Tue,  2 Aug 2022 22:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B452B513
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659478352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Y0WynJgJNSfh9M8m5gL0/rvOhxBadhWnHgYusmFFV8=;
 b=L6Q/8cvv9m6vr9N4WIC+ZZeD16b5u+uGuTEFi5uwTvho5I8M/iFNgHwuGraEqTJqVZqNm4
 VAEmx5kZrTjlVqP99bG3nhIjwkW+3RRMMWP+Soyvj8dH9+PxA+ZN1D1dRjbWKtJjesY/Tg
 zbQJTp5WIaxVKaw7HlfSUYbCYhceEyo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-A4VevY_xM4anPp1dfe_3-Q-1; Tue, 02 Aug 2022 18:12:31 -0400
X-MC-Unique: A4VevY_xM4anPp1dfe_3-Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 l15-20020a05620a28cf00b006b46997c070so12628510qkp.20
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 15:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=8Y0WynJgJNSfh9M8m5gL0/rvOhxBadhWnHgYusmFFV8=;
 b=IooToeVqN8jvFlv2P5aYxhI+yKNNeRl0M0qAB+E+g4UkKLBkOhztI98Yqh7jq2riiB
 GNI2+jx0NEBuw8/Fe+jVpeBQFFzgkUFQvtsu6lwfvzLljp72bXS6aWmHczG/pquWMf1h
 NIArlVQJl/z/tjvahWGvyCf08cO1Cj2aatwEExflOHInw2jCEqTXmoIzlHmKVQH3HKLY
 yfK69EyjlHxGMyk8g0HTWz+Av/qwV2hpkGxlB/3eXEcPGcAzTjdZdaocKNjf18phNWd0
 HsUqaRt5pRN/bmF6yfKdOhsytolo28JM/tk6uJucsxrbwHH8OtUeRu0TU4DfW/938ei5
 KYAg==
X-Gm-Message-State: AJIora/nR2AS3VnjFAiiIzeTY6xO9GKqR+QraDK2/4JrNopA0Hl1kq2o
 snEO+jeP6P1qrxaBv3RCUF+vJCrqgfJRoSoa824cCiYOY8BH69FEUYyAgTUk+mEU3EkmODs/KHP
 A1kCJu9SxprKe6VgUU5Db8dhlQI+F
X-Received: by 2002:a05:620a:c52:b0:6b5:467f:4f6d with SMTP id
 u18-20020a05620a0c5200b006b5467f4f6dmr17268469qki.503.1659478350601; 
 Tue, 02 Aug 2022 15:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVi4NYTvyopJmtP9Nw2sj+ZJUYf1nCNfIK7eICNG5FUBO+EPj7/KKC2dY5Fub85vgbFtL4GQ==
X-Received: by 2002:a05:620a:c52:b0:6b5:467f:4f6d with SMTP id
 u18-20020a05620a0c5200b006b5467f4f6dmr17268453qki.503.1659478350366; 
 Tue, 02 Aug 2022 15:12:30 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 o20-20020ac87c54000000b0033a5048464fsm1898043qtv.11.2022.08.02.15.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:12:29 -0700 (PDT)
Message-ID: <31d47373883e9aabe5bfa7b172e21b84cc6a164d.camel@redhat.com>
Subject: Re: [RESEND RFC 15/18] drm/display/dp_mst: Skip releasing payloads
 if last connected port isn't connected
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Tue, 02 Aug 2022 18:12:28 -0400
In-Reply-To: <CO6PR12MB54890BFD954BBF578E2ADA67FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-16-lyude@redhat.com>
 <CO6PR12MB54890BFD954BBF578E2ADA67FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Lakha, 
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 08:45 +0000, Lin, Wayne wrote:
> [Public]
> 
> 
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Wednesday, June 8, 2022 3:30 AM
> > To: dri-devel@lists.freedesktop.org; nouveau@lists.freedesktop.org; amd-
> > gfx@lists.freedesktop.org
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Ville Syrjälä
> > <ville.syrjala@linux.intel.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Jani
> > Nikula
> > <jani.nikula@intel.com>; Imre Deak <imre.deak@intel.com>; Daniel Vetter
> > <daniel.vetter@ffwll.ch>; Sean Paul <sean@poorly.run>; David Airlie
> > <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Thomas Zimmermann
> > <tzimmermann@suse.de>; Lakha, Bhawanpreet
> > <Bhawanpreet.Lakha@amd.com>; open list <linux-kernel@vger.kernel.org>
> > Subject: [RESEND RFC 15/18] drm/display/dp_mst: Skip releasing payloads if
> > last connected port isn't connected
> > 
> > In the past, we've ran into strange issues regarding errors in response to
> > trying to destroy payloads after a port has been unplugged. We fixed this
> > back in:
> > 
> > This is intended to replace the workaround that was added here:
> > 
> > commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> > ports in stale topology")
> > 
> > which was intended fix to some of the payload leaks that were observed
> > before, where we would attempt to determine if the port was still
> > connected to the topology before updating payloads using
> > drm_dp_mst_port_downstream_of_branch. This wasn't a particularly good
> > solution, since one of the points of still having port and mstb validation
> > is to
> > avoid sending messages to newly disconnected branches wherever possible
> > - thus the required use of drm_dp_mst_port_downstream_of_branch
> > would indicate something may be wrong with said validation.
> > 
> > It seems like it may have just been races and luck that made
> > drm_dp_mst_port_downstream_of_branch work however, as while I was
> > trying to figure out the true cause of this issue when removing the legacy
> > MST code - I discovered an important excerpt in section 2.14.2.3.3.6 of
> > the DP
> > 2.0
> > specs:
> > 
> > "BAD_PARAM - This reply is transmitted when a Message Transaction
> > parameter is in error; for example, the next port number is invalid or /no
> > device is connected/ to the port associated with the port number."
> > 
> > Sure enough - removing the calls to
> > drm_dp_mst_port_downstream_of_branch()
> > and instead checking the ->ddps field of the parent port to see whether we
> > should release a given payload or not seems to totally fix the issue. This
> > does
> > actually make sense to me, as it seems the implication is that given a
> > topology where an MSTB is removed, the payload for the MST parent's port
> > will be released automatically if that port is also marked as
> > disconnected.
> > However, if there's another parent in the chain after that which is
> > connected
> > - payloads must be released there with an ALLOCATE_PAYLOAD message.
> > 
> > So, let's do that!
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sean Paul <sean@poorly.run>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 51 +++++++------------
> >  1 file changed, 17 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index dd314586bac3..70adb8db4335 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3137,7 +3137,7 @@ static struct drm_dp_mst_port
> > *drm_dp_get_last_connected_port_to_mstb(struct drm  static struct
> > drm_dp_mst_branch *  drm_dp_get_last_connected_port_and_mstb(struct
> > drm_dp_mst_topology_mgr *mgr,
> >                                         struct drm_dp_mst_branch *mstb,
> > -                                       int *port_num)
> > +                                       struct drm_dp_mst_port
> > **last_port)
> >  {
> >         struct drm_dp_mst_branch *rmstb = NULL;
> >         struct drm_dp_mst_port *found_port;
> > @@ -3153,7 +3153,8 @@
> > drm_dp_get_last_connected_port_and_mstb(struct
> > drm_dp_mst_topology_mgr *mgr,
> > 
> >                 if (drm_dp_mst_topology_try_get_mstb(found_port-
> > > parent)) {
> >                         rmstb = found_port->parent;
> > -                       *port_num = found_port->port_num;
> > +                       *last_port = found_port;
> > +                       drm_dp_mst_get_port_malloc(found_port);
> >                 } else {
> >                         /* Search again, starting from this parent */
> >                         mstb = found_port->parent;
> > @@ -3170,7 +3171,7 @@ static int drm_dp_payload_send_msg(struct
> > drm_dp_mst_topology_mgr *mgr,
> >                                    int pbn)
> >  {
> >         struct drm_dp_sideband_msg_tx *txmsg;
> > -       struct drm_dp_mst_branch *mstb;
> > +       struct drm_dp_mst_branch *mstb = NULL;
> >         int ret, port_num;
> >         u8 sinks[DRM_DP_MAX_SDP_STREAMS];
> >         int i;
> > @@ -3178,12 +3179,22 @@ static int drm_dp_payload_send_msg(struct
> > drm_dp_mst_topology_mgr *mgr,
> >         port_num = port->port_num;
> >         mstb = drm_dp_mst_topology_get_mstb_validated(mgr, port-
> > > parent);
> >         if (!mstb) {
> > -               mstb = drm_dp_get_last_connected_port_and_mstb(mgr,
> > -                                                              port-
> > >parent,
> > -                                                              &port_num);
> > +               struct drm_dp_mst_port *rport = NULL;
> > +               bool ddps;
> > 
> > +               mstb = drm_dp_get_last_connected_port_and_mstb(mgr,
> > port->parent,
> > +&rport);
> >                 if (!mstb)
> >                         return -EINVAL;
> > +
> > +               ddps = rport->ddps;
> > +               port_num = rport->port_num;
> > +               drm_dp_mst_put_port_malloc(rport);
> > +
> > +               /* If the port is currently marked as disconnected, don't
> > send
> > a payload message */
> > +               if (!ddps) {
> Hi Lyude,
> 
> Thanks for driving this!
> Shouldn't we still send ALLOCATE_PAYLOAD with PBN 0 to the last connected 
> Port even its peer device is disconnected? We rely on this "path msg" to
> update
> all payload ID tables along the virtual payload channel.
> 

Do you know if there's any devices that break with this change, btw? Would be
super useful to know imho, and if so I might be alright with dropping it
depending on what the answer to the next paragraph is.

> commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> ports in stale topology") was trying to skip updating payload for a target
> which is
> no longer existing in the current topology rooted at mgr->mst_primary. I
> passed
> "mgr->mst_primary" to drm_dp_mst_port_downstream_of_branch() previously.
> Sorry, I might not fully understand the issue you've seen. Could you
> elaborate on
> this more please?
> 
> Thanks!

I will have to double check this since it's been a month, but basically - the
idea of having the topology references in the first place was to be the one
check for figuring out whether something's in a topology or not. I've been
thinking of maybe trying to replace it at some point, but I think we'd want to
do it all over the helpers instead of just in certain spots.

The other thing I noticed was that when I was rewriting this code, I noticed
it seemed a lot like we had misunderstood the issue that was causing leaks in
the first place. The BAD_PARAM we noticed indicates the payload we're trying
to remove on the other end doesn't exist anymore, meaning the branch device in
question got rid of any payloads it had active in response to the CSN. In
testing though I found that payloads would be automatically released in
situations where the last reachable port was marked as disconnected via a
previous CSN, but was still reachable otherwise, and not in any other
situation. This also seemed to match up with the excerpts in the DP spec that
I found, so I assumed it was probably correct.

Also, I think using the DDPS field instead of trying to traverse the topology
state (which might not have been fully updated yet in response to CSNs) might
be a slightly better idea since DDPS may end up being updated before the port
has been removed from our in-memory topology, which is kind of one of the
reasons I've been considering trying to come up with a better solution then
topology references someday (unfortunately it works 'good enough' for the most
part, so definitely not a priority). This is 100% a guess on my part though.

> > +                       ret = -EINVAL;
> > +                       goto fail_put;
> > +               }
> >         }
> > 
> >         txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL); @@ -3384,7 +3395,6
> > @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr
> > *mgr, int start_s
> >         struct drm_dp_mst_port *port;
> >         int i, j;
> >         int cur_slots = start_slot;
> > -       bool skip;
> > 
> >         mutex_lock(&mgr->payload_lock);
> >         for (i = 0; i < mgr->max_payloads; i++) { @@ -3399,16 +3409,6 @@
> > int
> > drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> > int start_s
> >                         port = container_of(vcpi, struct drm_dp_mst_port,
> >                                             vcpi);
> > 
> > -                       mutex_lock(&mgr->lock);
> > -                       skip
> > = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
> > -                       mutex_unlock(&mgr->lock);
> > -
> > -                       if (skip) {
> > -                               drm_dbg_kms(mgr->dev,
> > -                                           "Virtual channel %d is not in
> > current
> > topology\n",
> > -                                           i);
> > -                               continue;
> > -                       }
> >                         /* Validated ports don't matter if we're releasing
> >                          * VCPI
> >                          */
> > @@ -3509,7 +3509,6 @@ int drm_dp_update_payload_part2(struct
> > drm_dp_mst_topology_mgr *mgr)
> >         struct drm_dp_mst_port *port;
> >         int i;
> >         int ret = 0;
> > -       bool skip;
> > 
> >         mutex_lock(&mgr->payload_lock);
> >         for (i = 0; i < mgr->max_payloads; i++) { @@ -3519,13 +3518,6 @@
> > int
> > drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
> > 
> >                 port = container_of(mgr->proposed_vcpis[i], struct
> > drm_dp_mst_port, vcpi);
> > 
> > -               mutex_lock(&mgr->lock);
> > -               skip = !drm_dp_mst_port_downstream_of_branch(port,
> > mgr->mst_primary);
> > -               mutex_unlock(&mgr->lock);
> > -
> > -               if (skip)
> > -                       continue;
> > -
> >                 drm_dbg_kms(mgr->dev, "payload %d %d\n", i, mgr-
> > > payloads[i].payload_state);
> >                 if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL)
> > {
> >                         ret = drm_dp_create_payload_step2(mgr, port, mgr-
> > > proposed_vcpis[i]->vcpi, &mgr->payloads[i]); @@ -4780,18 +4772,9 @@
> > EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
> >  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> >                                 struct drm_dp_mst_port *port)
> >  {
> > -       bool skip;
> > -
> >         if (!port->vcpi.vcpi)
> >                 return;
> > 
> > -       mutex_lock(&mgr->lock);
> > -       skip = !drm_dp_mst_port_downstream_of_branch(port, mgr-
> > > mst_primary);
> > -       mutex_unlock(&mgr->lock);
> > -
> > -       if (skip)
> > -               return;
> > -
> >         drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
> >         port->vcpi.num_slots = 0;
> >         port->vcpi.pbn = 0;
> > --
> > 2.35.3
> --
> Wayne Lin

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

