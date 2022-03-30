Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0E4EC2EC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7CB10EA9E;
	Wed, 30 Mar 2022 12:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC710EA9E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:27 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id u22so18505395pfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4gcVpR2FizLJu6RR3F0oPHrwVu4t3M1EAjmgqnVTUXw=;
 b=jcHoloxMP+C79gc6dBvnkAdVCQRfO2uj4O8uKZkKARqsKyg1ZbGoC4b5O7l/sOAXJA
 SFHqCodMGi0ble3CbmlXAfQoy3mrD5wWpVxrpAsTgCbnT2ZFXZaor39CwUro9hliLND3
 pbMsCcEUJIyyQBYVfjXH8Byyfxr5avmvBM/BR+05VfzdWvnVNQglk2vLunPD1Mr+ApCA
 A5iE9zkrlIYRBUdxE7dirJZDht6JYnL+0rdCPLp1f54HsYXZONrHyPGYPYJtQAgXFpYn
 h9GogzzMAk0ipItJFIlRnVwrVFHPNEkOvuCLxahKny1fqMnjinQwrYd1P5rWYMc7IAYF
 4tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4gcVpR2FizLJu6RR3F0oPHrwVu4t3M1EAjmgqnVTUXw=;
 b=gJI8ARmgBqtBSwa2AYhEZoyQDTPcWIdKAlCMs+x27LZonYWcHdhb0og+67ARdnypvy
 CpDTJpObimWf3uzEsKWyhmzqWMXQRtSZ0/v37AXvpl0C6tVBtRlnqp2x+oRKbrgSNe3Z
 JOvj4i39Bzn++SGy4ksTuI8Ar6c7rzveZwXQcRljYHR8aaVkNpJUSE3XoDyibgIHBJKH
 vfDfbZqJc/3eLIi1h3mp3GAxVxKszyasDvX2W+9maMSMwx6GE76PaT+cT3X9PNNFQ8Z3
 1G65YvbcYCnClm/HLpVc9t+PV8G7khrd3ABby75+YVb/D/06AZ/nmhrpQYegN5i/NaQj
 WC7g==
X-Gm-Message-State: AOAM530yZJ7Kvi7ORnT8JPd4bOewHEUtlkG4GcKqFfRbshEsEipqqQGP
 G7u3R6sQJbSLN4j4H0Pi7l0=
X-Google-Smtp-Source: ABdhPJzL0rbJ0K2I89qnqiuRPMDNCIkKbUY7vwxf1xIQFLHClFI3u9l3Ln29b5g4dAdJ/hFhzAoqEw==
X-Received: by 2002:a05:6a00:114b:b0:4f7:915:3ec3 with SMTP id
 b11-20020a056a00114b00b004f709153ec3mr33199193pfm.8.1648641807349; 
 Wed, 30 Mar 2022 05:03:27 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 c21-20020a637255000000b003822e80f132sm18965408pgn.12.2022.03.30.05.03.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:26 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 3/5] gma500: fix a missing break in psb_intel_crtc_mode_set
Date: Wed, 30 Mar 2022 20:02:44 +0800
Message-Id: <20220330120246.25580-4-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yakui.zhao@intel.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, rob@ti.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. It
could result in multiple 'is_*' flags being set with true mistakely.

To fix this, when found the entry, add a break after the switch
statement.

Fixes: 89c78134cc54d (" gma500: Add Poulsbo support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/psb_intel_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 42d1a733e124..85fc61bf333a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -134,6 +134,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 			is_tv = true;
 			break;
 		}
+
+		break;
 	}
 
 	refclk = 96000;
-- 
2.17.1

