Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A647480329E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E7A10E1BC;
	Mon,  4 Dec 2023 12:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462B10E050
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:29:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c0e37cfafso3760095e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 04:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701692949; x=1702297749; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkkECO5iEe8wffVmp+N+jpk0G+DJrLKzEev9h10F0Rg=;
 b=MDPFjgqe74tBpsbLkdBOFqO/DCkUCly+lajjbkgbWsUg2BMkLEF/oZlRKPK31D39f9
 qWSSBCLYuWY/xcK6a+aqQtih2SGQAIFP9Hba09tiZHJy1hEFEPpRR7sL5HQIxDV/3R4d
 qrpxmfKnKdmhFB+lk/h9HDXPOlNWrjiVWFF/t15McCjCD4KqEDbLfTvFI7PeMftL1N1N
 npZO8UoiX5Cjr+OD2selDz0UBUIIjD/EA4I7sHPkABL+TleJvhBoLTIcoFolCVlcZfAF
 jP0aGdKz2UnMUIEqDXAJoq4BNiEMjz780V0s3Ktb9PFXz2Rtmtx78cxnoP6ahjsMtOIl
 X5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701692949; x=1702297749;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkkECO5iEe8wffVmp+N+jpk0G+DJrLKzEev9h10F0Rg=;
 b=w0/MfBsBxH5H/oiy7JUO9cHIs5oCx6kUlgYQu4qqbsOQAA8AbS9mIXu5AT3dT3kOR4
 +YBUn2ae/iBY0iplgiqVB+pxU2HlY4MNlcaO7j4r1sEd62HnZlMxaeBNkcT1WXkDeqb0
 JW1f04X3EKyTPsFvMqUCpZhTngEat8PfsI39XAdwmu5kiE7ASiLr1YRWMPZp5Y5BpmZF
 4209J0qtgzYnnUGgSWKBmW40gBsYWYp5ynEe2Voklii0xASlj5EZhNBus7hWD01BY++2
 AXVvQUdHdJrg3/wJZfbDpsaX58FWbnmVYK78dM1T7t8Yc1hkIAMA8FR2PfiFSjt+NLiS
 Jk7Q==
X-Gm-Message-State: AOJu0YwjyV2/b8C9LIeZra+sOXme4iGNh1m/Koe0BBJoTZdaJQSqrPbk
 DYTE9Kwhucw3zrADqgVgUZm6vA==
X-Google-Smtp-Source: AGHT+IEhBK8pDeFMWjsr+8bKrzXeC11m8+GcPR+3mHNKpiYY/iuhyUeTu2UUAAGueQ/HmM7P67v+lw==
X-Received: by 2002:a7b:c041:0:b0:40b:42d4:3319 with SMTP id
 u1-20020a7bc041000000b0040b42d43319mr2561709wmc.0.1701692949452; 
 Mon, 04 Dec 2023 04:29:09 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040b47c69d08sm18464512wmq.18.2023.12.04.04.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 04:29:09 -0800 (PST)
Date: Mon, 4 Dec 2023 15:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
Message-ID: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i2c_master_send/recv() functions return negative error codes or the
number of bytes that were able to be sent/received.  This code has
two problems.  1)  Instead of checking if all the bytes were sent or
received, it checks that at least one byte was sent or received.
2) If there was a partial send/receive then we should return a negative
error code but this code returns success.

Fixes: a9fe713d7d45 ("drm/bridge: Add PTN3460 bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is from static analysis and code review.  It's always a concern
when you add stricter error handling that something will break.

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index d81920227a8a..9b7eb8c669c1 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -56,13 +56,13 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
 	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
 	if (ret <= 0) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
+		return ret ?: -EIO;
 	}
 
 	ret = i2c_master_recv(ptn_bridge->client, buf, len);
-	if (ret <= 0) {
+	if (ret != len) {
 		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
-		return ret;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -78,9 +78,9 @@ static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
 	buf[1] = val;
 
 	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
-	if (ret <= 0) {
+	if (ret != ARRAY_SIZE(buf)) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
-- 
2.42.0

