Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402644DB964
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 21:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E210E07C;
	Wed, 16 Mar 2022 20:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD81C10E07C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647462533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gh/z3AvKfXZh9vqIlls59U0Qc7dJPGWAeIOXQ4UaH2o=;
 b=azQdJljtSdqjZUJ9Kvsf6u1CYSQ+SHu5WSlxt39oRuQW7EgZZQFiPqUES4wHQdcn38ylPa
 TabaE5OgHEgJJF/KMxfCfbVLlISqzhuZX5Tp/AXXjDGvob7HHX92j9fMiw0o9AorDx6OOM
 hb6LCM47gd0j+yUj31camfBfpPC2Asw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-Rr1EBOhuP2aTA7_1RN15dw-1; Wed, 16 Mar 2022 16:28:48 -0400
X-MC-Unique: Rr1EBOhuP2aTA7_1RN15dw-1
Received: by mail-qt1-f197.google.com with SMTP id
 o15-20020ac8698f000000b002e1db0c88d0so2177585qtq.17
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Gh/z3AvKfXZh9vqIlls59U0Qc7dJPGWAeIOXQ4UaH2o=;
 b=iXNh9UfMDhn19X7F+otHuWvsZMO30MVIa5LFnTdVEjC3cfMT7HthOsgRqXSlS0G9bS
 CKP1eyQtz7GTA7wfu0y5dw73gLgpwHrYxcGt87jy0awwAwTYL/9/s0vbZAYPQ1973rbZ
 ZcIBpYu54oU5C4pFtFvh/YcJ3SfgUfSnY9q4+tXIBfcFrVYltBttD+c5WwBReOdyouaI
 cV9EmMGCgIi7QhMNzbWbaRU5jU73cHL64j7o4F0/Ev6zFS0ZKzs5ZmoKgPFn4/cieay6
 kNgaEnhT7pahPlVYMRrKUm6hKTrTIeYJEj+jt+WaOuDpGsma2iXqn/spPPRTW8K863sX
 r5EA==
X-Gm-Message-State: AOAM533d3LMfvKe1Gc9s2uNtj4ImZsmmNgBRDePpZZ2lzcxX5ljSm0E0
 YCK7VQq6L1/r8nx9UhqbdxDudOfZTo4FAvU2zZJpa6L1oHRg6W1Ob/CfKS51gDpS3PLwGvMemzm
 hKlt5WU+W3fsZ0NyqPvxbHaOG9Ld4
X-Received: by 2002:ac8:5789:0:b0:2e1:c40e:9be3 with SMTP id
 v9-20020ac85789000000b002e1c40e9be3mr1369728qta.308.1647462527216; 
 Wed, 16 Mar 2022 13:28:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbdSCWxx1N0LIny+q2FWLiGG3Xj7XrJi51ZsG7O9ihC0E4lpipynCa993rRjaI7Sg8Aj50yw==
X-Received: by 2002:ac8:5789:0:b0:2e1:c40e:9be3 with SMTP id
 v9-20020ac85789000000b002e1c40e9be3mr1369711qta.308.1647462526911; 
 Wed, 16 Mar 2022 13:28:46 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a05622a1b8900b002e0e86b8ac6sm1944353qtb.67.2022.03.16.13.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:28:46 -0700 (PDT)
Message-ID: <9876d8fe5bdf5f942b06378ae973e18513297539.camel@redhat.com>
Subject: Re: Parallel modesets and private state objects broken, where to go
 with MST?
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 16 Mar 2022 16:28:45 -0400
In-Reply-To: <YjHDg3WTYgMDOzLF@intel.com>
References: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
 <YjHDg3WTYgMDOzLF@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-16 at 13:01 +0200, Ville Syrjälä wrote:
> On Mon, Mar 14, 2022 at 06:16:36PM -0400, Lyude Paul wrote:
> > Hi! First a little bit of background: I've recently been trying to get rid
> > of
> > all of the non-atomic payload bandwidth management code in the MST helpers
> > in
> > order to make it easier to implement DSC and fallback link rate retraining
> > support down the line. Currently bandwidth information is stored in two
> > places, partially in the MST atomic state and partially in the mst
> > manager's
> > payload table (which exists outside of the atomic state and has its own
> > locking). The portions in the atomic state are used to try to determine if
> > a
> > given display configuration can fit within the given bandwidth limitations
> > during the atomic check phase, and are implemented through the use of
> > private
> > state objects.
> > 
> > My current goal has been to move as much of this as possible over to the
> > atomic state and entirely get rid of the payload table along with it's
> > locks.
> > My main reason for doing this is that it both decomplicates things quite a
> > bit, and I'm really also hoping that getting rid of that payload code will
> > make it clearer to others how it works - and stop the influx of bandaid
> > patches (e.g. adding more and more special cases to MST to fix poorly
> > understood issues being hit in one specific driver and nowhere else) that
> > I've
> > had to spend way more time then I'd like trying to investigate and review.
> > 
> > So, the actual problem: following a conversation with Daniel Vetter today
> > I've
> > gotten the impression that private modesetting objects are basically just
> > broken with parallel modesets? I'm still wrapping my head around all of
> > this
> > honestly, but from what I've gathered: CRTC atomic infra knows how to do
> > waits
> > in the proper places for when other CRTCs need to be waited on to continue
> > a
> > modeset, but there's no such tracking with private objects. If I
> > understand
> > this correctly, that means that even if two CRTC modesets require pulling
> > in
> > the same private object state for the MST mgr: we're only provided a
> > guarantee
> > that the atomic checks pulling in that private object state won't
> > concurrently. But when it comes to commits, it doesn't sound like there's
> > any
> > actual tracking for this and as such - two CRTC modesets which have both
> > pulled in the MST private state object are not prevented from running
> > concurrently.
> > 
> > This unfortunately throws an enormous wrench into the MST atomic
> > conversion
> > I've been working on - as I was under the understanding while writing the
> > code
> > for this that all objects in an atomic state are blocked from being used
> > in
> > any new atomic commits (not checks, as parallel checks should be fine in
> > my
> > case) until there's no commits active with said object pulled into the
> > atomic
> > state. I certainly am not aware of any way parallel modesetting could
> > actually
> > be supported on MST, so it's not really a feature we want to deal with at
> > all
> > besides stopping it from happening. This also unfortunately means that the
> > current atomic modesetting code we have for MST is potentially broken,
> > although I assume we've never hit any real world issues with it because of
> > the
> > non-atomic locking we currently have for the payload table.
> > 
> > So, Daniel had mentioned that supposedly you've been dealing with similar
> > issues with VC4 and might have already made progress on coming up with
> > ways to
> > deal with it. If this is all correct, I'd definitely appreciate being able
> > to
> > take a look at your work on this to see how I can help move things
> > forward.
> > I've got a WIP of my atomic only MST branch as well:
> > 
> > https://gitlab.freedesktop.org/lyudess/linux/-/commits/wip/mst-atomic-only-v1
> > 
> > However it's very certainly broken right now (it compiles and I had
> > thought it
> > worked already, but I realized I totally forgot to come up with a way of
> > doing
> > bookkeeping for VC start slots atomically - which is what led me down this
> > current rabbit hole), but it should at least give a general idea of what
> > I'm
> > trying to do.
> > 
> > Anyway, let me know what you think.
> 
> For MST in particular parallel modeset on the same physical link sounds
> pretty crazy to me. Trying to make sure everything happens in the right
> order would not be pleasant. I think a simple solution would be just to
> add all the crtcs on the affected link to the state and call it a day.

JFYI I definitely don't have any kind of plan to try parallel modesetting with
MST, I think it'd be near impossible to actually get working correctly for
pretty little benefit :). I was just not entirely sure of the work that would
be required to get private objects to do the right thing here in parallel
modesets (e.g. make sure we wait on all CRTC commits like you mentioned).

Anyway - I looked at the code for this the other day and a solution that seems
pretty reasonable for this to me would be to add a hook for DRM private
objects which provides drivers a spot to inform the DRM core what
drm_crtc_commits need to be waited on before starting a modeset. I should have
some patches on the list soon so folks can tell me if what I'm doing looks
sensible or not :).

> 
> i915 already does that on modern platforms actually because the
> hardware architecture kinda needs it. Although we could perhaps
> optimize it a bit to skip it in some cases, but not sure the
> extra complexity would really be justified.
> 
> In i915 we also serialize *all* modesets by running them on a
> ordered wq (+ explicit flush_workqueue() to serialize non-blocking
> vs. blocking modesets). We did semi-accidentally enable parallel
> modesets once but I undid that because there was just way too much
> pre-existing code that wasn't even considering the possibility of
> a parallel modeset, and I didn't really feel like reviewing the
> entire codebase to find all of it.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

