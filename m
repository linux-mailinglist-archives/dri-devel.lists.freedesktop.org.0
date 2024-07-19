Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A68937B21
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 18:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF310EC0C;
	Fri, 19 Jul 2024 16:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="L+ixRrEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45C010EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 16:37:04 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5c44ec4f2dbso1187584eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721407023; x=1722011823;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=as2TFjpRQ+OUocTsTglYE+iwiVVBQctlNuN5r3pJpo4=;
 b=L+ixRrEt80E7YMtEH/8V2idwmHKQeXYvT3xzhJhONWZgaL6niXAW7CR2MYzkjK977R
 4MmVzmNR+zpTXzvuEgsBGCt0cdZK8dLinrfl4ZWKVDz0yxcWdbEpNdezbcJ3nc9t4FIZ
 /rISNPQSr2sEPN8uZ0a6hAcA3z2YoCVkkCBRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721407023; x=1722011823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=as2TFjpRQ+OUocTsTglYE+iwiVVBQctlNuN5r3pJpo4=;
 b=k+YGeTxtVP6wHWIx2OQbiF4+AqrQIHEMTGUQStCa8iiVyc7LQwvlNIau/t/u/kVMB3
 aoJdKnIKg3TeL0Y2bcmZudoWG3kpN/colmK9JYYtlKwWtqr9UwrSntv0GfIev1nL4J3L
 0ufEFcHY21JpCafN/pq+IEtlgyejqSgWK9YtrFhUol5jszEoCMfsVmvNus/c6nEWvur4
 rZ7jVrDPp2/ywN0c6XU7d1o8MF1+UcUCvs3MLsLgVT1qiMe6hY8UdKbog5FYVD0RKnDv
 hqm9taxmUUNHHmvuWtLkVadwR2y+iAOFWGWRk5pQzdbUh1G7UstUNJvA/gjs6ZNix3WG
 5qMA==
X-Gm-Message-State: AOJu0YwkR4mQHFhO7d2ZFgiPvWTFLT3aYDH7poKaQL5h0bYAYinQjNUb
 aZQDvFqxnSEyoc8P9TyJTk7X/BIZH80pkEvTRGJsEpj4KKUt7O4tgTdfhRCOx3rMiBcJ9friEP5
 67yQlEb8o9LCIE5s1E2MDEdq8De1veF9deDYBrJDvWdK3WOOWHxPfBtlSL8Wc8eWLHobDsohXYZ
 lAbLKf6TWMs7kRYkRKUQO9VsuQG0uLZY5KmjdRwKvpfPMrzh4qRg==
X-Google-Smtp-Source: AGHT+IFgvX7e0Yb3ZEVUo2MC7Bk1QEje0hZCPsEa6vB3PuQS6Mf1aiQrCRuWrEqM/fKh2O1MYNDEiw==
X-Received: by 2002:a05:6358:1081:b0:1aa:9fdd:af89 with SMTP id
 e5c5f4694b2df-1acc5c0eebbmr50882555d.20.1721407023253; 
 Fri, 19 Jul 2024 09:37:03 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-79f0b0538bbsm594645a12.24.2024.07.19.09.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 09:37:02 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 doug@schmorgal.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Fix overlay when using Screen Targets
Date: Fri, 19 Jul 2024 11:36:27 -0500
Message-Id: <20240719163627.20888-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

This code was never updated to support Screen Targets.
Fixes a bug where Xv playback displays a green screen instead of actual
video contents when 3D acceleration is disabled in the guest.

Fixes: c8261a961ece ("vmwgfx: Major KMS refactoring / cleanup in preparation of screen targets")
Reported-by: Doug Brown <doug@schmorgal.com>
Closes: https://lore.kernel.org/all/bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index c45b4724e4141..e20f64b67b266 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_priv,
 {
 	struct vmw_escape_video_flush *flush;
 	size_t fifo_size;
-	bool have_so = (dev_priv->active_display_unit == vmw_du_screen_object);
+	bool have_so = (dev_priv->active_display_unit != vmw_du_legacy);
 	int i, num_items;
 	SVGAGuestPtr ptr;
 
-- 
2.34.1

