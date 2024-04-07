Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85789B8DA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9E31121F4;
	Mon,  8 Apr 2024 07:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dq/1AWwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8254A10F8F9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 06:31:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-6e8f765146fso2923470b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Apr 2024 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712471465; x=1713076265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o0TxNP5ukGCjKIEdOUAnb8TNyxv/o51V0OIxtAK8qx0=;
 b=dq/1AWwnSDQS4jT2gEMw3F9fcWSEJpR4/dlVc+ToNNRk/i8p3zywHmUR2Dh1sRs4YK
 ywEP+JY9U0YvopxTppA6nS0Tz4JmiHwxdr43glkuTGgxxppV5rcjMAi6owzR0cgbECyY
 eL9Ix1+RtL44K0UJKWZiExY7OLYsDUgLGHrvuuIHr9FREDpbiGAt2qIscWfEmhR4TC6J
 L+ZCMzxSPRWecHzkVa2aRhH6En3XXxtSS/FRMyL14sALpJB/avoRds79PrHmSEeii4Tv
 6TQCFSzoB0V3/KocUV+YVNK5M90iGBG5Bhb9L7/EDSB5t7LIbPwhpo9AOScjMAITiNku
 uDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712471465; x=1713076265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0TxNP5ukGCjKIEdOUAnb8TNyxv/o51V0OIxtAK8qx0=;
 b=T24dRTdrxyqAjzQMvvmgHDw04g6xiYutAjjRhz33lf48kKrq+4frACRz47eEEnWkkq
 zP6ypZ0iARsXHKQO8vDQV6hK9teZAjB771+bfeHuqxddWB4V3qZfajojFqU5dMQBxltK
 1qB31SRh3XkGhaFYB3jWUgKU+MRJpGzprGyXR+pI101A94apiz/2dSNt4lTgSUy8Vip1
 c/AN22HstXY9+gtUESw71d/IkLglBxVqgSl2jbR3FHjQAx4NzL3hc5qq+2cGKqV8JhRM
 SQEs9oksw/HwseS0SG89SsJJpgmcZlQ62Mxv/gVcx1I/UDW2vMK0ZlGZQaV+U1ijfYLO
 xKuQ==
X-Gm-Message-State: AOJu0YwwikMfoeXnIxx8yoLhyukUEWQ1h3DJlt1wtsypt5vwmEo4xlGg
 zbLFLntIlir4YlVgolF65zXNiXWfRnIiWSPMRNBq7wvjIe/CxDvN
X-Google-Smtp-Source: AGHT+IG2nUt92rcNDvoOt4O/AyiK70xXaZdfxjmL45kPB9Fr4ysLqYiBC8WGR8PWdZ/XkBm9LCJB4A==
X-Received: by 2002:a05:6a00:98f:b0:6e9:38d0:5019 with SMTP id
 u15-20020a056a00098f00b006e938d05019mr7497422pfg.0.1712471464780; 
 Sat, 06 Apr 2024 23:31:04 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
 by smtp.gmail.com with ESMTPSA id
 gr6-20020a056a004d0600b006ead007a49dsm4120547pfb.49.2024.04.06.23.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Apr 2024 23:31:04 -0700 (PDT)
From: Huai-Yuan Liu <qq810974084@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@outlook.com, Huai-Yuan Liu <qq810974084@gmail.com>
Subject: [PATCH V2] drm/arm/malidp: fix a possible null pointer dereference
Date: Sun,  7 Apr 2024 14:30:53 +0800
Message-Id: <20240407063053.5481-1-qq810974084@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Apr 2024 07:45:42 +0000
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

In malidp_mw_connector_reset, new memory is allocated with kzalloc, but 
no check is performed. In order to prevent null pointer dereferencing, 
ensure that mw_state is checked before calling 
__drm_atomic_helper_connector_reset.

Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
V2:
* In patch V2, we additionally set connector->state to NULL. In this way
we can ensure that there is no state pointing to freed memory.
  Thanks to Liviu Dudau for helpful suggestion.
---
 drivers/gpu/drm/arm/malidp_mw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 626709bec6f5..2577f0cef8fc 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -72,7 +72,10 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
 		__drm_atomic_helper_connector_destroy_state(connector->state);
 
 	kfree(connector->state);
-	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
+	connector->state = NULL;
+
+	if (mw_state)
+		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
 }
 
 static enum drm_connector_status
-- 
2.34.1

