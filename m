Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57F9AB3AD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2567310E6C9;
	Tue, 22 Oct 2024 16:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eT6TLi86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541B10E6C5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 16:18:43 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71e49ef3b2bso4141218b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729613923; x=1730218723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DSXH4Gm2YkCG5jqOLZfgl1YXuWNP9Yfv+roVsfCw4LI=;
 b=eT6TLi86RpIF5bzTa0RaTtZO7RDAmyp4TP7ucAirnnrY2XmCRc2ZGeXFP9El/1l28z
 boGl8HfrTC9VD2cJmg0QieOIfscpLTzy0Wd87LgvJZZx7IYAY2VSiW6vHnE4xmqAf7cT
 61GzkUAa0sdX91BkSF1sCYM9sAOY6tiZujABOUfHpUcIHmXbr8aduq79nA43psxiQ7ud
 6mdzEev+AEEjMESEbG2s1gtC+QWXdRRtcaLWuDCJTZ/pp29caHNd1EWKbKPxPccOHqXa
 sC2iRGyY2viyfQTcoWxvcSqaWwTn/zdv35NW2hGmxBfqhUcq82w6yDlutNUjBlp6GGsf
 2chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729613923; x=1730218723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DSXH4Gm2YkCG5jqOLZfgl1YXuWNP9Yfv+roVsfCw4LI=;
 b=G9YtKJOy/xJ8MBQR1V43nupCkaGlQpOl8EVD18u++dfBrwp8MgeLMVgGcqzFA3ho9U
 DvdNIc1po8Yiyspa2im/V7Sk25cPz+4a/rR/TqsU84K8rI/HBzsH/12bZpH2Drh9XXvc
 wpRUWZzDaWSj19Nfl4AI7fQUO7ClPKqf8gSjP8ttZLGwsgNyk/RynloJlmVvTtPaFAG/
 Z+AK4PAViqRlhj4wEZNu++KewsShL10wyFQeo7aEPHI1q4qSaOUcbVlzIbFJJ2Ced+bX
 qz/Pu87ImMVkChFi+hipiaXYDzscCLZYOA9hYWg4/e68jKrN2Jzul517pjUQ/ZjMkGcV
 CIlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmdEaJcfUmbugrVoKhH4KevozEfoMlOUnJRr2ZfkxGuauf+7faMGobs3b8mzeSzhd43OZhS9LWEc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY7JqXOcRoH7IlwcvSgDzBnjZ5dr/ef3A5T5a3wZJL46cFDbQx
 hrBwmJl11RYDnPCOHJvQmeIqEVGj4a2ygPPU+9+mUHtI2juCTH5M
X-Google-Smtp-Source: AGHT+IHQyzAjc0meceXpnMSob+rxgdiAsthihq0A0o40myz27LC+W3+w2lz2hV72240cPH71b29JYA==
X-Received: by 2002:a05:6a21:350d:b0:1d9:ea5:19da with SMTP id
 adf61e73a8af0-1d96b6b6ed5mr3806414637.17.1729613922722; 
 Tue, 22 Oct 2024 09:18:42 -0700 (PDT)
Received: from localhost (134.90.125.34.bc.googleusercontent.com.
 [34.125.90.134]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec14088fesm4894285b3a.200.2024.10.22.09.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 09:18:42 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: boris.brezillon@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: faith.ekstrand@collabora.com
Subject: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
Date: Tue, 22 Oct 2024 09:18:24 -0700
Message-ID: <20241022161825.228278-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
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

Fixes: 27b575a9aa2f ("drm/syncobj: add timeline payload query ioctl v6")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---

v2: add Signed-off-by and Fixes tags
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
2.47.0.105.g07ac214952-goog

