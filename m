Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E6B6605FD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF14510E8A6;
	Fri,  6 Jan 2023 17:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E410E8A7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:53:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso4075836wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GHbXKYEfBQ8k18yvEj5GJ6Gqi0uOqe0xAgSwSiXa+Q=;
 b=V55nkZ92AGtNCvV8RPNuqTTAVXI89wklWiLVGrs7BnsXhJNUKRmB/CpzYOBOiw9Sd9
 KLhU75XHjuZ7O9TFWix/cgyGxlMVd7KmsTXJAUF+bCJE5BHlsf5Mw/w1fiJ21+GGGzCg
 w5L86CL42Wh++y9bn1PAXUcuA5V+YXkF54Hsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GHbXKYEfBQ8k18yvEj5GJ6Gqi0uOqe0xAgSwSiXa+Q=;
 b=tG5yDCZLgNqvs25sgwCXlTUVj9baZwbKUx3icpYNJJzK6knRh3l+USnrfEQVmWbllG
 SeC6/NOpDk7/BW5UjYt479ZyB19PPGG0IwFGmHaDr3ZvMjRXXAs84cyRuIcPcwAOfY97
 nGAvE78JgutA58WGfAXKYhhDyIBGEu3fmDTSeWXDqSBMm/bYN4tZ3emOan7oZYNizJ4S
 efSK+91fnDw6R9TjZEe3oaWHc9TLUlooRO3OtFF10BgtT9E67+NqR78bvJbMLVVA0YmU
 1obzW76kCYD4N7p9/pqjPtvhFJeA0GTqSZmYIp636x0vef22XrZX/wWIp0qFUJ6zJ8dw
 4HJQ==
X-Gm-Message-State: AFqh2kr4WBPo+JWTAgW/UDoH7X0nTSQGxAupRwdR2HapqUnuYrDIZeQi
 69kzZs8MYyl45+AS692ptks25g==
X-Google-Smtp-Source: AMrXdXsZklbcpQLvNKmHYjVJ8RsVqFufvmJpMcBdaZKRVy/wyCjXEAOFtZhLM8QwwpSTJpw0I4VMaw==
X-Received: by 2002:a05:600c:3b02:b0:3c7:18:b339 with SMTP id
 m2-20020a05600c3b0200b003c70018b339mr48171334wms.37.1673027632819; 
 Fri, 06 Jan 2023 09:53:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm7823216wmq.20.2023.01.06.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:53:51 -0800 (PST)
Date: Fri, 6 Jan 2023 18:53:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y7hgLUXOrD7QwKs1@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 05:40:17PM -0800, Brian Norris wrote:
> The self-refresh helper framework overloads "disable" to sometimes mean
> "go into self-refresh mode," and this mode activates automatically
> (e.g., after some period of unchanging display output). In such cases,
> the display pipe is still considered "on", and user-space is not aware
> that we went into self-refresh mode. Thus, users may expect that
> vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
> properly.
> 
> However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
> vblank enabled here.
> 
> Add a new exception, such that we allow CRTCs to be "disabled" (with
> self-refresh active) with vblank interrupts still enabled.
> 
> Cc: <stable@vger.kernel.org> # dependency for subsequent patch
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d579fd8f7cb8..7b5eddadebd5 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1207,6 +1207,12 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  
>  		if (!drm_dev_has_vblank(dev))
>  			continue;
> +		/*
> +		 * Self-refresh is not a true "disable"; let vblank remain
> +		 * enabled.
> +		 */
> +		if (new_crtc_state->self_refresh_active)
> +			continue;

This very fishy, because we check in crtc_needs_disable whether this
output should stay on due to self-refresh. Which means you should never
end up in here.

And yes vblank better work in self refresh :-) If it doesn't, then you
need to fake it with a timer, that's at least what i915 has done for
transparent self-refresh.

We might need a few more helpers. Also, probably more igt, or is this
something igt testing has uncovered? If so, please cite the igt testcase
which hits this.
-Daniel

>  
>  		ret = drm_crtc_vblank_get(crtc);
>  		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
