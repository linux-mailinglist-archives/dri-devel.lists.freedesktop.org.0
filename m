Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5973636B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E510E17A;
	Tue, 20 Jun 2023 06:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927510E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:13:02 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C51F13F0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687241577;
 bh=9wIeiW1ZFsba/KXCWD2PyQ1wr/96tQbFZf3Edkh0XnI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Bl7C6SQI5ptZxUxyeKcck/ODIqkCpGcBix8Kvces20prt13n2tG1HYQi7PxUq6yHs
 Ea9aIvS6G9Vh1aHMPSPIDigbf7Gvzd5Fuu/1oHP3AxMqwMLPwikw4TgIcQZlHpom5h
 8SV8TQvi9Pk4gP1jTt7/GrHovDKjzbi8YCFS0n87DFtakf8RVHahkC+tj07n1IsMID
 o+2con3EXEnt8EgtTptHVd0SvCSQrEK15b3vUStzc4LjYCkuemh1VZEef6/RcqR7FA
 LQxHQlP+8gAnnRpKllotxdYCIqh1gtzLujOulhJvOYKzF1HGYohR9qXcCUHST0Slx/
 QO+t29D8tpEFw==
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so16411365e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 23:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687241577; x=1689833577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wIeiW1ZFsba/KXCWD2PyQ1wr/96tQbFZf3Edkh0XnI=;
 b=dZ2CnVzzPbU9OONHr5gyEgjbjjUH91tgZPu3RxXMiHkEepYvsNPJpfgVS50VLXmxV9
 92lDQTwmxg4+wpiaHnJoNSG+JKqzD7s88MsstgEmqahiCK5wqqibk/7NxePF/gdKVv37
 EXo8QCTek0pRjWYWoLtC5s1xN9hpBHvF6tnMMS7QJDh4ccK8+Z38ZpwNZ2u4+HqMXaBO
 xTbS3ZnwSvnNoj7yjhWawjWBDnWHsVercpzTpjgsJIFNcVzlIsU/OOxB8YMKe/nXPjrU
 xU/5+D7DQ/7RqwsIeZLg1s3UOxJD/XRbtZVcGFpzY/CTWjcqt+Z1g99R3H9F97Ib3D6R
 EQzg==
X-Gm-Message-State: AC+VfDyG7f/lJov4k9PmSWnORaiKrvMzY0O7jUa4hG7D1lV5Gishi/eO
 uqaAKlEpvdfSl9O0fPhWtdDdOMWA1Te7VI8Fzn8csZ7bH+2VYPAICXurDWWccXS/DZerZN6J8P5
 9YVZ6uZjP2C8fTcp/RfCtlOOqaBoEQ7GEIxPxrlJUDXMwiA==
X-Received: by 2002:a5d:5642:0:b0:311:13e6:6504 with SMTP id
 j2-20020a5d5642000000b0031113e66504mr7172942wrw.47.1687241577594; 
 Mon, 19 Jun 2023 23:12:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53VbcjaaSaVOP7ZfF1U8PlZ6CnaKfIspgMD4HVg9YmI8nsBXcQDmAFnqzTcFArMw2i9VXRcA==
X-Received: by 2002:a5d:5642:0:b0:311:13e6:6504 with SMTP id
 j2-20020a5d5642000000b0031113e66504mr7172930wrw.47.1687241577282; 
 Mon, 19 Jun 2023 23:12:57 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 y10-20020adff6ca000000b0030f9c3219aasm1163729wrp.47.2023.06.19.23.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 23:12:56 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: rfoss@kernel.org
Subject: [PATCH v2] drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
Date: Tue, 20 Jun 2023 08:12:54 +0200
Message-Id: <20230620061254.1210248-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <CAN6tsi4jdDD20DY5sKL+ALC_Mk2UHRArOrQnjzKoyF30QZi8jw@mail.gmail.com>
References: <CAN6tsi4jdDD20DY5sKL+ALC_Mk2UHRArOrQnjzKoyF30QZi8jw@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 juerg.haefliger@canonical.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module loads firmware so add a MODULE_FIRMWARE macro to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
v2:
  - Introduce FW_FILE macro
  - Add Rob's r-b
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 2a57e804ea02..22c84d29c2bc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -28,6 +28,8 @@
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
+#define FW_FILE "lt9611uxc_fw.bin"
+
 struct lt9611uxc {
 	struct device *dev;
 	struct drm_bridge bridge;
@@ -754,7 +756,7 @@ static int lt9611uxc_firmware_update(struct lt9611uxc *lt9611uxc)
 		REG_SEQ0(0x805a, 0x00),
 	};
 
-	ret = request_firmware(&fw, "lt9611uxc_fw.bin", lt9611uxc->dev);
+	ret = request_firmware(&fw, FW_FILE, lt9611uxc->dev);
 	if (ret < 0)
 		return ret;
 
@@ -1019,3 +1021,5 @@ module_i2c_driver(lt9611uxc_driver);
 
 MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
 MODULE_LICENSE("GPL v2");
+
+MODULE_FIRMWARE(FW_FILE);
-- 
2.37.2

