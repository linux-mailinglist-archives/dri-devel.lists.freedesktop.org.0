Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AF733135
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E67410E60F;
	Fri, 16 Jun 2023 12:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D3810E60B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:28:20 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19DE13F735
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686918499;
 bh=7aIuaUbJc/mQS9T0aBfOHsiM7MOxneztv9jcxZlcdiI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=sgCNX5pip/ZalyrkHfVxPia6qND0uHAa7K+5p1Hc7LMhtztLqZSN2GNXIAjpMH+EZ
 KZoaLLbrxP7L/Pn0wOCoHIrG49NyjoEtoepJIg8a2TRkk8/CKiKcaLvET1XZ4Qy1ZN
 SmOkPXbLh3RFgaGcTjhT236+4ucrMbOq/v44CMc1DP94KV0Y9gWjKpyN+IL3uG/wBs
 Y+8ZKkQBuSuzXF8MtkrPNDKpaCQcI3uhstSsfhW5NfUBwubSQFXMxWx1gZqAZZfaaR
 owQEsk2Sm0ZvE3DzgsgR/Ws43oP1YjfVx28mWU8th75zk/capCYDNexUGXL6+wcQPD
 IqHue+KoxLN7Q==
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30e4d11a413so840728f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686918498; x=1689510498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7aIuaUbJc/mQS9T0aBfOHsiM7MOxneztv9jcxZlcdiI=;
 b=GFe0j0SvnXgV4hiHfMpUDiN4Kc/bXU5JuvTLb+KDcVdCr6Hroqyfnr2iilYcS/VlcS
 B8OxnTIUCvCIYNYbLJWJkWiKoEbPo0cxLIKYI8pfMG6mBhu8PzjilzTmjmr3nXpy6EuC
 XFinez2JnMk6x0s6UfkAqnaCbRVdpw0xUENmN/le/1GcUk/P+BsKueInkYVv3iYk4QcV
 jtQV/NPDN1lknyEdwBHCIb8+evmXwNHUIL9qovx2CoK5Nb0SNDI9eBqgM2A4RoIv8nDV
 pAX8HdEmf8yQZSCPdwFRjRRAv1Ur4mtwo9z0U3LTN/UUsP3oCfYj/BLJxjrKWhQXSzan
 nuRQ==
X-Gm-Message-State: AC+VfDy9zqqE+UMzP9w+EYJxTcy3OO0GXbVQe/2C94uCKaq0N0I4W2/B
 j7JZZwbflz4GhNh+H7OrzHaTXZTllhYA3uno1tREUN7SC10l9DqvUXItJ+UXum+1YnkLCXEaPPc
 Nd9smnoNp1k983cGTrxc3t0u+03BBdqHhkyuFvgaNZyF9AA==
X-Received: by 2002:a5d:540a:0:b0:30f:b0de:f100 with SMTP id
 g10-20020a5d540a000000b0030fb0def100mr1688685wrv.23.1686918497892; 
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7unBLWvn7eu+/rOTRKqs5JmWynktPc0fpo3fUsOeWbUBSx9ckKi/1QQo/F4AC7I4VtmMb2rQ==
X-Received: by 2002:a5d:540a:0:b0:30f:b0de:f100 with SMTP id
 g10-20020a5d540a000000b0030fb0def100mr1688671wrv.23.1686918497538; 
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 cr4-20020a05600004e400b003063a92bbf5sm23726788wrb.70.2023.06.16.05.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE macros
Date: Fri, 16 Jun 2023 14:28:15 +0200
Message-Id: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
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
Cc: quic_akhilpo@quicinc.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, juerg.haefliger@canonical.com, ribalda@chromium.org,
 joel@joelfernandes.org, johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing MODULE_FIRMWARE macros and remove some for firmwares that
the driver no longer references.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 8cff86e9d35c..9f70d7c1a72a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
 MODULE_FIRMWARE("qcom/a330_pfp.fw");
 MODULE_FIRMWARE("qcom/a420_pm4.fw");
 MODULE_FIRMWARE("qcom/a420_pfp.fw");
+MODULE_FIRMWARE("qcom/a506_zap.mdt");
+MODULE_FIRMWARE("qcom/a508_zap.mdt");
+MODULE_FIRMWARE("qcom/a512_zap.mdt");
 MODULE_FIRMWARE("qcom/a530_pm4.fw");
 MODULE_FIRMWARE("qcom/a530_pfp.fw");
 MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
 MODULE_FIRMWARE("qcom/a530_zap.mdt");
-MODULE_FIRMWARE("qcom/a530_zap.b00");
-MODULE_FIRMWARE("qcom/a530_zap.b01");
-MODULE_FIRMWARE("qcom/a530_zap.b02");
+MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
+MODULE_FIRMWARE("qcom/a540_zap.mdt");
+MODULE_FIRMWARE("qcom/a615_zap.mdt");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_zap.mbn");
+MODULE_FIRMWARE("qcom/a630_zap.mdt");
+MODULE_FIRMWARE("qcom/a640_gmu.bin");
+MODULE_FIRMWARE("qcom/a640_zap.mdt");
+MODULE_FIRMWARE("qcom/a650_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_sqe.fw");
+MODULE_FIRMWARE("qcom/a650_zap.mdt");
+MODULE_FIRMWARE("qcom/a660_gmu.bin");
+MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_zap.mdt");
+MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
+MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/yamato_pfp.fw");
+MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
 static inline bool _rev_match(uint8_t entry, uint8_t id)
 {
-- 
2.37.2

