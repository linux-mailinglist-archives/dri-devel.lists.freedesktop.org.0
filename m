Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C87910A60
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E414310EA97;
	Thu, 20 Jun 2024 15:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="H8IJEMNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f98.google.com (mail-lf1-f98.google.com
 [209.85.167.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35510EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:48 +0000 (UTC)
Received: by mail-lf1-f98.google.com with SMTP id
 2adb3069b0e04-52c9034860dso1301457e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898407; x=1719503207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXnG7s4ngxMW6zyufB6wk77V+Xyp+NmoCwIuyqUfsIA=;
 b=H8IJEMNUadprcomiXxkQKCz85sd6OgzzPFD9j+6OxfIGHpUZm71KjEs+K6GtmeRuG0
 ndhr/KTcKJ+LsJ0wH2kBKQhP68EiYri0Fv7auoF+SuvVa+pJl/Kw5f5RlFiwkrGHKp6b
 3BOQLQrmeYVW0a8d92QGbOpVM7r8KfyKvIdQo+IsnFxuSEYAESr7Wx3eaURMTZV68r4V
 mmbHoCdpMjRwIiLl4nFR5J+eEeyipb2QQXdWztsfmIpoacEz4RSdxgqxcMM91iouWSS9
 T/n+epfsEbko//0FavVrgrsEaJEXDLQKBlYTexpjGHpg78R4F33MXlCJdPS+X8LR3EuY
 QBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898407; x=1719503207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXnG7s4ngxMW6zyufB6wk77V+Xyp+NmoCwIuyqUfsIA=;
 b=ZPUuhjnNzTP00RB8kz26ruTCajP5HkQNwQ9RzO+O2HXky5SiZYYEO5RjEzfLszsT1K
 lEDGgYYWkc7NFlWJiEHbHBO+5gkVQMzvxsBU7iAD2qBdROpWyuoyZxbfP4milQnjJBRy
 11SQCTX8g5Dm3vlqwLez59HPIOAQdXTNnIs57ygNf4XQD+8SHNnqNIMh4ejbfpRCKSd1
 Ae29TthvZtiidAzXGtOOUIBKGe12KFmTfdIi695KcS1wUuH9qpSjohAjBn2IxoHSNYsN
 WDTV2iXB57FwYbrqCkUZZaRNdsDaHd0holgXFxDvDKCwib0R9pfcpR6pA+6eaamRiwVs
 icWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTV68ty/3RawhFxFJVdZEJ0/sHj6WI16v/dxtTtHP+8JNrFbHC0Xs3jP5lCCjiJY3rbdZ/E4RqEQgmFdx5sbTi/1fRPXiQ+nJDfYKEUQSj
X-Gm-Message-State: AOJu0Yz16Dbma1lRNqmMyMwMlHMWXHhLL1+DmH9yZaPOvE4kk3KTSNgQ
 XlRZjC5oy8D4krjb4E25+koYHwyQayscWdfOeqW0a2U33ov91cLIylY4fIwNoymjYZ+O355ZFZ7
 UnqunH4NSDKK6eoVVK8deSFvZblsDYgex
X-Google-Smtp-Source: AGHT+IFLOHFMKDGt14DGjz5RKhohptEMdbnr//hPDzOOTBg2JMDFRLJEt/5WC6vXXz9tsAzWQognoUpktQlQ
X-Received: by 2002:ac2:4c4b:0:b0:529:b718:8d00 with SMTP id
 2adb3069b0e04-52ccaa2acdbmr4987712e87.8.1718898406736; 
 Thu, 20 Jun 2024 08:46:46 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 2adb3069b0e04-52ca2838baesm212576e87.62.2024.06.20.08.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:46 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 12/31] drm/vc4: plane: Add more debugging for LBM allocation
Date: Thu, 20 Jun 2024 16:46:13 +0100
Message-Id: <20240620154632.4125308-13-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

LBM allocations need a different size depending on the line length,
format, etc.

This can get tricky, and fail. Let's add some more prints to ease the
debugging when it does.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index e4fcef11cf6f..16197c4b4b33 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -741,6 +741,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 {
 	struct drm_device *drm = state->plane->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct drm_plane *plane = state->plane;
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	unsigned long irqflags;
 	u32 lbm_size;
@@ -749,6 +750,9 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	if (!lbm_size)
 		return 0;
 
+	drm_dbg_driver(drm, "[PLANE:%d:%s] LBM Allocation Size: %u\n",
+		       plane->base.id, plane->name, lbm_size);
+
 	if (WARN_ON(!vc4_state->lbm_offset))
 		return -EINVAL;
 
-- 
2.34.1

