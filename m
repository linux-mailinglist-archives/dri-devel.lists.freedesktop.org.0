Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92E1923B4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 10:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967F26E5D2;
	Wed, 25 Mar 2020 09:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF66E5D2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:08:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so1948844wrd.0;
 Wed, 25 Mar 2020 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVp8N3Y86PwDON5iNLeFPoqqE59j/nJ6HOnpicwvFYw=;
 b=b7M9444MjNBuwc+NdupdV9NJBwXQmDDARdLnAWQRPZCwEKEdoKmEkTMN6rTzkSq/Ev
 lA0tnWa51Jfc+72oCbnIyrp2Miipc74i4YZijLG7bRgYce7Wgf9kcUy0T96vgZvj8Y5x
 Pt+MKZX/HcMv27OjVADXuMnSaFlbxTxNv6fXGNarX2vX+DWos9GPnOn8U3QiTgXb43k8
 xZrRgAAunCi137t8E7cQOYrtgEI1EIxjkXRdQ18JbkhqQHhZtik6nWSHP/JYh6GVoHRX
 0TlR+cdjgoWhrD7oZ2sdk0fIZzoP72LORQ0OO2jBSBixFazDVHI59oLu3HQP1yk1z9OA
 nc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eVp8N3Y86PwDON5iNLeFPoqqE59j/nJ6HOnpicwvFYw=;
 b=AKPHXr8xfmDZp6u0QZni59WkuCfqfBHwWb+j1kCyc6N4fqvWqkUfooLoNTxUGsxBCz
 w5i+r0LFqpS+Ruwj6SVJBXKY3iLZDYoAyjOfGWpp7kw2nJ5QW/Zenl8zzIOW/+QMRCqV
 l5m+7oKwFJyXPnE6JOKYqbiFy/PD0sX86VMc/UUmakyE+PNLb2X6my2csHz9WgLU+Zig
 pDZjq6ENPWUuG/K7pABc3gUp6yl8FMCEOTq5yAb1+vw5l1mhfa6D3XhcekrTfJYPkd3g
 jEH++9WsJ+2LWT6lWXBPtmZs6LxOCZr+22xFkfCoHwVdL5vuAgDWW3aA/8Lnm9ekjPpK
 5bbg==
X-Gm-Message-State: ANhLgQ0/deNkkIpLtIbVOBVsA2hKwoVHikN7v6Eg2F8vHiezEZtf+6Fw
 /K6BXngtjb6RrHCC34JCZh27YLyWSNM=
X-Google-Smtp-Source: ADFU+vucVoFXg3vQHs7A87Ct1z694QEmqZDx6c7UlwYfcSJoaz4mdvAPRiSLD0uCfXOmBA7SN/BmpQ==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr2183980wrm.279.1585127323079; 
 Wed, 25 Mar 2020 02:08:43 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id 127sm8565048wmd.38.2020.03.25.02.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 02:08:42 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user pages
Date: Wed, 25 Mar 2020 09:07:41 +0000
Message-Id: <20200325090741.21957-4-bigbeeshane@gmail.com>
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
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3b92311d30b9..b3380ffab4c2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -528,7 +528,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 
 	r = -ENOMEM;
 	nents = dma_map_sg(rdev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
-	if (nents != ttm->sg->nents)
+	if (nents == 0)
 		goto release_sg;
 
 	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
