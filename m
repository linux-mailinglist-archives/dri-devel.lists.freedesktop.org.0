Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95666938BFC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9806110E488;
	Mon, 22 Jul 2024 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="P+p/Rsi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1110E488
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:24:43 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fd65aaac27so15203595ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721640283; x=1722245083; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VumjMZEwUWBgDMHY2K8ArTMwJEHcLMaWA0OatEGrAqY=;
 b=P+p/Rsi2qpe/lyNv2uYRaNwdo4StSncSfk7YCpsfSEo7kCEiOO8KHqmuE7+WiOgSql
 DXKuoLEPxFKKp54h8ryxIEIUweZfotPUA1gTpiQdx/3rwsyNDp1odoF63JXZlP2zQ+pQ
 XPGWCyqKJwt/TQAXl5kFQeDAGG3OoGONGMaOgmtVp989EEPhGVmqfEbbUI1UgiA2gLv6
 kJr4afIWVNFnXrL9SfEjVA6RVLECTa3Je3dcc37o40CsT+vJ8EzFrrvPnxBMvPSSTgZD
 bHvzpkuaTpf2rkR0o85Rem6yilg/banwsWv4KBmFhBJfEVys+LinXCneotRTIIvMENhY
 E2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721640283; x=1722245083;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VumjMZEwUWBgDMHY2K8ArTMwJEHcLMaWA0OatEGrAqY=;
 b=rXWXlSf4W05BNeA5DQuLmDDJB85HLbBPAnSVWyirjbHI6HWnEMh9LHIE5Bo+64V250
 UCG+kLnuvn7XoP60pElIiKhE1VvN/joAOmcMQdcag6xtrbx60MAWOqICnJL13fBCaYfg
 DDKTJLEC4+z1ejhaetWIlZzqyIRwoL6LO1iJwn/nVh+ANm/ctE25MLlVyruu6f+tEAuI
 aT/c7df2R07EBguv7tXv8E/D3lAPJuZot3Lk1o8EN5yDCdwPxwN8MshQtD/xB6nv8VZy
 oHPdNvGUsm20EtyOFoAoo+bL9OWXJ1QjldB3UHhNVv+FPY6/VNEbhHIp5jA1GxRs3EPP
 MFXg==
X-Gm-Message-State: AOJu0Yx/8jGbfgJ8k3S6CD1pUFboaDBcVD1lVKdI4QcmMvtghB0/iPG/
 TnLrMUKcVVVQXHXzMvi2hgVG/EkAkMAXvCHqMt3UhABEdkn+gN1QLPKkGbhiaogGq9+QahHS39A
 ILZo=
X-Google-Smtp-Source: AGHT+IGJ+uvD9+yLKvevm6ajJFqdrqJc1OpiqXZiUgLLrUs/hmPSnu+ZQsCsNmS7e+iL5Byj4jAfaw==
X-Received: by 2002:a17:903:234a:b0:1fd:7432:16c8 with SMTP id
 d9443c01a7336-1fd743219a7mr120075385ad.10.1721640282674; 
 Mon, 22 Jul 2024 02:24:42 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d26efe61dsm1639901b3a.149.2024.07.22.02.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 02:24:42 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] Modify the method of obtaining porch parameters
Date: Mon, 22 Jul 2024 17:24:26 +0800
Message-Id: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Also switch to the drm_connector_helper_get_modes_fixed() function 
to get the porch parameters.

Changes between V3 and V2:
- PATCH 1/2: No changes.
- PATCH 2/2: Keep bpc settings and drm_connector_set_panel_orientation() function.
- Link to v2: https://lore.kernel.org/all/20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: No changes.
- PATCH 2/2: Switch to the drm_connector_helper_get_modes_fixed().
- Link to v1: https://lore.kernel.org/all/20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
  drm/panel: boe-th101mb31ig002 : using
    drm_connector_helper_get_modes_fixed()

 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 20 +++----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

-- 
2.17.1

