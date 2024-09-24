Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4159842C9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F7210E69F;
	Tue, 24 Sep 2024 09:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BSqBxxep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946110E69F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:58:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c5cf26b95aso719783a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727171929; x=1727776729; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuBTHx/9cOhiI07dj9MDxTsrK6YcRc3R8bANsyntmZU=;
 b=BSqBxxepizONr2oaRwxlJzywWCFtEwSG2s+A+wB9nK+owjZrwl2olHXnve/MSOtUFV
 20w5NgPO2lUqHwRWJH8nQjhJakX+6E/2BZjf4xS4KEYNUB92d2hkchW4XgSO1fXrP1Dd
 3rdHH7a29zdy1PA7d0wgJ3Ebemmb3ydbBGwd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727171929; x=1727776729;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NuBTHx/9cOhiI07dj9MDxTsrK6YcRc3R8bANsyntmZU=;
 b=PeJ2ShF8Nf8RCmx/ImLOwVhSSBiieL16woqa8bb0aSW6y8u0WQQUv9qfFIBKYDgHeS
 e2MFiV/RNTJlqCAjEtxIbmS6bREp4IPQeKZOF6FefJx3OWw8txUACJnhwCfv5TM+82fc
 LrEcxVHwCPAcwJQYkvOZEF1HmDGD7UrLHac7qzmSgPjPNkh3MZ3R/a8FlhkxXlMgWnuB
 Saaq+4bqmRfMic+uhynF52RNM/74rjNfAfLmhk+eT4aLcEPARE2cb/LM4blSiVVR7rWm
 iYpCmj8lnSgEwmFNmLJcQK2GI861XNnkNWiBJrnfMUH+Ip2w/pyBJPhb0kVqjpXh84J8
 JS3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl6ofBHk9nbT0O7Ex/1p0kFb09UtaVfaD7brrYY2VWZ8K55MPex7mb/rvz63wRByWkxyTWKtDzI1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxril09Q3sQhi96M8onUQoIADvnnKu4adnVX4ITsCK7gugjv7pf
 7VLIQW+Pe6FCVw9a7+Dzo9E0CZKXmGDBC1VdyvZWWbWFLKYx/KRlVLoEwCJ5LrA=
X-Google-Smtp-Source: AGHT+IFM64nYYVrUwnbpbJ2SOxxynSNBbuHUUVEvl48F1dF3eRESGEumW9pE32wjRYZgIjjhpvjLHg==
X-Received: by 2002:a05:6402:2788:b0:5c5:cb49:30cd with SMTP id
 4fb4d7f45d1cf-5c5cb493109mr2902878a12.9.1727171928949; 
 Tue, 24 Sep 2024 02:58:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c437sm587972a12.5.2024.09.24.02.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:58:48 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:58:46 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: mripard@kernel.org, dave.stevenson@raspberrypi.com,
 kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: Fix atomicity violation in vc4_crtc_send_vblank()
Message-ID: <ZvKNVut_V9fiiaaT@phenom.ffwll.local>
Mail-Followup-To: Qiu-ji Chen <chenqiuji666@gmail.com>, mripard@kernel.org,
 dave.stevenson@raspberrypi.com, kernel-list@raspberrypi.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 stable@vger.kernel.org
References: <20240913091053.14220-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913091053.14220-1-chenqiuji666@gmail.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Fri, Sep 13, 2024 at 05:10:53PM +0800, Qiu-ji Chen wrote:
> Atomicity violation occurs when the vc4_crtc_send_vblank function is
> executed simultaneously with modifications to crtc->state or
> crtc->state->event. Consider a scenario where both crtc->state and
> crtc->state->event are non-null. They can pass the validity check, but at
> the same time, crtc->state or crtc->state->event could be set to null. In
> this case, the validity check in vc4_crtc_send_vblank might act on the old
> crtc->state and crtc->state->event (before locking), allowing invalid
> values to pass the validity check, leading to null pointer dereference.
> 
> To address this issue, it is recommended to include the validity check of
> crtc->state and crtc->state->event within the locking section of the
> function. This modification ensures that the values of crtc->state->event
> and crtc->state do not change during the validation process, maintaining
> their valid conditions.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations.
> 
> Fixes: 68e4a69aec4d ("drm/vc4: crtc: Create vblank reporting function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 8b5a7e5eb146..98885f519827 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -575,10 +575,12 @@ void vc4_crtc_send_vblank(struct drm_crtc *crtc)
>  	struct drm_device *dev = crtc->dev;
>  	unsigned long flags;
>  
> -	if (!crtc->state || !crtc->state->event)
> +	spin_lock_irqsave(&dev->event_lock, flags);

crtc->state isn't protected by this spinlock, which also points at the
more fundamental bug here: We need to pass the crtc_state from the caller,
because those have it (or well, can look it up with
drm_atomic_get_new_crtc_state). Then we also do not need a spinlock to
protect access to state->event, because in both callers we are the owners
of this struct field.
-Sima

> +	if (!crtc->state || !crtc->state->event) {
> +		spin_unlock_irqrestore(&dev->event_lock, flags);
>  		return;
> +	}
>  
> -	spin_lock_irqsave(&dev->event_lock, flags);
>  	drm_crtc_send_vblank_event(crtc, crtc->state->event);
>  	crtc->state->event = NULL;
>  	spin_unlock_irqrestore(&dev->event_lock, flags);
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
