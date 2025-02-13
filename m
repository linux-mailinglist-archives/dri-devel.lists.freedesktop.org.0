Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52DA34A3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDAD10EB39;
	Thu, 13 Feb 2025 16:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lwuvx40s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E4410EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:41:03 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54505c79649so927974e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464862; x=1740069662; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LIicl5cuKah00FtYW7+QDG+JbgsmQFASXThZ8eUvZ/4=;
 b=lwuvx40snVk5GA8dwqjOiM6HZGftOxhK9K2HY2AgmzYgYzaY1heWPAqu0hpJaNe84J
 Z8ARip95UcDDa4KRabc91Y7xf2qxSdtJuNkaVMa/uYffALHI9AuOnfUO3wynozGYBZsT
 lkEAaKKB3b47RdnvCJgKo2vGHXhKw1tSZ84n8WThp2I21Ug2A/58dxrIkUjWpyEB1woV
 C1VrwSrG6oXKRtfj6+AVsd7t1Gdbc2CzfQTdl/tm+HhtEOF2W4aYDxzwnvRo9N9Df6f6
 oG+UChSwWWTMih6bz/cZslv5mU1qwsY8W7tgJT4z89A41Xq9AKa8Pr2rCiKjravUuAS9
 +qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464862; x=1740069662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIicl5cuKah00FtYW7+QDG+JbgsmQFASXThZ8eUvZ/4=;
 b=K4BhDK18T+PMmuy8kC8B7jNY98AtnEJ7e52h+mEru7Mj+7wouqR6qdcBoz03zRyJH2
 Qhu5u2x3pVyQRcVBGPq7AveBjg3WYw4bjHNWcnuNlQwijXEdvm9pcHqqHQ2DpBLxInQK
 +bKVEwP1qoURBqp2ABV/toeH6kfvlsb2/RUIQuEYJau5+FLQu6mIXVj1MCTvIgHhIT2A
 AmgOrD8yJwBr0JM9Z9/PzF6TvJ3l5E7G0qwOfHbqHTd0ZWL4H8lvuTktlfFzXs8ZOoBq
 ZK4RQbROWYGsECrjeYdONwjYf7BVnoUlWTY5cJK1nwRvci2M87m99aOzvuij9XEjv6oh
 6i1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ze6pjMtZ7IarW8P8MrPyWjnw8hNLWBk9dOJbR3ro+TQ8UoM+e+JkWBZc7kfDoNjIJjIttTGMpX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzCXXNLad+m3N7BJcdfTfdklNKIsSs8iWWU1gfMtifphw6k/8B
 4cFiwDQX+J446nKQxLN1edw5tD4WhojfT21vxITC2c1bpykgjWgWVkYiz78R/Ww=
X-Gm-Gg: ASbGncuMhQc3gZDZnWnjijNHYQx/mZUiRZgMSNNnzUDFmzSJ53pQ5S7b636ZhDufecM
 zrXd0+7gv2hmNQ5s9T9ItbBHrK4DJHhrFL+opLO7Va4kcSrsbguVVhBxYUJe16XKwoxg7FVkBGG
 bLrkxF+VlPBqLaIeHhSnxFFhm5nax6JozjkPPwBlUveJlX7UOPJCcVjlSGIYKtc/atGgQ8pb/Z2
 +R+c1NR7u8c1IvfW4Zg9+WN1EO7A5XGQrMXPQ1S9EIuX4Il5hVsKRy80IrgIAYsMPjxJTlyB9UQ
 WW+HZezYxmNa1US1NVDFrW9ArwR7u/zu5mHY9Z7F/WqBnaxpov/GbPOOO0/mDJXz6nQT7tg=
X-Google-Smtp-Source: AGHT+IGXPm2oSAiNp+USAUgYcq5R8vaQHTvdte9b3EpR9UR/tAdW6Op7M3K/5FJNlGfQxo2kndNqqQ==
X-Received: by 2002:a05:6512:3a87:b0:545:1082:918d with SMTP id
 2adb3069b0e04-5451ddcae2fmr1314169e87.41.1739464862225; 
 Thu, 13 Feb 2025 08:41:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09d0f0sm216233e87.101.2025.02.13.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:41:01 -0800 (PST)
Date: Thu, 13 Feb 2025 18:40:58 +0200
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
Subject: Re: [PATCH v3 24/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_cleanup_planes()
Message-ID: <refz4lflzljjfcxfppc2imejjmcvu5fnunljjyuxudgpl3iz4l@6adonu75gu2x>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-24-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-24-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:43PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_cleanup_planes() is one of the final part of a commit,
> and will free up all plane resources used in the previous commit.  It
> takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
