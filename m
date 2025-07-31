Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E5B16ACF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF8C10E45C;
	Thu, 31 Jul 2025 03:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="T13sHK53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE8E10E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:23:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2401b855635so4242875ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753932231; x=1754537031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
 b=T13sHK533/T1ZZ1Lt29ITg6EXUkjxW3TZTv74Rf32BOzqTRx8rimAw3z+ZciJazUP7
 q0aFlRlCeJ1xRPyFUF11b6V8AlLtSOzWusihIp2Iv5LpMNmyrBfHGh14yZrDefnR/AiV
 vVm/nOUI0JVP3dPkOvb7d4MVVllT9cDwY2mwfOc5nqCPOGmZn+nFNHwQYH1xjwi56R0Z
 bafJBdPY2aVTeM9MYVo7iZwPQjpLArT4p6fKHYwskOoCHsmYvmkZ5xkYvkeGBlF01AnV
 586Rs5Zv4qCDcfDOh6W94HIVCUkDFC2SHBtlaVaoKUUx5fP5m05C5siF9JD4wQn1WvYr
 v0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753932231; x=1754537031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
 b=mRJx+Ak/h7yTZ9kQQ9J3UzB/BZFKHIokVMCSEeeK1ifZCFxEu+S4pNrNY418uRPqYY
 whk4hyEo9t/wRsAJWocb2VLgfaEPeKaToMrfKZ3/ci2AhwSvRtrc/yT1hRMc1K8Fnr+W
 72LHgd/SwQY4K/n0ujVI8utRt29NMyyV0SoZL3Vu021U9wyDtYH80SpIckdNovCzDT94
 qKfggzdx8PwQumhs8CayGVhIYT+cM5npaNp9dN6E3K6xCOKzrh2l11V7tkCMu31BJXxS
 ddwvOi/gn5tJY99tib+09UBfOBNfWhcJXqQhKySHjtVi80qU2I9Bn4EfmruBmhDNJUzH
 Nwfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgMC73kBSyrQ5C1Z33PHUVUIR6yJnL1aK8MQjVgIJMlPLZE0LYj7ZO2Qh3kOVY8NPhEhEurmXtUjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Ccm0fKIXk0ozcACrdtPV/fDfLLitJ9F++KJNtgqhzPIgPt8u
 bBVCOnwqoqJQ/KDEECxy5S4dID/JyhL3A4R5ud085ei0hR/qPyf5iW6MZZOsTGyx3hM=
X-Gm-Gg: ASbGncvXMcER3ENfUimc0wNhnKY72Bs4iCzrah8sayhIjpSbP2HDtXAfg7gv2pomCbf
 hw/6cvmJIoQX2efNH/LMizCN1TzuMMiPeOtcuZRUrvhB6H+7NVEQNZBazeVAwnKPcjOLutIMrsq
 UE3wB1A+bpsdXLLnLa0gALe8vd4iiusDVp6bj1c4yuDXaAdC66Uym8JHHkM+VbWUemxhIdyKMx5
 f/3bPTMv6qR3xq2lHkuoO+SBv83wrLbTm84blFoVsaHRoap3u/6/eAapCAgKCvH1ekQZTI+lSSb
 KJcxrIU7jnB5olQlbJuICvnEbvTPzR7YFv0Elp2i5A+TGRXFxOsLX3aG0z59A1DdUs5DvnYxfyG
 3LvummOszBrd5fSKHuiE5S8IiehL9iSra0/I+eU7YoW5Isd3MJg==
X-Google-Smtp-Source: AGHT+IG7cxswJdJ/7tpMHzX/PLpF1znLcf9i4exYcEFax9LRUgDC4Zu20SehYungolPEBKBedQbYCA==
X-Received: by 2002:a17:903:1aee:b0:23f:d861:bd4b with SMTP id
 d9443c01a7336-24096a63f17mr93878045ad.5.1753932230738; 
 Wed, 30 Jul 2025 20:23:50 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 20:23:50 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Wed, 30 Jul 2025 21:23:41 -0600
Message-ID: <20250731032343.1258366-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
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

Fix bug in nt35560_set_brightness() which causes the function to
erroneously report an error. mipi_dsi_dcs_write() returns either a
negative value when an error occurred or a positive number of bytes
written when no error occurred. The buggy code reports an error under
either condition.

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 98f0782c8411..17898a29efe8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 		par = 0x00;
 		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 					 &par, 1);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
 			return ret;
 		}
-- 
2.50.1

