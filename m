Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD998DE5F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7E10E0F4;
	Wed,  2 Oct 2024 15:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bQtpAIiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68F10E0F4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 15:06:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so56546845e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1727881609; x=1728486409;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41nRm36lyuHt6KF1YfA/9/W9a7bZ2YHsKcddXplTBL4=;
 b=bQtpAIiDoOSJ/+sQDDvnG3Awxe4oaU+XCJgXYTeyttgkVVROjt74//peztszAlis4b
 uhJ+7GqOn5ZNqRxpheEUJJ5oK2eMaLyXOD6k+AiN+mlHtAU0FkqZQf6IMZohvAb0ByBH
 LfjUK/4FT35kKod3MmPZb+rYzWhtiWe9JEJv7RcER5z8eQoGpf29E1e2Fxarpc0TTbfn
 ft4mMqETRnuKkdr2Q1o8yjDkCdTUb/evvKrdCOkn1gBb8F0AUFJMIHdyoLoghkjvuo1L
 ZDA/O3PC/OCIhQtt6l11gmgKo1cStJifsF+yfHZT6Vv27/fLZ0D3IGvWd/tXhpji+xcb
 thHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727881609; x=1728486409;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41nRm36lyuHt6KF1YfA/9/W9a7bZ2YHsKcddXplTBL4=;
 b=h21kNoRhQ9NBsgq3jEKKd4nv/yqfEI+f5Cy+J7CZyh89hnYYRUwXeILec78xk2k4xw
 ZCtw/RqFrHHyuDFx6nH24AGmT9KsONs3kLPQ5fHg1dm7U1/kazFhI1axsTMRst0c0AdC
 AuBa400n8jgGEbBsuZ77/Hs5hHAJnCNEi5U+UXwyPQrCBDHeZTkKAXyKm3xqZnkp1az6
 TsFotEePWo6pYNGo2nFn2jRibZaEzNkBeuz8/BaG42hR8PEl4X1VrK6r0YI3ymWAIXno
 65ggFgHQkobcLwvHqrrM9kZIsiRzTX+DqSr38bxnKwF89CEJalNvyeXzU6dCucPBdnQi
 WzRw==
X-Gm-Message-State: AOJu0YzlawM9tvF9tnnX3We3kr2uw4hcmiDhYXRqJnZ+JhjgTggcnHkm
 CMY7W5XX45dE6xKoz2triHXkXZStUYyz+ppZhHtkZn5TniHxJNiXKEixnOwuCxM=
X-Google-Smtp-Source: AGHT+IF71RqA4NOc6VzRPxiHsdLPYy5sAvEvkNLIBeF+tbvu8AmidAXt6YoGr9HXHEWuwjGMwmfNEA==
X-Received: by 2002:a05:600c:1d20:b0:428:ec2a:8c94 with SMTP id
 5b1f17b1804b1-42f777b6d00mr25845175e9.10.1727881609131; 
 Wed, 02 Oct 2024 08:06:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f79ec0a44sm20794485e9.17.2024.10.02.08.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:06:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/2] drm: Fix up and error handling after fbdev changes
Date: Wed, 02 Oct 2024 16:06:18 +0100
Message-Id: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGph/WYC/x2MQQqAIBAAvxJ7TtDFg/WVCElday8WChKIf086z
 sBMg0KZqcA6NchUufCdBqh5An8d6STBYTCgRK2kRFG9ttEFqjbyK6L2xim1oPEBRvNkGvr/bXv
 vH+usGTJfAAAA
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

I was trying dri-misc-next on Pi4 and getting a NULL deref as vc4
started. The cause was having missed adding DRM_FBDEV_DMA_DRIVER_OPS
to the 2711 struct drm_driver, but also showed up that the handling
in drm_fb_helper_single_fb_probe could fail to call any fbdev_probe
function, and hence the NULL deref.

These two patches fix up vc4, but also throw an error if neither
driver->fbdev_probe nor funcs->fb_probe are defined.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (2):
      drm/vc4: Run default client setup for all variants.
      drm/fbdev: Ensure that one of the probe functions is defined

 drivers/gpu/drm/drm_fb_helper.c | 2 ++
 drivers/gpu/drm/vc4/vc4_drv.c   | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 86fdd6b9b1e98cfd26249505e8ce72f4fc0de37f
change-id: 20241002-vc4_fbdev_fix-f4c8b11928cd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

