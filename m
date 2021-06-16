Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31D3A94F8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C756E526;
	Wed, 16 Jun 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA396E526
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z12so1569076edc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IVTqokzmJtH8YP62XhkCvu3HVJ/rLNfsAlMIAEY59CE=;
 b=EwEYNY4o/LxWqe7QhW3a60rhBvw/kRELesY+OsHJ+XaBjf0r6WAzYlVTjcdo3Q+M0B
 hlXIM9gJRkjGWtrSWXsIB1Y9niKXfnaCOZUVlw3phEEKG7nQDYXmmmN2Ucu9vqaHWEV7
 tWJ4gJwUSDTwiOoG/dQUHjc4hOFVi7cJ2h9TTcKLtXsUbxKE+zsrWj7tUT6UhK727GP9
 28UoI8wNQKRUSJQQm7gGpOGysujbsiyWzIbMJ3p5hqBn6Q9UK6gdq2tnSP0kBgNjwGRM
 jGN5xHkwvWTZXFhTHC3ye6Skxz67KYEhWjyqNJA1inGuvlzJo5C7CyopuppTDQvFj9ZZ
 skuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVTqokzmJtH8YP62XhkCvu3HVJ/rLNfsAlMIAEY59CE=;
 b=k5nchYcrRZyyLQ0gXrguu972iAcmya2VTzwOVAORWyx8JYvjFtbf7GOh61Ek7pHUHa
 loN7g2i0+rQVg5ovcmY/yrugeTfyx1gOr95n6pOUkDAPjp/ErmjZcFgXoEE59oBSdAGd
 IT/vOhQJFCVj8byuDqxn0HHXqWwjYm92xk4AGWlgrOjj9PpmsstNOSJ82QAT6KToE1P9
 1bya0fLpE+8wifwcM6VRJf9w1lMkUHrZBBaPIdbZtbdKBbSzCLSVOihhW9A8JYdtiKX5
 67/S7WUXRcmveA2meS8wVS2Pxqcnjjwau2pUK4NYwifmaaYxGFJuJ1FcG9ht/4FrQW9d
 xwKg==
X-Gm-Message-State: AOAM533Ev6aCXZ6dbgqCraWB0uBaRbntHSUDcwrpgtJKlBXW+yKarBFR
 9BAd1QVZseOT4LZqcCBx2Rg=
X-Google-Smtp-Source: ABdhPJx4sV239SQRT2vcbJ7VyXdlQJ8tWQ82/GMk1JT2JyYbq5iZo7gKx4+Rw7i+3JlO3ydX9xlE6w==
X-Received: by 2002:a05:6402:1644:: with SMTP id
 s4mr2774807edx.190.1623832024719; 
 Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 7/7] drm/amdgpu: drop CS workaround adding the shared manually
Date: Wed, 16 Jun 2021 10:26:55 +0200
Message-Id: <20210616082655.111001-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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

Drop the workaround adding the shared fence manually in the CS.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 25655414e9c0..af8f5ff5f12c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1273,14 +1273,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		/*
 		 * Work around dma_resv shortcommings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence, but first add the submission as shared fence to make
-		 * sure that shared fences never signal before the exclusive
-		 * one.
+		 * fence.
 		 */
 		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
 				     dma_fence_get(p->fence), 1);
-
-		dma_resv_add_shared_fence(resv, p->fence);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

