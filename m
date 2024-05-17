Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D358C8DBD
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D9F10E00E;
	Fri, 17 May 2024 21:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JXW27eGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA19010E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:35 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1edfc57ac0cso21851875ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981855; x=1716586655;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QQ2PInY+uC/KLW9XRBt6i2mdUuDTT+fEYpnbjgM4Q5k=;
 b=JXW27eGr4wEJU38uoLxtMd9/5o+CJJJiNf0ABpK2bTBK5flueS+zNz4a0axmpUQTOk
 fbUxZaQPsWPNQtd2h8Ki34YzlAFbgjB+Ci9NxHMlreSOg0EmbcD7reDIwL15IgbdAJMO
 GYZyM7y182ZlRQV0F0GjPvEDtj+zhWDmPWaj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981855; x=1716586655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QQ2PInY+uC/KLW9XRBt6i2mdUuDTT+fEYpnbjgM4Q5k=;
 b=GAM7ziMgqaHB2gkbCRcqKKykWcBoMYsrHsC5PwATpElqbs9x92GQ+Nf0hJTnLTCAHv
 prffWiOZUJFvmk3sCDt9lHLhNgr2cdavcawtl/zOgQRqDiBOLRg4HgbSWV5P6nE0EegN
 +I3pMjvv8aWZ/U+qqsxN/XkV2cDUCbC7REs3U11iPaYJlKCF5Owecdvc9fxgvuZcc7Fw
 ZRQryppLGHctjb+gH4YeFcCa2Ale5YtnyrdMUOJmEP5Hc8UwH0sEwdP6+oQcQUXYKkKL
 JxskhOddpWNAykXmt+NWW/YJXPXzVbDdtCzq5rvoT2JxDjCAxgUjNCLAs/HtV/TwgFlh
 w3VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMToTr+NN6Rgjrid2FrH35Zhq36MuaLS6LAY9YUqlanjEkflpnOrE4sM/l6h/ZY/skWhCcQm/9OBPmeZicyGwwHLJPRSIG8GYAVpzd42Fe
X-Gm-Message-State: AOJu0YxlOvCrLvhRkFLadpxaHfrXNhEuRLoCELOsVV0Z4eG+8yusBBLj
 Y3Y/HuXSkvYF6H7OGj0Jxw1NXgmcvVTHHhN9u7l95DafSxrCqDxoF+smIfiL8Q==
X-Google-Smtp-Source: AGHT+IE5ukk1eYupJDXgn9GYxBxWGiXIOAifNl3mLurCa9fk2quD0QLQybES+xForsch1qL2iYidFg==
X-Received: by 2002:a05:6a20:5a9d:b0:1af:dbc6:baf9 with SMTP id
 adf61e73a8af0-1afde0e6310mr20912711637.36.1715981855066; 
 Fri, 17 May 2024 14:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Shuijing Li <shuijing.li@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xinlei Lee <xinlei.lee@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] drm/panel: Some very minor err handling fixes + more
 _multi
Date: Fri, 17 May 2024 14:36:35 -0700
Message-ID: <20240517213712.3135166-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
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


This series is pretty much just addressing a few minor error handling
bugs that I noticed recently while reviewing some panel patches. For
the most part these are all old issues.

This also adjusts the new himax-hx83102 in a similar way that Dmitry
did in his recent series that included commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling"). His
series handled the panel driver that himax-hx83102 forked from but not
himax-hx83102.


Douglas Anderson (8):
  drm/panel: himax-hx8394: Handle errors from
    mipi_dsi_dcs_set_display_on() better
  drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before
    regulators
  drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
  drm/panel: ilitek-ili9882t: If prepare fails, disable GPIO before
    regulators
  drm/panel: ilitek-ili9882t: Check for errors on the NOP in prepare()
  drm/panel: himax-hx83102: If prepare fails, disable GPIO before
    regulators
  drm/panel: himax-hx83102: Check for errors on the NOP in prepare()
  drm/panel: himax-hx83102: use wrapped MIPI DCS functions

 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  8 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 92 ++++++-------------
 drivers/gpu/drm/panel/panel-himax-hx8394.c    |  3 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c |  8 +-
 4 files changed, 43 insertions(+), 68 deletions(-)

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

