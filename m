Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41173EE419
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 04:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0946E0E4;
	Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCD06E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:02:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c24so38236201lfi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHlZUQ8HgfGWcfinu2oIDpWpJRbCk6Twh3QjNslqYr8=;
 b=fs4uFuIARdGUUvUr5JtczJnktriIqQUMwKz1TctsMb3X59FdX2FyyqpMPnbxuG9mU8
 CCic+poj7/DHmq8geyAiaUFaJRNrJNX5wmCdWAlsNbmWKQt7noAgNMhzbkfU6aDXHret
 EL13+/Q00KfmL9OpSOmMIjDOrxKLBx6PuuRA5Hl+K4d1UxSlcI2grgK71XdRkw8vToo4
 nl11MBwRuReJh8LoGJ2MPD+GEfGoqRFyYEVDTCdNH4W7V85uGjWRaqYEoiYJ3IlNH0q3
 Mo9YaSS+PkOsUzpKG6UAlpVr7j6Vzj/VGJmLheXFj99c4bPyTAqizk//I0eYcHX+MpC2
 CVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHlZUQ8HgfGWcfinu2oIDpWpJRbCk6Twh3QjNslqYr8=;
 b=kixbTrNw/1VNUEp4m9pFaOp9SrU4IIt4KZBEib8hJlX/4lktg8TXuXWxAlP6cv2whV
 xP5W65kpZjsmh48FIGBzkFm9KTsor6+LBfPZIVsSA+XMm4jKkXf3yVvC7G10zSnQj2SB
 r4FxQwimlgKs6J9Pdx4IPlMaOrOR30AIvoLndCxzTjbLefi3Iji1RTVO6q0nR4STZJGg
 xbDwG2Y8rw6u3c1rRuKv5Daf9pPtbFF/HvtFIB9zRhVGe3Ryw+LnuKp5UHCESKSdhodg
 gD6QNFQXCEB/qUNo5eqt5A6rjwZZDCQMnZQWnOfhbd4AHSZD69nVF01wIm9PxqCNQhs7
 dEjQ==
X-Gm-Message-State: AOAM5313vaI21X/hwPKG2L0d1T45+qGUHM3shpQAhh2JOLbrkowTyScF
 OdMu7M9h8IXJ0YKXetgHuLU=
X-Google-Smtp-Source: ABdhPJzVZANJW5iSs1X4gKiIvuAT2ZlwwoV9fug2MkAnjpXJYzhlQGYByLpQ6vPcTb80NGpOsNFyzg==
X-Received: by 2002:a19:e00a:: with SMTP id x10mr615907lfg.536.1629165734488; 
 Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] gpu/host1x: fence: Make spinlock static
Date: Tue, 17 Aug 2021 05:01:53 +0300
Message-Id: <20210817020153.25378-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
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

The DEFINE_SPINLOCK macro creates a global spinlock symbol that is visible
to the whole kernel. This is unintended in the code, fix it.

Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 6941add95d0f..e49083b0b09e 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -15,7 +15,7 @@
 #include "intr.h"
 #include "syncpt.h"
 
-DEFINE_SPINLOCK(lock);
+static DEFINE_SPINLOCK(lock);
 
 struct host1x_syncpt_fence {
 	struct dma_fence base;
-- 
2.32.0

