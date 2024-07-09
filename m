Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACF92BBAF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F45810E552;
	Tue,  9 Jul 2024 13:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="U1v7rBo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCED410E552
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:06 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-76cb5b6b3e4so1652357a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532886; x=1721137686; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twhm5JhqawxLSrtm/hP6nNR4BfXjcByvCQnSymdx3U8=;
 b=U1v7rBo3+/EHyzbKfpeDlywvyclz/rc4blkwJZ+MstP+8OUGXsmFgFxUn6Chj8cGD7
 NkjsTf7ePUsuT6D5WPQXL27aV1D3o0doT/NTq/e8RV67e1PzpKOVVhcThvy3ntrxf4i/
 ZRzESEGKr1wOjDIEV4FYnm9unBx5XRuw1N19X7UfBOQT8qxv+dXC0m9PEJrN0IlXQ81Q
 2xwvjGbmSotXTJfcBMuPiZFqBhNZ7tcSQbRumlumgdoiQDLgiq2oj989zGnDVAZuCIq0
 s+YlZMwk91JvlpRYZt1RpavN53YgVRXv2Umbu/WIy6OiOEZ/7ubxU3TXpUpBvqqxYsXJ
 0DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532886; x=1721137686;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twhm5JhqawxLSrtm/hP6nNR4BfXjcByvCQnSymdx3U8=;
 b=Z+5vORlXWDM8oCDKMtNup+9lE7Pumeqxs6kDHcexjxNH7VAA3ZHRZSX5MawD/MDrcK
 vLnX1w9hKqyAVjoQerM0/KOfPy+yMN++6S0kZ/IagQAhA9PCMwa+hpoIB1BcZO8RQ9Mc
 QwMyuGzwSDqxV82GzVj9P1SLiTCNhPH2SOhU83zB4P7etWVJ2xwStLT6jDs4hHy+jRKg
 Utbr1ZsmPBN95z8vbJlDYEGkJ/QOScLodxONVCFI6l/tBqKQ+DE2SjZ17Jl0o8qwkN5c
 2VSeH94kvF1h0au6M57PBM8EcbG94h0Ymh+nfn8fO7B4q8n3uXxlMWSRcbOaSjfJke35
 gIXg==
X-Gm-Message-State: AOJu0YzcJ4St5ysuVnXF+4aPsEUvdqhxgcKxjZbwwh0lkmATetg+vza6
 suGhsWsnoJX7CLC6uOE/hAkj1pZO9mOh7rE2cnaKHHI20mh40U6e4hlfk6Zb+N0=
X-Google-Smtp-Source: AGHT+IFKbx+aySEWXrw9l6mO6v2Qj5MAZYg+fkIy6r/nddJ2H4+OlIRSpHezE5qwyR7Sturj8RgDEg==
X-Received: by 2002:a05:6a20:244e:b0:1c0:bf35:ef42 with SMTP id
 adf61e73a8af0-1c2981fbfdemr2877962637.3.1720532886039; 
 Tue, 09 Jul 2024 06:48:06 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:05 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 0/5] Support Starry er88577 MIPI-DSI panel
Date: Tue,  9 Jul 2024 21:47:49 +0800
Message-Id: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

The Starry is a 10.1" WXGA TFT LCD panel. Because Starry-er88577 
and boe-th101mb31ig002 have very similar inti_code, after 
discussing with Dmitry Baryshkov, We will modify it based on the 
panel-boe-th101mb31ig002-28a.c driver instead of using a separate 
driver.

Changes between V6 and V5:
- PATCH 1/5: Corrected the use of "->init" in struct panel_desc, and modify indentation
- PATCH 2/5: No changes.
- PATCH 3/5: No changes.
- PATCH 4/5: Modify the commit information and "reset gpio" binding.
- PATCH 5/5: Add two lines of init_code (D1 and D3) to modify the internal resistance of the mipi channel.
- Link to v5: https://lore.kernel.org/all/20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
- PATCH 1/5: Add a new patch, make it compatible with more panels.
- PATCH 2/5: Add a new patch, change devm_gpiod_get() to devm_gpiod_get_optional() in the Probe() function.
- PATCH 3/5: Add a new patch, use wrapped MIPI DCS functions.
- PATCH 4/5: Add it to the "boe,th101mb31ig002-28a.yaml.
- PATCH 5/5: Compatible with starry-er88577 panel in panel-boe-th101mb31ig002-28a.c driver.
- Link to v4: https://lore.kernel.org/all/20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- PATCH 1/2: Move positions to keep the list sorted.
- PATCH 2/2: Adjust the ".clock" assignment format.
- Link to v3: https://lore.kernel.org/all/20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- PATCH 1/2: This add the bindings to panel-simple-dsi.
- PATCH 2/2: Add a separate driver for Starry-er88577, and Use the new mipi_dsi_dcs_write_seq_multi() function.
- Link to v2: https://lore.kernel.org/all/20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/4: Delete some unnecessary information.
- PATCH 2/4: Use the new mipi_dsi_dcs_write_seq_multi() function, deleted some unnecessary functions.
- PATCH 3/4: Add compatible for Starry-er88577.
- PATCH 4/4: Add starry panel configuration in panel-kingdisplay-kd101ne3 driver.
- Link to v1: https://lore.kernel.org/all/20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (5):
  drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.
  drm/panel: boe-th101mb31ig002: switch to devm_gpiod_get_optional() for
    reset_gpio
  drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS functions
  dt-bindings: display: panel: Add compatible for starry-er88577
  drm/panel: boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI
    panel

 .../display/panel/boe,th101mb31ig002-28a.yaml |  21 +-
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 303 +++++++++++++-----
 2 files changed, 236 insertions(+), 88 deletions(-)

-- 
2.17.1

