Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8209613B6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C6110E36F;
	Tue, 27 Aug 2024 16:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="YSvRnXWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81B310E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:12:45 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso588838666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1724775164; x=1725379964; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=piJPr55iEdZk5ZJwGTOr2RVcn9q807tLtC9WUC+Aa70=;
 b=YSvRnXWJA1p66sWu/Fftd3IBWfKxPmbwNXPSAOrIxMCwSGCaBW57uG6lUQsyzucGOU
 mmDN6wL2cmjfA07biYoIH59kooHckDMePMLdCgfV9PlgBeXVhtUFzk4W4bdhAQY0nuLS
 zO8lkmTzyw4xs1esxzYZjCOnDJlPNHzFExn3Ksb/Gn0L51pLXQS8zyvqjfhtq2rHDPvP
 iEXmtrfJBz8F9xBqRULXF8G0ybOZS6so+1Sfg3ZSG+l9SLNw+LpZYjptClfQnpP8buYE
 e6Dgsec8xgJNn3dsJdWWEmg2mvISSM4cSRnPa2hysDLQV5wMIdGy9ZUA4lXQtLxWkk+i
 kSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724775164; x=1725379964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=piJPr55iEdZk5ZJwGTOr2RVcn9q807tLtC9WUC+Aa70=;
 b=uAR79FCQldyxZJFKbPCaP7w89rTabaJRQaCriAIxo58YsouHaj9m51KtaDpZTNnFAO
 DCPjluaez6dY4Ezp4eh6IXAcQGriOfsGKsgRB7l3N7P+BUK0amIksEtaOkkJIv2hK7Pg
 Jf77/1GNP6xt5jd6ocGS7chPcupWDd5S7VUKfht5tw/T9fncHyvNR//tlouJwTUY4Jij
 bZuxcVRsTSgjqC+6q2xuTaWbiVUAmESIK6aXy39SFB8pd4JnStujsEnENzJgZW0ZSZ8J
 k4oVVNakUZ+IkIEUs1+YmuUI60d3LPW1YMRK/RJktel/oQ2GCWxqGu/MJIxsMefX7BCd
 38/g==
X-Gm-Message-State: AOJu0YzlrOLfuSIlVEa6ZIELZTl00RaLTL0NXVS+ZsfH4fSUZfAudFBK
 DBjKuNWx+h5vOCIdGwevCDlXrOPI8mQjb3DESsBAVaSBq+UyxYc7eEriUphvA/o=
X-Google-Smtp-Source: AGHT+IHW7b1aEQa8czupgCr/Z7h8PsBi0N06GP8cOqzjDQvW+B5ECoLogrJ2bT1xGLXCmUEfXQ5KRg==
X-Received: by 2002:a17:907:7246:b0:a86:b923:4a04 with SMTP id
 a640c23a62f3a-a86e3c1cfb0mr261149066b.50.1724775163715; 
 Tue, 27 Aug 2024 09:12:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54b50dbsm127893966b.93.2024.08.27.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 09:12:43 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: manikandan.m@microchip.com, dharma.b@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@tuxon.dev
Subject: [PATCH 0/3] drm/bridge: microchip-lvds: Cleanups
Date: Tue, 27 Aug 2024 19:12:20 +0300
Message-Id: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Series adds few cleanups identified while looking though the driver.
Please note that these are compile test only.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  drm/bridge: microchip-lvds: Revert clk_prepare_enable() in case of
    failure
  drm/bridge: microchip-lvds: Drop unused headers
  drm/bridge: microchip-lvds: Use devm_platform_ioremap_resource()

 drivers/gpu/drm/bridge/microchip-lvds.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

-- 
2.39.2

