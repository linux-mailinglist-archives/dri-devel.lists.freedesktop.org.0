Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C8C488C04
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 20:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAC310E24C;
	Sun,  9 Jan 2022 19:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5510E24C;
 Sun,  9 Jan 2022 19:24:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso8497355wmc.3; 
 Sun, 09 Jan 2022 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7KLjfPHsWfXinvdT9x6SwzVroZgq92QvU7YFU5ZeWM=;
 b=eJ2muUDWeSDar4I1sLFaTGZhcHvqAdSpGMogP4fuj4m5J2xdYuZQPEszkuQHAbE08C
 fy20TVvX4eSaHLy986Oe8RMqcP62rOxSFOpaAvq+SGNKos5U2QTn73e8xJXEUK5TugXp
 BPztQRIxS3ET5kmCq2F8hSY/4zEwfidL2fwngro2M2GsXgGYLa8R10h4tC67IALi9dcJ
 rmvEvIoTD879fADNyXMYKP7xX6rO92qnN5sCdzgfjWVswCg5pOHTbCeuufsZKAoTqrut
 CSQp8CU2czG+ZiucpIEDGWIbeFiWI1xFyhUJvfD9ILlY+6e3Za2UTPxwutRpLTZFFw8y
 ly3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7KLjfPHsWfXinvdT9x6SwzVroZgq92QvU7YFU5ZeWM=;
 b=Ex0R7gHKOYKYIMNCioSJY6wR4+OgqSYRwWmvr6cCzXJSac6icE+dOD7Dke6VNo1p9V
 WMegEG+SUALuOlFmWWbCC40zGxmzU4Vm3fF1wyH01AEazlFzlFkacl8gogJ5XlBGRh8o
 z/NtPsNX026Gb64/f622tQ3q+8vZT57UZ5GzuyCf1mZaimO1Qg9VIByYU1+VSTBt1EdT
 UAgQlEjXLLSpECmDrxXSasNNvt6ioaI3+rxGCR/avEAvX7GRNYywn6OR7lcirYv61dSa
 ewlP5gnd+TA7ynsNeslCtrq1Sd/krGfKj+UJtoj41mc9Nj5DGOe4+r6/MT0hvymUYqNC
 WDCA==
X-Gm-Message-State: AOAM533kpNPGwN9O32BKqQXTCnJtmEQS7TjJZRoI2LVcC1dP/nhnU67u
 t12ioJXGCSj7gKo5jAeZP+4=
X-Google-Smtp-Source: ABdhPJxob2kx7PZCoFwkFA0s/AKSHeLZcHwTJ8YZObT7NHoX+c9068fofT99Quzq/1i0wvnVcFJNFQ==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr1712753wmh.95.1641756281658; 
 Sun, 09 Jan 2022 11:24:41 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id w17sm5403831wmc.14.2022.01.09.11.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 11:24:41 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: kalyan_t@codeaurora.org
Subject: [PATCH] drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
Date: Sun,  9 Jan 2022 20:24:31 +0100
Message-Id: <20220109192431.135949-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function performs a check on the "ctx" input parameter, however, it
is used before the check.

Initialize the "base" variable after the sanity check to avoid a
possible NULL pointer dereference.

Fixes: 4259ff7ae509e ("drm/msm/dpu: add support for pcc color block in dpu driver")
Addresses-Coverity-ID: 1493866 ("Null pointer dereference")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index a98e964c3b6f..355894a3b48c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -26,9 +26,16 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
-	u32 base = ctx->cap->sblk->pcc.base;
+	u32 base;
 
-	if (!ctx || !base) {
+	if (!ctx) {
+		DRM_ERROR("invalid ctx %pK\n", ctx);
+		return;
+	}
+
+	base = ctx->cap->sblk->pcc.base;
+
+	if (!base) {
 		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
 		return;
 	}
-- 
2.25.1

