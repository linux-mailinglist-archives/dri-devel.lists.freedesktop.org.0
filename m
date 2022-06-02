Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D753C004
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41911371B;
	Thu,  2 Jun 2022 20:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29811371A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654202636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jdx2BeYoZ4L4yU6iL09ElWE9/JdvCzMi4CPh9wjsFHM=;
 b=IL35pWVXpL2JC69K2dMQabHU5+1ho2yDGXHPe5FLxqHDqLCowlwx6HByaONosbkOCjPNo/
 RyLTeT87qG+UCwcTWHv8ptifXi+dga07M95AzfTKixNjLtdag7FJ7dDAT+pnKvZeD/HAG0
 jYGRxlS+irg18kPCnaLij3FFndhy4jU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-C9rl8cI6M0uFv2Y2aaFP8Q-1; Thu, 02 Jun 2022 16:43:55 -0400
X-MC-Unique: C9rl8cI6M0uFv2Y2aaFP8Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 eb5-20020ad44e45000000b0046447caa7a0so4116444qvb.16
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Jdx2BeYoZ4L4yU6iL09ElWE9/JdvCzMi4CPh9wjsFHM=;
 b=rQJzbThzspOl1CiNzEDpBfhRHPcYCFRO737KvoHfq0uZDYeHSAgzTq+4n6e1C3iO3x
 FYwvvijo2CtIiKNWtoQXtXpJiUlSHTQQkEBqEHm86oN4hW/gd9DVdggxOf+B1MJQSMKF
 hHIyXPvzVioM/n5ONhSClWA6XkZhEC5Fsx9O1E4kb9KzDDH1swsJXiSDmOHTSm31tfDm
 KoBBZGW2krJTP6EPmQ5on7+ylsB60Ih9XhAKZuv/o4WPiJPN1fvAM2OjRHNBLsOiglpY
 KBJFEA+uh6mTnNDVRhL2Np4DgMXGls0OMv+kbfzpnL+r6cmYiOVwUS5J8b3y2YN/kyd5
 CgJw==
X-Gm-Message-State: AOAM5303b72X9O5D6eGrA5W/3/eS3DIl5d030p8oorpkCEejxVgMzwPj
 3oRd2hoi3GrJOBEZnoMxNGP4Jw0GYiOG64ZQv8AUAdD4iI8FGuiicmKmCUhK/UMSNlK6djSzoaP
 lWnS+muR/UwA58oBiNcZ3uBZ106Xn
X-Received: by 2002:a05:622a:1988:b0:2f9:4132:6ee5 with SMTP id
 u8-20020a05622a198800b002f941326ee5mr5065854qtc.650.1654202635196; 
 Thu, 02 Jun 2022 13:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3m7ceRXpKxC/3kNqPughdFceFaNLE9KRNYqPioRt90qJLaj1Cgb6AOKi9ic3Gtd8vUEfKzA==
X-Received: by 2002:a05:622a:1988:b0:2f9:4132:6ee5 with SMTP id
 u8-20020a05622a198800b002f941326ee5mr5065832qtc.650.1654202634961; 
 Thu, 02 Jun 2022 13:43:54 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 ay16-20020a05620a179000b006a6991233a3sm287747qkb.126.2022.06.02.13.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:43:54 -0700 (PDT)
Message-ID: <4a970413b4150e28452be502a060f9011e4fce07.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/display/dp_mst: Fix
 drm_atomic_get_mst_topology_state()
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 02 Jun 2022 16:43:53 -0400
In-Reply-To: <YpkgmvBeX6L7Bs5y@intel.com>
References: <20220602201757.30431-1-lyude@redhat.com>
 <20220602201757.30431-3-lyude@redhat.com> <YpkgmvBeX6L7Bs5y@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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
 Imran Khan <imran.f.khan@oracle.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-02 at 23:42 +0300, Ville Syrjälä wrote:
> On Thu, Jun 02, 2022 at 04:17:56PM -0400, Lyude Paul wrote:
> > I noticed a rather surprising issue here while working on removing all of
> > the non-atomic MST code: drm_atomic_get_mst_topology_state() doesn't check
> > the return value of drm_atomic_get_private_obj_state() and instead just
> > passes it directly to to_dp_mst_topology_state(). This means that if we
> > hit a deadlock or something else which would return an error code pointer,
> > we'll likely segfault the kernel.
> > 
> > This is definitely another one of those fixes where I'm astonished we
> > somehow managed never to discover this issue until now…
> 
> It has been discussed before.
> 
> struct drm_dp_mst_topology_state {
>         struct drm_private_state base;
>         ...
> }
> 
> so offsetof(base)==0.

fhjdffds yes you're right, I guess we can just drop this patch then

> 
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: a4370c777406 ("drm/atomic: Make private objs proper objects")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v4.14+
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> >  include/drm/display/drm_dp_mst_helper.h       | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index d84673b3294b..d6e595b95f07 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -5468,7 +5468,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
> >  struct drm_dp_mst_topology_state
> > *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
> >                                                                     struct
> > drm_dp_mst_topology_mgr *mgr)
> >  {
> > -       return
> > to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state, &mgr-
> > >base));
> > +       return
> > to_dp_mst_topology_state_safe(drm_atomic_get_private_obj_state(state,
> > &mgr->base));
> >  }
> >  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
> >  
> > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > b/include/drm/display/drm_dp_mst_helper.h
> > index 10adec068b7f..fe7577e7f305 100644
> > --- a/include/drm/display/drm_dp_mst_helper.h
> > +++ b/include/drm/display/drm_dp_mst_helper.h
> > @@ -541,6 +541,8 @@ struct drm_dp_payload {
> >  };
> >  
> >  #define to_dp_mst_topology_state(x) container_of(x, struct
> > drm_dp_mst_topology_state, base)
> > +#define to_dp_mst_topology_state_safe(x) \
> > +       container_of_safe(x, struct drm_dp_mst_topology_state, base)
> 
> Wasn't aware of container_of_safe(). I suppose no real harm 
> in using it. Not sure why we'd even keep the non-safe version
> around?
> 
> Though the use of container_of_safe() everywhere won't help
> when "casting" the other way (&foo->base, when foo==NULL/errptr).
> In order to make that work for non-zero offsets we'd have to
> introduce a casting macro for that direction as well.
> 
> >  
> >  struct drm_dp_vcpi_allocation {
> >         struct drm_dp_mst_port *port;
> > -- 
> > 2.35.3
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

