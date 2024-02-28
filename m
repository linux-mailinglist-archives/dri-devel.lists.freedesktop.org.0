Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D986A4C1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E5B10E524;
	Wed, 28 Feb 2024 01:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K1HpPHrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52D610E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:11:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d911c2103aso29476985ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709082697; x=1709687497;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5Amh+qBo3n8SZ1SFRORiYxCnsIvquzWzeGyrkguO0Y=;
 b=K1HpPHrMk+7OVSo2HuTszoHCdp0bEVwEAt8C77A+nJyIzFkWLMcQSgpL/iCcl3CYIR
 BrADmpJkYCx4xxkqeYKyU7Tx3Nd1iYrlIsI3yNEZCJmr29YxtlTzgYiB/BnCFnBoOtRa
 tpVdCTw7xkfmOgvm+2C4GMfIC7nnxhQshXL2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709082697; x=1709687497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M5Amh+qBo3n8SZ1SFRORiYxCnsIvquzWzeGyrkguO0Y=;
 b=sw+8uO7OGhouyh+vaA6ZU343DRnXIJidWWC1gV/mB5iUIp8HzOBTgDUp3p1tAd2yvu
 tqL4MSaFLz0ofWXHT2mBzbCuOG/MiBrJStZlhyLoqXlpCpvLVcOj2f6Cz9I8qwcCAieK
 Fj3BH4XCRuQOa0hbVWSNPRn9cB0Q7OYh7otDDW27q0J+8YW0LH6eeBt5Kc94qHhMLwmY
 /uosa+gEpbqJ0E3sbsKmx5nNC4L8Gp7Yn9neprLP6qYWDf95cVDUHG2QWSQXMFl4Lc+g
 cRXU57wK7fr2S8lVPt2CcUAMvw8PsotyfKRGVagF0nzEs4oDTC+qHprue4TvrLdWYC8H
 l9Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOYnSMSRRQcGNDJ7MxAW0PTC+364/ctYqsjPawX0nXnjkbTWKLzrgFt9mvZxupznEvMtKNVGcKFUbTkxxg5q2St6YRf+b1lv9d89OaQUCI
X-Gm-Message-State: AOJu0Yy59nDUC0OASOcQQSXKA1YAPyTFXsLa2QC37IqURDtTa8XTTTMv
 uAZA/t0Op+FKcyC72iaSwAJ8v+XCItjv8w+cEndbbtuq/EaiuOp3ucfqi+oIvQ==
X-Google-Smtp-Source: AGHT+IFOFY88+LTSShatdwzqVAAC52XPnhIZWlpmq8/WxiTnE6WOCWIgXgVJWb5hCTv/yF5NF+ZYbw==
X-Received: by 2002:a17:902:c946:b0:1dc:7ca:36de with SMTP id
 i6-20020a170902c94600b001dc07ca36demr13094236pla.9.1709082697093; 
 Tue, 27 Feb 2024 17:11:37 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:87d1:e95d:b670:4783])
 by smtp.gmail.com with ESMTPSA id
 kl14-20020a170903074e00b001db4b3769f6sm2131529plb.280.2024.02.27.17.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 17:11:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Match panel with id and name
Date: Tue, 27 Feb 2024 17:05:57 -0800
Message-ID: <20240228011133.1238439-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
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

This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
product id. One of them requires an overridden mode, while the other should
use the mode directly from edid.

Match the panel for both name and id. If not found, fallback to match id.

v1: https://lore.kernel.org/lkml/20240223223958.3887423-1-hsinyi@chromium.org/T/

Hsin-Yi Wang (3):
  drm_edid: Support getting EDID through ddc without connector
  drm/panel: panel-edp: Match edp_panels with panel name
  drm/panel: panel-edp: Fix AUO 0x405c panel naming and add a variant

 drivers/gpu/drm/drm_edid.c        | 114 ++++++++++++------------------
 drivers/gpu/drm/panel/panel-edp.c |  61 ++++++++++++++--
 include/drm/drm_edid.h            |   3 +-
 3 files changed, 104 insertions(+), 74 deletions(-)

-- 
2.44.0.rc1.240.g4c46232300-goog

