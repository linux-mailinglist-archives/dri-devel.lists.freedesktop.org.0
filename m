Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BA552BB2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF1A11265F;
	Tue, 21 Jun 2022 07:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4FF11252F;
 Tue, 21 Jun 2022 07:21:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n20so18751779ejz.10;
 Tue, 21 Jun 2022 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujXg7tbiFKFG9Xv1lpmXMbIqHNMRftScv0fuP2to1p4=;
 b=mR7SSvzxKBsVGWmW7rKMKm11PMO2JzWQjOvgSCKOXzUg76jvtygFg5Ko/iBLe/V5YM
 qEnz0PtDiVTbLZx2GOQDDGhJuxgco2xipCkiF1Snhg/1/sGCA9d8964K1JqVJG1d5gyi
 XBubX7jmbgcsPTuJ+Ll442ofRMaJoAwFI5nyCTm1Cw+XnTgZms5IVuJA/brnu1jG5XyA
 XvKRmT9CSL/9+Xziz1C5p63hIIuZSayprT+g1+uLzd+TJrhW30vVobsB1qZJnYf6XFIN
 c9E2RkMqxJwoROp9op4RIbSwNQfOZ47tSX74h3knzx2GIQNdn24NvgRGIFzWqP2oAjE9
 fXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujXg7tbiFKFG9Xv1lpmXMbIqHNMRftScv0fuP2to1p4=;
 b=fbD7pWMo8zb6pFLKnNsGkVQuzHr9SREoMQhPXkckh6oOvgnx0iIw3FDh8rjP1Fb+9a
 +gWHUh85EZeMc4PSj+yTq0bNFt98nHlXDNyEHbJY06yLU/FF2Sk+Fqc7yPEW/dQI1uCG
 KEzQyqpWZKatg1Z8W8S5VBOP5JbIIn0Sj+J8c8Fu2iypluLz9qmwMC2au6jucSkJndM/
 ZoNWyEWulRJou6sVenhYAQiz6DC75XsntV9XTrHhrUcqATKcD8QdSK0bfqWYMqUCVQzh
 fMrREhNkS7tP2u2RvEv+DNupQP9cUStQHGSzEI1J761LyqJ8et2DwxsXfN3Dp8GknCY7
 x9Sg==
X-Gm-Message-State: AJIora94WzzmBtWFEnLI5ghcQW7ucySdbE9OEGbeRD3EnJs5j2DX3pHt
 HQWHO6rb9fTCJzIn+JwRxYw=
X-Google-Smtp-Source: AGRyM1vCyhurjoTwHqtO0qcT9zB5pBmZ/2iCYJki53eJ3YCFskGqaVpFKRg+a2h4X0orIH6PALuMag==
X-Received: by 2002:a17:907:7daa:b0:720:b3e1:12b7 with SMTP id
 oz42-20020a1709077daa00b00720b3e112b7mr14304301ejc.11.1655796079661; 
 Tue, 21 Jun 2022 00:21:19 -0700 (PDT)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b00722e771007fsm50711ejo.37.2022.06.21.00.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:21:19 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/etnaviv: show loadavg in debugfs
Date: Tue, 21 Jun 2022 09:20:49 +0200
Message-Id: <20220621072050.76229-4-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621072050.76229-1-christian.gmeiner@gmail.com>
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Might be helpful to see the loadavg in debugfs.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 202002ae75ee..113faff9b02e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -926,7 +926,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 {
 	struct dma_debug debug;
 	u32 dma_lo, dma_hi, axi, idle;
-	int ret;
+	int ret, i;
 
 	seq_printf(m, "%s Status:\n", dev_name(gpu->dev));
 
@@ -1044,6 +1044,16 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 	if (idle & VIVS_HI_IDLE_STATE_AXI_LP)
 		seq_puts(m, "\t AXI low power mode\n");
 
+	seq_printf(m, "\tload:\n");
+	spin_lock_bh(&gpu->loadavg_spinlock);
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
+		seq_printf(m, "\t %s: %u%%\n",
+				  etna_idle_module_names[i].name,
+				  gpu->loadavg_percentage[i]);
+
+	spin_unlock_bh(&gpu->loadavg_spinlock);
+
 	if (gpu->identity.features & chipFeatures_DEBUG_MODE) {
 		u32 read0 = gpu_read(gpu, VIVS_MC_DEBUG_READ0);
 		u32 read1 = gpu_read(gpu, VIVS_MC_DEBUG_READ1);
-- 
2.36.1

