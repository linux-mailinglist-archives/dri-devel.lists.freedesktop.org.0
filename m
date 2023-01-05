Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3E65E50E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 06:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79F410E6A7;
	Thu,  5 Jan 2023 05:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F3E10E6A7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 05:25:15 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 e184-20020a6369c1000000b0049de6cfcc40so8433439pgc.19
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 21:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C1k7EpJMZw5tl+Spv9BaaU5SqAboQcRVJI0Gv8NNZqs=;
 b=auDYddm/AQEds60I0ANTpA2xPP3VseMNbfwGpDGppyn1TGPhPgtMbRnyqBfxFIyNaL
 4QXIxzCOXBsg+uO6kXdbtndSanw33++AR6mPm4hxKHIP4v36q3i2ZJDFetYs6TRnSd+x
 YDh4V0llOnEcyLCOV1L2BruDAMAedFEE67W62Z+37jv5LClO92nYutIiewOGGoOyicUo
 TX+kkzvHwf7HVSmT/b848xd2OmD7HN4MW+iLy7cLvSCUgtgKb9kliZETPptabM2iwJ/+
 faXqiLO+LfsnkYcLWd4fzwz0QBBuJqiey0Xb4wfszySHtWo49TBRwTNvlvor6MZJ07fe
 ngMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1k7EpJMZw5tl+Spv9BaaU5SqAboQcRVJI0Gv8NNZqs=;
 b=pTE9/JNnbHkeq6ai9ywR7Nz2uapBGZIfgImsff3YuIVhS829S9omy82aLXSm0f5hIV
 cvcajDxyuM8vLD2DPygujIELoMkEHhjA0kusgM4iPf8R683RDzsGBolfX1wMld38ah0i
 d0582KKAr6pBdOt2at9Wx2gJDSECU6vu/i0IONt40tmVIyTCMFC4Onj4pN1OdARwsa4t
 cBnclM4TG0asEwqnWwoU2waXAsrDCt6lwaF0EKJWatKKj6SyHnq9X9qFr7Zgfjw6Ey7m
 o0tbNV9yNVSwnAdiBZPzF8GgB6AGLTn9avdfr8jhZJvLZUBfx2QI4eNY+sLr3oeYzPWW
 QTyg==
X-Gm-Message-State: AFqh2krxTRJn56Go6zv3ijX8S+cu5w1LApoMwpQvlUPr1pTXwU274+54
 wOW0l7D24FmWNS/t9X7NSBWKeflkIA==
X-Google-Smtp-Source: AMrXdXt14hWRUuL8PhN7DwrvdXXIsuucFxAJgrzXR2hE1WsB6WT01zVCGxBKBdtdr0nk+khfYK9p+WrIyA==
X-Received: from yixie.tok.corp.google.com
 ([2401:fa00:8f:203:97eb:6c72:18f7:423d])
 (user=yixie job=sendgmr) by 2002:a62:55c3:0:b0:576:b4ce:42b4 with SMTP id
 j186-20020a6255c3000000b00576b4ce42b4mr3318386pfb.61.1672896314908; Wed, 04
 Jan 2023 21:25:14 -0800 (PST)
Date: Thu,  5 Jan 2023 14:23:25 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230105052325.514970-1-yixie@google.com>
Subject: [PATCH] drm/vkms: Add a DRM render node to vkms
From: Yi Xie <yixie@google.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: hamohammed.sa@gmail.com, Yi Xie <yixie@google.com>,
 dri-devel@lists.freedesktop.org, lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some libraries including Mesa and virglrenderer require a render node to
fully function. By adding a render node to vkms those libraries will
work properly, supporting use cases like running crosvm with virgl GPU
support via llvmpipe on a headless virtual machine.

Signed-off-by: Yi Xie <yixie@google.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 293dbca50c31..8eea5d4dece8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
 }
 
 static const struct drm_driver vkms_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
+	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-- 
2.39.0.314.g84b9a713c41-goog

