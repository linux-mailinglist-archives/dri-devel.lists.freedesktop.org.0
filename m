Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691038C349F
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4CF10E045;
	Sat, 11 May 2024 23:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RVMZ00Gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62F10E045
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso3703514e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468426; x=1716073226; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w1crgjrJgHOKBr+imw+Nt/0ShicbgCAQX722QtzGop8=;
 b=RVMZ00GhlR38LcPFU355KMQ5k4c/OTHGR2xHul/ISGatQQH/zAbOYY0Dyy1CGI3ee3
 zufTu+M9DmxGkTJwQLg+Pjc8glzLeSM6A+c6cvGFFA3RpvxFtSRCmLGs2MVbDxz1N48G
 gSbEPI4aocq06DmGKL85Nkf2au4fu+JFEP/US4qn9+ITwYgDaP2Kr72K1BOgmdY5fnYa
 bhqeDphXQTFOJ+1fOdIU0uVfM3QpThPMfDnL3+pgg2ku7ZVT5ZQHCcw9gup8scJk9jjt
 eT35mKIvdyUMvoQJkUz825YRONmr8amEH3Lgsw5Ajb6q7XWinGcmIUnywgRSESRhme1m
 jKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468426; x=1716073226;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w1crgjrJgHOKBr+imw+Nt/0ShicbgCAQX722QtzGop8=;
 b=k/MLkmtTqbhRbEz0JTOcOJ/2uk1xaMC5dD7pi9anA2J/9eLTqaYrA3waF5bu7W9/yl
 ZxlKbOkfH4K0VwUgaacSDSe5Z7OqP+Ts7Kr0UrQfOv7iqbDCWqqfUr3A7M2JirZQfCIp
 43j7If0sjcOpeDFIrWpKI+9f4ENb9j7fx/lMNR5SQZ7xx4uNUoUmciBTeR+a58DBD0ZG
 Qq790enhfVXmqQxZccE72R10NIMdwZddVPjGePvWlhdoZUNc85Aw5fgnOBSDGNpYNbcx
 jsYMqMA0c1cqZDmsVv91UWfyZd0HbW5z5T8GPUz8ykVx3TcdV9xugyUN12yzwXiEuP5Q
 cT2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR9oZoPPyqJpwvTCTOgDOrb5+cyfTcNqaFEXuoYtefuMN88ODyhroV2FM4QKxrjzyWOvgOnQq75mmtPkRq+b/dGIhc41sXkrJksRuw7RFf
X-Gm-Message-State: AOJu0Yy7WX0WzLJv1ljqOk95qylXIhFd0rMFO83awByH7lT3SYAm1I4c
 L4ACTcXQb/+5LjEOFcFvrM/Lx1DxIu4KjvIPuwrLjFH8T7R5bF/KIjYI3c5V3gI=
X-Google-Smtp-Source: AGHT+IHOGC+XRG2Kq/VfByDdZEWx08N/OcEscIp/vQc/nukNXhNojPs9d+F3zg4lu3WjZRcCkjlBRg==
X-Received: by 2002:ac2:55a4:0:b0:521:533d:6367 with SMTP id
 2adb3069b0e04-5221027bad5mr3264708e87.63.1715468426639; 
 Sat, 11 May 2024 16:00:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/7] drm/mipi-dsi: simplify MIPI DSI init/cleanup even more
Date: Sun, 12 May 2024 02:00:17 +0300
Message-Id: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIH4P2YC/32NQQrCMBBFr1Jm7cgkVlpdeQ/pIk3GdqAkIdGil
 Nzd2AO4fA/++xtkTsIZrs0GiVfJEnwFfWjAzsZPjOIqgybd0lkRuiwYjecl4ys6NFGw7S7GjXo
 kJgV1GBM/5L1H70PlWfIzpM/+saqf/ZtbFRKeVGe73pCztr8t4k0Kx5AmGEopX6G9Al21AAAA
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GhJMJKGVASCLWmDBvP3xUjiHWJu10Z7FtTbPQeRjNs4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iIfiL837D5WZQ2bWaZtrjxYgMPZDItB4OxM
 ojSbdARTaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iAAKCRCLPIo+Aiko
 1fdiB/9+QLRt7ECfH3CzlQmvUmSg5waLTJLqtQvSjUmr71DqTi+fKsZbgXnf33KmfC2IABElpwm
 Nj0WJzND7JoeSolP8g+ww3fpHOj+xHWIQNgOkrB3WSEKxwuTtkA8p0gvNbqquU84NNnMcjqDTGk
 oq+kQ7GAK5TQn1Zlc4/P/n5TeJVsY4GUGysPLZ2KNXJdcw4TzxBB2hwYFL99SASG6i84ZaGtgsp
 Q1VFderVjXIFu4ubx8f2ODnvN2GA11XXXbWgloZ9/mdsr9AdNAbOT0P6q8Po6Tx6Mc8HC4OfX1E
 WYTgEnI+ndySL2JorOGx7F94j1j+WOxttx193ePxlQCf4D6r
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Follow the example of mipi_dsi_generic_write_multi(),
mipi_dsi_dcs_write_buffer_multi(), mipi_dsi_generic_write_seq_multi()
and mipi_dsi_dcs_write_seq_multi(). Define _multi variants for several
other common MIPI DSI functions and use these functions in the panel
code.

This series also includes a fix for the LG SW43408. If the proposed
approach is declined, the fix will be submitted separately.

Depends:
- https://lore.kernel.org/dri-devel/20240508205222.2251854-1-dianders@chromium.org/
- https://lore.kernel.org/dri-devel/20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rebased on top of Cong's series
- Fixed mipi_dsi_compression_mode_ext_multi() docs (Doug)
- Added do/while(0) wrapping to mipi_dsi_msleep() macro (Doug)
- Inlined boe_panel_enter_sleep_mode(), ili9882t_enter_sleep_mode()
  (Doug)
- Dropped error prints around nt36672e_on() and nt36672e_off() (Doug)
- Link to v1: https://lore.kernel.org/r/20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org

---
Dmitry Baryshkov (7):
      drm/panel: lg-sw43408: add missing error handling
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API

 drivers/gpu/drm/drm_mipi_dsi.c                 | 210 +++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  81 +---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  48 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c  |   9 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c       |  74 +--
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 597 ++++++++++++-------------
 include/drm/drm_mipi_dsi.h                     |  21 +
 7 files changed, 583 insertions(+), 457 deletions(-)
---
base-commit: 7dd7a948b03724e4c63271bd96830059bc62a1ef
change-id: 20240510-dsi-panels-upd-api-479adb2b0e01

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

