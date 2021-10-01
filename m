Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B428A41E92C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 10:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7536D6ED64;
	Fri,  1 Oct 2021 08:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82426ED64
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=85pD22mYBLosz3Yrn+wZDPuio0T9e3csQDeUQTFrH2g=; 
 b=pvoe/wtMZVS5F9i5tD4mdPwr8cAsdjWlp/TY5lhYkBxDCQkQ0kBkOyM5QcImDkt/rGtO+3V07wEl64YfG0wXU6G/2hVsywKrD+ToOeI8pvOtnxMWzv1mpZ86BVV/0pbeFvoaoiX2R8C0Kd5723pcO8WbLfY9JGqhkh7o36ISh41KDPEbISwp7ECsg/+jqKeoItZwkGj8LfN+WPU5ZPBSnAj35Mk80GnGgd1rAtD1ZREvC0I1NS+8YE2Fl34L4D5bojZWImJi3Yq+UUAn0qcmqNV5wbdIx7shpg6ri1y6RiRNZzIJ7d/jUtKzzZ5riEHayAvX7YE1GXkoq8352zPkQg==;
Received: from 185.48.165.83.dynamic.reverse-mundo-r.com ([83.165.48.185]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWE6l-0004Yj-4r; Fri, 01 Oct 2021 10:41:31 +0200
Message-ID: <daa1c1b15b0766759597a62e882d302885d9f312.camel@igalia.com>
Subject: Re: [PATCH v3 4/4] drm/v3d: add multiple syncobjs support
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <maxime@cerno.tech>,  Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 01 Oct 2021 10:41:21 +0200
In-Reply-To: <20211001083744.l2hnoga6xj645jpk@mail.igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
 <ffd8b2e3dd2e0c686db441a0c0a4a0181ff85328.1633016479.git.mwen@igalia.com>
 <fd6acbe570d02f53b34973516556a15a1909cbf8.camel@igalia.com>
 <20211001083744.l2hnoga6xj645jpk@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-10-01 at 09:37 +0100, Melissa Wen wrote:
> On 10/01, Iago Toral wrote:
> > On Thu, 2021-09-30 at 17:19 +0100, Melissa Wen wrote:
> > > Using the generic extension from the previous patch, a specific
> > > multisync
> > > extension enables more than one in/out binary syncobj per job
> > > submission.
> > > Arrays of syncobjs are set in struct drm_v3d_multisync, that also
> > > cares
> > > of determining the stage for sync (wait deps) according to the
> > > job
> > > queue.
> > > 
> > > v2:
> > > - subclass the generic extension struct (Daniel)
> > > - simplify adding dependency conditions to make understandable
> > > (Iago)
> > > 
> > > v3:
> > > - fix conditions to consider single or multiples in/out_syncs
> > > (Iago)
> > > - remove irrelevant comment (Iago)
> > > 
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > ---
> > >  drivers/gpu/drm/v3d/v3d_drv.c |   6 +-
> > >  drivers/gpu/drm/v3d/v3d_drv.h |  24 +++--
> > >  drivers/gpu/drm/v3d/v3d_gem.c | 185
> > > ++++++++++++++++++++++++++++++
> > > ----
> > >  include/uapi/drm/v3d_drm.h    |  49 ++++++++-
> > >  4 files changed, 232 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> > > b/drivers/gpu/drm/v3d/v3d_drv.c
> > > index 3d6b9bcce2f7..bd46396a1ae0 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > > @@ -96,6 +96,9 @@ static int v3d_get_param_ioctl(struct
> > > drm_device 
> > 
> > (...)
> > 
> > > @@ -516,9 +536,11 @@
> > > v3d_attach_fences_and_unlock_reservation(struct
> > > drm_file *file_priv,
> > >  					 struct v3d_job *job,
> > >  					 struct ww_acquire_ctx
> > > *acquire_ctx,
> > >  					 u32 out_sync,
> > > +					 struct v3d_submit_ext *se,
> > >  					 struct dma_fence *done_fence)
> > >  {
> > >  	struct drm_syncobj *sync_out;
> > > +	bool has_multisync = se && (se->flags & 
> > 
> > We always pass the 'se' pointer from a local variable allocated in
> > the
> > stack of the caller so it is never going to be NULL.
> > 
> > I am happy to keep the NULL check if you want to protect against
> > future
> > changes just in case, but if we do that then...
> > 
> > > DRM_V3D_EXT_ID_MULTI_SYNC);
> > >  	int i;
> > >  
> > >  	for (i = 0; i < job->bo_count; i++) {
> > 
> > (...)
> > 
> > > +static void
> > > +v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	if (!se->out_sync_count)
> > 
> > ...we should also check for NULL here for consistency.
> yes, consistency makes sense here.
> > Also, I think there is another problem in the code: we always call
> > v3d_job_cleanup for failed jobs, but only call v3d_job_put for
> > successful jobs. However, reading the docs for drm_sched_job_init:
> > 
> > "Drivers must make sure drm_sched_job_cleanup() if this function
> > returns successfully, even when @job is aborted before
> > drm_sched_job_arm() is called."
> > 
> > So my understanding is that we should call v3d_job_cleanup instead
> > of
> > v3d_job_put for successful jobs or we would be leaking sched
> > resources
> > on every successful job, no?
> 
> When job_init is successful, v3d_job_cleanup is called by scheduler
> when
> job is completed. drm_sched_job_cleanup describes how it works after
> drm_sched_job_arm:
> 
> " After that point of no return @job is committed to be executed by
> the
> scheduler, and this function should be called from the
> &drm_sched_backend_ops.free_job callback."
> 
> On v3d_sched.c, .free_job points to v3d_sched_job_free(), which in
> turn
> calls v3d_job_cleanup() (and then drm_sched_job_cleanup). So, it
> looks
> ok.
> 
> Also, we can say that the very last v3d_job_put() is in charge to
> decrement refcount initialized (set 1) in v3d_job_init(); while the
> v3d_job_cleanup() from v3d_sched_job_free() callback decrements
> refcount
> that was incremented when v3d_job_push() pushed the job to the
> scheduler.
> 
> So, refcount pairs seem consistent, I mean, get and put. And about
> drm_sched_job_cleanup, it is explicitly called when job_init fails or
> after that by the scheduler.
> 

   A. Ah ok, thanks for explaining this!

With the consistency issue discussed above fixed, for the series:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

