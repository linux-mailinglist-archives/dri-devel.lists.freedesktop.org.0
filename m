Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C19A34A3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A071810EB33;
	Thu, 13 Feb 2025 16:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H8tofQg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3474B10EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:41:13 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3061513d353so12033121fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464871; x=1740069671; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3XgRxj9qVKDzrBjb5+1yaq8snXvKlW2QBQrFF0S3vrs=;
 b=H8tofQg9c2brdTd1aFEzvMSJjXLRi3MP5gESLeddVwlLxN5kmLr0adfc21w6WmG1i8
 UvwfKTmb/+oBZrixupS3gx2oesrR3nqQHlnW8A8+H8o+bWZsIAn6h/qgIapjLK2BUpg5
 MAlRCXXF/WTKgnvd3iDdk7O/lD+gw/7mRQ1dHS46/mIvUJ1skF9B7iONdcMMrQjaxXlQ
 I4vvd80YLelbm93kJK4EZwSlWZdR5mnXrVI+NgIuRq9lTyUMALuT+/l8PIHcUbWnWLYV
 TrSNncR51J4aCdNeyq9X9SD+xDUztFsY7a2ElhStzw/RSrQnMa+0t5bbyiV37ka3Q5s0
 wqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464871; x=1740069671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XgRxj9qVKDzrBjb5+1yaq8snXvKlW2QBQrFF0S3vrs=;
 b=c0MsWSppfpo1DqpkoCypiHTgDWI8REdn/1oez2W0LjzBeDCc2nQm0OU7EaVlOvsf6u
 Wkhz5pQhJWtUiuTJCcIEF+P5UGD//GyYIzqR5lqVp/OmkYCL4u3+xXFxeJn0UTuZPb8/
 6eM4yoxvdkNuY7eCUUXh9jbHwqJfYLlPbi48ePC5D9PAJNKspMn4SHJxwHH2F78Qu2SU
 24KhYG93WMdqvFX5cuZ39VjQclm7g8Cn3cVvxPmm0Mv4Wapty9OrWwlCMXfvon+rJVli
 HCvYbfQsdUtD9jo2zZPb734px7APGuBmGcxxmyQ20PJxaJjDUHHL58qqyXfikC0+RbBm
 Hf4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBCByWVX3Oa64Y6e7hoQEXHOvZtUwfg3iWcZ9FeLLriAeaqFI5sCwnYZudy6K7QX4YXCy6PH8D+MU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU05y8k9+3kAifuJS/PP/ohm6Y74sYJyPUI9DJBtvGmLZI2ODO
 bDJ1Xrakp5RW7PdR9uWZLmjM7q0TaKP96P/091L6Fh8KzVKL7TnH/Crc0yPYjo8=
X-Gm-Gg: ASbGnctya6U4MJtOh+1Bg1NkE1BNWcUSM8dGT4MnAHFbmX7wStjbEHqRBwQEOSkXTPZ
 GQcHntC6O2vWOdwIb8IO6qv+3jl0CpJATnlT/K5/wgMyDIEd8Z2eJs6uMO/9GsZ16skeUT39rke
 kS7B+SiuykwWtfptIA1QdDgLzCaBnU1hII4HrxXNShYQkUMPE/Eoy48gDWQTH8kSPBF57YCbWrR
 7aHErGKoj4K5DTS/XqFhfbiudK2IJvxLG9en5zd+u8pJnT3+j9mFQA/1qQkLSKxeUIpD19fwkM8
 ZO+o6gfTVRE+ftzRLJ9GBmu3oKe9E3Vzkj8x5GXnDntAtDYUOP6hNlS7RvlYoaaFdBGWTes=
X-Google-Smtp-Source: AGHT+IEFKcWZd8azl8/EBFVoIp/CitzTV0bjXABcH3VDl5luhrQKR0QHCreRzY8bYvxXYajgaW0KbQ==
X-Received: by 2002:a2e:ab1b:0:b0:307:e185:342d with SMTP id
 38308e7fff4ca-309038e58d9mr30083431fa.22.1739464871508; 
 Thu, 13 Feb 2025 08:41:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30910276839sm2455201fa.87.2025.02.13.08.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:41:11 -0800 (PST)
Date: Thu, 13 Feb 2025 18:41:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 25/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_cleanup_done()
Message-ID: <wd3ubsg5tkox6pr3vsajfsnuxfzueiq3rwfyoau6355ghswofi@g2cgmtwkq6kz>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-25-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-25-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:44PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_wait_for_dependencies() is the final part of a commit
> and signals it completion. It takes the drm_atomic_state being committed
> as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
