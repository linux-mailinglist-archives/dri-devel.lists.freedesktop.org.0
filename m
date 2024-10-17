Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6749A286E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E7410E208;
	Thu, 17 Oct 2024 16:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jbmtgCey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5F10E208
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 16:21:07 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7db238d07b3so941309a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729182067; x=1729786867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=84B0WJInqqjcmoF43Nq22SdcquNiLQ/awOiDN5FBvL8=;
 b=jbmtgCey8uzSI3MglNYTmlEcpgap6ABnLMhjZJXBXI2whxOT9wAiILdmC8ZosDb2J5
 kdKR2+5esU4YaznUMB/dN5J5uv3QjMT/QbD5+fh4tCUG6ko1HGgNqhoH1XOjNfmpJRBq
 q01OswNak0/c2/cswBC+Rd/FmMScP3lKgeBU0wbMvWDbaUThfKQLex2GAX1gKcl5qE88
 yicHgsMXJVUKXK5zzgbXujS2TgBmjZ5YCMbd1N+7hwe/ctvtO2MiEgUNmSP5OxdZQFnD
 d8Q0L8n0MfmWpns2cKKbEtZZOsIvlvF+QweVgavGO7b1IefWjwEcIbAdnFlHHUXiGZOu
 yMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729182067; x=1729786867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84B0WJInqqjcmoF43Nq22SdcquNiLQ/awOiDN5FBvL8=;
 b=In0SoEm+2k5mnVBUzcY+Hywfy+kmsfBw7CmeISFRauy99PmbOP0/hWB1RYgm0Jk86N
 hDqfrLyhxPJUp/J8uRyK0MeuEwmN1XsVJ41+5e4+r3qAxEjr5MKqIyYn3yMWSohyeu/x
 wKYwLX7Z2+LNTUwMCUSY4Gbf9oNcnIHqhN6n++LVs8vjJZxNyYVsxdnBIcC1rmHXYv1X
 2uYE5KsOfF1fFiz4MMGTi0iYnuVRJCrFm4rC8ZZzbZ4QO11EPIVsTUfk0mprisuF++VN
 XiMd8NvT0N7M8kc4pl0CE/I18wr4GLYhPRbtSZQi6Hjh4K2WUrp+ejzRCO3HQTiFcTuX
 Qhvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWirfBXspYlVTcALHOGvlc8shCNPSs4Szg9Ii2qsz86Q/WgLQezrpoID6FBaDXTxw1++BWRwgscCCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvMWdM0YRxnoVRYZSj3t+UUE3JHTKPJPV2havGi1a+aqKpyFW2
 xCN7O0+5x1McwkPBW3JheMB2qgnduBGCbvNBWc8yz06kdvWgiNvP
X-Google-Smtp-Source: AGHT+IF12ydOszUTm4oW68gFcID0rg897sNB9oDunvXXfgsP1WLjvYkHW0/D83GSYZ6gOdMzz9UlbA==
X-Received: by 2002:a05:6a21:394a:b0:1cf:4fd9:61db with SMTP id
 adf61e73a8af0-1d905e9c059mr13107897637.8.1729182067253; 
 Thu, 17 Oct 2024 09:21:07 -0700 (PDT)
Received: from localhost (134.90.125.34.bc.googleusercontent.com.
 [34.125.90.134]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e774a42c4sm4919409b3a.114.2024.10.17.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:21:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com
Subject: [PATCH] drm/syncobj: ensure progress for syncobj queries
Date: Thu, 17 Oct 2024 09:20:53 -0700
Message-ID: <20241017162054.2701638-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
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

Userspace might poll a syncobj with the query ioctl.  Call
dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
true in finite time.

---

panvk hits this issue when timeline semaphore is enabled.  It uses the
transfer ioctl to propagate fences.  dma_fence_unwrap_merge converts the
dma_fence_chain to a dma_fence_array.  dma_fence_array_signaled never
return true unless signaling is enabled.
---
 drivers/gpu/drm/drm_syncobj.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4fcfc0b9b386c..58c5593c897a2 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1689,6 +1689,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
 				point = fence->seqno;
 			} else {
+				/* ensure forward progress */
+				dma_fence_enable_sw_signaling(fence);
+
 				dma_fence_chain_for_each(iter, fence) {
 					if (iter->context != fence->context) {
 						dma_fence_put(iter);
-- 
2.47.0.rc1.288.g06298d1525-goog

