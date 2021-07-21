Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB13D1244
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689906E8DD;
	Wed, 21 Jul 2021 15:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA336E8DD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:25:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id p17so1108789plf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lE5imCQIk9KskralIlWDyDnEk557cQKh31aZ6Ny2Za4=;
 b=JHxBtie525D0RuMAvgo8nvwKq0u7paJjaMP0TEZQkqpptuGp2xibf5j58D+qe7pUz1
 053QZlGi0CYalBUuFpyAlxKVYn4wVnIUk2Sr6yrJFLcxKig1bxrB3GzN3sQkHqIW+l7f
 w/kLYfuy4/LER+7tCjwBLJm3W3Ar8N4gauYNUOc4gvhg6O9pFDqYRXzEUjUiQtb4NeT0
 CoMZKh1Aqe8MP9yKwL+dLKGtvyocZ1zmR9gxqfhI9IUO52A/QJFKTMPI12SfBIZsiBsU
 rz/jLR0lID3ZfsLdoqHkBPoOV65t8QAsEuj7zp1N5d4L4UzlhXXpFw6hBfHWkzyEgpkO
 uEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lE5imCQIk9KskralIlWDyDnEk557cQKh31aZ6Ny2Za4=;
 b=gphiaaBD/HmPBqbQ3jdn5mWLqRJgwT32qAbu7WbZdteEBFsodM6fHfl7PMHoKQC2Ru
 bIEHOk57lz1KL7RAEQ4lDcSvoXIwEn9d0Du479yHr0oibDtTqGKKPFNlj+tJ026B0Fo5
 ife1Moezk4wdQbasASzjytCqEYRLNmWQaR5KG0L3QBexJYpR5LpgL3LXGcG56MKNNatk
 2xxUf2cPAnSePF6df1jvtfl7OBUPO4MTv7d6mbrrEMYwbVWu0EYM8ugNmmw6bWL0Tn+V
 PE32RG4QzkNqkrsvzn/RkZ3e/Ag7Inerp9UJrzu7zHnH0JJzhZERbU7h9DpVgHhCoVlE
 bjAA==
X-Gm-Message-State: AOAM530ojLe8B4bzGTwr3d5gdlE3ASdwXNCrHUQ7itwU0TKOGqyxEC1G
 f6IC4L2bIsinOQyDttkzy0wU1A==
X-Google-Smtp-Source: ABdhPJzxP7BZqzzLuir1p6diui1mV6+sXsr46qpr67KRknsA/A7d56Hmk9GIoqIAwVQgXxMOI8P+dQ==
X-Received: by 2002:a17:90a:3c8c:: with SMTP id
 g12mr6072252pjc.134.1626881100104; 
 Wed, 21 Jul 2021 08:25:00 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:24:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Call i915_globals_exit() if
 pci_register_device() fails
Date: Wed, 21 Jul 2021 10:23:54 -0500
Message-Id: <20210721152358.2893314-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721152358.2893314-1-jason@jlekstrand.net>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the unlikely event that pci_register_device() fails, we were tearing
down our PMU setup but not globals.  This leaves a bunch of memory slabs
lying around.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

