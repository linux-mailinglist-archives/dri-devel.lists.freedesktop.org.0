Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507A918EC4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 20:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2519210E9A1;
	Wed, 26 Jun 2024 18:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fTzy1/Tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C0210E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 18:45:19 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52ce6c8db7bso5017589e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719427518; x=1720032318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r516++QOeVFACiJStU/TDuRGDEEHnBFRAWJR1ODGgfI=;
 b=fTzy1/Tl7RAJAMeZhUT/ziFbG75kknxhWX4RsW6XdpMlIqFQaBW+kG9o76Ag2xT4Ej
 qM41/dTEhRRvX8+LiDIXbCZUzm3Xd780lX872W9IMpI8UOlG4NPVDMs1QqAA1dQxQJhC
 lUzOuuaKv6g/hDiEszICv101dxPMSuzsRId/x+jzk1M0a45+EwwYw9EFXCyvX8ql1lsq
 wYVxpZvIkk8rlanU4/673MVtdfcSvQFm1m5X1wI8JmsJeCc6z2Ck6bXTnYN/EFPPBVOz
 Dl+1kGJYh5IzGx1brQHPp9SapaLQW4o6lUpaYsPSkC4xwKrF8B7s0TIMONFj+xOGhNSD
 8DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719427518; x=1720032318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r516++QOeVFACiJStU/TDuRGDEEHnBFRAWJR1ODGgfI=;
 b=gONufZoLAdy/x489lGgUUinfu4qftuWALHN1fk1u3eZOEariyjFto/hNERRy74racw
 Qdb2hYJDU0RkwgWqS7meXlxtO3UqykyrgfpLC42XkiUL1VK1KtThAsyUwd4ntf4qhnyH
 hfn4S12hBs2U5Q9DsT5UtTJopzLb8KeFVZw0SEcVfnhFt6c3zybQHmmiOKgnXS+jUS4i
 0tzcQQIOKPJAbLsUA/RLJqgx6Qb2lakD7lNHII7Nwyze9UeDbLSdS1ntMrG6RntiP9nZ
 plIP+Ih7Fr4HavnYkB1PTnMz50SN1VS8R60XZeyB24MvCni4dBmwIpRGVx7wgqBj4VFK
 50AQ==
X-Gm-Message-State: AOJu0YzzH4f00UiHm7Cwk+oYyVErRnim40/aGBauPsjqi6j7IJRdXJHp
 vGo49l7XAqLNELWdW3DQ1oVXknJSyCRO03okPoHLR2cvm96Yg8zUaui8MkWTaAE=
X-Google-Smtp-Source: AGHT+IF02l/g77HrrY/EHDvJj3SRhUNNuUf4f+OQuNs5aEI2gBKE4QsVsG5zH1X0O1y2QvS6Abz9BA==
X-Received: by 2002:a05:6512:3b25:b0:52c:881b:73c0 with SMTP id
 2adb3069b0e04-52ce1835195mr9278710e87.17.1719427517703; 
 Wed, 26 Jun 2024 11:45:17 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52d9b245fa2sm412490e87.155.2024.06.26.11.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 11:45:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
Date: Wed, 26 Jun 2024 21:45:15 +0300
Message-ID: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to improve testing of drm/msm branches, add drm-msm trees to
the list of the trees to be merged into drm-tip.

Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 nightly.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/nightly.conf b/nightly.conf
index 49abf3fb2a72..f2e181aa29e2 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -47,6 +47,11 @@ git://anongit.freedesktop.org/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel.git
 "
+drm_tip_repos[drm-msm]="
+git@gitlab.freedesktop.org:drm/msm.git
+https://gitlab.freedesktop.org/drm/msm.git
+ssh://git@gitlab.freedesktop.org/drm/msm.git
+"
 drm_tip_repos[drm-misc]="
 git@gitlab.freedesktop.org:drm/misc/kernel.git
 https://gitlab.freedesktop.org/drm/misc/kernel.git
@@ -91,16 +96,19 @@ drm_tip_config=(
 	"drm-misc		drm-misc-fixes"
 	"drm-intel		drm-intel-fixes"
 	"drm-xe			drm-xe-fixes"
+	"drm-msm		msm-fixes"
 
 	"drm			drm-next"
 	"drm-misc		drm-misc-next-fixes"
 	"drm-intel		drm-intel-next-fixes"
 	"drm-xe			drm-xe-next-fixes"
+	#no msm-next-fixes in drm-msm
 
 	"drm-misc		drm-misc-next"
 	"drm-intel		drm-intel-next"
 	"drm-intel		drm-intel-gt-next"
 	"drm-xe			drm-xe-next"
+	"drm-msm		msm-next"
 
 	"drm-intel		topic/core-for-CI"
 	"drm-xe			topic/xe-for-CI"
-- 
2.43.0

