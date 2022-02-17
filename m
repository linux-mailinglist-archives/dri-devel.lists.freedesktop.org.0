Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6B4B99AE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 08:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9710E8B0;
	Thu, 17 Feb 2022 07:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EE910E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:15:49 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso5487663pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAu6P2QjxVR4VUdAWpGZn10VmuVqrvEvsDKRB7LLSj8=;
 b=ArhKscJZcPm7XQ3BJ7/KN3FPzSOYv/PtM+QKvL00DYpeOEn9zcHQagtwvF82TAgWjn
 syM0c/Wjm0YF7G1i0gSI4U8s6bce8/e8PF2Nv+GIrNHPU7BKa8/JnwvJG+WabCpRWr2K
 6X8oMi8zAl+wu8zEGF0QAMOsNUV1HeDdbJXho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAu6P2QjxVR4VUdAWpGZn10VmuVqrvEvsDKRB7LLSj8=;
 b=pZG6i7cHVHsB8X5iQDfDsk7v/1a/iHVoy0lbwgNdCoY42eDDDacMOfT2fJj7JuWAhk
 AMFkiXY9V3+UwTdZW24RTbe95+cxUOVB6m+/TcEB1wZgzLWQ+Xyy8vX7LLKFidTO08T5
 VEmOnbcKa0CHBN/+aIKtMpvx0Sp/YVVMxWnZl3f4pT0P6PeEBQxv2SMzs044b8siZozh
 TV29Cu8IVcsQU1Q6vnwtW1O8q6lZgynDHjGOTaHfMp/Axdha3QK3CyhTAw5Wvg16zYaX
 HnlkV/Y4BAfnuvesLlX9tOGZGP7MOmtbotQ9f3wMXMR6bZdoEU3OgyyKKWhwV2rL4PlJ
 v6Mw==
X-Gm-Message-State: AOAM531oIVjOrJZ+lYC0DSPZKK5DlUn5eWkZo3j6nsw8LuYKLpc2erWn
 p4A6bQRa7RVDBkaAJLDXfNG/bQ==
X-Google-Smtp-Source: ABdhPJyij8njo8LHEu3kVSs14z7Mv7QPOJtWnoJ6OszqSof5dd5sEUcVpUbNA9FPDeGyiosL5DqPbA==
X-Received: by 2002:a17:90a:470e:b0:1b9:c33f:cd49 with SMTP id
 h14-20020a17090a470e00b001b9c33fcd49mr5902879pjg.186.1645082149123; 
 Wed, 16 Feb 2022 23:15:49 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdb:2c0b:b1f8:e426])
 by smtp.gmail.com with ESMTPSA id g21sm5827578pfc.167.2022.02.16.23.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:15:48 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>,
	Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux
 command.
Date: Thu, 17 Feb 2022 15:15:41 +0800
Message-Id: <20220217071541.1722057-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's observed that if the previous transfer didn't end with a command
without DP_AUX_I2C_MOT, the next trasnfer will miss the first byte. But
if the command in previous transfer is requested with length 0, anx7625
can't process this command. To make the case simpler, request with
commands without DP_AUX_I2C_MOT bit.

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 633618bafd75d3..050616c1162128 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1703,7 +1703,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 		ret = -EINVAL;
 	}
 	if (!ret)
-		ret = anx7625_aux_trans(ctx, msg->request, msg->address,
+		ret = anx7625_aux_trans(ctx, request, msg->address,
 					msg->size, msg->buffer);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
-- 
2.35.1.265.g69c8d7142f-goog

