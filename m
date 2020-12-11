Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9F2D7AED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4030A6E492;
	Fri, 11 Dec 2020 16:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F2F6E492
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:29:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so9603381wrr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpiijVr89F8nqjdVd6wN/2tg5R0qv54rwlPKpl3gCmM=;
 b=eUKVLv4TorNRjl7Nu0wE8SbTu/IXooP4+GetAmrFzLG5lsCXjrCbaJdBD1hJ+JcOt7
 KSjLUIqUUznT+4+iKTgJxWjzXAO9NlNYBLS6/sxYAWzbcuwCUZZOeMpi/hpHlelsUdMS
 z9EsIddZ0sCAdFkg2vsADGsYpJhei/4CzPNVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpiijVr89F8nqjdVd6wN/2tg5R0qv54rwlPKpl3gCmM=;
 b=Nuc6yBmQAffa/m4lSKgDQziwbVt5CUE5oNf1RagjyF1Kn2Hprm5G7axLUPIPOh5KkE
 iBdK8bMN4sLd5o4rXyBwNzb3kRUPJA8zDzKHKEhtdUVAn2vGYYboc2jSlwX9KA200MfY
 4EQi4Ski9yscb95V1rezimuVqWqFjphh73kIbvc//KCkfQDQ1frQn7WU36HDZGGrC3qr
 cvvbVAsO2RttJqPQNfXlZxH8IlGanFDkoiZnlWejMqTI/P6caAZlsEhb7CVI0UO07JWx
 DI78C6/lBk8/Evr0JutLGl1B4RfubunoPlqmJxOwxG8l1apQ0aHACxsPGxlL4wVSt872
 XCcA==
X-Gm-Message-State: AOAM532hHKatDwev18D57R2WrF0JhBWQeHUXbTGly2kidvV5OFJxiOnM
 uO6+s+PQmYW0iIrCnH3Puy26XLu/tXCc7A==
X-Google-Smtp-Source: ABdhPJxPQK49fd5119Mdd2ByngIDgHmDjt591TwVAMSMBltcXpWRM+kq6Ck8glxotr3LqDxWpDBKCw==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr12358774wrt.290.1607704190697; 
 Fri, 11 Dec 2020 08:29:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n126sm15917654wmn.21.2020.12.11.08.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:29:49 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/vmwgfx: Always evict vram _before_ disabling it
Date: Fri, 11 Dec 2020 17:29:41 +0100
Message-Id: <20201211162942.3399050-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, sroland@vmware.com,
 linux-graphics-maintainer@vmware.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other way round is a bit inconsistent (but not buggy in any kind).
This is prep work so that ttm_resource_manager_set_used can assert
that the resource manager is empty.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 204f7a1830f0..0d074c432152 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1250,9 +1250,9 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	if (ttm_resource_manager_used(man)) {
-		ttm_resource_manager_set_used(man, false);
 		if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
+		ttm_resource_manager_set_used(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
