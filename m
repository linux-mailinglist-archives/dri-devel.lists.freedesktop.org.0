Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6642B6B8E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6E389DFC;
	Tue, 17 Nov 2020 17:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB4089DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:19:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so3933797wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kAbO3g5tGJBUTQ1jiivXNeuf/oV2yXFAP1AZBhjiCbM=;
 b=cFWQfikLCnmhUqxHVW7l91cpJVvU/5hB2+y5rd7BxAKkUGpELp6KvbiqRPwDGdNNEN
 CzY/g7XmIg2iyC/xgI+manH6mjM0LKW3Yope7bStKvKGXiId+ZHl2cIuU9s5SZN+Lqf3
 S3GI90l2MoCWcmmE446wA6Es0GqCSEhXJgU6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kAbO3g5tGJBUTQ1jiivXNeuf/oV2yXFAP1AZBhjiCbM=;
 b=ckr4pUH1s73fcQbogczvEiD2VZOUGOu8LAZ9tNAQdjReemoPXlZ755Ej1RUWb94Z1Y
 8t/bJFoDoUQZZFiD37GZ+E+Pl/Anw3a+CvUPyquudWm/GokVG0etL13PkbG8MeqW2O2U
 ktC4iCZk8LCoewpQaPK+jVOlfirVvWrBcvhUdkF/IqyuysFAhzEjolRWSfd7B5R1TlEZ
 zC5rRFb33Xs6S6yKqRwlBzUDxxAjz2gftqRSHOI14uTXdAkKPFCQlUPxHTZxeJY10nwY
 zhN6yyIqrcWIpmjdRy/y+FZaqlTQ/u9U+Tpnz2IyOSSO4m2mnRq1bVqWec/D64n/0pkx
 8v6Q==
X-Gm-Message-State: AOAM530kZnPQL7QvaOd+SPW8OmxZ02KYkiTKpbaoEECXjOBQzg22hbuZ
 h6g0vh+Vw6t4nMOKeUuMuWhNFQ==
X-Google-Smtp-Source: ABdhPJwDvJEYI0znPzin6FCQkedZLOUwXhlNIj3Ee0eqR759hCui5Hw1xvA2ZobyxJr6IVU+KK/Wfw==
X-Received: by 2002:a05:600c:2c4c:: with SMTP id
 r12mr75475wmg.157.1605633543316; 
 Tue, 17 Nov 2020 09:19:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d8sm4378586wmb.11.2020.11.17.09.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:19:02 -0800 (PST)
Date: Tue, 17 Nov 2020 18:19:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: make up to 90% of system memory available
Message-ID: <20201117171900.GM401619@phenom.ffwll.local>
References: <20201117140615.255887-1-christian.koenig@amd.com>
 <20201117140615.255887-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140615.255887-3-christian.koenig@amd.com>
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, sroland@vmware.com,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 03:06:15PM +0100, Christian K=F6nig wrote:
> Increase the ammount of system memory drivers can use to about 90% of
> the total available.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a958135cb3fe..0a93df93dba4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1267,7 +1267,7 @@ static int ttm_bo_global_init(void)
>  	 * the available system memory.
>  	 */
>  	num_pages =3D (u64)si.totalram * si.mem_unit;
> -	num_pages =3D (num_pages * 50 / 100) >> PAGE_SHIFT;
> +	num_pages =3D (num_pages * 90 / 100) >> PAGE_SHIFT;

I don't think this is the design we want. As long as it was set at "half
of system memory" it was clear that a) it's a hack b) precision didn't
matter.

But if you go to the limit and still want to keep the "we make sure
there's no OOM", then precision starts to matter:
- memory hotplug and hotunplug is a thing
- userspace can mlock, and it's configureable
- drivers can pin_user_pages for IO and random other stuff. Some of it is
  accounted as some subsystem specific mlock (like rdma does iirc), some
  is just yolo or short term enough (like)
- none of what we do here takes into considerations any interactions with
  core mm tracking (like cgroups or numa or anything like that)

If we want to drop the "half of system ram" limit (and yes that makes
sense) I think the right design is:

- we give up on the "no OOM" guarantee.

- This means if you want real isolation of tasks, we need cgroups, and we
  need to integrate ttm cgroups with system memory cgroups somehow. Unlike
  randomly picked hardcoded limits this should work a lot more reliably
  and be a lot more useful in practical use in the field.

- This also means that drivers start to fail in interesting ways. I think
  locking headaches are covered with all the lockdep annotations I've
  pushed, plus some of the things I still have in-flight (I have a
  might_alloc() annotations somewhere). That leaves validation of error
  paths for when allocations fail. Ime a very effective way we used in
  i915 is (ab)using EINTR restarting, which per drmIoctl uapi spec is
  requried. We could put a debug mode into ttm_tt which randomly fails
  with -EINTR to make sure it's all working correctly (plus anything else
  that allocates memory), and unlike real out-of-memory injection piglit
  and any other cts will complete without failure. Which gives us an
  excellent metric for "does it work". Actualy OOM, even injected one,
  tends to make stuff blow up in a way that's very hard to track and make
  sure you've got good coverage, since all your usual tests die pretty
  quickly.

- ttm_tt needs to play fair with every other system memory user. We need
  to register a shrinker for each ttm_tt (so usually one per device I
  guess), which walks the lru (in shrink_count) and uses dma_resv_trylock
  for actual shrinking. We probably want to move it to SYSTEM first for
  that shrinker to pick up, so that there's some global fairness across
  all ttm_tt.

- for GFP_DMA32 that means zone aware shrinkers. We've never used those,
  because thus far i915 didn't have any big need for low memory, so we
  haven't used this in practice. But it's supposed to be a thing.

It's a bit more code than the oneliner above, but I also think it's a lot
more solid. Plus it would resolve the last big issue where i915 gem is
fairly fundamentally different compared to ttm. For that question I think
once Maarten's locking rework for i915 has landed and all the other ttm
rework from you and Dave is in, we've resolved them all.


>  	/* But for DMA32 we limit ourself to only use 2GiB maximum. */
>  	num_dma32_pages =3D (u64)(si.totalram - si.totalhigh) * si.mem_unit;
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
