Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAA7FE7E8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 04:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C910E6A5;
	Thu, 30 Nov 2023 03:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2519010E6A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 03:58:38 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d9caf5cc948so450863276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 19:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701316717; x=1701921517; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V0GQhlWdvAUlsF/29HLus0m5tiuhwjzglUbn+n9oGmE=;
 b=B/o7Z6hr77fbS9okeatDiD5Uq7GPH50gjkHWc5w0RG10Yi76fVqRAMWJx8Q5l1tnrC
 VgTCOtbxYigQwma3XBdMfCKBK0PRwu4DC2uA03rkx6CNLMw8OTYJIh7FQ80oh6F9ET3m
 Rw0jmufKVQmLZ7LGn16kqdM0RCd/rz0GruQRbm3CSt0I2ZHEeqZoKbPabi1NgiEr3a+F
 aEVRUl8ZL6v71zb3s0Rc7cBxl5haezdv3z9aQI9VfHBA/wcnIPvBJC90pKcfOylOTWBm
 FXZwO1TkbOWod5wG66RyvzGJ4iHSpRLuO4FEfdQ/QRZLLtzxEGSXv914nh7pj2v8fLIH
 oAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701316717; x=1701921517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V0GQhlWdvAUlsF/29HLus0m5tiuhwjzglUbn+n9oGmE=;
 b=OLIC+mqJ9pO5M4QYTE5iXVxE9KPtOUxyhBEbHgNY17FC5UEoqPFkUDdzVUKAQYbby3
 BydF19NNDQ9O9fgiEIFkwO7u608wFTuFPKWL+8lzmTrf7kJUWc5sfyjuT6Hqj3qB/kDp
 DoaRVu0rJPMXoxF4LnXfyDWpFgfTujzUa8kzMVXEJ+W9LgJeWl1hSEhigZWKIK6fCIDO
 qnGrC2TKx0zX+S8ohZ2YGdl+QfphKN3xUVVGCI9Sae1EFVbbVTkz434t0IdIpcvCkswe
 bAbYqa81sRKdzfxOZ33ysPQ7M5rSsal+fRDOqFILnxG81IMfSZZVOKDUXHNg5R+fCvJj
 azwg==
X-Gm-Message-State: AOJu0YyOQMYRU+SXl9E7JYG62C8bPAoqA3ynEOqKjjG0A9/jQAKM93Qw
 BrkN8yDgrxmKY9RekU2OOInktp0X/SpPqDJEmJJm5g==
X-Google-Smtp-Source: AGHT+IG2PaEBhAnYDfPeNn+LVRC9+yXdgkqOfxVNf6ZlTQyYG1pPuBFtF+9CCkfpn9RTCOHos08jypg4V5VeefPfJcw=
X-Received: by 2002:a25:ae8f:0:b0:da0:4576:3689 with SMTP id
 b15-20020a25ae8f000000b00da045763689mr20436952ybj.25.1701316717256; Wed, 29
 Nov 2023 19:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20231129184159.24216-1-quic_parellan@quicinc.com>
In-Reply-To: <20231129184159.24216-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 05:58:26 +0200
Message-ID: <CAA8EJpqFcT6RiLN103RVTeJ5vCq2MZuSBMwEP9Cb50eX1_HFJg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 at 20:42, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>
> Changes since v1:
> - Optimized the format in which frame_done_timeout_cnt is incremented

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)


-- 
With best wishes
Dmitry
