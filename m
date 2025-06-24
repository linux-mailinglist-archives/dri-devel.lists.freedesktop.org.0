Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14094AE5CC3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 08:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2955910E16F;
	Tue, 24 Jun 2025 06:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="h6wk9lSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8226D10E16F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:27:33 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2da3c572a0bso46300fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1750746453; x=1751351253;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
 b=h6wk9lSgEakKWEdjOxSXCCGIzszz1kGZe3L00oCqaUI0VnJ4sxDTXelOcVTbVZVO0C
 UXrwYezYXCEZZFs/DSC6xoWjGRHlwzsp/Z0ZQ7CYsahh9J61L/QVh63D+8yxjJAcqq6a
 uSTjeiQ0KlQZLqpUE2GOY7dPJqvHA40EiTAQE0jeMaKBgVSFQ6ybzTC3DUiwuwjsA8v5
 sRw3GGUbRTdg46f8Oiw4tG82KDpOF6S3PV1hzUt5zMMRhqtA4nI7EFC/hIEUCIh42ha3
 6xxBzEGWGdeQKTKuok6kcanIFaBD5htFj9wFncarqYUeNH5SMFDl2en9SOXBuTQHSjWe
 pZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750746453; x=1751351253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
 b=w5ky9k1PnR7nzWFdb39D3BHy+F5xk4CqJlu5YU5ryNdvQMlHyc5DSMm/l7kSAywaIl
 PUFI2UnTTgJDaERGh05rgoafLSYFXSoyoG7CcF1BDn99HLZFdPRTn85ssqdGTH6rXN5g
 1KiX29WN/IT+04IWNeaIQR3vfqxK1Q4+WrPW4BgDdj+nLAxBxU2ob3agnhNbA29rbJZz
 CAA/a/GIOaUzDZ3xLO3wl9ABlMDlTqI1KvxnDj1LkTR8KHK+bGZ/SXEQjAdvjHtWVvPZ
 hhUxOqhOGZDabqo1H9sP5YSb3mptzYEOXnHImZpyfMNS+wASz3aEHEdK+3Q76daEEaLy
 lciA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHetv/auzn41ICVdaMwKu2XqyIVAZ9mC6jbxg4/fHG3rInVJxGbH3n/bJa7t+bT3yT/hp4QKXu1ZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHUMZBwpd3rowXzOMT3yoi4O1mMHaLPAqCBUe9MQE5FVVQ60tj
 XTf/mdzVYPID/lySmC67JYzWXilEOhjIDn9ppwvXdPp61NrE4RImu8qTYHOpCQlHILc=
X-Gm-Gg: ASbGncs/ncKon4owVDO8Zk7kp7INKAWDuCi7IJltocNvPJokaJhpmtKj/CDkrFa56Gt
 zCPPI37O9gxZwntNQiE5qEbuPxSytSJkBVo2QM95OrFiY3aH3Q4/+t2sPYSsxPgYWKDsDnWnwnu
 gM6tgThpSUpS3GGuImSsqUIfvcU54DNUS/hViG4bRFd2VzXoynsgzEfVSYIATt4x111CajNEBZ9
 aVncZc2C2EPu0MRuyuKMTeHFof3jjuN9/bXUi2IwQqG9HEdkz8qYy0qn16V5+1STQwS6ViJSFdc
 Bb/ncIjWKWRJFe/lAyRwNl/85oQkGYUJxyEjbWwtb1DhESPxY7/b4V5+Z9OXkMUrZMuKXBhwj30
 LfPkZpetcAXeZvF0yuQUutJy/ETc=
X-Google-Smtp-Source: AGHT+IGXzXncSuwViLxhLF7LjICBNjU3M6FzetwciG96U6KAFP9MbxjiOEvJ2Uymt/tfqzWTPe1Bbg==
X-Received: by 2002:a05:6870:f699:b0:2d4:e8fd:7ffb with SMTP id
 586e51a60fabf-2eeda4d3058mr10282116fac.1.1750746452932; 
 Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
Received: from acerlaptop.tail542cf.ts.net
 ([2600:100e:b0c5:b996:8d65:22dd:1f32:69ca])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ee665ae530sm1957728fac.20.2025.06.23.23.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] gpu: drm: Replace scnprintf() with sysfs_emit_at()
Date: Tue, 24 Jun 2025 00:27:27 -0600
Message-ID: <20250624062728.4424-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.0
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

Replace scnprintf() with sysfs_emit_at() in drivers/gpu/drm/drm_sysfs.c.
Per kernel documentation, show() should only use sysfs_emit() or
sysfs_emit_at() when formatting the value to be returned to user space.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

I tested this patch with a device that outputs one specific resolution,
or "mode" and with a dummy device which has no output modes. I'd
appreciate Tested-by tags from anyone who can confirm that multi-mode
graphics adapters work as expected too.

 drivers/gpu/drm/drm_sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..66d1fc804c84 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -283,8 +283,7 @@ static ssize_t modes_show(struct device *device,
 
 	mutex_lock(&connector->dev->mode_config.mutex);
 	list_for_each_entry(mode, &connector->modes, head) {
-		written += scnprintf(buf + written, PAGE_SIZE - written, "%s\n",
-				    mode->name);
+		written += sysfs_emit_at(buf, written, "%s\n", mode->name);
 	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 
-- 
2.50.0

