Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C5CCB4DF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B05510E351;
	Thu, 18 Dec 2025 10:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyLDPB9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42D010E351
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:07:15 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a07fac8aa1so4676575ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766052435; x=1766657235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kpRXf+CybyafgKkHmN7F6FAf7wCDCV9P2YSBozxEg1w=;
 b=EyLDPB9IW8HiDWfFUIjmwfTqQrxP/6kR8zt8BDqDhAKkirfdt8YulfcfFkHrG2y+c+
 AI2xkZi9PVpFmeac+nBX1ZSUhilCrRbnWL+js/whqCuq4YLuwjVQLba5sfwW0FvtmNkl
 GIO9fdeZ7aPq76G1i1t0wJlr+kqNAyQtI4dleSJ5ux0GHSg9hjX4ojiu9PJEWB2BVr7g
 gJiiWR3KQStN/UCl7oaFYe6ymcu7z9dcQvQLgv85usaGlrR4x2yhu5wlRNpskBfw6CYd
 dpQzaIXbVtG3aKEYLpFmfsTUs6Q4hgDsLnQL7m5K/7zAdQX88NqBF9QVfFdzhYByk0Tw
 jdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766052435; x=1766657235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpRXf+CybyafgKkHmN7F6FAf7wCDCV9P2YSBozxEg1w=;
 b=pOKoCbp2eRN3gEw9x6+39EIqrAN+E93mtkQ2VImSyEOr5gXJYAI+1Xc2WLf0fiGNzA
 otNzC9z3ZyixsmiPUt5drM0GUyD8NBasIV/RhbuQVVeaxNKO8DVqPK7wPuZfQkUiXezd
 +dWZLoDWWUBz8Qh3yQ6nMBFwzow5QqurXkfK/MgJJqClT14OqzjXe4FBpsSvN45QnkJj
 aJptSv/Fm4B0S00kaJMZAAttSpVBGJ9NjxG3ApUb7cuVJwUHL5jtTlv34/TsY28vtHB2
 bJVRu86CbAkn4TojrScy6EFwAdGHdsc4yWIb14mA20xmrI5gtLKzFv9Xa79eQGaBjosj
 vtKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD6KiwumFgItTquNunWFxglqNpzWa7dH6cS9aB8riShdNAvYn2uPETI3GmAJlCWho0rxnFREiYqLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhclc0QYRNxWHBIZZnn9LQHZTDYmHEsZfprweM+/Vgk8qWhR4J
 JWJDwRettZfJRYOkzzFK1mFw1xBzHQR/wxUX/rxQEmWkLKCKgLtStpGw
X-Gm-Gg: AY/fxX5JJHoFdhUEOkt21bdYaaBJjQ+SnY+01X6LuZMpSayx5HTphHh4s+EiNSv5GWq
 W1V7TutH13RSVVFaa7wjUa8DbCYsTfhWzhX7ULxG4qad68Qe646fgpCeshB1nM0KyhhFUHNgglR
 VJzSWStx6Zy7ZJL5DDTGW+20RwLurkVs+yAQjcw2fZlaU4FCUBJ2SbSrjpIfwlCKnzDU5FaQO0I
 BG2vY6/DoSAYhRwW0YQ4vEvgCr5+f7mZ7IzyGr/dHr7G7uVNAQG0DLC6wwOzy3HFv5+7jOXK3oz
 hIVQPA8Pj0azWCY7ReF9M/sDZwnlIQKMQJs9crCUa2uhPk8lAnMXMEyKh+p5RRE01qMWZIHvq7G
 LuIs0HLR9p1eQHmOqP83fUwyHbZGr44FQOJNtckOAMCSKbjR689SD5YfIcWkbT4pbmxk/CbxTqN
 4B40E76rQ6cFY/t5E0U/cNOsXhfGzveHO++2gNello+Lk=
X-Google-Smtp-Source: AGHT+IFz4Ugh0GME20ZYSCAsS5FdVOlyjab3uGMpWvUWX/4LmvR2z1wq9wJZY1s7sCcmSZ17Xl5o/w==
X-Received: by 2002:a05:7022:458d:b0:11c:ec20:ea1f with SMTP id
 a92af1059eb24-11f34c57b69mr16886528c88.33.1766052435108; 
 Thu, 18 Dec 2025 02:07:15 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061fceec2sm5973650c88.13.2025.12.18.02.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 02:07:14 -0800 (PST)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
Date: Thu, 18 Dec 2025 18:05:07 +0800
Message-ID: <20251218100507.1529908-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
corresponding drm_err(), drm_warn(), and drm_info() helpers.

The drm_* logging helpers take a struct drm_device * as their first
argument, allowing the DRM core to prefix log messages with the
specific device name and instance. This is required to correctly
differentiate log messages when multiple AMD GPUs are present.

This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
logging macros to the device-scoped drm_* helpers while keeping
debug logging unchanged.

v2:
- Keep validation helpers DRM-agnostic
- Move drm_* logging to AMDGPU DM callers
- Use adev_to_drm() for drm_* logging

v3:
- Pass struct amdgpu_device to helpers instead of struct drm_device
- Compact drm_* logging statements

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

diff --git a/Makefile b/Makefile
index 2f545ec1690f..e404e4767944 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 6
-PATCHLEVEL = 18
+PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -rc1
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 0a2a3f233a0e..82ea217e8195 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -242,35 +242,29 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
 				 void (*ih)(void *))
 {
 	if (NULL == int_params || NULL == ih) {
-		DRM_ERROR("DM_IRQ: invalid input!\n");
 		return false;
 	}
 
 	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
-		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
-				int_params->int_context);
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
-				int_params->irq_source);
 		return false;
 	}
 
 	return true;
 }
 
-static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
-					       irq_handler_idx handler_idx)
+static bool validate_irq_unregistration_params(
+	enum dc_irq_source irq_source,
+	irq_handler_idx handler_idx)
 {
 	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
-		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
 		return false;
 	}
 
@@ -311,11 +305,12 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 	enum dc_irq_source irq_source;
 
 	if (false == validate_irq_registration_params(int_params, ih))
+		drm_err(adev_to_drm(adev), "DM_IRQ: invalid registration parameters\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 
 	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
 	if (!handler_data) {
-		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+		drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 	}
 
@@ -376,6 +371,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 	int i;
 
 	if (false == validate_irq_unregistration_params(irq_source, ih))
+		drm_err(adev_to_drm(adev), "DM_IRQ: invalid unregistration parameters\n");
 		return;
 
 	memset(&int_params, 0, sizeof(int_params));
@@ -396,8 +392,8 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 		/* If we got here, it means we searched all irq contexts
 		 * for this irq source, but the handler was not found.
 		 */
-		DRM_ERROR(
-		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
+		drm_err(adev_to_drm(adev),
+			"DM_IRQ: failed to find irq handler:%p for irq_source:%d\n",
 			ih, irq_source);
 	}
 }
@@ -596,7 +592,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		/*allocate a new amdgpu_dm_irq_handler_data*/
 		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
 		if (!handler_data_add) {
-			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
 			return;
 		}
 
@@ -611,11 +607,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
 
 		if (queue_work(system_highpri_wq, &handler_data_add->work))
-			DRM_DEBUG("Queued work for handling interrupt from "
+			drm_dbg(adev_to_drm(adev), "Queued work for handling interrupt from "
 				  "display for IRQ source %d\n",
 				  irq_source);
 		else
-			DRM_ERROR("Failed to queue work for handling interrupt "
+			drm_err(adev_to_drm(adev), "Failed to queue work for handling interrupt "
 				  "from display for IRQ source %d\n",
 				  irq_source);
 	}
@@ -720,10 +716,9 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
 
 	if (!acrtc) {
-		DRM_ERROR(
+		drm_err(adev_to_drm(adev),
 			"%s: crtc is NULL at id :%d\n",
-			func,
-			crtc_id);
+			func, crtc_id);
 		return 0;
 	}
 
-- 
2.43.0

