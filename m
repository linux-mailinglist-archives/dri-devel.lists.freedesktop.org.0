Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D43F069D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B6E6E7D5;
	Wed, 18 Aug 2021 14:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB786E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:24:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u1so1787800wmm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B4O54JuoV0Er2c1W0L0G6IcfKDZygChDFOCTGNOVUBw=;
 b=B+TaWnSYnl8UZKCoGwO095gz0fW1XJZJ5Er0FPo3FVvtsj6ni7T3Vp3ZYL/XzXEgtF
 Zw4UiE+t3PVwbxqicgNoQZmKs9k5sWGrh6PQsfPf9dlfSDu6j5F6ziz0vm9d6HFTmt9l
 r+Y/0QcoIjLXXbH/uB7jPI6FGsRt1FJM7wn6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B4O54JuoV0Er2c1W0L0G6IcfKDZygChDFOCTGNOVUBw=;
 b=jknJK1gT2wX6oM20ZfEBGDojpckPobl+Vmmt4WvnIeP86s7EZFa8I3Dyj7e2jbEWnE
 brbDfZPP1R6jp7anbWbbXQXNJ5mZe0y0qbNfYUEn9fEocS46OVARylQbtlCpe+6Clz60
 Dicl+PMNzp3SAvG0PNcW5jUHmFjvGMUr82SvUm41LaJxXt7etI7dK8+YimFCIXH5daAo
 PbNO+94Ly3X8CMUKHV0PrILkdFKB4wT3080tIn/c2xHH39ZDtJILO8w3JQykG5jcnDFx
 APLKSLBcddrr2CEYNFMxa44nPgTMVdRlIrrIhwbjAtDC/6IOG9sB/V6EQmV8eupQl/Bi
 a3KA==
X-Gm-Message-State: AOAM532KfPYTUePxyHAmWiHFJwZ9Ir7378ORRjxjfvJymzIAE9oyTSL9
 GxR/GFeBsTQtP35zZHYdru7Z4w==
X-Google-Smtp-Source: ABdhPJz2WBRGcHMjvb0VwJASUE1CmFUAMja14YsCgJ8ky1Q49b2/dKalSrMDd53TCNo8xpxK5gOUTw==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr6478733wmi.133.1629296693978; 
 Wed, 18 Aug 2021 07:24:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m21sm17302wms.3.2021.08.18.07.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:24:53 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:24:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Move and improve error
 message for missed CTB reply
Message-ID: <YR0YMwmNHfzXT9XP@phenom.ffwll.local>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-5-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701155513.2024-5-michal.wajdeczko@intel.com>
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

On Thu, Jul 01, 2021 at 05:55:13PM +0200, Michal Wajdeczko wrote:
> If we timeout waiting for a CT reply we print very simple error
> message. Improve that and by moving error reporting to the caller
> we can use CT_ERROR instead of DRM_ERROR and report just fence
> as error code will be reported later anyway.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Look reasonable.

Btw for within the driver we generally never document static inline
functions with full kerneldoc. That's overkill and they get stale real
fast. What would be useful to document is the interface with the driver at
large (i.e. non-static functions), especially for something that's used
all over like CTB will be. But then we're back to responsibilities and
especialy aroung gpu reset, so not sure whether documenting the current
code before that's sorted is the best idea.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 8110586ce1fd..f488a51e1ebe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -490,9 +490,6 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  		err = wait_for(done, 10);
>  #undef done
>  
> -	if (unlikely(err))
> -		DRM_ERROR("CT: fence %u err %d\n", req->fence, err);
> -
>  	*status = req->status;
>  	return err;
>  }
> @@ -536,8 +533,11 @@ static int ct_send(struct intel_guc_ct *ct,
>  	intel_guc_notify(ct_to_guc(ct));
>  
>  	err = wait_for_ct_request_update(&request, status);
> -	if (unlikely(err))
> +	if (unlikely(err)) {
> +		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
> +			 action[0], request.fence);
>  		goto unlink;
> +	}
>  
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>  		err = -EIO;
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
