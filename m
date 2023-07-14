Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E17540CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362D610E116;
	Fri, 14 Jul 2023 17:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6710E116
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:45:58 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so87586639f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356757; x=1691948757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASjrxMFGfI2mQtSCo+tL5VWD7Mqm7tMyxd3We8wcpHw=;
 b=M/q+Yj9ZMVjT8YibypU1lMVnZt/YPmU6cU08bQD0gHNsXwmQqTTHCRyRSFkWFKZZUs
 eMXkiXNylEaXG5l5VMVx4VkVOGzbeqLH4RPKVogxGnL7e2MWfxXS0Pk2M1phmJb8uq9w
 /RQxhkfW2ZG9tdgmaUJJ1iwMuq63ngXsk1ZEfxtaofr/RtBBAxU5nNoDtwYIvZ1cbrVz
 5Qn7Hm1xouoE6LYZd4wBiQz+cmif5thq+RgzFJNVp/mTe1u/VE0PWd8BW4eGfy8S2qaS
 9KcflWo5MJIFKIPVUezv5UngewmUeE+CmFa8JZaIcgbDyND8YHyHKxMJ6lydt1p+hvcm
 98WQ==
X-Gm-Message-State: ABy/qLYsF98ftWixsjFcMp2IV7LMGYzZPtkE0ACGXf2Yx8K/9G9Fhcox
 LNfKL8YSOqojifw/LnFIwg==
X-Google-Smtp-Source: APBJJlHuso8S9Bt7JOE/amuqp1QRpWb0gkLH6g4sDyXSdQBCVP4PpFjXy2a6cRQm/j9Ech1mQSqMHw==
X-Received: by 2002:a6b:760e:0:b0:787:f94:5133 with SMTP id
 g14-20020a6b760e000000b007870f945133mr4910825iom.2.1689356757494; 
 Fri, 14 Jul 2023 10:45:57 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a056638022800b0042b2959e6dcsm2716939jaq.87.2023.07.14.10.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:45:56 -0700 (PDT)
Received: (nullmailer pid 4056808 invoked by uid 1000);
 Fri, 14 Jul 2023 17:45:54 -0000
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] gpu/host1x: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:45:49 -0600
Message-Id: <20230714174549.4056675-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/host1x/context.c | 2 +-
 drivers/gpu/host1x/dev.c     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index 9ad89d22c0ca..c000d4e0c2c6 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -6,7 +6,7 @@
 #include <linux/device.h>
 #include <linux/kref.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/of_device.h>
 #include <linux/pid.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index aae2efeef503..7c6699aed7d2 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -11,8 +11,9 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
-- 
2.40.1

