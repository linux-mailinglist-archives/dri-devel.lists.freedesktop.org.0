Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66649728DD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 07:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E7E10E092;
	Tue, 10 Sep 2024 05:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJuWncct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1D410E092
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 05:20:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2057c6c57b5so27961765ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 22:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725945627; x=1726550427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=38ixz8H0ArhjT/fAPUPjglJ0fnVIDwgldPg04iXAj68=;
 b=OJuWncctd57JpcFsKOyWJbS/WO3Ox+bbcrwl0QM2RxpV/4OQCYnTwQwRdU4QhP8j5l
 4R8b05YigL3+XoVpPam6X9BQSwb6Hh14yKKoxETWliWQKxsvIwx3WAPyMyuKMaDHNT8H
 b4JojeAn+6gvo9TGAGauFzHw5jW8kTxJUduDTLwxpiu4cfY9DzGn07CWBHgUXXar8XWc
 toydy+usnCp0dVlcvxysMFgI6C0KxZJhXFB93Dxhwj64/8HPgu69kpkP/e12Qxd0TCIJ
 HSmgzDbHa4qi96dEwIlwXWgOoR6z84OjfGgxxlhkVQXhLugULNlIi9GfB4X078csEKY6
 YlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725945627; x=1726550427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38ixz8H0ArhjT/fAPUPjglJ0fnVIDwgldPg04iXAj68=;
 b=nd3jrjjNU06etrpjADXTPi2GWmumeBIprna8zgmXYrP9tdM7O7ecIVj5Zg8Dixln7y
 ed6zN3xvK5vY3ool5xgVA/0xEKc1MENVryFvLYQymx6Vlt8rURsus93kEqhPsRVesiV5
 xecxwBQl7NrpKNfAfS994c2Ne4Whh2qHhLUt5UovTE1v0h3qluUjTsk1Qu+kiinq0Rh2
 5lFNnr39FHNmFf5G4QyDX8JtVfLjzIIZM3hxYnz0CTpXiYxkuy6I7B7cK+O8GqrxEA2I
 IVqhPIynSkRFmcN1YqzS+1Z0s5BsyoYc+ZDGeMEZskPDdHylmkBct4WnMmvTRE+xbeLF
 x+sw==
X-Gm-Message-State: AOJu0YzZ2ETSfG1PPcM/uS9Us6cb0aG9OK6YAos3QvKptCfpss1Um+Lk
 smKcI1lxrrOz0Bs80fRsSa6GQxTGzhHDprBaVJnC1SoZsynEaDyGxESd20F5
X-Google-Smtp-Source: AGHT+IGu3Y1CcJmRFdUpSbd0OW2QBX0fNyuk7bD9zsfOdokX/bim2pYUB/hyYkbt4ewLxgurBIZ5Sg==
X-Received: by 2002:a17:903:a88:b0:207:2093:99bc with SMTP id
 d9443c01a7336-20743a2150emr28751155ad.14.1725945626627; 
 Mon, 09 Sep 2024 22:20:26 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f1e93bsm41288535ad.199.2024.09.09.22.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 22:20:26 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: Laurent.pinchart@ideasonboard.com, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Tue, 10 Sep 2024 10:48:56 +0530
Message-ID: <20240910051856.700210-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
monitor HDMI information is available after EDID is parsed. Additionally
rewrite the code the code to have fewer indentation levels.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 2d95e0471291..cfbf3137e144 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -135,16 +135,16 @@ static enum drm_connector_status cdv_hdmi_detect(
 
 	hdmi_priv->has_hdmi_sink = false;
 	hdmi_priv->has_hdmi_audio = false;
-	if (edid) {
-		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
-			status = connector_status_connected;
-			hdmi_priv->has_hdmi_sink =
-						drm_detect_hdmi_monitor(edid);
-			hdmi_priv->has_hdmi_audio =
-						drm_detect_monitor_audio(edid);
-		}
-		kfree(edid);
+	if (!edid)
+		return status;
+
+	if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+		status = connector_status_connected;
+		hdmi_priv->has_hdmi_sink = connector->display_info.is_hdmi;
+		hdmi_priv->has_hdmi_audio = drm_detect_monitor_audio(edid);
 	}
+	kfree(edid);
+
 	return status;
 }
 
-- 
2.46.0

