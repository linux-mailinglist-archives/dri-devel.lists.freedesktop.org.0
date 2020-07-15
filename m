Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F42214D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 21:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940886EBFE;
	Wed, 15 Jul 2020 19:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211389CAC;
 Wed, 15 Jul 2020 19:06:55 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id gc15so2225288pjb.0;
 Wed, 15 Jul 2020 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdOyt4R9Z57zhmCtsEfttpqmFzjBydXI6S7D/BNVn9o=;
 b=e73JoRrRYxGu62bl5KoSMZHLBcuQMjV+5+TqneAGMDvDQTH7fvHFQjdep471elc40r
 KvBNYigMGwr18RELuTuShGU/xAut09ARiqnzPDWaj2vMtsdLifL2ZCnYKuSkXPIqEV92
 Ms9uzBeRmeocYNunLPBTKFEDN2ce/cgUrH/z4H2luYDl556tpE4fcTL7QhQj2m+wUm+D
 PXWsycKlNvFdNmaoz0pCSiYyl0vvg/4WIQQL1XI2726MpDBgeAIFGKe3ouhJsMX7FPzy
 mwB7N0slfwSDWtt3tLY/bb5UX7n2yZwiAi7gM6FGg6YfMcOCi1cgWf3Az916kmnx/0mN
 Jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdOyt4R9Z57zhmCtsEfttpqmFzjBydXI6S7D/BNVn9o=;
 b=H5S5apODy8ZAX+TBW+1W3ucfAl0CZDSGoPJtdv5oikXyRZHGqbpsbYM4A1hLtg0ZjJ
 LiJaXW+FeU8VpzVQ/tdvSWwasxt/2vEa3g/yZNiAweQZgSVYDzrx5EMyFAxrYItx7Ti7
 4NcF9SAK9VVCVpFgcFGiYZPEhjBmI0ctEI6DK0mb21swHqRrKrWryqkQr3nrhDk92iBO
 e12qGDGf1DFQJCj4oSqWXNcP4zSnAwLSbYbMt93PGOHa8lbhqm1B8o7eypOsahvTJdxX
 E+HAFPXyfeaOYMiRS4kgk4cd7vwqnmrTNP8/qsW+2v5dBKJ3qqEKCrzgHOmFLgvCfBwV
 u+aQ==
X-Gm-Message-State: AOAM530z6iZ1y19yPp+kzxQ1finKNK4HGwOqpmeUjBKye+XlFXMl6kFN
 PhlACCR65Hx4H8mfjgHcWcwSiBfjRS0=
X-Google-Smtp-Source: ABdhPJxkJHXkw9qYWYAXzFYPSzZ3C8v4575JyuEP2Ms4l7Azc1ObNhfpBI+OUK/nzsaigQEU2g8Cyg==
X-Received: by 2002:a17:90a:12c7:: with SMTP id
 b7mr1129885pjg.137.1594840014855; 
 Wed, 15 Jul 2020 12:06:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id z25sm2757161pfg.140.2020.07.15.12.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 12:06:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
Date: Wed, 15 Jul 2020 12:07:30 -0700
Message-Id: <20200715190732.3116556-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If there is no interconnect-names, but there is an interconnects
property, then of_icc_get(dev, "gfx-mem"); would return an error
rather than NULL.

Also, if there is no interconnect-names property, there will never
be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
instead of -ENODATA.  Just don't bother trying in this case.

v2: explicity check for interconnect-names property

Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
Fixes: 00bb9243d346 ("drm/msm/gpu: add support for ocmem interconnect path")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0527e85184e1..e23641a5ec84 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1003,22 +1003,23 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
-		/*
-		 * Keep compatbility with device trees that don't have an
-		 * interconnect-names property.
-		 */
+	/*
+	 * The legacy case, before "interconnect-names", only has a
+	 * single interconnect path which is equivalent to "gfx-mem"
+	 */
+	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
 		gpu->icc_path = of_icc_get(dev, NULL);
+	} else {
+		gpu->icc_path = of_icc_get(dev, "gfx-mem");
+		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
 	}
+
 	if (IS_ERR(gpu->icc_path)) {
 		ret = PTR_ERR(gpu->icc_path);
 		gpu->icc_path = NULL;
 		return ret;
 	}
 
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
 	if (IS_ERR(gpu->ocmem_icc_path)) {
 		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
@@ -1026,6 +1027,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		if (ret != -ENODATA)
 			return ret;
 	}
+
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
