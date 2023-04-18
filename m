Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0C6E5C61
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185410E704;
	Tue, 18 Apr 2023 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7551110E720
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:45:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1745b7132so3533455e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681807536; x=1684399536;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oT5P+C8jhcnVktHuaT8CaiAl2LYwjoUSuguqcQQFtp4=;
 b=FanzCFjomRlpL2OEofMz+oVxq6i4uNv2gnUp26WfZ6CbrvGoNxpyzRO9DB2aHjvVIJ
 4FuOuc/fGLggIde9ottv4hvvZ79pRU1XLEWxMvks+oPAJDypRw0e29W4MMGhJ9zamOBp
 J180c50wDd4N8ucvs5m1gzu/gaE1gGElKXC40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681807536; x=1684399536;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oT5P+C8jhcnVktHuaT8CaiAl2LYwjoUSuguqcQQFtp4=;
 b=DUsK4bi84iSZdJaXXht4bjaMR/k22pJtbtkYsE2TyEXufV286eY+iTyEhDKaqGsfLf
 9/q64XLaZqGWILAQoe9qPWWxbYh/0hcZ5nFVjmstaleOXRM4moxbUJuXtUuMM6G7f1HJ
 tgQLqhbOmiDh7P155q7dQFgz7+wtEEdPwk+UBvWzfcvwsvD297fXgRgDnLgJQFISqpX9
 Ku67h/cq8DnllOUeBkPaJqe6wDgRj/S8JUBiDK9nxBbewCMOkHeMFwd18TkZUgpD76t1
 7xs2vL+YOYJnJfVct/X0SluFmIy9NhhOpRxy9esWUQtai7t5twkPtKnZUqVDCpWrRDzp
 M96g==
X-Gm-Message-State: AAQBX9eNRurcEPRa7bah58awhJiHv6eu5l7AROoalFtCpnK1vzh95wrs
 aqnT/NCgozB/wnHYNzvIEQPTvQ==
X-Google-Smtp-Source: AKy350YvSEYDzOeKn9KFoIbnr6WuwyMxchvWtx3lAPsn13XE0E7uVmL1Lmr9GjC6iusO9jxxDaLSeA==
X-Received: by 2002:a05:600c:3d18:b0:3f1:7490:e595 with SMTP id
 bh24-20020a05600c3d1800b003f17490e595mr3737876wmb.2.1681807536442; 
 Tue, 18 Apr 2023 01:45:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u7-20020a7bcb07000000b003ee70225ed2sm14293806wmj.15.2023.04.18.01.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 01:45:35 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:45:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 12/18] rust: drm: sched: Add GPU scheduler abstraction
Message-ID: <ZD5YrQ52Yn1np8ve@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-12-917ff5bc80a8@asahilina.net>
 <ZC2XBfJGAdNMQjpZ@phenom.ffwll.local>
 <ZC3L/uinmOwI+FbI@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC3L/uinmOwI+FbI@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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

On Wed, Apr 05, 2023 at 09:29:02PM +0200, Daniel Vetter wrote:
> On Wed, Apr 05, 2023 at 05:43:01PM +0200, Daniel Vetter wrote:
> > On Tue, Mar 07, 2023 at 11:25:37PM +0900, Asahi Lina wrote:
> > > +/// An armed DRM scheduler job (not yet submitted)
> > > +pub struct ArmedJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
> > > +
> > > +impl<'a, T: JobImpl> ArmedJob<'a, T> {
> > > +    /// Returns the job fences
> > > +    pub fn fences(&self) -> JobFences<'_> {
> > > +        JobFences(unsafe { &mut *self.0.job.s_fence })
> > > +    }
> > > +
> > > +    /// Push the job for execution into the scheduler
> > > +    pub fn push(self) {
> > > +        // After this point, the job is submitted and owned by the scheduler
> > > +        let ptr = match self {
> > > +            ArmedJob(job, _) => Box::<Job<T>>::into_raw(job),
> > > +        };
> > 
> > If I get this all right then this all makes sure that drivers can't use
> > the job after push and they don't forgot to call arm.
> > 
> > What I'm not seeing is how we force drivers to call push once they've
> > called arm? I haven't check what the code does, but from the docs it
> > sounds like if you don't call push then drop will get called. Which wreaks
> > the book-keeping on an armed job. Or is there someting that prevents
> > ArmedJob<T> from having the Drop trait and so the only way to not go boom
> > is by pushing it?
> > 
> > Googling for "rust undroppable" seems to indicate that this isn't a thing
> > rust can do?
> 
> Another thing that I just realized: The driver must ensure that the
> arm->push sequence on a given drm_sched_entity isn't interrupte by another
> thread doing the same, i.e. you need to wrap it all in a lock, and it
> always needs to be the same lock for a given entity.
> 
> I have no idea how to guarantee that, but I guess somehow we should?

Ok I was wrong here, pushing the job is optional, but the locking rules
are still the same.

I think we can solve this in rust with:
- passing &mut Entity to a new submit_job function. that way locking rules
  are left to the driver, which I think is best.
- the submit_job also takes a closure, and passes the armed job as a &mut
  ArmedJob to it. That way we guarantee that the armed job never survives
  longer than the mutex guard (or whatever trick the driver is using) for
  the Entity
- that closure probably should have Result return type which submit_job
  just passes on, because some drivers (when you support userptr that is)
  need to be able to bail out. since the ArmedJob is borred it shouldn't
  be able to escape through the return value
- only ArmedJob has push_job

I think with that we fully uphold the drm_sched arm/push_job contract on
the rust side?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
