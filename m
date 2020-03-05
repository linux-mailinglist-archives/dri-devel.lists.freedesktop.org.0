Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34D17B0CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 22:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46C96EC21;
	Thu,  5 Mar 2020 21:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2446EC21;
 Thu,  5 Mar 2020 21:39:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v4so8835244wrs.8;
 Thu, 05 Mar 2020 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ai+LfFWt8nDohdLB8y5IUWbmGXnrdZeN6haPOXmtugI=;
 b=Gty5YvdQ9cM0x3jUP88Bwl5HnPGZlXpVryfJZ4B2FQ9ZctW7cgg+jJseVIXdU8iChe
 wNvrOaZgAuaSKmDdzibUpwsFMRblNEpt6YI6gulEgIsNjPF2Khp6BMmCEug1KBcGwPJ/
 N1p9zehhYxI8kA7zvWFsh79ktFJfjY4/beK3RLkzOoXXEda2wBfSiI7/HXU+6F5bf74V
 OZxQG3Ep7dkS9OGV1qg+xnz3ieMz1SopCU37JyZWxh8J2ikWDGIvn8DWX4AWpLLUQJOF
 M2bYX2pX46+9Sbdl1EB5+JAlAtoWa4uWLtyHu+JN25VeG4ePpJolrXaCGZrsNyDADqIJ
 /pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ai+LfFWt8nDohdLB8y5IUWbmGXnrdZeN6haPOXmtugI=;
 b=V60BK23tJH6umbjkfWwAw6BH4wYE9GUgAKFQ7sCd/uu6Z0BgVNeSbnX3WxYRLBg7vW
 v0uR9v1tYDMPJSVgShhiJbeNNIA3El1iG+rZm3Xg6N6DqNmv6vGU+Vyr+hvkFNk/hQev
 +Uyn5ukpQdwbalvp3lZsn1Y6ne8lVd2lIpAqXp+uJrhG1oOL29lpCvrml8lj+I45qhSj
 KBhVnde+Ia3/Ptjkv2UKgDSPxUx6SNQU9zRaIx3gWc6UgRzsTgIR0Uvxy3kH6U6PAz0I
 qtACNvjlhaCFTVxxSUvejHLuSr2jPmtZdxd95SMTDagNA+GuMMNuc8j3LJI4jWweCBQo
 ClcA==
X-Gm-Message-State: ANhLgQ0p4r7tIOX4Q3Tlt0DbvshX/zfC5UDx+MnFrJEDPiMOq3HlZkv7
 CBqVs5OQUQ8WtegzLgsUu/Wc57EGCXkuHt+pDkA=
X-Google-Smtp-Source: ADFU+vspZzFExCt66l6m7Vs/Twt85wOLRs2ltOpk24Zjh6bajR8z7KNurQR8mOOXpQ39cAw9k0bnLxGU74ODI82O9eA=
X-Received: by 2002:a5d:6146:: with SMTP id y6mr868601wrt.107.1583444359642;
 Thu, 05 Mar 2020 13:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20200302061732.28577-1-mario.kleiner.de@gmail.com>
 <7c853b66-8747-3a7c-7a76-c2f418c0b101@amd.com>
In-Reply-To: <7c853b66-8747-3a7c-7a76-c2f418c0b101@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 5 Mar 2020 22:39:07 +0100
Message-ID: <CAEsyxyg39BXTpzmhJPfDqqsXVY8QDSK79iaWyaPHQeOo6zc+XA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN.
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: "Li, Sun peng \(Leo\)" <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 2:57 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-03-02 1:17 a.m., Mario Kleiner wrote:
> > Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
> > events at vsartup for DCN")' introduces a new way of pageflip
> > completion handling for DCN, and some trouble.
> >
> > The current implementation introduces a race condition, which
> > can cause pageflip completion events to be sent out one vblank
> > too early, thereby confusing userspace and causing flicker:
> >
> > prepare_flip_isr():
> >
> > 1. Pageflip programming takes the ddev->event_lock.
> > 2. Sets acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED
> > 3. Releases ddev->event_lock.
> >
> > --> Deadline for surface address regs double-buffering passes on
> >      target pipe.
> >
> > 4. dc_commit_updates_for_stream() MMIO programs the new pageflip
> >     into hw, but too late for current vblank.
> >
> > => pflip_status == AMDGPU_FLIP_SUBMITTED, but flip won't complete
> >     in current vblank due to missing the double-buffering deadline
> >     by a tiny bit.
> >
> > 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
> >     dm_dcn_crtc_high_irq() gets called.
> >
> > 6. Detects pflip_status == AMDGPU_FLIP_SUBMITTED and assumes the
> >     pageflip has been completed/will complete in this vblank and
> >     sends out pageflip completion event to userspace and resets
> >     pflip_status = AMDGPU_FLIP_NONE.
> >
> > => Flip completion event sent out one vblank too early.
> >
> > This behaviour has been observed during my testing with measurement
> > hardware a couple of time.
> >
> > The commit message says that the extra flip event code was added to
> > dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
> > in case the pflip irq doesn't fire, because the "DCH HUBP" component
> > is clock gated and doesn't fire pflip irqs in that state. Also that
> > this clock gating may happen if no planes are active. This suggests
> > that the problem addressed by that commit can't happen if planes
> > are active.
> >
> > The proposed solution is therefore to only execute the extra pflip
> > completion code iff the count of active planes is zero and otherwise
> > leave pflip completion handling to the pflip irq handler, for a
> > more race-free experience.
> >
> > Note that i don't know if this fixes the problem the original commit
> > tried to address, as i don't know what the test scenario was. It
> > does fix the observed too early pageflip events though and points
> > out the problem introduced.
>
> This looks like a valid race condition that should be addressed.

Indeed! And if possible in any way, before Linux 5.6 is released. For
my use cases, neuroscience/medical research, this is a serious problem
which would make DCN gpu's basically unusable for most work. Problems
affecting flip timing / flip completion / timestamping are always
worst case problems for my users.

>
> Unfortunately this also doesn't fix the problem the original commit was
> trying to address.
>
> HUBP interrupts only trigger when it's not clock gated. But there are
> cases (for example, PSR) where the HUBP can be clock gated but the
> active plane count is greater than zero.
>
> The clock gating switch can typically happens outside of x86 control
> flow so we're not really going to understand in advance whether or not
> we'll be able to receive the pflip IRQ.
>

Oh dear! So how can that happen? Could explain to me in more detail,
how this works? What's the job of HUBP, apart from (not) triggering
pflip interrupts reliably? Is the scenario here that the desktop is
detected idle for a while (how?) and PSR kicks in and HUBP gets clock
gated, but somehow vblank interrupts are still active? I thought panel
self refresh only enables on long idle display, so scanout from the
gpu can be basically disabled while the panel refreshes itself? Is a
programmed pageflip then automatically (no host cpu involvement)
putting the panel out of self refresh and turning scanout on and the
pageflip completion enables HUBP again, but HUBP doesn't trigger the
pflip irq because it somehow missed that due to being clock-gated at
time of flip completion?

I'd really like to understand in more detail how this stuff works on
your recent hw, and also which irqs / events / trigger points are
associated with what actions of the hw. I have the feeling there will
be more "fun" lingering in the future. I also wanted to experiment
more with some VRR ideas, so any details about which hw events happen
when and fire which irq's and which double-buffered registers
double-buffer when are greatly appreciated.

> While we do have plane status/flip pending bits available to check in
> the VSTARTUP IRQ handler, this obviously doesn't work for resolving the
> core of the issue - that we probably don't know whether or not the HUBP
> will be on before sending out the event.
>
> Maybe we can guess based on what features are enabled.>

Ok, that's your domain of knowledge. I just sent out a v2 of my patch,
which tries to work around all this uncertainty by asking the hw if a
flip is still pending or not at the time dm_dcn_crtc_high_irq() has to
decide if it completes the pageflip / sends out the pageflip event or
not. Also, the locking around this was more broken than i thought, so
i rearrranged event_lock protection in commit planes:
prepare_flip_isr() and the dc hardware commit must happen event_lock
protected within the same critical section.

The v2 patch is lightly tested on polaris and raven and at least
doesn't show obvious problems due to locking changes. I can't run my
hardware test equipment on DCN atm. to be really sure this fixes it,
because that involves use of a VGA monitor atm. and my last VGA CRT
monitor just died on me with a puff of smoke and some scary electrical
buzz noises :(

-mario


> Regards,
> Nicholas Kazlauskas
>
> >
> > Fixes: 16f17eda8bad ("drm/amd/display: Send vblank and user events at vsartup for DCN")
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++---
> >   1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 63e8a12a74bc..3502d6d52160 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -522,8 +522,9 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
> >
> >       acrtc_state = to_dm_crtc_state(acrtc->base.state);
> >
> > -     DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> > -                             amdgpu_dm_vrr_active(acrtc_state));
> > +     DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
> > +                      amdgpu_dm_vrr_active(acrtc_state),
> > +                      acrtc_state->active_planes);
> >
> >       amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
> >       drm_crtc_handle_vblank(&acrtc->base);
> > @@ -543,7 +544,18 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
> >                       &acrtc_state->vrr_params.adjust);
> >       }
> >
> > -     if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
> > +     /*
> > +      * If there aren't any active_planes then DCH HUBP may be clock-gated.
> > +      * In that case, pageflip completion interrupts won't fire and pageflip
> > +      * completion events won't get delivered. Prevent this by sending
> > +      * pending pageflip events from here if a flip is still pending.
> > +      *
> > +      * If any planes are enabled, use dm_pflip_high_irq() instead, to
> > +      * avoid race conditions between flip programming and completion,
> > +      * which could cause too early flip completion events.
> > +      */
> > +     if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED &&
> > +         acrtc_state->active_planes == 0) {
> >               if (acrtc->event) {
> >                       drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
> >                       acrtc->event = NULL;
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
