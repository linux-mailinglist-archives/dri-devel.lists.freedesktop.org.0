Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADF90BF8E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 01:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0E610E529;
	Mon, 17 Jun 2024 23:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eN6NKchJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C11210E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:10:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cc148159dso776801e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718665825; x=1719270625; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=We+cMzzEfPyNJs4E8h7UGUZk04qxzQ0Y4iOOEjzjP+g=;
 b=eN6NKchJX4r23eUFzFHUGrOBy1FTRuyt4l35Y+Vb1+ytWPsTGkzXP6x6ZwyA3oJGtp
 6VKUYZf1wwnGFUHIFvV7E1gh5MtVEoKbsNTV3wO5aXiyZWZHY3m7FBJytldRPZUWgLOV
 GqtvRhhuESzoxnMJazg9znSRnRzJGEdceUIpTRfVOV66sZp9A7tF7U3eKdwMm80mXQoD
 o2Q4IzYTP4XCEydt3SoTG9Lrg8lKSQ4pI9B+0m09RT38RyXzEtGDEfIlhq4w8fHXUura
 Gcw9VVL+2pH5GkVEZaGo2+esi2hNmYdvm2r/cSwU4l9F296ws1qPVyVbb1ihZun0uDCR
 Dq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718665825; x=1719270625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We+cMzzEfPyNJs4E8h7UGUZk04qxzQ0Y4iOOEjzjP+g=;
 b=JAe72uldZ3/EOa2RL9wjd2bFQMr32REFJWz2ePo1c70V3pG+r5WUaxjGcj+GPN+SwS
 yDDb4UpLgTZKhtEpEqS+Lx6S7p9AQIac2EBjkLsv18f7Z1nWk8kbJpJWuOUlyw7NoIoM
 de1d+h8EsC27RDvwAuyAgPz9D/mli2zitAIU5CboJZpqa7UcLTcnU6VMmduUW1IUz5oB
 4P9tn5oC5qWi/nDnhUY8gxmWoYMpZwWfHVH9b32HZJ4dU9qQ3slo5qFyrDZ3hniN40uM
 Ari6kxT3Xa34p3+iub4Zw5hq1bycZcbJ+aU019Xv6Zw8fMbf3Kt7We5Uw/BgEuI1t2jT
 dA/A==
X-Gm-Message-State: AOJu0YxL8PExcjyugt1YMMDxQIAiL792bahMqbrnqnWY7MkKs++pByYn
 yltwl9MgSYd5Lu8dkhiak2Zb/20T+/dMSbEKWGl/XX4/C13w2SwBWR1g9nxoeB0=
X-Google-Smtp-Source: AGHT+IE6WSPz5JkX+9XH3yVWV8ckTdvQ10ELe26IE1/Ux/k9Utl8IdxCmMwFdOH8UA/7aA0NlFVE8g==
X-Received: by 2002:a05:6512:1083:b0:52c:8405:4869 with SMTP id
 2adb3069b0e04-52cbd4eacbdmr2770357e87.66.1718665825451; 
 Mon, 17 Jun 2024 16:10:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2ed0ac7sm1345613e87.125.2024.06.17.16.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:10:25 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
Message-ID: <ysodcykcvjbv3wx2s4gdjnz66sn4cwbf5dyswncxgmnz3be4vk@fr62mulvuj4c>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-4-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:13PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the hwcg tables into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 619 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 617 ---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   3 -
>  3 files changed, 619 insertions(+), 620 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
