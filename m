Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724205B1695
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2695210E998;
	Thu,  8 Sep 2022 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0810E998
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:13:07 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id o126so8152615pfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=VPow1DKAjakhyMLinUZ5Rwpgp/WG38k735WIpnbfb7k=;
 b=fDFpS6nHsOY3o4hTijEvnc/f/cbse/OgyA5dEFkmyLEvp/gzW/FXEiS2RGlEIrwdIw
 HmCqRbJ7AFvBqOb1QYCQ9Kcpp/ytZ18y55zxtKQT/urkAnyqDyS4x6Tw8n+i3oX6XTOP
 MmTj4pLb6jxhdRv4B02u1NB7HILtSBDQk/tEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=VPow1DKAjakhyMLinUZ5Rwpgp/WG38k735WIpnbfb7k=;
 b=j1Ewhb/1iqKxNiAbMq/yiV+Iz8yuHo/d+uBRal7SQjAUB6s30XXIas6ZR1jjX4iEsH
 F9c2WYIgAlnz03m3E6jlUkPlCYEtET2oBNiEvRyZYGJGM75KqUJcEdki6rCqk0/DD2Sl
 8khtTrXGEA+ZIRE7JZIbfPacVn03fb8eMOUHfu1C5s3CTq7aPOKxrKdgSoMriI/a2fP3
 en+S8wrQ05b7rI+L+DEjrakuibks6Op2o6CYrTl503eBXN4UHw8w+yNqTpLtmGPinihE
 +kWLDQjZOZeBtgy03LNsCiT+EF1MqQcb2EwEj5Wkl5jeanfKMl63wTtw9G2z1VZko4GX
 qAeQ==
X-Gm-Message-State: ACgBeo2U515Z2LoOuQNRbvvtdtZqxz1HxErBX3x3Yq8kVN1pVmcfO1h2
 As3CHqyJi+ZoF5V35cuRwd8yog==
X-Google-Smtp-Source: AA6agR6s1PjBNJxaXTuwtlqbVBgqnTDUccsB/SS5RWjYR0hxnrEHMT+quiiR/ejjlM3SUu6v3SD/iA==
X-Received: by 2002:a05:6a00:23c5:b0:535:5c24:68df with SMTP id
 g5-20020a056a0023c500b005355c2468dfmr7954279pfc.62.1662624786883; 
 Thu, 08 Sep 2022 01:13:06 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5237:c185:9b01:8955])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa79496000000b0052d4cb47339sm14159702pfk.151.2022.09.08.01.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:13:06 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/bridge: it6505: Power management fixes for it6505
 bridge
Date: Thu,  8 Sep 2022 16:12:56 +0800
Message-Id: <20220908081259.503236-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 2 fixes related to it6505 power management.


Pin-yen Lin (2):
  drm/bridge: it6505: Adapt runtime power management framework
  drm/bridge: it6505: Add pre_enable/post_disable callback

 drivers/gpu/drm/bridge/ite-it6505.c | 49 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

-- 
2.37.2.789.g6183377224-goog

