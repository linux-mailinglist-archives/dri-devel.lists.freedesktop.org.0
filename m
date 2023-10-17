Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CE7CBC44
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B113C10E27A;
	Tue, 17 Oct 2023 07:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E149210E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:32:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d842adc6bso1226829f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697527955; x=1698132755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xo1rg/nTmbxtukzPgHEwPdWT+CrhVadKxXCPI4AC4Ug=;
 b=AaYg7Vtn0zV4CgVhNuhR3j5spXnvNFPT9y5b41qOngJ0fzQcjFqmwVd2AFFb02ddnM
 qz0ezm8kperc01OxdvO/qq+anwlBN8b3FyPUHyDRjDYycd373qTciDWl8gfP5rzr7/QG
 zwm8Y6Fq7NYcJDAhCgE98QAPHorj+g6dzXeUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697527955; x=1698132755;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xo1rg/nTmbxtukzPgHEwPdWT+CrhVadKxXCPI4AC4Ug=;
 b=TFJOdqxAqEz5liNNg8DNcXY7H1WCPqiJBw1EwrYIptkRLJfH7tJrOoUHHqZhEJDbdX
 9143SAlHcFBXLQKTr1XdWaR8TRwyix282o8E1TF/Bqrnx7H+A2QJ+A171jBmhY7J0V18
 ULBHNQT1GgthAJ44NyA4Kl92k/LlPtBJmpHw12mIRiAPdjRhK+llk1vUXghHQyK6p8w/
 btXsjCCWSU7UV9Y37IA/JFU01ioyG0ROeJkMUtbgmrnD25EJ7w8dsutrFvyD1b2gSESH
 Q13gx1Tj5GoJ+VBf3uXba5BPUNh7osH0z3k1DfXFIMsCJfeqzZNXMm78Jmgq7cyjduQb
 5Ccw==
X-Gm-Message-State: AOJu0YyJxpM8CWztHpJUB46ZWN8WNooRAIsX+32NE5UR7KKfh8a4J4xL
 M5g80VcVZ3/UDydLFcXrsklMmA==
X-Google-Smtp-Source: AGHT+IFo39CpVtMWSVaqAr0FLI6j6HZwvnfNgzlV1n/l67WzXjq63vOMxNa1m2QEdSb7DPtM7zPIAA==
X-Received: by 2002:adf:b198:0:b0:32d:1c5d:b477 with SMTP id
 q24-20020adfb198000000b0032d1c5db477mr1072288wra.4.1697527955225; 
 Tue, 17 Oct 2023 00:32:35 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (198.red-81-39-42.dynamicip.rima-tde.net. [81.39.42.198])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b00323330edbc7sm1029302wru.20.2023.10.17.00.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 00:32:34 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:32:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZS44j1dIkurL4ExN@dvetter-linux.ger.corp.intel.com>
References: <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
 <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
 <ZSkQxEL4596_pQW1@phenom.ffwll.local>
 <a4a5dc87-001b-2948-e74f-8c51d170b9b2@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4a5dc87-001b-2948-e74f-8c51d170b9b2@mailbox.org>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
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
Cc: Ray Strode <halfline@gmail.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 12:22:52PM +0200, Michel Dänzer wrote:
> On 10/13/23 11:41, Daniel Vetter wrote:
> > On Thu, Oct 12, 2023 at 02:19:41PM -0400, Ray Strode wrote:
> >> On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian König wrote:
> >>>>>> To be clear, my take is, if driver code is running in process context
> >>>>>> and needs to wait for periods of time on the order of or in excess of
> >>>>>> a typical process time slice it should be sleeping during the waiting.
> >>>>>> If the operation is at a point where it can be cancelled without side
> >>>>>> effects, the sleeping should be INTERRUPTIBLE. If it's past the point
> >>>>>> of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
> >>>>>> opinion, should kernel code busy block a typical process for dozens of
> >>>>>> milliseconds while keeping the process RUNNING. I don't think this is
> >>>>>> a controversial take.
> >>>>> Exactly that's what I completely disagree on.
> >>
> >> Okay if we can't agree that it's not okay for user space (or the
> >> kernel running in the context of user space) to busy loop a cpu core
> >> at 100% utilization throughout and beyond the process's entire
> >> scheduled time slice then we really are at an impasse. I gotta say i'm
> >> astonished that this seemingly indefensible behavior is somehow a
> >> point of contention, but I'm not going to keep arguing about it beyond
> >> this email.
> >>
> >> I mean we're not talking about scientific computing, or code
> >> compilation, or seti@home. We're talking about nearly the equivalent
> >> of `while (1) __asm__ ("nop");`
> > 
> > I don't think anyone said this shouldn't be fixed or improved.
> > 
> > What I'm saying is that the atomic ioctl is not going to make guarantees
> > that it will not take up to much cpu time (for some extremely vague value
> > of "too much") to the point that userspace can configure it's compositor
> > in a way that it _will_ get killed if we _ever_ violate this rule.
> > 
> > We should of course try to do as good as job as possible, but that's not
> > what you're asking for. You're asking for a hard real-time guarantee with
> > the implication if we ever break it, it's a regression, and the kernel has
> > to bend over backwards with tricks like in your patch to make it work.
> 
> I don't think mutter really needs or wants such a hard real-time
> guarantee. What it needs is a fighting chance to react before the kernel
> kills its process.
> 
> The intended mechanism for this is SIGXCPU, but that can't work if the
> kernel is stuck in a busy-loop. Ray's patch seems like one way to avoid
> that.

I don't think signals will get us out of this either, or at least still
has risk. We are trying to make everything interruptible and bail out
asap, but those checks are when we're blocking, not when the cpu is busy.

So this also wont guarantee that you expire your timeslice when a driver
is doing a silly expensive atomic_check computation. Much less likely, but
definitely not a zero chance.

> That said, as long as SIGXCPU can work as intended with the non-blocking
> commits mutter uses for everything except modesets, mutter's workaround
> of dropping RT priority for the blocking commits seems acceptable for
> the time being.

Is there no rt setup where the kernel just auto-demotes when you've used
up your slice? That's the only setup I see that guarantees you're not
getting killed here.

I think dropping rt priority around full modesets is still good since
modests really shouldn't ever run as rt, that makes no sense to me.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
