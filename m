Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD733F0131
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 12:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352CD6E512;
	Wed, 18 Aug 2021 10:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831EE6E50B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:04:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g21so2272243edw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
 b=VuWlpnTGk6pLgRyLxLDnxv4NkP9nRhdxy0N90/5pUe8bPs6Uj9DlrqMj6WsvKlpXXI
 111QEnOZPfJS/mHK8sfTzq5rrN40iXdDm7HI7rmq/xmBL8FDwz+BFyPzr5yB3ovwv8zV
 0GGNgLYV0nqj01x2rcDXp61Hl2zl/sKi6V54I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
 b=Bf+kKadkFysoJtKWE7aDQ1sSN3J71ZmiCXeCRxGHW3gwhtkgIuaIrOKAgpaROsNUGi
 zSJVlhGS7DLZ3t+tTxkaijRzJ7eioj0Az99sSujGxaJQVsSJpuSpk8mbjG1MnF8GQDhB
 MABzXVaWMotcdUxdZBnAG7bvWaQ8jJPRKIoAtBMn0ivgk2eedRUu6qlOAz8fvfhwXrAl
 KyPHDnZsOz+csMAdB7Tli0Mzu8zLi8M/xVIBVVQprANg2dWQDVs/1Ktk/0RrSy9ws75M
 IF6RrZ7P8LLPyLPmMvrdeMF13vkcVslS+snEo1vjCKwwMlRqTu8bGRW6vwkXp6XrtYIk
 jG+A==
X-Gm-Message-State: AOAM531TY0gmj9cPVWfxOC3c7dUjj/nNS7+dRLCt7yIU0vbjUOSHEPKB
 HJIB+9lc+3m/OtekfqHkd03KdA==
X-Google-Smtp-Source: ABdhPJzQXPwY+sWxgn3k6s9LT4/gWaw0MMn3Os6faeWcHmmeyRNaM7zRWGLx0tEfvU1T3JleVgbcdA==
X-Received: by 2002:a05:6402:14d9:: with SMTP id
 f25mr9279034edx.343.1629281048926; 
 Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d16sm2384140edu.8.2021.08.18.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Date: Wed, 18 Aug 2021 12:04:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
 oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
 walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 3/9] drm: check for null master in
 drm_is_current_master_locked
Message-ID: <YRzbFnkricE65Hn5@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 03:38:18PM +0800, Desmond Cheong Zhi Xi wrote:
> There is a window after calling drm_master_release, and before a file
> is freed, where drm_file can have is_master set to true, but both the
> drm_file and drm_device have no master.
> 
> This could result in wrongly approving permissions in
> drm_is_current_master_locked. Add a check that fpriv->master is
> non-NULl to guard against this scenario.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

This should be impossible, drm_master_release is only called when the
struct file is released, which means all ioctls and anything else have
finished (they hold a temporary reference).

fpriv->master can change (if the drm_file becomes newly minted master and
wasnt one before through the setmaster ioctl), but it cannot become NULL
before it's completely gone from the system.
-Daniel


> ---
>  drivers/gpu/drm/drm_auth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 8c0e0dba1611..f9267b21556e 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
>  			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
>  
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +	return (fpriv->is_master && fpriv->master &&
> +		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
