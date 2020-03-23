Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC118FFDD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 21:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2EB6E398;
	Mon, 23 Mar 2020 20:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1A36E398
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 20:52:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d5so6528226wrn.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=Jp5uE79dXSwdX2rqXPpBOUah4Q9qQqo16gxs5NEwfeukOf/OJfymOti1KP9oT6BK7J
 wgZg6NDrRI3Z6U260QlVBnqNHDpaqO7Ij5C76SJV2b/f95SDZ7SokO+SoeNEUPyos3cV
 iKN/7ofxHrWlUZByeaRyFMAjnjVzGrY79qDjIp/2pla5fnqlU5gs5K4utrVYjZape62F
 iIxq1EpCGmBgp9oSIVrHsIoh+sOhu978FhVUAGJed5HvJLxsoCvo7D01YKkEN1oelaJS
 QwTiCw5sNiSyq+qTNz24PLeWgRjW2VfI+vdGnoE4nv0uMXVv0YDTUx74FU4YlrkSJc8N
 acRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=FTyJwQWlWZIsx98SfKmfpd6JPQFRA2k229FJqn/7Dw9PEtQtNWxIumZugoaW7U4Lsm
 Avn9CyjsuksW1PPHqZB40JSXlRr5SIJnWVduzBUsIENaLAMndEBJJoICXJ4O/yV/sDyn
 LrthIRp3EmD3c4mmrWZ1yGse0TN/0f7i3zaA6LMfxX5qFUr0/HZeWIKVR15wvRs+buYU
 bW7tKBbvY1DpQVdz+oFOtcU9qhHopmUGIvwF0xEIzhm+UYSV3b+ojeioAAGROZ1+r/ks
 r3srm6TibXRsq56YBaAkR1Oymbz5NXzRhsLvaBIPHLRaLSbRchX5OOMwwjNQkT6P0W9O
 kEvA==
X-Gm-Message-State: ANhLgQ1maBa4a0VVjBTjxhU0XjGJcqysGGWL9U8JgxzGTnjXtOtZN6Xc
 kc4O2GcW0uI/iFJ1v3tz9X30bn/VwtI=
X-Google-Smtp-Source: ADFU+vtufpm0NgnzW6wssexEjNo2Uplj2UNlmwsea83pCQC6jTr60aHtVfWBldj8DH0wEgHGAqBXLg==
X-Received: by 2002:adf:afd4:: with SMTP id y20mr34102455wrd.57.1584996721261; 
 Mon, 23 Mar 2020 13:52:01 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id f23sm1133315wmf.1.2020.03.23.13.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 13:52:00 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix scatter-gather mapping with user pages
Date: Mon, 23 Mar 2020 20:51:37 +0000
Message-Id: <20200323205137.136530-3-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323205137.136530-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
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
Cc: bigbeeshane@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calls to dma_map_sg may return segments / entries than requested
if they fall on page bounderies. The old implementation did not
support this use case.

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dee446278417..d07f143b50c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -974,12 +974,13 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	/* Map SG to device */
 	r = -ENOMEM;
 	nents = dma_map_sg(adev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
-	if (nents != ttm->sg->nents)
+	if (nents == 0)
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-					 gtt->ttm.dma_address, ttm->num_pages);
+	drm_prime_dma_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+					gtt->ttm.dma_address, ttm->num_pages,
+					nents);
 
 	return 0;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
