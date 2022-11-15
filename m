Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC59629F3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724610E137;
	Tue, 15 Nov 2022 16:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28510E044;
 Tue, 15 Nov 2022 16:41:49 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q71so13755501pgq.8;
 Tue, 15 Nov 2022 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Vs3kQEHL0oTrTy5MR4m4bXaJPdcU0IKOmmtigZy0RQ=;
 b=j1uDJjjED/dprSEJEMlZ1yfYS2WQkBO0HzjJ8V6lD93UppX4bhNioJRu/1W1T22Nma
 w6kGSPxjxKRdya3t1xIGPPkhmONCkzLKlXjQNkkqBk6Ps0/eR1H4zpabOP2tJ4ZxbVo6
 37ZEz5k6P/3ar+DOP7F735TH8riybkRhQOEE4916Rja/Tifsq2caYJG9Wx40EoNQcK2a
 PAqV40oRIg+nuIX2CUSA+jeZOZjqBdqE2tVBl/b7IvDvWSnXBl+1/WRyIAQnnF4Hrc2k
 fTAYMvbufVg14/I/hH4b3FdFAcErksij/c7UmLsnVi8znWi5pXJcVxqt9kIlnQoHVL/e
 q7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Vs3kQEHL0oTrTy5MR4m4bXaJPdcU0IKOmmtigZy0RQ=;
 b=AE8s9hDtLKbLam7005EOxMEOC7Sq+PPpHrRHNp1NmiAWgAB7ZsCZogztJXlfzJK2q7
 l5siKXgRCNP/RNHxxsQNCiuG48m9qUAzhevI2dhu/LAiVBZrGmkfcNOv3YnSChNffAfS
 b+wbR0v79k+lv39K2hdFHAlyviMBSHk0yIR1exNCIQScN4vTwBN9c3IBU2mP1jQWEzox
 Icooy++jkS97Tr6NlfX9ifgiGgkrFxsTK8QlWm61loMFF6Q7PThh2dI2zrbrj+/T0dtE
 5GVsd/AoRorN6w5+bi+Qqq197+4OViINdPtCN5x5gntmUPGCSM5QfIvBYUocux8658t3
 Mofg==
X-Gm-Message-State: ANoB5plUt7n/39Kf5xkB+gg1PdWczXkYUqQnqTg9gi8ocdqdrR0o41NO
 GcT2yhHPbWHRFI7AM/h1UP1JMxaiPeE=
X-Google-Smtp-Source: AA0mqf7djbrriQQMP2iaGU82u/FSoTUimc0HOuiGEe1GjVChTbR5YA+6lXVDqIK3EDM8kWDtP5UF0Q==
X-Received: by 2002:a63:4d1d:0:b0:44b:d27e:520d with SMTP id
 a29-20020a634d1d000000b0044bd27e520dmr16272720pgb.124.1668530508704; 
 Tue, 15 Nov 2022 08:41:48 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b00186f608c543sm10211678plf.304.2022.11.15.08.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:41:48 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Enable unpin/eviction by default
Date: Tue, 15 Nov 2022 08:42:12 -0800
Message-Id: <20221115164212.1619306-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We've had this enabled in the CrOS kernel for a while now without seeing
issues, so let's flip the switch upstream now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 8f83454ceedf..f6de1bd9d2e1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -16,7 +16,7 @@
 /* Default disabled for now until it has some more testing on the different
  * iommu combinations that can be paired with the driver:
  */
-static bool enable_eviction = false;
+static bool enable_eviction = true;
 MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
 module_param(enable_eviction, bool, 0600);
 
-- 
2.38.1

