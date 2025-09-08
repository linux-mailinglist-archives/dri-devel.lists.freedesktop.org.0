Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7468B49A49
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8142210E5BF;
	Mon,  8 Sep 2025 19:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HYJqCiqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C4610E5BF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757360796; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CIMaMPcqAzGvqqpp9qV3N/MpdOjD8jO596dNzZ4sZOd5PsLNeAr6a596kUGz1+JKCFTAl3MGFJh+uURCrOlkwtyKh3oaofJfC/DoKTovbFL3ypl+rM4sAodZvB2k8LsqWae/WSl323I8IHAQ5n422foDRJptBDNvhbZvKFNn6Fg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757360796;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tvnX0pwgboGzYzngTMnFujAd3cPB1knbYtj822oCRiU=; 
 b=UAZwluC0hAZqZaqYtmRT01goIowLaz+ML+MTK+S42N5iywIEFJt5WAQkvZ0znHQx6X1BGGCpcKxUtwsjBvLl962yHuvOmCQM7wRH5gZO3gpeuAd+lCEqlvLlojfvC9NSadh6rDtNJ86gv/tuXt8AQw67yUVEuD4FdIXO2yrsnd8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757360796; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=tvnX0pwgboGzYzngTMnFujAd3cPB1knbYtj822oCRiU=;
 b=HYJqCiqocbK4lMIG8WWA1jhcsNuDHEhaVa8y142unlRaX+DPByhMgNealSE1R8Yw
 gdTfR1zBiiRLsTgZSDHiD82V2mcPnKFr8mQO68YYvKB5dF13h67F1rVA6m31sTUksyE
 6q/Ok2Rm4n/sc/XeCaJIrFDS/oCAbbbiZA0MyCp4=
Received: by mx.zohomail.com with SMTPS id 1757360793998652.0464633293959;
 Mon, 8 Sep 2025 12:46:33 -0700 (PDT)
Date: Mon, 8 Sep 2025 20:46:29 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 3/5] drm/panfrost: Introduce JM context for manging job
 resources
Message-ID: <duhc4uddygpsiccipe5ftv7mi4fz4khermst6jeqlkbigh6zmn@2btsx2yltsye>
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
 <20250828023422.2404784-4-adrian.larumbe@collabora.com>
 <CAPj87rMRkmkG2MJVnh-zMiNXJ-=fW2jzS_mX7WWWQi3hZmHUyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rMRkmkG2MJVnh-zMiNXJ-=fW2jzS_mX7WWWQi3hZmHUyg@mail.gmail.com>
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

Hi Daniel,

On 30.08.2025 10:12, Daniel Stone wrote:
> Hi Adrian,
>
> On Thu, 28 Aug 2025 at 04:35, Adrián Larumbe
> <adrian.larumbe@collabora.com> wrote:
> > -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> > +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
> >  {
> > -       struct panfrost_device *pfdev = panfrost_priv->pfdev;
> > -       int i;
> > +       struct panfrost_file_priv *priv = file->driver_priv;
> > +       struct panfrost_device *pfdev = priv->pfdev;
> > +       struct panfrost_jm_ctx *jm_ctx;
> >
> > -       for (i = 0; i < NUM_JOB_SLOTS; i++)
> > -               drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> > +       jm_ctx = xa_erase(&priv->jm_ctxs, handle);
> > +       if (!jm_ctx)
> > +               return -EINVAL;
> > +
> > +       for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> > +               if (jm_ctx->slots[i].enabled)
> > +                       drm_sched_entity_destroy(&jm_ctx->slots[i].sched_entity);
> > +       }
> >
> >         /* Kill in-flight jobs */
> >         spin_lock(&pfdev->js->job_lock);
> > -       for (i = 0; i < NUM_JOB_SLOTS; i++) {
> > -               struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> > -               int j;
> > +       for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> > +               struct drm_sched_entity *entity = &jm_ctx->slots[i].sched_entity;
> > +
> > +               if (!jm_ctx->slots[i].enabled)
> > +                       continue;
> >
> > -               for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> > +               for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> >                         struct panfrost_job *job = pfdev->jobs[i][j];
> >                         u32 cmd;
> >
> > @@ -980,18 +1161,7 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> >                 }
> >         }
> >         spin_unlock(&pfdev->js->job_lock);
> > -}
> > -
> > -int panfrost_job_is_idle(struct panfrost_device *pfdev)
> > -{
> > -       struct panfrost_job_slot *js = pfdev->js;
> > -       int i;
> > -
> > -       for (i = 0; i < NUM_JOB_SLOTS; i++) {
> > -               /* If there are any jobs in the HW queue, we're not idle */
> > -               if (atomic_read(&js->queue[i].sched.credit_count))
> > -                       return false;
> > -       }
> >
> > -       return true;
> > +       panfrost_jm_ctx_put(jm_ctx);
> > +       return 0;
> >  }
>
> It seems odd that both panfrost_jm_ctx_destroy() and
> panfrost_jm_ctx_release() share lifetime responsibilities. I'd expect
> calling panfrost_jm_ctx_destroy() to just release the xarray handle
> and drop the refcount.
>
> I can see why calling panfrost_jm_ctx_destroy() is the one to go try
> to cancel the jobs - because the jobs keep a refcount on the context,
> so we need to break that cycle somehow. But having both the
> handle-release and object-release function drop a ref on the sched
> entity seems odd?
>
> It doesn't help much that panfrost_job is used both for actual jobs
> (as the type) and the capability for a device to have multiple
> job-manager contexts (as a function prefix). Would be great to clean
> that up, so you don't have to think about whether e.g.
> panfrost_job_close() is actually operating on a panfrost_job, or
> operating on multiple panfrost_jm_ctx which operate on multiple
> panfrost_job.

I've submitted a v2 of this patch series. In the newer one, drm_sched_entity_destroy()
is only called in panfrost_jm_ctx_destroy(), whereas panfrost_jm_ctx_release() will just
free the memory associated with the context when the refcnt reaches 0.

As for the JS-and-panfrost_job function naming confusion, I'll deal with it in a
patch series I hope to submit before the end of this week.

> Cheers,
> Daniel

Adrian Larumbe
