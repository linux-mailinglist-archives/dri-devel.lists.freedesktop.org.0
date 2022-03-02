Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2394CB911
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4647810EF3B;
	Thu,  3 Mar 2022 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9610ED11
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:09:09 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2d6914a097cso18113507b3.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ZMpzNEO4OPsp548pYzGhk7wZS3nBzSDrcI4nxyW6tZM=;
 b=aiIy58X8kGzp5JdrFAHj8izY/rdF4BudQOUeB5/s3q4lshKXZ8omiY5VgIxx1xhf4Q
 dL4vmHW8ZXhN7rL9CYSUcnfn6JmdPeZOm0gq2PBtrVRbSuGpUhOtGZG3N2eKrLAKmSAR
 wWhWGgSCdOTafxyzWhmfnjnvO5aWcs15wKB4QVsUrdYVnaa9lYECPBmn9dahI2ohVyBw
 JZx+NG4w2d7VMBIOlTGPDcJSKtUIJaQ06z7RksYPil+b27jX2AhwrL6zQ9HN8f5XxQDF
 miXmPk/SGZHevMAarSD1RaPCIAyT8S2Pb1IC+5hY6XVK2bINUpvFjJjMymgqXMaFtds1
 obUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ZMpzNEO4OPsp548pYzGhk7wZS3nBzSDrcI4nxyW6tZM=;
 b=7uEclfh/ysH0FbKypk/wiI3D4pupiAuLapJjzOMBL2sQonEEF52JCgY218PHkNrIVE
 Mg6PVQWWFxZ69TzaETA7jCGiVemZ1HyqT2dgE3fvii1tJz1evEgXdCuLBgduynasLHBU
 IBU7ATof9H6Ho5w1iztkJegA8FRD+2Unzs+XOf9rvfOabVrL6QqErvhiP9VbGCznN29z
 3/cxEOt2p/uTNOddptmsTfBnMN5mYQBqXeC0ooLbMRwDMIp3eAv5CH9B4TQNTxcLjMWn
 HczTLz9W7c2iTCRQWXcO2iSoxaF6H3yCMq693ANXhd24UFAkIzQHHeAiw1EoqGsUgXi/
 8EYA==
X-Gm-Message-State: AOAM532rLz39Bx2UPMqdzr7CHcAWz66WOL7rg8IhgYwN97b2njX07hUg
 rVkcIXkUfeBQZrL+i9q3Ucx0XV5cI39m
X-Google-Smtp-Source: ABdhPJyL7D59S0c7J3/2Op0q9aw5Wnve+xXjWrrlV45CTNX4k/0oMEztpE6wC4lT9bO6+BQsyODILO5P7lBB
X-Received: from ezekiel.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a25:35c2:0:b0:60f:c5d8:99ff with SMTP id
 c185-20020a2535c2000000b0060fc5d899ffmr29221573yba.380.1646240948002; Wed, 02
 Mar 2022 09:09:08 -0800 (PST)
Date: Wed,  2 Mar 2022 22:39:02 +0530
Message-Id: <20220302170902.752687-1-shraash@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
Subject: [PATCH] drm: Fix no previous prototype error in drm_nomodeset.c
From: Aashish Sharma <shraash@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, groeck@chromium.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
Cc: Aashish Sharma <shraash@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix this kernel test robot error:

drivers/gpu/drm/drm_nomodeset.c:8:6: error:
no previous prototype for 'drm_firmware_drivers_only'

Including drm_drv.h in drm_nomodeset.c which contains
drm_firmware_drivers_only's declaration.

Signed-off-by: Aashish Sharma <shraash@google.com>
---
 drivers/gpu/drm/drm_nomodeset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
index f3978d5bd3a1..9402deb4985f 100644
--- a/drivers/gpu/drm/drm_nomodeset.c
+++ b/drivers/gpu/drm/drm_nomodeset.c
@@ -2,6 +2,7 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
+#include <drm/drm_drv.h>
 
 static bool drm_nomodeset;
 
-- 
2.35.1.574.g5d30c73bfb-goog

