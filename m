Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F0133CCD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FCC6E195;
	Wed,  8 Jan 2020 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674CC6E839
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:26:07 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id i190so232113ywc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=maOi+ccdSCJ33tytaZ2VQyWTlm9roQsB2CYyKUcC3tE=;
 b=a3skjP/AmaWwBHZeZWluAghlXwxiT7Cj7kdIwSY35YoouSaTAle6gkkF+gWSQ43i5K
 B0GbiFcbbFVZraT3GERgOABL8Uc68kYFZIreZ/RiZRxaBPKz51UcdeY8c9TkW4rBxplO
 +ma4KhzsrQj/BcgUSva7gsUmK8tJO0k2NfeH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=maOi+ccdSCJ33tytaZ2VQyWTlm9roQsB2CYyKUcC3tE=;
 b=rf+xHWhoafg0xtRq9FBzhImV6izV+k1dvyD+0UU8iwU41k2QJhxquoIxJeC2n3YqA9
 WffI8n6hNz4rDV71NahsS2SJ0QT/FLuk/DmJhfPzDC8j+a9skIq9p/7ObgOg522oURMP
 8+vQOKd5vbteGQi0MbqkRrADHOf13B1DPLPuNgtu6Pjgwpn0S0QuULFjOwrQR5518dJf
 NxU6bERZeFPQtOq5JIw6ppnzGu+gIaAAVrZiR6VbkjZ0Nwly5410RNaOz4JBEfDWpMqy
 QWTZyJ2QBZOEcgjZr0wSpccSs2SqdMHZmFN+UlWnmA+Jocc+R47H4TCh1gJhWalyT4zY
 uACw==
X-Gm-Message-State: APjAAAVh1aq/1NBz1isxtQJLMlgI9IM5Z/19r7Cm2SLIivUDJ/7190fj
 ikrrwwn84D9h71xI+IZxz4lP
X-Google-Smtp-Source: APXvYqwCwkS16hDGTInMHpIbsWfaGLyz0bdtQUZqjjL2wAm7ADS3K2eO1OR9tckNRyznHTSO/nu0Yg==
X-Received: by 2002:a81:ec01:: with SMTP id j1mr738569ywm.274.1578425166700;
 Tue, 07 Jan 2020 11:26:06 -0800 (PST)
Received: from tina-kpatch ([162.243.188.76])
 by smtp.gmail.com with ESMTPSA id q124sm228047ywb.93.2020.01.07.11.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:26:06 -0800 (PST)
From: Tianlin Li <tli@digitalocean.com>
To: kernel-hardening@lists.openwall.com,
	keescook@chromium.org
Subject: [PATCH 2/2] drm/radeon: change call sites to handle return value
 properly.
Date: Tue,  7 Jan 2020 13:25:55 -0600
Message-Id: <20200107192555.20606-3-tli@digitalocean.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107192555.20606-1-tli@digitalocean.com>
References: <20200107192555.20606-1-tli@digitalocean.com>
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Tianlin Li <tli@digitalocean.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ideally, the failure of set_memory_*() should be passed up the call stack,
and callers should examine the failure and deal with it. Fix those call 
sites in drm/radeon to handle retval properly. 
Since fini functions are always void, print errors for the failures.

Signed-off-by: Tianlin Li <tli@digitalocean.com>
---
 drivers/gpu/drm/radeon/r100.c  | 3 ++-
 drivers/gpu/drm/radeon/rs400.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 110fb38004b1..7eafe15ba124 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -706,7 +706,8 @@ void r100_pci_gart_fini(struct radeon_device *rdev)
 {
 	radeon_gart_fini(rdev);
 	r100_pci_gart_disable(rdev);
-	radeon_gart_table_ram_free(rdev);
+	if (radeon_gart_table_ram_free(rdev))
+		DRM_ERROR("radeon: failed free system ram for GART page table.\n");
 }
 
 int r100_irq_set(struct radeon_device *rdev)
diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 117f60af1ee4..de3674f5fe23 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -210,7 +210,8 @@ void rs400_gart_fini(struct radeon_device *rdev)
 {
 	radeon_gart_fini(rdev);
 	rs400_gart_disable(rdev);
-	radeon_gart_table_ram_free(rdev);
+	if (radeon_gart_table_ram_free(rdev))
+		DRM_ERROR("radeon: failed free system ram for GART page table.\n");
 }
 
 #define RS400_PTE_UNSNOOPED (1 << 0)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
