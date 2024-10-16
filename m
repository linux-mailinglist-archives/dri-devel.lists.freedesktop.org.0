Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3E9A0810
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 13:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3380910E10B;
	Wed, 16 Oct 2024 11:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cXuXtPCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859B110E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 11:08:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e61b47c6cso2800410b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729076927; x=1729681727;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4u1X+4asBMPU91TR1WAl6Ub71JuEkCWwBm90GJmfMc=;
 b=cXuXtPCBI0lto2FS9AtkdCKTS2zFeqY+/0H0FETMFYV1jaYbeXMQ85L49wEl6nLEX5
 PQtEhSlq8mzVChOqvWLrIl0HQYGXxUui8T6iH3GAd9AJ7UtwAntqlAY9db8wz44kckfU
 4gprdHucXvV08T5c8JJx0xXUfiyeQ59gS8jJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729076927; x=1729681727;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4u1X+4asBMPU91TR1WAl6Ub71JuEkCWwBm90GJmfMc=;
 b=gEkxzM678Njd/Ia+X9KZK7AhJE+f/ICR38vY9b/fVP6tQnAyOn5c3cVwAq7Ccduf79
 Gk7cTyVpPJJxQROD84BS8UBqcmgY8eWE2MLfyL+QviNiVAmIY8BiarFWN3mRI81KyQF7
 v6tbtjA9IQ907fc3xfZGlAnjUE2FdiOvUXqbrTIwFD0LpJTEc4kpL3RDhCOxY6u+QPbp
 gEOXKNdWkyPX/rsVnEySim7i2lU8ofZsP70LqlIPGGr71jRPD/R4K8+jpPmjHKQCBcDi
 WPYF5lZ+2ctfIbh6UNhpF4hkk07m9VPiDj/NltnCjZH3G1+Mw46zD9AMDB0LK/GZOYjp
 4uHg==
X-Gm-Message-State: AOJu0Yx/GmENduJzWmbR2xlLKpgFC4HZXNxzeo27ulMk1X3210xWenpH
 6vL3OSvKxOji3idNhbwurusNucWJj5fRmeUTfgTn14815gfNpmAOalA9jYUpaw==
X-Google-Smtp-Source: AGHT+IGbiRRm9/GVZ2H2pkAbe5Hh0MuXI6tyXwqFg8lOcZTaM/hUsZa8Rxc3qKSg6bWgPyMziv1sPw==
X-Received: by 2002:a05:6a20:d504:b0:1d9:542:8d40 with SMTP id
 adf61e73a8af0-1d905e99a58mr5466764637.5.1729076927053; 
 Wed, 16 Oct 2024 04:08:47 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com
 (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e773b13a0sm2826188b3a.77.2024.10.16.04.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 04:08:46 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 16 Oct 2024 11:08:39 +0000
Subject: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-color-v2-1-46db5c78a54f@chromium.org>
X-B4-Tracking: v=1; b=H4sIALeeD2cC/13MQQrCMBCF4auUWRvJxKaKK+8hXaRx2gzYRiYal
 JK7G7t0+T8e3wqJhCnBuVlBKHPiuNQwuwZ8cMtEim+1wWjTokarfLxHUWS0paMdutY5qN+H0Mj
 vzbn2tQOnZ5TPxmb8rf9CRoXqYAeNo9PuZLqLDxJnfs37KBP0pZQvRosOf50AAAA=
X-Change-ID: 20241015-color-e205e75b64aa
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dianders@chromium.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
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

In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
OVL"), some new color formats are defined in the MACROs to make the
switch statement more concise. That commit was intended to be a no-op
cleanup. However, there are typos in these formats MACROs, which cause
the return value to be incorrect. Fix the typos to ensure the return
value remains unchanged.

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Clarify that the commit get fixed was intended to be a no-op cleanup
- Fix the typo in tag
- Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@chromium.org
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9cf7864728dcb63b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,8 @@
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
-#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241015-color-e205e75b64aa

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

