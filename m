Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F01923B5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 10:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AD66E5D3;
	Wed, 25 Mar 2020 09:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223B6E5D2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:08:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w25so1603645wmi.0;
 Wed, 25 Mar 2020 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLkRr9j1+t7kkMw2Ku/7MnvEj1jxos3vANcsR2A+POs=;
 b=tItHUlXC1+dfULZj1LhOU5NDx3F9h/M/Ae+O3kMnVbgtAsdvT2ghQImi0NoPV8ldYI
 8GaZtaL4VnqLR4oMrFkvItwsYw7cJKeIrKcyQfKWK6tf2RhjiYrreUBRr/2fCdDbjXKT
 3BYngDUrgZV4/43KdBii77JRucqGFUjtik85FPE67ce5c6hnB898jDOBVZfnKm5pxiAH
 hk+QX8F83j54OcYIqCop2qgnskqWTGYNi2hm6xTOXihX/NMSg9wjpPY9qnW8jBmJSaST
 XcZFNCTzLHphjahSUA5EBejR9NCMy7C6mOoclZxiGkRX/9smMlqy/43m2uR0gW3JzfDL
 82xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLkRr9j1+t7kkMw2Ku/7MnvEj1jxos3vANcsR2A+POs=;
 b=S4asPf6NKhSdaLAF/UROH16Hn35bJk1D51Wx0LXyVfIy+vsQYRgcZijTtEeyhQW2gs
 Pqu13HF5yLB490ToBbod7+khMOWyt0JdjIpWNNBnOFUEwb05OdqAVQ2BcvG/02Wq4cGD
 DapcxUKS8EOjOzluNELjs7mRI0qaUnBp/Zlmea8ADj/32Y5F2ClKZ1Kl9/uqlEqmJSiu
 U4bAn6fVnmPKs7rg/EzVGGBuln8zjprkC/ptYJxbIWIR9AUbi5NIgq60WLOk8+VAl+r0
 ubKsANKvZN9c1om+d9M6Y+fD9gYsZnNsdI8yrcOObEPPZ6tc6G6lR3yNm5OBr3jYOtdt
 Jgxg==
X-Gm-Message-State: ANhLgQ03kqaOYRq/CespbBhGJU/UfhXrXIEFrJdCVjKbLKQSZIbVttxZ
 3hGONnFgiVIgfs4Mm6Pk6pAnWO+yh8I=
X-Google-Smtp-Source: ADFU+vtCdXyuM3ib6Qu85alvpqv8QAZxNBaQDg0ws8lu5V1fIrbVncSd7PIi8RVD8WbB/nlDK0aGUg==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr2380279wma.36.1585127321046;
 Wed, 25 Mar 2020 02:08:41 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id 127sm8565048wmd.38.2020.03.25.02.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 02:08:40 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/amdgpu: fix scatter-gather mapping with user pages
Date: Wed, 25 Mar 2020 09:07:40 +0000
Message-Id: <20200325090741.21957-3-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325090741.21957-1-bigbeeshane@gmail.com>
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, bigbeeshane@gmail.com,
 amd-gfx-request@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calls to dma_map_sg may return segments / entries than requested
if they fall on page bounderies. The old implementation did not
support this use case.

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dee446278417..c6e9885c071f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -974,7 +974,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	/* Map SG to device */
 	r = -ENOMEM;
 	nents = dma_map_sg(adev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
-	if (nents != ttm->sg->nents)
+	if (nents == 0)
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
