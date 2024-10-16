Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A49A0C5F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 16:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F22210E71A;
	Wed, 16 Oct 2024 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YQw92MtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03910E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:17:19 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20ce65c8e13so29677135ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729088239; x=1729693039;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EVKER3hv6evoPvIqFuw9dG82LeQOTjgI9oXF+N5WCUE=;
 b=YQw92MtHmb5Q2qCtgj1N4clZ8C0vkfAGfMNeTRatjBBeHb+dPZO0HnHQ+4htMJ/BED
 iemmPrJU96iFt+eBMu3iQ7QHHDSXvDGChbJ2PBWN/jywIlF90uOes/bumEWTT2hXjW9I
 SbJmPo2C6Cl+crC6vynOFFJR6uyekTw4vaQ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729088239; x=1729693039;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EVKER3hv6evoPvIqFuw9dG82LeQOTjgI9oXF+N5WCUE=;
 b=WPKWXKDGBMtgWLrNJyC/rSJEersDpueqIi/TVW485u8d1XxRb2HDlwcapo+x131KJU
 IewSstC3ysFyDiBYLZnj7Wg+b/OCxdgL9vhHbSb6yYWHLWaPbXIp8JgwquEjPtAbdP7q
 rpvLLjjhkEHR/6MjjcolD/uG20dC7xohVasMbyiCVY+n17EQs6088JPk6OpTuMtg5w65
 h6rGmvIkfvdVQ7uha6WmM1KNK6C2deG7v7sxUHMg3JrZaXmcMo78BUxFOjaPnVD9tB3b
 /a9c+V7ygpWS44GP+uldShimSp8Mfgs4qpmrieeJ2CJSctRb9wbhDUUQYf0QDQ+QLEgW
 ui1A==
X-Gm-Message-State: AOJu0YylFzkoM79v5RWDQH4T6kpxnfWDEJsFBmJ7hx5oTICnP5OAiyIV
 iGnc4bopcjaLbXiUpp35UKHMNXBaO5Z8VialALX4FVCSpRdiPceQQpRIYLylBA==
X-Google-Smtp-Source: AGHT+IGZHtq9NBH/rxgUzuhq/wqmFAtg/Km4mXJX3jx3iEj2labIFGH9kDPhLj3+H6UaQUaFSyyVpg==
X-Received: by 2002:a17:902:ec83:b0:20c:5404:ed69 with SMTP id
 d9443c01a7336-20ca167bbbbmr242478095ad.31.1729088239049; 
 Wed, 16 Oct 2024 07:17:19 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com
 (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d17f844ecsm29243015ad.14.2024.10.16.07.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 07:17:18 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 16 Oct 2024 14:17:14 +0000
Subject: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOnKD2cC/12MwQqDMBAFf0X23JQkJlF66n+UHmJcdaEaSdrQI
 v57o1AoHufxZhaIGAgjXIoFAiaK5KcM5akAN9ipR0ZtZpBcKsGFZs4/fGAoucZKN0ZZC/k7B+z
 ovXdu98wDxacPnz2bxLYeC0kwwUrdcNFZbmtprm4IfqTXePahhy2S5L9ofqLMojJto11VW626g
 7iu6xcSdymQ1gAAAA==
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add missing Reviewed-by tag
- Link to v2: https://lore.kernel.org/r/20241016-color-v2-1-46db5c78a54f@chromium.org

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

