Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4017B9C5D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708AC10E1D7;
	Thu,  5 Oct 2023 09:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ED110E1D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:57:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3232e96deaaso178808f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696499864; x=1697104664; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=55vrEaxBIfc2hOYlLhsomDLx6DvcuVrww+Ib7FMrIAc=;
 b=dtMP7zOlqZqnpWqeFNF5J9hEzIGbUjcs90/EeeNyG63aPDQlIawUxYCEPSGHKA1ysW
 2L91BXi/nxG028xd8XY2bg6pnFvuu95QfF5x79tHaocIEc+SzwLbD3PXOG1Qtzu3PmoV
 /0FktK9+MKon87XkFuNNlFVoVjOpeBKI39AB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696499864; x=1697104664;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=55vrEaxBIfc2hOYlLhsomDLx6DvcuVrww+Ib7FMrIAc=;
 b=QSWvchJwiwZ293hTNVY1KV1sa8wCkxC1PNLrSj5cWAnnAprtPPBr91WThKimKlHlCA
 L80BERLXDwcOxeWgQamluclgAAXTAi7tZNdy47jfcuy2plEPuWl1TFyKWWocFGKPMvWd
 YXpW7hAV24PplbxCEttxvuCsIzbefjPO0wIBS9FNMo0E2p7Gs1uX3DRdy8oXgQ4jJYs0
 H03RBSbemkGERR8pmEP50fL5Jh7rwbfq4oQmqoked9yI6xSFkHLZ2n12gP3LgtOO6V61
 tlmQrdNbW9Fl6/OGg1fwniBvvqndRJTtGg09+TzJMXv/p051+TyOAWv6GtltVzI0dzBk
 uEDg==
X-Gm-Message-State: AOJu0YzrtXAqIzYs/L97MYibdzcvaZpxc7sUhNuXd+YTSZ1SJkRZrWrh
 UmUc8ku1f8M8C69D0Ba0/rdMbw==
X-Google-Smtp-Source: AGHT+IHmCeFmzjbJXxxQtCTNex9LvPKVIcYgJK8N4EfWoXI36CZlnrA/ctzEtt98ok3364czJmFHqA==
X-Received: by 2002:adf:cf0a:0:b0:31a:e54e:c790 with SMTP id
 o10-20020adfcf0a000000b0031ae54ec790mr4150844wrj.6.1696499864256; 
 Thu, 05 Oct 2023 02:57:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a5d5502000000b00323330edbc7sm1390726wrv.20.2023.10.05.02.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 02:57:43 -0700 (PDT)
Date: Thu, 5 Oct 2023 11:57:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ray Strode <halfline@gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
References: <20230926170549.2589045-1-halfline@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926170549.2589045-1-halfline@gmail.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: Ray Strode <rstrode@redhat.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 01:05:49PM -0400, Ray Strode wrote:
> From: Ray Strode <rstrode@redhat.com>
> 
> A drm atomic commit can be quite slow on some hardware. It can lead
> to a lengthy queue of commands that need to get processed and waited
> on before control can go back to user space.
> 
> If user space is a real-time thread, that delay can have severe
> consequences, leading to the process getting killed for exceeding
> rlimits.
> 
> This commit addresses the problem by always running the slow part of
> a commit on a workqueue, separated from the task initiating the
> commit.
> 
> This change makes the nonblocking and blocking paths work in the same way,
> and as a result allows the task to sleep and not use up its
> RLIMIT_RTTIME allocation.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
> Signed-off-by: Ray Strode <rstrode@redhat.com>

So imo the trouble with this is that we suddenly start to make
realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
change, because even limited to the case of !ALLOW_MODESET we do best
effort guarantees at best. And some drivers (again amd's dc) spend a ton
of cpu time recomputing state even for pure plane changes without any crtc
changes like dpms on/off (at least I remember some bug reports about
that). And that state recomputation has to happen synchronously, because
it always influences the ioctl errno return value.

My take is that you're papering over a performance problem here of the
"the driver is too slow/wastes too much cpu time". We should fix the
driver, if that's possible.

Another option would be if userspace drops realtime priorities for these
known-slow operations. And right now _all_ kms operations are potentially
cpu and real-time wasters, the entire uapi is best effort.

We can also try to change the atomic uapi to give some hard real-time
guarantees so that running compositors as SCHED_RT is possible, but that
- means a very serious stream of bugs to fix all over
- therefore needs some very wide buy-in from drivers that they're willing
  to make this guarantee
- probably needs some really carefully carved out limitations, because
  there's imo flat-out no way we'll make all atomic ioctl hard time limit
  bound

Also, as König has pointed out, you can roll this duct-tape out in
userspace by making the commit non-blocking and immediately waiting for
the fences.

One thing I didn't see mention is that there's a very subtle uapi
difference between non-blocking and blocking:
- non-blocking is not allowed to get ahead of the previous commit, and
  will return EBUSY in that case. See the comment in
  drm_atomic_helper_commit()
- blocking otoh will just block until any previous pending commit has
  finished

Not taking that into account in your patch here breaks uapi because
userspace will suddenly get EBUSY when they don't expect that.

Cheers, Sima


> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..1a1e68d98d38 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2028,64 +2028,63 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	 * This is the point of no return - everything below never fails except
>  	 * when the hw goes bonghits. Which means we can commit the new state on
>  	 * the software side now.
>  	 */
>  
>  	ret = drm_atomic_helper_swap_state(state, true);
>  	if (ret)
>  		goto err;
>  
>  	/*
>  	 * Everything below can be run asynchronously without the need to grab
>  	 * any modeset locks at all under one condition: It must be guaranteed
>  	 * that the asynchronous work has either been cancelled (if the driver
>  	 * supports it, which at least requires that the framebuffers get
>  	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
>  	 * before the new state gets committed on the software side with
>  	 * drm_atomic_helper_swap_state().
>  	 *
>  	 * This scheme allows new atomic state updates to be prepared and
>  	 * checked in parallel to the asynchronous completion of the previous
>  	 * update. Which is important since compositors need to figure out the
>  	 * composition of the next frame right after having submitted the
>  	 * current layout.
>  	 *
>  	 * NOTE: Commit work has multiple phases, first hardware commit, then
>  	 * cleanup. We want them to overlap, hence need system_unbound_wq to
>  	 * make sure work items don't artificially stall on each another.
>  	 */
>  
>  	drm_atomic_state_get(state);
> -	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> -	else
> -		commit_tail(state);
> +	queue_work(system_unbound_wq, &state->commit_work);
> +	if (!nonblock)
> +		flush_work(&state->commit_work);
>  
>  	return 0;
>  
>  err:
>  	drm_atomic_helper_cleanup_planes(dev, state);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit);
>  
>  /**
>   * DOC: implementing nonblocking commit
>   *
>   * Nonblocking atomic commits should use struct &drm_crtc_commit to sequence
>   * different operations against each another. Locks, especially struct
>   * &drm_modeset_lock, should not be held in worker threads or any other
>   * asynchronous context used to commit the hardware state.
>   *
>   * drm_atomic_helper_commit() implements the recommended sequence for
>   * nonblocking commits, using drm_atomic_helper_setup_commit() internally:
>   *
>   * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
>   * need to propagate out of memory/VRAM errors to userspace, it must be called
>   * synchronously.
>   *
>   * 2. Synchronize with any outstanding nonblocking commit worker threads which
>   * might be affected by the new state update. This is handled by
>   * drm_atomic_helper_setup_commit().
>   *
>   * Asynchronous workers need to have sufficient parallelism to be able to run
>   * different atomic commits on different CRTCs in parallel. The simplest way to
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
