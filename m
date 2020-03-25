Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBC191E00
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 01:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D8B6E575;
	Wed, 25 Mar 2020 00:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05936E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 00:26:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so928141wrd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVp8N3Y86PwDON5iNLeFPoqqE59j/nJ6HOnpicwvFYw=;
 b=M2lJBM5jXCRa8jUDi4GhOBvHN+oBdt4s2ZmFsN2bfe9gGeHWWpFRHbW4kiT51Stuas
 rmH+jP8/CF7d3AIcpokP3BHxEWsludVygfGUtUVRFqExKuJyDv6fhaG5UdT4IvOEx113
 EAByh4YJ5lRJ6Lv4emlLQVj1AlYVDJpNRY/errgokNUYBZkSFVH3/PQ9REZDkWKUYWVd
 vIFO5Gs4zOnSaUAwmAgTnAXTBMyi7teLu63VOTqJYqDFfO5LLpCMU3vLo+70oxJBQhSu
 NZMZ51kx+NHwrO4l7zBraZ2kVp+3MBSNxveIA7mNTZxSm15659fyMO6xKthu0GwBtfst
 d7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eVp8N3Y86PwDON5iNLeFPoqqE59j/nJ6HOnpicwvFYw=;
 b=eHluw4LFBfqj1uUYxsxiPpeTG05ou7q+5NjrsCphYrebR2esHzsRvHLgA59ci5qYHe
 TwNmaN8Se2FUymWcgHrrgBf96vx48KiKasziamseRwv/SOf4cAfv5uY+f4ny+wWviYwE
 DB60TiAPM3OuLcYhqtOps9OKaSRcI1yfAI2g197l8IMl4i1yRsJWgEKR+IuhbiPvuCcu
 3yoGkSCV8PiByLW1TEaeHYooCPmsn3IOxZBQbOBAgzENegrN/sdwnB0JuHONIkp1FwT7
 Dmk4vwMlxnh0xGEtdSXgx7C1FlZHblelSKl4aWHFmOziYX7zmX9Ff+A/4vPUFjzDd3MB
 XnsA==
X-Gm-Message-State: ANhLgQ0R6dnR45DMph8ttd4Qgit4Z4K+yAJ1VMfwV9fN2yZUlprim09A
 DkyySPxtJaxf+XX8zBYEzxIsyNLoF+Q=
X-Google-Smtp-Source: ADFU+vsZuyZ5KWwQe4jpb52eZTIcVwNW1BVAGpHEurN9VbHvUxjLVIJ+Z50icebM8V6CqFbSG17YgQ==
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr308806wrp.33.1585096001205;
 Tue, 24 Mar 2020 17:26:41 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id a64sm6632935wmh.39.2020.03.24.17.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 17:26:40 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/radeon: fix scatter-gather mapping with user pages
Date: Wed, 25 Mar 2020 00:24:50 +0000
Message-Id: <20200325002450.5240-4-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325002450.5240-1-bigbeeshane@gmail.com>
References: <20200325002450.5240-1-bigbeeshane@gmail.com>
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
Cc: airlied@linux.ie, bigbeeshane@gmail.com, alexander.deucher@amd.com,
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
