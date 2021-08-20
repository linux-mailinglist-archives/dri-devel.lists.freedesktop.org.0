Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B534D3F29CF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 12:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAC36EA50;
	Fri, 20 Aug 2021 10:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02486EA50;
 Fri, 20 Aug 2021 10:03:49 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so13466988pjr.1; 
 Fri, 20 Aug 2021 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=DTQmjYbeclJ/d85lmygNs7AQOxoVIEgJifRv2qQSOWvqZ2ZZ2rWY/looltY8Elkp94
 tBSeEkCIew/UhUnyrbqdFtHVhXWK9S/xgAOoa0cxD4dA26Cau+TwjwQ2MiKvSUp3UBOJ
 3ALHjolNoFTSFhdHZzTUXlBa4vlPqtchzwsSLBYQB9C/ZwNy7iDCtU2d3Pu8bWjY/F5f
 vDs6F8kL/cWPMz9qfbCTWsNRyab9mhiuGdsF6QrPf3hAScC1rHNgHcndN/OfZu8xIAE/
 FmAMJVxwiE4yvYhiC9HTr73nQS6OvqGHo5zvHigLOMsBzFIvEahGL09MXfi7a3fCyOAj
 GP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=aSyO8RXnrHEd6fANBtxhmRGBaf7Zgx8clEWNT3B6xdyCkUnkvuDyajNcFgiTDD0caA
 UB8HL0k7WcqLyZhhHYxt20aOghg2oaNEzwJDB6dL4+60XXu7UtZ4G7Wq1aFKC6q5mFev
 D85celhKHCkwtaGoHgA+2qhJJAomLo4m2JXcTVOoUvm8SlcJmiwpXLOXY4P8M7BGSxhS
 z9RNcARWs8fMFO/K3S6Uylm9FXsiToCfRijO8/M1S0IIUePnWEUYC/wKEcMex1sw9+Sd
 vAE19nUL7lu6+QoX2/i97cpffXeSCSxywHqAA1PFAsrakHa5jSbX8ugiHH+Og6UONcJx
 JgYA==
X-Gm-Message-State: AOAM533sJ+xoZ7AhkxCiSKj9UaSB80bcy/DEjUwJBzyTkLiSJ+R21+u5
 bWBXOEgHDWUiYnqNFp3OX9s=
X-Google-Smtp-Source: ABdhPJxOTH91Pz0k0J62G0Pt+WjUnOM3YkdiIdgJpG/hwhsJm/R8BUkhMqNgSbA2rjecLZN1+wn50g==
X-Received: by 2002:a17:902:a604:b029:12c:dda2:30c4 with SMTP id
 u4-20020a170902a604b029012cdda230c4mr15447497plq.73.1629453829526; 
 Fri, 20 Aug 2021 03:03:49 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:48 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 3/5] drm: lock drm_global_mutex earlier in the ioctl handler
Date: Fri, 20 Aug 2021 18:02:49 +0800
Message-Id: <20210820100251.448346-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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

