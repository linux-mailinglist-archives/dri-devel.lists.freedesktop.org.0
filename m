Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A68A20DE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3710F0A9;
	Thu, 11 Apr 2024 21:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="O/juDmi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4AA10F0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:27:10 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ea128e4079so195032a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712870829; x=1713475629;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52u2K9stNj677Ch5sgU+s1qRTX+UAzyZOVoiAku6bfU=;
 b=O/juDmi+AwhhT8CB9lf6QZ+8BO5WCd4AFbU6QJFwX4Fl/M8c5DftWycrQ0URhqG3jP
 CS1fAo9c3LcG/1Ke5Mu9sMqz0DTb6GS4BHkcVRaCbiTRdu4KHUN8ixSerIlNST+oUypf
 P8abxvxDwyv3X9s5jOXFjacKGenh2Wvp0I2Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870829; x=1713475629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52u2K9stNj677Ch5sgU+s1qRTX+UAzyZOVoiAku6bfU=;
 b=aj/5jzbo75eYgbd8OB7TUSZibbtnH0xASFRRDiM87ko1UV7opdiscQtMLm9sD93tjZ
 2fPkawzYAfhYdhXXXTI5zKztkr9tKCI+rLaTPywkC8llET86C7x2KJLdOJsyJQY9N/9T
 UYUiQv9nIs8JECh5nzQq6tNjG+5F9tcbuum0eYfE61UL4H3gQcygSbZ2EiFJFnhHZoYt
 kLgoX6Q2Rq4dkxZXcKc3ddAQvO+fvRuXSr+EMbvxZp5ec6oSftYzxRS1csQ5beM7oIht
 G4Q1awj/lWS90Qa3cN1SX7mgOrIWhJKe6TrlLCqgXigaAkk9tudzEaHpVnvI+GQWLjYG
 9X3g==
X-Gm-Message-State: AOJu0YzOEtxjwLqG+BdpuB7SMk6s4ruJiBsEUsuau2rXixlRu9TqX9Oh
 CJf9q1NoJVMLGIjZYPpmhuVIgpsfEZnURdsTf240MEZp0GsxCROxXygOcJRwxP0gLFJiE4hJvmI
 NoCxne8caaiKMNtRgcxrZ3EjQh5gtW2blLhX1GHkgzZTjUdhSaoY+XuZ/FZvwPabOAOb+xQkFgn
 khDVPRGWFURJhjLk6T/sSofVp2UWHtwDuDCaJ1y3HyV5t+rKrJVNzf
X-Google-Smtp-Source: AGHT+IF3cGiW98iVTJuBt1hwBA48M1zOty4YyxVsD8vSUAebWvh4Ek9j6Lh+fziW2YDk0CTOM0GsiA==
X-Received: by 2002:a05:6808:179e:b0:3c6:4d7:abf9 with SMTP id
 bg30-20020a056808179e00b003c604d7abf9mr952586oib.55.1712870828997; 
 Thu, 11 Apr 2024 14:27:08 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 t22-20020ac86a16000000b00434a165d45asm1377484qtr.38.2024.04.11.14.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 14:27:08 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 2/4] drm/vmwgfx: 3D disabled should not effect STDU memory
 limits
Date: Thu, 11 Apr 2024 16:26:49 -0500
Message-Id: <20240411212651.540-3-ian.forbes@broadcom.com>
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

