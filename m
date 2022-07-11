Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451056D6F1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071CF10F94B;
	Mon, 11 Jul 2022 07:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625E10F94B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:37:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bf9so7265216lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
 b=Dff5xnUEbOFZ3krvJAHSf8q7CaTXArvxJlXk7Ac3HyhbEKI17xLdj82jioSmMlm9XX
 w8xoFuxHIHww8BPcbVRuoufFdfD7jps2p++JmURLyPi1RgpsYP1134ZQtzPDG54fMTf3
 F3RFPAuoT7yNsfclITwxtA04nUvhNVGVOuNnyriKbPUKguqIsSo8f+Md3SdeZK0mCD+D
 YE0zvcu2gKRHS5D0uN5iuxn2KKusizBR+r6J/wse4C3eHFF4BhgPrH9HzXX9SIpTPLG/
 r9UznThMZO4cAIb+8C6NnAuScTYnFu9qyKprEU8MZ5/zUrDQtEzviVaN6i2y6TTC5f+2
 3bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
 b=fvGGyt4SCUFZ51QPhX7yAZv+czNHIYfc5USeGxmfWGNzpgJ9LwhDIKfNnnvF1WXLzL
 aBGpWVj0xxwXWmuYvRlb8Va1HT1ZtXUIwREFpntLDfb8qDGCNtu6u677Fo+qnxFgUHSs
 b7GHoKr2GAJqfDBjHnStbWI96aZxX3MKOXsazgtKGE91eUheNPmUNdhAKil2eVYQmGSP
 FdavMYJ2vipPHilI9/KEnNE6mzNZDVSJ0fAzpqMskoEHuu1OIACjxLA1GqqyDYFnGqnc
 kAdBjBTSGP5hUQD1fUsmyo+7qySpr1F5oep1zHp2w/nrV8FohOwJDi0G7Zs3WlQJ+vUf
 1Qnw==
X-Gm-Message-State: AJIora/CtRkQb1kP7rOk3h3wSsdfgdO8JzUHtb+olXpccgRscTuTpBM4
 WsRd3E+vk7mGkMtZ28IisRj1fQ==
X-Google-Smtp-Source: AGRyM1tdY/eYp5/POtpprgNAZwPGA3AOCYoE4M26Kh7kOJYlFARkVpnWiqVOQjs7wCrImJPHpHs7bw==
X-Received: by 2002:ac2:4e13:0:b0:489:d699:5046 with SMTP id
 e19-20020ac24e13000000b00489d6995046mr4416536lfr.134.1657525054672; 
 Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH v2 0/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 11 Jul 2022 10:37:31 +0300
Message-Id: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An RFC (or rather RFT, Request-for-Testing) series adding support for
DRM_BRIDGE_ATTACH_NO_CONNECTOR. Note, it was compile-tested only.  This
bridge is the last one used on the Qualcomm platforms (in
upstream-supported devices) and thus it is the only bridge that prevents
us from removing support for bridge-created connectors from MSM DSI
code.

Changes since RFC v1:
 - Dropped first patch (conversion to atomic), corresponding patch has
   been already applied upstream
 - Added DRM_DEV_ERR_RATELIMITED to notifiy users/developers that
   corresponding connector was not found.

Dmitry Baryshkov (2):
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.35.1

