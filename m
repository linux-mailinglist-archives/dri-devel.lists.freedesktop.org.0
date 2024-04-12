Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B998A23FA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 04:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC2010E645;
	Fri, 12 Apr 2024 02:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Yk1cCj5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4FF10EA64
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 02:55:26 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-434b7ab085fso13597261cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 19:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712890525; x=1713495325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7LNQXEEzm9LDbWvu8yomhruLgVkKy5JUtfa3p+eNBw=;
 b=Yk1cCj5kRT85VyVtjAkphcSIqStkqwhn8kGFj2xtXQBzKSc88EczGLc1MeGMVIDGXG
 Cp7sehQNyQFC02weupIlv7240x8b3H/9qXccl3ujsUe6eAk/QTMxhcfnSOLqbQWojRHH
 WVtDa1DXgE1A8mHKASWX+IHSlIT4GQZYDWn1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712890525; x=1713495325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7LNQXEEzm9LDbWvu8yomhruLgVkKy5JUtfa3p+eNBw=;
 b=xBsG7pNBjUpUadob3BdYDuWOlZLtTThlzrmDYwkn9sZYgxc6vsODF8JfvJrSqohiV6
 j/WTmPFu5qT8FbbDTKmuA+F8UmIHVkqVP7YnlV7YIoatzKEpbz/6TrhfzJs/YYXeJGMu
 ldK5arFpujY5fA4P3MyIa4v+3Xw5uOsxEuCioB2TXGgdT5YbV7n7caUC0wqPSBVwVoOw
 YXSd6iIsLK6/KnAnSelcW2RaKnUkVOoPce+FmkLclu/mQTm74Fdc5tBgxU5k98drpiSl
 WMGbOjDS7WYzRdnDvEuGQ6GJIAOAquDHJXJFDzU/KlMRodPbZ1UItSwMK4P+Hp5/M1Om
 4CvA==
X-Gm-Message-State: AOJu0Yz65qjHR0xZYO+5tYCGlj4uh+P7FWpjeU2vRzldIU5JND3VObZ/
 mUOJ0bSAcDJ9plcboG5Wl7ChhFY4NcxJERE3J/P/0yPgQ1N7Ulm2FwSRntMUOeoT3fjpXmmGSSH
 2y5rykQ4ekAGA0cleWFfYYbrbDd+iIYm7yqzYTkXq2fV/mc0/FGzEssrop5YFW+tT6E1tahTj5u
 e2lWNAIPMcTMNFHODaF1UUAAgyxe7QNkGgybTwEEyQGeQGlHWyKw==
X-Google-Smtp-Source: AGHT+IHZWDcP9MRbfRYATS08KajxXKW2RYUhJ9M0HnfkT9ercovhwYxoYcQ/TRKNFvrlHpwO4SxKxw==
X-Received: by 2002:a05:622a:8b:b0:436:9202:9b35 with SMTP id
 o11-20020a05622a008b00b0043692029b35mr607955qtw.21.1712890525013; 
 Thu, 11 Apr 2024 19:55:25 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 t12-20020ac865cc000000b00434ab3072b0sm1682174qto.40.2024.04.11.19.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 19:55:24 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH v2 4/5] drm/vmwgfx: Fix crtc's atomic check conditional
Date: Thu, 11 Apr 2024 22:55:10 -0400
Message-Id: <20240412025511.78553-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412025511.78553-1-zack.rusin@broadcom.com>
References: <20240412025511.78553-1-zack.rusin@broadcom.com>
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

The conditional was supposed to prevent enabling of a crtc state
without a set primary plane. Accidently it also prevented disabling
crtc state with a set primary plane. Neither is correct.

Fix the conditional and just driver-warn when a crtc state has been
enabled without a primary plane which will help debug broken userspace.

Fixes IGT's kms_atomic_interruptible and kms_atomic_transition tests.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 06ec41909e31 ("drm/vmwgfx: Add and connect CRTC helper functions")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index e33e5993d8fc..13b2820cae51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -931,6 +931,7 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
 int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
 									 crtc);
 	struct vmw_display_unit *du = vmw_crtc_to_du(new_state->crtc);
@@ -938,9 +939,13 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 	bool has_primary = new_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
 
-	/* We always want to have an active plane with an active CRTC */
-	if (has_primary != new_state->enable)
-		return -EINVAL;
+	/*
+	 * This is fine in general, but broken userspace might expect
+	 * some actual rendering so give a clue as why it's blank.
+	 */
+	if (new_state->enable && !has_primary)
+		drm_dbg_driver(&vmw->drm,
+			       "CRTC without a primary plane will be blank.\n");
 
 
 	if (new_state->connector_mask != connector_mask &&
-- 
2.40.1

