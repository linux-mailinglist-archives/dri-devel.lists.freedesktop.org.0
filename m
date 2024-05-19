Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8E8C9426
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 11:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B9710E0B6;
	Sun, 19 May 2024 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HQGo2g/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DF610E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 09:01:32 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51f60817e34so3905182e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716109291; x=1716714091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
 b=HQGo2g/qR5S2odONZcHQ7Nn6Wu0MTiO3WNrnWpEzE5Yrl1dEF2qwjXcOjM9k/BJQuN
 hEYLaX7+OW5DAP4uCTqTsbSAYq95nQWpxHUM3G5GgMH87KqlNz0nrHk0Ft46taLGRT/q
 qo+TFffYPOjc+bZk8PmESMS5nj+S2H+RYmsZjlyhL/TLzsk40IW8DA6M5TATEYLrhibG
 qO1dSzcuOZYvwkGDdmFDav+fLY5KPpTCtDARTsB4EwjDpfU3pZM4NutbKVGjcwnfeBZk
 mhAdGMQ2eotMepMaO9gvJL2Ny3yGwL/9Hg/aqnFVcmX/+KDeQkNpk4ridFFWgfaAELyd
 1T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716109291; x=1716714091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
 b=ifCQz7dSSijSL0UZv3UyqpT81wK6XPTGzC9R7SCINiL4EA1F4REW69/y6IX7xQEbGn
 aWTckRbripEG+U3oo5+g6AaONNz77Z+xuSGRU8ZPt8GqvkEC6LR6t00djWa7v8rJiOU0
 D/1MPa4+K+biYEUz1/mrTGkpX5AO57NE50al2MoPvvhOVv5zUW2TUjwmc03btJVGNXg0
 3Iu9XzquBzIVri5VT/+6E92pisfL1/hK2s8Cy8N8v3X9vVHSdF10N+kRrmQ8OlKTj/Ey
 gaKBoHYrVh9jCiPi0Cu+eUnqs9ozVzKadXzGEAXHf22+vW+05Df1X9k46s6IBX20W6IT
 GlLQ==
X-Gm-Message-State: AOJu0Yx3dJV4Vpqf6ZX4y21AqXsMfM4miTcYYlKjBvmagJIwjoW27kd/
 mr1TlDuLpbECYcB2oPubZ8DigS4HUPatT8zwn7UUxYnR5VEeIQV44TScLACF6H0=
X-Google-Smtp-Source: AGHT+IHo2lG2QfN3wSHOdCTPeob4sZG4UUob2G1FAI+cUqka9doJg1KkF/LYr2/BlXVeJ+LSz1LbtQ==
X-Received: by 2002:a05:6512:131d:b0:523:6354:881e with SMTP id
 2adb3069b0e04-523635488aemr12970576e87.39.1716109291007; 
 Sun, 19 May 2024 02:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad584sm3859393e87.21.2024.05.19.02.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:01:30 -0700 (PDT)
Date: Sun, 19 May 2024 12:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Nikita Travkin <nikita@trvn.ru>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Check for zap node availability
Message-ID: <zqncrzat2adqwdbvtjzrropwvfmhplmhv72mzv2nbhbgg54byk@wbpgofmqpjtn>
References: <20240517195021.8873-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517195021.8873-1-robdclark@gmail.com>
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

On Fri, May 17, 2024 at 12:50:19PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This should allow disabling the zap node via an overlay, for slbounce.
> 
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
