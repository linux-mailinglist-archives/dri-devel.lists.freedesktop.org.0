Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0531C80F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856816E3EF;
	Tue, 16 Feb 2021 09:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6C66E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 09:29:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u14so12122760wri.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=EpB/Np1X9XOdtLzOw+R6Gr/oBQo0HGKnRY51GUTJaLU=;
 b=IkeI/n7xg2njxgWD4VskGpIt6Z5rmgOJCGVPP/19cJtSg/2ztKhL/4bo2XVnY1/KAB
 EEtU4yyItJDWK/Mhsn8NzKA+MRMfE27e2oooo/cdTetKQ98qJvaB8E/EaPs8whHK0i3J
 gQDmltQ36sYaI7galw/Kfy0wadv80bncdqsic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=EpB/Np1X9XOdtLzOw+R6Gr/oBQo0HGKnRY51GUTJaLU=;
 b=GJsgzud9PNWTiUP7VRbuaryitVcxzag75MhjpPrxn1FF/7+hO6VO54SPr08RiBajxF
 bBFS6aTAvtc2ZWVXkDvRarhGND9oYkhzs7E1abSVfyLherKn8NY+tXiB6t8qXRRsmxIM
 o9GYp9k8XnldfvcB+/zZfjqoT/tVAbkniPZoEh9+8lGUrT1Z9GI72e0CwkJ2rkSxPcUJ
 ZMO+1CFX9LPapr62HPk3oBgZ+DeqPC+cSJEKrXE2Qpa4WWopwsbWezHNNqmV7NiRDAI0
 nLyYBYTEDoggzyCAU8gGiaAAHHVpRmYX/BMzbk8B0AVcKspRlTVZjl9BX2ws/vCPWcDy
 DzwA==
X-Gm-Message-State: AOAM533GpyA4sSkrxutRgvL3uk4bJZObQKw9ggziT52mLqXtfubqhOIc
 TGBf1NjJ6vzAhG9eKYvZA9AKTXn4+ZixUcU+
X-Google-Smtp-Source: ABdhPJzWuLNr4nN/qqkIWPK72bvkvGqCaQE2HBT6FhW9qzRPuUcQmk4I368DVqwIPx2qsdN2wg3iVQ==
X-Received: by 2002:a5d:6a0b:: with SMTP id m11mr22719738wru.414.1613467742586; 
 Tue, 16 Feb 2021 01:29:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm25978776wrr.47.2021.02.16.01.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 01:29:02 -0800 (PST)
Date: Tue, 16 Feb 2021 10:29:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] mutex: nuke mutex_trylock_recursive
Message-ID: <YCuQXAllh91JEZ+Y@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210216082146.69286-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216082146.69286-1-christian.koenig@amd.com>
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, joe@perches.com, mingo@redhat.com,
 apw@canonical.com, will@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:21:46AM +0100, Christian K=F6nig wrote:
> The last user went away in the 5.11 cycle.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think would be good to still stuff this into 5.12 before someone
resurrects this zombie.
-Daniel


> ---
>  include/linux/mutex.h  | 25 -------------------------
>  kernel/locking/mutex.c | 10 ----------
>  scripts/checkpatch.pl  |  6 ------
>  3 files changed, 41 deletions(-)
> =

> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index dcd185cbfe79..0cd631a19727 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -199,29 +199,4 @@ extern void mutex_unlock(struct mutex *lock);
>  =

>  extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
>  =

> -/*
> - * These values are chosen such that FAIL and SUCCESS match the
> - * values of the regular mutex_trylock().
> - */
> -enum mutex_trylock_recursive_enum {
> -	MUTEX_TRYLOCK_FAILED    =3D 0,
> -	MUTEX_TRYLOCK_SUCCESS   =3D 1,
> -	MUTEX_TRYLOCK_RECURSIVE,
> -};
> -
> -/**
> - * mutex_trylock_recursive - trylock variant that allows recursive locki=
ng
> - * @lock: mutex to be locked
> - *
> - * This function should not be used, _ever_. It is purely for hysterical=
 GEM
> - * raisins, and once those are gone this will be removed.
> - *
> - * Returns:
> - *  - MUTEX_TRYLOCK_FAILED    - trylock failed,
> - *  - MUTEX_TRYLOCK_SUCCESS   - lock acquired,
> - *  - MUTEX_TRYLOCK_RECURSIVE - we already owned the lock.
> - */
> -extern /* __deprecated */ __must_check enum mutex_trylock_recursive_enum
> -mutex_trylock_recursive(struct mutex *lock);
> -
>  #endif /* __LINUX_MUTEX_H */
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 5352ce50a97e..adb935090768 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -86,16 +86,6 @@ bool mutex_is_locked(struct mutex *lock)
>  }
>  EXPORT_SYMBOL(mutex_is_locked);
>  =

> -__must_check enum mutex_trylock_recursive_enum
> -mutex_trylock_recursive(struct mutex *lock)
> -{
> -	if (unlikely(__mutex_owner(lock) =3D=3D current))
> -		return MUTEX_TRYLOCK_RECURSIVE;
> -
> -	return mutex_trylock(lock);
> -}
> -EXPORT_SYMBOL(mutex_trylock_recursive);
> -
>  static inline unsigned long __owner_flags(unsigned long owner)
>  {
>  	return owner & MUTEX_FLAGS;
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 92e888ed939f..15f7f4fa6b99 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7069,12 +7069,6 @@ sub process {
>  			}
>  		}
>  =

> -# check for mutex_trylock_recursive usage
> -		if ($line =3D~ /mutex_trylock_recursive/) {
> -			ERROR("LOCKING",
> -			      "recursive locking is bad, do not use this ever.\n" . $herecurr=
);
> -		}
> -
>  # check for lockdep_set_novalidate_class
>  		if ($line =3D~ /^.\s*lockdep_set_novalidate_class\s*\(/ ||
>  		    $line =3D~ /__lockdep_no_validate__\s*\)/ ) {
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
