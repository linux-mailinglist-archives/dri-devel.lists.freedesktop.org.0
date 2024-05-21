Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0B8CB3D4
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEC410EC9E;
	Tue, 21 May 2024 18:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="h2wwN/Zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEB410ED8C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:47:37 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-69b5ece41dfso9071436d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716317256; x=1716922056;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+V6FmkDwYv1DNx9VbF748EO2AmTbcfb/gceTTlRkQI=;
 b=h2wwN/Zh9y4uxkUN40Xld0ClrNewK8LpIZYO7GqwYgwnJd0ZZsZwQsWdICGv7vfv4L
 tOn7svT59hEo8aHxliDaYgqwLNOosVb+zQnw5Uwdf8E/ZXAetxyp4OSwbyw+UOZHI4pa
 Y9OMzPyfCAwt83h6kVYWpW2wC8BhFb3xt3cgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716317256; x=1716922056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+V6FmkDwYv1DNx9VbF748EO2AmTbcfb/gceTTlRkQI=;
 b=O79j4xZeSOfvo5EFA3SvVgAphb7kzXKvtlv+yRuCOaTFtAjLSsrKD2qjvfZjpjqmMs
 nZe9Y5ylowfh7MS1OCEEe7DpaNmPUOzj1NENk+Q+s27BclHO8yHicNlnYjt/kVL+4NPJ
 8UhF2ONxEeeBbwDY085zpBgIJA83zrvT6BzfWpxI549sxyMvb49gCRmWe08LTrv5bUVx
 wiYVb6STIXyNNV0Ur+KGWR1QyZVUaIz92Vz+0HAm/uPSTnezywDishNu40ZFIM6wNJzo
 O8WRkHB0YdUkkC/cNjeOz2zqL86ri2oqzCEH3PQsRYnKlU30NDvF1hykJBcffPurv15y
 BCBQ==
X-Gm-Message-State: AOJu0Yz7y/TZuaHxClkrzn8SsTtxZGeuqfVAcBQGTWA+1CvyaEDauJTU
 1bHH7ZcWHUFGgPt7I5kwX+oEZgGHGfsb0DDE8Ch+sqnnTpKOYAnZ5/wiylwS1zBNQZ8HbIpswCB
 TckLEKyin6mYlrFQRstUosG5O+T8Uk2DeJGBN+YmsG0WxZcS9At25DR/08TUyPpXLAPrT0fCxWb
 AisrCQT9yf7DTlvZZjwLGh1WYxdeeiDwOJSiLsVxoygg/YmP/LAA==
X-Google-Smtp-Source: AGHT+IFuky5g7mfkI4pRULjttzP0jIi3tKodlPX3Dqek46QUKtQk3KgNePhQhPlRh4FkviZzaGrSmg==
X-Received: by 2002:a05:6214:4b08:b0:6a9:8511:207c with SMTP id
 6a1803df08f44-6a985112240mr90196126d6.6.1716317256288; 
 Tue, 21 May 2024 11:47:36 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a8c2d39d7esm34170856d6.95.2024.05.21.11.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:47:36 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v3 2/4] drm/vmwgfx: 3D disabled should not effect STDU memory
 limits
Date: Tue, 21 May 2024 13:47:18 -0500
Message-Id: <20240521184720.767-3-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521184720.767-1-ian.forbes@broadcom.com>
References: <20240521184720.767-1-ian.forbes@broadcom.com>
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
index 4bf6da2b15fe..2e1fb46bcaa3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -959,13 +959,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
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

