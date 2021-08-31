Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF493FCF9E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 00:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720F6E0D4;
	Tue, 31 Aug 2021 22:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9386E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630449860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOz3ENKsYXJqh19GRtNwGjsx5Pb12hCtU/RNERu1J8E=;
 b=dYRCNGOHtT/Beott8u1WgT30T2stlf99yVs2VgN1EdI34WsvSANHHw72NQTIPLqQhgmBCZ
 TzAF8bJUkX04kc+gNFIPVFNnYb1+H6zIAKqQJ8MtkynWyMD+YmWUEkjnWaP0dKia3Xbhe8
 Zw6QqRXipIdrgH5hrkCmV13A14lTvfg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_qFHKdhLN-2YCwoKTnxKZw-1; Tue, 31 Aug 2021 18:44:17 -0400
X-MC-Unique: _qFHKdhLN-2YCwoKTnxKZw-1
Received: by mail-qt1-f200.google.com with SMTP id
 e6-20020ac84e46000000b0029baad9aaa0so1229723qtw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 15:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jOz3ENKsYXJqh19GRtNwGjsx5Pb12hCtU/RNERu1J8E=;
 b=e+YI3FcoSisk1hfoz2lZuEcYcmtJ4jvg2Z/mfqtJ2zPvnJpCIVXhtBf49dKE40Mtff
 33/COc+oUa5w/CMGuBjjzgegwKpXcjQejbhM0yollwxhOY5HYzHo3/I39LDO+cZXJL2k
 bMSMMFc2lZ8uE7IhFBGEghqcDi4leEfF5SrJvzlujhk57qxkkyzhIG3rtPDNPKX6yZER
 kf7jTqErYUZLzaQTuszfrTfSVzkADwZbFpjZHuhaPkVQFGm6Dg0ax86XaWRTFqYDcsFo
 kqWBzgF0j0dTL53Ctp8JTk8OzEsFpPhrFGlR4IHsJOwZxhifUxd6/NpncJWVXZ3GxOoD
 ZsmQ==
X-Gm-Message-State: AOAM5306z6ZWRDJ6+3iuSD1rpecq+7ehu8Qrsyc1LbxBTZCmrEisxzJC
 YfwOAsf7iD2pwFOriKGM2IMEfeurR0HTghPyNCPne9jMYKdKCZknbQxTXZfQee64Hrogp2U2QhH
 e+ZtvLZ9r4LJN7Cp5bWn44SKH4rSh
X-Received: by 2002:a37:a3cd:: with SMTP id m196mr5421967qke.253.1630449856853; 
 Tue, 31 Aug 2021 15:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8ohn/G08YFEan3vdNZrUZ+StFbXK1B8QCG8FLzHWYnnsaIkKG+udMt2ZtCuygc1lihf2gGw==
X-Received: by 2002:a37:a3cd:: with SMTP id m196mr5421956qke.253.1630449856689; 
 Tue, 31 Aug 2021 15:44:16 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n18sm15239774qkn.63.2021.08.31.15.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:44:15 -0700 (PDT)
Message-ID: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm: Update MST First Link Slot Information Based
 on Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Date: Tue, 31 Aug 2021 18:44:14 -0400
In-Reply-To: <DM6PR12MB49128A88F7C315D866945443E5CC9@DM6PR12MB4912.namprd12.prod.outlook.com>
References: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
 <20210827234322.2740301-2-Jerry.Zuo@amd.com>
 <373e528ab10df8d95214f3bf961281e516da8469.camel@redhat.com>
 <DM6PR12MB49128A88F7C315D866945443E5CC9@DM6PR12MB4912.namprd12.prod.outlook.com>
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

(I am going to try responding to this tomorrow btw. I haven't been super busy
this week, but this has been a surprisingly difficult email to respond to
because I need to actually need to do a deep dive some of the MST helpers
tomorrow to figure out more of the specifics on why I realized we couldn't
just hot add/remove port->connector here).

On Tue, 2021-08-31 at 19:44 +0000, Zuo, Jerry wrote:
> [AMD Official Use Only]
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: August 30, 2021 4:00 PM
> > To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org
> > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Kazlauskas, Nicholas
> > <Nicholas.Kazlauskas@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> > Subject: Re: [PATCH 1/2] drm: Update MST First Link Slot Information Based
> > on Encoding Format
> > 
> > On Fri, 2021-08-27 at 19:43 -0400, Fangzhi Zuo wrote:
> > > 8b/10b encoding format requires to reserve the first slot for
> > > recording metadata. Real data transmission starts from the second
> > > slot, with a total of available 63 slots available.
> > > 
> > > In 128b/132b encoding format, metadata is transmitted separately in
> > > LLCP packet before MTP. Real data transmission starts from the first
> > > slot, with a total of 64 slots available.
> > > 
> > > Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 27
> > > ++++++++++++++++++++-------
> > >  include/drm/drm_dp_mst_helper.h       |  9 +++++++++
> > >  2 files changed, 29 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 86d13d6bc463..30544801d2b8 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3370,7 +3370,7 @@ int drm_dp_update_payload_part1(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >         struct drm_dp_payload req_payload;
> > >         struct drm_dp_mst_port *port;
> > >         int i, j;
> > > -       int cur_slots = 1;
> > > +       int cur_slots = mgr->start_slot;
> > >         bool skip;
> > > 
> > >         mutex_lock(&mgr->payload_lock); @@ -4323,7 +4323,7 @@ int
> > > drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> > >         num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
> > > 
> > >         /* max. time slots - one slot for MTP header */
> > > -       if (num_slots > 63)
> > > +       if (num_slots > mgr->total_avail_slots)
> > >                 return -ENOSPC;
> > >         return num_slots;
> > >  }
> > > @@ -4335,7 +4335,7 @@ static int drm_dp_init_vcpi(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >         int ret;
> > > 
> > >         /* max. time slots - one slot for MTP header */
> > > -       if (slots > 63)
> > > +       if (slots > mgr->total_avail_slots)
> > >                 return -ENOSPC;
> > > 
> > >         vcpi->pbn = pbn;
> > > @@ -4509,6 +4509,17 @@ int drm_dp_atomic_release_vcpi_slots(struct
> > > drm_atomic_state *state,
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
> > > 
> > > +void drm_dp_mst_update_encoding_cap(struct
> > drm_dp_mst_topology_mgr
> > > +*mgr,
> > > uint8_t link_encoding_cap)
> > > +{
> > > +       if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
> > > +               mgr->total_avail_slots = 64;
> > > +               mgr->start_slot = 0;
> > > +       }
> > > +       DRM_DEBUG_KMS("%s encoding format determined\n",
> > > +                     (link_encoding_cap == DP_CAP_ANSI_128B132B) ?
> > > "128b/132b" : "8b/10b");
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_mst_update_encoding_cap);
> > > +
> > 
> > This seems to be missing kdocs, can you fix that?
> > 
> > Also - I'm not convinced this is all of the work we have to do, as there's
> > no
> > locking taking place here in this function. If we're changing the number
> > of
> > available VCPI slots that we have, we need to be able to factor that into
> > the
> > atomic check logic which means that we can't rely on mgr->* for any kind
> > of
> > data that isn't guaranteed to remain consistent throughout the lifetime of
> > the
> > driver or topology. (Note that some of the old MST code didn't follow this
> > logic, so I wouldn't be surprised if there's still exceptions to this we
> > need to
> > clean up).
> > 
> > Note that I still expect we'll have to keep some sort of track of the
> > current
> > total slot count in the topology mgr, but that should be reflecting the
> > currently programmed state and not be relied on from our atomic check.
> > 
> 
> Thanks Lyude for your comments.
> 
> Seems I should keep existing code to keep track of current slot status in
> mgr.
> That information is getting updated each time when topology change detected.
> That slot information saved in mgr is a sort of static, and could only be
> used
> for debug purpose to track what is the current encoding format.
> 
> > IMHO - the correct way we should go about adding support for this is to
> > add
> > something into drm_dp_mst_topology_state and integrate this into the
> > atomic check helpers.
> 
> The slot information should also be added into drm_dp_mst_topology_state to
> reflect the real-time slot status.
> 
> I'd like to confirm the best place to get slot count info. updated.
> Should the update be done within &drm_mode_config_funcs. atomic_check(),
> before new stream is created, OR
> should be updated within drm_dp_mst_atomic_check() ?
> 
> The updated slot count will be used in drm_dp_mst_atomic_check() to check
> slot limit,
> and in drm_dp_update_payload_part1() as initial cur_slots.
> 
> > 
> > >  /**
> > >   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
> > >   * @mgr: manager for this port
> > > @@ -4540,8 +4551,8 @@ bool drm_dp_mst_allocate_vcpi(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > > 
> > >         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
> > >         if (ret) {
> > > -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > max=63 ret=%d\n",
> > > -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> > > +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > +max=%d
> > > ret=%d\n",
> > > +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
> > > > total_avail_slots, ret);
> > >                 drm_dp_mst_topology_put_port(port);
> > >                 goto out;
> > >         }
> > > @@ -5228,7 +5239,7 @@
> > drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >                                          struct
> > > drm_dp_mst_topology_state
> > > *mst_state)
> > >  {
> > >         struct drm_dp_vcpi_allocation *vcpi;
> > > -       int avail_slots = 63, payload_count = 0;
> > > +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
> > > 
> > >         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
> > >                 /* Releasing VCPI is always OK-even if the port is
> > > gone */ @@ -5257,7 +5268,7 @@
> > > drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >                 }
> > >         }
> > >         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI
> > > avail=%d used=%d\n",
> > > -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> > > +                      mgr, mst_state, avail_slots,
> > > +mgr->total_avail_slots -
> > > avail_slots);
> > > 
> > >         return 0;
> > >  }
> > > @@ -5529,6 +5540,8 @@ int drm_dp_mst_topology_mgr_init(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >         if (!mgr->proposed_vcpis)
> > >                 return -ENOMEM;
> > >         set_bit(0, &mgr->payload_mask);
> > > +       mgr->total_avail_slots = 63;
> > > +       mgr->start_slot = 1;
> > > 
> > >         mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > >         if (mst_state == NULL)
> > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > b/include/drm/drm_dp_mst_helper.h index ddb9231d0309..eac5ce48f214
> > > 100644
> > > --- a/include/drm/drm_dp_mst_helper.h
> > > +++ b/include/drm/drm_dp_mst_helper.h
> > > @@ -661,6 +661,15 @@ struct drm_dp_mst_topology_mgr {
> > >          */
> > >         int pbn_div;
> > > 
> > > +       /**
> > > +        * @total_avail_slots: available slots for data transmission
> > > +        */
> > > +       u8 total_avail_slots;
> > > +       /**
> > > +        * @start_slot: first slot index for data transmission
> > > +        */
> > > +       u8 start_slot;
> > > +
> > >         /**
> > >          * @funcs: Atomic helper callbacks
> > >          */
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

