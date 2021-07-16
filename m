Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312D3CBF75
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 00:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67B6E952;
	Fri, 16 Jul 2021 22:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CCC6E8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 22:48:05 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id cu14so7287668pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26BfJp5P7eFvEwspn0bZn+OrsVxNX++BisccW8Z+Oe4=;
 b=MjEi3RoRlDVK7ZRGa/CCM4Z2uU9RTRIixNhcNRPaxUKU3mvJLwjqnAnaBgsuYD32hv
 CrBhgnPd9SUkOt4sAzOZC3zmHSlKpY6J2coyo5+zB9AA5cT+5Gu2tinASllQhq4dj8Da
 Gq3QpIZUC0RWEaySkfFgbEHUjTwly2ESsZS/voQUZ1wd5nm4FwMlmu6yBORhWG3Oxi4w
 +6H5CIKr7dQyvIOK1SvSdLn7NuOLoLtC1lpp/3CUEOGa7wS0gZif4KVwL4Wb0QNDx2Ih
 OcKztb4Ul+OUxJ20mVJ26v05LUXrl2bc8hP6FH+1EfNoaYLwlFW7RTfj7BVj7PNjgfXR
 4hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26BfJp5P7eFvEwspn0bZn+OrsVxNX++BisccW8Z+Oe4=;
 b=ik2cNp92cnJa5PLG3AWA9gjlu1NonhxU5Y0KbAY0W+Yd3+aIaE+B7RnJVfzQbYcuQu
 IFt/P57o7P9Gj07ZmphQwY4gQmG39Ha5xkI7fBLFoTRkm+s1nIPtLt9El+ZOis2Vq9/1
 fij9EB2QP/vY67THF5eVOEcJYX0hI6OEhr0J5dDF77S6Xzjsk9BVZnB/iizCf3gaS2mA
 kTfViwJ7be5sLv5lhlW03WgiXyf67qfY3RkOdOs5ygHm3JtXC7mQdFffSBZcTDFE2CZO
 uSE5jv1KHmGpV128xmhFdz679uekjMYUdRqbEw7D0q314TZCk6P7DukU+nYzg+rzaw3U
 BECw==
X-Gm-Message-State: AOAM532HgWMrfFJYJZ3aUgdra4TPcrdb9kwwz/bssZVACuq0Li6JCs5E
 kuKaLYozD+nfGHAvckYOxWBuU8/nrAVCxQ==
X-Google-Smtp-Source: ABdhPJy1BDHpLHZlEZ+6VefSJXtTPuOJHs1y9CP2sGSyRPut6NuK1h3srvyxGQVhkZ0Cl5cciva4dg==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
 o101mr12037103pjo.208.1626475684933; 
 Fri, 16 Jul 2021 15:48:04 -0700 (PDT)
Received: from omlet.com ([134.134.139.84])
 by smtp.gmail.com with ESMTPSA id u24sm11991993pfm.141.2021.07.16.15.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 15:48:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Call i915_globals_exit() after i915_pmu_exit()
Date: Fri, 16 Jul 2021 17:47:57 -0500
Message-Id: <20210716224758.2162003-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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

We should tear down in the opposite order we set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 537f9c84a427 ("drm/i915/pmu: Fix CPU hotplug with multiple GPUs")
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 67696d7522718..50ed93b03e582 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1244,8 +1244,8 @@ static void __exit i915_exit(void)
 
 	i915_perf_sysctl_unregister();
 	pci_unregister_driver(&i915_pci_driver);
-	i915_globals_exit();
 	i915_pmu_exit();
+	i915_globals_exit();
 }
 
 module_init(i915_init);
-- 
2.31.1

