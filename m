Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9E524C8E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 14:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE9910E681;
	Thu, 12 May 2022 12:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0F10E5DF;
 Thu, 12 May 2022 12:20:06 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 204so4647361pfx.3;
 Thu, 12 May 2022 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gorQKMV8vjkGqwI8nCYg+SRESNs1085GlQg2z0ABeuo=;
 b=PCIAmCovw7OM0hTE2W4qOGNoxgxbBpg8KbeHu/5PSSdoArfiqGcBFNMc5XU5LAmjWl
 qLIwnwagkjm97pU8rRUANECE9AWjEczeWiXwd/Rz0Tf3/VBSH/XCoEDJ3IwW/QKn7ic5
 H3kqIR/LdW7GiKoqf42m6g4CZjkjoznsTNeAmqvmG2ii4RPHiOIGQyC8fBl80KFMX/5w
 3QQIscHoSk+TavN5oSPvjcQGUZBdku+hfWxg7zMq6KvwLXbS/3NDvs8fMCjXk/YFHkXy
 mDtEBzYVZjjmTd2kjXPOSixISXUdVkMvCpmohKU/wsipluSHe5eVaUzCL1t3krsloryb
 33+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gorQKMV8vjkGqwI8nCYg+SRESNs1085GlQg2z0ABeuo=;
 b=nwM923m+Ks60XiyGYi5XRDyuXnDR+V8xgxaimVACv6lrFMaFs6xnS98te11WzlzVh2
 7uORsNfdLO04WW5QuIoMbsdWICNZuWEp8AaKpA1W5cSJG/juyZYVVxQ606Su++dArY0a
 7tsqbJJMZx2JSPUsxgSV7LVAE11d8Mst//70sNIgr+jAf0GXI4Bo2f3v812zGW17AU1p
 wi4rRIWWk6njjt0uyrG7/e1Mw7U0k8T6K0rK0aXbyfahMUy3wsz+ZyfNjkRU+SwtOWT3
 DSYDnfOc7LwmKp/SU0AMbvfduGOnbY6j4lRjibagGLrxqOEWHVzsysJqKB0lkV/btQRD
 SZEw==
X-Gm-Message-State: AOAM532VfGCDFQtlsKz8LtVvO6JW2idVPZ8v62sqd0a4UlkurUHbrX27
 +1isgk9002smDM8o/CMmzqY=
X-Google-Smtp-Source: ABdhPJxcj5dr0kJUFfqBEgzEoTIC5s88xMRWYL6CzqRLX2g+WGsAVhfrdfc0KIlhh12QckmcT6X/pg==
X-Received: by 2002:a63:81c6:0:b0:3ab:6167:74b5 with SMTP id
 t189-20020a6381c6000000b003ab616774b5mr24640684pgd.527.1652358006556; 
 Thu, 12 May 2022 05:20:06 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 i16-20020a6561b0000000b003c62fa02f08sm1778477pgv.43.2022.05.12.05.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:20:06 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
Date: Thu, 12 May 2022 16:19:50 +0400
Message-Id: <20220512121955.56937-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.

a6xx_gmu_init() passes the node to of_find_device_by_node()
and of_dma_configure(), of_find_device_by_node() will takes its
reference, of_dma_configure() doesn't need the node after usage.

Add missing of_node_put() to avoid refcount leak.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ccc4fcf7a630..a8f6d73197b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1919,6 +1919,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	BUG_ON(!node);
 
 	ret = a6xx_gmu_init(a6xx_gpu, node);
+	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
-- 
2.25.1

