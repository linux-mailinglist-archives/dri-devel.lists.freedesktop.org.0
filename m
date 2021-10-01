Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B841F5F3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 21:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209806E54C;
	Fri,  1 Oct 2021 19:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6F26F3AD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 19:56:52 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id m26so10110283qtn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=p/SxJUcNym+yBrhUDQeZfHj2BoORrf39gDk0QlHHVIY=;
 b=S6OtJWXqysXiGnrZA+nmOy1sN3JZerOMISuTAQY+fuca9Fzt4GojpBT101Sc7tnwFu
 604HBOn1qwcUqkjG1mYhCeth8vBI7yweHThqSYHRXS3az4ip3jeC4W28hQtWYq5h24d3
 0Ki2l4zfDW7y1KoEus/tZaN16Z8QhWtqYGtVHYx78oavL9b+u4QplWkWNCz1BGAAWmw3
 XLm0IdPserS8hU8Nv2ixslYS2qvyvumNXMdT+P9oEb2y4Sv1whi4+xj1TtJvVPZ/uNeq
 GoWotKN5RtkJtiBQaKL9ddqAM1YEMmSGbd0+ThRnKSE/61Lf74FXVgwBYzVech52wFed
 dvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p/SxJUcNym+yBrhUDQeZfHj2BoORrf39gDk0QlHHVIY=;
 b=A1yrgBX4hB1Ohc/HH4nwZayLg89a47TQMk6fKN3pGoD9SaSi8gMjdbdYyJjMILiDMP
 M9ps9sTLCLbk+jM6G3ZkPmrfSIVgvIcN4GjYIhjeou0VQKbdHQ7ZoKR2ZR5p+FQzLiBY
 4isa22drtlHuuqUOy15X2mqLhU8MaCanGzeMt3b1aRVBtDnFq1JphVU6fSSip0WOodY7
 emgkI3v97QbWXbPVcu0jFmL/bvlC5z1rrV1zNZpSnsVKp8RRNe2DmsOEKrKkyYTD9Tmr
 P3UEM8ae55V1hv2r5XlbJ7FTEmynqFmoEnZbEJqVwcLPIGNAegbiTBvrwZ5uBDCHSbUH
 gJsg==
X-Gm-Message-State: AOAM530GIeElHhSN3o6gUz4cFukhloiL28HSYqR7uospcQ3WyYL3thXP
 KP2wX3Ebvm4ohfibrhZhoxMgDg==
X-Google-Smtp-Source: ABdhPJxrVccyTYRwdk6z2yk7egQNKJbDPNZpw3JQMtglBuU4wtwZ0NSNIag9g5DzPsr6KhUfUZT0dw==
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr14878148qty.185.1633118211758; 
 Fri, 01 Oct 2021 12:56:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v8sm4581090qta.21.2021.10.01.12.56.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 12:56:51 -0700 (PDT)
Date: Fri, 1 Oct 2021 15:56:50 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, Rodrigo.Siqueira@amd.com,
 anson.jacob@amd.com, Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes
 using DRM Core check
Message-ID: <20211001195650.GX2515@art_vandelay>
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20210929194012.3433306-2-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929194012.3433306-2-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Sep 29, 2021 at 03:39:26PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> drm_atomic_helper_check_crtc now verifies both legacy and non-legacy LUT
> sizes. There is no need to check it within amdgpu_dm_atomic_check.
> 
> [How]
> Remove the local call to verify LUT sizes and use DRM Core function
> instead.
> 
> Tested on ChromeOS Zork.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 07adac1a8c42b..96a1d006b777e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10683,6 +10683,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  		}
>  	}
>  #endif
> +	ret = drm_atomic_helper_check_crtc(state);
> +	if (ret)
> +		return ret;
> +
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>  
> @@ -10692,10 +10696,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  			dm_old_crtc_state->dsc_force_changed == false)
>  			continue;
>  
> -		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);

From a quick glance, I think you can now delete this function. It's called from
amdgpu_dm_update_crtc_color_mgmt() which is part of the commit, so the lut sizes
should have already been checked.

If the call from amdgpu_dm_update_crtc_color_mgmt() is not possible to remove,
you could replace it with a call to the new helper function. And if _that_ is
not possible, please make amdgpu_dm_verify_lut_sizes() static :-)

Sean

> -		if (ret)
> -			goto fail;
> -
>  		if (!new_crtc_state->enable)
>  			continue;
>  
> -- 
> 2.33.0.685.g46640cef36-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
