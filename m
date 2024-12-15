Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B819F2228
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 05:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D10310E09E;
	Sun, 15 Dec 2024 04:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="zyqDbASg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DFC10E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:16:08 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-725f3594965so2232755b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 20:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734236168;
 x=1734840968; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fC1tW23wVRz6wPmTZfE0dj5oxf8Q7Wp0oKBk+AIauhM=;
 b=zyqDbASgNrTyJdhcDc8e0IoTOfBpg6E77AdvA0vLXu629lfgofcPS4Dk3YS+HPVzbo
 25HdD29SmSRXN+9A/sbth9NYJbTT//zO2gnwfxgqKwA7v3u/3/QuSuOs4Y5+NrYe9iAB
 CyEZlAx7kHLatnTTVAct7KVl83flzR7/U0ShpKX7LrI4NTIAQ3TTD8+BNO754WbJq3Y5
 vV/+AsX1K/pLMDpckV15Ei1/Ey44qrpk/xmxxkJyz+l+P6/shMcNY0zUaydVjwgg5Jfh
 0v3Y9RseAfdTqEZpeL3lbwWeraibsYnlLheEA7CsO4Op4LPyxZ+pV4q2QDGzTeV9gPk5
 tg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734236168; x=1734840968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC1tW23wVRz6wPmTZfE0dj5oxf8Q7Wp0oKBk+AIauhM=;
 b=CO9NNME9wlC5FiSzpo6MWy+5i3AqDCtejUTXIVlOgKzEQM3XoW/IUFBc3Wgu9lH+Ct
 gPZye2TaQrf3elzzPuT5ubK5rhRayp2zctLyEKeOBSPV0hOfuBuwGL7EJ48mCOLPHYCT
 NFIuJFZ47iH+Ms7RdMoWqA9vjp3HuCPY73TRv7MR9w/TJueGXyomidJ90AFFiVGqEHM9
 EWhfGhGABwNd3tA7rSxNlEc/LnUR9+v9JrQx0axAJGCuElrEXs6ZzJaaWOe2gmQI5ovc
 IQzjOW6C7TGfSnerGeTIPcLIuvYgZ6q8+NKjWtFr8f9MK5rj1r8Nv5anawQNMqkQiG7o
 MWvA==
X-Gm-Message-State: AOJu0YzQhxG9yezH+t9tMqBSeJGnhMSBECnu45qK9D9iskUxeEiuVySw
 8c8TGPBuELjpRAaTMznabT+BkLhbr/ZZvKebhJFJB9LyhHqw7simnB86rSS/gg0=
X-Gm-Gg: ASbGncslApqr/qU8sQiGPfpsGTyvjkOCS2esfudcyHQe7WK8jxD3xcRm7q7ZDbE5tuN
 FkXEkLyVzgACiQs0xa9/46cSJIbiJI6DelbyKCWNjKTa7BXBy43pH/QY90UEB8LoOuHglRG5r0i
 OCQPy1lCqTygpaPQU6OFzV9bF+RSO1b6dssQ6nubyZDlS2NnRiWDpS0ukjj5Rq1sB8j2shybk2P
 /3zv0KOx7GT341LmrKok/u4ae/m4oYyDLq6ZiRzbCsTgIKlT4mmh925muIWq+FZ+gWu6Yuhcb3J
 3EYI
X-Google-Smtp-Source: AGHT+IF3mpjzGNx+qUPIVsRNKDuKV/jcnHHm86MmtnxrUKDGHM1agaTKHmqexQnUfiBTQ7CsNfAABw==
X-Received: by 2002:a05:6a20:a11f:b0:1e1:9fef:e95c with SMTP id
 adf61e73a8af0-1e1dfd352f1mr12340963637.12.1734236168505; 
 Sat, 14 Dec 2024 20:16:08 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:39e1:57de:eaa2:a1ed])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918b78f72sm2217188b3a.116.2024.12.14.20.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 20:16:08 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] drm/imx: imx-tve: release a device reference obtained in
 .probe() on error
Date: Sun, 15 Dec 2024 13:15:50 +0900
Message-Id: <20241215041550.1439044-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
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

imx_tve_probe() calls of_find_i2c_adapter_by_node() to obtain an
i2c_client with an incremented refcount, but does not release it on
error. Fix this by calling devm_add_action_or_reset() with a new
function imx_tve_release_ddc(), which releases the reference.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: a91cfaf6e650 ("drm/imx: imx-tve: move initialization into probe")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index 3a3c8a195119..8d7af3514128 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -525,6 +525,13 @@ static const struct component_ops imx_tve_ops = {
 	.bind	= imx_tve_bind,
 };
 
+static void imx_tve_release_ddc(void *data)
+{
+	struct imx_tve *tve = data;
+
+	put_device(&tve->ddc->dev);
+}
+
 static int imx_tve_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -546,6 +553,9 @@ static int imx_tve_probe(struct platform_device *pdev)
 	if (ddc_node) {
 		tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
+		ret = devm_add_action_or_reset(dev, imx_tve_release_ddc, tve);
+		if (ret)
+			return ret;
 	}
 
 	tve->mode = of_get_tve_mode(np);
-- 
2.34.1

