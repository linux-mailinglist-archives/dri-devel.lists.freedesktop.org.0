Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AAB3F4F34
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9F6E07D;
	Mon, 23 Aug 2021 17:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812A6E069;
 Mon, 23 Aug 2021 17:15:29 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 18so15950023pfh.9;
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=c0f4kiiXc4IkYgZ7SwV50fvg9X1ZxF8YmeWTnH1aY4zr7f7CxUhhKSV/ZxhYEciPsx
 R4qVFbmzrhrtFLWu5p5Y0++tTcd6CaIj04UjTLFpXvsk9ker44OElUT1FAhJ1Rt0VW+L
 kJjfeN5Gn7i6bWpucmWiFYyQ16P3Jy332p1OBTQKhgyhWGok75i5BFP08s/R0+IH7OWo
 NtrYk744ZrR0r4l/25XjPCpwbOubap2eD0VpfKj1KT4MhXwPEorZId01Rru6W+3wAJk1
 h5BxeL35p/7pwLyuFfPvEvQyytrwmRi+vPiLjPoshVtby2FB5ccCGeT+9IpVO3fPjaEI
 IBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=jc0fIsYTvcH5jAKBGOHfecn9pt/ac0CV4EtyIRm6XpxTJl65t8YbpL4ZODIhdUj0sv
 Odm5QlfNfE+ZnaJlqfhhanAEt/GL6duZO/CrbpcK7HxnGnXuy4ftyGsuZT8vCJ/eb3WV
 b0EvJD4JL/zen+aNAEsdDjeqtipQXT/guBWdLGFvglYpQXIQS2QiUM7ZjHZ12f22q1sD
 /oLqZPV7+ukgjGB1MIEEk44/ClQb9FbDbRA8huqvAM0pU5rNGqaoKshyyPzshAFKnwSK
 7jBhE2AsoU10aTdP2xqV1z+TS9YQWGcC7yexJ5gRvZapD8JJDaUyIrFvlffTDROnFyZD
 rBtw==
X-Gm-Message-State: AOAM531WYesggzYwg3OxmacLIndG+DnF9G3O9AAWPdvKfAi0O8m+VZvz
 BNr6hk8RMbzUtmGFR949cRM=
X-Google-Smtp-Source: ABdhPJxHInaVZCTCItEa4Eu561qYx8GvC70vOUyW+CghTAjRug2jVLVxRcc+W6Xrpc1RMGrYbv9O9A==
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id
 a12-20020aa794ac000000b003e0f21ae6ffmr33941216pfl.76.1629738929457; 
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5 3/6] drm: lock drm_global_mutex earlier in the ioctl handler
Date: Tue, 24 Aug 2021 01:14:34 +0800
Message-Id: <20210823171437.829404-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d25713b09b80..158629d88319 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
+		mutex_lock(&drm_global_mutex);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
+	retcode = func(dev, kdata, file_priv);
+
+out:
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

