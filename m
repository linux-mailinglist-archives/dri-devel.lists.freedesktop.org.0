Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD35ABD65
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 08:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B8210E986;
	Sat,  3 Sep 2022 06:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A610E987
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 06:07:04 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id v4so3682796pgi.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 23:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Jh5euOd49DiBX3ll51Mj4npTcESoxh+5BIjuVvm+pHg=;
 b=G8QQcv1neYnCe6yYtYRzhWoUIDjvNs/L4fTPIWngkNvcePXJOLIDfLZYUD4mwLjlTu
 EBv9LPjaHc9WiVyAtJ3tO8DoyKsrKWmtyY0U9ZqP4MRI0blNUzQR9K7eiXVwPqLbZ7q6
 eVdyyfH1LzgRLOnAjXuD0jJEN8y+TLJRMa5Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Jh5euOd49DiBX3ll51Mj4npTcESoxh+5BIjuVvm+pHg=;
 b=vpBRaMcVRFooyJ6KQvNFubmBji1k6xX/YL5CnWXz65+xS6gXlxpfG+6gn5fvVBKoBU
 ZOrRpVDy9N5z/eesDV6wpSPf+zufF939ia9j6c/nH3Gu1xIMkGVcYamPDPufaLGHxay4
 DoyW3OYtqmD9e6kRv4s3uYPFz0tIrdq0/9T0vs4WIb4tLdtgzIzMTG0JQZ7tmjlT+6An
 U+Z9JA1IiEdsFpBKrU1JhwTlBKTdaTZW8Wyfsxm8F2/0wZiNnK7E/ONAkBQjsu9rC5Ce
 Kt0jHXhRcNrBN8FdVRS0zZ3fgn7DExPOmUiPmWU0zrA3N6VSKU8p0YLzSh/YS6EM74eR
 9tpQ==
X-Gm-Message-State: ACgBeo0/MU7E/cXcnA/dlFqPTxE0Ad6iLbbafwgMflwN3AJ6c+st5d3j
 YuY0Jj+MSYZWS9pzbz8uosXswQ==
X-Google-Smtp-Source: AA6agR5OUADLlGyGEdc2bn3zkwVekzWjphf+pMP3K7tpMZyJoZMigB6gEhgMVrkoUGwwO/VRQDJe6g==
X-Received: by 2002:a63:8749:0:b0:430:83ed:ddfb with SMTP id
 i70-20020a638749000000b0043083edddfbmr8581846pge.346.1662185223762; 
 Fri, 02 Sep 2022 23:07:03 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 v28-20020aa799dc000000b00537ab89c66csm3048793pfi.143.2022.09.02.23.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 23:07:03 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/etnaviv: fix power register offset on GC300
Date: Fri,  2 Sep 2022 23:05:58 -0700
Message-Id: <20220903060558.55167-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220903060558.55167-1-doug@schmorgal.com>
References: <20220903060558.55167-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Sep 2022 06:10:40 +0000
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older GC300 revisions have their power registers at an offset of 0x200
rather than 0x100.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..b375612df862 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -10,6 +10,8 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
+#include "common.xml.h"
+#include "state_hi.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -149,14 +151,24 @@ struct etnaviv_gpu {
 	unsigned long base_rate_shader;
 };
 
+static inline u32 gpu_fix_reg_address(struct etnaviv_gpu *gpu, u32 reg)
+{
+	/* Power registers in GC300 < 2.0 are offset by 0x100 */
+	if (reg >= VIVS_PM_POWER_CONTROLS && reg <= VIVS_PM_PULSE_EATER &&
+	    gpu->identity.model == chipModel_GC300 &&
+	    gpu->identity.revision < 0x2000)
+		reg += 0x100;
+	return reg;
+}
+
 static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
 {
-	writel(data, gpu->mmio + reg);
+	writel(data, gpu->mmio + gpu_fix_reg_address(gpu, reg));
 }
 
 static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 {
-	return readl(gpu->mmio + reg);
+	return readl(gpu->mmio + gpu_fix_reg_address(gpu, reg));
 }
 
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
-- 
2.25.1

