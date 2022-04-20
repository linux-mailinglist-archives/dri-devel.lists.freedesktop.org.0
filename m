Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77017507DCB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 02:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2510E213;
	Wed, 20 Apr 2022 00:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317D10E213
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:50:01 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id be5so282694plb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VKB6HDvcGAs5pP/g1gah8asLi98FXqiU4ymyeK//1h0=;
 b=Kc4ESBSPia/cNIoVMdlNZe1ccp6hY3K/p02oivOtUnMa/PJ9yg41l9GioIdxTakreR
 +wmlte8o0cfatZAOXedJ7iy5ogeA5Lz5cqDveiI/FXX1FUzEMTbW1gFR+/ea0bkhFtnq
 YMCWDvNoHvGfBV3C7t+ZUYTKa6O7Ta05PbKSSqegDhBCtkTVog8xzzSDspzo5UOtZTtG
 o9qp2Uzv0q1fUBvwdPTl0rZQU9vuH91vgXOwN4n/sCXkAgX9+Xq780RLLa22djGuHKbE
 1+HF+lAsKqL/Nhp9tJqxpcoVuB4n0o9SLqrEQQ9zsSrHeBjk2hpB1f2E7wrTiE1+NSzf
 6X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VKB6HDvcGAs5pP/g1gah8asLi98FXqiU4ymyeK//1h0=;
 b=6u0xkfCGoovG/EbW6yZVRB9cDFxZvB2ZKsOfdMxljjq4oun9FhCkui7Tmh2cVsN5L9
 rjhMIGg/XuKOdCkDpEy+gzXOF6i4Diw8y5Mx7DRymYtzqCr48o7SQfWPwTt8CE6+hLtv
 69cQ9TO3cHLUoV/jWbQLXObG81kH8i9f25zc0dK7Vz8EL5x4ffRtKwAwMRnhhnVcxUNk
 hPgdqBp7vrViA7zKOS5sfwse1cyBbV2gpV9l7u+/IELR3fQMOESDc4xV55WEOfPYiofj
 r281t+13in8Ja8Z25JqGYXyBcFIeW7yJ1eSCbwCmR1RLnqclubIXEerbsQnkOnv5l40g
 JOtQ==
X-Gm-Message-State: AOAM533NGfMIOj4OuXL+TnSO+2+3CFZevsjgydjAwJjxVIro23dmrSxz
 0Uo/ACFDjoSIQQ63GgJgtOU=
X-Google-Smtp-Source: ABdhPJz7D14J/CfXouEAadIMNltoG/iR5HKaWc0oBtRmB2SXvliv58bUSMnmAl+D9vQGbbf/VT7OdA==
X-Received: by 2002:a17:90b:4b01:b0:1d2:abf5:c83f with SMTP id
 lx1-20020a17090b4b0100b001d2abf5c83fmr1407149pjb.93.1650415801316; 
 Tue, 19 Apr 2022 17:50:01 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 g8-20020a17090a290800b001d2dcb75a0fsm4015500pjd.0.2022.04.19.17.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 17:50:01 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/vc4: Fix pm_runtime_get_sync() usage
Date: Wed, 20 Apr 2022 00:49:48 +0000
Message-Id: <20220420004949.20508-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220419124407.ugzl7hknsytbhrmr@houat>
References: <20220419124407.ugzl7hknsytbhrmr@houat>
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the device is already in a runtime PM enabled state
pm_runtime_get_sync() will return 1, so a test for negative
value should be used to check for errors.

Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync()
fails, so use pm_runtime_resume_and_get() instead. this function
will handle this.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- switch to pm_runtime_resume_and_get() to fix refcount leak.
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 752f921735c6..9d7ffaf6bc70 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -846,8 +846,8 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	unsigned long phy_clock;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret) {
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
 		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
 		return;
 	}
-- 
2.17.1

