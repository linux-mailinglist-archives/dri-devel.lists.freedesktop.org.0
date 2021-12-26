Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F247F66D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 11:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB71810E6F2;
	Sun, 26 Dec 2021 10:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593D10E6F1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 10:41:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b73so7884514wmd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/cIP//uzFRFV87jVN39f0dog6UQJqLvS7DxqTem8FA=;
 b=k9o44mibKBF3U3K6MpVibRS05DQ39Bkul1GNZ17pr1M8wR7rI/PVYDPPHit3jxFmmo
 /Ok6zyd+o7Djl71zz/LUBXTkgTzp3iuturrtFZi59y6BOBYVGuIxzFabexVva7x5+qm8
 GsDw/GAkZM5+zxo5tVW6lR83ozxgc+kkgWtJtKzhnUeGOS/Ri15ZxapxHcvmSuluo6LJ
 s3iI35tiRj39TDbylzOL9gdo//QL+GyNIeT7XtzF4xoqK/cvb87M9rJuQ7ZE29wEdqe0
 /YVYOWPhbvj+PQrSySyQh8SJWpUoMUeuoLC1Y9cFvqEF/Ki1cpfk/ZV4amNDcGMHEyFx
 reMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/cIP//uzFRFV87jVN39f0dog6UQJqLvS7DxqTem8FA=;
 b=y286Xv/Rjs7wkbrQBoQrjjYYFx6t5SMHBN4VuFy6RcXf4EskvhheSuy3Ktm0EuMHZa
 3e98VbH6gphVMfd82nRMLhgUAJf8MprWkMNgvntjwnAkceys5kDCbMF3RHmirLRA5pOw
 hWPICPpy77uI8QD9mCna53a/YYqXW7C06bZqb2gc0Xc1BbbHl7D2Z2ffMgBLQyVoJX8v
 XS2Roa/8ImW8WyQRc48ZrDEdCJujJX6Ren2qSf56ot2NkIDUICcLDM8xJIau2CY+aKWF
 Oiy5TblAq8ESwFs/Jn7ipKkA2OQMsIAAaB4AbULv105InL59HryNjf9t+v/1U/JYToqH
 CjzA==
X-Gm-Message-State: AOAM5307yl6hEUPi2mcUD2+a6D6nKeL8J+ooXUNBahBl8y9FniMJtckW
 3TIwiI01NSAZIHCwu0WKCpw=
X-Google-Smtp-Source: ABdhPJz05AhIC7RinIUTTsIaa8i1N21Jei/lBp2V+EMhlzIwtMLrYG+QsCfrfJcsqgckjmR1Nkwj1A==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr9325342wmq.195.1640515271595; 
 Sun, 26 Dec 2021 02:41:11 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g9sm12592729wmq.22.2021.12.26.02.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 02:41:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH v2 2/3] drm/vkms: add support for multiple overlay planes
Date: Sun, 26 Dec 2021 11:40:58 +0100
Message-Id: <20211226104059.11265-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226104059.11265-1-jose.exposito89@gmail.com>
References: <20211226104059.11265-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create 8 overlay planes instead of 1 when the "enable_overlay" module
parameter is set.

The following igt-gpu-tools tests were executed without finding
regressions. Notice than the numbers are identical:

                    |     master branch     |      this  patch      |
                    | SUCCESS | SKIP | FAIL | SUCCESS | SKIP | FAIL |
 kms_atomic         |      10 |   02 |   00 |      10 |   02 |   00 |
 kms_plane_cursor   |      09 |   45 |   00 |      09 |   45 |   00 |
 kms_plane_multiple |      01 |   23 |   00 |      01 |   23 |   00 |
 kms_writeback      |      04 |   00 |   00 |      04 |   00 |   00 |

Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2:

 - Set the number of overlay planes as a constant instead of as a
   module parameter (Melissa Wen)

 - Add a test results in the commit message (Melissa Wen)
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..9496fdc900b8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -20,6 +20,8 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
+#define NUM_OVERLAY_PLANES 8
+
 struct vkms_writeback_job {
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2e805b2d36ae..ba0e82ae549a 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -57,15 +57,18 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
+	unsigned int n;
 
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
-		ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-		if (ret)
-			return ret;
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (vkmsdev->config->cursor) {
-- 
2.25.1

