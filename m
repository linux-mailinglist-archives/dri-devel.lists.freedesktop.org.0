Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4765FF1A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5703110E85B;
	Fri,  6 Jan 2023 10:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB17F10E85B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 10:45:10 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q9so916956pgq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 02:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mo5/SqG2jQ4b6Vm9FiZ3fHIoCuySmud0YnNw2E4jyNA=;
 b=G1ui/N0UaOQozTyYLs2UMGUkXglV1fji7oyeXYi/k71YaYmLxfFeaXPnWQ4i06UtKr
 S1oXVXZ6QukIqYqzC76Cu/VRhFD+yq7NmbX+IX6BNfehXQeiU0EPrRZpC9zc8/UYUaw0
 eRRTJDUU40i6NqOSr57mUdA5Ajke1eyljVCr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mo5/SqG2jQ4b6Vm9FiZ3fHIoCuySmud0YnNw2E4jyNA=;
 b=O7nQMjrVqACSFF7ruGmmiBOKvdSTzecPdIGacJGxtB65rbuXjqJ4OmK4G88szG1dO6
 N7Pbz07pe1AadWDC/C4nsG0+qTbILW28rqgJ2urngTUDzvsfS+v2QBooCl3jFF5OQt6h
 0ZfTZKQBEUD/TamTDR5FXJ3eT7TP5H9T1Uoa6HqdJ66lFjFqm3/DUhVokQz1TtbKwb1R
 7LS50kMsKGjYt0ju4jco726p3dpX9suK3R7XqdmO94qDH7vVOTLyTmcZ1XkVLCSu0RKg
 C+ztp2fcTaFFIlfPC6Ezj00KiyGWdqe+zETqwLr9o+dzSirWAqhJqGnFz0id6g27k2ef
 qb8g==
X-Gm-Message-State: AFqh2kqq0ZShJZ0G1Y8AenkepRLve7qoq3WtecJPcYi3hd25TXGLRDof
 3EfjUYDBJlSJalxrRbtP8hp5NdhE8tS7OunUAKfcI9ZPuFMspw==
X-Google-Smtp-Source: AMrXdXua/CqnTibMmM4YeJ+kQvKFHFq+S934wm7s7AgEzcsXVwVvhizAP4/Gp7dbiA7sc7onRT/GrxddBTV37OlWrNU=
X-Received: by 2002:a63:5a4b:0:b0:48b:b95:7f41 with SMTP id
 k11-20020a635a4b000000b0048b0b957f41mr3537366pgm.322.1673001910296; Fri, 06
 Jan 2023 02:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
 <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
 <Y7fpr69AXYYo2O25@phenom.ffwll.local>
 <20230106095634.GB1586324@linux.intel.com>
In-Reply-To: <20230106095634.GB1586324@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Jan 2023 11:44:58 +0100
Message-ID: <CAKMK7uEu=aKCVgNfzqVE-NKX9O6HyNmYKORuHcK4Y=j=kmRDMw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Jan 2023 at 10:56, Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Fri, Jan 06, 2023 at 10:28:15AM +0100, Daniel Vetter wrote:
> > On Thu, Jan 05, 2023 at 07:38:26PM +0200, Oded Gabbay wrote:
> > > On Thu, Jan 5, 2023 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> > > >
> > > > On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> > > > > On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
> > > > >> +static const struct drm_driver driver = {
> > > > >> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> > > > >
> > > > > So I was wondering whether this is a bright idea, and whether we shouldn't
> > > > > just go ahead and infuse more meaning into accel vs render nodes.
> > > > >
> > > > > The uapi relevant part of render nodes is that they're multi-user safe, at
> > > > > least as much as feasible. Every new open() gives you a new private
> > > > > accelerator. This also has implications on how userspace drivers iterate
> > > > > them, they just open them all in turn and check whether it's the right
> > > > > one - because userspace apis allow applications to enumerate them all.
> > > > > Which also means that any devicie initialization at open() time is a
> > > > > really bad idea.
> > > > >
> > > > > A lot of the compute accelerators otoh (well habanalabs) are single user,
> > > > > init can be done at open() time because you only open this when you
> > > > > actually know you're going to use it.
> > > > >
> > > > > So given this, shouldn't multi-user inference engines be more like render
> > > > > drivers, and less like accel? So DRIVER_RENDER, but still under
> > > > > drivers/accel.
> > > > >
> > > > > This way that entire separate /dev node would actually become meaningful
> > > > > beyond just the basic bikeshed:
> > > > > - render nodes are multi user, safe to iterate and open() just for
> > > > >    iteration
> > > > > - accel nodes are single user, you really should not ever open them unless
> > > > >    you want to use them
> > > > >
> > > > > Of course would need a doc patch :-)
> > > > >
> > > > > Thoughts?
> > > > > -Daniel
> > > >
> > > > Hmm.
> > > >
> > > > I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except
> > > > that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided
> > > > "legacy" userspace.
> > > >
> > > > qaic is multi-user.  I thought habana was the same, at-least for
> > > > inference.  Oded, am I wrong?
> > > Habana's devices support a single user at a time acquiring the device
> > > and working on it.
> > > Both for training and inference.
> > > >
> > > > So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends
> > > > up in DRIVER_RENDER, that would seem to mean qaic ends up using
> > > > DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under
> > > > /dev/dri with both a card node (never used) and a render node.  That
> > > > would seem to mean that the "legacy" userspace would open qaic nodes by
> > > > default - something I understood Oded was trying to avoid.
> > > >
> > > > If there really a usecase for DRIVER_ACCEL to support single-user?  I
> > > > wonder why we can't default to multi-user, and if a particular
> > > > user/driver has a single-user usecase, it enforces that in a driver
> > > > specific manner?
> > > >
> > > > -Jeff
> > >
> > > Honestly, Daniel, I don't like this suggestion. I don't understand why
> > > you make a connection between render/accel to single/multi user.
> > >
> > > As Jeff has said, one of the goals was to expose accelerator devices
> > > to userspace with new device char nodes so we won't be bothered by
> > > legacy userspace graphics software. This is something we all agreed on
> > > and I don't see why we should change it now, even if you think it's
> > > bike-shedding (which I disagree with).
> > >
> > > But in any case, creating a new device char nodes had nothing to do
> > > with whether the device supports single or multi user. I can
> > > definitely see in the future training devices that support multiple
> > > users.
> > >
> > > The common drm/accel ioctls should of course not be limited to a
> > > single user, and I agree with Jeff here, if a specific driver has such
> > > a limitation (e.g. Habana), then that driver should handle it on its
> > > own.
> > > Maybe if there will be multiple drivers with such a limitation, we can
> > > make that "handling" to be common code.
> > >
> > > Bottom line, I prefer we keep things as we all agreed upon in LPC.
> >
> > The problem is going to happen as soon as you have cross-vendor userspace.
> > Which I'm kinda hoping is at least still the aspiration. Because with
> > cross-vendor userspace you generally iterate & open all devices before you
> > select the one you're going to use. And so we do kinda need a distinction,
> > or we need that the single-user drivers also guarantee that open() is
> > cheap.
>
> FWIW we had good support in ivpu for probe open's in form of lazy context
> allocation. It was removed recently due to review feedback that this is
> unnecessary, but we can add it back.

Yeah once you have more than 1 multi-user accel chip in the system you
need to do that. Which is really the reason why I think smashing
multi-user client accel things into render is good, it forces drivers
to suck less.

On that topic, does your userspace still do the drmIoctl() wrapper?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
