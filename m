Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0B42CA2C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400D089105;
	Wed, 13 Oct 2021 19:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8989C6EAC2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 19:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634153835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cvCdnUvGzDO2BjaZ3EQlsZrBsKf21x5fv6f3NZE6jg=;
 b=eADM+PGFbcHvY3xLlAjpnn7gW0NzrhJyE3e9tuQrTdvBtPf8SkbyekiG1sWv4LDlHtvl35
 nD6Wl19WpAPAU5k3iG8dVrMwfv9Vx1R47u+lJcsGHWirgQ4FMgG8u5rDfOno6pOm0cQHp2
 NZdLYiv1fbe51aUmL3ODAral503+808=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-HgzPviYlNbKVnBTzpDBDoQ-1; Wed, 13 Oct 2021 15:37:14 -0400
X-MC-Unique: HgzPviYlNbKVnBTzpDBDoQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 z29-20020a05620a08dd00b0045fa369b83dso2708133qkz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=7cvCdnUvGzDO2BjaZ3EQlsZrBsKf21x5fv6f3NZE6jg=;
 b=iDZNtDJOM1u6K9gOE8/6XBBKaPag0Vo/yBqGPvAUC7PSV680iRxiad1tJeEP9fEvAF
 EL6Fqb+NgurV+XsCd8TSnQM9OqyEVfSIADhpJXWSmlLShNxmabvePW9sRK1wIs0ld2RH
 APMr+oi/sdjVr3IJlr/dYEyeTU916BkY4nOVfEyTdsfatYXO+rrOwxrH46yHpbohHFHy
 AZy1Ob2yF/XqQFy98MWIQsZTRzJO6e+yp2fdPQNeniMqClpb+pASBWduEqfNL0a+cRp9
 uC47oQMLwHSZKjNr48eEWANn+N7r+dsp9g4USTGz9wh4K8C4Y/9qtnVEzhx6UALfSmmo
 m4fA==
X-Gm-Message-State: AOAM532Hckp0lY0iZPgNbvhIqmVfYo1bZCsXT4G7EkKZezJNOirTJOdE
 HRXdkAEaNiurToRVwslLHmywfF0Pr2GkvcX5p6UzHbBFNleHcC82+aYqDlXuA5Cr6Gvkyar4GQ+
 7vfTJnSITshX4xUAueMFdlee4bgyk
X-Received: by 2002:ac8:5f54:: with SMTP id y20mr1497917qta.324.1634153833848; 
 Wed, 13 Oct 2021 12:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZr0RqPL90fJZ15UND3mbtnKuN6Ll3ud3SjrZzNqEaNLYObp/WmLtoreF/ZQwl9z4Ux84mJA==
X-Received: by 2002:ac8:5f54:: with SMTP id y20mr1497883qta.324.1634153833595; 
 Wed, 13 Oct 2021 12:37:13 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id d186sm268687qkg.25.2021.10.13.12.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 12:37:13 -0700 (PDT)
Message-ID: <4482a83ab4937369fa597f73d959ef10d0b4cf77.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com
Date: Wed, 13 Oct 2021 15:37:12 -0400
In-Reply-To: <b7af88e3-ed97-0f13-53ff-9e591844f62e@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <871r4oykh5.fsf@intel.com> <b7af88e3-ed97-0f13-53ff-9e591844f62e@amd.com>
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

On Wed, 2021-10-13 at 15:33 -0400, Bhawanpreet Lakha wrote:
> 
> > I wonder if we could split this to separate drm dp helper and amd driver
> > patches?

Whoops! I thought it was strange that I would say this but it seems there was
a misunderstanding on my part: when the original patch series was submitted I
was only CC'd on the first patch and I guess I must not have noticed the 1/2
in the subject line, so I thought Jerry had submitted just a single patch for
the helper. Looking back in my email history though that definitely wasn't
correct, and the original patch structure was what we wanted to go with.

Sorry for the confusion on my part!

> > 
> I believe that was the original structure but, lyude recommended to put 
> them into the same patch to see how it is being used
> > >         /**
> > >          * Streams and planes are reset when there are changes that
> > > affect
> > >          * bandwidth. Anything that affects bandwidth needs to go
> > > through
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index ad0795afc21c..fb5c47c4cb2e 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >         struct drm_dp_payload req_payload;
> > >         struct drm_dp_mst_port *port;
> > >         int i, j;
> > > -       int cur_slots = 1;
> > > +       int cur_slots = mgr->start_slot;
> > >         bool skip;
> > >   
> > >         mutex_lock(&mgr->payload_lock);
> > > @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >         num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
> > >   
> > >         /* max. time slots - one slot for MTP header */
> > > -       if (num_slots > 63)
> > > +       if (num_slots > mgr->total_avail_slots)
> > >                 return -ENOSPC;
> > >         return num_slots;
> > >   }
> > > @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >         int ret;
> > >   
> > >         /* max. time slots - one slot for MTP header */
> > > -       if (slots > 63)
> > > +       if (slots > mgr->total_avail_slots)
> > >                 return -ENOSPC;
> > >   
> > >         vcpi->pbn = pbn;
> > > @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct
> > > drm_atomic_state *state,
> > >   }
> > >   EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
> > >   
> > > +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> > > *mst_state, uint8_t link_coding_cap)
> > > +{
> > > +       if (link_coding_cap == DP_CAP_ANSI_128B132B) {
> > > +               mst_state->total_avail_slots = 64;
> > > +               mst_state->start_slot = 0;
> > > +       }
> > The values never change AFAICT, should we store the channel encoding
> > instead, and use that information to initialize the values?
> > 
> > (Alternatively, why aren't the 8b/10b values initialized here if
> > 128b/132b are?)
> I agree, 8b/10 are the default, but in case where we switch from 
> 128b/132 -> 8b/10b we should be updating them here aswell.
> > > +
> > > +       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
> > > +                       (link_coding_cap == DP_CAP_ANSI_128B132B) ?
> > > "128b/132b":"8b/10b", mst_state->mgr);
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
> > > +
> > >   /**
> > >    * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
> > >    * @mgr: manager for this port
> > > @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >   
> > >         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
> > >         if (ret) {
> > > -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > max=63 ret=%d\n",
> > > -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> > > +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > > max=%d ret=%d\n",
> > > +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
> > > >total_avail_slots, ret);
> > >                 drm_dp_mst_topology_put_port(port);
> > >                 goto out;
> > >         }
> > > @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >                                          struct
> > > drm_dp_mst_topology_state *mst_state)
> > >   {
> > >         struct drm_dp_vcpi_allocation *vcpi;
> > > -       int avail_slots = 63, payload_count = 0;
> > > +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
> > >   
> > >         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
> > >                 /* Releasing VCPI is always OK-even if the port is gone
> > > */
> > > @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >                 }
> > >         }
> > >         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI
> > > avail=%d used=%d\n",
> > > -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> > > +                      mgr, mst_state, avail_slots, mgr-
> > > >total_avail_slots - avail_slots);
> > >   
> > >         return 0;
> > >   }
> > > @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct
> > > drm_atomic_state *state)
> > >                         break;
> > >   
> > >                 mutex_lock(&mgr->lock);
> > > +
> > > +               mgr->start_slot = mst_state->start_slot;
> > > +               mgr->total_avail_slots = mst_state->total_avail_slots;
> > > +
> > It feels wrong to me to be copying stuff from mst_state to mgr in
> > general, and in atomic check hook in particular.
> previously we were setting it directly in the mgr, and this was 
> suggested by lyude. I am not sure what the alternative is.
> > >                 ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
> > > >mst_primary,
> > >                                                             mst_state);
> > >                 mutex_unlock(&mgr->lock);
> > > @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >         if (!mgr->proposed_vcpis)
> > >                 return -ENOMEM;
> > >         set_bit(0, &mgr->payload_mask);
> > > +       mgr->total_avail_slots = 63;
> > > +       mgr->start_slot = 1;
> > >   
> > >         mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > >         if (mst_state == NULL)
> > >                 return -ENOMEM;
> > >   
> > > +       mst_state->total_avail_slots = 63;
> > > +       mst_state->start_slot = 1;
> > > +
> > The magic values for 8b/10b are now duplicated to two places, with the
> > 128b/132b values in a separate place.
> 
> 8b/10b is the default (to make sure we don't break any existing driver 
> that doesn't use 128b/132b). Are you against setting it as the default 
> here? or do you mean we should use #define for this? the magic numbers 
> are currently being used directly right now (inside 
> drm_dp_find_vcpi_slots, drm_dp_init_vcpi).
> 
> Bhawan
> 
> > BR,
> > Jani.
> > 
> > >         mst_state->mgr = mgr;
> > >         INIT_LIST_HEAD(&mst_state->vcpis);
> > >   
> > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > b/include/drm/drm_dp_mst_helper.h
> > > index ddb9231d0309..f8152dfb34ed 100644
> > > --- a/include/drm/drm_dp_mst_helper.h
> > > +++ b/include/drm/drm_dp_mst_helper.h
> > > @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
> > >         struct drm_private_state base;
> > >         struct list_head vcpis;
> > >         struct drm_dp_mst_topology_mgr *mgr;
> > > +       u8 total_avail_slots;
> > > +       u8 start_slot;
> > >   };
> > >   
> > >   #define to_dp_mst_topology_mgr(x) container_of(x, struct
> > > drm_dp_mst_topology_mgr, base)
> > > @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
> > >          */
> > >         int pbn_div;
> > >   
> > > +       /**
> > > +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> > > +        */
> > > +       u8 total_avail_slots;
> > > +
> > > +       /**
> > > +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
> > > +        */
> > > +       u8 start_slot;
> > > +
> > >         /**
> > >          * @funcs: Atomic helper callbacks
> > >          */
> > > @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> > > drm_dp_mst_topology_mgr *mgr, struct drm_dp
> > >   
> > >   void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> > > struct drm_dp_mst_port *port);
> > >   
> > > +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> > > *mst_state, uint8_t link_coding_cap);
> > >   
> > >   void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> > >                                 struct drm_dp_mst_port *port);
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

