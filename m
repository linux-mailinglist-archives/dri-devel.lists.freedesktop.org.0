Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C5A36187
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB810ECEC;
	Fri, 14 Feb 2025 15:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RpOx7xK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA34210ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:23:49 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so471886e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546628; x=1740151428; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7K8BSTw7ta7yWsbqLgOVUyOnvRZYzOV19aJnHy0TwW4=;
 b=RpOx7xK1fYH6EVrgWWYmX7ROvQ1qukOKHQ0Bb5hChLQlbaMCHqtgwAUUt0YaMeKBnA
 3+hXG3a09Yzf/Htjbvmw1TbFKwZPRgK+jALIweL02zIiB11c9WoxIkqo8fj1yuEjYUS6
 w9CgThMfDhKwZVWRkWwaw2nK8mL5vkMGfpWvHnLyU41sXrLoVjDsQDr5gmnEBVNCVzkP
 kIxY6V5b8eHCqX2t9YWFRzz/kBpdrsgryMRIJeP6bw7kZVDjV2UOPGfL+l/Aa6SOy0bM
 7D7yxzvg6K5BUraRLehiPkKC/CLLTCTKfmznGNlRPWD33Fg4KdkKuAiaYhRKsE6dAAqd
 k2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546628; x=1740151428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7K8BSTw7ta7yWsbqLgOVUyOnvRZYzOV19aJnHy0TwW4=;
 b=wtyQO+j/JTLhYzx3UJ1udCkJAHMltRN+T+pHEURiGp7v+XIcLsHXz/twNjJfi8tV3h
 wZhAe09My9zRLtimWlSko0S6vhyD7JJVQRK3y04sV+bzjq76DyT1Ph3bsdKeBjGWwd8B
 +MKmIwcTQwdsCC2g616o2Mprer8/7cZq9SL4EYQgKU+SMW3fyyb17e0xcUE+Rb8dywZg
 UcJt3W31851EabXCrTVqZ3m7ydsA7TyjRwE3UZ98upYAUP3RezSLrViBartP0ov/vxcf
 RJ+2eJy9K/jAJkL0ULi0Zr3d6ZOI84v3mxcjr2TutGeNLTJFNSwtFE4bEXYvkeFMGHK9
 qlyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYpykfVZJAadwasVVeYbrGS/4zyTO5D4rg/bf3MgGeEyTYztIvv9Ys8tSpvPS9uz40j+yW1+p5lW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgYeci4qS44/oggspoZ7LuOMF47gkYtxCnhfzsyjvAjAjqAZxe
 zJ7xQjxvp0b0NwlHJiJ8cmeBgp5ZXxRGEr29TxZisi0yzd+I0vpBSRGyuFgkFOw=
X-Gm-Gg: ASbGnctDlbiA1kqpC0SUeJP//ctfYp+IgCkiweagcAqkesBqJDqGgQfo5Nu6UI6PGHy
 s6IlEBbFV4U8sSFHbmO+iBBKSZPEBSc3o+EKqe+FI44TBgidZ30g7MpDRr90xpI84kYbOmyXlb/
 a/N6gbXihh3wCyVyYYYoWBd92zw9wf763vdCymj6W9RKQzFTtnmw9ZNKWw/V+Eyux3Uvo5LAfXx
 1r73hLgycgVsFMHtYskdjAHFoY69qYXhHJgpm0GTqueDdHmUwxcqEKWaFQvIXzNAVvzxPP4KTt9
 MZ20r4/uz7P9tP6wWrp76kh1vjcMpvxcWphBhrMXG5GLxq4WAnUYD0vxbiT/ToTPIYGYnTI=
X-Google-Smtp-Source: AGHT+IGALhJWUcXuaBCuFD7xYR2u6KjGzOjmwJRF/DL2JlsD9cMVL8yeOcM9QHBZZp3Db4bqrZQnzw==
X-Received: by 2002:a05:6512:1250:b0:545:6fa:bf60 with SMTP id
 2adb3069b0e04-5451dd8fd27mr3053085e87.19.1739546628171; 
 Fri, 14 Feb 2025 07:23:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526ecd59bsm299535e87.31.2025.02.14.07.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:23:47 -0800 (PST)
Date: Fri, 14 Feb 2025 17:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi: Simplify with dev_err_probe()
Message-ID: <26p4fibtwqoiagzce7r46dumwzwe3swyjyy7wddreeksz5kg4i@sbys6hoqye5a>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-2-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-2-1bec50f37dc1@linaro.org>
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

On Fri, Feb 14, 2025 at 02:17:45PM +0100, Krzysztof Kozlowski wrote:
> dsi_get_config(), dsi_clk_init() and msm_dsi_host_init() are called only
> from platform driver probe function, so using dev_err_probe() is both
> appropriate and beneficial:
>  - Properly marks device deferred probe status,
>  - Avoids dmesg flood on probe deferrals,
>  - Already incorporates printing ERR value,
>  - Shows device name (in contrast to pr_err()),
>  - Makes code smaller and simpler.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Update commit msg
> 2. Tags
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 59 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
