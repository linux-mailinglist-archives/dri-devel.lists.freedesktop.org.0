Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D29AF300
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 21:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE7810E027;
	Thu, 24 Oct 2024 19:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UAHBYy8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAC910E137
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 19:54:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539e6c754bdso1251054e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729799682; x=1730404482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
 b=UAHBYy8rClzKNrVOyhUZnKbLveszEEg++AyJV8dKr/I2k5QJnLpo2HOmOLUIKx/WRh
 tfZlKWGUr29KhY2JSI5OVebZ+PZuyRbLYNWKhfqXwg61jAzNDyRz41qT1z08HtKqMaqA
 h44UJqMZqVdHOnoVKZL2y3ASQjz4rPMZd8+gaQtIXHoXLoC5KtwzzFyoPS2xGBmhwEpl
 nqT/aU+1b08sDAGZd9315gDB4ilvCjkKEkaJIFLyoPjLxx+T0u86/DR3IYZb5lkNQ5mU
 wsV/Gv1abXyXJOOMPov2oPBN2ugs7twYT0HkWQEEctSoEeaBG1czK9qRNNKO2Q3mv92P
 sGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729799682; x=1730404482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
 b=KpZyiiYuAaYIpmF9VaFp2DQW+OVtB5KE/87cfxKBM7Zo20z31mFfkT7e/Ijntri7oC
 EEA9BdVfVzE9AikzjoVz+A84NdozNqrzC5YKNbjRcOK0vOpxurZgoqk2+5NfkzQ6hk2E
 Hbm2KHUEiHrDiJMsfzWL35H8kTyJDTgeoTt726wgp/6nDejbvPpbpyaCYrbK1Zio8EVU
 V0PznKh3Bb6MXKP2AvZ5yIDRnSo+jQ8MbNODQjjTfta1V2voIMhRzBKAyk6KsWert5e5
 Nh/EAkA49819D8kh9vMegGZJjVutBGTCewy44b7cUtQau73sEeT5oSE5wG34ogbAZKFo
 TeUA==
X-Gm-Message-State: AOJu0Yy0gTWb70IATOMWPNGYmX0+pNCvU2/ZyOUL9BerKcLxaVhk77tH
 mMrv5StEx26QWh+cOmI77KOIAL89VT29XZM6FTCoqnafdAjvxMeelTlIvKZRcuU=
X-Google-Smtp-Source: AGHT+IFalx0QZeZZilEqjiYctekRgtIKVNVU9HQYnnJfAhQXhHZ9ry82TcwqGxCi1zyluqe8Zd8wgw==
X-Received: by 2002:a05:6512:131e:b0:539:e85c:c888 with SMTP id
 2adb3069b0e04-53b1a38d185mr4425601e87.40.1729799681711; 
 Thu, 24 Oct 2024 12:54:41 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a224403f1sm1450014e87.282.2024.10.24.12.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 12:54:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
Date: Thu, 24 Oct 2024 22:54:38 +0300
Message-ID: <172979967003.2997922.5344167060572719601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
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

On Sat, 19 Oct 2024 00:49:11 +0300, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> As an example of the conversion, enable the flag on the DW HDMI bridge,
> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> outputs) and AUX bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/display: bridge_connector: handle ycbcr_420_allowed
      commit: 3ced1c68751299c0cdf6a1ceeafdbe77db7d4956
[2/6] drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      commit: 58e6d652d138ef163d0b6b4d19f0fc9d4e8519fa
[3/6] drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      commit: d5cd8280c52bad44d5943fa7501bf9f20718d432
[4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
      commit: c44a0faf5397134b3100c00cc8a8d72528bc422a
[5/6] drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      commit: 785324db2d7a44e866161b6309fbda9a2178d455
[6/6] drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
      commit: 8a8fed657d0427f6765a48c93152a8d86cfe613c

Best regards,
-- 
With best wishes
Dmitry

