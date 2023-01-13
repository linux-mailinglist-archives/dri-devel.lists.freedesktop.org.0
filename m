Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B76693C0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 11:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053E210E15E;
	Fri, 13 Jan 2023 10:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C373510E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 10:10:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so16997106wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSVl5Sds0K3+KZcEdjR8SvziCTcv9fxNo6Bvw/idysI=;
 b=aswETd7JofjodlQwRTEaMY39q6cLRxXbGz4sWS1z4HdfSFlFlacI44O6PW90eNGTSL
 9PNSxYGISkPqoE1XYUGtdCEb/Fv9a1Q7OwNqkzMJosXzjZOQCbGoBFhd2i6eu863RW5o
 YuRlk2GHemgttWcKomFKBrImFmlepSAu7SliiZWD1+rblpd5eJF+mP6L6dpm3R6Zt1d1
 SIkpNyIhcsTyINYRonZz8szOAxajrf36wgd2NgxvXM4Wosedex5mwhFC1BGFEzMHwYqc
 VRekTeVxVC5ZEJRqn9FZG2DN3fiUHKuT9FHwBbyOoL7sVdyqtPc0mvM5PnB5R2xfl07F
 WYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSVl5Sds0K3+KZcEdjR8SvziCTcv9fxNo6Bvw/idysI=;
 b=IMfpImRSaxOWIPymeOvRFM+Ei2z2Vbj2ZwqwLoB9Ku8h++G9+i2prVkUgdGTQpAwp1
 p/Pezrp1i7CWw83kGmD1XE5hnuDKVeXauLkRJpWgCwwv054uSpuGh67v7QVAtb1IHi5w
 G5yJjTMnAtEJ7iDLSie9hu269qzvHdncxIBli/5OKbm9vbiiJ3wTtio56Nx6xLVnc8a8
 CSauydgMhygHmaOvJBcw1Gk/nQ1IR5PwBtpMYDpPSbSKFAf7ILd045X6P4uvY+Ovz+sP
 qDSdRI7IfAKpDJhmLesIXxRyhEsv3w5GAh6NY8E6OjN2wSaBBughPqqPuEu0Q6IjqVI6
 1P2w==
X-Gm-Message-State: AFqh2kogb6/2ghJk8Yxo2U7Er+hO/AR/PFvNrTts+SbvfyEAAREaQufF
 ng8T4t1ehIuilUtyrw6hmRs=
X-Google-Smtp-Source: AMrXdXuF09ofFhbUjN2nSi9BnZQwyr37SS3M2YFjX0/cPjEHxEHVFvUMYjog736OW7NXewReG7u+3Q==
X-Received: by 2002:a05:600c:22ca:b0:3d1:ebdf:d586 with SMTP id
 10-20020a05600c22ca00b003d1ebdfd586mr57862681wmg.29.1673604600315; 
 Fri, 13 Jan 2023 02:10:00 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm23762476wmb.45.2023.01.13.02.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:09:59 -0800 (PST)
Date: Fri, 13 Jan 2023 13:09:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: [PATCH] drm/vmwgfx: Fix uninitialized return variables
Message-ID: <Y8Et8+c8+JAGNqTP@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Krastev <krastevm@vmware.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code accidentally returns the wrong variable (which is
uninitialized).  It should return ret.

Fixes: a309c7194e8a ("drm/vmwgfx: Remove rcu locks from user resources")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 9359e8dfbac2..0ee30a1aa23d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1156,7 +1156,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use MOB buffer.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, true, false);
 	ttm_bo_put(&vmw_bo->base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 0ee30a1aa23d..fa3761b3e956 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1210,7 +1210,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use GMR region.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, false, false);
 	ttm_bo_put(&vmw_bo->base);
-- 
2.35.1

