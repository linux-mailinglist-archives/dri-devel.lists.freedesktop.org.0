Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25F860476
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279210EA7D;
	Thu, 22 Feb 2024 21:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zwtn7g+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1C910EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:11:30 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6087396e405so11631607b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708636289; x=1709241089; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6LQ9AKd6x9Ppr8V8DrGvzfthJpW9UNBDUhPwgck2Wa8=;
 b=Zwtn7g+Mp2xt27/MrJ3N8UWrBqkL1JybO+6iQKIFh64+KdNxJPl32mKm5KYZrX5NiR
 wAoZqzohHeEiAQiTDWZW5yrezecn4Rrh0vDQsdkDj2sPxctWLBRnSsdNFGPUytpnGRMg
 4PdImTrQAfc/4mOx+74eJKDpkho8Ty7EeRo74H6TWNshqnmI5LxGcoUWpD2cD/KF2plI
 CIj9rCmt5sBGRapbBou6LttRr9OWB293DuQWtutjyMz9WqL4G6Q006EgKnC6yG+hAe6T
 pie54XP0QzB0bqrCEFaAyFsn1iE8fNBlLgWJJsxiqVh+isVugpxxP6cDLiOpaMrsqrUn
 c/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708636289; x=1709241089;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LQ9AKd6x9Ppr8V8DrGvzfthJpW9UNBDUhPwgck2Wa8=;
 b=Wv20bGUo+BQ+SHwt/2D+Oe6UuBC8rKs7O4ek9sDiwOoZh30KVZbbYaD6vnQKxjPkSi
 84xtyM+arZlZoQAsMZj08s3XKiba/0KsN8WPeyvpOumAt0hiR8k3yKWAFax7GHxB/7Je
 /Hs6RxPCga9miEC3uLfzuxcbfxZudxPM2QZtm5GQQvEXwl7pPuNPG1pyFg05aGhC58mC
 C1y0qYifCU3Q+thwp3I07MrRNpRUWS4W1gPcnmf3AOHtss/eIyiC5BvSNeMueZ8hh7DF
 03xBjUJYxT09jNgFmFzSahBAsd2/6TOzycHuR4+BeacgIcM4FH3P2GuSkOABwZJU5cED
 vPLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5PzLqjcOvZ9+q96nQsrGEMfftaicfzpHRichL/1pyN5MrI9Pum1trxCfSe0euLIubGpYiZge10jf2ScfQA/4teCDz4TCmHXGVfDnIU8z
X-Gm-Message-State: AOJu0YzxzsSLegDAeCR3AQ8YFfWliIRK+kDR7bd0uIqhK3d4NuqrSiUB
 fM/KbHHZPLgYpTsfvJnzlc9DkRszYQLdOMvicHf/xywOGdVe9NW5iTVrblErKo9rBEZr781j7jW
 4vo1SrB+963zSLYH4tZxotpKyV1hIx1P1a8yp/w==
X-Google-Smtp-Source: AGHT+IGr40bVHUaWXhi2S3xmL6UJgO5Qya3+KW1Y3uj1TASqY4EfBpznUda1BUrj++1QaDRzC2B4Zta0+WKsL88FVd8=
X-Received: by 2002:a81:451a:0:b0:608:821a:15e1 with SMTP id
 s26-20020a81451a000000b00608821a15e1mr146315ywa.9.1708636289156; Thu, 22 Feb
 2024 13:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-6-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-6-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:11:17 +0200
Message-ID: <CAA8EJppnHY=jDYjgTn+2dF_zmGwM9+KsUS6vOyPB_wa9W0v-UA@mail.gmail.com>
Subject: Re: [PATCH 5/6] phy: qcom-qmp-combo: fix drm bridge registration
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, stable@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Due to a long-standing issue in driver core, drivers may not probe defer
> after having registered child devices to avoid triggering a probe
> deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
> -EPROBE_DEFER")).
>
> This could potentially also trigger a bug in the DRM bridge
> implementation which does not expect bridges to go away even if device
> links may avoid triggering this (when enabled).
>
> Move registration of the DRM aux bridge to after looking up clocks and
> other resources.
>
> Note that PHY creation can in theory also trigger a probe deferral when
> a 'phy' supply is used. This does not seem to affect the QMP PHY driver
> but the PHY subsystem should be reworked to address this (i.e. by
> separating initialisation and registration of the PHY).
>
> Fixes: 35921910bbd0 ("phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE")
> Fixes: 1904c3f578dc ("phy: qcom-qmp-combo: Introduce drm_bridge")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
