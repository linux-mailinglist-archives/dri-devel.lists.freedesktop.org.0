Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C33CCF66
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1A89E50;
	Mon, 19 Jul 2021 08:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F4489E50
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 08:35:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d2so21024427wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VTY7si5+ogntqksXEXJbSR2eZtXFuLX27JSPFEg5ycA=;
 b=PnU7pULOGTNWvtQBUK2/lgrpjunyUy+WxlzuqNfq67yJilezxKBYaxDauOsSCrsPE8
 D4lhBnKAMEYXeXPUgcafYJJStezogt6z2iGbMQ4Nj0qFGcmD1TK5Ha4HG90LZLM8YOu+
 DIS81gr58lid9qihhl3aegx3BOO9e/BkcHmlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VTY7si5+ogntqksXEXJbSR2eZtXFuLX27JSPFEg5ycA=;
 b=o9FC6umYyYOH+6xB7TIQfs69fvqocTmmM37xZzEdPa+dPbzJEhAUi7jWcU/NJplcMm
 Y3YjA6HQqyQiCVBtAox60D8l1CrVvxA3HzEvhMkrEKhLv0BizZYFyvsHX2AqSpW5ryHp
 XndVCfFJr62EVqu2E0X8eM/bOjq6nO1fN7uQqOfhZlp5YwtgE1OAHMwJgLIX2/rB5qXw
 zSlThOajYk0PRVhoaKX6LTHGcJBrDLoGMZbL1Qg43cJzP07F0aC/gZXO0lH5DZX7Ti7m
 GREw8v5UnDQc2mjzg9xvBcrIX/rlMtDP4FZlVttIEdgxBVG/81xk9CPOlAiWyqXysc7M
 2C8g==
X-Gm-Message-State: AOAM531bTUwlb1f/X6tCHrIXlFEWway3FQ58+A6pHNKBM/6qiUWrLARi
 9fk+mW2Xm7H4v/iSCwZStd7FWchCVCsRUQ==
X-Google-Smtp-Source: ABdhPJxazs4aZz2Z3D8GxSTBgdo5dXzcF1ySp6PUZMztMqd3JUyzBTrlhZ5s+iIaba3txdvBrUvveA==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr28438477wrn.205.1626683739625; 
 Mon, 19 Jul 2021 01:35:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t16sm18712178wrp.44.2021.07.19.01.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:35:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Check for nomodeset in i915_init() first
Date: Mon, 19 Jul 2021 10:35:34 +0200
Message-Id: <20210719083534.2949348-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jason is trying to sort out the unwinding in i915_init and i915_exit,
while reviewing those patches I noticed that we also have the
nomodeset handling now in the middle of things.

Pull that out for simplisity in unwinding - if you run selftest with
nomodeset you get nothing, *shrug*.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 67696d752271..6fe709ac1b4b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1199,14 +1199,6 @@ static int __init i915_init(void)
 	bool use_kms = true;
 	int err;
 
-	err = i915_globals_init();
-	if (err)
-		return err;
-
-	err = i915_mock_selftests();
-	if (err)
-		return err > 0 ? 0 : err;
-
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
 	 * either the i915.modeset prarameter or by the
@@ -1225,6 +1217,14 @@ static int __init i915_init(void)
 		return 0;
 	}
 
+	err = i915_globals_init();
+	if (err)
+		return err;
+
+	err = i915_mock_selftests();
+	if (err)
+		return err > 0 ? 0 : err;
+
 	i915_pmu_init();
 
 	err = pci_register_driver(&i915_pci_driver);
-- 
2.32.0

