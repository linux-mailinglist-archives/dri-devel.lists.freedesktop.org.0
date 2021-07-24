Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A33D475F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 13:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F1772F9A;
	Sat, 24 Jul 2021 11:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8517C72F9A;
 Sat, 24 Jul 2021 11:19:29 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id m1so5917617pjv.2;
 Sat, 24 Jul 2021 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtMk+ANh4DuxEoD3swFwLh1zqoMdf700cXOW5hW9VCs=;
 b=pjZCOOSFL9/1Jw3Kg+6QQe9VtN1niEfY89EHxMu2RoDJIEEM3GeExXQpN+6n0Xdh0n
 u3HHiSB0Pr2kaUCJAsdbnVgBec3Tj7lKVUqCJMkU4HmsiR/xQTTeTO7yt/NmDhREyB5E
 kBMMPhhuOaypHSgt3N7xROk3xAjJpTJK+cFdAi3zC4zBWsYEsmCrdr3nl4cTOTJpeA8D
 upOLTZFpnhjkCD/J+HNokKPkQVsLXM3wOnL+SoAZlEFXN4yMtc9mDrIUTkKqLOpvRUJ+
 Wb5ne6DvJONJAgV6jIQFjgvoPUE8R3VbBrGBu4zmY9D/gI68zp8/6ufehAu953/2wlNq
 6oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JtMk+ANh4DuxEoD3swFwLh1zqoMdf700cXOW5hW9VCs=;
 b=kqGKgxt+CqTJ+1LncdFPIGlKs2LW0xOpVnkhLwNz1Tn79rmUGReI67da7z5fxOFcoQ
 NUF4VhwoM+n1rj9idD/u39/B8WQbv63y6NuVBMh3T7mEAMQC/BudfrlQygyV51h0GTC+
 XEOemu4aFyEn8y8fLgPq5iKdOe2lu6DcgEw6ggiRNKFzQZf2pUnWtbBpK05lSXJ6MXKB
 rWOrQMYK+MUvoK5+Xq+8ryzsgzO6Fp5OSAZOAVQbCMad97kHC41U+oS1SgoQLoq3qLTO
 zLELGfEsMJHeG+Scps1rY18DmdawKqAcfoVeKhv9zw8V0abMN9V9rKl8uLh00s6YV8h7
 jCtw==
X-Gm-Message-State: AOAM532QPJ2XfhW83Cv84jVRrwukXrKbB3qfvtExFDMCpUZ+oqbI5ZeK
 wrvfee4ffvKCbMRyu72jyBM=
X-Google-Smtp-Source: ABdhPJwjecatOou2FojjS4Q5ivhQZzJu9dQ5hERPjw61bfMZF5fKRgk86NeYWnsy8MHcwdqY3PoxRg==
X-Received: by 2002:a63:4d61:: with SMTP id n33mr9008079pgl.219.1627125569239; 
 Sat, 24 Jul 2021 04:19:29 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:19:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
Date: Sat, 24 Jul 2021 19:18:24 +0800
Message-Id: <20210724111824.59266-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724111824.59266-1-desmondcheongzx@gmail.com>
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_file.master should be protected by either drm_device.master_mutex
or drm_file.master_lookup_lock when being dereferenced. However,
drm_master_get is called on unprotected file_priv->master pointers in
vmw_surface_define_ioctl and vmw_gb_surface_define_internal.

This is fixed by replacing drm_master_get with drm_file_get_master.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 0eba47762bed..5d53a5f9d123 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -865,7 +865,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	user_srf->prime.base.shareable = false;
 	user_srf->prime.base.tfile = NULL;
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	/**
 	 * From this point, the generic resource management functions
@@ -1534,7 +1534,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	user_srf = container_of(srf, struct vmw_user_surface, srf);
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	res = &user_srf->srf.res;
 
-- 
2.25.1

