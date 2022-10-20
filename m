Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963260699E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 22:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08FE10E00C;
	Thu, 20 Oct 2022 20:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F310E00C;
 Thu, 20 Oct 2022 20:40:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v1so1223182wrt.11;
 Thu, 20 Oct 2022 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mkrkmZwXDzkYF9cZqoYViFYu0UrGpVfkJcqp1qpBeoo=;
 b=a9K8k/CwhSprlmF43UJ2k22M5MSHa7rKHiWH4Nt0pNXlYmi08nQKOCCjpW8uFBbhCl
 33Pu1CdDye7E9TGgScGq9PX5KlgahSIe7UgScicfUYAry7ygOtF2IkBEtoV35y43G65O
 Ocr5Mt2qxuO51FrQCTiuLomFFim23vL6yi6PKyZXjHEoJzQ3PtOiKIksRSX92UEEyy/1
 XHS4mEKAr5WIM9bu82LpZgHIXc8AXMK6BaYHB2cxfT7GVolwmgTxyu+vBaO3Nw53x5tP
 32+mluIb/8nif83ugri58TyUimXNs3Ikg1veOmPAcZD+fpZNtK1RZpMPxqtuzX4TCdOp
 jFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mkrkmZwXDzkYF9cZqoYViFYu0UrGpVfkJcqp1qpBeoo=;
 b=1JLL+VFgGNwvXG5HtFtxLYYd79ZZchEqw5xGsL+srp/lLWOAZvimu+OYMkSSN+y/14
 DGqBEe1DAuDYRyfWjkzKc+9tVw4o8tfpcJiP6RPNbsG2ocQ52O4sbXnIUAtMpf8cbYFL
 r3IdJW/7S2O21G72aGcv11Vt1LYsZkesN9rc/yIziX093hjwyCEcipYWNvurfUn2lgPs
 +wlSwff9OvSPIqiKVhuNWzSbhQvCJXNxCogA5BSnfj8wyo7jfppoDiH1T9ytcAHgKs2I
 HcbJrAxq2cu00ZjZtYBKBiEreDPre1PVfZlKfxebJatPVCPJ5TrEdDr+M28nNVU1v5Gv
 2AwQ==
X-Gm-Message-State: ACrzQf1spDc4W7ZTtfLKUu6VfXLXplbCDHjw05wYurPQvdch+07mObgN
 zWfftmeWVZ7hbkdgjN/Yvy0=
X-Google-Smtp-Source: AMsMyM67tNgAY4J1fpflkAr7KqOx6xMhtrINneS5zul20iJtySnTsSrOlOeIKXA1UNfFZBk2cGHnsA==
X-Received: by 2002:adf:f983:0:b0:22e:3c8:27ae with SMTP id
 f3-20020adff983000000b0022e03c827aemr10265898wrr.16.1666298453757; 
 Thu, 20 Oct 2022 13:40:53 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 j28-20020a5d6e5c000000b0022cd27bc8c1sm21014463wrz.9.2022.10.20.13.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 13:40:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: remove variable num_relocs
Date: Thu, 20 Oct 2022 21:40:52 +0100
Message-Id: <20221020204052.42151-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable num_relocs is being incremented but it
is never referenced, it is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 30f58b21372a..3422206d59d4 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -146,7 +146,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	struct qxl_release *release;
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
-	int i, ret, num_relocs;
+	int i, ret;
 	int unwritten;
 
 	switch (cmd->type) {
@@ -201,7 +201,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	}
 
 	/* fill out reloc info structs */
-	num_relocs = 0;
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
@@ -231,7 +230,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
-		num_relocs++;
 
 		/* reserve and validate the reloc dst bo */
 		if (reloc.reloc_type == QXL_RELOC_TYPE_BO || reloc.src_handle) {
-- 
2.37.3

