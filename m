Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77268C8C56
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29610EF57;
	Fri, 17 May 2024 18:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="UvuSdble";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADDD10EF57
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 18:48:47 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-792bae4137bso93803585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715971726; x=1716576526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+V6FmkDwYv1DNx9VbF748EO2AmTbcfb/gceTTlRkQI=;
 b=UvuSdbleEZrFiH9P8OirS2j7iq0hfj4GXs+isqvr2enQd6lzsWYlvVJ3E0Mw76dMX5
 rzfyID6/xfzwtjezadK3AwxQyjTiWfwHYQPWMfW+ugpKL8Edaedf81R5SoAZgU3n47J9
 uv72tpWgW9ZqpPdKbSrwcMuSr4m+ooo6tBb4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715971726; x=1716576526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+V6FmkDwYv1DNx9VbF748EO2AmTbcfb/gceTTlRkQI=;
 b=sug7gmLePWV3JIK8dADgV85JpXRYwNqUwnFDjRGgEJ9yJQ88ygAgGA6Zte4D0BYCXh
 buujC0JqERp4pveVe5mBmvfLg+JK7fQbfx4ktQb3kyi9YlxJr8o2BEVdUR9CFgk155y/
 mO8PxCWZkPRqCbBC6ClXLayOmXCr7BVg3y7gEWFPjtHvsF+G0XeopHFv3kHTYj+ba643
 0LbTOTGDsUAj0zfAcFxWBUlcfXfqsJjiqdokax3yYC18mC4SZF572i5YBPZ+RTpL8NbV
 JGIxauQ19u0ZFmj+X+ZBhG7iwAzI/4I88Miy423ugtfHCHjMmvpiXLbUzvzs0lTUZoa5
 jjpg==
X-Gm-Message-State: AOJu0Yy22JNmH3CTSDzcCAJWbJhbWVIGYzxoLXFrEAX2SyXAf6y/kzER
 uVx2iAXjZj9msqJe+twhS4GW7wttElt+EOMU2hgXykbclWB+BHn0FRRLQLLL2fOuqwLZIi9kAO8
 dI31KtvUkYBqbbsqxaCMYwvVVWtCHDpdIvNiIHQ7ReCeEIgB8VIWoE/rN+QWpFmBPl3Askat48k
 R0nGMgGXtIB4YXDXccu+yKthEewWuZKU9ccGHPOxw45o87EXxM4A==
X-Google-Smtp-Source: AGHT+IGcKlnXakBVlcQdpbAhmbLAAsT9DM+gleyQ+gebMsomFkzffFGqrfgNeZPuJw47fvhd0P5aAg==
X-Received: by 2002:ac8:5d44:0:b0:43c:5d8c:f854 with SMTP id
 d75a77b69052e-43dfdac38a5mr333681521cf.11.1715971726051; 
 Fri, 17 May 2024 11:48:46 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df550c10fsm113882551cf.43.2024.05.17.11.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 11:48:45 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 2/4] drm/vmwgfx: 3D disabled should not effect STDU memory
 limits
Date: Fri, 17 May 2024 13:48:09 -0500
Message-Id: <20240517184811.25807-3-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517184811.25807-1-ian.forbes@broadcom.com>
References: <20240517184811.25807-1-ian.forbes@broadcom.com>
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

