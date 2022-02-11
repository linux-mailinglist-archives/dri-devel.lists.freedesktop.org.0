Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA34B263D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCC810EBC0;
	Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1DC10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k25so22701373ejp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=09+OZY0MO5bnMgqYdcklnL95CtjCA0G+15DEhlIQKlg=;
 b=L7NKrNr7o4kXQsZcvDvrGQ/zlWGe+D16fjPdkAphn3CuoDj2IMgSIVjX4TpI9crkDM
 DtsVYhS5lfxMC6/H3UGkVnNw+IcE1N4JR4uWM3lvb6bBbtA2dV/tZgeSJWxfOB0ENAeb
 ays4LmerkN6FBQVpTjSqj07Pc9T7PSGDrPiD+5d23SF0DuSxqnoeYi4fQQaJDScvYiBl
 VELFB0x7ClqhRLXYDcJ5rY+CCxcPZN6VySq8qwvb8BxyNjZuuflVULMjE42qgPAe5J/X
 /P2BDV3IyH4/ar16WcYj7HPEYe8XitmcByw15hMDMxO4SovTB7XRoZRY/3U0BNHusBu/
 rL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09+OZY0MO5bnMgqYdcklnL95CtjCA0G+15DEhlIQKlg=;
 b=cJgB3ey6OmYJhcpUSkBfYJb/k+3PdsPBz1HS4CyeN/Rzo+wynHQos7lVoMswZcdkKR
 S8Vr6PCngkwZRWtY8kv3Mw6fThpYVGOxKiH6gUoKfEtqIojNlBdVKH/5RJOhwuh+RJnh
 h0OO0hd7xtIGUCGqM4puS+WR2ZUtJ5BqRW59X5XFdgvyYOWhr9YHyz02AkM5/zadjmmv
 3kTZ7bXvCZ/68QDPDmOYH7VXuvrcL34cFR5JInVFi0VUoMEWVl9wbrCT+gJz/PByMFFG
 59VvKjCok2sn7TiYhOsrmL4IDeMBuezeytC9L+QWF29xJl/lpbnig1aeluebCILdXqGF
 VfMg==
X-Gm-Message-State: AOAM5330Od0FDud9R/xuouSCibgYbexICir/FnXSAB5ANKYNJagzTCaH
 2J5SNhTIGgZKM9S7xGjljgphUxFQcwk=
X-Google-Smtp-Source: ABdhPJyk9G2/y/Hf+ZHCznnLeL42yGOM+HuM5Ck1EeVau0yM92llxUo1T83wtG/U9TZNua3xAfbIyA==
X-Received: by 2002:a17:907:7ba3:: with SMTP id
 ne35mr1256453ejc.100.1644583813083; 
 Fri, 11 Feb 2022 04:50:13 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Date: Fri, 11 Feb 2022 13:49:47 +0100
Message-Id: <20220211125003.918447-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 708899ba2102..36c3b5db7e69 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1165,8 +1165,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

