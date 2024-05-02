Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFDE8BA32E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B92A10E2C1;
	Thu,  2 May 2024 22:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d1a8AQIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCEE10E2C1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 22:33:09 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-618a2b12dbbso1190358a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714689188; x=1715293988;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o0jTh2QfVXv25MHjtTxDv2qpxtdDgCoD64Zip10hlxA=;
 b=d1a8AQInQz1+RKrfo2q1uAaDCF1oicNDjonMYODh5mGkLyF0HDRBFYvHvdstQCQuRM
 L2HM8xdi5gJfERtnhEqmWab2AHjDuqV0dMI/o1W2rH+z9cEkuXR3fGhh9y8ldxckbjhE
 wr5OTFnHmeU64T4cWo/cpaV7UpMTBplDJ0SqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689188; x=1715293988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0jTh2QfVXv25MHjtTxDv2qpxtdDgCoD64Zip10hlxA=;
 b=FLvwNjRxQGdayWHU0oM4gtncNbAWXi4j+4MGhMExIEKrUNRPhwApDS/+8Jxv4yJU8K
 ATr9+E+ZKnXzO3JPihivAefE8czAnUWP3PmQxbSJ7JX7xz3+45Hq1bp3vo2BrursC/G5
 7Y2BQ57dZXeBTzhmdrLa1MgaT++k78NbuS6g1mieewm45mPf2aSuTYS0B44xSM6/arVX
 jB6CHutQYKdh2s6BxEyg9e/K1sR15AM6lDG28ur32hkcnWmMqjnOL77dM2y4DHizguyY
 jjCnXzU0v+EdvVBN35LALm/u3xmjHChWSyFRvxYW1eg6wdzNRJaXmHn0O7QaoYkABM90
 pPgg==
X-Gm-Message-State: AOJu0YzTVXTKwODy7BQdgk+PIH7pDt+Gluizd7RxCEjGMXotYhHo7jOh
 AKiQHzLUwqZrk+krDdDYtbSYHWnnRRPPb+wC23Wqylgl1qKUzzCf1rVJk6fKHswE+xIxyVgFUTE
 =
X-Google-Smtp-Source: AGHT+IHaVWuOpzr0DJi9lnd6PZ+qLFMY6hMD14bFNnPzTY4pfzLIiVSi7AZDi3pqydphJYYIjNr6GA==
X-Received: by 2002:a17:90b:a42:b0:2a2:9e5d:9bf9 with SMTP id
 gw2-20020a17090b0a4200b002a29e5d9bf9mr5810940pjb.8.1714689187899; 
 Thu, 02 May 2024 15:33:07 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:d58d:52de:fc6:7f45])
 by smtp.gmail.com with ESMTPSA id
 sx7-20020a17090b2cc700b002a4b2933a7asm3787730pjb.1.2024.05.02.15.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:33:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/connector: Add \n to message about demoting connector
 force-probes
Date: Thu,  2 May 2024 15:32:35 -0700
Message-ID: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
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

The debug print clearly lacks a \n at the end. Add it.

Fixes: 8f86c82aba8b ("drm/connector: demote connector force-probes for non-master clients")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..4d2df7f64dc5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2940,7 +2940,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
 		else
-			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
+			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe\n",
 				    connector->base.id, connector->name);
 	}
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

