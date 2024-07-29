Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2C93EA56
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 02:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789610E03D;
	Mon, 29 Jul 2024 00:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VcbaBksO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241910E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 00:37:53 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-825eaedff30so485438241.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722213472; x=1722818272;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
 b=VcbaBksOAF9j3KZcpFs2lHBYoIqamrpNUcTp+LRMy9d8Gl7UfJSzpM4OnK7mOOeu79
 y7FbsRi13DC94LHcLGjvG5t6b1A6LLK+I4xXZML1bBYB6xk+gnJphbrLGuOqw+aomoZi
 MPZXFaStn4jS9HI9ONhqEAqRZQ5irdFnVX6p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722213472; x=1722818272;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
 b=G0WhU+kyVJlz07n47X3h20X0fUszlKpKQ2b3G3Oq/qk6/NYaJ9slwfU5u/S23ZKE9t
 INp1G+rggTqFX9zXU5+8HrxfuAKDXZnc7oG4/0Fp0fPmVWhYSv26d9u2VwPTfACS0W+l
 UfcJMa/KIiBSaXcpauSSTeUwi4+S8y4xnFykpy2X5TSYyGDoxWHDbh4XXoIXmdAgfUeM
 uQHh4b4003JI1kqv3ih7YmrB6JXQkbBAfuCdNfUlriDCi3GxFKqtbrt8u2TF8ZSwU5Ju
 ieCdTXuu5w9Svot4RkW5i3CRNENhgXGbJ5T2xLKWMGoU2T7GaTRqdmAsxn+cp2WqxKiP
 6EoQ==
X-Gm-Message-State: AOJu0YzinldksMMhw/U8QYIDhIDq/8HylcSH2DVFoVKSgFEjQjkTsooJ
 lFSpoYDQ1JB82KkYRy2MIhMQjME5FJwN4gf7nrdoi1bXi0v7D8BVJjLnLRHNB+MPoN+Pt50l7XM
 dZvwVHOdObL6Q4+2B7gpBiiKQfnII7GCGYq3D
X-Google-Smtp-Source: AGHT+IHnc0qYQ/QNoYPa3JLfKJgzufSGeqO7zfkvsDu+SwHrgNq6HfC27UO1CGigP8NDR74vS4JR3C3+McMA5IKTJV0=
X-Received: by 2002:a05:6102:3e90:b0:493:e66a:793f with SMTP id
 ada2fe7eead31-493fa4594bemr3339662137.23.1722213472288; Sun, 28 Jul 2024
 17:37:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Jul 2024 17:37:51 -0700
MIME-Version: 1.0
In-Reply-To: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
References: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 28 Jul 2024 17:37:51 -0700
Message-ID: <CAE-0n52kAq4=Cbdjg8JFVJ9a9ww-cLkUwcJ4BNBP9McXeaSxeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset the link phy params before link training
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, abel.vesa@linaro.org, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Abhinav Kumar (2024-07-25 15:04:50)
> Before re-starting link training reset the link phy params namely
> the pre-emphasis and voltage swing levels otherwise the next
> link training begins at the previously cached levels which can result
> in link training failures.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
