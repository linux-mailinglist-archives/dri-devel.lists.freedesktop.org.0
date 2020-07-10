Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DB21B062
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8326EB78;
	Fri, 10 Jul 2020 07:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFE86EB78;
 Fri, 10 Jul 2020 07:42:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so4857320wrs.11;
 Fri, 10 Jul 2020 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESrGnYPx0hSksCrKaceiqnAKbnGzRGDWTCCV2K4s+Pg=;
 b=VQHJq+34R+TMtTGTYpPadh6I9+8mqXycEMpwSNSX0RqfbFcY5XwNqat/i0zTR1XEcT
 zLgyGAlMHvRBXOiQZjlmAon1yHt4p5kTImnhPTHZLyNNAnq6HK7/saTDQYqxNr57Xv8n
 geUVFM79g8XS5JYAKww+STAoGRqVk9SkpcdgHE4XITI9MeHyEu//HToKb0sTby8MCG/E
 1qfsMLKY1o3uRo+Nk5Un1Z9KxQgCwOZUnKJMWH4cw1nBJ0IDKITE7uKb5ZSyLMOde9gM
 On4Y3AG2wYy45+BYwaSUm/YEuF3IBrXy4B1TvFaEnlGpcrmtKOHBX6mT/TKiWUpHPO56
 XSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESrGnYPx0hSksCrKaceiqnAKbnGzRGDWTCCV2K4s+Pg=;
 b=UXym769wwFllu5Ag0xtdhVM6EHIcE70f5tTG5bHldLbcEdpjdAbP/+q22sXVmsbb9P
 YtL03p4sn4VY9d7WvlCk1tC+uG5stfjkPqyR0XkQDUKeIo6ElJg/XRNHCSIEMIgdMNxb
 suxgky/JXCpcngrS9nsrM+o+EpDqrSHdPfzVqXAgIBAHQly1MzRNWGuf+u7SZ98d6Wk2
 fsKaOWV1Dp8uYXDe2kNBIlm8L/YMVMsH9RZJUa3xGK6ZiTkqveErn3pD/L0F/O8lPZcx
 3ciNsTmvGVXKeonsuaN7bNBQSfcn9bmY62wYDHNVcl2Yn8DAY4IOF7PYNDiPL1VU6wCd
 1d0g==
X-Gm-Message-State: AOAM532lbG+l+nVb2MByhRbWDLK1VJiw32rgHkoFJFBwJ/eWDe8Ouyqj
 6xPkc37l9h1pskgCiL5RsM4=
X-Google-Smtp-Source: ABdhPJz/m7lvGEi/JaCh7Zc/xkKPZnrjRbmfEYFb02fxjeTKUgeShYF/9yDasVnsu01jy5FdbQ98GA==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr64152576wrs.306.1594366934055; 
 Fri, 10 Jul 2020 00:42:14 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id p17sm7951375wma.47.2020.07.10.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 00:42:13 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/etnaviv: show loadavg in debugfs
Date: Fri, 10 Jul 2020 09:41:26 +0200
Message-Id: <20200710074143.306787-4-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710074143.306787-1-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Might be helpful to see the loadavg in debugfs.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 1f0eb7e00657..82fe4aafed57 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -884,7 +884,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 {
 	struct dma_debug debug;
 	u32 dma_lo, dma_hi, axi, idle;
-	int ret;
+	int ret, i;
 
 	seq_printf(m, "%s Status:\n", dev_name(gpu->dev));
 
@@ -1002,6 +1002,16 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
