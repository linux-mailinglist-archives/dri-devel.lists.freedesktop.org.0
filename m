Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915C3B73C2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 16:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F76E846;
	Tue, 29 Jun 2021 14:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1D6E846
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 14:05:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so1928038wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=g6Uq9Wei+2viOIoJaR3Iu4chtk74RFCGSk6LTvjSyfc=;
 b=EWf8QjOGVwnXzyPmQH1hxEXkoGxfsFP+VIFNYUbdYpLpIgA3vx+Y1F/AHlUuhGDLa/
 J6LWebJo+bC5C6tV5K2ac+tPwOwCmu1bNdGnJw0TSn8fVyf5MpHGlOZ68sQjAFvEnU30
 qxHCVqdRx3/Hn4BTJa3xN3LJUPfKbj3PJi3sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g6Uq9Wei+2viOIoJaR3Iu4chtk74RFCGSk6LTvjSyfc=;
 b=F8gzbucbOvLUNRglMX9bhA1uFjHNtYg2OIlW5tlOPceylSRjXqMmsiBk5VEK2vQC4k
 xH+V4TxQQlrMv6aJ6HxU8tvE4paBEiYkqvEKEUR9Fk8Me0DTahnmXAptxRiUozZNBLC1
 UhAMHxwf0iTm++cXFM+LgWiJyqrA/vkqDffvLJHo3KNgNcDwq8Nh0cww1OC11EatEnh9
 hY2BMIYueP2/Vs/torA1tJQHIMgj+cakYORUfUjPOBkBbp9DhYie1L1UmrGeeZCTRe/O
 c7rxraCV30yQ+AVjbEzqCoPuTugHtlhaXgBZgKqGTYuFz95CZWqj8uep1M8olI66BsWH
 Uq8w==
X-Gm-Message-State: AOAM533Zpt+Uq+641BPJ8x2jW1WCipJAuxZnleqFw33X0QF1C1flLUtS
 6SzE72bakS55fm83sH9tqa9ENw==
X-Google-Smtp-Source: ABdhPJx8GDsQupWbWT4exlxkiCSGAV94HTpvxJxQ8RnZCTqVU10c9NiBNDfChjZ847AJa2WWXB5sPg==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr33139586wmm.86.1624975533510; 
 Tue, 29 Jun 2021 07:05:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm2756175wmq.1.2021.06.29.07.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:05:32 -0700 (PDT)
Date: Tue, 29 Jun 2021 16:05:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <YNsoqiGKMCRzhOfx@phenom.ffwll.local>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
 <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 01:24:53PM +0200, Christian König wrote:
> Am 29.06.21 um 13:18 schrieb Boris Brezillon:
> > Hi Christian,
> > 
> > On Tue, 29 Jun 2021 13:03:58 +0200
> > Christian König <christian.koenig@amd.com> wrote:
> > 
> > > Am 29.06.21 um 09:34 schrieb Boris Brezillon:
> > > > Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> > > > reset. This leads to extra complexity when we need to synchronize timeout
> > > > works with the reset work. One solution to address that is to have an
> > > > ordered workqueue at the driver level that will be used by the different
> > > > schedulers to queue their timeout work. Thanks to the serialization
> > > > provided by the ordered workqueue we are guaranteed that timeout
> > > > handlers are executed sequentially, and can thus easily reset the GPU
> > > > from the timeout handler without extra synchronization.
> > > Well, we had already tried this and it didn't worked the way it is expected.
> > > 
> > > The major problem is that you not only want to serialize the queue, but
> > > rather have a single reset for all queues.
> > > 
> > > Otherwise you schedule multiple resets for each hardware queue. E.g. for
> > > your 3 hardware queues you would reset the GPU 3 times if all of them
> > > time out at the same time (which is rather likely).
> > > 
> > > Using a single delayed work item doesn't work either because you then
> > > only have one timeout.
> > > 
> > > What could be done is to cancel all delayed work items from all stopped
> > > schedulers.
> > drm_sched_stop() does that already, and since we call drm_sched_stop()
> > on all queues in the timeout handler, we end up with only one global
> > reset happening even if several queues report a timeout at the same
> > time.
> 
> Ah, nice. Yeah, in this case it should indeed work as expected.
> 
> Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> to
> it.

Yeah this is also what we want for the case where you have cascading
reset. Like if you have per-engine reset, but if that fails, have to reset
the entire chip. That's similar but not quite to the soft recover, then
chip reset amdgpu does since for the engine reset you do have to stop the
scheduler. For full context the i915 reset cascade:

- try to evict the offending work with preemption (similar in it's impact
  to amdgpu's soft recovery I think), other requests on the same engine
  are unaffected here.

- reset the affected engine

- reset the entire chip

So my plan at least is that we'd only call drm_sched_stop as we escalate.
Also on earlier chips first and second might not be available.

Lucky for us chip reset only resets the render side of things, display
survives on gen4+, so we don't have the nasty locking issue amdgpu has.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
