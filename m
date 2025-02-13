Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34324A35031
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736B10EBA6;
	Thu, 13 Feb 2025 21:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZAekgsXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC9B89048
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:07:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54506b54268so1305561e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739480860; x=1740085660; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=54daZ/2ISEYXfmkw2a/4DC97bZAaTJdOPQ/lBbTtt/c=;
 b=ZAekgsXpPnEJry7jT0r6zLoXoRvSwhM0eM0dm6bDiFcHPEGxAlDzfzcDr2bfvx3Gsc
 YPH2Sx9GgW86yZjROHcKdOetweT9ksTwgo5bq6xazgXG65mubFYxDLSlMF992Wj/18LG
 plcC885Z+o6dE3F7p+TVMEZcxm/IUKQhlkWS3JnVL016j/hWyAnXGf5p8OpXfZJbx9tV
 f4aio2iJ0FJky6oBaNIRpuWEdxoOEYX70awt4qrZ/j6rTI8skP9e81twp/S4E3gDpHzK
 ZpZaoEbRhvGbqApJAYXxVLv1v/gqVksliwLKmLU6KUHCR8S1BV/TXLJNuQWAgVwlZvUb
 bWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739480860; x=1740085660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54daZ/2ISEYXfmkw2a/4DC97bZAaTJdOPQ/lBbTtt/c=;
 b=qiOR+eCCK7pTO5YpHGEfqUIDQuHlGSs+vgrhNc7AH4MEnIgvGImfO/GbNsQ4MwhE0v
 p+m/2qYB57hRGm7MK76U98xdZwT3FGTk3J6f3VPMef1JlKil22R4r0FEFpquUBuwothX
 qFxnWFGt5xv+Bb440dMMKtOlOBm1Ieze+Djzt8aeKNATBNz/Jx7BsaZq+mz7ssw8QROI
 bNUhAA+ZmyouDS4k2yPlTHNkmcyYoEAt1k0WUQmtf8LT7RPRCqRCkVNaPg8LgRQxM0uA
 d/WdelLX3e5DrpxNKci+TLEbrkaRE7X+qalvJYz4RiuBdxVcYMdai4nRBpMiBwO8YQvg
 JOLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL+SQq0WzWEDBOBGjriF4muuEeRDhuR5GSk+A342rKV3cZVf47GeFz+aZOxtWiHyeYK1eLU7Ckv00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySybktjp44BsIYjPjgBmZeMjXxmdWT+7bvzIQuJyzlT4hD6gUM
 xP0FEop6sUok55blDUoOUN/UmaPC8OoJUCslacR2lb4zRortz3dQw9ATh2eFNBA=
X-Gm-Gg: ASbGncstZUJyXCo42VaCqRJefnqscQHkweEDoU+e5jDaUmxulHIJyy9Kmtio9zEiKSg
 El/8jKfDJfzceru3h89SUhHO/fxkoC614D+jnEmLpVNeodmzthz6Hl4rmUOHmpYw+59Pxh8CMo9
 YBxBWhcyWqtLdQcIWUoVzdpTqFjMSBBtAOCrhA9MKlWZwxIhbosYa2F3QZ8jQ6PXzcQVhY/T0hn
 mShNpvKvfsI4WYlzmz7JXE+W6fj216ltELUm3JxIrpP1jPPuzovF8nBbtC+9iCUzF2aGv0LsSuJ
 Gk55ZBIByQ2fDvMWOBtso308/xjbj6X5qQQxJtAhQ/6sN59EFWLN20LH9JIOeqygvlK2jys=
X-Google-Smtp-Source: AGHT+IHdy6RCQWr/V5lQjpv7FHztk/zWiNciuZA02FPFndi2Sxl9F3c+cbIai8wKbgKpiRSu2MhCyA==
X-Received: by 2002:a05:6512:1381:b0:545:c7d:1784 with SMTP id
 2adb3069b0e04-5451dde7f2bmr1577449e87.43.1739480860282; 
 Thu, 13 Feb 2025 13:07:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091011ed69sm3147421fa.49.2025.02.13.13.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 13:07:38 -0800 (PST)
Date: Thu, 13 Feb 2025 23:07:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 02/20] drm/panel/visionox-r66451: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <4xtwrhvoahnbd7do55n6a5dxsbceowuzqvc72bukxmt4dqfiuy@3lz4cy4xyhk7>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-2-67d94ff319cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-2-67d94ff319cc@redhat.com>
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

On Thu, Feb 13, 2025 at 03:44:19PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 156 +++++++++++++-------------
>  1 file changed, 75 insertions(+), 81 deletions(-)
> 

commit f4dd4cb79f9ec3294e5100223ed90d8ae371f168
Author:     Tejas Vipin <tejasvipin76@gmail.com>
AuthorDate: Mon Feb 10 14:53:42 2025 +0530
Commit:     Douglas Anderson <dianders@chromium.org>
CommitDate: Wed Feb 12 08:44:34 2025 -0800

    drm/panel: visionox-r66451: transition to mipi_dsi wrapped functions


-- 
With best wishes
Dmitry
