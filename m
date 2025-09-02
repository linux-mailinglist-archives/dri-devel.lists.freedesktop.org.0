Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D3B47803
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88389D9A;
	Sat,  6 Sep 2025 22:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RGfrRJ2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1A910E667
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:21:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-77252278757so1473106b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756812115; x=1757416915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmBFxHhYRsHxUFb6yKl311GgplCtiII3+UFgBt4dL+A=;
 b=RGfrRJ2tpr1KHG+y+EAc3XGkepi8pBOZcu/ZzHcQOkuY5uNoU/qdHrepYT96D7rUed
 edvh7QsWOPmY00PTDQnOeAzUzvmNNjNUfXyOuXGDP8pBmMRW0BAqdQXj2Vitqr+wUObR
 Umlsnt45wxgQLTuIP7ODnaFXMh1xr6mc+r41EgzDD/rV2q1vJ43DAWvnVtx78PKa9sb9
 pTeQkVv0fR3QJM05/+r9bCG7rALY6kJdjbXF7de8+d4BLk7SF1ZFAlfuWmbalsAyjNZ1
 ig0w7NaKBsEmoOGhbGRrS4HMbinjOTsFb+gBOFN0RkG3034yMZQJ8XEoeQM/BFopMz41
 XDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756812115; x=1757416915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmBFxHhYRsHxUFb6yKl311GgplCtiII3+UFgBt4dL+A=;
 b=L+XkdtdVWLBfAyAbbYBYHnuRNvtLDiA8iPikk//UA5XQ07IxMmM++6+JJFgVCBVS9k
 I1yCC/lTnYG+IiGBFTeX27RoMkTl/l8cnPmUX6/R0JrrRKId/ZTL5ZlSTtPev/tjZBkN
 M5ZIrS0n7MjWEDGWlx8JDHRsZBi/K8/wxMAy00XDf70sUj79xdXEIwdVpYcbZJ8ZPs5n
 Z5/sNVc+WbaCEp7okSlYgaU11gSMi7G8DfAoZkd95tQt8/qY7VoQ41gsECjslJjSb4Ba
 kBbHVBpPcFu7y0fCsEWGJYWa9VywKKTNTO+2nR3FiX7fuFiUzMtN4/B7z8Wm747nfTq5
 7zMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM69/hj1K+AxG6QcoBiHBAm0lIidRHNPjVhNLjlv+beLzBTXcY4m1otU+SdEzUAfnrW5XsaomGOsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziWP0RJOGlRutHbOtgysdjdImKK9L/9G7U3nBVAx6UoQJW/Zhj
 zd3Nk4qU2AL1XDN3QhWOnNVnMVpiHrRh835grL9k1mavXqfVrAhA9GPq
X-Gm-Gg: ASbGncvqLXY9y1MfIbfOei3PtHeZKRFkWoZrtGzEzvDUEIt4+GwiXegBX9m330HjEbn
 W8oGo6+EuypQqEMaU5JDwPHQcGK7aqOAaBsklmdENkBvPBYa8SUbXWqKcam927QU5f/v03OKdkF
 HiT3+En6+Ks5EC3wtyjx/48PuY+eS5CvJT0gRok+tgI746aswPE1RlPjbo8r/i5+RL+sa2cheXH
 zkNwn5HLoFrLXpRc7pyRDWwqVZQV1X3ByZBrpQkZ14X2GZfqOzv37mcL6yrezzLI1bCdVvD6GHh
 /6b++zi/i35xkDXdqNXEDuj+SJqbjyKYisOMeBHrTaGSSw1JtJ2eQ+bCidR00Mod4l0xC2UnBdA
 BC/Sktkvl2jj74BDbVGfUsZovuxO0pQ+gDh1PLLHYkHjo2fVX7s1LApVb3S8m
X-Google-Smtp-Source: AGHT+IHagalNzYPov+qToIRn5726tUcNigXXQLmuwNeQCyxqjqgOyE8ZJPIjKB/R2FuzA1JH42ZaHA==
X-Received: by 2002:a05:6a20:42a3:b0:243:c38c:7b3d with SMTP id
 adf61e73a8af0-243d6e10746mr16673032637.24.1756812115058; 
 Tue, 02 Sep 2025 04:21:55 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:21:54 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: krzk@kernel.org, alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, aha310510@gmail.com
Subject: [PATCH 3/3] drm/exynos: vidi: use ctx->lock to protect struct
 vidi_context member variables related to memory alloc/free
Date: Tue,  2 Sep 2025 20:20:43 +0900
Message-Id: <20250902112043.3525123-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:44:18 +0000
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

Exynos Virtual Display driver performs memory allocation/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 601406b640c7..37733f2ac0e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,29 +186,37 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
-
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/*
 	 * Use fake edid data for test. If raw_edid is set then it can't be
 	 * tested.
 	 */
 	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -243,11 +251,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
@@ -281,14 +292,21 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = drm_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
+		mutex_lock(&ctx->lock);
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -303,7 +321,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -326,11 +344,15 @@ static int vidi_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int count;
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid)
 		drm_edid = drm_edid_dup(ctx->raw_edid);
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
+	mutex_unlock(&ctx->lock);
+
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
@@ -482,9 +504,13 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 }
 
--
