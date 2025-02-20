Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2894A3DDD1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2ED10E98E;
	Thu, 20 Feb 2025 15:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MiacFUM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D110E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:09:18 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so445289e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740064156; x=1740668956; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+TrqmFIDg7LS0RMitQBMTQIEpS/xCuYWiAEeRX3X4CQ=;
 b=MiacFUM+dqnFogAvf8IsBbYF59ggKhmIhdfxr6fCGUBo8PtbCk7Q/+XAeL+ieM/K/u
 YfZBCAgCFjRTmRWgW9RMTEq9cEKi1rh/xvoV6WIauk6r+yx9psVBAkiuRusoWrF8Y6Qe
 7/SwmIExjWsX7wW4XEPUYBiUUe26docimQSzzQaPeq4GbbsRRhUuLZuUi+7hx+epsXCY
 8wAiJOCg7tychvQyaYe5vJoYSyGBZrr51VGwNrJ+xWv7pXGo5iX/sItrMW1bY6p4WdtJ
 e5N9RPBVBZsB6hUJ+P3PlmVk0m+A0o08joVdETrlwZxHZKlIa+Xc1Gmcw3fSh+8LQ3ix
 lFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064156; x=1740668956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TrqmFIDg7LS0RMitQBMTQIEpS/xCuYWiAEeRX3X4CQ=;
 b=BqKbohZPZogZVl+0rw9UzEJ1QkEWHIcYL7r57F6DDYSBGk4uPnn6S4FyxmDn3zM4br
 yFX4KNp+VkyC8gyZZer9uF8AKKUAnXR+qabXvP0/0SWZzISJrEZLFUc/d/ICLWXtK7NK
 9y7P50N+KkS8IopDspkTRhDMrLbDr4kiYqUVftmpjm6wfXA86EsKNIph7R/JSMuwDwio
 gUYCdo22xfr4u/xJXGICsGm4QRCsp/WDGF7J1nvAX5m+38Fq6C10vQFAS7lpnxS5lm8C
 Hob/tHQNK1gGlu1S1yJyJAtqS/wBz5Ibp4NScQnmkFFnQ4tzJKvDBi4dB24p1/mpNx38
 LCaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQT8nKdVJiMkJCjLu/UYcpCNkeis18jzy1FN99u5DQ/YlEazVepJW4NuFYOhQtWW+z2XUAofr98sA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylk9qfB3WNIdRCwF07ZT0l00JCTqXdjSmSvO+rSKn3tHTAZ7f6
 xHhbeSIaGmnDZPID8+aSbTb7AZJiXSXmFH9HARwC58QBFAwe83zEU61tDoatLYc=
X-Gm-Gg: ASbGncu27l5SGXzjdis7QBGD1vYI2zXPhl5C9gGbE2PBx6Ut0ZJLib4AigaQZjt1WcU
 4ARQopHT38Z5PVjRFPo/pOi+n0gw7kuzUAzj7Nc5YZpZ50x4L3zQ/WBMMrj2q/TR+rAAlVqKlxe
 CURZG2Ya7qaBMiTsA9plfkT5P/HbICvb4tF+kziuNpyhkl43xF/jBOeNwdPy4C8dIQJV99H//CZ
 sxnNhmOkBpiWZRocXSr2kV3pgxVzARtluN2yV8Fzw75q+GF5gBERqIpp+BGi3X4i0LmJQYtKc6D
 Hu882Ef0BOBBWpgVLQ2qiIdsaMdMZvB7vJOo+4vU1z11gql1DOGPh7gZ9227dbdN9dYRv4k=
X-Google-Smtp-Source: AGHT+IGYUSRyxQtQJHKFhBRccMyjpV7DJJR+lrKX82ITo7yqqtVGG6BQu2KYcQoKQzMfymattBJGDg==
X-Received: by 2002:a05:6512:12c5:b0:545:d08:86 with SMTP id
 2adb3069b0e04-54723d1039fmr1235901e87.5.1740064156278; 
 Thu, 20 Feb 2025 07:09:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452ba48767sm2109485e87.177.2025.02.20.07.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:09:14 -0800 (PST)
Date: Thu, 20 Feb 2025 17:09:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
Message-ID: <2sd5plw65y5ggknve7ou4utfuvnpmryi7ymhzlaj4x35zf5tb6@he7ukjvjknle>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
 <517f2021-d863-4976-9df3-ae5f64102b8e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517f2021-d863-4976-9df3-ae5f64102b8e@oss.qualcomm.com>
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

On Thu, Feb 20, 2025 at 03:17:23PM +0100, Konrad Dybcio wrote:
> On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> > Instead of using .parent_names, use .parent_data, which binds parent
> > clocks by using relative names specified in DT rather than using global
> > system clock names.
> 
> You're not actually dropping that behavior, since you still populate
> .name of clock_data.

Yeah, it should be "in addition to"

> 
> Konrad

-- 
With best wishes
Dmitry
