Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E6CA34A36
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF76210EB30;
	Thu, 13 Feb 2025 16:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mlU8JOQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FBA10EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:40:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30797730cbdso12129401fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464840; x=1740069640; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LMnzVOaqbPiWJZc1ATkgCkD1AufYLWgWH5h8h9uqtDQ=;
 b=mlU8JOQptB0BQV1LwFd+9B0MDd5Gy6HXXOOIKSYqoMVCTVJCIjRcxRgpoYPBKd2H5N
 /ZMtEXcNeASVNTLH9b65mjw3wExKWd3nwUqB791rFu32fMehVzyRatTjF5rlMHXwYgxh
 1q7hstI5A+FVa7ZVjl6ezLDiA+XOUV7vG+JcCFHW87+mCYV+3C9XKjVKkTvZn1UBy3YG
 5nLbh9EDM//ZV8/muUSy+yqFgBV4q+6uMm/i6HAD5HoZXby1ZK5F4k+y8sTBTOcfb4eD
 fbJ7bbM32avg+U23RuISPII9j0iXRQH/DRT7uHB3f3QpfhtK1XszjS72NemJM3YwqZ13
 vIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464840; x=1740069640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMnzVOaqbPiWJZc1ATkgCkD1AufYLWgWH5h8h9uqtDQ=;
 b=nlP5v/t/rb6glmx0eDGEH/aBp1nRzo3oMoaB57I1zJLo3QNUQ6q4Ik/xb+/upHHJZN
 c/56duCYs+ByzEZLVtou2ABRJzqPH04FbAIbmTYnWC89FSH2FpdntK5McRwEd6xteGHn
 iFz4yW5Ri1dHlw2zoW2jqYHIU3jLCrTBTU67q+6MaccQ1/ZttJaxy+jsupHFBZQttfR6
 UdZd12KheIYBIc3UwkF8ggVXc1s/n4Aw9a8yt3Kxi5+//L79vmvtQbN48kEbaZvImn3A
 SSoO/Gj+JDJBFyxzPCofRMGe3U20Wd2fTPRFHfMbrBdFX1mi2NKZaeaiERBVWfh4RHUp
 TB8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhZOZXlRN42QSZpZLLtgWGHX/k4VaQpbnO+LYuIJHWjvgGVCouyUPllq45aEgbLI6F5UiMwKKXcCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeUUwhj9RyE6CcaFCabpJYHR5Jy5BMb2KAxFF/hanOOXnyega+
 xRNDyAArgW5x5llGYy2Lcni/SLMSZCu+MOpk96fntqo79esnODLgnpt1NwLTEBE=
X-Gm-Gg: ASbGncvfZvcm37ulFLo/unepwZ2re9p0iOZ8CAv6fmaR+A4xUYJBZOPLLKPktdVLqWd
 k/Tg844+IhhmV22czYklbwlTJ2m315GXy1OtkAFmmsFo4+DtbhPsvvhW3zB/PfJqm8Cujtc7eLS
 W+WNn+4fxBBtRDWvrSV4xIphM3rzHYqdDzTS4lVwAYBLX0cuBxuwZX92EGvzOdGmW9thLU8GrCS
 l24LeS+jOPZ+xBsy+wVdk3lnitmIGj/Ne8C5dPAtP4/va6cZ6LgIUzCNQJCqgogowRWKUHM85Jl
 91Hd4hYuRhItqBSzvA4MWudjC5yzQgoi8nypq4W7v4HXu/U9YRby/dXXkyZUA3BYSW/fajM=
X-Google-Smtp-Source: AGHT+IE+DLZp2bM7y7i3VvWDlRtn34R3/3QTYkYHVUJ0a3IROZ4IO4tvISTZRCot/igQUEAuu0KXWw==
X-Received: by 2002:a2e:be86:0:b0:306:124c:69d5 with SMTP id
 38308e7fff4ca-309037615d5mr30076241fa.34.1739464839693; 
 Thu, 13 Feb 2025 08:40:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3090ffc695dsm2463621fa.0.2025.02.13.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:40:38 -0800 (PST)
Date: Thu, 13 Feb 2025 18:40:36 +0200
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
Subject: Re: [PATCH v3 22/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_hw_done()
Message-ID: <2dmba5jptkg5epllhukxzt2teuf2pbt2w5cw44jh7vbma7q2os@hfcg6zjm7tuv>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-22-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-22-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:41PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_hw_done() signals hardware completion of a
> given commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
