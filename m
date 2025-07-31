Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA9B16CA1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2D10E713;
	Thu, 31 Jul 2025 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ea8wcAQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8AB10E702;
 Thu, 31 Jul 2025 05:36:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so582677f8f.1; 
 Wed, 30 Jul 2025 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940205; x=1754545005; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ciDcGD9tQuLy73W2iFAgqEh2yygZMEmdyq/oIgQDGc8=;
 b=ea8wcAQdv3v2kC7nUQ9Q8pswJG5ZrwtzlWhe8fhEInSVijqGTotdLh0dPX66QMKWCg
 qznc5/CgrI7lzmbyTJXEW2dw/5T/Cf0YoWeAQuFu28wkQdvk0TkubNoNc2wJmi2BddlZ
 nBZjU7AYIY//oUNTSlbwk7uigvIK3UFtM0Ub7kTCDk3C5ko24t0f/TtxpEqCC6R3fYHy
 wtcDlzj8vvv7g3ajntdZ7mW2YkbPUAID9oi0Ycyw+fewop1tb+bOqvHgIzcj98IhW6LF
 F0CnV2UZWAPdxYsnxwGPbISfXBT7TESArEn6h3hZYY9foZQOp9biQWyF7j9WfTabAxk5
 HhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940205; x=1754545005;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciDcGD9tQuLy73W2iFAgqEh2yygZMEmdyq/oIgQDGc8=;
 b=CxzzaSZCJeQwBh2kt24M8BgFiXpTK6gcClxDWUBC3tNS8NZk7dCooqbD8n40ePlUf8
 gWDS32n8wSNXnCeeqtuFRkxUVa/p41kYlydl7DajVW7k41kX8eY6O+FBqrSd/8tpVlMp
 EkS7VII5rXghQx+LVBzXJC/KAmRO+sPWL4iFnQYeQF0BuKp7+hAAa8ZgSqQ3bIdk0XwP
 FllBQQQO2/0l07CpFynxo8kifYDEHPEArZTQ/teIBiRq6LYcml8njjeubN900TpHEZUG
 QJLef5mfx7BF6R1XLlWAay9iYHNDi7Ye7OGFSxFZV3NI2uUj9rw3DCgdSE191n4MvhY3
 eBxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFWydPJm/n9kAxUT2RUr1E5q6ctZCUbAgSSSYpGEOyJXN/eN+Yrmggryk64iDgVeNNOdIeL8d+m3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIAtSRUPr/rrjetat97L8Ui5UCCuHDJ1X8/naXtcG9S56eKhTl
 3n0LODuH1pf00uMkHQPdwslIeWoA3szFSp2Il49T0GXBzvJdKuCoLvMd
X-Gm-Gg: ASbGncvAMekQCVwlSPgMJnr6LKKgPAA9xGHMOOi+v47vvbCuLqbGKZIe+XUtv/Pbk8r
 R6apCqR21QyelSKVGmruiK0PdkCVJcY4WSKUhQl4JNn8v8Csuhyr07QMVNG+NZvXTUYM8OYh/VW
 d9rGhP/8f0ydvsu+BXAfbtI+WjhcUK8tdNBVB3PRFiAd+HfNleGrX55+CL1Wr3w3ua0zIOlUXB7
 pBwsOby06/PMYgUGYua0VKE5WEC2y600h1snK6kKGnxqXGm4stv1bmebHnMOgkiyyJ/++JqHtMF
 qBgstjYLndh8Sxz5zO9sMykD9BLnNXdpvViECjlbx+qCRAhY1AVOwNFMcN7xrAuptbn2Ln9G+vQ
 qKujY7cL+Z9Ca/yswUm6cEVly+Sdtn0rslQMkaIaghlaiPPWnNNiSmxqGw8yj
X-Google-Smtp-Source: AGHT+IFQg3GjgMIShqv9r+GrnPQh0001v5pGFRp3EPBPGnnFSydrqIzNSmvTsnfK9s5diM+fkCt51Q==
X-Received: by 2002:a05:6000:230a:b0:3b7:6205:25c7 with SMTP id
 ffacd0b85a97d-3b794fed24amr4608870f8f.13.1753940204915; 
 Wed, 30 Jul 2025 22:36:44 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:44 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:34 +0200
Subject: [PATCH RFC 1/6] drm/amdgpu: don't wake up the GPU for some IOCTLs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-1-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

From: Alex Deucher <alexander.deucher@amd.com>

Don't wake the GPU if the IOCTL doesn't need to power
up the GPU.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Tested-by: Philipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 60 ++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3bb9b25cd1219..34b9d63a86227 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2926,23 +2926,73 @@ static int amdgpu_drm_release(struct inode *inode, struct file *filp)
 	return drm_release(inode, filp);
 }
 
+static const unsigned int no_wake_ioctl_list[] = {
+	DRM_IOCTL_VERSION,
+	DRM_IOCTL_GET_UNIQUE,
+	DRM_IOCTL_GET_MAGIC,
+	DRM_IOCTL_GET_CLIENT,
+	DRM_IOCTL_GET_STATS,
+	DRM_IOCTL_GET_CAP,
+	DRM_IOCTL_SET_CLIENT_CAP,
+	DRM_IOCTL_SET_VERSION,
+	DRM_IOCTL_SET_UNIQUE,
+	DRM_IOCTL_BLOCK,
+	DRM_IOCTL_UNBLOCK,
+	DRM_IOCTL_AUTH_MAGIC,
+	DRM_IOCTL_SET_MASTER,
+	DRM_IOCTL_ADD_DRAW,
+	DRM_IOCTL_RM_DRAW,
+	DRM_IOCTL_FINISH,
+	DRM_IOCTL_UPDATE_DRAW,
+	DRM_IOCTL_MODE_GETRESOURCES,
+	DRM_IOCTL_MODE_GETPLANERESOURCES,
+	DRM_IOCTL_MODE_GETCRTC,
+	DRM_IOCTL_MODE_GETPLANE,
+	DRM_IOCTL_MODE_GETGAMMA,
+	DRM_IOCTL_MODE_GETENCODER,
+	DRM_IOCTL_MODE_ATTACHMODE,
+	DRM_IOCTL_MODE_DETACHMODE,
+	DRM_IOCTL_MODE_GETPROPERTY,
+	DRM_IOCTL_MODE_GETPROPBLOB,
+	DRM_IOCTL_MODE_OBJ_GETPROPERTIES,
+	DRM_IOCTL_MODE_CREATEPROPBLOB,
+	DRM_IOCTL_MODE_DESTROYPROPBLOB,
+	DRM_IOCTL_MODE_CREATE_LEASE,
+	DRM_IOCTL_MODE_LIST_LESSEES,
+	DRM_IOCTL_MODE_GET_LEASE,
+	DRM_IOCTL_MODE_REVOKE_LEASE,
+};
+
 long amdgpu_drm_ioctl(struct file *filp,
 		      unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_device *dev;
 	long ret;
+	bool wake = true;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(no_wake_ioctl_list); i++) {
+		if (cmd == no_wake_ioctl_list[i]) {
+			wake = false;
+			break;
+		}
+	}
 
 	dev = file_priv->minor->dev;
-	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0)
-		goto out;
+	if (wake) {
+		ret = pm_runtime_get_sync(dev->dev);
+		if (ret < 0)
+			goto out;
+	}
 
 	ret = drm_ioctl(filp, cmd, arg);
 
-	pm_runtime_mark_last_busy(dev->dev);
+	if (wake)
+		pm_runtime_mark_last_busy(dev->dev);
 out:
-	pm_runtime_put_autosuspend(dev->dev);
+	if (wake)
+		pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
 

-- 
2.50.1

