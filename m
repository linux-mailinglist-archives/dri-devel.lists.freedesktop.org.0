Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0779F94E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B0310E38A;
	Fri, 20 Dec 2024 14:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uZBizrab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D269810E38A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 14:51:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5EA7FA418AE;
 Fri, 20 Dec 2024 14:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A1BC4CECD;
 Fri, 20 Dec 2024 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734706305;
 bh=qs/++TQWUXMzgnAiF0WumtbqnQ5reqmLtqvmX0M8WRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZBizrabWzPh67mQhay6G+Ts1QyF9Jf115RLeY8PNe1ddV8BmqaxJB7gwDj015bm8
 Z3Ukg2Q1IdSR9HbW2kN28JcYT2rCv2r+YsawPsX8PSOKSSCDxp4wZHWs6v4jCXr/KZ
 pcLBLY9V7SrntxT0KDQd23y6gCurZ/+8ysdMogY8RISIaJHWhj6x1xEhYPv07KFsIA
 c7gX/b3r9yi6bKoY9QoQNqV7oHctvZcDxNz8M+7E7h7/ts9AvcbPr1NIz9uZnwlSRe
 lWyBFoCAMIMmEaJEF6JB5VFYy45fTNOCPziynWk7Q5tmWRDZ+GDByy2LMSkFRtkfMA
 Cb87kRhWvAVFg==
Date: Fri, 20 Dec 2024 15:51:39 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
Message-ID: <Z2WEe-tgp5CDtk4w@pollux>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
 <Z2VunIJ4ltfW_xqD@pollux>
 <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
 <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
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

On Fri, Dec 20, 2024 at 03:11:34PM +0100, Philipp Stanner wrote:
> On Fri, 2024-12-20 at 14:25 +0100, Christian König wrote:
> > Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
> > > On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian König wrote:
> > > > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 7ce25281c74c..d6f8df39d848 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +	 *
> > > > > +	 * @sched_job: the job to run
> > > > > +	 *
> > > > > +	 * Returns: dma_fence the driver must signal once the
> > > > > hardware has
> > > > > +	 *	completed the job ("hardware fence").
> > > > > +	 *
> > > > > +	 * Note that the scheduler expects to 'inherit' its
> > > > > own reference to
> > > > > +	 * this fence from the callback. It does not invoke an
> > > > > extra
> > > > > +	 * dma_fence_get() on it. Consequently, this callback
> > > > > must return a
> > > > > +	 * fence whose refcount is at least 2: One for the
> > > > > scheduler's
> > > > > +	 * reference returned here, another one for the
> > > > > reference kept by the
> > > > > +	 * driver.
> > > > Well the driver actually doesn't need any extra reference. The
> > > > scheduler
> > > > just needs to guarantee that this reference isn't dropped before
> > > > it is
> > > > signaled.
> > > I think he means the reference the driver's fence context has to
> > > have in order
> > > to signal that thing eventually.
> > 
> > Yeah, but this is usually a weak reference. IIRC most drivers don't 
> > increment the reference count for the reference they keep to signal a
> > fence.
> > 
> > It's expected that the consumers of the dma_fence keep the fence
> > alive 
> > at least until it is signaled.
> 
> So are you saying that the driver having an extra reference (without
> having obtained it with dma_fence_get()) is not an issue because the
> driver is the one who will signal the fence [and then be done with it]?

It's never a "real" issue if you have multiple pointers to a reference counted
object as long as you can ensure that you hold at least one reference for the
time you have pointers to the object.

But, that's bad design. For every pointer to an object a separate reference
should be taken.
