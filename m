Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C43CEAFD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A735389D56;
	Mon, 19 Jul 2021 18:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C5E89D56
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 18:30:55 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 37so19946881pgq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnXFAvNsp4VhwTehs3gkAabKcxBUBsGHtr27v2mGrwU=;
 b=Yzy6Q+lPCBSRFI4vehA0kxzDLPBF7/hOVr4BjpL8Io9yxSv8qQtUoOJMGf/0fymsoh
 fnpn5R7U+E3x3jmy1ldUDvHp5DQbgn12tf6W+u4uuYWouCjEdwxQW25Wat8vg+AAZ/Ar
 x9CAyTUJt71AaUqXRV0grYiHXzjJKgJsnweeoWJ21fw4wENyJs+WSeh4CLSHEdIBLgWx
 FeA5RYp3Xx0GvCmPpAYf1rNEKmNkyKKhehYx6lmMkuCEPZ0De8UQ9LxviNS4Aeikjc6x
 Pnq8Md0pqG93wLd8G79a6li9ayo2Zb9QBmhT1qQCTrZwtsPQ9aKB3s9T0X2A3xirKm8A
 XE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnXFAvNsp4VhwTehs3gkAabKcxBUBsGHtr27v2mGrwU=;
 b=TrI1PxN/niZpUxUi9cvpvg2XAivKenG25AZxMja9oBLxglVyTRLtkaVe9V8r5nOfY2
 OXjPd/NMIxmOHvqbbrXsmgGAP4xHp3C7Eg7OZUIFs8BYHZej7H5yi0f208vVtkpot2Y/
 CpOjVqTa2c8UHcVaKFCcoFSbA4aFDrfUhZ3y9AQUkVHu5nsZn7Xv+tsVFMCBm9XesJyO
 tujemN3Oyx6DpkfJU0GqVhvynB7DkewDjaqDW1BnFE1cb9pkqzSwtmvXvamfTte3XbqN
 GjyJcFmdVlYMCg0nUFMi0ilqIqXbNvtMM+zyzCs2H61/Hqrhj+wIpwXIi/8KRbIuaMsR
 /ccA==
X-Gm-Message-State: AOAM532rJpvUZbcurdzJoD9UcPVbPdSDuvRouWwRqHJMu+YvFWi7xL1H
 NlLGsHep3YeEmoWNKZpr2EFamw==
X-Google-Smtp-Source: ABdhPJwFGcpS1KY6LYWmB3ab+eMdliHYuXyUCL+z1ob55EJrr6OGXEf8Yd5gCa5vFeNzEKQBgU9oUA==
X-Received: by 2002:a63:d84b:: with SMTP id k11mr26769538pgj.372.1626719454638; 
 Mon, 19 Jul 2021 11:30:54 -0700 (PDT)
Received: from omlet.com ([134.134.137.83])
 by smtp.gmail.com with ESMTPSA id w23sm6961555pfc.60.2021.07.19.11.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:30:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Call i915_globals_exit() if
 pci_register_device() fails
Date: Mon, 19 Jul 2021 13:30:43 -0500
Message-Id: <20210719183047.2624569-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719183047.2624569-1-jason@jlekstrand.net>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the unlikely event that pci_register_device() fails, we were tearing
down our PMU setup but not globals.  This leaves a bunch of memory slabs
lying around.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_globals.c | 4 ++--
 drivers/gpu/drm/i915/i915_pci.c     | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 77f1911c463b8..87267e1d2ad92 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -138,7 +138,7 @@ void i915_globals_unpark(void)
 	atomic_inc(&active);
 }
 
-static void __exit __i915_globals_flush(void)
+static void __i915_globals_flush(void)
 {
 	atomic_inc(&active); /* skip shrinking */
 
@@ -148,7 +148,7 @@ static void __exit __i915_globals_flush(void)
 	atomic_dec(&active);
 }
 
-void __exit i915_globals_exit(void)
+void i915_globals_exit(void)
 {
 	GEM_BUG_ON(atomic_read(&active));
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 50ed93b03e582..4e627b57d31a2 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1230,6 +1230,7 @@ static int __init i915_init(void)
 	err = pci_register_driver(&i915_pci_driver);
 	if (err) {
 		i915_pmu_exit();
+		i915_globals_exit();
 		return err;
 	}
 
-- 
2.31.1

