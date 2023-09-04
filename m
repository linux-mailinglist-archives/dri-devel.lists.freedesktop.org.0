Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCA790FC2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 03:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054910E26F;
	Mon,  4 Sep 2023 01:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9FB10E268
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 01:53:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bd6611873aso13033691fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 18:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693792419; x=1694397219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dy2kbeuiRBdiBUHn2uNtKw0zEJJVCb8NdeL9BezpnxE=;
 b=Ao8QGKokdqahh13NZeGQWRDu0WI5nI5ZnsD7kWD3jBTuJox/YbnIpnJd5ZQSbgj945
 ZEz/UBorhcDKB3A2DhOBCVsO/DxDLc6x+YZAQUhOX02EUVzIvlhZdcYDOrmH5L48Cs5U
 dmuoJv+L2n3aNBhNqP1cyIZy3cdSlFHBw8cIh+ddiIpVaFF0LxCc/Kj8jXfCEgCaNuxq
 d2/0A1Wy5HxMCZoayxhKI5m8W3rMEv1h1PYtzK7Vdr8LHucvZxXCTKMX4yWHLC8bBzHf
 az+RqJbFpWmvrJt3UrIpGUWWCRwoexfsSWXh3KhO/+yWPkhWlIXNHM2tqr+hA/rHDqIO
 bmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792419; x=1694397219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dy2kbeuiRBdiBUHn2uNtKw0zEJJVCb8NdeL9BezpnxE=;
 b=PUIoNSzAHU956B6KqHB68E9utxhFiR6NfBoslTv59nywZzX00WB+KTVjVKvZFNYLlO
 sX1rJCyEpY4IKmO97b17ba33vZSAc6grLqyUi9inSGRVg/joahfjcvDRZlY9Ri/VWdVn
 iCqYRMQI8rkvLE+9ihDE2UtWnoAi0h/ZaCAv5Rx68ZGDnIVSJWLFzv77u7Ki0cWPp+HY
 ZkVF6+n12AULR+lvt+nuw5Clm3t+4/TtBFiDQ/pUTYwhSlFpHrvmzBBhHHs9KtmipO12
 oGN/zjhyAlZSUXVrFjZnY92Ji9GQbdTPB2I1rIvIk/NEh890jHiHFMLMv0YSb9AiMlfY
 yWew==
X-Gm-Message-State: AOJu0Yw5/lYJ3U06LYU27RPR8ksf2QpgG8mUYlw8BIUa7GZdxqSeMJ1p
 UR9EDAWSXEgHPmdchGixerZfqg==
X-Google-Smtp-Source: AGHT+IEr0RCH4tYSkpwLMyNrd6sFeVftt2qeSJkJg6rBPTOdgqkf2WJkV6CnkFDa+VVNamWPRzGQhQ==
X-Received: by 2002:a2e:7812:0:b0:2bc:fb79:d165 with SMTP id
 t18-20020a2e7812000000b002bcfb79d165mr6335992ljc.39.1693792419380; 
 Sun, 03 Sep 2023 18:53:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 18:53:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm: introduce per-encoder debugfs directory
Date: Mon,  4 Sep 2023 04:53:35 +0300
Message-Id: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 64 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++-------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 +++++-
 7 files changed, 95 insertions(+), 89 deletions(-)

-- 
2.39.2

