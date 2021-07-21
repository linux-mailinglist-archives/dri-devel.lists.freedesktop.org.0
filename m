Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED23D1245
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACF36E98E;
	Wed, 21 Jul 2021 15:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC26E8A4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:24:58 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso1137649pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=ZTZWdei5NlKvXYiDTGiCpLCoDa907cXvxISKOfdXrVbIOLyXT5BbvfAfOT+As3pBi7
 glmd6OccYAtlMwn5OuWEKe470d57rGQM3jPO/y0MWtI+F2Wyj/d62AYOGpjIviU7oALa
 Fg9yBoypwsDQQncxlmKVVX5Y29YMoixsjXJmgpiM+MN6YKZ+5oMT1OHPxmCrwKzFytWM
 GmMvo9MMx7pDO/M+plS5kwOr586ZPCMEBD7vml+vjFABJUwKHcFhRlK4h5k6mfRTcOvc
 y9vvIid+OeWCsP7PW0H/bEQQnAdvBImb2zbZWSBJBEhoNlHNbmpEg+3AeTKLfEwFecbQ
 fFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=cIOSsYBkynoXHs7wndKbqE3QzmvpePUCSyXrHlBOqHboxZMxPvQjxp6qLqAvpvJYKU
 mtQ2UVFHqM36pfiERQWklxIvQn+37ZpRNDSuHee865SzDbqfIaW1TbWNO88dG995Mx3O
 6yZRy1tnn5eFwdnQTbvLIHEGEftegW3prkOx8oc0u9G8eCBAMODOwRCnexGG+sZ9SiZu
 KAYA1Z5gE6hHRXWE2gbtapq86eWmHZDTpUG28A+UoIEQR8ngjIFElmM9goahEjgJ94KG
 s9p1PMMNXgIHNac1ZxEzxzV2uplML2lXLRiy1kGT3S0E+S3PMKSYq6UPi+wi8GwYcui/
 imfA==
X-Gm-Message-State: AOAM532eqFc4qXengPkHmTjwgH/OOZMN1Eb5NAi7U2DBHBu2Exu6kEwq
 fax7T1FzcqdlqT1RNilm11oOuSYwPxbzZQ==
X-Google-Smtp-Source: ABdhPJwF1Ny4BhYMjEnpJFkvHCEYUQeXvffSorR8q6UDpztUnjFv86YpoyDgDaoepYYC3r+zCI/SJw==
X-Received: by 2002:a17:90a:e7c7:: with SMTP id
 kb7mr35317769pjb.43.1626881098331; 
 Wed, 21 Jul 2021 08:24:58 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:24:57 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915: Call i915_globals_exit() after i915_pmu_exit()
Date: Wed, 21 Jul 2021 10:23:53 -0500
Message-Id: <20210721152358.2893314-2-jason@jlekstrand.net>
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

