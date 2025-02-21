Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFFA3FA5D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183110EAA5;
	Fri, 21 Feb 2025 16:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BK+/lJvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874810EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:12:12 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-309311e7b39so20809931fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154331; x=1740759131; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IbnhtJEa4SquPfm19GzdxAOTsJ3ZtzFT/hW1Tsd7YMA=;
 b=BK+/lJvRzKMTBCCIg0TBoGTChTW/vvwWmH3iqMmw25YUphwLCuMM3P1KDY3BqLUHdI
 eOUyz/pFWHfASyDAnh7D1SpuqC16PFgdNzV4+RhFbs+hqSakUrc9qISCUA5a0KK6eCgw
 XQHJ3DDkBIUDUvoeGRXpSoG6khhe8C6zInFZcKJz4SAh72K4JRSxecE6/fSpEILRXE8Q
 M6Z+wQhOf4Axb3aE4Ts4tzwmhFt5g9HQyYYD4iJNCnU0F6LWNAWHObsfDBA4yuOC96JE
 3g7oW4w6V1aM5bS5aNVvsiGY3aNDKseDr2A+P+SFQVG3ePwpVmqoIm/8kpUdkVyHZFkX
 VhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154331; x=1740759131;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IbnhtJEa4SquPfm19GzdxAOTsJ3ZtzFT/hW1Tsd7YMA=;
 b=cuDIXpoMGang5VzBvw/LEJTQwL/jUPiXGG/ep2KeyARKwNveS/g7d8oX+RHHdQfgWS
 bKyEmHfDTolkvbmTWXrZKGcLRa8R1VKk3mUnxQV6rJr0JoypCNlXVQWOxs5CO/I4YI8v
 MbYk6xfFbm/Y1tO3VNE8mwWitWxw8myXyp+rtIs6mr+FA25QWOTHeMy5eToV3IrZbiEs
 RgsglGVH83qqT04oQ/7dJrH2er8/MN8aovqYinrCSIA2UwMrY2pEsvV1BktrxfK5qd9+
 rb/XIDZd7NKrH1mRWkNa+M2+QFWIXTXW5AuGvsNGMQK0SZ2QFXYlUrGtUfo8aE644CcV
 H9tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSlMZBwENwrYEOpaxQOkoICPvnIYM92rKTETk3SHGcRV/kbiHv7S6SEP1icsoGkqDCiUQ8AT7M6J8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrtWwM2Ef3r+A7zFAa/ck9GUU4F4v3ZSfNclbA0bZ2QV/+LxC7
 1nE4M9ZTDZoXKzV7fW5LM1itaTo50ut5odVv90DpzGL8Pv8eNdWBpqpr7O7DLLU=
X-Gm-Gg: ASbGncuZvjp2Kt5zoTAVKzjW99TSrIGWCEjsKGji+qsvR/6VmeCt1DMwjfMFEqaAiej
 tWzlfBRJOtSPFj04lvutu0ObAyPajmgL3BY7OyQQNCPWsY4SpDFRcMcBcaWrDtp8FxOXN2Vsq7Y
 o9NvBhv+oKFuoCTQRkS7QLRdy0jpVF+vijWPImt1tOgwOx3Zor6A64F67AjJECC3vzFaxxuN4X+
 xaTPvPVqBzW/fd20PYeoOuWvFaRVQ7fL7HhKhmALhFm6kmhv9/XbWDTNeH3NwLlioRUDmQ3l93o
 arNuYKE/hXEs2lHGGtqOsAOYG3V8AzpkU7L2rziBR2hoNnURMKntx596hy7ykgy8NRLUl0oaN41
 sdHGewQ==
X-Google-Smtp-Source: AGHT+IEKm09ffSc5M3frvvgU3E9J1EUpouTHSwPL5rhTUfv0oqJAypzPAMmviTh4qLAjGZjUYSJxPQ==
X-Received: by 2002:a2e:7d07:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30a598e29c8mr15100431fa.17.1740154330646; 
 Fri, 21 Feb 2025 08:12:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a25195701sm20109501fa.4.2025.02.21.08.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:12:10 -0800 (PST)
Date: Fri, 21 Feb 2025 18:12:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 11/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
Message-ID: <7nd7j7wslq5fclik6trs2egwj7kx5wy246ljaqmwbkvnutu547@qgxcx66kjsw2>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:21PM +0100, Krzysztof Kozlowski wrote:
> Before blend setup, all existing blend stages are cleared, so shall be
> active fetch pipes.
> 
> Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
