Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCE1516C0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C46EDDB;
	Tue,  4 Feb 2020 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3856EC79
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 16:18:40 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x1so14731018qkl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ptdL8j4y4Nu0slWC9GMlqw2vupDc3jE8cCzq/d6QOxo=;
 b=eINJVtQOFasRcQUUhrRypp1cvIgGSB2uv66wDqp4LEqIw+IxE8nZFh8zR1m5xpcBNs
 asYRxtDshmiHoSfr1mRX75C2UKBJu2rdW11q9+Bv/5yr2fbQHpAax5CNnqgsso8HZU0v
 UyOp9uDe8Q5dKeQmicM7GjESp/71ZeaA3EeFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ptdL8j4y4Nu0slWC9GMlqw2vupDc3jE8cCzq/d6QOxo=;
 b=PYMzz/gjE4rvq/23OzsWTiHz02FwJFfEAGDKdTX6st37I7Rt9g6lAI4nmNA3/+wo9O
 4tvwYQUKkp6ini6TD4L5+WtIrS9uvz0tGEMbt3vjQEcA3D5T1ancr3G6b7VhM6FSqSRj
 7HOgwPD0UPSMrl3R7MPbG83HUO7qsR6YiOC7h2bXGu3rE4DYJrJmeotH7YqIYYVEAnBh
 w5jLeKVP1UH0a03YGK061uWAh8rDVbtYQ2EvIVLkG4PWBLgwpQqpUtP0ffOM0UAsuGQF
 PnPzhJBoW0Ukuz+iV361ZtR0kt8X53fcA/h91m4+FQNBQvvaikEr90PEM5z9FfqY9iuK
 j/Ew==
X-Gm-Message-State: APjAAAWhQHcIHtxRy5wtqh2Oduhne4mDJNN2/x2SdqXqtPwpXIaU+HGf
 nncFr8WAlEgp0v4JWGovH0WJ
X-Google-Smtp-Source: APXvYqxDPyKmX7Xb7xJg3h+x7fg95e7oQwGe6vGn9t+4Xg/mY5Q8WpzfOarZKicAK8elQfsAEGxyDw==
X-Received: by 2002:a05:620a:306:: with SMTP id
 s6mr22664268qkm.469.1580746719156; 
 Mon, 03 Feb 2020 08:18:39 -0800 (PST)
Received: from tina-kpatch ([162.243.188.76])
 by smtp.gmail.com with ESMTPSA id 8sm9530476qkm.92.2020.02.03.08.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 08:18:38 -0800 (PST)
From: Tianlin Li <tli@digitalocean.com>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v2] drm/radeon: have the callers of set_memory_*() check the
 return value
Date: Mon,  3 Feb 2020 10:18:27 -0600
Message-Id: <20200203161827.768-1-tli@digitalocean.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: keescook@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Tianlin Li <tli@digitalocean.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now several architectures allow their set_memory_*() family of  
functions to fail, but callers may not be checking the return values.
If set_memory_*() returns with an error, call-site assumptions may be
infact wrong to assume that it would either succeed or not succeed at  
all. Ideally, the failure of set_memory_*() should be passed up the 
call stack, and callers should examine the failure and deal with it. 

Need to fix the callers and add the __must_check attribute. They also 
may not provide any level of atomicity, in the sense that the memory 
protections may be left incomplete on failure. This issue likely has a 
few steps on effects architectures:
1)Have all callers of set_memory_*() helpers check the return value.
2)Add __must_check to all set_memory_*() helpers so that new uses do  
not ignore the return value.
3)Add atomicity to the calls so that the memory protections aren't left 
in a partial state.

This series is part of step 1. Make drm/radeon check the return value of  
set_memory_*().

Signed-off-by: Tianlin Li <tli@digitalocean.com>
---
v2:
The hardware is too old to be tested on and the code cannot be simply
removed from the kernel, so this is the solution for the short term. 
- Just print an error when something goes wrong
- Remove patch 2.  
v1:
https://lore.kernel.org/lkml/20200107192555.20606-1-tli@digitalocean.com/
---
 drivers/gpu/drm/radeon/radeon_gart.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index f178ba321715..a2cc864aa08d 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -80,8 +80,9 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
 #ifdef CONFIG_X86
 	if (rdev->family == CHIP_RS400 || rdev->family == CHIP_RS480 ||
 	    rdev->family == CHIP_RS690 || rdev->family == CHIP_RS740) {
-		set_memory_uc((unsigned long)ptr,
-			      rdev->gart.table_size >> PAGE_SHIFT);
+		if (set_memory_uc((unsigned long)ptr,
+			      rdev->gart.table_size >> PAGE_SHIFT))
+			DRM_ERROR("set_memory_uc failed.\n");
 	}
 #endif
 	rdev->gart.ptr = ptr;
@@ -106,8 +107,9 @@ void radeon_gart_table_ram_free(struct radeon_device *rdev)
 #ifdef CONFIG_X86
 	if (rdev->family == CHIP_RS400 || rdev->family == CHIP_RS480 ||
 	    rdev->family == CHIP_RS690 || rdev->family == CHIP_RS740) {
-		set_memory_wb((unsigned long)rdev->gart.ptr,
-			      rdev->gart.table_size >> PAGE_SHIFT);
+		if (set_memory_wb((unsigned long)rdev->gart.ptr,
+			      rdev->gart.table_size >> PAGE_SHIFT))
+			DRM_ERROR("set_memory_wb failed.\n");
 	}
 #endif
 	pci_free_consistent(rdev->pdev, rdev->gart.table_size,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
