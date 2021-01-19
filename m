Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903132FB665
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 14:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC2F6E30D;
	Tue, 19 Jan 2021 13:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4874C6E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 13:36:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c127so1284536wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BKE9rDCIZOyErbmD+LY8/lgohFsufzeQzYye47k5eNU=;
 b=egv6CMm37ZE+aKLxMF65Ny/Cl+fogEW2LevhAiKiW/O889Pk6EHklNv2bNIYmFVsIB
 Ne/OSh7TUc/Lyk+6ebECYQxfFVVAsBsej2T/Mwa6/nCntzuaSw/ESTi+dqxzx+kxoFes
 moh5mGe1CceubqiTlWtQSFUO4b1ZWz0th5PfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BKE9rDCIZOyErbmD+LY8/lgohFsufzeQzYye47k5eNU=;
 b=Kxj2CuQMuIjFusSr1Y1DuDd9wAL/Ib48FB8C2SF02wleUnRA4PzBy1+Prr1WRhgxzp
 VUE+9zJwhPb9b3zyf19Z5a1oDnKNZbyf8YvqeMZR150hlaoeS6Zu3AW+yj5QrE8+9idI
 b80UZaeEh0jN+mHwdqtdxnC8IUI0hdYS6hOIwsy/p6mj4dgknHuVxeijk4UA9V9kTmr2
 EYPccpL4eqZgQus+4bBRNAYzHi/qa0AtyEIzPDbmgJrI7rHQ1N+VrjjIEdfykZKTWOR6
 5jcpJCYw5YTV/Q7yyQwVnoMblWf3qwftn0ARV9M/vAueXEB5+kag1HiNdKUEWU4N5+X1
 bgeQ==
X-Gm-Message-State: AOAM533DWyN6lQEqOWnCTGkLLNXyx1/Xp2TGrmUS6Pm20xjITAShdKvY
 EtIeKGCWsosc/f0O4kd6EHnlEQ==
X-Google-Smtp-Source: ABdhPJyxDhcjnIHo3Tv3lCkHjxbnmQ7vqX17dXcXNooyWX343UJoOqqngbbVLYY4daSVAO/uCH3Ayw==
X-Received: by 2002:a1c:7c06:: with SMTP id x6mr4124710wmc.67.1611063368009;
 Tue, 19 Jan 2021 05:36:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m12sm4581831wmc.10.2021.01.19.05.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:36:07 -0800 (PST)
Date: Tue, 19 Jan 2021 14:36:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pan Bian <bianpan2016@163.com>
Subject: Re: [PATCH 1/1] drm/atomic: put state on error path
Message-ID: <YAbgRbyeN2QUWKJr@phenom.ffwll.local>
Mail-Followup-To: Pan Bian <bianpan2016@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210119121127.84127-1-bianpan2016@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119121127.84127-1-bianpan2016@163.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 04:11:27AM -0800, Pan Bian wrote:
> Put the state before returning error code.
> 
> Fixes: 44596b8c4750 ("drm/atomic: Unify conflicting encoder handling.")
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>

Nice catch, patch merged to drm-misc-fixes with cc: stable.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ba1507036f26..4a8cbec832bc 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3021,7 +3021,7 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
>  
>  	ret = handle_conflicting_encoders(state, true);
>  	if (ret)
> -		return ret;
> +		goto fail;
>  
>  	ret = drm_atomic_commit(state);
>  
> -- 
> 2.17.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
