Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8B5AF562
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879C410E1A0;
	Tue,  6 Sep 2022 20:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05710E1A0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 20:06:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k9so17118366wri.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=QO0vmextOE7byXtCUGZRN9XcSr/2rfXe412VbGvJjJM=;
 b=J6lgYCOZEm6bBbC+vgNLT5h6sXbIl/zhC5KHbAbAaIbpQat4Uc94xEaKNP3M1Zl35P
 NU/ABrVCeRFXCA0/M5hfo6R7fg/3Y3SxpS1/mT3Bm2HQGjV8JmSbUeu7tgwk3/hNH38Q
 8jku8SAoH9mN8ulk+jY8cyMxOUiGywfmNE3Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QO0vmextOE7byXtCUGZRN9XcSr/2rfXe412VbGvJjJM=;
 b=JAAB069YsXDBE3JQnIudvfFPd1uC0bi5RUBWlvJqeCpOwv/YMZhdIDvbN1ggzK3MjF
 BJezVcMbaS+FMO3GSnZMQIEi8a1YDWiJ7n81KH2VjtHQz9yxhZaMsuyhSmdJoyMn8gQD
 15kam2LlX9Plw5FrYtZPTyzxXWfP3EfT/CjspCYXasD3X7waEspGOi3aQmjwTtGD2HYR
 /hPZtkVAUsJtOweS5ho1zS5hWJJ9NsztnGhob3JLjrHEeZHZQqDfOSU6NpGr+TdS0vPQ
 KFblDsv3+zKAiaIup9Cc5lskAvGKVwloE3VBXlbtkkDu8Ol2AB1mRVsSHVEc3XDHxEN9
 19Fw==
X-Gm-Message-State: ACgBeo3ye3gaCRbWoivn7zIvoD1scwqPeh3V5ugD7B05ous4uG0UtpVX
 p11nsR6osAMsPxTsRAAE7m2DMw==
X-Google-Smtp-Source: AA6agR6yg4CGNrCY5D2cKWurXhI1K66jKY3xXhCCZCA5RPRuvlIYkNbuxmMHwOFlGsbTsMBq12JbHg==
X-Received: by 2002:adf:ebc3:0:b0:228:61a0:e8b with SMTP id
 v3-20020adfebc3000000b0022861a00e8bmr74297wrn.676.1662494817423; 
 Tue, 06 Sep 2022 13:06:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b003a4c6e67f01sm26112639wmq.6.2022.09.06.13.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:06:56 -0700 (PDT)
Date: Tue, 6 Sep 2022 22:06:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 01/12] drm/udl: Restore display mode on resume
Message-ID: <YxeoX5dikxsUjzJS@phenom.ffwll.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816153655.27526-2-tiwai@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 05:36:44PM +0200, Takashi Iwai wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Restore the display mode whne resuming from suspend. Currently, the
> display remains dark.
> 
> On resume, the CRTC's mode does not change, but the 'active' flag
> changes to 'true'. Taking this into account when considering a mode
> switch restores the display mode.
> 
> The bug is reproducable by using Gnome with udl and observing the
> adapter's suspend/resume behavior.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This patch isn't great and incomplete, see

https://lore.kernel.org/dri-devel/YxegiQFAv+OWjjqE@phenom.ffwll.local/

You need cc: stable and fixes: 997d33c35618 and actually just remove the
entire check :-)
-Daniel

> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 169110d8fc2e..df987644fb5d 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
>   */
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_damage_helper.h>
> @@ -382,7 +383,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  
>  	udl_handle_damage(fb, &shadow_plane_state->data[0], 0, 0, fb->width, fb->height);
>  
> -	if (!crtc_state->mode_changed)
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state))
>  		return;
>  
>  	/* enable display */
> -- 
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
