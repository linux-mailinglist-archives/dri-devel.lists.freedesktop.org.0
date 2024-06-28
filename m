Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF791C567
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5410ED01;
	Fri, 28 Jun 2024 18:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bVQVln/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442110ECF0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:06:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cdf4e33c7so84987e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719597992; x=1720202792; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D6RF7ZhfHPezXZ+JwgRkmSw3bzrniFyo5WgctlVMcKM=;
 b=bVQVln/mxEEUI2+2zRr/3YTXXTm/q4aebjpNqVkrIJZFW/nDZ66PBGf6975vxZ7swM
 dh24Uanww7yiK/gY9JQlpoUtTbx6QrckB23mgXwM1iJgFqjfjvsf0+Grm78NOuXQFUT3
 bKkbR3kezRDuHfzcVD03n5t7vvLtnVDx6fq1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719597992; x=1720202792;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6RF7ZhfHPezXZ+JwgRkmSw3bzrniFyo5WgctlVMcKM=;
 b=jyMOtxNzHgcM8wyynMk0FEwmKdrfN39BUP8/kTni/WBjxfqLtNAHlVaDnuHpZUnQkR
 oJ0+0C3Hn5EzTiKwH92SQ0ggDHvTBYCToqOCU80iQYK3Z9YssdtMkNRrFqvRp/lsOyTO
 PTObAjaMp0YmeAFAu9MM0MB3hgUYMl603CFtbSVKMvfsUHMzSOqpFKNCKBdb3IaKU8d5
 kihP5Q/mVjscPvg0HRioygHsEwfdPPZZJYerjZKBHCci3zgAhTpGXpo2WBpHHV2DF/P3
 lgTbpbYiKnWZ+lOakH2AZxXFRvGvzp1Z4AkN6YBZsecrACY6+zVLXMdeCvUVgzeiU264
 1HwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+8Wqv+fA3W9vX+Kpa9dncKC/avu3NiGhajGLtxJCAT+K/PV9bStxolPV0J7Md93EOe3trzGDstb97UXx6drrGmenopga79vVS7vTC5hrJ
X-Gm-Message-State: AOJu0YycWqCz3FoAj9m/I8YsGbpdxYvHBUyQAQtF6/MO4/5/5Hy6Ri8C
 M8DKBHETBJYqo7R9LN6NbVKmz4gZqk+kddA+G4IV4c632KQ4JtZKCwP4zrFUg6w=
X-Google-Smtp-Source: AGHT+IFPw3UkwaO7XpBL0spmNeH+I8UeFCE0PwAIAhPs3nFppOSfxvTU+I6UaRVoaBiX0qZ+ssaUIQ==
X-Received: by 2002:a05:6512:1386:b0:52e:7498:118a with SMTP id
 2adb3069b0e04-52e7498135emr3870794e87.4.1719597991738; 
 Fri, 28 Jun 2024 11:06:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e0b7csm3010776f8f.49.2024.06.28.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:06:31 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:06:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] Re: dma_buf_detach lockdep splat
Message-ID: <Zn77penjAruTgLMM@phenom.ffwll.local>
References: <40611e5ff8c32b99e7863293a0baac078f323d8f.camel@linux.intel.com>
 <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
 <6bc17415f36c2a9c689010e1cf397fc75a8df55e.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bc17415f36c2a9c689010e1cf397fc75a8df55e.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jun 27, 2024 at 02:18:44PM +0200, Thomas Hellström wrote:
> On Thu, 2024-06-27 at 10:04 +0200, Daniel Vetter wrote:
> > On Wed, Jun 26, 2024 at 05:58:02PM +0200, Thomas Hellström wrote:
> > > Hi!
> > > 
> > > I'm seeing the below lockdep splat 1) with the xe driver in an
> > > imported
> > > dma-buf object destruction path.
> > > 
> > > It's not because we hold the dma_resv lock at that point, but
> > > rather
> > > because we hold *another* dma_resv lock at that point, and the
> > > dma_resv
> > > detach happens when the object is idle, in this case it was idle at
> > > the
> > > final put(), and dma_buf_detach() is called in the putting process.
> > > 
> > > Holding another dma-buf lock might happen as part of
> > > drm_exec_unlock_all, or simply if the wider vm dma_resv was held at
> > > object put time, so it's not an uncommon pattern, even if the
> > > drm_exec
> > > instance can be fixed by putting all bos after unlocking them all.
> > > 
> > > Two solutions coming to mind here:
> > > 
> > > 1) Provide a dma_buf_detach_locked()
> > 
> > This smells way too much like the endless headaches we had with
> > drm_gem_object_put_locked and friends against
> > drm_device.struct_mutex. Or
> > I'm not understanding what you're doing, because I'm pretty sure you
> > have
> > to take the dma_resv lock on final put() of imported objects. Because
> > that
> > final put() is of the import wrapper, the exporter (and other
> > importers)
> > can still get at that object and so dma_resv_lock is very much
> > needed.
> 
> Yeah, the TTM final put looks like
> 
> if (!dma_resv_trylock() || !idle)
> 	queue_work(final_distruction);
> 
> dma_resv_unlock();
> dma_buf_detach(); <--- lockdep splat
> 
> Here's where a dma_buf_detach_locked() would've made sense before the
> dma_resv_unlock().
> 
> But if you think this will cause grief, I'm completely fine with
> fixing this in TTM by always taking the deferring path.

Oh I misunderstood what you've meant, I thought you want to do a huge
exercise in passing the "do we know we're locked" flag all the way through
entire callchains to exporters.

If it's just so that the fastpath of bypassing the worker can function for
imported buffers, then I think that's fine. As long as we just punt to the
worker if we can't get the lock.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
