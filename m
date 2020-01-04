Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B2130E71
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 09:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173AF89265;
	Mon,  6 Jan 2020 08:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC66E420;
 Sat,  4 Jan 2020 12:23:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so44681752wrl.13;
 Sat, 04 Jan 2020 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwNUSd99uCpcD2i/Zhi09ZcL/ngKkzJPJ00O7NK8uak=;
 b=IfTd8sm1QFVaGBFpKEd2oviq06KevNXtkX8yOkcbAfoA/loOfqRuxsDuAIl+7o48RH
 MSQEDOb1T81BxBwJxy5VfiRMx3OZz7EGSB+++T81oGS2K67N0qr86+S7tNcHwTsyXMh8
 yxZQFVfHiv4Z79srxGd4VVTYYh+SuNKGV7d+yhhEYLou6OmAZk0cNSG11m8vRXHDpR6v
 7DaLWosJ0wFwOh/LQhuxWHn/86XYWgtAJWmeOVic27RwCYORDqmaOK+mk/3nGuKiyvv0
 0U7ZKg1A/dBNlW5n9hlSoXgvJJR7y7E+V6Lrzf1Bh8tHIb0hnrmvpjVmuc+TweyCWkEe
 ravg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwNUSd99uCpcD2i/Zhi09ZcL/ngKkzJPJ00O7NK8uak=;
 b=kx6uoQHkQp3Z1uzZSL3YxED9RD8BVtGjB9fWtYS6om658Zd9GkyKXG0CjDU4diHwBw
 8yRTRlghStLekVam4O0KdZjsp+RMxAAGN4flOqvT2jpcTmu9oSSAsCysw+TKdZmVbg1j
 IScVnULv7D/oR4GssaV9Hv1bmefN8J1fmKTWKJujpHPsb7eTjYvWf8SabPDlzHNcgifb
 YrHVwAzYPumXRym9zSCbQOz/8jY9saSp0NDBZ9y2Z7EYaUoHTksAtDrG63Jn0TxUpC2x
 fXu2m7hr1S1kh2bxrSdgz4X+p7JhrwZQXBTO6SIsA+kLeKeG6x6fD4/UeyNbwQvihFw3
 3nag==
X-Gm-Message-State: APjAAAXDfXMK7VTEqjqlsvGARevzqOY3WFiaGjcIfF68rjLTjlZiBjH1
 TTG9RvvIf05dOk5SZUA633KPcOUjRps=
X-Google-Smtp-Source: APXvYqwWWPHCXqNuFyKebMBHxIW3UvhYBcQU+Lb0o2+33MGKCCL2vlFiYVBCV4+9nZQtxkNSoTyv6A==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr90778799wru.230.1578140599973; 
 Sat, 04 Jan 2020 04:23:19 -0800 (PST)
Received: from localhost.localdomain (bzq-79-176-206-154.red.bezeqint.net.
 [79.176.206.154])
 by smtp.googlemail.com with ESMTPSA id x1sm63227093wru.50.2020.01.04.04.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 04:23:19 -0800 (PST)
From: Dor Askayo <dor.askayo@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: do not allocate display_mode_lib
 unnecessarily
Date: Sat,  4 Jan 2020 14:22:15 +0200
Message-Id: <20200104122217.148883-1-dor.askayo@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jan 2020 08:09:58 +0000
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
Cc: Dor Askayo <dor.askayo@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allocation isn't required and can fail when resuming from suspend.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/1009
Signed-off-by: Dor Askayo <dor.askayo@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index dd4731ab935c..83ebb716166b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2179,12 +2179,7 @@ void dc_set_power_state(
 	enum dc_acpi_cm_power_state power_state)
 {
 	struct kref refcount;
-	struct display_mode_lib *dml = kzalloc(sizeof(struct display_mode_lib),
-						GFP_KERNEL);
-
-	ASSERT(dml);
-	if (!dml)
-		return;
+	struct display_mode_lib *dml;
 
 	switch (power_state) {
 	case DC_ACPI_CM_POWER_STATE_D0:
@@ -2206,6 +2201,12 @@ void dc_set_power_state(
 		 * clean state, and dc hw programming optimizations will not
 		 * cause any trouble.
 		 */
+		dml = kzalloc(sizeof(struct display_mode_lib),
+				GFP_KERNEL);
+
+		ASSERT(dml);
+		if (!dml)
+			return;
 
 		/* Preserve refcount */
 		refcount = dc->current_state->refcount;
@@ -2219,10 +2220,10 @@ void dc_set_power_state(
 		dc->current_state->refcount = refcount;
 		dc->current_state->bw_ctx.dml = *dml;
 
+		kfree(dml);
+
 		break;
 	}
-
-	kfree(dml);
 }
 
 void dc_resume(struct dc *dc)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
