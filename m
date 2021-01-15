Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69A2F7D2F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E7E89FDB;
	Fri, 15 Jan 2021 13:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EF189FDB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 13:52:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 190so7432876wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 05:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jakGKkFcEouvIM6rsCNYY7Hxb6dc9WDFp64lz1etabA=;
 b=I3IZgHid5yo45oR+LnxxJ2KDNXnuWVuMz6GeB1TUp+xDFDja2CqERom573yvxflXA4
 gc15a+sU0nm3pLTRnn3T3e+zXsN1AtQ/lhK1WIBUN7F/AbILYn+h3ClbwwtXT1NeYliC
 eMCGBNjt4blNa3bxzM/5+SiyZSLLWT935JBP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jakGKkFcEouvIM6rsCNYY7Hxb6dc9WDFp64lz1etabA=;
 b=rqs0SC5NeugGgw5XMvlIW9iz39Sim0dTsPKn2V87WBv9A/0nI9ZW/vrSGuuqD2DT5K
 IUUViF3OpPqK/jKobpBCjptWiCZQJKJpzi5UxthsflOFs8V+qibC58A+7ULLjV4LkbYa
 ECNvBJkOs4jjccZeIa1fvMsDDVNsEGyVbyBNM5EWmWwg84b4lUUdABkUY8r0HlSIpEXZ
 jaAM9NGHUlq19wg7fq8He9f2mSYbl/oX65xxK7dxAnHUPVO5qXqRTB+AHQcw6P5vxFjU
 1hsbVEbMdrxN8i8fkGuDoVZFqvn666WNUW3vHKi576LZ6KPBuOYYPbnEV3Y1ZcQrtb8X
 mX0w==
X-Gm-Message-State: AOAM533eI+6PxINXy5p4M5jRiTcrEbdzNYTwUKAixjaNY14FwLJRY92x
 FYoiBd89vsgOdWcXoDLF6DZOgg==
X-Google-Smtp-Source: ABdhPJyk6ZMD1ok/N9OGBX/Bp1aWyoYDjaJSOTOJtgwc0jDOKGg4yO4ODk6kvJNL6i33cTAWgdql3Q==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr8866153wmb.180.1610718764790; 
 Fri, 15 Jan 2021 05:52:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm14828583wrx.93.2021.01.15.05.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:52:44 -0800 (PST)
Date: Fri, 15 Jan 2021 14:52:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT
Message-ID: <YAGeKq/WhMmnXghe@phenom.ffwll.local>
References: <20210115133550.1678-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115133550.1678-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 02:35:50PM +0100, Christian K=F6nig wrote:
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT can't be used when a reservation
> object lock is help or otherwise we can deadlock with page faults.
> =

> Make lockdep complain badly about that.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 6e74e6745eca..6228e9cd089a 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -387,6 +387,20 @@ int drm_syncobj_find_fence(struct drm_file *file_pri=
vate,
>  	if (!syncobj)
>  		return -ENOENT;
>  =

> +	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT &&
> +	    IS_ENABLED(CONFIG_LOCKDEP)) {
> +		struct dma_resv robj;
> +
> +		/* Waiting for userspace with a reservation lock help is illegal
> +		 * cause that can deadlock with page faults. Make lockdep
> +		 * complain about it early on.

Not sure this is a good enough explanation, since anything that holds up
userspace can result in a functional deadlock (i.e. user observes no
forward progress, gets angry and decides that our gpu driver stack is
garbage). It's by far not pagefault.

I'd put something like

		/* We must not impede forward progress of userspace in any
		 * way, for otherwise the future fence never materializes
		 * and the application grinds to a full halt. Check for
		 * the worst offenders in terms of locking issues.
		 */

Feel free to bikeshed further.

> +		 */
> +		dma_resv_init(&robj);
> +		dma_resv_lock(&robj, NULL);
> +		dma_resv_unlock(&robj);
> +		dma_resv_fini(&robj);

I think you want to go stronger, since it's not just dma_resv, it's
holding anything that might hold up userspace that's illegal here. A
lockdep_assert_no_locks_held might be ideal, but a good second-best option
would be to grab mmap_lock. Since dma_resv (and a lot of other things,
like gup in general) nest within that it would be a substantially stronger
asssertion.

Specifically this should also go boom when you do it in places like
serving (hmm) page faults, which I think we want. Just locking
dma_resv_lock wont go boom like that (since taking the dma_resv_lock from
a page fault handler is explicitly allowed, it nests within mmap_lock).

Conceptually I think it's otherwise all fine and at the right spot.
-Daniel

> +	}
> +
>  	*fence =3D drm_syncobj_fence_get(syncobj);
>  	drm_syncobj_put(syncobj);
>  =

> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
