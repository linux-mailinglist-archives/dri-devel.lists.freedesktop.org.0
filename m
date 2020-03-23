Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E27190249
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DA26E436;
	Mon, 23 Mar 2020 23:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098916E436
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:53:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so19407208wrd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=OrNt0jNV0nO0/T5cG52NdhxmG0BF/mqDBXSkeI4Y9GSP6s0Az2weo65uP2dU4aFVnI
 MELHr3K0toR5r7NBUBzvaT5/mV+W88gwXDhgq7cYsA6ANIhGCs1DxDU+GsnZSrnubUGi
 mSmhvDFnEvobg4A7kEe17fnRHMYWvSAqtVn8D22XSnzMvcNBhzE3haHSjfVkIe4tkvZf
 O92ZKMd5mpADqav0esN8j2VV+1BUaOZRyQ7hnhu0mmJTS1WwietMRmDyCyO3sR4HEL8i
 D8FVZ1ahsaeIlCfBwdqacmTWA7yKwCKcjyKEdad7lBwujkiEPWBjBagE1Ys4R4RqL8EK
 BupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=iV7ZxUlwwKGX+RVyi0breJqxyH2Pviw4hAQMICSEhEYKYu+XqdQgQ3UrC/wq9RIhjc
 92frvLxexKozSkQeGH1Rl738hUrNpUzouekDam7bvSndsqVC0J5XLnz+IzxNS9FZ/Sv0
 ULTpvwv/tnAKxOfx54/X5Qd752FTJ9e0T1QokhX2zpCcGNTccwsr3hTXcdxTlV5BIIH/
 J/VY0h0O9WmbOrG5nrx8/7daS6t1oRB/yN8XC37q0Nnn9QEUXp9UJ9KqhhtPMPDoOQtz
 QmgqVgBANo6HAKdWG8NxDjD9FdtNLisf8d+2cU3h4M4EScBVobgURFLgsr3CcDpShn49
 GJOQ==
X-Gm-Message-State: ANhLgQ1GSfCHoIzK+9Gx6wRqX8v/e+djJQLoyR4PEWgiFjbVZZLqUlYj
 oIQ71I5BoyvhkSvW/X8CwlLrAs/S+mo=
X-Google-Smtp-Source: ADFU+vvy+v3EBYIujK07sKnecpeNaHR9IZ4aWXxEXvh5/LA2cfiE656Mwi/KzcjlPMD09GBM+9S9Vg==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr15287019wrp.112.1585007580393; 
 Mon, 23 Mar 2020 16:53:00 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id t1sm26729287wrq.36.2020.03.23.16.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:52:59 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/amdgpu: fix scatter-gather mapping with user pages
Date: Mon, 23 Mar 2020 23:51:37 +0000
Message-Id: <20200323235138.207442-3-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323235138.207442-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
 <20200323235138.207442-1-bigbeeshane@gmail.com>
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
