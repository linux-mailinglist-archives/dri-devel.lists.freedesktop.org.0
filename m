Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D15709F2E
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1092010E600;
	Fri, 19 May 2023 18:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65EC10E600
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:40:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af1822b710so25406961fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9MfCat2/K/yUX1JaZQTW7hBT1/vztBWiCBBZbC5udgk=;
 b=inBFn9AzL77APjwvOMDHMRmeo0NnSTkH90h1WFwqtO/vhguriAdg7XAQeSXQhrcaYg
 S0R6I5gmE322ZLGCYDmSXi8fpfYbb3kfoHF7Ov2ISV2cGOSTMNgyOyjosTE4kXMrPCgi
 VbYeJP6IPbyPcZq79FURO7heVOb6hPnivlKWMg/ehrlV1Jxs2gPfcbfpsiYnTogiPZny
 NkZxNxnFXRsk2oYdY+dZ5d8duoqdK9Rusm5Ko2lRnhy417SeRiB5o4IRLRXJQvh/2ixi
 Dhjx8UmlkF94gmeTOYdx7cmqwNPjIcHed/JiK2k0ZB+ys2gZ7ez3gt7VYPzc39DihP4r
 48Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MfCat2/K/yUX1JaZQTW7hBT1/vztBWiCBBZbC5udgk=;
 b=dBPe+O7CBn6VCcnr8mHUDNCa6FpN0XOWwzV9hncXVsFu+luv+iB/7S+IO2Te3grXJG
 81+erDPw8Er5yRxx+1H3sds6IGV3MZ5brWP2RzsvM1IFsfnOb2GVoj6bvIyfz4JhtUyM
 zFh+kFNTKib5l1YSP4fJ/YWbnmEYKubtxl5Sepl7ETwF9gTlibIZDQc1x5XH54BohO5N
 +Guc+RSjTZ/FGjG1g63Po+YKaKymTRN+JJmnQabEoEEyCv3Zp+q2yKJmcOB4xwgymxjS
 xMbIvjsxNnuaT6lnZP3AA3hP0Q2hzGHhI+zhkoojjvGzqeIPbeI2gpqp8xLGN+BopYWQ
 m3YA==
X-Gm-Message-State: AC+VfDydjNp5sSXqB7DfICnnVPMB5uuynq1A3m8le7WSBK9qr68/Z2Eo
 nkbiApZhzvXbrAeWjUt6gmDk9A==
X-Google-Smtp-Source: ACHHUZ6mjw6xuqhF0duf6JoyEt6LcJKbe7mYoI3lNRv8QhuCw62yrwZSwt2NCSP5o9jpgSp5GTM6pw==
X-Received: by 2002:a2e:9c07:0:b0:2ae:e05e:76b4 with SMTP id
 s7-20020a2e9c07000000b002aee05e76b4mr1023300lji.28.1684521624776; 
 Fri, 19 May 2023 11:40:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm932493ljj.120.2023.05.19.11.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] drm/bridge: display-connector: add external supply
 support
Date: Fri, 19 May 2023 21:40:20 +0300
Message-Id: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the 5V pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. The dp-connector
for such usecases provides dp-pwr supply support. Follow this example
and make hdmi-connector support the hdmi-pwr supply.

Changes since v1:
- Changed the pin description to HDMI +5V Power
- Renamed 'connector_pwr' to simpler 'supply'
- Extracted the common supply-handling code for DP and HDMI

Dmitry Baryshkov (3):
  dt-bindings: display: hdmi-connector: add hdmi-pwr supply
  drm/bridge: display-connector: rename dp_pwr to connector_pwr
  drm/bridge: display-connector: handle hdmi-pwr supply

 .../display/connector/hdmi-connector.yaml     |  3 +
 drivers/gpu/drm/bridge/display-connector.c    | 61 ++++++++++---------
 2 files changed, 35 insertions(+), 29 deletions(-)

-- 
2.39.2

