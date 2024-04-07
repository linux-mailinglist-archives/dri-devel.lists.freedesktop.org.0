Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFF89B4B9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 01:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9BE10FDEF;
	Sun,  7 Apr 2024 23:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wz2XmcNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416110FDF0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 23:53:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516c97ddcd1so4335213e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 16:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712534033; x=1713138833; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
 b=Wz2XmcNeXT6rZ7ZcR0+qSR7mbdTzxdFyWgIaohdLbPlXDl2Bqtw2Lg3warrNbyCpfQ
 bbbDd56vPGIGNWevAJvhSa7D24DDCKFs4tZQXyWDg9ha6WQ+8g+jM9wtV/+6IpHRp2Al
 ykYlTPa3D+oCDWjUeGFdkhZpUpPjLL1Q/ORFr4fCQt3CAab78dE+Fk6pmkjL5hLV8IPa
 LJYp7A5SaiHLI7dt7M32holxkWeLom9LLm2iotIvGff4Z4LCQ4PE7zQfn/JYknV6/YTu
 8A0boerJMf8abGxeF3/CSjsyJ7GJze4k9raPKJaElkHT6V9ThULTSbw3fPQXBjyErH/k
 lXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712534033; x=1713138833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
 b=XNcedklBf6pAZen7eWvkFz+iajmTsBWLJVzFpWpANLZzZNEg3yMlnD2H1clo0Iq7dZ
 yEOKaHhS14PjS6GauC4e2jikI68zynfckcFXAy4SQAJ5lS/TlqzjnAzDtev38t3FVtBc
 XZjMWw+qe+7dJYqRL9on/I3YPKC9Jz4rO0kUgDUsW1P9F27HCzYoQsE2JPG9jmqZPYgc
 8HtpQXTj0j4yYlQYXDicu9zZkPMBqB3nx0wQJJgsmpMW41gJjhi0wU+ixUSDiaSi6KQi
 oxSwEt/YlZSEkCw1mPTrQS6Pj6VHIMDUv0GLSU3w+tZKY2aP5qCMLMAQ942W4XF/X6af
 BpzA==
X-Gm-Message-State: AOJu0YzuQ8MuspQ/QZZlvk4bk0I39Fto1PTrZ3DwT6ygBy9J42xkqdZf
 3G4bZt1kkJVhirW6NGLX1+nekr5/4+56scsTodSzfrwa19Z3eavK98P+sV35TpfWeVsubABSPbE
 Z
X-Google-Smtp-Source: AGHT+IGGJI2Ba92TUEzGsRtkoxj8sHZIcavmkHqfKJNlxt+JCsOBzcXsH1wevqOOTob8rUMw+YY75w==
X-Received: by 2002:a05:6512:510:b0:516:9efc:6c38 with SMTP id
 o16-20020a056512051000b005169efc6c38mr4664785lfb.44.1712534033332; 
 Sun, 07 Apr 2024 16:53:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 02:53:51 +0300
Subject: [PATCH v5 2/4] drm/mipi-dsi: use correct return type for the DSC
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-lg-sw43408-panel-v5-2-4e092da22991@linaro.org>
References: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
In-Reply-To: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2601;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jn//Iw9esRD8TM8P085ElFyT7MDokBKCt93Vkd/VJlo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qwER+vpasEz4a1AuuUvyk/ClxTNZ9XrWfPkpYzrNpn7
 ly+eWl/J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYmrL/leumqn/090ehhMb
 Vl2yDBa4cWavqbey7s/rqycqn7jPJvcpo+jfw+hXBTstnTzTFp0MYPWKdPZhiV53S0CM3S8ie3G
 ltprHZHkH+YdCTlzHni2xP/hlqn3e9NklJ88EHJy04ZJMdNXzuvr/v1xOhdvvnDgl+HcuW/H04I
 MywfXXrDeum613xVtLRjzV41zvWSNdmxOTFn9i8XrncTeB85+raztbJdOb7W9mB/TOnGZ48MIJj
 kj7iIC4Xdm9U8u1Lni12Mk9TEkILVe5UH71pJjCqlcsZ9N4Z/xZoBbqf1h+Mlf1JsHopFfNdmqW
 DyKM/Sxuugv29XptVHg0ZWdVnWEcx29eN9k1Mw2CObRSAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The functions mipi_dsi_compression_mode() and
mipi_dsi_picture_parameter_set() return 0-or-error rather than a buffer
size. Follow example of other similar MIPI DSI functions and use int
return type instead of size_t.

Fixes: f4dea1aaa9a1 ("drm/dsi: add helpers for DSI compression mode and PPS packets")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
 include/drm/drm_mipi_dsi.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..9874ff6d4718 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -654,7 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
 {
 	/* Note: Needs updating for non-default PPS or algorithm */
 	u8 tx[2] = { enable << 0, 0 };
@@ -679,8 +679,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps)
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps)
 {
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..3011d33eccbd 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -241,9 +241,9 @@ int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps);
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps);
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);

-- 
2.39.2

