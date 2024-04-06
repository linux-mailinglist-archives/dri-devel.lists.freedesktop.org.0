Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BB89E455
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D359112F39;
	Tue,  9 Apr 2024 20:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hX4/aKlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342B2112F33
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 20:25:51 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-36a0f64f5e0so18473335ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712694350; x=1713299150;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52u2K9stNj677Ch5sgU+s1qRTX+UAzyZOVoiAku6bfU=;
 b=hX4/aKlOb9ufSIYIIZkBg6Lq/41xj8/7L/kOI+lPorIv97UvwFI7ZJXv4Q+5857iwE
 Ka2l6aJPXAFdOOE3kTu+Gos4kLlTuKBNbKYsdhns2sAx99MWsR2zHPf+HB3ixw+vVTZP
 EfUXyv4aGtPxTKChdCrE0NdZpaGKnTTO0wo2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712694350; x=1713299150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52u2K9stNj677Ch5sgU+s1qRTX+UAzyZOVoiAku6bfU=;
 b=fdtfhdQwkvmW/gzU9XtmfaZ3fbtY3YW5io5CEmF6Uq5jieMSxK8MpWkjtr+PTnr70g
 WjZpCuLsvTmnK/aL7sMLIb61lHO8cDcUD2sL6rlSPAP7DwWle5RYB2JFyQSxL7akuFYX
 N8V0Bc49agDAmx97FO+W8FRNscQbgn8MaoPa0PVGMn0AuKKiV463GPdjOfdEfI9WMbX8
 ywQXW+ojZCW+/yC4Bwjuxfz4KPcavDozi0UrG1e+ffJRQZqx/seBf131xOsvqjYOgaH7
 GyxQVeZiYbU8tf/69Pwi9uGopiATBGQZKMqtKWM3fMCeCsE6ef9F7CHScfE2a44xEI0v
 8auQ==
X-Gm-Message-State: AOJu0YyM93a2cSqLDxKIyifdvtKf+4J4s0ImdsDTaV1OfmAB1HwMmHsF
 twyVjlTre1wfAAB1E0TBUWxA1LEgxnyN8+6/ud84yTnI12TBBBGSIuQqimgcOR7xwY/ezqYqzr3
 jZ9wwvCJ0yKJ+rBaBQOX/XPFYcPWclIpegwiJec1mke0zDT/qjt2H5Uzq0Rn+y5GC6uhWK9f2/O
 T9d6CAA+00rRvbsB0SK3rseO5FtUeq3yG9BX0qEoQvkwuipqgAmu+Z
X-Google-Smtp-Source: AGHT+IGOx4jD6LOqyGOdUTb2syMc40HwqZo+fouLzMB+NTMm//nz/xz7K3J7G8M8M3CVptUBLo6f0A==
X-Received: by 2002:a05:6e02:1a67:b0:368:9b91:4d1 with SMTP id
 w7-20020a056e021a6700b003689b9104d1mr1076781ilv.15.1712694349822; 
 Tue, 09 Apr 2024 13:25:49 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 v14-20020a92cd4e000000b0036a0a54628bsm2725372ilq.81.2024.04.09.13.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:25:49 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 2/4] drm/vmwgfx: 3D disabled should not effect STDU memory
 limits
Date: Sat,  6 Apr 2024 04:11:17 -0500
Message-Id: <20240406091119.26567-3-ian.forbes@broadcom.com>
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

This limit became a hard cap starting with the change referenced below.
Surface creation on the device will fail if the requested size is larger
than this limit so altering the value arbitrarily will expose modes that
are too large for the device's hard limits.

Fixes: 7ebb47c9f9ab ("drm/vmwgfx: Read new register for GB memory when available")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 41ad13e45554..570d5fb65a2d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -958,13 +958,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 				vmw_read(dev_priv,
 					 SVGA_REG_SUGGESTED_GBOBJECT_MEM_SIZE_KB);
 
-		/*
-		 * Workaround for low memory 2D VMs to compensate for the
-		 * allocation taken by fbdev
-		 */
-		if (!(dev_priv->capabilities & SVGA_CAP_3D))
-			mem_size *= 3;
-
 		dev_priv->max_mob_pages = mem_size * 1024 / PAGE_SIZE;
 		dev_priv->max_primary_mem =
 			vmw_read(dev_priv, SVGA_REG_MAX_PRIMARY_MEM);
-- 
2.34.1

