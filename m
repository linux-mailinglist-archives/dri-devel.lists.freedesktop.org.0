Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53D590723
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 21:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DA8B280;
	Thu, 11 Aug 2022 19:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67D8B280
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660247681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYx8AOthYNArqQCXB3WsN+RnaUh0r3KbC7sLrWJfMRE=;
 b=dU/9PhbRagn/Dat2DCCC3Xzfrb8eM9FM2RRGjN2+BDB/gFSA1RBuUuORa1xdTERv/yMU+r
 QyQjO717vHgR5RxBd4bQKjbndPbUDercrmVtkkhE6hvj6dzqFynmRaS2+Iu0mcZuDn9nAA
 Q1cBB6yL4C7oQ5LEqZJ87NzlnSsu5JA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-_ZSn-pYHOAW5mt7o1TW2Cg-1; Thu, 11 Aug 2022 15:54:40 -0400
X-MC-Unique: _ZSn-pYHOAW5mt7o1TW2Cg-1
Received: by mail-qv1-f72.google.com with SMTP id
 np4-20020a056214370400b00476809b9caeso9917039qvb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 12:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=lYx8AOthYNArqQCXB3WsN+RnaUh0r3KbC7sLrWJfMRE=;
 b=4oBxClDTVMTNgYxx4+kqYAzv5Ze2aqFZZq+VGkCUKBKJvechIH9i7IuBgEsC4bWJta
 xeHFRp2tNtvlTfdUM6qpZhmuESPPUag2TISZlHQ6tdVqVTdEzXIkBzfgrP2B4eVHd8HW
 cSeJJ2/M6FrsA55yVhc+Sgzt7VdQXJ09cJAXwBf0i0D6uNLqS6poXMPU/hCrUaTLP29U
 z245d17D37IvbDaK+cIexJpNE8eFuH2DkWLUuR/62dnoCItRp/NhcVu/FZsNES8Oqs8B
 NhagSVTkUhNWTalHLyE1mnSuXSSo9wprnlrOGhk87tbrwW02uElFamJ+BFUVmWqRf8G/
 N47w==
X-Gm-Message-State: ACgBeo30TBAZWZaPj9h2cCOMG9Z02iRTyz6WEvz7HrpHQtdtWsy6Qe3t
 zdap6Gac15c7to55qxrkkIaEb82tf7d9Z5zCN9XJ06VIznQTBkGGUbq7i+w0R5lT+U1NEQlXPoW
 eJkzxCw0+uFJZIN82IJrtnd0A+IMR
X-Received: by 2002:a05:6214:d46:b0:477:1218:f522 with SMTP id
 6-20020a0562140d4600b004771218f522mr704215qvr.6.1660247680392; 
 Thu, 11 Aug 2022 12:54:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR685DUxSl06QIj2FIwD2caHZKsT75KT7dDmS0z6QfygVNh7d8+TUDY1Gblac9Ec8Z+jnL81eQ==
X-Received: by 2002:a05:6214:d46:b0:477:1218:f522 with SMTP id
 6-20020a0562140d4600b004771218f522mr704207qvr.6.1660247680112; 
 Thu, 11 Aug 2022 12:54:40 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05620a415400b006b5e1aeb777sm191234qko.43.2022.08.11.12.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 12:54:39 -0700 (PDT)
Message-ID: <e1ce622d7b8101ec4980a82b9bcdfdd921a73f34.camel@redhat.com>
Subject: Re: [PATCH 0/2] Add DP MST DSC support to i915
From: Lyude Paul <lyude@redhat.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Thu, 11 Aug 2022 15:54:38 -0400
In-Reply-To: <YvSvDpq35CxfbnRJ@intel.com>
References: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
 <419bcc405fa4b298acb3f167316217bcca9f7c07.camel@redhat.com>
 <YvSvDpq35CxfbnRJ@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 intel-gfx@lists.freedesktop.org, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-08-11 at 10:33 +0300, Lisovskiy, Stanislav wrote:
> On Wed, Aug 10, 2022 at 04:02:08PM -0400, Lyude Paul wrote:
> > Btw, what's the plan for this? Figured I'd ask since I noticed this on the ML,
> > nd I'm now finishing up getting the atomic only MST patches I've been working
> > on merged :)
> 
> Current plan is that I need to fix this, as current implementation doesn't
> seem to work because of my wrong assumption that drm_dp_mst_find_vcpi_slots
> will fail if no slots are available and then we can fallback to DSC.
> 
> In reality that function can return whatever bogus value it wants, like
> 71 slots, while you have only 63 available. The real check is done in
> drm_dp_mst_atomic_check, which would of course reject that configuration,
> however by that moment its going to be too late for swithcing to DSC.
> 

Yeah - the drm_dp_mst_find_vcpi_slots() bit is intentional, as we need to be
able to ensure that calls to it are idempotent since it may be called multiple
times. We also don't actually know whether or not we've gone past the max
number of slots until atomic check since there's not necessarily a guarantee
towards which order we process disabling CRTCs and process enabling them,
hence why we wait towards the end to check this.

The eventual plan that I'd like to see happen is to basically teach
drm_dp_mst_atomic_check() to indicate when a display state needs to be
recalculated in order to fit into the current bandwidth limitations. There's a
number of ways we could accomplish this, one I've been thinking about in
particular is maybe having drivers provide a minimum and maximum bandwidth
value, so that we could also have the helpers indicate to the driver which
sinks can be recalculated.

Also FWIW: the reason I've been working on:

https://patchwork.freedesktop.org/series/107073/

Is to make all of this easier by making sure all of the payload info is in the
MST atomic state.

> So looke like I will have to move that check at least partly to where DSC/no DSC decision is done. However if there are multiple displays we get
> another problem, lets say we have 2 displays requiring 40 vcpi slots each in DSC
> mode with certain input bpp.
> We have now either option to reject the whole config or go back and try with
> another bpp to check if we can reduce amount of slots.
> Because by default we choose the first one which fits, however by the time when 
> compute_config is called, we still don't have all config computed, which might
> lead to that last crtc can either run our of vcpi slots or we will have to 
> go back and try recalculating with higher compression ratio.

Having to go back and recalculate with a higher compression ratio is to be
expected to some extent I'm fairly sure, as I don't really think there's any
other sensible way we could figure this out besides recalculating the state
multiple times. Keep in mind too - doing stuff like calling a CRTC's atomic
check multiple times is totally normal and expected to work in DRM anyhow.

> 
> My other question was that DSC was supposed to be "visually" lossless, wondering
> why we are still trying with different bpps? Could have just set highest
> compression ratio right away.

I think this is a misunderstanding, at least while talking to AMD the
impression I've gotten is that DSC isn't actually totally loseless - which is
why their driver currently tries to use the least amount of compression
possible. Otherwise I would say we should just enable it at max all of the
time. Also, annoyingly most of the logic for doing this is currently stuck in
amdgpu's driver. but please feel free to move it out into helpers! If we want
good DSC support that's definitely going to help quite a bunch since they've
worked out a lot of this already, and there's probably even improvements we
can make upon their logic.

> 
> So need to sort this out first before floating new series.
> 
> Stan
> 
> > 
> > On Wed, 2022-08-10 at 11:17 +0300, Stanislav Lisovskiy wrote:
> > > Currently we have only DSC support for DP SST.
> > > 
> > > Stanislav Lisovskiy (2):
> > >   drm: Add missing DP DSC extended capability definitions.
> > >   drm/i915: Add DSC support to MST path
> > > 
> > >  drivers/gpu/drm/i915/display/intel_dp.c     |  76 +++++-----
> > >  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 145 ++++++++++++++++++++
> > >  include/drm/display/drm_dp.h                |  10 +-
> > >  4 files changed, 203 insertions(+), 45 deletions(-)
> > > 
> > 
> > -- 
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

