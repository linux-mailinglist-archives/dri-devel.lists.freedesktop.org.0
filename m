Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DC89E454
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7C112F35;
	Tue,  9 Apr 2024 20:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d1nsbhon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DE0112F33
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 20:25:47 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7d5de651252so123450839f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712694347; x=1713299147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TyaY/I5CyvrBegK79hP9X4uvBfReIuIWj8s/HCupCM=;
 b=d1nsbhon2XmNZUP0wjBrH3wgo+NcMxnKj3WAv1418vkJVLBK55R5LBKTtif7OR/7hA
 VwpR3AObsoTnWQY0RjMu0ey2GZxkdSpGGw/cE34vBpoSOD/EWdg9vIjFx7u1CtbvqFRN
 pnzjHY1mEBOYF1BoaOJI18cN7ILRcSkgPMZkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712694347; x=1713299147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TyaY/I5CyvrBegK79hP9X4uvBfReIuIWj8s/HCupCM=;
 b=vF6l9n1XQkdXc9IJnDi5/lQs2Cjb6aDtkyGlnSVW84VTpfw1bDjV/TPLTNJrm0Uvd6
 f8Zf5Ci8keZTi5VP9EPOhWrfiXWLG8PwteZAWumnpqgIozdrjtwWvi8wVcYTSd3rjunM
 BOSVAzhcCRaB1uVTMdjU5JR13QH9n43YqJeiYBrxBI94tb3KTtnCeKnycoyBk9QMiOUM
 WePQglwSjb3ABdBNfGUWoUJFgs2mekjHujqSPZ8NoWCZYE5Vm8gQL0tyTdveogQLQ0KS
 +/YVedUN/jc/XOGNB9MvxtpbF2FW8acLyWaBV6mDD0ME/yGpDGvtDdsAielcCaa2rRt9
 QV8Q==
X-Gm-Message-State: AOJu0YwScTEcEBtWNbzevV6RRfmHwfuyqrvOW2jJJra/g4zffMGotKtD
 pMxFx3hrbG5bwr+QfuEWsogmOZKX9j64TtNJ4qvRgwFvL6AdcegCkTDdkyUMNXZTZXs5REecmOQ
 E1BgjJRYBIqmj/kiOPd1pvgQJtCbTs3HRg03fBrd3nBZpRO+WueoyLXrtqVa/LmU0biu+ywF6rf
 cs57zXWhakZY86M3apNdazGXIspk1f/70Q1ToXmJSF5m9sXaB/VpIH
X-Google-Smtp-Source: AGHT+IH9KEQ7pqp79DsthUhbiVLTtS3xrOvIMyQyIqAGbx5ZpNfRw8A+A4T7eczZrSNItnU8/525Lg==
X-Received: by 2002:a05:6602:36ca:b0:7d5:c3d9:d979 with SMTP id
 bg10-20020a05660236ca00b007d5c3d9d979mr982221iob.8.1712694346986; 
 Tue, 09 Apr 2024 13:25:46 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 iq5-20020a056638840500b00482adf840f1sm424532jab.62.2024.04.09.13.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:25:46 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 1/4] drm/vmwgfx: Filter modes which exceed graphics memory
Date: Sat,  6 Apr 2024 04:11:16 -0500
Message-Id: <20240406091119.26567-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240406091119.26567-1-ian.forbes@broadcom.com>
References: <20240401195645.31081-1-ian.forbes@broadcom.com>
 <20240406091119.26567-1-ian.forbes@broadcom.com>
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

