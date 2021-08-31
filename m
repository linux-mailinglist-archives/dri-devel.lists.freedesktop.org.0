Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B163FCFA7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 00:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999EB6E0EA;
	Tue, 31 Aug 2021 22:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ACA6E0EA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630450039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcHNx8YNEvbqLcGIkhlgoBpXUTa8ClUykCMCpsVZUJI=;
 b=SS0rAJ6Ia3RtNQCZH3lqR7vE3+MpyrPfHMt8XiTC2jM0u7d8KgMWIWtj1g1uqNeCrAHtJG
 of2/xZBh4/enZvWI7y8nt8JaXo+1pB/7NIRhylX1UNNU4Dm5VZvpadriqvkCnMY6qrmWxK
 jRvhnCbX2leguzsR47BIwUwq2pr931Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-rlTjOp5vOM2oXdSfN8A9ag-1; Tue, 31 Aug 2021 18:46:14 -0400
X-MC-Unique: rlTjOp5vOM2oXdSfN8A9ag-1
Received: by mail-qk1-f199.google.com with SMTP id
 70-20020a370b49000000b003d2f5f0dcc6so1219294qkl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 15:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lcHNx8YNEvbqLcGIkhlgoBpXUTa8ClUykCMCpsVZUJI=;
 b=Ix03+3vc5Ft0UffZimQuh+tAkPvSuuPGzJfC1d/AwSg0DYtf3/4DlMxjOiyP9mGqc6
 WksAGZ6XL6eSoAF8hZCWNfri+jAYeTqfF55WzZUvbueTZLOKRgZe0k2Mg0Fv2L9hZ3xB
 zC1mQxWmE4E1tJoC+sxiGlxdrG94tpLl2IbecNB/rI1+tNvPjNfm0oL2o1VXbLn5B227
 N95puLg2g6/3tTMm6YiSInor6kL54MEYKlptBltnd8L9mV0dgfu6lkrjyU8OdKlc4T19
 78/KXVFQDe5jGB0jBYr958IC0I1dShEm52akVAoVuMaCIXwgEbB02TL8/t25xQ79qXCS
 DM1A==
X-Gm-Message-State: AOAM531wU6PtYSeQKFaivSKDTZIO4rtQZjmjy/OvfqM8cTMFWSVDoyOs
 y+Ph/EmDUIG0co9jK2B6t8r6PWXAblhw7bQmEeyBeYltPJFx4vUNRbk+BzZrtNCAdsL/8ppn2wo
 VcNU5MG2Y+L+RiJS+02YVzOfXF47C
X-Received: by 2002:a05:622a:81:: with SMTP id
 o1mr5054798qtw.361.1630449974102; 
 Tue, 31 Aug 2021 15:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPCjvIc5j7K+g5aTix1PRIMbEW/jM8o50tZcTHcIkE05e3RRMcKzdYPPQrsmLHGhyS5+57Cw==
X-Received: by 2002:a05:622a:81:: with SMTP id
 o1mr5054784qtw.361.1630449973904; 
 Tue, 31 Aug 2021 15:46:13 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m8sm14473831qkk.130.2021.08.31.15.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:46:13 -0700 (PDT)
Message-ID: <dfa7d3536bf1f1c491f909509c4465d1a5bbc8af.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm: Update MST First Link Slot Information Based
 on Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Date: Tue, 31 Aug 2021 18:46:12 -0400
In-Reply-To: <836fe57ca1c4eb7916d27752ed8b087f2474ace6.camel@redhat.com>
References: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
 <20210827234322.2740301-2-Jerry.Zuo@amd.com>
 <373e528ab10df8d95214f3bf961281e516da8469.camel@redhat.com>
 <DM6PR12MB49128A88F7C315D866945443E5CC9@DM6PR12MB4912.namprd12.prod.outlook.com>
 <836fe57ca1c4eb7916d27752ed8b087f2474ace6.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
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

...I meant Wayne Lin, whoops. been going through a lot of emails today 😅


On Tue, 2021-08-31 at 18:45 -0400, Lyude Paul wrote:
> (sorry - I just wrote a second response to your email I meant to send to
> your
> coworker Jerry Zuo! You can ignore it)
> 
> On Tue, 2021-08-31 at 19:44 +0000, Zuo, Jerry wrote:
> > [AMD Official Use Only]
> > 
> > > -----Original Message-----
> > > From: Lyude Paul <lyude@redhat.com>
> > > Sent: August 30, 2021 4:00 PM
> > > To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org
> > > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Kazlauskas, Nicholas
> > > <Nicholas.Kazlauskas@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> > > Subject: Re: [PATCH 1/2] drm: Update MST First Link Slot Information
> > > Based
> > > on Encoding Format
> > > 
> > > On Fri, 2021-08-27 at 19:43 -0400, Fangzhi Zuo wrote:
> > > > 8b/10b encoding format requires to reserve the first slot for
> > > > recording metadata. Real data transmission starts from the second
> > > > slot, with a total of available 63 slots available.
> > > > 
> > > > In 128b/132b encoding format, metadata is transmitted separately in
> > > > LLCP packet before MTP. Real data transmission starts from the first
> > > > slot, with a total of 64 slots available.
> > > > 
> > > > Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 27
> > > > ++++++++++++++++++++-------
> > > >  include/drm/drm_dp_mst_helper.h       |  9 +++++++++
> > > >  2 files changed, 29 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > index 86d13d6bc463..30544801d2b8 100644
> > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > @@ -3370,7 +3370,7 @@ int drm_dp_update_payload_part1(struct
> > > > drm_dp_mst_topology_mgr *mgr)
> > > >         struct drm_dp_payload req_payload;
> > > >         struct drm_dp_mst_port *port;
> > > >         int i, j;
> > > > -       int cur_slots = 1;
> > > > +       int cur_slots = mgr->start_slot;
> > > >         bool skip;
> > > > 
> > > >         mutex_lock(&mgr->payload_lock); @@ -4323,7 +4323,7 @@ int
> > > > drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> > > >         num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
> > > > 
> > > >         /* max. time slots - one slot for MTP header */
> > > > -       if (num_slots > 63)
> > > > +       if (num_slots > mgr->total_avail_slots)
> > > >                 return -ENOSPC;
> > > >         return num_slots;
> > > >  }
> > > > @@ -4335,7 +4335,7 @@ static int drm_dp_init_vcpi(struct
> > > > drm_dp_mst_topology_mgr *mgr,
> > > >         int ret;
> > > > 
> > > >         /* max. time slots - one slot for MTP header */
> > > > -       if (slots > 63)
> > > > +       if (slots > mgr->total_avail_slots)
> > > >                 return -ENOSPC;
> > > > 
> > > >         vcpi->pbn = pbn;
> > > > @@ -4509,6 +4509,17 @@ int drm_dp_atomic_release_vcpi_slots(struct
> > > > drm_atomic_state *state,
> > > >  }
> > > >  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
> > > > 
> > > > +void drm_dp_mst_update_encoding_cap(struct
> > > drm_dp_mst_topology_mgr
> > > > +*mgr,
> > > > uint8_t link_encoding_cap)
> > > > +{
> > > > +       if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
> > > > +               mgr->total_avail_slots = 64;
> > > > +               mgr->start_slot = 0;
> > > > +       }
> > > > +       DRM_DEBUG_KMS("%s encoding format determined\n",
> > > > +                     (link_encoding_cap == DP_CAP_ANSI_128B132B) ?
> > > > "128b/132b" : "8b/10b");
> > > > +}
> > > > +EXPORT_SYMBOL(drm_dp_mst_update_encoding_cap);
> > > > +
> > > 
> > > This seems to be missing kdocs, can you fix that?
> > > 
> > > Also - I'm not convinced this is all of the work we have to do, as
> > > there's
> > > no
> > > locking taking place here in this function. If we're changing the number
> > > of
> > > available VCPI slots that we have, we need to be able to factor that
> > > into
> > > the
> > > atomic check logic which means that we can't rely on mgr->* for any kind
> > > of
> > > data that isn't guaranteed to remain consistent throughout the lifetime
> > > of
> > > the
> > > driver or topology. (Note that some of the old MST code didn't follow
> > > this
> > > logic, so I wouldn't be surprised if there's still exceptions to this we
> > > need to
> > > clean up).
> > > 
> > > Note that I still expect we'll have to keep some sort of track of the
> > > current
> > > total slot count in the topology mgr, but that should be reflecting the
> > > currently programmed state and not be relied on from our atomic check.
> > > 
> > 
> > Thanks Lyude for your comments.
> > 
> > Seems I should keep existing code to keep track of current slot status in
> > mgr.
> > That information is getting updated each time when topology change
> > detected.
> > That slot information saved in mgr is a sort of static, and could only be
> > used
> > for debug purpose to track what is the current encoding format.
> > 
> > > IMHO - the correct way we should go about adding support for this is to
> > > add
> > > something into drm_dp_mst_topology_state and integrate this into the
> > > atomic check helpers.
> > 
> > The slot information should also be added into drm_dp_mst_topology_state
> > to
> > reflect the real-time slot status.
> > 
> > I'd like to confirm the best place to get slot count info. updated.
> > Should the update be done within &drm_mode_config_funcs. atomic_check(),
> > before new stream is created, OR
> > should be updated within drm_dp_mst_atomic_check() ?
> > 
> > The updated slot count will be used in drm_dp_mst_atomic_check() to check
> > slot limit,
> > and in drm_dp_update_payload_part1() as initial cur_slots.
> > 
> > > 
> > > >  /**
> > > >   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
> > > >   * @mgr: manager for this port
> > > > @@ -4540,8 +4551,8 @@ bool drm_dp_mst_allocate_vcpi(struct
> > > > drm_dp_mst_topology_mgr *mgr,
> > > > 
> > > >         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
> > > >         if (ret) {
> > > > -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > > max=63 ret=%d\n",
> > > > -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> > > > +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > > +max=%d
> > > > ret=%d\n",
> > > > +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
> > > > > total_avail_slots, ret);
> > > >                 drm_dp_mst_topology_put_port(port);
> > > >                 goto out;
> > > >         }
> > > > @@ -5228,7 +5239,7 @@
> > > drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > > drm_dp_mst_topology_mgr *mgr,
> > > >                                          struct
> > > > drm_dp_mst_topology_state
> > > > *mst_state)
> > > >  {
> > > >         struct drm_dp_vcpi_allocation *vcpi;
> > > > -       int avail_slots = 63, payload_count = 0;
> > > > +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
> > > > 
> > > >         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
> > > >                 /* Releasing VCPI is always OK-even if the port is
> > > > gone */ @@ -5257,7 +5268,7 @@
> > > > drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > > drm_dp_mst_topology_mgr *mgr,
> > > >                 }
> > > >         }
> > > >         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI
> > > > avail=%d used=%d\n",
> > > > -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> > > > +                      mgr, mst_state, avail_slots,
> > > > +mgr->total_avail_slots -
> > > > avail_slots);
> > > > 
> > > >         return 0;
> > > >  }
> > > > @@ -5529,6 +5540,8 @@ int drm_dp_mst_topology_mgr_init(struct
> > > > drm_dp_mst_topology_mgr *mgr,
> > > >         if (!mgr->proposed_vcpis)
> > > >                 return -ENOMEM;
> > > >         set_bit(0, &mgr->payload_mask);
> > > > +       mgr->total_avail_slots = 63;
> > > > +       mgr->start_slot = 1;
> > > > 
> > > >         mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > > >         if (mst_state == NULL)
> > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > b/include/drm/drm_dp_mst_helper.h index ddb9231d0309..eac5ce48f214
> > > > 100644
> > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > @@ -661,6 +661,15 @@ struct drm_dp_mst_topology_mgr {
> > > >          */
> > > >         int pbn_div;
> > > > 
> > > > +       /**
> > > > +        * @total_avail_slots: available slots for data transmission
> > > > +        */
> > > > +       u8 total_avail_slots;
> > > > +       /**
> > > > +        * @start_slot: first slot index for data transmission
> > > > +        */
> > > > +       u8 start_slot;
> > > > +
> > > >         /**
> > > >          * @funcs: Atomic helper callbacks
> > > >          */
> > > 
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

