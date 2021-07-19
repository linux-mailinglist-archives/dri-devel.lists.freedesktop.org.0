Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E01F3CEB00
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E65B89F8E;
	Mon, 19 Jul 2021 18:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF0A89D56
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 18:30:53 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d12so17239948pfj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=WSj3yFC5wywCm3Dp5J7EnMAPTMUlz4YAfq0+deEfXLB8duBSGM8M6pcb7ppaponmDl
 BPHRsJxlwbUXXmveOZoJS6v+zlWYQkEtpGY3oDO+Nivtkqc0kk/mH60uKYaqRXn3SUf9
 9rTsmlqqOSyy1le37VfiAelMLPaZRTO2iOB0d1PN2a031QueuCuCNGrbtzj7TDJgyT67
 QqOrZQWgO1o0YOnvW+R2v7CX0tTLwf3FiRcstFU5TNKu/z4qGhEj+R1GUjQjJUi9b7Ra
 qQFcLFT3llnFQ2Pc/YXuOydgST1ulWws668hkhv9PYQsXU+9x4A1erLt/LoUEJ4EjkBt
 YULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=n39JZgahVz2I4RSxL+sbN4RderVsxufXB/rsCU8w8Zztwpp4Emu53NKgrOsPxGtYhb
 sziV3NtjpCXgVWMCvgmxkdWtJiNJmGpUSCosrZCJIdmGhhcWsX3Tlwkl1ZqT2KfmaF2Q
 BU0AEZX06tl8HEbO4gwXGzKPL02vOfBruEwECEF3Z3XbZjjnL7VSB1m6sNKAcM+15hCj
 mF2QXjvGbtPHyIjMHMH4v4lZQo69CAtD5ugtZCm16O8CIYso8V6npk6lOw+cKr+Zf1XF
 2kXW8eK0MHRx/vGU+JBmKcc25LWKebx+Sw8zecVHM8UHPhLppsXQl6B3ZVyhvscXAqyv
 8yAQ==
X-Gm-Message-State: AOAM533cVe4LVum5fP3K1D7++90YqAHoBbZqxs05eNv6X1Ine4ZBNiOr
 O0VVb3yZX3wiVrnJK+OOGuVGNg==
X-Google-Smtp-Source: ABdhPJx01TNQtfAKLxBA01vsesOEr0Wb+/g276nv+WAOKU6tJ5q1uIrj4DNFws4gN6UBzHpLSWJ//A==
X-Received: by 2002:a63:4e4d:: with SMTP id o13mr11760575pgl.300.1626719453219; 
 Mon, 19 Jul 2021 11:30:53 -0700 (PDT)
Received: from omlet.com ([134.134.137.83])
 by smtp.gmail.com with ESMTPSA id w23sm6961555pfc.60.2021.07.19.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:30:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915: Call i915_globals_exit() after i915_pmu_exit()
Date: Mon, 19 Jul 2021 13:30:42 -0500
Message-Id: <20210719183047.2624569-2-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should tear down in the opposite order we set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

