Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764FDD3AA7E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835E10E45E;
	Mon, 19 Jan 2026 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JC8wVxV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97BB10E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:26:09 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29f1bc40b35so41522815ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768811169; x=1769415969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
 b=JC8wVxV0zdEfcaeqpRfbNi+LtIHGcVWN46QBp3Ik4HddKmNjs0MjyiZeqNKTgCxfr+
 jhIR4D2gFiXtZn5mb7eEOxaL16GBGrTtUtV2RxISYuEgEV8G4AfxfTpPuxcY3DaJT17v
 QYpjj2waGKcyss/TSyLBbaVWMd1dDzqIKr68Z8btlDMFwI9lEKoqBuVX4Mm27j1gNi0s
 GKNN/AB4WfqmFKp4QDUZTD/o13HgzcJc0r4VZ8EPvmxu6oF+lmxCIHJDkoSm6wARW8nO
 aICmqUpQ++EeTiQMBmlFA51+qEClSswiRKGnVRlF19GZ2FzPkT7W0RB63a/uzXlcZYeh
 oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768811169; x=1769415969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
 b=IsWxHPfy0HYrTDVBhV7d3jjifX2grDe63ER5uK5tlCElnRUtL90myOb++WQk+0JsZ5
 GMtpSP/FlSrm/NmRjPXtHrNGUrcUeNT1DDSk/InlxEkoIfOpMIW41rxMR7t7l0pCtlBl
 KsxvHpXLdl9x+kx7QHgMd3Dhl0hZ25wUG7vE3tuNnGeMGV5IIGNPyUioR59kUHYexVGA
 Hed8jg5KY0mgq9cvkBlP3OV0VtCgnwnhewjnrcyKitv+Om8F/MXpg2O8zRWZ5ETOqHXp
 /TVBwbDwG+09U2GhRePpqFp1HcgCB+ALwclJDKktblmd/JhwAUM0qMnZ5zphnPD2Zriz
 DAYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIFX/GT+J+8g6aEH9nvpOV56lyHPGnMx6fk1gFM/TA6Sb6l299r+FyjDtFZy2jhlyIVjsDA60ghGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPIKGwpcuaIdT/EzjagxHvVcYWcaOGH75WR6zl6pC0CH33gSkd
 sndKTzVVQ6fF7tbDi2IX2ROwiCGs6v0oArAj7Yb++WlE2mhRyieN1f81
X-Gm-Gg: AZuq6aK0LdnzcCsFeLrRDpCsHxPR6foSTaJ+q3fVLWM8cQQsCrRfRnyvG+jiuyVGdQV
 FE5Vi3Y0Q/YUyKgvQiMunvuq4WArizRtDccTRvYzIoYcehA3PtIlnSiFxVwiAd7tJ26FvRBkKBC
 IjAeDww9I2v5dPP6iNKwWQbxRUCDtGpb/FhmwkbvmEdmQg/RdKK7zK98glh6c0sMohhmZBguJrO
 goSPG/TqAmKUOYfUtNhYuLjJL0lqQqBX4Wz0f7RLq2Sl46dvesFPTvM7dJIssl5iSAXOh3tsW2U
 +dyCZDi/rmtpTHtWHAQpr1tjhqe4QVg09y++f0KPT2VEEt4UHgJe0Bc/uIxumb71GQ9Y2JlgB8H
 DlwPdE+yA+GjYuuI2+Vb3zY8nxeVZXkXjfuAghUUKKqR303FQpJv7ag8FrzQY4HZhe0IMJnZT+4
 vh56fcCNbO6qqpsYEnPjxAEkhOYpfKtA5bf/ZX2g==
X-Received: by 2002:a17:903:124f:b0:2a0:c84f:4124 with SMTP id
 d9443c01a7336-2a7177e2b6fmr92683575ad.52.1768811169196; 
 Mon, 19 Jan 2026 00:26:09 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:26:08 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 2/3 RESEND] drm/exynos: vidi: fix to avoid directly
 dereferencing user pointer
Date: Mon, 19 Jan 2026 17:25:52 +0900
Message-Id: <20260119082553.195181-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Jan 2026 13:39:11 +0000
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

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--
