Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65116616FE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AAA10E078;
	Sun,  8 Jan 2023 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC7E10E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:56:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bt23so9496472lfb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
 b=uYauKdgwq2husrEqlbthANQI+mK+yFDi8k3sa0byDLOOm+6NyM/tTVNf0gooCDRvHh
 TreprhmfQ6gm1B340FRGqx4ILphCrkz+5EeRV4ds91FpVi+31sN6Zi+COdCxf+U/6k5C
 2QUn6q5Y5+f7phN5GgGVAj2AHxJu/kepcl3lDu7/jmXMK20+vpUqaN6ITOz+vyA6f/xW
 GIAyIECVGh2FA6NqaiOB0I+NQSDktLdnks6obnsGLQLVx0QLkTv73+CNPnzmN+BNWlY4
 g7jBtiXgDA17+YtIntY+3KWaoT/MnV+T3nLGi7RzMCm0VOH3zLYyotu+qAST257Nobdv
 x7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
 b=mdGitNTYln5KHN51bgBNiSJXiqdG62X3aZsrAMOCotwifoJUob0zMQ6wTh/IBWTQrS
 WR9UIn+H5eFmREpD/kzZulhz0wi29PKrFdihf9xLRC+tA41+N4jbBzfsHAeTdJvSwJcc
 Zf1PzvznROaFoqtrPJnwbJC46ZLVpGrKnZMoP9lG1t2ng9k7cnF9cm6aYak8aSXhYJeE
 nO1xtkQ+J/sPq4ZGsKujJkwJF0l7Shb8xRO7w4dFAtv30BVIuqM+xXDCrtFF1mexOa84
 yMIsKFYBvcWc5yKr0nQrF56J0PArV817vB+sEor7+3vrkQT0M7m0ZcHK74gGGtqMb3dY
 INiQ==
X-Gm-Message-State: AFqh2kpq4/GlQ5eQOr+giuDcvyX0PmDhCjlCeD50tI2EnYso4oohwMub
 d+qIKddhjHvVmH3sfiVhV/Mb0w==
X-Google-Smtp-Source: AMrXdXtmsgU+7bRE7IrRO3c8IZ4YXWbGiOa2nHIZQcjxsFyGPcOy9ExkJhV3ACmWtJvJnAMZ07mZQw==
X-Received: by 2002:ac2:5088:0:b0:4b5:688e:ee10 with SMTP id
 f8-20020ac25088000000b004b5688eee10mr18367932lfm.16.1673197017690; 
 Sun, 08 Jan 2023 08:56:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:56:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/13] drm/bridge: lt9611: several fixes and improvements
Date: Sun,  8 Jan 2023 18:56:43 +0200
Message-Id: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A series of patches to fix mode programming for the Lontium lt9611
DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
platform).

Changes since v1:
 - Fixed the double-DSI check to look for the lt9611->dsi1_node rather
   than lt9611->dsi1, modesetting happens before lt9611->dsi1 is set.

 - Added full dual-DSI support, properly enabling the 4k modes on RB3.

Dmitry Baryshkov (13):
  drm/bridge: lt9611: fix sleep mode setup
  drm/bridge: lt9611: fix HPD reenablement
  drm/bridge: lt9611: fix polarity programming
  drm/bridge: lt9611: fix programming of video modes
  drm/bridge: lt9611: fix clock calculation
  drm/bridge: lt9611: pass a pointer to the of node
  drm/bridge: lt9611: rework the mode_set function
  drm/bridge: lt9611: attach to the next bridge
  drm/bridge: lt9611: fix sync polarity for DVI output
  drm/bridge: lt9611: simplify video timings programming
  drm/bridge: lt9611: rework infoframes handling
  drm/bridge: lt9611: stop filtering modes via the table
  drm/bridge: lt9611: properly program the dual host mode

 drivers/gpu/drm/bridge/lontium-lt9611.c | 332 ++++++++++--------------
 1 file changed, 133 insertions(+), 199 deletions(-)

-- 
2.39.0

