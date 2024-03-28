Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C2890943
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 20:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46610EC09;
	Thu, 28 Mar 2024 19:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LpL51s7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4DA10EC09
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 19:31:38 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6e675db6fbaso779883a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1711654297; x=1712259097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ekWewM+rcj5Bzs/fBZ5u5fAbAKxF0Th5qpkjr8yz80U=;
 b=LpL51s7bMJ0l1Pxez4ZCEtPEvYW5cGKMfu/AjkjF2l0XULub9Xk6Og1oTyzZQh5PzP
 8mDoWMxtoqC3hc/Fsui/p35+tv/TmdD73rKtxpDTvqCO0luBNrsEKgXXHVeD2F6oj7ar
 8HSh9uNuMqvxPD2/1T54QogzyN9hiAPFQ7VSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711654297; x=1712259097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekWewM+rcj5Bzs/fBZ5u5fAbAKxF0Th5qpkjr8yz80U=;
 b=sM2uRKPEXCks4v7fILKr549lwNH0P5dUTTdWKWbhx4xLhmh3t/jorAu+/alP2cmGcB
 mqnn7Zd5PmPnxHDMyyJNmBJ9Sv52qWB7+3cVcxoqBc+YqjWP+LcKyhdp6rj60UzFKkrK
 sMm/D0t90EpoPxva4C+WoT1/pkoL2HlS7djcj0oCiap627J4kfCh7gWWyNQDCbGiaQ4g
 L/kY9bdRJae29bvVBXrouRilcZkgYV8Rzg+E+VA+leKSkrp/n50sSviTKuKwctdav4gA
 6U9r2ZzcFKxZaab8UGDBjdub6DPGHcVaotZ11UzzhrzWKsIGD2VrJS5y4R5HUF1RL8yd
 UaFA==
X-Gm-Message-State: AOJu0Ywp2yRR+WxOzAAmlVT7x5KqIFtdJD3p2HGrgRtVaIXQd2od8NKp
 JiOt3OZz63MaKE8uuixqxHFo44hrKhIKkpUXU26CmMuYUkozzyAz4Er3w6g/XxDzX2TbI5NUdVM
 aI9/o2zo0GZB9yLPGTaVABNXPEpa8nmFwMVyVMgyO6YEy1kfgRATG6kvbFe2jNfUGqIx1BAVjX9
 4FXPlBcrl9iE+k1608zun/fEMYuyEp8HdYX0teSQEjirLfRjI7VLBYcEk=
X-Google-Smtp-Source: AGHT+IE1D9TBcxXBBgX4jk9L7OGyZEkO6CDeiMmjnLKFZMUsshn+qOAFhPEC3srhd8FtTOZQJeV3Ew==
X-Received: by 2002:a05:6830:4115:b0:6e6:d8c6:8814 with SMTP id
 w21-20020a056830411500b006e6d8c68814mr329075ott.5.1711654297531; 
 Thu, 28 Mar 2024 12:31:37 -0700 (PDT)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 l13-20020a37f50d000000b0078a4d950935sm772282qkk.12.2024.03.28.12.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 12:31:37 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Don't memcmp equivalent pointers
Date: Thu, 28 Mar 2024 14:07:16 -0500
Message-Id: <20240328190716.27367-1-ian.forbes@broadcom.com>
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

These pointers are frequently the same and memcmp does not compare the pointers
before comparing their contents so this was wasting cycles comparing 16 KiB of
memory which will always be equal.

Fixes: bb6780aa5a1d9 ("drm/vmwgfx: Diff cursors when using cmds")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index cd4925346ed4..fbcce84e2f4c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -216,7 +216,7 @@ static bool vmw_du_cursor_plane_has_changed(struct vmw_plane_state *old_vps,
 	new_image = vmw_du_cursor_plane_acquire_image(new_vps);
 
 	changed = false;
-	if (old_image && new_image)
+	if (old_image && new_image && (old_image != new_image))
 		changed = memcmp(old_image, new_image, size) != 0;
 
 	return changed;
-- 
2.34.1

