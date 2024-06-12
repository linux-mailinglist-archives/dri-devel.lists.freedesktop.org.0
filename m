Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70360904D68
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E6210E7C7;
	Wed, 12 Jun 2024 08:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O2vDEt0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6CB10E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:02:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52c94cf4c9bso1902865e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718179328; x=1718784128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iy6VaAIWsc/uFJxkxC11R2z+NrPGPrzZFexuniHGbrY=;
 b=O2vDEt0nE/1rmPo1Gh4ybO1Hpt995RdVnow+AMCTGqRjqq6Xi1syS1IeRDu28PSe5D
 aE5WG6v+wBKg7p2EirhSAi2Sjlvu+botY03uYGWyNTsKaOijAcpdsGAmhD7uR63Fmwen
 yj52ZgStRD0Yq47VwygR8Wexjt+0pVn8vaD1zOsc0zCrYnsoeaBUxJ6oMkT13thEwQjP
 D/xkOlUB7qn9D6Ql4AfzAkwywraEni1zFYxzaXeuzmLPspv3X/WQc8wQAtMMEgRSE5x/
 mMDQZcTd+3Qt8aj58bXZpqR2fKaz8zHZc5aI9VSJ7BEzi506GRkPcHCBrK1SzdlJ3NyT
 WE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718179328; x=1718784128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iy6VaAIWsc/uFJxkxC11R2z+NrPGPrzZFexuniHGbrY=;
 b=wvac2PopC71Jphdey0+6zHvvIjxQx/1mGnjBlJBx6o1fGhhO9p0ZNf7hxW4vsePaNx
 0x9Eie7/vmHLDuhayN/wkU5Sogu019T4IEnR09ItyJt+KX1edsY2CBdYMYqlwmrNfoay
 WEejONi1xvqXb2zCojllmD2BVekiMshfi6f1PzQG83/vRmPZVyfIQckT4nPlvqRQ8kQg
 LBND99D8c+V/LZa45k/BV9NDlxQoxDvGbgN7q39I7AzMLx1TKcgAHgaWNMDyz3nZ1NNz
 GDguuvYNIhsWn6CUBngLXHtmihxVIY2EUZ9y2akIhUL720hQlx/j7dVota0Lx/Ik5HE3
 kWtg==
X-Gm-Message-State: AOJu0YweRrkj4lVsbei1G41hSIjZvuLt/LXLFaiupGJPKpoROZ52P9jk
 aSJD9d3SBE80wrHEK6ANtXe/qYQFvBdJSKujgRfUHjNkPMOIaO5YN4+1mEAjNtg=
X-Google-Smtp-Source: AGHT+IFDKHNqbb5jXRRVasJXbOoXoBcVXVT3XdueDls6+ffc1QNC2kyj8whnyTo7bp9zFvAdHXeXCQ==
X-Received: by 2002:ac2:58e8:0:b0:52c:7fe5:f89 with SMTP id
 2adb3069b0e04-52c9a3c6b34mr739943e87.15.1718179327968; 
 Wed, 12 Jun 2024 01:02:07 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c879187f0sm1435885e87.272.2024.06.12.01.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:02:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] drm/msm: make use of the HDMI connector
 infrastructure
Date: Wed, 12 Jun 2024 11:02:06 +0300
Message-ID: <171817931352.2727087.11541630600563210677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 07 Jun 2024 16:22:57 +0300, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
> 
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/9] drm/connector: hdmi: allow disabling Audio Infoframe
      commit: 000d1940c90984a9a2af9c02bc17e3ca0d87f71d
[2/9] drm/bridge-connector: switch to using drmm allocations
      commit: c12907be57b16eed5a73f75a44ebea8f30629c85
[3/9] drm/bridge-connector: implement glue code for HDMI connector
      commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439

Best regards,
-- 
With best wishes
Dmitry

