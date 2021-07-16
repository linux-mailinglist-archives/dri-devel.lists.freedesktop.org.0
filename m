Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C153CBF77
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 00:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065B26E9E4;
	Fri, 16 Jul 2021 22:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E178F6E952
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 22:48:06 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so7649538pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIkYJWAJaTrGItMh1rW+qwg69uMn+qusOczMLNDUoLk=;
 b=qRSgDjvuZKjOlJEz+OMFf8Br5oEEZNTjY0o8D8tkQPAqy/1miv6me8dfOAT60T2UQ5
 HDD9CT7V5rSfojZ+/zf1O/02640kif6NgFm27ArGoHZTLrlogNbJ+SBjO0hsV2OgRUHn
 M0Ubc/U6/wnoG+rOiRflR2zzNkAOztvEQcqGB/jizWZuFM9AWcAJ0p9BbSAWeHze4kHQ
 KPnj2DYp/98V8Bu6rRDCA5u+9AI9zrNXh8cai5PN4+7boenTups2Zd4pxBv90NgK7cfh
 xBTy72S1JiYACuFrRYaIyTb6JY2zMiQQKNYJIRAgTlDTxgxSqafX1bm9gb0Ujxcja3p2
 Jlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wIkYJWAJaTrGItMh1rW+qwg69uMn+qusOczMLNDUoLk=;
 b=KyrCNpbKKqjagDpSwuWx/6rg88JscX7GqMArp2CJd7Uhqu6SCgv84vPdJCiiGa/hj1
 FqIC6Mt1XGNtJ4MRMRFvjH0mXz3ZKEnocjIymKYCWUMj0k73CTQIOTiJByWei2DMfAfX
 UsjQF4Cc77TUxbxbyRxB4l6A/KDNcVkgbxUWyLMtFbAJWCEiinjkOAm5A07RslAZq4WK
 e0ycT3ss2EfND1yg1q4cjMrFvSSqatxJ9vZZhANUKdioPL54roB/Sx6sC0rDGDmTmD5l
 Cz1iHnh82cLgEZy3bi9VQYFXTOPXBoW2x8edQ3DqWDuxxLKI0wmg43nfAV9aAkAMzfyM
 Ttkw==
X-Gm-Message-State: AOAM531zRfK65ZQZfWiIgnohoiU98nnhFPyZJ4FsmdbybQ4WxDs6HhXZ
 X4sSYX0swzCW8+sPY05O6MTdFzSJeZmy3A==
X-Google-Smtp-Source: ABdhPJx0IAjPDqH78QY7/YkshC+8w5LUkmqdWig1CEhSbkJ/posJBn85u7k5UjdUrhnJtFpR7Bn+rQ==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr5704185pjv.54.1626475686484; 
 Fri, 16 Jul 2021 15:48:06 -0700 (PDT)
Received: from omlet.com ([134.134.139.84])
 by smtp.gmail.com with ESMTPSA id u24sm11991993pfm.141.2021.07.16.15.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 15:48:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Tear down properly on early i915_init exit
Date: Fri, 16 Jul 2021 17:47:58 -0500
Message-Id: <20210716224758.2162003-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716224758.2162003-1-jason@jlekstrand.net>
References: <20210716224758.2162003-1-jason@jlekstrand.net>
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

In i915_exit(), we check i915_pci_driver.driver.owner to detect if
i915_init exited early and don't tear anything down.  However, we didn't
have proper tear-down paths for early exits in i915_init().

Most of the time, you would never notice this as driver init failures
are extremely rare and generally the sign of a bigger bug.  However,
when the mock self-tests are run, they run as part of i915_init() and
exit early once they complete.  They run after i915_globals_init() and
before we set up anything else.  The IGT test then unloads the module,
invoking i915_exit() which, thanks to our i915_pci_driver.driver.owner
check, doesn't actually tear anything down.  Importantly, this means
i915_globals_exit() never gets called even though i915_globals_init()
was and we leak the globals.

The most annoying part is that you don't actually notice the failure as
part of the self-tests since leaking a bit of memory, while bad, doesn't
result in anything observable from userspace.  Instead, the next time we
load the driver (usually for next IGT test), i915_globals_init() gets
invoked again, we go to allocate a bunch of new memory slabs, those
implicitly create debugfs entries, and debugfs warns that we're trying
to create directories and files that already exist.  Since this all
happens as part of the next driver load, it shows up in the dmesg-warn
of whatever IGT test ran after the mock selftests.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_globals.c |  4 ++--
 drivers/gpu/drm/i915/i915_pci.c     | 23 +++++++++++++++++------
 2 files changed, 19 insertions(+), 8 deletions(-)

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
index 50ed93b03e582..783f547be0990 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1199,13 +1199,20 @@ static int __init i915_init(void)
 	bool use_kms = true;
 	int err;
 
+	/* We use this to detect early returns from i915_init() so we don't
+	 * tear anything down in i915_exit()
+	 */
+	i915_pci_driver.driver.owner = NULL;
+
 	err = i915_globals_init();
 	if (err)
 		return err;
 
 	err = i915_mock_selftests();
-	if (err)
-		return err > 0 ? 0 : err;
+	if (err) {
+		err = err > 0 ? 0 : err;
+		goto globals_exit;
+	}
 
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
@@ -1228,13 +1235,17 @@ static int __init i915_init(void)
 	i915_pmu_init();
 
 	err = pci_register_driver(&i915_pci_driver);
-	if (err) {
-		i915_pmu_exit();
-		return err;
-	}
+	if (err)
+		goto pmu_exit;
 
 	i915_perf_sysctl_register();
 	return 0;
+
+pmu_exit:
+	i915_pmu_exit();
+globals_exit:
+	i915_globals_exit();
+	return err;
 }
 
 static void __exit i915_exit(void)
-- 
2.31.1

