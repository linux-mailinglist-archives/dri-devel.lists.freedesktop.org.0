Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85214E4856
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E830010E103;
	Tue, 22 Mar 2022 21:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3BB10E103
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647985065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz2yw0u5DlAN0tOuvPdG6zAGBYGjEdPp3HZZXpYF8m8=;
 b=bHbCmOymQj+0DxojsMJffYVnnc2MZiasZG/7+OSXuvCQJ4/LonFBiJS31SR+e/mTH8CZ7t
 oq3XaTgIeYktP7XFONvkvlG6/6BWcSDk1TmGea38em1L3Dj7iSI8dJ7TWxXF7IKrRVCuEK
 jVIL08voucrgUmTxaVcPdqgCPy9+OVg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-NKPcVZpxMPO1l7sNzQ069Q-1; Tue, 22 Mar 2022 17:37:43 -0400
X-MC-Unique: NKPcVZpxMPO1l7sNzQ069Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 bq21-20020a05622a1c1500b002e06d6279d5so12546732qtb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 14:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xz2yw0u5DlAN0tOuvPdG6zAGBYGjEdPp3HZZXpYF8m8=;
 b=RrZTLcstNRaJGTX9ipJ4comQpvF4z1KGctI8B5hC5JoIHbdxcJteM0tZmDbpFn/8hm
 rkqfQn10Qu2RLwxwkdbPGo5wbCdeSrhPY/KLbIVzBjLnePqDVVJlxX6zEf081ehuie5O
 f0cEZnNfSOgCtaPvUq4JDCqXPENWToVP8lsLhNTYhIaxsTdC26ZclJXEK/J8PCOqAOCF
 FxE/9iliOgv+Nmplb8thKWryyn6gN3JsHR5WPRyokS/SkVO7Jh9u9nhcJXXDPeBZDvO6
 uiY1arB+kcjvKAlTD0Ugv2UvfnG7/zngv+r7QkUJ1uQ3C6rmfF17KbCFB12U6QvdMuot
 leSw==
X-Gm-Message-State: AOAM532KFO12DJAdntn4t7z4cxHSfGtYaR8wjoVF3/9O7KCyjUdsMdzi
 93MVOqvAOw+2+7zjbxZyJSl1SD3BUJCltMze0lNpY8y4aGd4XGji+ebhYrGc9evCiz/XsYgl3+b
 NQ7gtTk6Mt3GkecJavg4pBrVrczf0
X-Received: by 2002:a05:620a:d8d:b0:67b:e95:2975 with SMTP id
 q13-20020a05620a0d8d00b0067b0e952975mr16689134qkl.115.1647985062874; 
 Tue, 22 Mar 2022 14:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGnZFW8nBRxv90cG28LLpdRHeC0metD0Cy9NCTQPZ4x4OnObvKuyq1jNHNwF5apUHiJEoMTQ==
X-Received: by 2002:a05:620a:d8d:b0:67b:e95:2975 with SMTP id
 q13-20020a05620a0d8d00b0067b0e952975mr16689117qkl.115.1647985062408; 
 Tue, 22 Mar 2022 14:37:42 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 84-20020a370957000000b0067e4c1c8889sm7646395qkj.80.2022.03.22.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 14:37:41 -0700 (PDT)
Message-ID: <9a4783ac9eee57c29b584e5a9099a3e1667afa42.camel@redhat.com>
Subject: Re: Parallel modesets and private state objects broken, where to go
 with MST?
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Tue, 22 Mar 2022 17:37:40 -0400
In-Reply-To: <9876d8fe5bdf5f942b06378ae973e18513297539.camel@redhat.com>
References: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
 <YjHDg3WTYgMDOzLF@intel.com>
 <9876d8fe5bdf5f942b06378ae973e18513297539.camel@redhat.com>
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

OK so - this has become a bit of a larger rabbit hole. I've been putting quite
a bit of work into this and I think I'm starting to make some progress -
although on a different aspect of this issue. After talking with danvet they
realized that we're also potentially not handling encoder stealing with MST
correctly - which we need to do in order to know that we're correctly pulling
in every related crtc/connector into the state - along with avoiding encoder
conflicts if something tries to use a GPU's DP encoder in SST mode while it's
driving other displays in MST mode.

So - it seems this will likely need to be solved first before we can deal with
ensuring that we perform the correct CRTC waits in atomic commits with the MST
helpers. This has been pretty painful to figure out, but I think I'm starting
to make some progress - but I'd really appreciate getting some feedback on
this approach I've came up with so I maybe can skip having to rewrite it
later.

So: to clarify the problem, it boils down to something like this:

State 1:
  * DP-1 (hosts MST topology, so is disconnected + no encoder)
    * MST topology
      * DP-2 (has display)
      * DP-3 (has display)
  (In hardware)
  * drm_encoder A drives:
    * DP-2
    * DP-3
  (In software)
  * drm_encoder A unused
  * Fake MST drm_encoder B -> DP-2
  * Fake MST drm_encoder C -> DP-3

Problems:
  * DP-1 gets disconnected, MST topology disappears
  * We disable maybe 1 display
  * DP-1 is disconnected, suddenly replaced with SST display
  * Driver tries to assign drm_encoder A to new DP-1 display
  *** Error! drm_encoder A is still driving fake encoders B and C ***


I'm not sure if the exact above example would actually happen - you
might need to do some tricks to get it into such a state. But you get
the general idea - there's missing coverage with how we handle encoder
conflicts when it comes to encoders that aren't directly handling CRTCs.
If we can fix this, I think we should be able to reliably figure out
every CRTC involved in modesets like this - and ensure that nonblocking
modesets come up with the right CRTC dependencies.

My current idea for handling this is as follows:
  * Add the following fields to drm_connector_state:
    * reserved_encoder → an encoder that is "reserved" by the connector,
      but is not directly attached to a monitor. Note reserved
      connectors cannot have CRTCs attached to them. When a connector
      has no more CRTCs reserved, it should lose it's reserved encoder.
    * dependent_crtcs → a bitmask of CRTCs that depend on this
      connector's state, but are not directly attached to it.
  * Add the following fields to drm_crtc_state:
    * connector_dependency → a connector whose state this CRTC relies
      on, but is not directly attached to. This connector must be pulled
      into the atomic state whenever this CRTC requires a modeset.

The reason for adding all of these fields to drm_connector_state and
drm_crtc_state is because I don't think it's possible for us to rely on
a particular private object being in all atomic states - so we need a
way for the DRM core to be able to understand these object relationships
on it's own and reference them from any type of atomic state change so
that we can pull in dependent CRTCs as needed.

From there, we'd just:
  * Add some functions to handle these new fields, something like:
    * drm_atomic_reserve_crtc_for_connector(crtc, encoder, conn_state)
    * drm_atomic_release_crtc_from_connector(crtc, conn_state)
  * Teach the various DRM core functions how to handle these new fields

Does this seem like I'm on the right track so far? JFYI - I've been busy
trying to write up some patches for this, but there's definitely a lot
of code to go through and change.

On Wed, 2022-03-16 at 16:28 -0400, Lyude Paul wrote:
> On Wed, 2022-03-16 at 13:01 +0200, Ville Syrjälä wrote:
> > On Mon, Mar 14, 2022 at 06:16:36PM -0400, Lyude Paul wrote:
> > > Hi! First a little bit of background: I've recently been trying to get
> > > rid
> > > of
> > > all of the non-atomic payload bandwidth management code in the MST
> > > helpers
> > > in
> > > order to make it easier to implement DSC and fallback link rate
> > > retraining
> > > support down the line. Currently bandwidth information is stored in two
> > > places, partially in the MST atomic state and partially in the mst
> > > manager's
> > > payload table (which exists outside of the atomic state and has its own
> > > locking). The portions in the atomic state are used to try to determine
> > > if
> > > a
> > > given display configuration can fit within the given bandwidth
> > > limitations
> > > during the atomic check phase, and are implemented through the use of
> > > private
> > > state objects.
> > > 
> > > My current goal has been to move as much of this as possible over to the
> > > atomic state and entirely get rid of the payload table along with it's
> > > locks.
> > > My main reason for doing this is that it both decomplicates things quite
> > > a
> > > bit, and I'm really also hoping that getting rid of that payload code
> > > will
> > > make it clearer to others how it works - and stop the influx of bandaid
> > > patches (e.g. adding more and more special cases to MST to fix poorly
> > > understood issues being hit in one specific driver and nowhere else)
> > > that
> > > I've
> > > had to spend way more time then I'd like trying to investigate and
> > > review.
> > > 
> > > So, the actual problem: following a conversation with Daniel Vetter
> > > today
> > > I've
> > > gotten the impression that private modesetting objects are basically
> > > just
> > > broken with parallel modesets? I'm still wrapping my head around all of
> > > this
> > > honestly, but from what I've gathered: CRTC atomic infra knows how to do
> > > waits
> > > in the proper places for when other CRTCs need to be waited on to
> > > continue
> > > a
> > > modeset, but there's no such tracking with private objects. If I
> > > understand
> > > this correctly, that means that even if two CRTC modesets require
> > > pulling
> > > in
> > > the same private object state for the MST mgr: we're only provided a
> > > guarantee
> > > that the atomic checks pulling in that private object state won't
> > > concurrently. But when it comes to commits, it doesn't sound like
> > > there's
> > > any
> > > actual tracking for this and as such - two CRTC modesets which have both
> > > pulled in the MST private state object are not prevented from running
> > > concurrently.
> > > 
> > > This unfortunately throws an enormous wrench into the MST atomic
> > > conversion
> > > I've been working on - as I was under the understanding while writing
> > > the
> > > code
> > > for this that all objects in an atomic state are blocked from being used
> > > in
> > > any new atomic commits (not checks, as parallel checks should be fine in
> > > my
> > > case) until there's no commits active with said object pulled into the
> > > atomic
> > > state. I certainly am not aware of any way parallel modesetting could
> > > actually
> > > be supported on MST, so it's not really a feature we want to deal with
> > > at
> > > all
> > > besides stopping it from happening. This also unfortunately means that
> > > the
> > > current atomic modesetting code we have for MST is potentially broken,
> > > although I assume we've never hit any real world issues with it because
> > > of
> > > the
> > > non-atomic locking we currently have for the payload table.
> > > 
> > > So, Daniel had mentioned that supposedly you've been dealing with
> > > similar
> > > issues with VC4 and might have already made progress on coming up with
> > > ways to
> > > deal with it. If this is all correct, I'd definitely appreciate being
> > > able
> > > to
> > > take a look at your work on this to see how I can help move things
> > > forward.
> > > I've got a WIP of my atomic only MST branch as well:
> > > 
> > > https://gitlab.freedesktop.org/lyudess/linux/-/commits/wip/mst-atomic-only-v1
> > > 
> > > However it's very certainly broken right now (it compiles and I had
> > > thought it
> > > worked already, but I realized I totally forgot to come up with a way of
> > > doing
> > > bookkeeping for VC start slots atomically - which is what led me down
> > > this
> > > current rabbit hole), but it should at least give a general idea of what
> > > I'm
> > > trying to do.
> > > 
> > > Anyway, let me know what you think.
> > 
> > For MST in particular parallel modeset on the same physical link sounds
> > pretty crazy to me. Trying to make sure everything happens in the right
> > order would not be pleasant. I think a simple solution would be just to
> > add all the crtcs on the affected link to the state and call it a day.
> 
> JFYI I definitely don't have any kind of plan to try parallel modesetting
> with
> MST, I think it'd be near impossible to actually get working correctly for
> pretty little benefit :). I was just not entirely sure of the work that
> would
> be required to get private objects to do the right thing here in parallel
> modesets (e.g. make sure we wait on all CRTC commits like you mentioned).
> 
> Anyway - I looked at the code for this the other day and a solution that
> seems
> pretty reasonable for this to me would be to add a hook for DRM private
> objects which provides drivers a spot to inform the DRM core what
> drm_crtc_commits need to be waited on before starting a modeset. I should
> have
> some patches on the list soon so folks can tell me if what I'm doing looks
> sensible or not :).
> 
> > 
> > i915 already does that on modern platforms actually because the
> > hardware architecture kinda needs it. Although we could perhaps
> > optimize it a bit to skip it in some cases, but not sure the
> > extra complexity would really be justified.
> > 
> > In i915 we also serialize *all* modesets by running them on a
> > ordered wq (+ explicit flush_workqueue() to serialize non-blocking
> > vs. blocking modesets). We did semi-accidentally enable parallel
> > modesets once but I undid that because there was just way too much
> > pre-existing code that wasn't even considering the possibility of
> > a parallel modeset, and I didn't really feel like reviewing the
> > entire codebase to find all of it.
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

