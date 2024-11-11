Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692229C44B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1F910E504;
	Mon, 11 Nov 2024 18:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m32qUSKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F2910E303
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 18:14:49 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e592d7f6eso3579200b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731348889; x=1731953689; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PcG5Ghtfgj5GW/5qfLw7yewkg+yGj/V/bjMocxCMdSQ=;
 b=m32qUSKsoRjM49bMwtwZrYTaYlCJlsV1DbKTKkMBQvU/o7ZhbvhApkPp3pi7vOOBCd
 F1rIvjeeXBllmbIzCymiSRaME8UOFBxRv8YOL1ng/Yj+zgtLleEaX4aZ2uqpV/OYUIkv
 TkhOm69bML7Jejjm3Nzf71hOLlDpsv0b3gHuNoVc+cPWGLckZHq7lKrqjP9+PG+LM4Ry
 Gsd4TF6fHkyelUmnRTwYusVXJPmdX9pYRT9Iu+ziJFfX0OroIs+4Fn9BM3VfVPzZ+MC+
 sW64xl9X2VI/+wxqfdhtGnNYXk8JXdL6WsiQtDAdhcn9NHt54R/82oRs0+oDEa2r0W5R
 l2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731348889; x=1731953689;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PcG5Ghtfgj5GW/5qfLw7yewkg+yGj/V/bjMocxCMdSQ=;
 b=YGZ2O5ixSdZcW4fPixi9kqIKhZ1byLJL+jEBWUz23EMh7GUdSPxKBa/JUlu+aYozHX
 dAwAro4OZ7IEWBVd1PdzHRbZJ6O6+8J4MtxUoePYGhzFlMcBJe8Q1kkPOrCyfT3lWvAZ
 LobAPT9AFL+s4aiAt1EpgQP2M5//6UyB9oM9DWpxisM56EgQFm9b8oq1cj0XdO+bxbap
 7uZOpVWkUYo3FCXfbj004vvGg8siZmts2MjBmqeFBBGEknfGNZ9nEzryiXr8uliPZXtp
 vs8uNh0h+Xmbtdu8qOTOHGF6vD6rEVNx/I8LyJ9VLkDHQ/6fhchiJ8AbCaae5faZVHA0
 3+LQ==
X-Gm-Message-State: AOJu0Yzgca7aXPpA/89JUwK8Mp04ZUe3LYPTWnNJO8hmmsrK/EdR8ke3
 uy0dnzk5hWafhKMnzFi1zhsIEDdB5vW6fllq1af1YNqfP7LGyMLr
X-Google-Smtp-Source: AGHT+IHRY0yX/5Z9BgqASQU4ZZ39SI5JUr83H/XUjHQ21anzAVa6uoUX7kOFpkJY9khvsfngWxmH4g==
X-Received: by 2002:a05:6a20:a10e:b0:1db:ebf4:2cb8 with SMTP id
 adf61e73a8af0-1dc22b38e98mr19023560637.38.1731348888950; 
 Mon, 11 Nov 2024 10:14:48 -0800 (PST)
Received: from Emma ([2401:4900:1c94:38cd:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f41f5d9460sm7537614a12.35.2024.11.11.10.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 10:14:48 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Mon, 11 Nov 2024 18:14:43 +0000
Subject: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJJJMmcC/x3MQQqDMBBG4avIrBtIotG2VxEXxkzrDzJKYoso3
 t3g232bd1DiCE70Lg6K/EfCLBnmUdAw9vJlhZBNVtvK5NRPIFjRT9g5LDNk5WhqbZxr1OupS99
 Y52sfKB+WyB9s973tzvMCtI1RQm0AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731348885; l=1580;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=2TXJ1EmXXe6JGcHq0islC06ZuiS7W6be+KOSVMPiOMY=;
 b=XnSsGvh9arXwU0TzFneIvfBvnhGG3ywcwXCrVXSmtOIjjRf655y5J6qAlm7chmE39XOFBDzZe
 nUFfZpHEs26DRSdOnEKnl4vOjiv5k/rnxZz0tZkMGvmD1Uwys+tKhXs
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
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

Initialize the pointer with NULL as mtk_drm_of_get_ddp_ep_cid
function might return before assigning value to next pointer
but yet further dereference to next can lead to some undefined
behavior as it may point to some invalid location.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Message:
CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
3. uninit_use: Using uninitialized value next.

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/10043/11354?selectedIssue=1601557
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;

---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241111-uninitializedpointer1601557-9803b725b6bd

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>

