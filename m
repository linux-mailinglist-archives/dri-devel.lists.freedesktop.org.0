Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C714B2E9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B926EDA4;
	Tue, 28 Jan 2020 10:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DCA6EDA0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 10:46:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so15422735wre.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 02:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3rZoiKRigzrGogaYpNpj4r2DnzRmTt0NwJX5nL2lAQ=;
 b=Cco/f5ToVeK1LL5SBcNUtLddVdlNNC75fi5uHBMuffBxOA20jwxjS0sK0FOavYvVSV
 D2265QOW5uUC72VbXKbvoOZY1LlHTxaOstKdkfOJfcuGwTVuOPi73Rmfg8yBtGGs78c4
 txOjhU9Lm3ExD9EbZJIWKJu8bdZkP0bB6rEr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3rZoiKRigzrGogaYpNpj4r2DnzRmTt0NwJX5nL2lAQ=;
 b=P0N1LH3QlVLJIYmwaHC8YdcuuTMj17B5zwKi/TO42s6VZ1CG5tLg0kS5pNwFSMIPTU
 vnH+AmR71LigmoG7wwL/bkYnXCTGmx9BSRVqMTJcF8NNZErBXM+zd4C11bNDQAuMy/sw
 THP4mQwnNtJGq5W8W8hYqUuS2BcwwxKRkGEZIj5xMQRQSTyjiwDH+KcaCXpTSFcGLSjU
 D9Nn0WVGArfxk9J5Fa0SROcngeZ9+dVW5mRGJNOSH0IfuduvPuBrKBi5b25f72tcY2cg
 +RcBLqe8xVQj1+zeyHQawbjupEE76IY7bsf76d4P3mfG5rnF+8m5lg1+LC129tKCIYJl
 9wRw==
X-Gm-Message-State: APjAAAV7kyCyq1RcthTWr9jzZGTxzq3qXUdZHFQ7+oHHmWcv+uufPfdu
 P8hly29Bv8CKXH5/smHwVeClyAHzpFeq6w==
X-Google-Smtp-Source: APXvYqyM1dgOq+VZFvbHGu1DZMsNqOgOw/t7JT/+y2h6wEw8IQFl5aEJLXUClr4un5RIUovvhXYSgg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr27651927wrt.366.1580208367404; 
 Tue, 28 Jan 2020 02:46:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o1sm24998733wrn.84.2020.01.28.02.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 02:46:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm: Complain if drivers still use the ->load callback
Date: Tue, 28 Jan 2020 11:45:58 +0100
Message-Id: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kinda time to get this sorted. The locking around this really is not
nice.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 6 ++++++
 include/drm/drm_drv.h     | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7c18a980cd4b..8deff75b484c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -948,6 +948,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	mutex_lock(&drm_global_mutex);
 
+	if (dev->driver->load) {
+		if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+			DRM_INFO("drm driver %s is using deprecated ->load callback\n",
+				 dev->driver->name);
+	}
+
 	ret = drm_minor_register(dev, DRM_MINOR_RENDER);
 	if (ret)
 		goto err_minors;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 77685ed7aa65..77bc63de0a91 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -173,6 +173,9 @@ struct drm_driver {
 	 *
 	 * This is deprecated, do not use!
 	 *
+	 * FIXME: A few non-DRIVER_LEGACY drivers still use this, and should be
+	 * converted.
+	 *
 	 * Returns:
 	 *
 	 * Zero on success, non-zero value on failure.
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
