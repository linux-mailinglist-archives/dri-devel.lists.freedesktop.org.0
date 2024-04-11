Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF88A20DD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EAE10EB33;
	Thu, 11 Apr 2024 21:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="MkxqwiB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57B110EB33
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:27:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso251004276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712870826; x=1713475626;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TyaY/I5CyvrBegK79hP9X4uvBfReIuIWj8s/HCupCM=;
 b=MkxqwiB/aFyiYSQZePscbUwbcZaUe7ebKkkhJFWMZ9ifFNZJFCAjOV/qb7Sp5ZyGsH
 ITznZETrmnFxQoIrwdbS5d2VCJg93wHZYwc+AwWvwefB4+rznpXDcFuHuiTruanCnIvL
 hY2Zx/wQ5oodYnis0UevrYl8v28FTwvHuh2Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870826; x=1713475626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TyaY/I5CyvrBegK79hP9X4uvBfReIuIWj8s/HCupCM=;
 b=LteIpAdvCP0UgrpCxgvSlZH17ZFUWOa26G4BvVg9NeHeOw4NAVAjuOJKzO5q6he3Ne
 jwTYwGwmB8qjmmr0Z76jU30hhbCryz86cwbBAsLumV8DXWp5at7NA/5HD/MLVW8MlxQx
 IrNPr7v4ml3OqWRNG/NpgiE8SJQ/64pmT+G7PdE1y7AVmLdElb8XribO9hl2/ZYvRlSN
 ke5JXzygJcv5zOSf+TctmFTt0Nqor7fjWUMU3bsJXWIy0Az1lrsTnVMjArmukCNrAWkH
 aadmycuHEHvOwfGZhACvAzbkopTDlH/IKLw6WZw+mGrvCcB2jWb9sgzTCLySWARYSlDr
 krgQ==
X-Gm-Message-State: AOJu0YxemKBrFtzEok68u/84PZFGOLURhMtwscvTHNSKGuPiEZYO5Aum
 jSdJlgr5AswGtSrnoT914hCzSOFUwkhIf/kctEx4Y4Tmp0WcBoReX+HtFUQ1MnoFeXD6jFuog38
 64bg59i9D7pLEs0oyvE5q2EtJGuLmUCECSCQz89ZY7MJxgM9j6oqaQ3i45d+zmQu7ETEkRC9ByN
 +23MkU9rBJmRVbwr7JKtaRRZI4ej8Qc8Smmiw+yhq0Ipln8pnc1MX8
X-Google-Smtp-Source: AGHT+IE1i1eWGpXIQwTmnOVoXP4gFit72mmNqQQiYRiOXSMqIac/HFJH2MC9ZuTTnzPBTNIdFK7Ulg==
X-Received: by 2002:a25:6f42:0:b0:dcd:2aa3:d744 with SMTP id
 k63-20020a256f42000000b00dcd2aa3d744mr783634ybc.17.1712870826351; 
 Thu, 11 Apr 2024 14:27:06 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 e7-20020a0cf747000000b0069943d0e5a3sm1430571qvo.93.2024.04.11.14.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 14:27:06 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 1/4] drm/vmwgfx: Filter modes which exceed graphics memory
Date: Thu, 11 Apr 2024 16:26:48 -0500
Message-Id: <20240411212651.540-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411212651.540-1-ian.forbes@broadcom.com>
References: <20240411212651.540-1-ian.forbes@broadcom.com>
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

SVGA requires individual surfaces to fit within graphics memory
(max_mob_pages) which means that modes with a final buffer size that would
exceed graphics memory must be pruned otherwise creation will fail.

This fixes an issue where VMs with low graphics memory (< 64MiB) configured
with high resolution mode boot to a black screen because surface creation
fails.

Fixes: d947d1b71deb ("drm/vmwgfx: Add and connect connector helper function")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 32 +++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..70b2ae974df3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -829,7 +829,37 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
 	vmw_stdu_destroy(vmw_connector_to_stdu(connector));
 }
 
+static enum drm_mode_status
+vmw_stdu_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	enum drm_mode_status ret;
+	struct drm_device *dev = connector->dev;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	u64 assumed_cpp = dev_priv->assume_16bpp ? 2 : 4;
+	u64 required_mem = mode->hdisplay * assumed_cpp * mode->vdisplay;
+
+	ret = drm_mode_validate_size(mode, dev_priv->stdu_max_width,
+				     dev_priv->stdu_max_height);
+	if (ret != MODE_OK)
+		return ret;
+
+	ret = drm_mode_validate_size(mode, dev_priv->texture_max_width,
+				     dev_priv->texture_max_height);
+	if (ret != MODE_OK)
+		return ret;
 
+	if (required_mem > dev_priv->max_primary_mem)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_pages * PAGE_SIZE)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_size)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
 
 static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
@@ -845,7 +875,7 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
 	.get_modes = vmw_connector_get_modes,
-	.mode_valid = vmw_connector_mode_valid
+	.mode_valid = vmw_stdu_connector_mode_valid
 };
 
 
-- 
2.34.1

