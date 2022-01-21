Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9446E496762
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7762610E460;
	Fri, 21 Jan 2022 21:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948510E460
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:10 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id m90so19325153uam.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YouWQBMC35hS9vP8MX9BwK7+cpKBm2hXUisuZuryQ/U=;
 b=IZpgBDYxlWZ18abYpGccZ8kWhXeHOM/aMY/RWvvSLykbOWSgbHDzUXmtv2qW7e/31N
 /kpIvIP2+y5NrhJyWXgETkZZepcsqUHKHMNMzXKmYbn8QBSljnTEXsQ7601ztssNSOYg
 Dm6aEW45kp4aDXDPp2XiaQLdIeUDmcFC8MWQbb1fEQ9QquD/KeAhanmyeHb6wM4eHkcH
 ySNDnGarQazjN8a5XYDHu50+auv9GiM/DTvBqhIV+n3EibSDGSIyJPQ/vzDLcySs01zb
 1zrSY5bYp1f3igjfJm4rd4BjGvRNyfB/xTUNkmbzSmcnBwZ8TkU0RafVtRBD1fPFKSOd
 ipVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YouWQBMC35hS9vP8MX9BwK7+cpKBm2hXUisuZuryQ/U=;
 b=32YTuNNOO/5UnBE9gdNOWf4CRJ+jRNjKvWt54Je3sZHO6jGT6RSAJEyLbl3fBFGHod
 iha93sfF8WP2rF9/RQlsKRScJNlvG3xMk02Y3c0nfjR7bFLZqtvC6WeLIYwiBxKa7Z1M
 3vXG3A4cITrL4X3XD0sZq3Pb5BDuUcsSVsvULJGfmyR3Okiee+7G1XQG0R0n/FJwRNYm
 BvWeYUeM0KFffNnHPW+4EPpy1KZ60l0CS7824WhMCwqdC0GEpsg7yJBf1w3kHSHxuJXk
 DQrO4IJSoYhxoUnI+yfVHOYWhR+xVegi66ribRrTA8JfTrVO0rhibb6/B5ULsqpbgV4m
 kkCQ==
X-Gm-Message-State: AOAM533dQdfHbFnC3SFPOYh4QHaVdRN8a4hhR6XQ1X9RQchPvCy2rCLt
 sj3g6F9lxcejbK6HgDMMD74=
X-Google-Smtp-Source: ABdhPJwBAhjC2EXjixsxNjI1cvrjTKTj8SACcOwiPK/cZWOzCqXUXfVDvH1BbTSfXU/hBDJoqh5CJw==
X-Received: by 2002:ab0:7145:: with SMTP id k5mr2519061uao.5.1642801150109;
 Fri, 21 Jan 2022 13:39:10 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:09 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 3/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Fri, 21 Jan 2022 18:38:25 -0300
Message-Id: <20220121213831.47229-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 9496fdc900b8..0eeea6f93733 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -30,7 +30,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

