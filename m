Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639E191DFF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 01:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434CA6E0D6;
	Wed, 25 Mar 2020 00:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF889CE0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 00:26:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 65so914253wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLkRr9j1+t7kkMw2Ku/7MnvEj1jxos3vANcsR2A+POs=;
 b=YrGiNBcuJdtkDHs4rWXWpv8sC2e/Q/G1soldicS/EjDV5GkSKJj2LEZ4YCiug0Fjmq
 mVsp+1cTaBsCep9UjBwYh3AK9sKVCoMgD5yFvJ2TlKKe3+dtEFU70XX/DfnWgYzIga3Z
 O/aZLpBo25EaiTgeM2F1oenMBoiw/U2S+MFtmftELfGqkLLmsUdR8AAMUJSAZEU4G30d
 RPwka+YTBAXzfP3j5pOfFBYxNc9muaO7WlnMaU4cLVPoT3g/b/ktnPOdpzT77x7i8zR0
 khJCW8xRKrAK/tRrTbUkN2uKLjRCpU/jPnsG4+Q9uTfWZEwHyJXFVAdAG7NE41MJy9Ew
 k+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLkRr9j1+t7kkMw2Ku/7MnvEj1jxos3vANcsR2A+POs=;
 b=jM81i+i/u+7wWvLZKdzSUBC83m+VGWTfrlZgXpyuFPH4BT5in4rwvpHkrNaT5gdBOO
 LPtkseDFvmOXEqcFKr5fsTaAauDpQW117Id9ii49viCH5kpZyeePa45zykvmlKE3dnlj
 8UVJjs155oq7j/0t67EuDu2icNrXu4mB33AL5mQ5cpQNpYwHM6XvDXijDK81zSzp/inz
 jd/WGgvSFD7paW5Ya4J3kX0Uqn9fdQJWtLZnJA9Sf0Bm2uUP84zLBuHRzdDhM+8N+NrV
 Tms26O3u5JoW+KeJZtj1EBs8knDLt4rLOkrW7GiAxwUd/FPe6e/SRUwRp/oTzGD9h+lP
 HFZw==
X-Gm-Message-State: ANhLgQ1Pvzi1iKhn39DLLE8fMmzOkMv6l43xnGHo2bYyXHBt6mhXwL7z
 jAan6ZWZ4cOACe1e7YBydddPAReihfw=
X-Google-Smtp-Source: ADFU+vswHzUwDVSrQrOdfN25R1R0yJelZxSb5p5MD5TAk06fEDUDm+iZWFkR6ci34D9tqJX2d8awbA==
X-Received: by 2002:a5d:4290:: with SMTP id k16mr327868wrq.406.1585095999067; 
 Tue, 24 Mar 2020 17:26:39 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id a64sm6632935wmh.39.2020.03.24.17.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 17:26:38 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/amdgpu: fix scatter-gather mapping with user pages
Date: Wed, 25 Mar 2020 00:24:49 +0000
Message-Id: <20200325002450.5240-3-bigbeeshane@gmail.com>
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
