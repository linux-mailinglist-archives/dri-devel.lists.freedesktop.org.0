Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3A46BB43
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E737F73858;
	Tue,  7 Dec 2021 12:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1173858
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t18so5248087wrg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=gDe8fJ83oMPovLlyB8HFqqdujfmf5BPCwaHMpVcaiqkl/LQQHASJUErCDODbhDVu13
 463dGJB1StIe+RozstSEm51gDJQ54VUcefZusTDUK3gcnXJjjbJfX5Qo4UtnZpIYIdJO
 xYPfijXb4W3uQCaaFf+IaHUvTMx0ZPVntXKRtLfr1WLl4hj6A92WJOBw1gabBspr/0Qk
 xSDySBgU0G2u5KPAJm2PsNRQ4vH7Cz+IT18G4X8xdfuXfz5pvgqGIMdCovRT4+30pamA
 PoSd8MIML1vJCBJSYOUvI6Si2GH+nZ29lCpQz9aHU51ZK+e2zijet61eZNnOwJLXmVDv
 TfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=h694koGDdQxa+/2oyEqNFfimpjwjoyM7WEMkeevO9NEprBfn2owMF1RSL5b5SAit/l
 0OteSB0/NqmlJnzd6i68rCaBJ3Yjud6PuFXvQltBGA1LtB/4V6gk0I5wiqwsxLMwSD8a
 cLUIFI7F2+RrnJSxMCcVEhFylLKmdXjS2D4V2RlqHl4n092BbQNG4ei1Tycev13YsLA2
 Z/7TZ0Ot6N7igObNSbjFI+byCDvkQzkhyN80gk81XbIHf2vhtIlmw9GA6R03ZwpWSatw
 YoqV5mJcSFgSuHJPr1nEqd3rjPti3useqYUuuLwpqPkzwSbvnrmNayJHK1uy7Aj/xHXv
 8V/g==
X-Gm-Message-State: AOAM531t6Z4BULxxbuw3tYysCyvgn29FXJrZJPh8xd6/RpwwF2zdjr4J
 94tEsDx1ECF0NK9UqXHTwNU=
X-Google-Smtp-Source: ABdhPJypSKpYTAj0bMWRRYynzVsdxJu8BhXzkE3TVsWyAD+OO288aVK1qVjH/jTm9r62ZXOk9fwTVg==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr50335591wru.526.1638880461580; 
 Tue, 07 Dec 2021 04:34:21 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/24] drm/vmwgfx: stop using dma_resv_excl_fence
Date: Tue,  7 Dec 2021 13:33:55 +0100
Message-Id: <20211207123411.167006-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
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

